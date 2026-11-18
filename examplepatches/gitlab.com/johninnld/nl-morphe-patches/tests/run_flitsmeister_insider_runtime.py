"""Replay actual emitted Insider toggles on ART with an uninitialized SDK core.

Preparation only is the default. --run-art runs an isolated shell DEX, installs
no application, and reads no app data. The fixture preserves the emitted SDK
methods and j5a.b, while replacing their dependencies with observable stubs.
It reproduces !isDriving dispatch; it does not simulate GPS or a real drive.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import uuid
import zipfile


ROOT = Path(__file__).resolve().parents[1]
INSIDER = "com/useinsider/insider/Insider"
METHODS = {
    INSIDER: ["init(Landroid/app/Application;Ljava/lang/String;)V", "f()Z",
              "enableInAppMessages()V", "disableInAppMessages()V"],
    "j5a": ["b(Z)V"],
}


def extract(decoded, owner, signature):
    paths = [decoded / (owner + ".smali")]
    paths += sorted(decoded.glob("smali*/" + owner + ".smali"))
    paths = [path for path in paths if path.is_file()]
    assert len(paths) == 1, "Expected exactly one emitted owner: " + owner
    text = paths[0].read_text(encoding="utf-8")
    matches = re.findall(r"^\.method[^\n]* " + re.escape(signature) +
                         r"\n.*?^\.end method", text, re.M | re.S)
    assert len(matches) == 1, "Expected exactly one emitted method: " + owner + "->" + signature
    assert re.search(r"^\s*\.(?:registers|locals)\s+\d+", matches[0], re.M), "Missing register declaration"
    return matches[0]


def instructions(method):
    return [line.strip() for line in method.splitlines()
            if line.strip() and not line.strip().startswith((".", "#", ":"))]


def execute(arguments, log):
    result = subprocess.run([str(arg) for arg in arguments], stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT, text=True, encoding="utf-8", errors="replace")
    log.write_text(result.stdout, encoding="utf-8")
    if result.returncode:
        print(result.stdout, end="")
        raise SystemExit("Fixture step failed; see " + str(log))
    return result.stdout


STUBS = {
    "com/useinsider/insider/Insider.java": """package com.useinsider.insider;
public class Insider {
 public static final Insider Instance=new Insider(); public v a;
 public void init(android.app.Application app,String partner){} public boolean f(){return false;}
 public void enableInAppMessages(){} public void disableInAppMessages(){}
}""",
    "com/useinsider/insider/v.java": """package com.useinsider.insider;
public class v { public static int allocations,reports; public boolean q;
 public android.app.Activity d; public v(){allocations++;} public void u(Exception error){reports++;} }
""",
    "com/useinsider/insider/DebuggingTag.java": """package com.useinsider.insider;
public class DebuggingTag {
 public static final DebuggingTag disableBlockedInapp=new DebuggingTag();
 public static final DebuggingTag enableInAppMessages=new DebuggingTag();
}""",
    "com/useinsider/insider/Debugger.java": """package com.useinsider.insider;
public class Debugger { public static int calls;
 public static void a(DebuggingTag tag,int level){calls++;} }
""",
    "j5a.java": "public class j5a { public void b(boolean enabled){} }",
    "l2l.java": "public class l2l { public static boolean s=true; }",
    "hal.java": "public class hal { public static int calls; public void g(String name){calls++;} }",
    "b8l.java": """public class b8l { public static int calls; public static boolean fail;
 public static void j(String category,String message,org.json.JSONObject data,String event){
  calls++; if(fail)throw new IllegalStateException("fixture SDK logging failure");
 } }
""",
    "org/slf4j/Logger.java": "package org.slf4j; public interface Logger { void info(String message); }",
    "fha.java": """public class fha { public static int infoLogs,errorLogs;
 public static final org.slf4j.Logger LOGGER=new org.slf4j.Logger(){public void info(String value){infoLogs++;}};
 public static org.slf4j.Logger c(){return LOGGER;}
 public static void g(String message,Throwable error){errorLogs++;} }
""",
    "gb8.java": """public class gb8 { public static int calls; public static boolean fail;
 static final gb8 INSTANCE=new gb8(); public static gb8 a(){return INSTANCE;}
 public void b(String message){calls++;if(fail)throw new IllegalStateException("fixture app logging failure");} }
""",
    "FlitsmeisterInsiderProbe.java": """import com.useinsider.insider.Insider;
