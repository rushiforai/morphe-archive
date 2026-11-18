#!/usr/bin/env python3
"""Build local test APKs with test keystores (password android); never use release keys."""
import argparse
from pathlib import Path
import subprocess
import zipfile
p=argparse.ArgumentParser(__doc__)
p.add_argument('--sdk',type=Path,required=True)
p.add_argument('--output',type=Path,required=True)
p.add_argument('--app-key',type=Path,required=True)
p.add_argument('--receiver-key',type=Path,required=True)
a=p.parse_args()
root=Path(__file__).resolve().parents[2]
build=a.sdk/'build-tools/36.0.0'
android=a.sdk/'platforms/android-36/android.jar'
def run(*cmd): subprocess.run([str(x) for x in cmd],check=True)
for name,manifest,sources,key,alias in [
 ('receiver',root/'scripts/navigation-probe/receiver-manifest.xml',[root/'scripts/waze/navigation-probe/Receiver.java',root/'scripts/waze/navigation-probe/Launch.java'],a.receiver_key,'receiver'),
 ('waze',root/'scripts/waze/navigation-probe/probe-manifest.xml',[root/'scripts/waze/navigation-probe/Probe.java'],a.app_key,'waze-test'),
 ('flitsmeister',root/'scripts/navigation-probe/flitsmeister-manifest.xml',[root/'scripts/navigation-probe/FlitsmeisterProbe.java'],a.app_key,'waze-test'),
]:
 out=a.output/name; classes=out/'classes'; dex=out/'dex'
 classes.mkdir(parents=True,exist_ok=True);dex.mkdir(parents=True,exist_ok=True)
 run('javac','--release','8','-cp',android,'-d',classes,*sources)
 run(build/'d8','--min-api','32','--lib',android,'--output',dex,*sorted(classes.rglob('*.class')))
 apk=out/'app.apk'
 run(build/'aapt2','link','-I',android,'--manifest',manifest,'-o',apk)
 with zipfile.ZipFile(apk,'a',zipfile.ZIP_DEFLATED) as z:z.write(dex/'classes.dex','classes.dex')
 run(build/'apksigner','sign','--ks',key,'--ks-key-alias',alias,'--ks-pass','pass:android','--key-pass','pass:android',apk)
 print('Built',apk)
