"""Verify libmain's exact edit and execute its load helper for success/failure on both ABIs.

JNI/libc/dlopen calls are stubbed. This verifies native control flow, not Android's linker.
"""
import struct
import hashlib
from unicorn import Uc, UC_ARCH_ARM, UC_ARCH_ARM64, UC_MODE_ARM, UC_MODE_THUMB, UC_HOOK_CODE
from unicorn import arm_const as arm, arm64_const as a64

PROFILES = {
    "arm64-v8a": (6728, "e6ee684092c38dd1f604c572506ada33238dd94fb0ac0220b06d4d82ead2cf31",
                  0xd54, "21008052", "1e000014"),
    "armeabi-v7a": (8588, "ab65bef5c126f6e03face43d2785f6a324959c88a6f21df155d19c848ed8ed31",
                    0xbd8, "3046", "32e0"),
}


def verify_bytes(image, abi):
    size, digest, offset, stock, replacement = PROFILES[abi]
    assert len(image) == size
    assert image[offset:offset+len(bytes.fromhex(replacement))] == bytes.fromhex(replacement)
    normalized = bytearray(image)
    normalized[offset:offset+len(bytes.fromhex(stock))] = bytes.fromhex(stock)
    assert hashlib.sha256(normalized).hexdigest() == digest, "Unexpected libmain changes"
    return bytes(normalized)


def run(image, abi, succeeds, expect_fallback=False):
    is64 = abi == 'arm64-v8a'
    u = Uc(UC_ARCH_ARM64 if is64 else UC_ARCH_ARM, UC_MODE_ARM if is64 else UC_MODE_THUMB)
    u.mem_map(0, 0x10000)
    u.mem_map(0x100000, 0x20000)
    if is64:
        phoff = struct.unpack_from('<Q',image,32)[0]
        pe,pn=struct.unpack_from('<HH',image,54)
        for i in range(pn):
            typ,_,off,va,_,size,_,_=struct.unpack_from('<IIQQQQQQ',image,phoff+i*pe)
            if typ==1: u.mem_write(va,image[off:off+size])
        regs = [a64.UC_ARM64_REG_X0,a64.UC_ARM64_REG_X1,a64.UC_ARM64_REG_X2,
                a64.UC_ARM64_REG_X3,a64.UC_ARM64_REG_X4]
        pc,lr,sp = a64.UC_ARM64_REG_PC,a64.UC_ARM64_REG_LR,a64.UC_ARM64_REG_SP
        pointer_format='<Q'; width=8
        start=0x4cd8; jni_offset=0x6d8
        snprintf,dlopen,dlsym,fail=0x4ec0,0x4ed0,0x4ea0,0x4ef0
        u.reg_write(a64.UC_ARM64_REG_TPIDR_EL0,0x106000)
        u.mem_write(0x106028,struct.pack('<Q',0x11223344))
    else:
        phoff=struct.unpack_from('<I',image,28)[0]
        pe,pn=struct.unpack_from('<HH',image,42)
        segments=[]
        for i in range(pn):
            typ,off,va,_,size,_,_,_=struct.unpack_from('<8I',image,phoff+i*pe)
            if typ==1:
                u.mem_write(va,image[off:off+size]);segments.append((off,va,size))
        # Apply R_ARM_RELATIVE entries needed by the function's GOT.
        shoff=struct.unpack_from('<I',image,32)[0]
        se,sn=struct.unpack_from('<HH',image,46)
        for i in range(sn):
            s=struct.unpack_from('<10I',image,shoff+i*se)
            if s[1]!=9:continue
            for o in range(s[4],s[4]+s[5],s[9]):
                address,info=struct.unpack_from('<II',image,o)
                if info&255==21: # __stack_chk_guard GLOB_DAT
                    u.mem_write(address,struct.pack('<I',0x106000))
        u.mem_write(0x106000,struct.pack('<I',0x11223344))
        regs=[arm.UC_ARM_REG_R0,arm.UC_ARM_REG_R1,arm.UC_ARM_REG_R2,arm.UC_ARM_REG_R3]
        pc,lr,sp=arm.UC_ARM_REG_PC,arm.UC_ARM_REG_LR,arm.UC_ARM_REG_SP
        pointer_format='<I';width=4
        start=0xb81;jni_offset=0x36c
        snprintf,dlopen,dlsym,fail=0x1800,0x1810,0x17e0,0x1830
    def ptr(a,v):u.mem_write(a,struct.pack(pointer_format,v))
    ptr(0x100000,0x101000)
    ptr(0x101000+jni_offset,0x102000 if is64 else 0x102001)
    u.mem_write(0x103000,b'/data/user/0/pkg/app_patchlab-native/hash\0')
    u.mem_write(0x104000,b'libil2cpp.so\0')
    ptr(0x105000,0)
    for reg,value in zip(regs,[0x100000,0x103000,0x104000,0x105000]):u.reg_write(reg,value)
    u.reg_write(lr,0x107000 if is64 else 0x107001)
    u.reg_write(sp,0x11f000)
    paths=[]
    def string(a):
        out=bytearray()
        while (ch:=u.mem_read(a,1))!=b'\0':out+=ch;a+=1
        return out.decode()
    def hook(uc,a,size,_):
        if a==0x102000:
            ptr(uc.reg_read(regs[1]),0x108000);uc.reg_write(regs[0],0)
        elif a==snprintf:
            name_address=uc.reg_read(regs[4]) if is64 else struct.unpack('<I',uc.mem_read(uc.reg_read(sp),4))[0]
            path=string(uc.reg_read(regs[3]))+'/'+string(name_address)
            uc.mem_write(uc.reg_read(regs[0]),path.encode()+b'\0')
            uc.reg_write(regs[0],len(path))
        elif a==dlopen:
            paths.append(string(uc.reg_read(regs[0])))
            result=0x9999 if succeeds or not paths[-1].startswith('/') else 0
            uc.reg_write(regs[0],result)
        elif a==dlsym:
            uc.reg_write(regs[0],0) # no JNI_OnLoad for this isolated test
        elif a==fail:raise AssertionError('Stack check failed')
        else:return
        uc.reg_write(pc,uc.reg_read(lr))
    u.hook_add(UC_HOOK_CODE,hook)
    u.emu_start(start,0x107000,count=400)
    assert u.reg_read(pc)==0x107000, 'Did not return normally'
    handle=struct.unpack(pointer_format,u.mem_read(0x105000,width))[0]
    assert len(paths)==(2 if expect_fallback else 1), paths
    assert handle==(0x9999 if succeeds or expect_fallback else 0),hex(handle)
    assert all(path.startswith('/') for path in paths) if not expect_fallback else paths[-1]=='libil2cpp.so'
    print('PASS',abi,'absolute success' if succeeds else 'absolute failure',
          'stock fallback reproduced' if expect_fallback else 'NO basename fallback', 'dlopen=',paths)


