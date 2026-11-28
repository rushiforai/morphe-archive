"""Execute palette ARM64 hooks on a mock Dart heap; never launch Android.
Allocation calls are intercepted at the stock stub entries. Their return
address and the tracked frame slot are checked for both allocation passes.
The stock Color constructor itself is executed for a byte-for-byte comparison.
"""
import struct
import sys
import zipfile
from unicorn import Uc, UC_ARCH_ARM64, UC_MODE_ARM, UC_HOOK_CODE
from unicorn.arm64_const import (
    UC_ARM64_REG_PC, UC_ARM64_REG_X0, UC_ARM64_REG_X1, UC_ARM64_REG_X2,
    UC_ARM64_REG_X3, UC_ARM64_REG_X15, UC_ARM64_REG_X17, UC_ARM64_REG_X27,
    UC_ARM64_REG_X28, UC_ARM64_REG_X29, UC_ARM64_REG_X30,
)

with zipfile.ZipFile(sys.argv[1]) as z:
    code = z.read("lib/arm64-v8a/libapp.so")
assert code[0x8dc9cc:0x8dc9d8].hex() == "882707149227079495270714"
assert code[0x9298bc:0x9298c0].hex() == "f5f30514"
assert struct.unpack_from("<QQ",code,0xd0)in ((0x6868ac,0x6868ac),(0x6869e4,0x6869e4))
PALETTE = [0xfff44336,0xffe91e63,0xff9c27b0,0xff673ab7,0xff3f51b5,
           0xff2196f3,0xff03a9f4,0xff00bcd4,0xff009688,0xff4caf50,
           0xff8bc34a,0xffcddc39,0xffffeb3b,0xffffc107,0xffff9800,
           0xffff5722,0xff795548,0xff607d8b,0xff800000]
BRAND=0xff1192c9
FRAME,PP,HEAP=0x12008000,0x13000000,0x11000000
ARRAY=HEAP+1
ORIGINAL=[HEAP+0x1001+i*0x80 for i in range(19)]
NEW=HEAP+0x3001
CONTEXT=HEAP+0x4001
SRGB=HEAP+0x5001
STOCK=HEAP+0x6001
END=0x48dff4

def q(n): return struct.pack("<Q",n)
def obj(u,p,cid):
    u.mem_write(p-1,q(cid<<12))
def memq(u,p): return struct.unpack("<Q",u.mem_read(p,8))[0]
def color(u,p,argb):
    obj(u,p,4621)
    u.mem_write(p+7,struct.pack("<dddd",*((argb>>s&255)/255 for s in (24,16,8,0))))
    u.mem_write(p+0x27,struct.pack("<I",SRGB))
def make():
    u=Uc(UC_ARCH_ARM64,UC_MODE_ARM)
    for start,size in [(0x480000,0x10000),(0x8d0000,0x10000),(0x920000,0x10000),(0xa90000,0x20000)]:
        u.mem_map(start,size)
        u.mem_write(start,code[start:start+size])
    for start,size in [(HEAP,0x10000),(FRAME-0x8000,0x10000),(PP,0x20000)]:
        u.mem_map(start,size)
    u.reg_write(UC_ARM64_REG_X29,FRAME)
    u.reg_write(UC_ARM64_REG_X15,FRAME-0x100)
    u.reg_write(UC_ARM64_REG_X27,PP)
    u.reg_write(UC_ARM64_REG_X28,0)
    u.mem_write(PP+0x4128,struct.pack("<d",255.0))
    u.mem_write(PP+0x6ba8,q(SRGB))
    u.mem_write(PP+0xe728,q(ORIGINAL[-1]))
    u.mem_write(ARRAY+0xf,struct.pack("<19I",*ORIGINAL))
    for i,(p,v) in enumerate(zip(ORIGINAL,PALETTE)):
        color(u,p,v)
        if i<18: obj(u,p,4626)
    return u

for i in range(19):
    u=make()
    old=bytes(u.mem_read(ORIGINAL[-1]-1,48))
    calls=[]
    def hook(vm,address,size,_):
        if address not in (0x48b0ec,0xa9ed6c): return
        assert vm.reg_read(UC_ARM64_REG_X30)==0x8dc9d4
        calls.append(address)
        if address==0x48b0ec:
            assert i==18 and memq(vm,FRAME-8)==ORIGINAL[-1]
            obj(vm,NEW,4621)
            vm.reg_write(UC_ARM64_REG_X0,NEW)
        else:
            assert vm.reg_read(UC_ARM64_REG_X1)==1
            assert memq(vm,FRAME-8)==(NEW if i==18 else ORIGINAL[i])
            obj(vm,CONTEXT,100)
            vm.reg_write(UC_ARM64_REG_X0,CONTEXT)
        vm.reg_write(UC_ARM64_REG_PC,vm.reg_read(UC_ARM64_REG_X30))
    u.hook_add(UC_HOOK_CODE,hook)
    u.reg_write(UC_ARM64_REG_X2,ARRAY)
    u.reg_write(UC_ARM64_REG_X3,i)
    u.emu_start(0x8dc9b4,0x8dc9d8,count=160)
    assert u.reg_read(UC_ARM64_REG_PC)==0x8dc9d8
    assert calls==([0x48b0ec,0xa9ed6c] if i==18 else [0xa9ed6c])
    assert u.reg_read(UC_ARM64_REG_X2)==CONTEXT
    assert memq(u,FRAME-0x18)==i+1
    assert bytes(u.mem_read(ORIGINAL[-1]-1,48))==old
    if i==18:
        # Compare exact channel doubles and compressed ColorSpace with stock
        # constructor. The allocation itself is mocked, not Dart GC.
        obj(u,STOCK,4621)
        u.reg_write(UC_ARM64_REG_X1,STOCK)
        u.reg_write(UC_ARM64_REG_X2,BRAND)
        u.reg_write(UC_ARM64_REG_X30,END)
        u.emu_start(0x48df60,END,count=100)
        assert u.reg_read(UC_ARM64_REG_PC)==END
        assert bytes(u.mem_read(NEW+7,36))==bytes(u.mem_read(STOCK+7,36))
        channels=struct.unpack("<dddd",u.mem_read(NEW+7,32))
        assert tuple(round(v*255) for v in channels)==(255,17,146,201)
    # Execute the actual swatch child decision in the same mock frame.
    # Neither the Color instance nor the saved setting is involved now.
    u.emu_start(0x8dc9ec,0x8dca10 if i==18 else 0x8dcab8,count=30)
    assert u.reg_read(UC_ARM64_REG_PC)==(0x8dca10 if i==18 else 0x8dcab8)
    assert memq(u,FRAME-8)==(NEW if i==18 else ORIGINAL[i])
print("PASS leaf SVG branch: only slot 19, no change to selected color")
print("PASS palette 19 positions; original sentinel untouched; stock constructor byte match; reused allocation return PC")

for argb in PALETTE+[BRAND,0,0xffffffff,0x1234567890]:
    u=make()
    u.reg_write(UC_ARM64_REG_X2,argb)
    u.emu_start(0x9298bc,0x9298c0,count=20)
    assert u.reg_read(UC_ARM64_REG_PC)==0x9298c0
    assert u.reg_read(UC_ARM64_REG_X2)==(BRAND if argb==0xff800000 else argb)
    assert u.reg_read(UC_ARM64_REG_X17)==(-0x1c0)&((1<<64)-1)
print("PASS mainColor restore 23 cases; only old ARGB mapped")
