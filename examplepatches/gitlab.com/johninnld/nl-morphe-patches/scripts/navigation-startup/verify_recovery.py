"""Process-death recovery with the shared client in a screen-off navigation session."""
import argparse,json,re,subprocess,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument("--serial",required=True);p.add_argument("--output",type=Path,required=True);a=p.parse_args()
if not re.fullmatch(r"emulator-\d+",a.serial):raise SystemExit("Disposable emulator serial required")
a.output.mkdir(parents=True,exist_ok=True)
def adb(*args):return subprocess.run(["adb","-s",a.serial,*args],check=True,capture_output=True,text=True).stdout
def logs():return adb("logcat","-d","-v","threadtime")
results=[]
try:
 for provider in ["com.waze","nl.flitsmeister"]:
  adb("shell","input","keyevent","224");adb("shell","am","force-stop","org.ungoogled.android.apps.maps.microg")
  adb("shell","am","start","-n","org.ungoogled.android.apps.maps.microg/nl.johninnl.startup.probe.Probe","--es","provider",provider,"--ez","navigation","true")
  start=time.monotonic()
  while time.monotonic()-start<20:
   out=logs()
   if "HEALTH provider="+provider+" state=running" in "\n".join(out.splitlines()[-300:]):break
   time.sleep(1)
  old=adb("shell","pidof",provider).strip();assert old.isdigit()
  adb("shell","input","keyevent","223");time.sleep(2)
  power=adb("shell","dumpsys","power");assert "mWakefulness=Asleep" in power
  marker="RECOVERY_KILL "+provider+" "+old;adb("shell","log","-t","StartupCase",marker);adb("shell","kill","-9",old)
  ready=False;start=time.monotonic();new=""
  while time.monotonic()-start<35:
   adb("shell","am broadcast --include-stopped-packages -n 'org.ungoogled.android.apps.maps.microg/nl.johninnl.startup.probe.Probe$Health' --es provider "+provider)
   out=logs();recent=out[out.rfind(marker):]
   if any("PASSIVE_HEALTH provider="+provider+" state=running" in line and "audio_muted=true" in line for line in recent.splitlines()):
    new=adb("shell","pidof",provider).strip();ready=new!=old;break
   time.sleep(1)
  (a.output/(provider+".log")).write_text(out);(a.output/(provider+"-power.txt")).write_text(power)
  tasks=adb("shell","dumpsys","activity","activities");(a.output/(provider+"-activities.txt")).write_text(tasks)
  no_ui=not any("packageName="+x in tasks for x in ["com.waze","nl.flitsmeister"])
  result={"provider":provider,"screen_off":True,"old_pid":old,"new_pid":new,"native_ready":ready,"provider_audio_muted":ready,"provider_activities_absent":no_ui,"seconds":round(time.monotonic()-start,2)}
  results.append(result);print(json.dumps(result),flush=True);(a.output/"results.json").write_text(json.dumps(results,indent=2)+"\n")
  if not(ready and no_ui):raise SystemExit("Recovery failed: "+provider)
finally:adb("shell","input","keyevent","224")
