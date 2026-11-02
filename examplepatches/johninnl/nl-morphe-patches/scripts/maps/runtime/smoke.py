#!/usr/bin/env python3
"""Replay synthetic observations into a patched Maps consumer on an explicitly selected rooted emulator.

Checks consumer IPC, field lifetimes and real phone views; it does not validate native Waze/Flitsmeister exporters or driving accuracy.
"""
import argparse
import json
from pathlib import Path
import re
import subprocess
import time
from xml.sax.saxutils import escape

TARGET="org.ungoogled.android.apps.maps"
PACKAGES={"waze":"com.waze","flitsmeister":"nl.flitsmeister","consumer":"nl.johninnl.mapsconsumerprobe"}

class Smoke:
    def __init__(self,args):
        self.args=args;self.adb=str(args.sdk/"platform-tools/adb");self.out=args.out;self.out.mkdir(parents=True,exist_ok=True)
        self.pref=f"/data/user/0/{TARGET}/shared_prefs/ungoogled_ui.xml"
    def command(self,*args,check=True):
        return subprocess.run([self.adb,"-s",self.args.serial,*map(str,args)],capture_output=True,text=True,check=check)
    def shell(self,*args,**kwargs):return self.command("shell",*args,**kwargs)
    def audit_install(self):
        if not self.args.serial.startswith("emulator-"):raise RuntimeError("Only explicitly selected Android emulators are supported")
        if self.shell("id","-u").stdout.strip()!="0":raise RuntimeError("Run adb -s SERIAL root before this task-scoped smoke")
        if int(self.shell("getprop","ro.build.version.sdk").stdout)<34:raise RuntimeError("API34+ required for authenticated sender test")
        self.command("shell","pm","path",TARGET)
        for name,package in PACKAGES.items():
            present=self.shell("pm","path",package,check=False)
            if present.returncode==0:
                info=self.shell("dumpsys","package",package).stdout
                if "versionName=maps-consumer-replay-1" not in info:raise RuntimeError("Refusing to replace an existing non-test "+package)
            self.command("install","-r",self.args.probes/name/"probe.apk")
        uid=self.shell("stat","-c","%u:%g",f"/data/user/0/{TARGET}").stdout.strip();self.uid=uid
        old=self.command("exec-out","cat",self.pref,check=False)
        self.original=old.stdout if old.returncode==0 else None
        (self.out/"preferences-before.xml").write_text(self.original or "<map/>")
    def select(self,source):
        self.shell("am","force-stop",TARGET)
        # Android's serializer permits control-character references that XML1.0
        # parsers reject. Preserve every unrelated byte and replace only test keys.
        original=self.original or "<map></map>"
        updates={"external_navigation_source":("string",source),"external_navigation_widget":("boolean","true"),"waze_alerts_map":("boolean","true"),"waze_alerts_chime":("boolean","true"),"waze_alerts_kinds":("int","511")}
        inserts=[]
        for name,(kind,value) in updates.items():
            pattern=r'<(string|boolean|int)\b[^>]*\bname="'+re.escape(name)+r'"[^>]*(?:/>|>.*?</\1>)'
            original=re.sub(pattern,"",original,flags=re.DOTALL)
            inserts.append('<string name="'+name+'">'+escape(value)+'</string>' if kind=="string" else '<'+kind+' name="'+name+'" value="'+value+'"/>')
        if "</map>" not in original:raise RuntimeError("Unexpected Android preference carrier")
        local=self.out/"preferences-test.xml";local.write_text(original.replace("</map>","\n"+"\n".join(inserts)+"\n</map>"))
        self.command("push",local,"/data/local/tmp/maps-replay-prefs.xml")
        self.shell("mkdir","-p",f"/data/user/0/{TARGET}/shared_prefs")
        self.shell("cp","/data/local/tmp/maps-replay-prefs.xml",self.pref)
        self.shell("chown",self.uid,self.pref);self.shell("chmod","660",self.pref);self.shell("restorecon",self.pref)
    def publisher(self,package,scenario,duration=40000,claimed=None):
        args=["am","start","-n",package+"/nl.johninnl.mapsreplay.ReplayActivity","--es","scenario",scenario,"--es","target",TARGET,"--el","duration_ms",str(duration)]
        if claimed:args += ["--es","claimed_source",claimed]
        self.shell(*args)
    def sample_case(self,name,source,scenario,expected,hold=12000,claimed=None,stop_after=None):
        self.select(source)
        self.command("logcat","-c")
        for package in ["com.waze","nl.flitsmeister"]:self.shell("am","force-stop",package)
        package="com.waze" if source in ["com.waze","waze_bridge"] else "nl.flitsmeister"
        self.publisher(package,scenario,duration=hold+30000,claimed=claimed)
        command=[self.adb,"-s",self.args.serial,"shell","am","instrument","-w","-r","-e","hold_ms",str(hold),"nl.johninnl.mapsconsumerprobe/nl.johninnl.mapsconsumerprobe.MapsConsumerProbe"]
        path=self.out/(name+".log")
        with path.open("w") as log:
            process=subprocess.Popen(command,stdout=log,stderr=subprocess.STDOUT)
            deadline=time.monotonic()+75;captured=False;stopped=False;cleared_at=None
            while process.poll() is None:
                text=path.read_text();rows=[]
                for line in text.splitlines():
                    if "MAPS_CONSUMER_SAMPLE " in line:
                        try:rows.append(json.loads(line.split("MAPS_CONSUMER_SAMPLE ",1)[1]))
                        except json.JSONDecodeError:pass
                if name=="waze-zone-clear" and cleared_at is None and len(rows)>=4 and rows[-1].get("zoneActive") and rows[-1].get("native_injected_items")==2:
                    active=subprocess.run([self.adb,"-s",self.args.serial,"exec-out","screencap","-p"],capture_output=True,check=True)
                    (self.out/(name+"-active.png")).write_bytes(active.stdout)
                    self.publisher(package,"clear",duration=30000);cleared_at=len(rows)
                capture_at=cleared_at+4 if name=="waze-zone-clear" and cleared_at is not None else 16 if stop_after is not None else 4
                if len(rows)>=capture_at and not captured and (name!="waze-zone-clear" or cleared_at is not None):
                    image=subprocess.run([self.adb,"-s",self.args.serial,"exec-out","screencap","-p"],capture_output=True,check=True)
                    (self.out/(name+".png")).write_bytes(image.stdout);captured=True
                if stop_after is not None and len(rows)>=stop_after and not stopped:self.shell("am","force-stop",package);stopped=True
                if time.monotonic()>deadline:process.terminate();raise RuntimeError("Probe timed out: "+name)
                time.sleep(.5)
        rows=[]
        for line in path.read_text().splitlines():
            if "MAPS_CONSUMER_SAMPLE " in line:
                try:rows.append(json.loads(line.split("MAPS_CONSUMER_SAMPLE ",1)[1]))
                except json.JSONDecodeError:pass
        if not rows:raise RuntimeError("No consumer snapshots: "+name+"; inspect "+str(path))
        final=rows[-1]
        logcat=self.command("logcat","-d").stdout
        (self.out/(name+"-logcat.txt")).write_text(logcat)
        if any(token in logcat for token in ["java.lang.VerifyError", "IllegalAccessError", "FATAL EXCEPTION", "Fatal signal", "am_crash"]):raise AssertionError("Runtime fatal/verifier error in "+name+"; inspect logcat")
        if "MAPS_CONSUMER_RESULT PASS" not in path.read_text():raise AssertionError("Probe did not finish successfully: "+name)
        for key,value in expected.items():
            if final.get(key)!=value:raise AssertionError(f"{name}: {key}: expected {value!r}, got {final.get(key)!r}")
        if name=="waze-zone-clear":
            if not any(row.get("zoneActive") and row.get("native_injected_items")==2 and row.get("currentKmh")==82 and row.get("averageKmh")==90 and row.get("warning_announced_count",0)>0 for row in rows):raise AssertionError("Waze active phase never reached the native renderer")
        if name=="zone":
            if final.get("native_injected_items",0)<2:raise AssertionError("Road alerts never reached native generator list")
            if not final.get("map_generator_bound"):raise AssertionError("Native map label generator never bound")
            if final.get("warning_announced_count",0)<1:raise AssertionError("Ahead warning never announced")
        if final.get("selected")!=source:raise AssertionError("Wrong selected provider")
        report={"case":name,"passed":True,"sample_count":len(rows),"final":final,"evidence_boundary":"controlled consumer replay; no native provider or road evidence"}
        (self.out/(name+".json")).write_text(json.dumps(report,indent=2));print(json.dumps(report),flush=True);return report
    def restore(self):
        self.shell("am","force-stop",TARGET)
        if self.original is None:self.shell("rm","-f",self.pref)
        else:
            path=self.out/"preferences-before.xml";self.command("push",path,"/data/local/tmp/maps-replay-restore.xml");self.shell("cp","/data/local/tmp/maps-replay-restore.xml",self.pref);self.shell("chown",self.uid,self.pref);self.shell("chmod","660",self.pref);self.shell("restorecon",self.pref)
        if not self.args.keep_probes:
            for package in PACKAGES.values():self.command("uninstall",package,check=False)

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument("--sdk",type=Path,required=True);parser.add_argument("--serial",required=True);parser.add_argument("--probes",type=Path,required=True);parser.add_argument("--out",type=Path,required=True);parser.add_argument("--keep-probes",action="store_true");parser.add_argument("--case",choices=["unknown","zone","waze-zone-clear","zero","malformed","clear","legacy","expiry","spoof","all"],default="all")
    args=parser.parse_args();smoke=Smoke(args);smoke.audit_install();reports=[]
    cases=[("unknown","nl.flitsmeister","unknown",{"external":False,"zoneActive":False,"alerts_count":0,"native_injected_items":0}), ("zone","nl.flitsmeister","zone",{"external":True,"zoneActive":True,"averageKmh":90,"currentKmh":82,"limitKmh":90,"map_adapter_items":2,"compact_attached":True,"map_generator_bound":True}), ("waze-zone-clear","com.waze","zone",{"external":False,"zoneActive":False,"averageKmh":None,"currentKmh":None,"limitKmh":None,"alerts_count":0,"map_adapter_items":0,"native_injected_items":0}), ("zero","com.waze","zero",{"external":True,"zoneActive":False,"currentKmh":0}), ("malformed","nl.flitsmeister","malformed",{"external":True,"zoneActive":False,"alerts_count":0,"map_adapter_items":0,"native_injected_items":0}), ("clear","nl.flitsmeister","clear",{"external":False,"zoneActive":False,"alerts_count":0,"native_injected_items":0}), ("legacy","waze_bridge","legacy",{"registered":False,"legacy_count":2,"map_adapter_items":2,"native_injected_items":2}), ("expiry","nl.flitsmeister","zone",{"external":False,"zoneActive":False,"alerts_count":0,"map_adapter_items":0,"native_injected_items":0}), ("spoof","com.waze","zone",{"external":False,"zoneActive":False,"alerts_count":0,"native_injected_items":0})]
    try:
        for name,source,scenario,expected in cases:
            if args.case not in [name,"all"]:continue
            reports.append(smoke.sample_case(name,source,scenario,expected,hold=22000 if name=="expiry" else 16000 if name=="waze-zone-clear" else 9000,claimed="nl.flitsmeister" if name=="spoof" else None,stop_after=4 if name=="expiry" else None))
        (args.out/"summary.json").write_text(json.dumps(reports,indent=2))
    finally:smoke.restore()
if __name__=="__main__":main()
