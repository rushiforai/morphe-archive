"""Exercise the actual token request body on spare ART with synthetic HTTPS responses.

No package is installed and no real endpoint or token is used. --decoded tests
the emitted method, including exception tables and its retained native tail.
The original Accept and form-encoding helpers are extracted from --helpers-decoded.
"""
import argparse
import os
from pathlib import Path
import re
import tempfile
import textwrap
import uuid

from run_npo_runtime import ROOT, run, wrapper

SOURCE = ROOT / 'patches/src/main/kotlin/patches/npostarttv/TokenRequest.kt'
DEFAULT_HELPERS = Path('/tmp/re/atv-2026-10-29/npo-start/decoded')


def prefix():
    match = re.search(r'val\s+appAuthTokenRequestCode\s*=\s*"""(.*?)"""\.trimIndent\(\)',
                      SOURCE.read_text(), re.S)
    assert match, 'Missing production token instruction prefix'
    return textwrap.dedent(match[1]).strip()


def method(root, owner, signature, body_only=False):
    paths = list(root.glob(f'smali*/{owner}.smali'))
    assert len(paths) == 1, f'Expected one helper owner: {owner}'
    matches = re.findall(r'^\.method[^\n]* ' + re.escape(signature) +
                         r'\n.*?^\.end method', paths[0].read_text(), re.M | re.S)
    assert len(matches) == 1, f'Expected one method: {owner}->{signature}'
    if not body_only:
        return matches[0]
    body = matches[0].split('\n', 1)[1].rsplit('.end method', 1)[0]
    body, count = re.subn(r'^\s*\.(?:locals|registers)\s+\d+[^\n]*\n', '', body, flags=re.M)
    assert count == 1
    return body.strip()


