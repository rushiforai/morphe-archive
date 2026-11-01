"""Run actual NPO callback prefixes against synthetic dependencies on a spare ART device.

This optional harness never installs an APK or touches an application's data.
The default source mode tests instruction prefixes. --decoded tests the emitted
method bodies, including exception tables and the retained original VM tails.
"""
import argparse
import os
from pathlib import Path
import re
import subprocess
import tempfile
import textwrap
import uuid

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'patches/src/main/kotlin/patches/npostarttv/RuntimeCallbacks.kt'


def prefixes(source=SOURCE, names=('appAuthDiscoveryCode', 'networkAudioReceiverCode')):
    assert source.is_file(), f'Missing production callback implementation: {source}'
    source = source.read_text()
    result = {}
    for name in names:
        match = re.search(r'val\s+' + name + r'\s*=\s*"""(.*?)"""\.trimIndent\(\)', source, re.S)
        assert match, f'Missing actual instruction prefix: {name}'
        result[name] = textwrap.dedent(match[1]).strip().replace("${'$'}", '$')
    return result


def decoded_bodies(root):
    contracts = {
        'appAuthDiscoveryCode': ('nl/npo/player/library/zt/j',
                                'doInBackground([Ljava/lang/Object;)Ljava/lang/Object;'),
        'networkAudioReceiverCode': ('nl/npo/player/library/l6/v',
                                     'onReceive(Landroid/content/Context;Landroid/content/Intent;)V'),
    }
    result = {}
    for name, (owner, signature) in contracts.items():
        paths = list(root.glob(f'smali*/{owner}.smali'))
        assert len(paths) == 1, f'Expected one decoded target: {owner}, found {paths}'
        text = paths[0].read_text()
        matches = re.findall(r'^\.method[^\n]* ' + re.escape(signature) +
                             r'\n(.*?)^\.end method', text, re.M | re.S)
        assert len(matches) == 1, f'Expected one decoded callback: {owner}->{signature}'
        body = matches[0]
        body, count = re.subn(r'^\s*\.(?:locals|registers)\s+\d+[^\n]*\n', '', body, flags=re.M)
        assert count == 1, f'Expected one register declaration: {owner}->{signature}'
        result[name] = body.strip()
    return result


