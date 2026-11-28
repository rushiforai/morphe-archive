"""Execute the actual patched ARM64 still-image constraint fragments, not a Flutter runtime."""
import struct, sys, zipfile
from unicorn import Uc, UC_ARCH_ARM64, UC_MODE_ARM
from unicorn.arm64_const import UC_ARM64_REG_D0, UC_ARM64_REG_D1, UC_ARM64_REG_D2, UC_ARM64_REG_X0, UC_ARM64_REG_X29, UC_ARM64_REG_PC

with zipfile.ZipFile(sys.argv[1]) as apk:
    code=apk.read("lib/arm64-v8a/libapp.so")
FRAME=0x12008000
def bits(x): return struct.unpack("<Q",struct.pack("<d",x))[0]
def val(u,r): return struct.unpack("<d",struct.pack("<Q",u.reg_read(r)))[0]
def run(u,start,end):
    u.emu_start(start,end,count=100)
    assert u.reg_read(UC_ARM64_REG_PC)==end
def vm():
    u=Uc(UC_ARCH_ARM64,UC_MODE_ARM)
    u.mem_map(0x890000,0x10000)
    u.mem_write(0x890000,code[0x890000:0x8a0000])
    u.mem_map(FRAME-0x8000,0x10000)
    u.reg_write(UC_ARM64_REG_X29,FRAME)
    u.mem_write(FRAME-0x20,struct.pack("<Q",0x12345679))
    return u
n=0
for width,height in [(500,600),(200,180),(280,280),(400,100),(100,400),(1,1),(1.7976931348623157e308,500)]:
    for original in [(50,50),(250,125),(1280,720),(728,1000)]:
        # Non-fixed branch: original height and width no longer limit the box.
        u=vm()
        u.reg_write(UC_ARM64_REG_D0,bits(height))
        u.reg_write(UC_ARM64_REG_D1,bits(original[1]))
        run(u,0x89c7c8,0x89c838)
        assert val(u,UC_ARM64_REG_D0)==height and val(u,UC_ARM64_REG_D1)==original[1]
        u.reg_write(UC_ARM64_REG_D0,bits(original[0]))
        u.reg_write(UC_ARM64_REG_D1,bits(width))
        run(u,0x89c8bc,0x89c934)
        assert val(u,UC_ARM64_REG_D0)==width
        u.reg_write(UC_ARM64_REG_D1,bits(height))
        u.reg_write(UC_ARM64_REG_D2,bits(width))
        run(u,0x89c940,0x89c944)
        assert val(u,UC_ARM64_REG_D2)==min(width,280)
        assert struct.unpack("<d",u.mem_read(FRAME-0x70,8))[0]==min(height,280)
        assert u.reg_read(UC_ARM64_REG_X0)==0x12345679
        n+=1
    # Existing fixed-width branch: clamp both selected settings.
    u=vm()
    u.reg_write(UC_ARM64_REG_D0,bits(height))
    u.reg_write(UC_ARM64_REG_D1,bits(width))
    run(u,0x89c3bc,0x89c3c0)
    assert val(u,UC_ARM64_REG_D1)==min(width,280)
    assert struct.unpack("<d",u.mem_read(FRAME-0x70,8))[0]==min(height,280)
    assert u.reg_read(UC_ARM64_REG_X0)==0x12345679
    n+=1
print("PASS shared still-image limits",n,"cases; stock settings caps and frame preserved")
