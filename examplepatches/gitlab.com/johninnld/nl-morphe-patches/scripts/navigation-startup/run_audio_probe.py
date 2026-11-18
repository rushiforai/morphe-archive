"""Instrument a disposable emulator provider copy; retain the original signed APK untouched."""
import argparse,hashlib,json,re,subprocess
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument("--serial",required=True);p.add_argument("--sdk",type=Path,required=True);p.add_argument("--provider",choices=["com.waze","nl.flitsmeister"],required=True);p.add_argument("--apk",type=Path,required=True);p.add_argument("--probe",type=Path,required=True);p.add_argument("--key",type=Path,required=True);p.add_argument("--output",type=Path,required=True);a=p.parse_args()
if not re.fullmatch(r"emulator-\d+",a.serial):raise SystemExit("Disposable emulator serial required")
a.output.mkdir(parents=True,exist_ok=True)
def adb(*args):return subprocess.run(["adb","-s",a.serial,*args],check=True,capture_output=True,text=True).stdout
signed=a.output/"provider-test.apk"
subprocess.run([str(a.sdk/"build-tools/36.0.0/apksigner"),"sign","--ks",str(a.key),"--ks-key-alias","navigation-test","--ks-pass","pass:android","--key-pass","pass:android","--out",str(signed),str(a.apk)],check=True)
for app in ["org.ungoogled.android.apps.maps","app.vela","org.ungoogled.android.apps.maps.microg"]:adb("shell","am","force-stop",app)
adb("uninstall",a.provider);print(adb("install",str(signed)),flush=True);print(adb("install","-r",str(a.probe)),flush=True)
for permission in ["ACCESS_COARSE_LOCATION","ACCESS_FINE_LOCATION","ACCESS_BACKGROUND_LOCATION","POST_NOTIFICATIONS"]:adb("shell","pm","grant",a.provider,"android.permission."+permission)
component="nl.johninnl.startup.audio."+a.provider.replace(".","")+"/nl.johninnl.startup.audio.AudioProbe"
output=adb("shell","am","instrument","-w","-r",component);(a.output/"instrumentation.txt").write_text(output);print(output,flush=True)
m=re.search(r"INSTRUMENTATION_RESULT: audio_result=(.+)",output)
if not m:raise SystemExit("Audio instrumentation did not report a result")
report=json.loads(m.group(1));report["apk_sha256"]=hashlib.file_digest(a.apk.open("rb"),"sha256").hexdigest();report["test_signed_apk_sha256"]=hashlib.file_digest(signed.open("rb"),"sha256").hexdigest();(a.output/"result.json").write_text(json.dumps(report,indent=2)+"\n")
if not report.get("pass"):raise SystemExit("Audio instrumentation failed")