JAVA = {
    'com/pairip/VMRunner.java': '''package com.pairip;
public class VMRunner { public static Object invoke(String asset,Object[] arguments) {
 throw new AssertionError("Original VM tail became reachable: "+asset); } }''',
    'nl/npo/player/library/zt/i.java': '''package nl.npo.player.library.zt;
public class i { public x a; public e d; public Object doInBackground(Object[] ignored){return null;} }''',
    'nl/npo/player/library/zt/x.java': '''package nl.npo.player.library.zt;
public class x { public k a=new k(); public String c="fixture-public-client";
 public java.util.HashMap<String,String> parameters=new java.util.HashMap<>();
 public java.util.HashMap<String,String> a(){return new java.util.HashMap<>(parameters);} }''',
    'nl/npo/player/library/zt/k.java': '''package nl.npo.player.library.zt;
public class k { public android.net.Uri b=android.net.Uri.parse("https://fixture.invalid/token"); }''',
    'nl/npo/player/library/zt/e.java': '''package nl.npo.player.library.zt;
public class e extends Exception { public final int code; public static boolean fail;
 public e(int code,Throwable cause){super("fixture error",cause);this.code=code;}
 public static e e(e template,Exception cause){if(fail)throw new IllegalStateException("wrapping failure");
 return new e(template.code,cause);} }''',
    'nl/npo/player/library/zt/c.java': '''package nl.npo.player.library.zt;
public class c { public static final e d=new e(3,null),f=new e(5,null); }''',
    'nl/npo/player/library/bu/a.java': '''package nl.npo.player.library.bu;
public class a { public static java.net.HttpURLConnection next;public static boolean fail;
 public static android.net.Uri opened;
 public static java.net.HttpURLConnection a(android.net.Uri uri) throws java.io.IOException {
 if(!"https".equals(uri.getScheme()))throw new IllegalArgumentException("HTTPS required");
 opened=uri;if(fail)throw new java.io.IOException("open failure");return next;} }''',
    'nl/npo/player/library/x80/j.java': '''package nl.npo.player.library.x80;
public class j { public static String e(java.io.InputStream input) throws java.io.IOException {
 java.io.ByteArrayOutputStream out=new java.io.ByteArrayOutputStream();byte[] block=new byte[64];int count;
 while((count=input.read(block))!=-1)out.write(block,0,count);return out.toString("UTF-8");}
 public static void b(java.io.InputStream input){if(input!=null)try{input.close();}catch(java.io.IOException ignored){}} }''',
    'nl/npo/player/library/kd0/d.java': '''package nl.npo.player.library.kd0;
public class d { public static void g(String message){throw new IllegalStateException(message);} }''',
    'NpoTokenProbe.java': r'''
import java.io.*;import java.net.*;import java.util.*;
import nl.npo.player.library.zt.i;import nl.npo.player.library.zt.x;
public class NpoTokenProbe {
 static int cases;
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
 interface Test {void run() throws Exception;}
 static void test(String name,Test body) throws Exception {
  try{body.run();cases++;System.out.println("PASS "+name);}
  catch(Exception|Error failure){System.err.println("FAIL "+name);failure.printStackTrace();throw failure;}}
 static class Stream extends InputStream {
  final ByteArrayInputStream source;int closes;boolean io,unexpected,closeIo;
  Stream(String body){source=new ByteArrayInputStream(body.getBytes(java.nio.charset.StandardCharsets.UTF_8));}
  public int read() throws IOException {
   if(io)throw new IOException("read failure");if(unexpected)throw new IllegalStateException("read failure");
   return source.read();}
  public void close() throws IOException {closes++;if(closeIo)throw new IOException("close failure");}
 }
 static class Connection extends HttpURLConnection {
  final Stream input,error;final ByteArrayOutputStream output=new ByteArrayOutputStream();
  int status=200,inputReads,errorReads;boolean outputIo;
  Connection(String success,String failure) throws Exception {
   super(new URL("https://fixture.invalid/token"));input=new Stream(success);error=new Stream(failure);}
  public int getResponseCode(){return status;}
  public InputStream getInputStream(){inputReads++;return input;}
  public InputStream getErrorStream(){errorReads++;return error;}
  public OutputStream getOutputStream() throws IOException {if(outputIo)throw new IOException("write failure");return output;}
  public void connect(){}public void disconnect(){}public boolean usingProxy(){return false;}
 }
 static Connection connection() throws Exception{return new Connection("{\"access_token\":\"fixture\"}","{\"error\":\"invalid_grant\"}");}
 static i task(Connection c){nl.npo.player.library.bu.a.next=c;nl.npo.player.library.bu.a.fail=false;
  nl.npo.player.library.zt.e.fail=false;i t=new i();t.a=new x();
  t.a.parameters.put("grant_type","refresh_token");t.a.parameters.put("refresh_token","fixture-refresh");return t;}
 static org.json.JSONObject execute(i t){return (org.json.JSONObject)t.doInBackground(new Object[0]);}
 static void closed(Connection c,boolean error){check(c.input.closes==(error?0:1)&&c.error.closes==(error?1:0),"selected stream closes exactly once");}
 static void unopened(Connection c){check(c.input.closes==0&&c.error.closes==0,"unopened stream closed");}
 static void mapped(i t,int code,Class<?> cause){check(t.d!=null&&t.d.code==code,"typed error mapping");
  check(cause.isInstance(t.d.getCause()),"original cause retained");}
 static void rethrows(i t,String message){try{execute(t);throw new AssertionError("unexpected failure swallowed");}
  catch(IllegalStateException expected){check(message.equals(expected.getMessage()),"original exception retained");}}
 static Map<String,String> parameters(Connection c) throws Exception {
  Map<String,String> result=new HashMap<>();for(String part:c.output.toString("UTF-8").split("&")){
   String[] item=part.split("=",2);check(result.put(item[0],URLDecoder.decode(item[1],"UTF-8"))==null,"duplicate parameter");}
  return result;}
 public static void main(String[] ignored) throws Exception {
  if(android.os.Looper.getMainLooper()==null)android.os.Looper.prepareMainLooper();
  test("real success JSON and POST contract",()->{Connection c=connection();i t=task(c);
   check("fixture".equals(execute(t).getString("access_token"))&&t.d==null,"response preserved");
   check("POST".equals(c.getRequestMethod())&&c.getDoOutput(),"POST with output");
   check("application/x-www-form-urlencoded".equals(c.getRequestProperty("Content-Type")),"content type");
   check("application/json".equals(c.getRequestProperty("Accept")),"default Accept");
   check(c.output.size()==Integer.parseInt(c.getRequestProperty("Content-Length")),"body length");
   check(t.a.a.b.equals(nl.npo.player.library.bu.a.opened),"configured endpoint");closed(c,false);});
  test("grant parameters and client ID preserved",()->{Connection c=connection();i t=task(c);
   t.a.parameters.put("code","a+b & café");t.a.parameters.put("code_verifier","proof=+-_");
   t.a.parameters.put("redirect_uri","https://fixture.invalid/cb?x=1&y=2");t.a.parameters.put("scope","openid profile");
   t.a.parameters.put("extra","東京");t.a.parameters.put("client_id","must-be-overridden");execute(t);
   Map<String,String> expected=new HashMap<>(t.a.parameters);expected.put("client_id",t.a.c);
   check(expected.equals(parameters(c)),"all parameters encoded and real client ID selected");closed(c,false);});
  test("custom Accept retained",()->{Connection c=connection();c.setRequestProperty("Accept","fixture/custom");
   execute(task(c));check("fixture/custom".equals(c.getRequestProperty("Accept")),"Accept overwritten");closed(c,false);});
  test("299 remains success",()->{Connection c=connection();c.status=299;execute(task(c));
   check(c.inputReads==1&&c.errorReads==0,"299 selected error stream");closed(c,false);});
  test("300 selects error JSON",()->{Connection c=connection();c.status=300;i t=task(c);
   check("invalid_grant".equals(execute(t).getString("error"))&&t.d==null,"OAuth JSON must reach onPostExecute");
   check(c.inputReads==0&&c.errorReads==1,"300 selected input stream");closed(c,true);});
  test("400 OAuth error remains real JSON",()->{Connection c=connection();c.status=400;i t=task(c);
   check("invalid_grant".equals(execute(t).getString("error"))&&t.d==null,"OAuth error swallowed");closed(c,true);});
  test("199 selects error stream",()->{Connection c=connection();c.status=199;execute(task(c));closed(c,true);});
  test("connection IO maps with no stream",()->{Connection c=connection();i t=task(c);nl.npo.player.library.bu.a.fail=true;
   check(execute(t)==null,"IO result");mapped(t,3,IOException.class);unopened(c);});
  test("output IO maps with no stream",()->{Connection c=connection();i t=task(c);c.outputIo=true;
   check(execute(t)==null,"output result");mapped(t,3,IOException.class);unopened(c);});
  test("input IO maps and closes",()->{Connection c=connection();i t=task(c);c.input.io=true;
   check(execute(t)==null,"read result");mapped(t,3,IOException.class);closed(c,false);});
  test("error-stream IO maps and closes",()->{Connection c=connection();c.status=401;i t=task(c);c.error.io=true;
   check(execute(t)==null,"error read result");mapped(t,3,IOException.class);closed(c,true);});
  test("malformed JSON maps and closes",()->{Connection c=new Connection("{broken","{}");i t=task(c);
   check(execute(t)==null,"JSON result");mapped(t,5,org.json.JSONException.class);closed(c,false);});
  test("unexpected input exception closes and rethrows",()->{Connection c=connection();i t=task(c);c.input.unexpected=true;
   rethrows(t,"read failure");closed(c,false);});
  test("unexpected error exception closes and rethrows",()->{Connection c=connection();c.status=500;i t=task(c);c.error.unexpected=true;
   rethrows(t,"read failure");closed(c,true);});
  test("IO wrapper failure closes and rethrows",()->{Connection c=connection();i t=task(c);c.input.io=true;
   nl.npo.player.library.zt.e.fail=true;rethrows(t,"wrapping failure");closed(c,false);});
  test("JSON wrapper failure closes and rethrows",()->{Connection c=new Connection("{broken","{}");i t=task(c);
   nl.npo.player.library.zt.e.fail=true;rethrows(t,"wrapping failure");closed(c,false);});
  test("close IOException preserves successful result",()->{Connection c=connection();i t=task(c);c.input.closeIo=true;
   check(execute(t)!=null&&t.d==null,"close exception changed result");closed(c,false);});
  check(cases==17,"missing case");System.out.println("PASS: "+cases+" NPO token behavior cases");
 }
}
''',
}