# These are original synthetic fixtures, not extracted publisher code. Only the
# two callback bodies below come directly from the production patch source.
JAVA = {
    'com/pairip/VMRunner.java': '''package com.pairip;
public class VMRunner { public static Object invoke(String name,Object[] arguments) {
 throw new AssertionError("Original VM tail became reachable: "+name); } }''',
    'nl/npo/player/library/l6/v.java': '''package nl.npo.player.library.l6;
public class v { public int a; public Object b;
 public void onReceive(android.content.Context c, android.content.Intent i) {} }''',
    'nl/npo/player/library/l6/w.java': '''package nl.npo.player.library.l6;
public class w { public Object c; public w(Object executor){c=executor;} }''',
    'io/sentry/i7.java': '''package io.sentry;
public class i7 implements Runnable {
 public final int discriminator; public final Object receiver, context;
 public static int runs; public i7(int d,Object r,Object c){discriminator=d;receiver=r;context=c;}
 public void run(){runs++;} }''',
    'nl/npo/player/library/su/b.java': '''package nl.npo.player.library.su;
public class b { public final java.util.concurrent.CopyOnWriteArraySet<nl.npo.player.library.gw.r> b =
 new java.util.concurrent.CopyOnWriteArraySet<>(); }''',
    'nl/npo/player/library/gw/r.java': '''package nl.npo.player.library.gw;
public class r { public b0 h; public r(b0 target){h=target;} }''',
    'nl/npo/player/library/gw/b0.java': '''package nl.npo.player.library.gw;
public class b0 { public nl.npo.player.library.jt.v0 a;
 public b0(nl.npo.player.library.jt.v0 sink){a=sink;} }''',
    'nl/npo/player/library/jt/v0.java': '''package nl.npo.player.library.jt;
public class v0 { public final java.util.List<Object> events=new java.util.ArrayList<>();
 public Runnable after; public boolean c(Object event){events.add(event);if(after!=null)after.run();return true;} }''',
    'nl/npo/player/library/ov/i.java': '''package nl.npo.player.library.ov;
public class i { public static final i a=new i(); }''',
    'nl/npo/player/library/zt/j.java': '''package nl.npo.player.library.zt;
public class j { public android.net.Uri a; public e d;
 public Object doInBackground(Object[] ignored){return null;} }''',
    'nl/npo/player/library/zt/l.java': '''package nl.npo.player.library.zt;
public class l extends Exception { public l(String field){super(field);} }''',
    'nl/npo/player/library/zt/m.java': '''package nl.npo.player.library.zt;
public class m { public static boolean fail; public final org.json.JSONObject json;
 public m(org.json.JSONObject value) throws org.json.JSONException,l {
 if(fail)throw new IllegalStateException("constructor failure"); json=value;
 if(!value.has("issuer"))throw new l("issuer"); value.getString("issuer"); } }''',
    'nl/npo/player/library/zt/k.java': '''package nl.npo.player.library.zt;
public class k { public final m discovery; public k(m value){discovery=value;} }''',
    'nl/npo/player/library/zt/e.java': '''package nl.npo.player.library.zt;
public class e extends Exception { public final int code; public static boolean fail;
 public e(int c,Throwable cause){super("fixture error",cause);code=c;}
 public static e e(e template,Exception cause){if(fail)throw new IllegalStateException("wrapping failure");
 return new e(template.code,cause);} }''',
    'nl/npo/player/library/zt/c.java': '''package nl.npo.player.library.zt;
public class c { public static final e d=new e(3,null),f=new e(5,null),a=new e(0,null); }''',
    'nl/npo/player/library/bu/a.java': '''package nl.npo.player.library.bu;
public class a { public static java.net.HttpURLConnection next;
 public static java.net.HttpURLConnection a(android.net.Uri uri) throws java.io.IOException {
 if(!"https".equals(uri.getScheme()))throw new IllegalArgumentException("HTTPS required");return next;} }''',
    'nl/npo/player/library/x80/j.java': '''package nl.npo.player.library.x80;
public class j { public static String e(java.io.InputStream input) throws java.io.IOException {
 java.io.ByteArrayOutputStream out=new java.io.ByteArrayOutputStream();byte[] block=new byte[64];int count;
 while((count=input.read(block))!=-1)out.write(block,0,count);return out.toString("UTF-8");}
 public static void b(java.io.InputStream input){if(input!=null)try{input.close();}catch(java.io.IOException ignored){}} }''',
    'NpoRuntimeProbe.java': r'''
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.net.Uri;
import java.io.*;
import java.net.*;
import java.util.*;
import java.util.concurrent.Executor;
import nl.npo.player.library.l6.v;
import nl.npo.player.library.l6.w;
import nl.npo.player.library.zt.j;
import nl.npo.player.library.zt.k;

public class NpoRuntimeProbe {
 static int cases;
 static void check(boolean condition,String message){if(!condition)throw new AssertionError(message);}
 interface Test {void run() throws Exception;}
 static void test(String name,Test body) throws Exception {
  try {body.run();cases++;System.out.println("PASS "+name);}
  catch(Exception|Error failure){System.err.println("FAIL "+name);failure.printStackTrace();throw failure;}
 }
 static class Queue implements Executor {final List<Runnable> jobs=new ArrayList<>();
  public void execute(Runnable r){jobs.add(r);}}
 static class Stream extends InputStream {
  final ByteArrayInputStream source; boolean closed,readFailure;int closes;
  Stream(String text){source=new ByteArrayInputStream(text.getBytes(java.nio.charset.StandardCharsets.UTF_8));}
  public int read() throws IOException {if(readFailure)throw new IOException("read failure");return source.read();}
  public int read(byte[] b,int off,int len) throws IOException {if(readFailure)throw new IOException("read failure");return source.read(b,off,len);}
  public void close(){closed=true;closes++;}
 }
 static class Connection extends HttpURLConnection {
  final Stream stream; boolean connected,networkFailure;
  Connection(String body) throws Exception {super(new URL("https://fixture.invalid/discovery"));stream=new Stream(body);}
  public void connect() throws IOException {connected=true;if(networkFailure)throw new IOException("network failure");}
  public InputStream getInputStream(){return stream;}
  public void disconnect(){}public boolean usingProxy(){return false;}
 }
 static j task(Connection c){nl.npo.player.library.bu.a.next=c;
  nl.npo.player.library.zt.e.fail=false;nl.npo.player.library.zt.m.fail=false;
  j task=new j();task.a=Uri.parse("https://fixture.invalid/discovery");return task;}
 static void closed(Connection c){check(c.stream.closed&&c.stream.closes==1,"stream must close exactly once");}
 static void mapped(j task,int code,Class<?> cause){check(task.d!=null&&task.d.code==code,"typed error code");
  check(cause.isInstance(task.d.getCause()),"original error cause");}
 static v noisy(nl.npo.player.library.su.b owner){v receiver=new v();receiver.a=1;receiver.b=owner;return receiver;}
 static nl.npo.player.library.gw.r listener(nl.npo.player.library.jt.v0 sink){
  return new nl.npo.player.library.gw.r(new nl.npo.player.library.gw.b0(sink));}
 static final String VALID="{\"issuer\":\"https://fixture.invalid\",\"authorization_endpoint\":\"https://fixture.invalid/auth\",\"token_endpoint\":\"https://fixture.invalid/token\"}";
 public static void main(String[] args) throws Exception {
  if(android.os.Looper.getMainLooper()==null)android.os.Looper.prepareMainLooper();
  final Context context=new ContextWrapper(null);
  test("network dispatch is queued and preserves receiver/context",()->{
   Queue queue=new Queue();v receiver=new v();receiver.a=0;receiver.b=new w(queue);
   receiver.onReceive(context,new Intent("fixture.NETWORK"));
   check(queue.jobs.size()==1&&io.sentry.i7.runs==0,"one queued task, not synchronous");
   io.sentry.i7 job=(io.sentry.i7)queue.jobs.get(0);
   check(job.discriminator==12&&job.receiver==receiver&&job.context==context,"network runnable contract");
   job.run();check(io.sentry.i7.runs==1,"queued runnable remains executable");
  });
  test("unrelated audio action ignored",()->{
   nl.npo.player.library.su.b owner=new nl.npo.player.library.su.b();
   nl.npo.player.library.jt.v0 sink=new nl.npo.player.library.jt.v0();owner.b.add(listener(sink));
   noisy(owner).onReceive(context,new Intent("fixture.OTHER"));check(sink.events.isEmpty(),"unrelated event delivered");
  });
  test("null audio action ignored",()->{
   nl.npo.player.library.su.b owner=new nl.npo.player.library.su.b();
   nl.npo.player.library.jt.v0 sink=new nl.npo.player.library.jt.v0();owner.b.add(listener(sink));
   noisy(owner).onReceive(context,new Intent());check(sink.events.isEmpty(),"null action delivered");
  });
  test("all noisy listeners receive same singleton once",()->{
   nl.npo.player.library.su.b owner=new nl.npo.player.library.su.b();
   nl.npo.player.library.jt.v0 first=new nl.npo.player.library.jt.v0(),second=new nl.npo.player.library.jt.v0();
   owner.b.add(listener(first));owner.b.add(listener(second));
   noisy(owner).onReceive(context,new Intent("android.media.AUDIO_BECOMING_NOISY"));
   check(first.events.size()==1&&second.events.size()==1,"listener delivery count");
   check(first.events.get(0)==nl.npo.player.library.ov.i.a&&second.events.get(0)==first.events.get(0),"event identity");
  });
  test("noisy listener iteration uses stable snapshot",()->{
   final nl.npo.player.library.su.b owner=new nl.npo.player.library.su.b();
   nl.npo.player.library.jt.v0 first=new nl.npo.player.library.jt.v0(),second=new nl.npo.player.library.jt.v0(),late=new nl.npo.player.library.jt.v0();
   final nl.npo.player.library.gw.r secondListener=listener(second),lateListener=listener(late);
   first.after=()->{owner.b.remove(secondListener);owner.b.add(lateListener);};
   owner.b.add(listener(first));owner.b.add(secondListener);
   noisy(owner).onReceive(context,new Intent("android.media.AUDIO_BECOMING_NOISY"));
   check(first.events.size()==1&&second.events.size()==1&&late.events.isEmpty(),"snapshot changed mid-delivery");
  });
  test("valid discovery returns configuration and closes",()->{
   Connection c=new Connection(VALID);j t=task(c);Object result=t.doInBackground(new Object[0]);
   check(result instanceof k&&t.d==null,"real config result");
   check(((k)result).discovery.json.getString("issuer").equals("https://fixture.invalid"),"discovery preserved");
   check(c.connected&&c.getDoInput()&&"GET".equals(c.getRequestMethod()),"GET input connection");closed(c);
  });
  test("network failure maps to network error",()->{
   Connection c=new Connection(VALID);c.networkFailure=true;j t=task(c);
   check(t.doInBackground(new Object[0])==null,"network result");mapped(t,3,IOException.class);
   check(!c.stream.closed,"unopened stream should not be closed");
  });
  test("read failure maps and closes",()->{
   Connection c=new Connection(VALID);c.stream.readFailure=true;j t=task(c);
   check(t.doInBackground(new Object[0])==null,"read result");mapped(t,3,IOException.class);closed(c);
  });
  test("malformed JSON maps and closes",()->{
   Connection c=new Connection("{broken");j t=task(c);
   check(t.doInBackground(new Object[0])==null,"JSON result");mapped(t,5,org.json.JSONException.class);closed(c);
  });
  test("missing discovery field maps and closes",()->{
   Connection c=new Connection("{}");j t=task(c);
   check(t.doInBackground(new Object[0])==null,"missing field result");mapped(t,0,nl.npo.player.library.zt.l.class);closed(c);
  });
  test("unexpected constructor failure closes and rethrows",()->{
   Connection c=new Connection(VALID);j t=task(c);nl.npo.player.library.zt.m.fail=true;
   try {t.doInBackground(new Object[0]);throw new AssertionError("unexpected failure swallowed");}
   catch(IllegalStateException expected){check("constructor failure".equals(expected.getMessage()),"original throwable");}
   closed(c);
  });
  test("error wrapping failure closes and rethrows",()->{
   Connection c=new Connection("{broken");j t=task(c);nl.npo.player.library.zt.e.fail=true;
   try {t.doInBackground(new Object[0]);throw new AssertionError("wrapping failure swallowed");}
   catch(IllegalStateException expected){check("wrapping failure".equals(expected.getMessage()),"original wrapper failure");}
   closed(c);
  });
  check(cases==12,"missing behavior case");System.out.println("PASS: "+cases+" NPO runtime behavior cases");
 }
}
''',
}


