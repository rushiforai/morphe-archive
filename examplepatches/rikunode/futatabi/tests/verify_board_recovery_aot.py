"""Check the actual empty-input branch and stock toast routing on ARM64."""
import sys, zipfile, struct
from unicorn import Uc, UC_ARCH_ARM64, UC_MODE_ARM, UC_HOOK_CODE
from unicorn.arm64_const import *
with zipfile.ZipFile(sys.argv[1]) as z: code=z.read("lib/arm64-v8a/libapp.so")
u=Uc(UC_ARCH_ARM64,UC_MODE_ARM)
u.mem_map(0x400000,0x700000);u.mem_write(0x400000,code[0x400000:0xb00000])
PP,FP,STR=0x2000000,0x21008000,0x2200001
for a,n in [(PP,0x40000),(FP-0x8000,0x10000),(STR-1,0x1000)]:u.mem_map(a,n)
def q(a,v):u.mem_write(a,struct.pack("<Q",v))
marker,error=0x2300001,0x2300101
q(PP+0x25a28,marker);q(PP+0x25a48,error);q(FP-0x18,STR)
u.reg_write(UC_ARM64_REG_X27,PP);u.reg_write(UC_ARM64_REG_X29,FP)
for n in (0,1,8,1024):
    u.mem_write(STR+7,struct.pack("<I",2*n))
    u.emu_start(0x887aa0,0x887aa8,count=20)
    assert u.reg_read(UC_ARM64_REG_PC)==0x887aa8
    assert u.reg_read(UC_ARM64_REG_X1)==(marker if n==0 else error)
for message in (marker,error,0x2300201):
    for result in (0x2400001,0x2400301):
        q(FP-0x28,message);u.reg_write(UC_ARM64_REG_X22,0x2400001);u.reg_write(UC_ARM64_REG_X0,result)
        stop=0x6c16d0 if message==marker or result==0x2400001 else 0x6c16ec
        u.emu_start(0x6c16c8,stop,count=20)
        assert u.reg_read(UC_ARM64_REG_PC)==stop
        assert u.reg_read(UC_ARM64_REG_X0)==result
print("PASS empty/nonempty marker, ordinary toast routing: 10 cases")
