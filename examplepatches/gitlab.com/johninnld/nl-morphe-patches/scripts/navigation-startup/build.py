"""Build the standalone control-API probe with an explicitly supplied local test key."""
import argparse,subprocess,zipfile
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument("--output",type=Path,required=True);p.add_argument("--key",type=Path,required=True);p.add_argument("--sdk",type=Path,required=True);a=p.parse_args()
root=Path(__file__).resolve().parents[2];tools=a.sdk/"build-tools/36.0.0";android=a.sdk/"platforms/android-36/android.jar"
classes=a.output/"classes";dex=a.output/"dex";classes.mkdir(parents=True,exist_ok=True);dex.mkdir(parents=True,exist_ok=True)
def run(*cmd):subprocess.run([str(x) for x in cmd],check=True)
support=root/"support/navigation-startup/src/main/java/nl/johninnl/navigation/startup"
run("javac","--release","8","-cp",android,"-d",classes,root/"scripts/navigation-startup/Probe.java",*[support/(n+".java") for n in ["StartupProtocol","StartupPolicy","NavigationClient"]])
run(tools/"d8","--min-api","29","--lib",android,"--output",dex,*sorted(classes.rglob("*.class")))
raw=a.output/"unaligned.apk";apk=a.output/"probe.apk"
run(tools/"aapt2","link","-I",android,"--manifest",root/"scripts/navigation-startup/manifest.xml","-o",raw)
with zipfile.ZipFile(raw,"a",zipfile.ZIP_DEFLATED) as z:z.write(dex/"classes.dex","classes.dex")
run(tools/"zipalign","-f","4",raw,apk);run(tools/"apksigner","sign","--ks",a.key,"--ks-key-alias","navigation-test","--ks-pass","pass:android","--key-pass","pass:android",apk)
run(tools/"apksigner","verify",apk);print(apk)
