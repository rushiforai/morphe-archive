"""Actual stock/patched forceHttps instructions with mocked Dart string helpers.
No device, live account, or upstream requests. Compare both boolean values.
"""
import struct, sys, zipfile
from unicorn import Uc, UC_ARCH_ARM64, UC_MODE_ARM, UC_HOOK_CODE
from unicorn.arm64_const import *
def lib(path):
    with zipfile.ZipFile(path) as z:return z.read("lib/arm64-v8a/libapp.so")
old,new=map(lib,sys.argv[1:3])
assert old[0x6fc8d0:0x6fc8d4].hex()=="fd79bfa9"
assert new[0x6fc8d0:0x6fc8d4].hex()=="08a80e14"
HEAP,PP,STACK,THR,NULL,STOP=0x11000000,0x12000000,0x13008000,0x14000000,0x15000001,0x100000
def run(code,url,enabled,cid):
    u=Uc(UC_ARCH_ARM64,UC_MODE_ARM)
    u.mem_map(0,0xac0000);u.mem_write(0,code)
    for a,n in [(HEAP,0x10000),(PP,0x10000),(STACK-0x8000,0x10000),(THR,0x1000)]:u.mem_map(a,n)
    values={}
    def string(text,kind=94):
        addr=HEAP+len(values)*0x1000+1
        values[addr]=text
        u.mem_write(addr-1,struct.pack("<I",kind<<12))
        u.mem_write(addr+7,struct.pack("<I",2*len(text)))
        u.mem_write(addr+15,text.encode("latin-1" if kind==94 else "utf-16le"))
        return addr
    arg=string(url,cid)
    for o,s in [(0x420,"http"),(0x428,"https")]:u.mem_write(PP+o,struct.pack("<Q",string(s)))
    for reg,val in [(UC_ARM64_REG_X1,arg),(UC_ARM64_REG_X2,NULL+(0x20 if enabled else 0x30)),(UC_ARM64_REG_X15,STACK),(UC_ARM64_REG_X22,NULL),(UC_ARM64_REG_X26,THR),(UC_ARM64_REG_X27,PP),(UC_ARM64_REG_X29,STACK),(UC_ARM64_REG_X30,STOP)]:u.reg_write(reg,val)
    def helper(uc,addr,size,data):
        if addr not in (0x446c70,0x45d404):return
        s=values[uc.reg_read(UC_ARM64_REG_X1)]
        prefix=values[uc.reg_read(UC_ARM64_REG_X2)]
        if addr==0x446c70:out=NULL+(0x20 if s.startswith(prefix) else 0x30)
        else:out=string(s.replace(prefix,values[uc.reg_read(UC_ARM64_REG_X3)],1),cid)
        uc.reg_write(UC_ARM64_REG_X0,out)
        uc.reg_write(UC_ARM64_REG_PC,uc.reg_read(UC_ARM64_REG_X30))
    u.hook_add(UC_HOOK_CODE,helper)
    u.emu_start(0x6fc8d0,STOP,count=3000)
    assert u.reg_read(UC_ARM64_REG_PC)==STOP
    assert u.reg_read(UC_ARM64_REG_X15)==STACK
    return values[u.reg_read(UC_ARM64_REG_X0)]
count=0
for board in ("mebuki","aimoge","animanch"):
    for cid in (94,95):
        for tail in ("futaba.php?mode=cat","res/1234567890123.htm","thumb/1234567890123s.jpg","futaba.php?mode=cat&sort=1"):
            url="http://127.0.0.1:18765/"+board+"/"+tail
            assert run(old,url,False,cid)==url
            assert run(old,url,True,cid)=="https"+url[4:]
            for enabled in (False,True):assert run(new,url,enabled,cid)==url
            count+=1
for cid in (94,95):
    for url in ("http://may.2chan.net/b/","https://may.2chan.net/b/","http://127.0.0.1:18766/mebuki/","http://127.0.0.2:18765/mebuki/","http://127.0.0.1:18765/mebuki-other/","http://127.0.0.1:18765/","http://127.0.0.1:18765/aimoge","https://127.0.0.1:18765/aimoge/","", "http://example.invalid/"):
        for enabled in (False,True):assert run(old,url,enabled,cid)==run(new,url,enabled,cid)
print("PASS",count,"local URL/encoding cases before and after; 40 nonmatching cases unchanged")
