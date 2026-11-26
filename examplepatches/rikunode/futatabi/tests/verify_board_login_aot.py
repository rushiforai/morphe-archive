"""Execute the actual patched AArch64 code with mocked Dart runtime calls.
Requires unicorn 2.1.4. Run from repository root with the verified merged APK.
This is a CPU-level test, not a Flutter/Android runtime test.
"""
from pathlib import Path
import sys,struct,hashlib,re,zipfile
from unicorn import Uc, UC_ARCH_ARM64, UC_MODE_ARM, UC_HOOK_CODE
from unicorn.arm64_const import *
apk = Path(sys.argv[1])
with zipfile.ZipFile(apk) as z:
    original = z.read("lib/arm64-v8a/libapp.so")
assert hashlib.sha256(original).hexdigest() == "dd542fe3af5f266096e07f823da3880d3a6e7c771aa80afe6324137e63c5041a"
src = Path("patches/src/main/kotlin/dev/rikunode/futatabi/BoardLoginButtonPatch.kt").read_text(encoding="utf-8")
patched = bytearray(original)
for name,offset,size in [("visibilityCode",0x86e088,208),("tapCode",0x86dfdc,48)]:
    blob = bytes.fromhex(re.search(r'val '+name+r'\s*=\s*"([0-9a-f]+)"',src).group(1))
    assert len(blob)==size
    patched[offset:offset+size]=blob
assert hashlib.sha256(patched).hexdigest()=="e6b90f17ae6ab4d9424d12e450f66ca14ce4b203fde6c70b4b6ee99dbd563efd"
RETURN=0x10000000
HEAP=0x11000000
STACK=0x12000000
PP=0x13000000
THR=0x14000000
NULL=HEAP+0x101
REF=HEAP+0x201
PROVIDER=HEAP+0x301
TYPEARGS=HEAP+0x401
ARGS1=HEAP+0x501
ARGS2=HEAP+0x601
MARKER=HEAP+0x701
CLOSURE=HEAP+0x801
CONTEXT=HEAP+0x901
OBJECT=HEAP+0xa01
START_SP=STACK+0x8000
OLD_FP=STACK+0x9000
def q(uc,a,v):uc.mem_write(a,struct.pack("<Q",v))
def w(uc,a,v):uc.mem_write(a,struct.pack("<I",v))
def rq(uc,a):return struct.unpack("<Q",uc.mem_read(a,8))[0]
def run(mode,board="",cid=94,smi=False,missing=False):
    uc=Uc(UC_ARCH_ARM64,UC_MODE_ARM)
    uc.mem_map(0,0xac0000)
    uc.mem_write(0,bytes(patched))
    for a,n in [(RETURN,0x1000),(HEAP,0x10000),(STACK,0x10000),(PP,0x20000),(THR,0x1000)]:
        uc.mem_map(a,n)
    q(uc,THR+0x38,STACK+0x1000)
    for off,v in [(0xa70,TYPEARGS),(0x58,ARGS1),(0xa0,ARGS2),(0x18a70,MARKER)]:q(uc,PP+off,v)
    q(uc,START_SP,REF if mode=="visibility" else CLOSURE)
    w(uc,CLOSURE+0x17,CONTEXT)
    w(uc,CONTEXT+0xf,REF)
    for reg,val in [(UC_ARM64_REG_X15,START_SP),(UC_ARM64_REG_X29,OLD_FP),
                    (UC_ARM64_REG_X30,RETURN),(UC_ARM64_REG_X22,NULL),
                    (UC_ARM64_REG_X27,PP),(UC_ARM64_REG_X26,THR),(UC_ARM64_REG_X28,0)]:
        uc.reg_write(reg,val)
    w(uc,OBJECT-1,cid<<12)
    w(uc,OBJECT+7,len(board)*2)
    if cid==95:uc.mem_write(OBJECT+15,board.encode("utf-16le"))
    elif cid==94:uc.mem_write(OBJECT+15,board.encode("latin-1"))
    calls=[]
    def hook(uc,addr,size,user):
        if addr==RETURN:
            uc.emu_stop(); return
        if addr==0x932f08:
            calls.append("getter")
            uc.reg_write(UC_ARM64_REG_X0,PROVIDER)
        elif addr==0x6fc984:
            calls.append("watch")
            sp=uc.reg_read(UC_ARM64_REG_X15)
            assert (rq(uc,sp),rq(uc,sp+8),rq(uc,sp+16))==(PROVIDER,REF,TYPEARGS)
            assert uc.reg_read(UC_ARM64_REG_X4)==ARGS1
            uc.reg_write(UC_ARM64_REG_X0,0 if smi else NULL if missing else OBJECT)
        elif addr==0x73b50c:
            calls.append("launch")
            assert (uc.reg_read(UC_ARM64_REG_X1),uc.reg_read(UC_ARM64_REG_X2),uc.reg_read(UC_ARM64_REG_X4))==(MARKER,NULL+0x30,ARGS2)
            uc.reg_write(UC_ARM64_REG_X0,OBJECT)
        else:return
        uc.reg_write(UC_ARM64_REG_PC,uc.reg_read(UC_ARM64_REG_X30))
    uc.hook_add(UC_HOOK_CODE,hook)
    uc.emu_start(0x86e070 if mode=="visibility" else 0x86dfb8,RETURN,count=2000)
    assert uc.reg_read(UC_ARM64_REG_PC)==RETURN
    assert uc.reg_read(UC_ARM64_REG_X15)==START_SP
    assert uc.reg_read(UC_ARM64_REG_X29)==OLD_FP
    assert calls==(["getter","watch"] if mode=="visibility" else ["launch"]),calls
    return uc.reg_read(UC_ARM64_REG_X0)
target=["http://127.0.0.1:18765/aimoge/","http://127.0.0.1:18765/mebuki/"]
others=["","http://127.0.0.1:18765/animanch/","https://img.2chan.net/b/","https://may.2chan.net/b/",
        "http://127.0.0.2:18765/aimoge/","http://127.0.0.1:18766/aimoge/","http://127.0.0.1:18765/aimogf/",
        "http://127.0.0.1:18765/mebuki","http://127.0.0.1:18765/mebuki/?q=1",
        "http://127.0.0.1:18765/aimogeX","http://127.0.0.1:18765/ME BUK/"]
count=0
for cid in (94,95):
    for value in target+others:
        assert run("visibility",value,cid)==NULL+(0x30 if value in target else 0x20),(value,cid)
        count+=1
assert run("visibility",cid=96)==NULL+0x20
assert run("visibility",smi=True)==NULL+0x20
assert run("visibility",missing=True)==NULL+0x20
assert run("visibility",target[0][:-1]+"\u0100",95)==NULL+0x20
count+=4
assert run("tap")==NULL
print("ARM64 visibility",count,"cases PASS; exact target URLs in both Dart string encodings; other values fail closed")
print("ARM64 tap PASS; original frame restored, reserved marker + false + original argument descriptor, only launch helper called")
