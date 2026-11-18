"""Execute the compiled ARM64 garden getter and syscalls in Unicorn.
Only engine player/property access is stubbed, not our hook.
"""
import base64, pathlib, struct
from unicorn import Uc, UC_ARCH_ARM64, UC_MODE_ARM, UC_HOOK_CODE, UC_HOOK_INTR
from unicorn.arm64_const import *
root=pathlib.Path(__file__).resolve().parents[1]
payload=base64.b64decode((root/'patches/src/main/resources/gardenscapes/repair-arm64.b64').read_text())
checks=0
for bias in [0,0x7100000000]:
    u=Uc(UC_ARCH_ARM64,UC_MODE_ARM)
    for a,n in [(bias+0x386b000,0x1000),(bias+0x3871000,0x1000),(bias+0x3c15000,0x1000),(bias+0x79a0000,0x4000),(0x10000000,0x1000),(0x11000000,0x10000),(0x12000000,0x1000)]:u.mem_map(a,n)
    u.mem_write(bias+0x79a1000,payload)
    branch=0x14000000|(((0x79a1000-0x3c15ad8)//4)&0x3ffffff)
    u.mem_write(bias+0x3c15ad8,struct.pack('<I',branch))
    marker=False; changed=[]; paths=[]; deny=False
    def integer(a):return struct.unpack('<i',bytes(u.mem_read(a,4)))[0]
    def code(uc,addr,size,data):
        if addr==bias+0x386bd78:
            uc.reg_write(UC_ARM64_REG_X0,0x10000000)
            uc.reg_write(UC_ARM64_REG_PC,uc.reg_read(UC_ARM64_REG_LR))
        elif addr==bias+0x387151c:
            uc.reg_write(UC_ARM64_REG_W0,integer(uc.reg_read(UC_ARM64_REG_X0))&0xffffffff)
            uc.reg_write(UC_ARM64_REG_PC,uc.reg_read(UC_ARM64_REG_LR))
        elif addr==bias+0x3871490:
            p=uc.reg_read(UC_ARM64_REG_X0);a=uc.reg_read(UC_ARM64_REG_W1)
            if a&0x80000000:a-=0x100000000
            changed.append((p,a))
            uc.mem_write(p,struct.pack('<i',a))
            uc.reg_write(UC_ARM64_REG_PC,uc.reg_read(UC_ARM64_REG_LR))
    def syscall(uc,n,data):
        global marker
        call=uc.reg_read(UC_ARM64_REG_X8);a,b,c,d=[uc.reg_read(r) for r in [UC_ARM64_REG_X0,UC_ARM64_REG_X1,UC_ARM64_REG_X2,UC_ARM64_REG_X3]]
        if call==174:ret=1010123
        elif call==56:
            path=bytes(uc.mem_read(b,128)).split(b'\0')[0].decode();paths.append(path)
            assert path=='/data/user/10/com.playrix.gardenscapes/files/.dudek-stars-repaired-v2'
            assert c==2|64|0x8000|0x80000 and d==0o600
            ret=-13 if deny else 7
        elif call==32:assert a==7 and b==6;ret=0
        elif call==63:
            ret=int(marker)
            if marker:uc.mem_write(b,b'D')
        elif call==64:assert bytes(uc.mem_read(b,1))==b'D';marker=True;ret=1
        elif call in [57,82]:ret=0
        else:raise AssertionError(('Unexpected syscall',call))
        uc.reg_write(UC_ARM64_REG_X0,ret&0xffffffffffffffff)
    u.hook_add(UC_HOOK_CODE,code);u.hook_add(UC_HOOK_INTR,syscall)
    def run(e,s):
        u.mem_write(0x10000000+912,struct.pack('<i',e));u.mem_write(0x10000000+1016,struct.pack('<i',s))
        for r in range(UC_ARM64_REG_X19,UC_ARM64_REG_X28+1):u.reg_write(r,r*37)
        u.reg_write(UC_ARM64_REG_FP,0x12345678)
        u.reg_write(UC_ARM64_REG_X0,0xdeadbeef) # getter takes no player argument
        u.reg_write(UC_ARM64_REG_SP,0x1100fff0);u.reg_write(UC_ARM64_REG_LR,0x12000000)
        u.emu_start(bias+0x3c15ad8,0x12000000,count=100000)
        assert u.reg_read(UC_ARM64_REG_PC)==0x12000000
        assert u.reg_read(UC_ARM64_REG_SP)==0x1100fff0
        assert u.reg_read(UC_ARM64_REG_FP)==0x12345678
        for r in range(UC_ARM64_REG_X19,UC_ARM64_REG_X28+1):assert u.reg_read(r)==r*37
        observed=integer(0x10000000+912)-integer(0x10000000+1016)
        result=u.reg_read(UC_ARM64_REG_W0)
        if result&0x80000000:result-=0x100000000
        assert result==observed
        return observed
    assert run(1271,2672)==2 and marker and changed[-1]==(0x10000000+1016,1269);checks+=1
    assert run(1271,1269)==2 and len(changed)==1;checks+=1
    assert run(1271,1270)==1 and len(changed)==1;checks+=1
    assert run(1271,1271)==0 and len(changed)==1;checks+=1
    assert run(1272,1271)==1 and len(changed)==1;checks+=1
    assert run(1271,2672)==-1401 and len(changed)==1;checks+=1
    marker=False;deny=True
    assert run(1272,2672)==-1400 and not marker;checks+=1
    deny=False
    assert run(1272,2672)==2 and marker and changed[-1]==(0x10000000+1016,1270);checks+=1
    marker=False
    assert run(0,0)==0 and not marker;checks+=1
    assert run(1,0)==1 and not marker;checks+=1
    assert run(-1401,0)==2 and marker and changed[-1]==(0x10000000+912,2);checks+=1
print(f'PASS: {checks} compiled ARM64/ASLR scenarios, real returned balance, stack and callee-saved registers preserved')
