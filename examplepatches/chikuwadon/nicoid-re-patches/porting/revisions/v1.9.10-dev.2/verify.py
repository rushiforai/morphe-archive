from pathlib import Path
import subprocess,zipfile,hashlib,zlib,struct,json
p=Path(__file__).resolve().parent
cp=(p/'runtime-classpath.txt').read_text();java=['java','-Drobolectric.dependency.dir='+str(p/'tools/sdk'),'-cp',cp]
sources=sorted((p/'test').rglob('*.java'))
subprocess.run(['java','-jar',str(p/'tools/ecj.jar'),'-1.8','-warn:none','-cp',cp,'-d',str(p/'test-classes'),*map(str,sources)],check=True)
with (p/'unit-tests.log').open('w') as out:r=subprocess.run([*java,'org.junit.runner.JUnitCore','e.e.a.Revision233Test'],stdout=out,stderr=subprocess.STDOUT)
print((p/'unit-tests.log').read_text()[-2500:]);assert r.returncode==0
subprocess.run(['java','-cp',str(p/'test-classes')+':'+str(p/'tools/*'),'VerifyInvocationContracts',str(p/'helpers-final.dex'),str(p/'native-final.dex')],check=True)
file=p/'nicoid-re-1.9.10-dev.2.mpp';z=zipfile.ZipFile(file);base=zipfile.ZipFile(p/'base.mpp');assert z.testzip() is None
for n in ['nicoid/helpers.mpe','nicoid/method-delta.dex','classes.dex']:
 b=z.read(n);assert b[:4]==b'dex\n';assert hashlib.sha1(b[32:]).digest()==b[12:32];assert zlib.adler32(b[12:])&0xffffffff==struct.unpack_from('<I',b,8)[0];assert struct.unpack_from('<I',b,32)[0]==len(b)
for n in ['extensions/extension.mpe','nicoid/input-hashes.txt','nicoid/ui-strings.txt']:assert base.read(n)==z.read(n),n
# The startup-minimize callback must follow player-output preparation, not an early return.
s=(p/'native/com/sauzask/nicoid/NicoidVideoFragment$n.smali').read_text();assert s.index('Le/e/a/VideoOutput227;->prepared')<s.index('Le/e/a/BackgroundEntry233;->prepared')<s.rindex('return-void')
subprocess.run(['python',str(p.parent/'settings-audit/porting/tests/VerifyLegacyImageFormats191.py'),str(p/'base.mpp'),str(file)],check=True)
service=(p/'native/com/sauzask/nicoid/NicoidPopupViewService.smali').read_text();start=service.index('.method public onStartCommand');part=service[start:];assert part.index('Le/e/a/DirectBackground235;->begin')<part.index(':cond_1a6')<part.index('Le/e/a/DirectBackground235;->created')
assert 'updateVideoSize' not in (p/'src/e/e/a/PopupFrame233.java').read_text()
assert 'Bitmap.createBitmap' not in (p/'src/e/e/a/TabPager233.java').read_text()
assert 'source.draw' not in (p/'src/e/e/a/TabPager233.java').read_text()
assert b'Version: 1.9.10-dev.2' in z.read('META-INF/MANIFEST.MF')
print('Bundle integrity, terminal-frame isolation, direct service initialization order, gesture hot path and unchanged extension payload verified')
print('SHA256',hashlib.sha256(file.read_bytes()).hexdigest())
