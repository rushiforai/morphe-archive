"""Verify startup on a disposable rooted emulator already containing the four patched apps and probe.

Root configures saved source choices and kills processes for tests. Startup itself must
happen through the ordinary receiving app UID. Never accepts a physical device serial.
"""
import argparse,json,re,subprocess,time,xml.etree.ElementTree as ET
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument("--serial",required=True);p.add_argument("--output",type=Path,required=True);a=p.parse_args()
if not re.fullmatch(r"emulator-\d+",a.serial):raise SystemExit("Disposable emulator serial required")
a.output.mkdir(parents=True,exist_ok=True)
def adb(*args):return subprocess.run(["adb","-s",a.serial,*args],check=True,capture_output=True,text=True).stdout
def health(provider):
 command="am broadcast --include-stopped-packages -n 'org.ungoogled.android.apps.maps.microg/nl.johninnl.startup.probe.Probe$Health' --es provider "+provider
 adb("shell",command)
adb("shell","am","force-stop","org.ungoogled.android.apps.maps.microg")
cases=[]
for consumer,prefs,key in [("org.ungoogled.android.apps.maps","ungoogled_ui","external_navigation_source"),("app.vela","vela_settings","morphe_telemetry_provider")]:
 for provider in ["com.waze","nl.flitsmeister"]:
  name=consumer+"-"+provider;adb("shell","am","force-stop",consumer);adb("shell","am","force-stop",provider)
  folder="/data/user/0/"+consumer+"/shared_prefs";dest=folder+"/"+prefs+".xml"
  original=adb("shell","cat",dest)
  entry='<string name="'+key+'">'+provider+'</string>'
  pattern=r'<string name="'+re.escape(key)+r'">.*?</string>'
  changed,count=re.subn(pattern,entry,original,flags=re.S)
  if not count:changed=original.replace("<map>","<map>"+entry,1)
  local=a.output/"source.xml";local.write_text(changed)
  adb("push",str(local),"/data/local/tmp/navigation-source.xml");adb("shell","cp","/data/local/tmp/navigation-source.xml",dest)
  line=next(x for x in adb("shell","cmd","package","list","packages","-U",consumer).splitlines() if x.split()[0]=="package:"+consumer)
  uid=re.search(r"uid:(\d+)",line).group(1);adb("shell","chown",uid+":"+uid,dest);adb("shell","chmod","660",dest);adb("shell","restorecon",dest)
  component=adb("shell","cmd","package","resolve-activity","--brief",consumer).strip().splitlines()[-1]
  marker="CASE_START "+name;adb("shell","log","-t","StartupCase",marker);adb("shell","am","start","-n",component)
  start=time.monotonic();ready=False
  while time.monotonic()-start<35:
   health(provider);logs=adb("logcat","-d","-v","threadtime");recent=logs[logs.rfind(marker):]
   if any("PASSIVE_HEALTH provider="+provider+" state=running" in line and "audio_muted=true" in line for line in recent.splitlines()):ready=True;break
   time.sleep(1)
  (a.output/(name+".log")).write_text(logs)
  services=adb("shell","dumpsys","activity","services",provider);(a.output/(name+"-services.txt")).write_text(services)
  tasks=adb("shell","dumpsys","activity","activities");(a.output/(name+"-activities.txt")).write_text(tasks)
  no_ui=not any("packageName="+x in tasks for x in ["com.waze","nl.flitsmeister"])
  binding=consumer in services and "NavigationControlService" in services
  result={"consumer":consumer,"provider":provider,"native_ready":ready,"provider_audio_muted":ready,"receiver_binding":binding,"provider_activities_absent":no_ui,"seconds":round(time.monotonic()-start,2)}
  cases.append(result);print(json.dumps(result),flush=True)
  (a.output/"results.json").write_text(json.dumps(cases,indent=2)+"\n")
  if not(ready and no_ui and binding):raise SystemExit("Runtime case failed: "+name)