def execute(args, code):
    sdk, java_home = args.sdk, args.java_home
    android_jar = sorted((sdk / 'platforms').glob('android-*/android.jar'),
                         key=lambda p: int(p.parent.name.split('-')[1]))[-1]
    d8 = sorted((sdk / 'build-tools').glob('*/d8'))[-1]
    adb = sdk / 'platform-tools/adb'
    assert run([adb, '-s', args.serial, 'get-state']).strip() == 'device'
    with tempfile.TemporaryDirectory(prefix='npo-token-art-') as directory:
        root = Path(directory)
        src, classes, smali, dex = [root / name for name in ('src', 'classes', 'smali', 'dex')]
        for folder in (src, classes, smali, dex):
            folder.mkdir()
        for name, source in JAVA.items():
            path = src / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source)
        run([java_home / 'bin/javac', '-source', '8', '-target', '8', '-cp', android_jar,
             '-d', classes, *src.rglob('*.java')])
        (classes / 'nl/npo/player/library/zt/i.class').unlink()
        target = wrapper('nl/npo/player/library/zt/i',
                         '.field public a:Lnl/npo/player/library/zt/x;\n.field public d:Lnl/npo/player/library/zt/e;',
                         'doInBackground([Ljava/lang/Object;)Ljava/lang/Object;', 7, code)
        target += '\n' + method(args.helpers_decoded, 'nl/npo/player/library/zt/i', 'a(Ljava/net/HttpURLConnection;)V')
        (smali / 'i.smali').write_text(target)
        encoder = '.class public Lnl/npo/player/library/bm/f;\n.super Ljava/lang/Object;\n'
        encoder += method(args.helpers_decoded, 'nl/npo/player/library/bm/f', 'z(Ljava/util/HashMap;)Ljava/lang/String;')
        (smali / 'encoder.smali').write_text(encoder)
        actual = root / 'actual.dex'
        run([java_home / 'bin/java', '-cp', args.morphe_jar, 'com.android.tools.smali.smali.Main',
             'assemble', '--output', actual, smali])
        assert actual.is_file(), 'Token smali assembly failed'
        run([d8, '--min-api', '28', '--lib', android_jar, '--output', dex,
             actual, *classes.rglob('*.class')], env=dict(os.environ, JAVA_HOME=str(java_home)))
        files = list(dex.glob('*.dex'))
        assert len(files) == 1
        remote = f'/data/local/tmp/morphe-npo/token-{uuid.uuid4().hex}.dex'
        try:
            run([adb, '-s', args.serial, 'shell', 'mkdir', '-p', '/data/local/tmp/morphe-npo'])
            run([adb, '-s', args.serial, 'push', files[0], remote])
            result = run([adb, '-s', args.serial, 'shell', f'CLASSPATH={remote}',
                          'app_process', '/system/bin', 'NpoTokenProbe'], timeout=60)
            print(result, end='')
            assert 'PASS: 17 NPO token behavior cases' in result
        finally:
            run([adb, '-s', args.serial, 'shell', 'rm', '-f', remote])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--serial', required=True, choices=['192.168.50.89:5555'])
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument('--source', action='store_true')
    mode.add_argument('--decoded', type=Path)
    parser.add_argument('--helpers-decoded', type=Path, default=DEFAULT_HELPERS)
    parser.add_argument('--sdk', type=Path, default=Path(os.environ.get('ANDROID_HOME', Path.home() / 'Library/Android/sdk')))
    parser.add_argument('--java-home', type=Path, default=Path(os.environ.get('JAVA_HOME', '/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home')))
    parser.add_argument('--morphe-jar', type=Path, default=ROOT / '.tools/morphe-desktop-1.19.1-all.jar')
    args = parser.parse_args()
    code = method(args.decoded, 'nl/npo/player/library/zt/i',
                  'doInBackground([Ljava/lang/Object;)Ljava/lang/Object;', True) if args.decoded else prefix()
    print(f'ART token input: {args.decoded or SOURCE}', flush=True)
    execute(args, code)


if __name__ == '__main__':
    main()
