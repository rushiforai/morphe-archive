"""Run actual Flitsmeister callback bodies on ART with synthetic dependencies.

The probe installs no application and reads no app data. Its isolated shell DEX
tests callback delegation and continuation results, not a real car or scheduler.
"""
import argparse
import os
from pathlib import Path
import re
import tempfile
import textwrap
import uuid

from run_npo_runtime import ROOT, run
import flitsmeister_media_fixtures
import flitsmeister_platform_fixtures
import flitsmeister_ui_fixtures

SOURCE = ROOT / 'patches/src/main/kotlin/patches/flitsmeister/RuntimeCallbacks.kt'
CALLBACKS = {
    'car': dict(constant='carConnectionCallbackCode',
                owner='androidx/car/app/connection/CarConnectionTypeLiveData$CarConnectionBroadcastReceiver',
                signature='onReceive(Landroid/content/Context;Landroid/content/Intent;)V', registers=8,
                parent='android/content/BroadcastReceiver',
                fields='.field public this$0:Landroidx/car/app/connection/CarConnectionTypeLiveData;', helpers=''),
    'work': dict(constant='continuationWorkCode', owner='androidx/work/impl/workers/CombineContinuationsWorker',
                 signature='doWork()Landroidx/work/ListenableWorker$Result;', registers=6,
                 parent='androidx/work/Worker', fields='', helpers=''),
}


def body(args, name):
    spec = CALLBACKS[name]
    constant, owner, signature = [spec[key] for key in ('constant', 'owner', 'signature')]
    if args.decoded:
        paths = list(args.decoded.glob(f'smali*/{owner}.smali'))
        assert len(paths) == 1, f'Expected one callback owner: {owner}'
        match = re.search(r'^\.method[^\n]* ' + re.escape(signature) +
                          r'\n(.*?)^\.end method', paths[0].read_text(), re.M | re.S)
        assert match, f'Missing emitted callback: {owner}->{signature}'
        return re.sub(r'^\s*\.(?:locals|registers)\s+\d+[^\n]*\n', '', match[1], flags=re.M).strip()
    match = re.search(r'val\s+' + constant + r'\s*=\s*"""(.*?)"""\.trimIndent\(\)',
                      SOURCE.read_text(), re.S)
    assert match, f'Missing production callback body: {constant}'
    return textwrap.dedent(match[1]).strip().replace("${'$'}", '$')


