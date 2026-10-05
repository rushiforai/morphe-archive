from pathlib import Path
import hashlib,json,subprocess,zipfile

root=Path.cwd()
import argparse
parser=argparse.ArgumentParser()
parser.add_argument('--work',type=Path,required=True)
a=parser.parse_args()
work=a.work.resolve()
compiled=work/'fresh-compiled'
java='F:/Runtimes/Java21/bin/java.exe'
runtime=(compiled/'runtime-classpath.txt').read_text().strip()
jar=compiled/'catalog-work/patches/build/libs/patches-categories.mpp'
dex=work/'dex'
dex.mkdir(exist_ok=True)
class_input=work/'d8-input.jar'
with zipfile.ZipFile(class_input,'w',zipfile.ZIP_DEFLATED) as z:
    for p in (compiled/'classes').rglob('*.class'):
        z.write(p,p.relative_to(compiled/'classes').as_posix())
command=[java,'-Xmx1g','-cp',str(root/'build/tooling/r8-9.4.17.jar'),'com.android.tools.r8.D8',
         '--release','--min-api','26','--lib',str(root/'.android-sdk/platforms/android-33/android.jar')]
for p in runtime.split(';'):
    if p.endswith('.jar'): command+=['--classpath',p]
command+=['--output',str(dex),str(class_input)]
with (work/'d8.log').open('w',encoding='utf-8') as log:
    subprocess.run(command,stdout=log,stderr=subprocess.STDOUT,check=True)
output=work/'patches-1.21.1-dev.1-categories-local.mpp'
with zipfile.ZipFile(jar) as old, zipfile.ZipFile(output,'w',zipfile.ZIP_DEFLATED) as new:
    for item in old.infolist():
        if item.filename=='META-INF/MANIFEST.MF':
            text='Manifest-Version: 1.0\r\nName: Steam Link GalaxyXR Patches\r\nDescription: Local category metadata validation\r\nVersion: 1.21.1-dev.1\r\nPatcher-Version: 1.13.0\r\nSource: https://github.com/AngelDark92/steamlink-patches\r\nAuthor: AngelDark92\r\nLicense: GPLv3\r\n\r\n'
            new.writestr(item.filename,text)
        else: new.writestr(item,old.read(item.filename))
    for p in dex.glob('*.dex'):
        assert p.read_bytes().startswith(b'dex\n')
        new.write(p,p.name)
with zipfile.ZipFile(output) as z:
    assert 'classes.dex' in z.namelist()
    for name in ('extension.mpe','minimal-extension.mpe','battery-extension.mpe'):
        header=z.read('extensions/'+name)[:8]
        assert header==b'dex\n040\x00'
        # smali d856bad65f emits standard DEX040 at API33. The matching patcher
        # parses this in Native5002318TrackingConfigTest; it is not DEX041 container output.
        assert int.from_bytes(z.read('extensions/'+name)[0x24:0x28],'little')==0x70
    manifest=z.read('META-INF/MANIFEST.MF').decode()
    assert 'Patcher-Version: 1.13.0' in manifest
receipt={'path':str(output),'sha256':hashlib.sha256(output.read_bytes()).hexdigest(),
         'bytes':output.stat().st_size,'patcher':'1.13.0','desktopRuntime':'1.15.1',
         'packaging':'D8 Release/API26; standard extension DEX040 assembled at API33',
         'status':'local fallback artifact, not Gradle/CI release or installed APK'}
(work/'bundle.json').write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps(receipt,indent=2))