import com.useinsider.insider.v;
public class FlitsmeisterInsiderProbe {
 static int cases;
 interface Work {void run();}
 static void check(boolean value,String label){if(!value)throw new AssertionError(label);}
 static void pass(String label){cases++;System.out.println("PASS "+label);}
 static void coreStillNull(){check(Insider.Instance.a==null,"SDK core was allocated");
  check(v.allocations==0,"SDK initialization resumed");check(v.reports==0,"SDK error report dispatched");}
 static void state(j5a bridge,boolean driving){bridge.b(!driving);}
 static void expectedNpe(String label,String method,Work action){
  try{action.run();throw new AssertionError(label+" did not reproduce the old crash");}
  catch(NullPointerException failure){
   boolean found=false;
   for(StackTraceElement frame:failure.getStackTrace())
    if(frame.getClassName().equals("com.useinsider.insider.Insider")&&frame.getMethodName().equals(method))found=true;
   check(found,"NPE did not originate in expected Insider toggle: "+failure);
   check(String.valueOf(failure.getMessage()).contains("u(java.lang.Exception)"),
    "NPE did not match the null SDK error-handler call: "+failure);
   System.out.println("EXPECTED "+label+": "+failure);
   pass(label);
  }
 }
 static void old(j5a bridge){
  state(bridge,false);
  check(b8l.calls==1,"stationary enable did not dispatch the original SDK log");
  check(gb8.calls==1&&fha.infoLogs==1,"stationary app logging changed");
  pass("old stationary enable succeeds with null core");
  for(int i=0;i<3;i++)expectedNpe("old driving disable attempt "+i,"disableInAppMessages",()->state(bridge,true));
  b8l.fail=true;
  expectedNpe("old enable also crashes when SDK logging fails","enableInAppMessages",()->state(bridge,false));
  coreStillNull();
 }
 static void fixed(j5a bridge){
  boolean flag=l2l.s;
  for(int i=0;i<100;i++){state(bridge,false);state(bridge,true);state(bridge,false);}
  check(gb8.calls==300&&fha.infoLogs==300,"original app logging did not run for every transition");
  pass("100 stationary-driving-stationary cycles preserve app callbacks");
  b8l.fail=true;
  for(int i=0;i<100;i++){Insider.Instance.enableInAppMessages();Insider.Instance.disableInAppMessages();}
  check(b8l.calls==0,"SDK marketing logging still dispatched");
  check(com.useinsider.insider.Debugger.calls==0,"SDK debug messaging still dispatched");
  check(hal.calls==0&&l2l.s==flag,"SDK display state changed");
  pass("both emitted toggles are harmless even if SDK logging would fail");
  gb8.fail=true;
  state(bridge,true);
  check(fha.errorLogs==1,"bridge's typed application logging recovery changed");
  coreStillNull();
  pass("typed app logging recovery and disabled SDK initialization are preserved");
 }
 public static void main(String[] args){
  try{
   Insider.Instance.init(null,"fixture");coreStillNull();
   check(!Insider.Instance.f(),"SDK readiness is no longer disabled");
   j5a bridge=new j5a();
   if(args[0].equals("crash"))old(bridge);else fixed(bridge);
   System.out.println("PASS: "+cases+" Insider "+args[0]+" regression cases");
  }catch(Throwable failure){failure.printStackTrace();System.exit(1);}
 }
}
""",
}


def insider_fixture(methods):
    return """.class public Lcom/useinsider/insider/Insider;
.super Ljava/lang/Object;
.field public static final Instance:Lcom/useinsider/insider/Insider;
.field public a:Lcom/useinsider/insider/v;
.method public constructor <init>()V
 .registers 1
 invoke-direct {p0}, Ljava/lang/Object;-><init>()V
 return-void
.end method
.method static constructor <clinit>()V
 .registers 1
 new-instance v0, Lcom/useinsider/insider/Insider;
 invoke-direct {v0}, Lcom/useinsider/insider/Insider;-><init>()V
 sput-object v0, Lcom/useinsider/insider/Insider;->Instance:Lcom/useinsider/insider/Insider;
 return-void
.end method
""" + "\n\n".join(methods)


CORE = """.class public Lcom/useinsider/insider/v;
.super Ljava/lang/Object;
.field public static allocations:I
.field public static reports:I
.field public q:Z
.field public d:Landroid/app/Activity;
.field public y:Lhal;
.method public constructor <init>()V
 .registers 2
 invoke-direct {p0}, Ljava/lang/Object;-><init>()V
 sget v0, Lcom/useinsider/insider/v;->allocations:I
 add-int/lit8 v0, v0, 0x1
 sput v0, Lcom/useinsider/insider/v;->allocations:I
 return-void
.end method
.method public u(Ljava/lang/Exception;)V
 .registers 3
 sget v0, Lcom/useinsider/insider/v;->reports:I
 add-int/lit8 v0, v0, 0x1
 sput v0, Lcom/useinsider/insider/v;->reports:I
 return-void
