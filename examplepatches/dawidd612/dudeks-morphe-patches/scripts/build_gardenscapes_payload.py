"""Build the freestanding ARM64 hook; never downloads or embeds game code."""
import base64, pathlib, struct, subprocess, tempfile, sys
root=pathlib.Path(__file__).resolve().parents[1]
with tempfile.TemporaryDirectory() as tmp:
    tmp=pathlib.Path(tmp)
    src=root/'native/gardenscapes'
    subprocess.run(['cc','-Wall','-Wextra','-Werror','-Wno-unused-parameter','-DREPAIR_TEST',str(src/'repair.c'),str(src/'test_repair.c'),'-o',str(tmp/'test')],check=True)
    subprocess.run([str(tmp/'test')],check=True)
    for name in ['repair.c','entry.S']:
        subprocess.run(['clang','--target=aarch64-linux-gnu','-O2','-ffreestanding','-fno-builtin','-fno-stack-protector','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-fPIC','-c',str(src/name),'-o',str(tmp/(name+'.o'))],check=True)
    subprocess.run(['ld.lld','-T',str(src/'payload.ld'),str(tmp/'entry.S.o'),str(tmp/'repair.c.o'),'-o',str(tmp/'payload.elf')],check=True)
    data=(tmp/'payload.elf').read_bytes()
    shoff=struct.unpack_from('<Q',data,40)[0]; n=struct.unpack_from('<H',data,60)[0]
    payload=None
    for i in range(n):
        _,kind,flags,addr,off,size,_,_,_,_=struct.unpack_from('<IIQQQQIIQQ',data,shoff+i*64)
        if kind in (4,9) and size: raise RuntimeError('Unresolved relocation in payload')
        if kind==8 and size: raise RuntimeError('Unexpected writable state')
        if kind==1 and flags&2 and size:
            if addr!=0x79a1000 or payload is not None: raise RuntimeError('Unexpected allocated section')
            payload=data[off:off+size]
    assert payload and len(payload)<0x3000
    dest=root/'patches/src/main/resources/gardenscapes/repair-arm64.b64'
    dest.parent.mkdir(parents=True,exist_ok=True)
    if dest.exists() and base64.b64decode(dest.read_text()) != payload and '--update' not in sys.argv:
        raise RuntimeError('Payload differs from the committed build; review and regenerate with --update')
    dest.write_text(base64.b64encode(payload).decode()+'\n')
    print('Built ARM64 payload:',len(payload),'bytes')