JAVA = {
    'com/pairip/VMRunner.java': '''package com.pairip;
public class VMRunner { public static int calls;
 public static Object invoke(String asset,Object[] args){calls++;return null;} }''',
    'androidx/car/app/connection/CarConnectionTypeLiveData.java': '''package androidx.car.app.connection;
public class CarConnectionTypeLiveData { public int queries; public RuntimeException failure;
 public void queryForState(){if(failure!=null)throw failure;queries++;} }''',
    'androidx/car/app/connection/CarConnectionTypeLiveData$CarConnectionBroadcastReceiver.java': '''package androidx.car.app.connection;
public class CarConnectionTypeLiveData$CarConnectionBroadcastReceiver extends android.content.BroadcastReceiver {
 public CarConnectionTypeLiveData this$0;
 public void onReceive(android.content.Context context,android.content.Intent intent){} }''',
    'androidx/work/Data.java': '''package androidx.work;
public final class Data { public final String payload; public Data(String payload){this.payload=payload;} }''',
    'androidx/work/ListenableWorker.java': '''package androidx.work;
public abstract class ListenableWorker { public Data input;
 public Data getInputData(){return input;}
 public static class Result { public final Data output; Result(Data output){this.output=output;}
  public static Result success(Data output){if(output==null)throw new NullPointerException("output");return new Result(output);} } }''',
    'androidx/work/Worker.java': '''package androidx.work;
public abstract class Worker extends ListenableWorker { public abstract Result doWork(); }''',
    'androidx/work/impl/workers/CombineContinuationsWorker.java': '''package androidx.work.impl.workers;
public class CombineContinuationsWorker extends androidx.work.Worker {
 public androidx.work.ListenableWorker.Result doWork(){return null;} }''',
    'FlitsmeisterRuntimeProbe.java': '''
public class FlitsmeisterRuntimeProbe {
 static int cases;
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
 interface Test {void run();}
 static void test(String name,Test code){code.run();cases++;System.out.println("PASS "+name);}
 static androidx.car.app.connection.CarConnectionTypeLiveData$CarConnectionBroadcastReceiver receiver(
   androidx.car.app.connection.CarConnectionTypeLiveData owner){
  androidx.car.app.connection.CarConnectionTypeLiveData$CarConnectionBroadcastReceiver r=
   new androidx.car.app.connection.CarConnectionTypeLiveData$CarConnectionBroadcastReceiver();
  r.this$0=owner;return r;
 }
 static void car(){
  test("car broadcast refreshes connection state",()->{
   androidx.car.app.connection.CarConnectionTypeLiveData owner=new androidx.car.app.connection.CarConnectionTypeLiveData();
   receiver(owner).onReceive(null,new android.content.Intent("fixture.changed"));
   check(owner.queries==1,"car broadcast did not request current connection state");
  });
  test("repeated and null-input broadcasts still refresh",()->{
   androidx.car.app.connection.CarConnectionTypeLiveData owner=new androidx.car.app.connection.CarConnectionTypeLiveData();
   androidx.car.app.connection.CarConnectionTypeLiveData$CarConnectionBroadcastReceiver r=receiver(owner);
   r.onReceive(null,null);r.onReceive(null,new android.content.Intent("unrelated"));r.onReceive(null,null);
   check(owner.queries==3,"connection refresh was skipped or duplicated");
  });
  test("connection provider error is preserved",()->{
   androidx.car.app.connection.CarConnectionTypeLiveData owner=new androidx.car.app.connection.CarConnectionTypeLiveData();
   RuntimeException expected=new IllegalStateException("provider failure");owner.failure=expected;
   try{receiver(owner).onReceive(null,null);throw new AssertionError("provider failure swallowed");}
   catch(RuntimeException actual){check(actual==expected,"provider failure replaced");}
  });
 }
 static void work(){
  test("continuation returns success carrying its input",()->{
   androidx.work.impl.workers.CombineContinuationsWorker worker=new androidx.work.impl.workers.CombineContinuationsWorker();
   androidx.work.Data input=new androidx.work.Data("fixture: payload + Unicode 東京");worker.input=input;
   androidx.work.ListenableWorker.Result result=worker.doWork();
   check(result!=null,"WorkManager continuation returned null");
   check(result.output==input,"WorkManager continuation lost or replaced input Data");
  });
  test("empty continuation input remains a real success",()->{
   androidx.work.impl.workers.CombineContinuationsWorker worker=new androidx.work.impl.workers.CombineContinuationsWorker();
   androidx.work.Data input=new androidx.work.Data("");worker.input=input;
   androidx.work.ListenableWorker.Result result=worker.doWork();
   check(result!=null&&result.output==input,"empty input was discarded or treated as failure");
  });
 }
 public static void main(String[] args){
  try{
   if(args[0].equals("car")||args[0].equals("all"))car();
   if(args[0].equals("work")||args[0].equals("all"))work();
   check(com.pairip.VMRunner.calls==0,"functional callback still dispatches into disabled VM");
   System.out.println("PASS: "+cases+" Flitsmeister runtime behavior cases");
  }catch(Throwable failure){failure.printStackTrace();System.exit(1);}
 }
}
''',
}

CASES = {'car': 'car()', 'work': 'work()'}
probe = JAVA['FlitsmeisterRuntimeProbe.java'].split(' public static void main', 1)[0]
for fixture in (flitsmeister_media_fixtures, flitsmeister_platform_fixtures, flitsmeister_ui_fixtures):
    assert not CALLBACKS.keys() & fixture.CALLBACKS.keys(), 'Duplicate callback fixture'
    assert not JAVA.keys() & fixture.JAVA.keys(), 'Duplicate Java fixture'
    CALLBACKS.update(fixture.CALLBACKS)
    JAVA.update(fixture.JAVA)
    CASES.update(fixture.CASES)
    probe += fixture.PROBE_MEMBERS
