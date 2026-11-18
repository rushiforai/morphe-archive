"""Check missing permissions and disabled sharing without provider UI on a disposable emulator."""
import argparse,json,re,subprocess,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument("--serial",required=True);p.add_argument("--output",type=Path,required=True);a=p.parse_args()
if not re.fullmatch(r"emulator-\d+",a.serial):raise SystemExit("Disposable emulator serial required")
a.output.mkdir(parents=True,exist_ok=True)
def adb(*args):return subprocess.run(["adb","-s",a.serial,*args],check=True,capture_output=True,text=True).stdout
def wait_state(provider,expected,label):
 marker="NEGATIVE_CASE "+label;adb("shell","log","-t","StartupCase",marker);start=time.monotonic();out=""
 while time.monotonic()-start<35:
  adb("shell","am broadcast --include-stopped-packages -n 'org.ungoogled.android.apps.maps.microg/nl.johninnl.startup.probe.Probe$Health' --es provider "+provider)
  out=adb("logcat","-d","-v","threadtime");recent=out[out.rfind(marker):]
  if "PASSIVE_HEALTH provider="+provider+" state="+expected in recent:
   (a.output/(label+".log")).write_text(out);return
  time.sleep(1)
 (a.output/(label+".log")).write_text(out);raise AssertionError(label+" did not reach "+expected)
def choose(provider):
 adb("shell","am","force-stop","org.ungoogled.android.apps.maps.microg")
 adb("shell","am","start","-n","org.ungoogled.android.apps.maps.microg/nl.johninnl.startup.probe.Probe","--es","provider",provider)
results=[]
for provider in ["com.waze","nl.flitsmeister"]:
 choose(provider)
 for permission in ["ACCESS_BACKGROUND_LOCATION","ACCESS_FINE_LOCATION","ACCESS_COARSE_LOCATION"]:adb("shell","pm","revoke",provider,"android.permission."+permission)
 wait_state(provider,"permission_required",provider+"-denied")
 for permission in ["ACCESS_COARSE_LOCATION","ACCESS_FINE_LOCATION","ACCESS_BACKGROUND_LOCATION"]:adb("shell","pm","grant",provider,"android.permission."+permission)
 wait_state(provider,"running",provider+"-granted")
 results.append({"provider":provider,"missing_location":"permission_required","restored_permissions":"running"});print(json.dumps(results[-1]),flush=True)
provider="com.waze";choose(provider)
folder="/data/user/0/com.waze/shared_prefs";dest=folder+"/ungoogled_waze.xml"
uid=re.search(r"uid:(\d+)",next(x for x in adb("shell","cmd","package","list","packages","-U",provider).splitlines() if x.split()[0]=="package:"+provider)).group(1)
def enabled(value):
 adb("shell","am","force-stop",provider)
 read=subprocess.run(["adb","-s",a.serial,"shell","cat",dest],capture_output=True,text=True);xml=read.stdout if read.returncode==0 else '<?xml version="1.0" encoding="utf-8"?><map></map>'
 entry='<boolean name="navigationBroadcasts" value="'+str(value).lower()+'" />';changed,count=re.subn(r'<boolean name="navigationBroadcasts"[^>]*/>',entry,xml)
 if not count:changed=xml.replace('<map>','<map>'+entry,1)
 file=a.output/"waze-prefs.xml";file.write_text(changed);adb("push",str(file),"/data/local/tmp/startup-negative-prefs.xml")
 adb("shell","mkdir","-p",folder);adb("shell","cp","/data/local/tmp/startup-negative-prefs.xml",dest);adb("shell","chown",uid+":"+uid,folder,dest);adb("shell","chmod","770",folder);adb("shell","chmod","660",dest);adb("shell","restorecon","-RF",folder)
try:
 enabled(False);wait_state(provider,"disabled","waze-disabled")
finally:enabled(True)
wait_state(provider,"running","waze-enabled")
results.append({"provider":provider,"sharing_off":"disabled","sharing_on":"running"})
tasks=adb("shell","dumpsys","activity","activities");(a.output/"activities.txt").write_text(tasks)
assert not any("packageName="+p in tasks for p in ["com.waze","nl.flitsmeister"])
(a.output/"results.json").write_text(json.dumps(results,indent=2)+"\n");print(json.dumps(results[-1]),flush=True)
