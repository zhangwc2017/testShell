#!/usr/bin/env bash
fdisk -lu                       #查看磁盘分区
df -lh	                        #查看磁盘空间使用情况
du -sh direcotry/filename       #查看目录/文件的磁盘使用情况(不显示子目录）
du -ah directory/filename       #查看磁盘使用情况（显示子目录）
sudo mount -t ext4 /dev/sdb /D	#mount the hdd (挂载移动硬盘， <1>sudo fdisk -l <2>sudo mount -o rw /dev/sdc /media/disk )
netstat -anpt	                #check the port
cd -                            # go to last directory
unix2dos aaa.txt                # change unix file to dos file format.(\n format to \r\n)
dos2unix aaa.txt
./ , sh , bash                  #执行linux脚本

find / -name "hadooop*"
find . -name '*.*' -mmin -60    #	查看最近60分钟内修改过的文件
find . -name '*.*' -mtime 0     #	查看今天修改过的文件
find ./ -size +100M | wc -l     # 查看大于100M的文件有多少个，可以指定c,k,m,g注意大写。
find . -type f -name "*test*.txt" -print0 | xargs -0 rm -f #xargs接受参数，-0指定输入以null分隔 ，-print0表示输出以null分隔（-print使用换行）

grep aaa ./*.txt
grep "start to createProject" schedulerDMP.log -C 20
grep -5 'SQLExecuteController.java#798' schedulerDMP.log    #找出含有关键词上下5行
grep -v hadoop /etc/passwd      #查询不包含hadoop的行
grep -r ComboPooled *	        #查找当前目录下包含关键词的文件
grep 'h.*p' /etc/passwd         #正则表达(点代表任意一个字符)
grep '^hadoop' /etc/passwd      #正则表达以hadoop开头
grep 'hadoop$' /etc/passwd      #正则表达以hadoop结尾
grep -v 'abc'  ./               #查找不包含关键词的文件

head -10 file                   #输出文件的前10行
tail -10 file                   #输出文件的后10行

chown -hR root /u	            #将 /u 及其子目录下所有文件的属主更改为"root"。
chown root#staff /u	            #和上面类似，但同时也将其属组更改为"staff"。
ln -s source target             #建立软链接

ls -lh                          #查看文件大小(会人文化的显示大小)，也可以用 du -sh fileName
ls -t                           # 按修改日期排序
ls -ah                          #可以查看隐藏文件
wc -l                           #统计行数	wc -m 统计字符数	wc -w 统计单词数

\cp -rf source dst

env | grep CLASSPATH	        #查看环境变量
cat /proc/cpuinfo               #- CPU (i.e. vendor, Mhz, flags like mmx) #查看cpu信息
cat /proc/meminfo               #- 内存信息(i.e. mem used, free, swap size) #查看内存信息

nc -lk 9999                     #开启端口9999作为服务端口不断向该端口发送数据

awk [-F field-separator] 'pattern [action]' input-file(s)
last -n 5 | awk '{print $1}'	#打印出第一列的值
cat /etc/passwd |awk -F '#' '{print $1}'                            #分隔符为#，打印第一列的值
cat sortCate.csv | awk -F '\t' '{print $1","$2/100}' > newfile.csv	#将tab分隔的文件替换为,其中第二列的值除以100，$1,$2字符串拼接
awk 'FNR%2==1{print $1}' sougou.txt > dict.list
#统计一文件中的一列的所有值的total.
history | awk '{print $1}' | awk '{sum+=$1}END{print sum}'
#对某列去重并输出#
awk -F '[ \t]' '!a[$1]++{print $1}' aa.txt
date -d "1464073905025"         #将时间戳转换为普通时间
wget url                        # 下载文件
gunzip *.gz                     # 解压gz文件

useradd spark                   #添加一个用户#
passwd spark                    #根据提示设置密码；
userdel -r spark                #删除一个用户,-r表示把用户及用户的主目录都删除

ssh 192.168.0.11                #ssh命令用于远程登录上Linux主机，不指定用户
ssh root@192.168.0.11           #指定用户
ssh -p 12333 root@216.230.230.114 #指定端口12333

shutdown -h 23#00 'Hey! Go away!' 23#00 分关机

dmesg	查看linux系统日志 dmesg | tail 查看最后１０行
exec $SHELL 重新启动shell，不必关闭窗口

which 通过PATH环境变量到该路径内查找可执行文件
where 查看文件的位置

scp dmlc-core/libdmlc.a root@BDS-TEST-003#/export/App/xgboost/dmlc-core/

mysqldump recommendation version_control -uhive -phive>> vc.sql	#会把表和数据都存到sql中
mysql>source vc.sql

cat /etc/issue # 查看操作系统版本
uname -a # 查看内核/操作系统/CPU信息
cat /proc/cpuinfo # 查看CPU信息

free -m 查看可用内存

hostname -i 查看本机ip, hostname查看本机几名


#linux查看某个命令的用法#
chown --help
man chown
#其他#
# spark-submit -h

curl -d "user=nick&password=12345" http#//www.yahoo.com/login.cgi #-d指定请求参数
curl -X POST -d "user=nick&password=12345" http#//www.yahoo.com/login.cgi #-X指定请求方式
curl –k –get "http#//127.0.0.1#8989/ras/acl/listDatabases/${userName}"
md5sum dis-sdk.jar	            #查看文件md5值
hive -e 'select * from some_Table' | sed 's/[\t]/,/g' > outputfile.txt
hive -e "select regexp_replace(a,'\t+|,+','-'),b,countab,counta,confidenceab,supporta,lift from tmp.zhuxian_prefixt_ab" | awk -F '\t' '{print $1","$2","$3","$4","$5","$6","$7}'>>zhuxian_prefix_ab.csv
secureCRT alt+shift+L           # 开启本地终端

#修改配置文件/etc/ssh/sshd_config，可以改ssh登录端口和禁止root登录。改端口可以防止被端口扫描。
vim /etc/ssh/sshd_config
#找到#Port 22，去掉注释，修改成一个五位的端口
#Port 12333
#找到#PermitRootLogin yes，去掉注释，修改为
#PermitRootLogin no
#重启sshd服务#
service sshd restart

#linux计时程序
#!/bin/bash
start=$(date "+%s")
    #do something
    sleep 2
now=$(date "+%s")
time=$((now-start))
echo "time used:$time seconds"