"""Build same-signer instrumentation for disposable emulator provider copies."""
import argparse,subprocess,zipfile
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument("--sdk",type=Path,required=True);p.add_argument("--output",type=Path,required=True);p.add_argument("--key",type=Path,required=True);a=p.parse_args()
root=Path(__file__).resolve().parents[2];tools=a.sdk/"build-tools/36.0.0";android=a.sdk/"platforms/android-36/android.jar"
classes=a.output/"classes";dex=a.output/"dex";classes.mkdir(parents=True,exist_ok=True);dex.mkdir(parents=True,exist_ok=True)
def run(*cmd):subprocess.run([str(x) for x in cmd],check=True)
run("javac","--release","8","-cp",android,"-d",classes,root/"scripts/navigation-startup/AudioProbe.java")
run(tools/"d8","--min-api","29","--lib",android,"--output",dex,*sorted(classes.rglob("*.class")))
for target in ["com.waze","nl.flitsmeister"]:
 name=target.replace(".","-");manifest=a.output/(name+".xml");manifest.write_text('<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="nl.johninnl.startup.audio.'+name.replace("-","")+'"><uses-sdk android:minSdkVersion="29" android:targetSdkVersion="36"/><application android:label="Provider audio probe"/><instrumentation android:name="nl.johninnl.startup.audio.AudioProbe" android:targetPackage="'+target+'"/></manifest>')
 raw=a.output/(name+"-raw.apk");apk=a.output/(name+".apk")
 run(tools/"aapt2","link","-I",android,"--manifest",manifest,"-o",raw)
 with zipfile.ZipFile(raw,"a",zipfile.ZIP_DEFLATED) as z:z.write(dex/"classes.dex","classes.dex")
 run(tools/"zipalign","-f","4",raw,apk);run(tools/"apksigner","sign","--ks",a.key,"--ks-key-alias","navigation-test","--ks-pass","pass:android","--key-pass","pass:android",apk)
 run(tools/"apksigner","verify",apk);print(apk)