def verify(image,abi):
    original=verify_bytes(image,abi)
    run(original,abi,False,True)
    run(image,abi,True)
    run(image,abi,False)


def verify_dex(player):
    load=next(m for m in player.get_methods() if m.get_name()=='loadNative')
    ins=list(load.get_instructions())
    output=[i.get_output() for i in ins]
    assert not any('Ljava/lang/System;->load' in s for s in output), 'Bare Java fallback remains'
    for name in ('loadMain','rejectMainFallback','finishLoad'):
        assert sum('/strictv2/NativeLibraries;->'+name+'(' in s for s in output)==1,name
    assert not any('Lapp/patchlab/extension/offlinegames/NativeLibraries;' in s for s in output)
    assert not any('NativeLibraries;->verifyLoaded(' in s for s in output)
    call=next(i for i,s in enumerate(output) if 'NativeLoader;->load(' in s)
    assert [i.get_name() for i in ins[call:call+7]]==[
        'invoke-static','move-result','invoke-static','move-result-object','if-eqz','return-object','nop']
    assert 'NativeLibraries;->finishLoad(Z)' in output[call+2]
    # Original Unity readiness call follows the new early-error return gate.
    assert ins[call+7].get_name()=='if-eqz' and ins[call+8].get_name()=='invoke-static'
    indexed=list(load.get_instructions_idx())
    branch_address,branch=indexed[call+4]
    target=branch_address+2*branch.get_ref_off()
    assert target==indexed[call+6][0], f'Verified branch lands at {target:#x}, not the success continuation'
    assert indexed[call+5][1].get_output()=='v1', 'Error must return finishLoad message'
    old_address,old_branch=indexed[call+7]
    old_target=old_address+2*old_branch.get_ref_off()
    assert old_target>indexed[call+8][0], 'Original failure must bypass ready flag'
    assert len(load.get_code().get_tries())==2, 'Original error-handling ranges were removed'
    print('PASS output DEX rejects Java fallback, checks native result before readiness, preserves try/catch')


def verify_extension(classes):
    prefix='Lapp/patchlab/extension/offlinegames/strictv2/'
    for name in ('NativeLibraries','NativeLibraryStore','NativeLoadStatus'):
        assert prefix+name+';' in classes, 'Missing versioned helper '+name
    helper=classes[prefix+'NativeLibraries;']
    names={m.get_name() for m in helper.get_methods()}
    assert {'directory','loadMain','rejectMainFallback','finishLoad'} <= names
    status=classes[prefix+'NativeLoadStatus;']
    assert {'problem','unityProblem'} <= {m.get_name() for m in status.get_methods()}
    print('PASS versioned extension contains the actual strict-loader implementation')