.end method
"""


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--decoded", type=Path, required=True)
    parser.add_argument("--expect", choices=["crash", "fixed"], required=True)
    parser.add_argument("--java-home", type=Path, required=True)
    parser.add_argument("--sdk", type=Path, required=True)
    parser.add_argument("--morphe-jar", type=Path, default=ROOT / ".tools/morphe-desktop-1.19.1-all.jar")
    parser.add_argument("--output", type=Path)
    parser.add_argument("--run-art", action="store_true", help="Explicitly execute isolated fixture on the selected device")
    parser.add_argument("--serial")
    parser.add_argument("--adb", type=Path, help="Override the Android SDK's adb binary")
    args = parser.parse_args()
    if args.run_art and not args.serial:
        parser.error("--run-art requires an explicit --serial")
    output = (args.output or ROOT / "build/insider-runtime" / args.expect).resolve()
    output.mkdir(parents=True, exist_ok=True)
    methods = {owner: [extract(args.decoded, owner, signature) for signature in signatures]
               for owner, signatures in METHODS.items()}
    assert instructions(methods[INSIDER][0]) == ["return-void"], "Input must have actual disabled SDK initialization"
    assert instructions(methods[INSIDER][1])[-1] == "return v0", "Unexpected actual disabled readiness method"
    bridge = ".class public Lj5a;\n.super Ljava/lang/Object;\n" + """
.method public constructor <init>()V
 .registers 1
 invoke-direct {p0}, Ljava/lang/Object;-><init>()V
 return-void
.end method
""" + methods["j5a"][0]
    java = args.java_home / "bin" / ("java.exe" if os.name == "nt" else "java")
    javac = args.java_home / "bin" / ("javac.exe" if os.name == "nt" else "javac")
    android_jar = max((args.sdk / "platforms").glob("android-*/android.jar"),
                      key=lambda path: tuple(map(int, re.findall(r"\d+", path.parent.name))))
    d8 = max((args.sdk / "build-tools").glob("*/lib/d8.jar"),
             key=lambda path: tuple(map(int, re.findall(r"\d+", path.parent.parent.name))))
    fixture = output / "fixture.dex"
    with tempfile.TemporaryDirectory(prefix="compile-", dir=output) as temporary:
        work = Path(temporary)
        src, classes, smali, dex = [work / name for name in ("src", "classes", "smali", "dex")]
        for path in (src, classes, smali, dex):
            path.mkdir()
        for name, source in STUBS.items():
            path = src / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source, encoding="utf-8")
        execute([javac, "-encoding", "UTF-8", "-source", "8", "-target", "8", "-cp", android_jar,
                 "-d", classes, *sorted(src.rglob("*.java"))], output / "javac.log")
        for owner in (INSIDER, "com/useinsider/insider/v", "j5a"):
            (classes / (owner + ".class")).unlink()
        for name, source in {"Insider.smali": insider_fixture(methods[INSIDER]),
                             "core.smali": CORE, "bridge.smali": bridge}.items():
            (smali / name).write_text(source, encoding="utf-8")
        actual = work / "actual.dex"
        execute([java, "-cp", args.morphe_jar, "com.android.tools.smali.smali.Main", "assemble",
                 "--output", actual, smali], output / "smali.log")
        class_jar = work / "stubs.jar"
        with zipfile.ZipFile(class_jar, "w", zipfile.ZIP_DEFLATED) as jar:
            for path in sorted(classes.rglob("*.class")):
                jar.write(path, path.relative_to(classes).as_posix())
        execute([java, "-cp", d8, "com.android.tools.r8.D8", "--min-api", "32", "--lib", android_jar,
                 "--output", dex, actual, class_jar], output / "d8.log")
        assert len(list(dex.glob("*.dex"))) == 1, "Expected one isolated fixture DEX"
        shutil.copyfile(dex / "classes.dex", fixture)
    record = {"decoded": str(args.decoded.resolve()), "expect": args.expect,
              "fixture_sha256": hashlib.sha256(fixture.read_bytes()).hexdigest(),
              "methods": {owner + "->" + signature: hashlib.sha256(method.encode()).hexdigest()
                          for owner, signatures in METHODS.items()
                          for signature, method in zip(signatures, methods[owner])}}
    (output / "fixture-record.json").write_text(json.dumps(record, indent=2) + "\n", encoding="utf-8")
    print("Prepared actual-method fixture:", fixture)
    if not args.run_art:
        print("Preparation only; no device command was executed.")
        return
    adb = args.adb or args.sdk / "platform-tools" / ("adb.exe" if os.name == "nt" else "adb")
    remote = "/data/local/tmp/flitsmeister-insider-" + uuid.uuid4().hex + ".dex"
    try:
        execute([adb, "-s", args.serial, "push", fixture, remote], output / "push.log")
        result = execute([adb, "-s", args.serial, "shell", "CLASSPATH=" + remote,
                          "app_process", "/system/bin", "FlitsmeisterInsiderProbe", args.expect], output / "art.log")
        print(result, end="")
        assert "Insider " + args.expect + " regression cases" in result
    finally:
        execute([adb, "-s", args.serial, "shell", "rm", "-f", remote], output / "cleanup.log")


if __name__ == "__main__":
    main()
