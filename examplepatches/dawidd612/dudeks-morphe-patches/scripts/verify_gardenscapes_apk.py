"""Verify the actual rebuilt APK against the supplied original XAPK."""
import base64, hashlib, io, pathlib, struct, sys, zipfile
root=pathlib.Path(__file__).resolve().parents[1]
with zipfile.ZipFile(sys.argv[1]) as source:
    with zipfile.ZipFile(io.BytesIO(source.read('config.arm64_v8a.apk'))) as split:
        original=split.read('lib/arm64-v8a/libgame.so')
with zipfile.ZipFile(sys.argv[2]) as patched:
    output=patched.read('lib/arm64-v8a/libgame.so')
    from verify_gardenscapes_play_games import verify
    with zipfile.ZipFile(sys.argv[1]) as source:
        verify(source, patched)
assert hashlib.sha256(original).hexdigest()=='3a15c3c170c21a12b5f0253a9421b6bc41707f4e34285acbbcae8afde4851c5c'
payload=base64.b64decode((root/'patches/src/main/resources/gardenscapes/repair-arm64.b64').read_text())
u16=lambda b,o:struct.unpack_from('<H',b,o)[0]
u64=lambda b,o:struct.unpack_from('<Q',b,o)[0]
ph=lambda b,o:struct.unpack_from('<IIQQQQQQ',b,o)
off=(len(original)+0x3fff)&~0x3fff
assert u64(output,32)==off and u16(output,56)==10
for i in range(9):
    old=ph(original,64+i*56);new=ph(output,off+i*56)
    if old[0]==6:assert new==(6,4,off,0x79a0000,0x79a0000,560,560,8)
    else:assert new==old
assert ph(output,off+9*56)==(1,5,off,0x79a0000,0x79a0000,0x1000+len(payload),0x1000+len(payload),0x4000)
assert output[off+0x1000:]==payload
assert original[0x3c15ad8:0x3c15adc]==bytes.fromhex('fe0f1ef8')
assert output[0x38bd6e4:0x38bd768]==original[0x38bd6e4:0x38bd768] # reward path untouched
word=struct.unpack_from('<I',output,0x3c15ad8)[0]
assert word>>26==5 and 0x3c15ad8+(word&0x3ffffff)*4==0x79a1000
# Confirm the original call target and its certificate-result guard before checking
# that only the dialog dispatch was removed. The condition/check itself must survive.
call=0x3c25570
word=struct.unpack_from('<I',original,call)[0]
displacement=word&0x3ffffff
if displacement&0x2000000:displacement-=0x4000000
assert word>>26==0x25 and call+displacement*4==0x3c25470
assert original[call-4:call]==bytes.fromhex('40000037') # tbnz w0, #0, epilogue
assert output[call:call+4]==bytes.fromhex('1f2003d5') # nop
assert b'ZN12AndroidUtils29ShowInvalidCertificateMessageEvE3$_0' in original
# No changes outside ELF header fields, the native entry branch and this dialog call.
restored=bytearray(output[:len(original)])
for start,size in [(32,8),(56,2),(0x3c15ad8,4),(call,4)]:restored[start:start+size]=original[start:start+size]
assert restored==original
print('PASS: rebuilt APK, verified diagnostic DEX changes, exact garden getter entry, isolated certificate-dialog call, ASLR-relative branch, RX payload and relocated ELF headers')