def wrapper(owner, fields, method, registers, code):
    return f'''\n.class public L{owner};
.super Ljava/lang/Object;
{fields}
.method public constructor <init>()V
    .registers 1
    invoke-direct {{p0}}, Ljava/lang/Object;-><init>()V
    return-void
.end method
.method public {method}
    .registers {registers}
{textwrap.indent(code, '    ')}
.end method
'''


def run(command, **kwargs):
    completed = subprocess.run([str(x) for x in command], text=True, capture_output=True, **kwargs)
    if completed.returncode:
        raise RuntimeError(f'Command failed ({completed.returncode}): {command[0]}\n{completed.stdout}\n{completed.stderr}')
    return completed.stdout


def execute(serial, code, sdk, java_home, morphe):
    java = java_home / 'bin/java'
    javac = java_home / 'bin/javac'
    platforms = sorted((sdk / 'platforms').glob('android-*/android.jar'),
                       key=lambda p: int(p.parent.name.split('-')[1].split('.')[0]))
    assert platforms, f'No Android platform found in {sdk}'
    android_jar = platforms[-1]
    versions = sorted((sdk / 'build-tools').iterdir(),
                      key=lambda p: tuple(int(x) for x in p.name.split('.') if x.isdigit()))
    d8 = next((p / 'd8' for p in reversed(versions) if (p / 'd8').is_file()), None)
    assert d8, f'No d8 compiler found in {sdk}'
    adb = sdk / 'platform-tools/adb'
    assert run([adb, '-s', serial, 'get-state']).strip() == 'device', 'Spare device is not connected'
    with tempfile.TemporaryDirectory(prefix='npo-art-contracts-') as temporary:
        root = Path(temporary)
        sources, classes, smali, output = (root / name for name in ('src', 'classes', 'smali', 'dex'))
        for folder in (sources, classes, smali, output):
            folder.mkdir()
        for name, source in JAVA.items():
            path = sources / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source)
        run([javac, '-source', '8', '-target', '8', '-cp', android_jar,
             '-d', classes, *sources.rglob('*.java')])
        for owner in ('l6/v', 'zt/j'):
            (classes / f'nl/npo/player/library/{owner}.class').unlink()
        (smali / 'v.smali').write_text(wrapper('nl/npo/player/library/l6/v',
            '.field public a:I\n.field public b:Ljava/lang/Object;',
            'onReceive(Landroid/content/Context;Landroid/content/Intent;)V', 8,
            code['networkAudioReceiverCode']))
        (smali / 'j.smali').write_text(wrapper('nl/npo/player/library/zt/j',
            '.field public a:Landroid/net/Uri;\n.field public d:Lnl/npo/player/library/zt/e;',
            'doInBackground([Ljava/lang/Object;)Ljava/lang/Object;', 7,
            code['appAuthDiscoveryCode']))
        actual_dex = root / 'actual-prefixes.dex'
        run([java, '-cp', morphe, 'com.android.tools.smali.smali.Main', 'assemble',
             '--output', actual_dex, smali])
        environment = dict(os.environ, JAVA_HOME=str(java_home))
        run([d8, '--min-api', '24', '--lib', android_jar, '--output', output,
             actual_dex, *classes.rglob('*.class')], env=environment)
        dexes = list(output.glob('*.dex'))
        assert len(dexes) == 1, 'Expected one synthetic test DEX'
        remote = f'/data/local/tmp/npo-runtime-{uuid.uuid4().hex}.dex'
        try:
            run([adb, '-s', serial, 'push', dexes[0], remote])
            result = run([adb, '-s', serial, 'shell', f'CLASSPATH={remote}',
                          'app_process', '/system/bin', 'NpoRuntimeProbe'], timeout=60)
            print(result, end='')
            assert 'PASS: 12 NPO runtime behavior cases' in result, 'Missing complete ART result'
        finally:
            run([adb, '-s', serial, 'shell', 'rm', '-f', remote])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--serial', required=True)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument('--source', action='store_true', help='Test production source prefixes (default)')
    mode.add_argument('--decoded', type=Path, help='Test complete emitted callback bodies from this decoded APK')
    parser.add_argument('--sdk', type=Path, default=Path(os.environ.get('ANDROID_HOME', Path.home() / 'Library/Android/sdk')))
    parser.add_argument('--java-home', type=Path, default=Path(os.environ.get('JAVA_HOME', '/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home')))
    parser.add_argument('--morphe-jar', type=Path, default=ROOT / '.tools/morphe-desktop-1.19.1-all.jar')
    args = parser.parse_args()
    if args.serial != '192.168.50.89:5555' and not re.fullmatch(r'emulator-\d+', args.serial):
        parser.error('Harness requires the spare 192.168.50.89:5555 device or a local emulator')
    code = decoded_bodies(args.decoded) if args.decoded else prefixes()
    print(f'ART callback input: {args.decoded if args.decoded else SOURCE}', flush=True)
    execute(args.serial, code, args.sdk, args.java_home, args.morphe_jar)


if __name__ == '__main__':
    main()
