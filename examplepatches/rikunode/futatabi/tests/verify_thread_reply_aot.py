"""CPU gate for the actual patched library. Unicorn 2.1.4; mocked Dart calls only."""
import hashlib, struct, sys, zipfile
from unicorn import Uc, UC_ARCH_ARM64, UC_MODE_ARM, UC_HOOK_CODE
from unicorn.arm64_const import *
with zipfile.ZipFile(sys.argv[1]) as z:
    code = z.read("lib/arm64-v8a/libapp.so")
assert hashlib.sha256(code).hexdigest() == "71a41402da095ad801064b1b0a88a5eec41b74c66f5619c90fd8c689f42c25af"
assert struct.unpack_from("<QQ", code, 0xd0) == (0x6862d8, 0x6862d8)
HEAP, STACK, PP = 0x11000000, 0x12000000, 0x13000000
NULL, URL, MARKER, RESULT, LIST, ARGS2, ARGS3 = [HEAP+i*0x200+1 for i in range(1,8)]
SP = STACK+0x8000
def q(u,a,v): u.mem_write(a,struct.pack("<Q",v))
def w(u,a,v): u.mem_write(a,struct.pack("<I",v))
def rq(u,a): return struct.unpack("<Q",u.mem_read(a,8))[0]
def string(u,addr,value,cid):
    w(u,addr-1,cid<<12);w(u,addr+7,len(value)*2)
    u.mem_write(addr+15,value.encode("latin-1" if cid==94 else "utf-16le"))
def machine(value,cid):
    u=Uc(UC_ARCH_ARM64,UC_MODE_ARM)
    u.mem_map(0,0xac0000);u.mem_write(0,code)
    for a,n in [(HEAP,0x10000),(STACK,0x10000),(PP,0x20000)]:u.mem_map(a,n)
    string(u,URL,value,cid);string(u,MARKER,"assets/images/ad.svg",94)
    w(u,LIST-1,0x100<<12)
    q(u,PP+0x18a70,MARKER);q(u,PP+0xa0,ARGS2);q(u,PP+0x58,ARGS3)
    for reg,val in [(UC_ARM64_REG_X1,URL),(UC_ARM64_REG_X15,SP),(UC_ARM64_REG_X22,NULL),(UC_ARM64_REG_X27,PP),(UC_ARM64_REG_X28,0)]:
        u.reg_write(reg,val)
    return u
def gate(value,cid,target):
    u=machine(value,cid);calls=[]
    def hook(u,a,size,data):
        if a==0x74c3b0:
            assert not target and u.reg_read(UC_ARM64_REG_X0)==cid<<12 and u.reg_read(UC_ARM64_REG_X1)==URL
            calls.append("stock");u.emu_stop()
        elif a==0x43db90:
            assert target and (rq(u,SP),rq(u,SP+8))==(URL,MARKER)
            string(u,RESULT,"assets/images/ad.svg"+value,cid)
            u.reg_write(UC_ARM64_REG_X0,RESULT)
            calls.append("concat");u.reg_write(UC_ARM64_REG_PC,u.reg_read(UC_ARM64_REG_X30))
        elif a==0x73b50c:
            assert target and (u.reg_read(UC_ARM64_REG_X1),u.reg_read(UC_ARM64_REG_X2),u.reg_read(UC_ARM64_REG_X4))==(RESULT,NULL+0x30,ARGS2)
            assert (rq(u,SP),rq(u,SP+8),rq(u,SP+16))==(RESULT,NULL,NULL)
            calls.append("launch");u.reg_write(UC_ARM64_REG_PC,u.reg_read(UC_ARM64_REG_X30))
        elif a==0x74c44c:u.emu_stop()
    u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x74c3ac,0x74c44c,count=2000)
    assert calls==(["concat","launch"] if target else ["stock"]),(value,cid,calls)
    assert u.reg_read(UC_ARM64_REG_X15)==SP
targets=["http://127.0.0.1:18765/aimoge/res/1234567890123.htm","http://127.0.0.1:18765/animanch/res/9876543210987.htm"]
others=["https://may.2chan.net/b/res/1234567890.htm","https://img.2chan.net/b/res/1234567890.htm","http://127.0.0.1:18765/mebuki/res/1234567890123.htm",targets[0].replace("18765","18766"),targets[0].replace("127.0.0.1","127.0.0.2"),targets[0]+"?x=1",targets[0].replace("1234567890123","123456789012a"),targets[0][:-1]+"x",""]
for cid in (94,95):
    for v in targets+others:gate(v,cid,v in targets)
gate(targets[0].replace("1234567890123","123456789012Ā"),95,False)
u=machine("",94);u.reg_write(UC_ARM64_REG_X0,LIST)
u.emu_start(0x74c3c4,0x74c3c8,count=100);assert u.reg_read(UC_ARM64_REG_X1)==LIST
u.reg_write(UC_ARM64_REG_X4,ARGS3)
u.emu_start(0x74c448,0x457710,count=100);assert u.reg_read(UC_ARM64_REG_X30)==0x74c44c
print("thread pencil AOT gate:",2*(len(targets)+len(others))+1,"URL cases; original list return and showDialog dispatch PASS")
