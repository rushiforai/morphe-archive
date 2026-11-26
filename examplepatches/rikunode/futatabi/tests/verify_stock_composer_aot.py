import sys, zipfile, hashlib, struct
from pathlib import Path
sys.path.insert(0, str(Path("apk-inspection/v04-beta8-login-gate/pydeps").resolve()))
from unicorn import Uc, UC_ARCH_ARM64, UC_MODE_ARM, UC_HOOK_CODE
from unicorn.arm64_const import *
with zipfile.ZipFile(sys.argv[1]) as z: code=z.read("lib/arm64-v8a/libapp.so")
assert hashlib.sha256(code).hexdigest()=="18b05c8e6f53c79e7d869f6d71c4a3a3edec8b6679998b7f7199db4137fbb0bd"
H,S,P=0x11000000,0x12000000,0x13000000
cases=0
for cid in (94,95):
 for scheme,host,board in [("http:","127.0.0.1:18765",b) for b in ("aimoge","animanch","mebuki")]+[("https:","may.2chan.net","b"),("https:","img.2chan.net","b"),("http:","127.0.0.1:18766","aimoge"),("https:","127.0.0.1:18765","aimoge"),("http:","127.0.0.1:18765","aimogex"),("http:","127.0.0.1:18765.evil","aimoge")]:
  u=Uc(UC_ARCH_ARM64,UC_MODE_ARM)
  for a,n in ((0,0xac0000),(H,0x100000),(S,0x10000),(P,0x40000)):u.mem_map(a,n)
  u.mem_write(0,code); objs={}; n=[0]
  def w(a,v):u.mem_write(a,struct.pack("<Q",v))
  def w32(a,v):u.mem_write(a,struct.pack("<I",v))
  def q(a):return struct.unpack("<Q",u.mem_read(a,8))[0]
  def obj(s):
   a=H+0x1000+n[0]*0x100+1;n[0]+=1;objs[a]=s
   w32(a-1,cid<<12);w32(a+7,len(s)*2);u.mem_write(a+15,s.encode("latin1" if cid==94 else "utf-16le"));return a
  sp=S+0x8000;fp=S+0xc000;null=H+1
  arr=H+0x801;bo=obj(board);w32(arr+0xf,obj(scheme));w32(arr+0x17,obj(host));w32(arr+0x1b,bo);w(fp-0xd8,bo)
  for off,s in ((0x18530,"https://"),(0x37db8,"http://"),(0x1038,"/"),(0x21520,".2chan.net/"),(0x21528,"/futaba.php?guid=on")):w(P+off,obj(s))
  for reg,v in ((UC_ARM64_REG_X0,arr),(UC_ARM64_REG_X1,bo),(UC_ARM64_REG_X3,obj(host.split(".")[0])),(UC_ARM64_REG_X15,sp),(UC_ARM64_REG_X27,P),(UC_ARM64_REG_X28,0),(UC_ARM64_REG_X29,fp),(UC_ARM64_REG_X22,null)):u.reg_write(reg,v)
  calls=[]
  def hook(u,a,size,user):
   if a==0x43db90:
    x=objs[q(sp+8)]+objs[q(sp)];calls.append(x);u.reg_write(UC_ARM64_REG_X0,obj(x));u.reg_write(UC_ARM64_REG_PC,u.reg_read(UC_ARM64_REG_X30))
  u.hook_add(UC_HOOK_CODE,hook)
  u.emu_start(0x88d7a8,0x88d7e8,count=5000)
  actual=objs[q(fp-0xd8)]
  local=scheme in ("http:","https:") and host=="127.0.0.1:18765" and board in ("aimoge","animanch","mebuki")
  expected=("http://"+host if local else "https://"+host.split(".")[0]+".2chan.net")+"/"+board+"/futaba.php?guid=on"
  assert actual==expected and len(calls)==4,(scheme,host,board,cid,actual,expected,calls)
  u.reg_write(UC_ARM64_REG_X0,null+0x20);u.emu_start(0x88d820,0x88d828,count=5000)
  assert u.reg_read(UC_ARM64_REG_X1)==q(fp-0xd8)
  assert u.reg_read(UC_ARM64_REG_X2)==null+(0x30 if local else 0x20),(actual,cid)
  cases+=1
print("PASS",cases,"exact URL and forceHttps cases; original four concat calls")
