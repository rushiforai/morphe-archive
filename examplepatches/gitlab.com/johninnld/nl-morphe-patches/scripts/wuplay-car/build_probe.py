from pathlib import Path
import subprocess,zipfile,shutil
root=Path(__file__).resolve().parents[2]
out=root/".analysis/probe";out.mkdir(exist_ok=True)
sdk=Path.home()/"Library/Android/sdk";tools=sdk/"build-tools/36.1.0";android=sdk/"platforms/android-36/android.jar"
classes=out/"classes";classes.mkdir(exist_ok=True)
subprocess.run(["javac","--release","11","-cp",str(android),"-d",str(classes),str(Path(__file__).with_name("Probe.java"))],check=True)
jar=out/"probe.jar";subprocess.run(["jar","cf",str(jar),"-C",str(classes),"."],check=True)
dex=out/"dex";dex.mkdir(exist_ok=True)
subprocess.run([str(tools/"d8"),"--min-api","24","--lib",str(android),"--output",str(dex),str(jar)],check=True)
manifest=out/"AndroidManifest.xml";manifest.write_text('''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="nl.johninnl.wuplaycarprobe"><uses-sdk android:minSdkVersion="24" android:targetSdkVersion="36"/><application android:label="WuPlay car validation"/><instrumentation android:name="nl.johninnl.wuplaycarprobe.Probe" android:targetPackage="app.wuplay.android" android:functionalTest="true"/></manifest>''')
unsigned=out/"unsigned.apk";subprocess.run([str(tools/"aapt2"),"link","-I",str(android),"--manifest",str(manifest),"-o",str(unsigned)],check=True)
with zipfile.ZipFile(unsigned,"a") as z:
 for f in dex.glob("*.dex"):z.write(f,f.name)
apk=out/"probe.apk";subprocess.run([str(tools/"zipalign"),"-f","4",str(unsigned),str(apk)],check=True)
subprocess.run([str(tools/"apksigner"),"sign","--ks",str(Path.home()/".android/debug.keystore"),"--ks-pass","pass:android",str(apk)],check=True)
print(apk)