dispatch = '\n'.join(
    f'  if(args[0].equals("{name}")||args[0].equals("all"))try{{{call.rstrip(";")};}}'
    'catch(Throwable failure){failures++;System.err.println("FAIL GROUP ' + name + '");failure.printStackTrace();}'
    for name, call in CASES.items())
JAVA['FlitsmeisterRuntimeProbe.java'] = probe + '''
 public static void main(String[] args){int failures=0;
''' + dispatch + '''
  if(com.pairip.VMRunner.calls!=0){failures++;System.err.println("FAIL: functional callback still dispatches into disabled VM");}
  if(failures!=0){System.err.println("FAIL: "+failures+" Flitsmeister callback groups");System.exit(1);}
  System.out.println("PASS: "+cases+" Flitsmeister runtime behavior cases");
 }
}
'''


def target(owner, signature, registers, code, parent, fields):
    return f'''.class public L{owner};
.super L{parent};
{fields}
.method public constructor <init>()V
 .registers 1
 invoke-direct {{p0}}, L{parent};-><init>()V
 return-void
.end method
.method public {signature}
 .registers {registers}
{code}
.end method
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--decoded', type=Path)
    parser.add_argument('--case', choices=[*CALLBACKS, 'all'], default='all')
    parser.add_argument('--sdk', type=Path, default=Path(os.environ.get('ANDROID_HOME', Path.home() / 'Library/Android/sdk')))
    parser.add_argument('--java-home', required=True, type=Path)
    parser.add_argument('--morphe-jar', required=True, type=Path)
    args = parser.parse_args()
    android_jar = max((args.sdk / 'platforms').glob('android-*/android.jar'),
                      key=lambda p: tuple(map(int, re.findall(r'\d+', p.parent.name))))
    d8 = sorted((args.sdk / 'build-tools').glob('*/d8'))[-1]
    adb = args.sdk / 'platform-tools/adb'
    assert run([adb, '-s', args.serial, 'get-state']).strip() == 'device'
    with tempfile.TemporaryDirectory(prefix='flitsmeister-callback-art-') as directory:
        root = Path(directory)
        src, classes, smali, dex = [root / name for name in ('src', 'classes', 'smali', 'dex')]
        for path in (src, classes, smali, dex):
            path.mkdir()
        for name, source in JAVA.items():
            p = src / name
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_text(source)
        run([args.java_home / 'bin/javac', '-source', '8', '-target', '8', '-cp', android_jar,
             '-d', classes, *src.rglob('*.java')])
        for name, spec in CALLBACKS.items():
            if args.case not in {'all', name}:
                continue
            owner, signature, registers = [spec[key] for key in ('owner', 'signature', 'registers')]
            (classes / (owner + '.class')).unlink()
            code = target(owner, signature, registers, body(args, name), spec['parent'], spec['fields'])
            (smali / (name + '.smali')).write_text(code + '\n' + spec.get('helpers', ''))
        actual = root / 'actual.dex'
        run([args.java_home / 'bin/java', '-cp', args.morphe_jar, 'com.android.tools.smali.smali.Main',
             'assemble', '--output', actual, smali])
        run([d8, '--min-api', '32', '--lib', android_jar, '--output', dex,
             actual, *classes.rglob('*.class')], env=dict(os.environ, JAVA_HOME=str(args.java_home)))
        files = list(dex.glob('*.dex'))
        assert len(files) == 1
        remote = f'/data/local/tmp/flitsmeister-callback-{uuid.uuid4().hex}.dex'
        try:
            run([adb, '-s', args.serial, 'push', files[0], remote])
            result = run([adb, '-s', args.serial, 'shell', f'CLASSPATH={remote}',
                          'app_process', '/system/bin', 'FlitsmeisterRuntimeProbe', args.case], timeout=60)
            print(result, end='')
            assert 'Flitsmeister runtime behavior cases' in result
        finally:
            run([adb, '-s', args.serial, 'shell', 'rm', '-f', remote])


if __name__ == '__main__':
    main()
