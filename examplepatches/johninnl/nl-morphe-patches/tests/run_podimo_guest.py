"""Execute the Podimo playback gate, play-button mapping and API host in isolated ART.

Loads the real (original or patched) APK on the connected phone without installing it,
constructs the app's own user access validator with a FREE profile, and checks:

- controls on both builds: the play-button mapping yields LOCKED when the episode is
  unavailable and READY when it is available (the existing play button);
- original build: the production GraphQL host is the Android gateway and PREMIUM,
  PREMIUM_ONLY, PREMIUM_PLUS episodes and an exclusive podcast are rejected for the
  FREE profile (the Premium button state);
- patched build: the production GraphQL host is the website host verified for fresh
  guest sessions and the same four gates return the typed success result, so the play
  action can proceed with the guest token.

No network access, tokens or signed URLs are used.
"""
import argparse
import hashlib
import os
from pathlib import Path
import re
import subprocess
import tempfile
import uuid

PROBE = r'''
import dalvik.system.PathClassLoader;
import java.lang.reflect.*;
import java.util.Map;

public class PodimoProbe {
 static ClassLoader apk; static Object unsafe; static Method allocate; static int pass;
 static Class<?> type(String name) throws Exception {return Class.forName(name,false,apk);}
 static void check(boolean value,String why){if(!value)throw new AssertionError(why);}
 static Object instance(String name) throws Exception {return allocate.invoke(unsafe,type(name));}
 static Object call(Object owner,String name,String[] names,Object... args) throws Exception {
  Class<?>[] params=new Class<?>[names.length];
  for(int i=0;i<names.length;i++)params[i]=type(names[i]);
  Method method=owner.getClass().getDeclaredMethod(name,params);
  method.setAccessible(true);
  try{return method.invoke(owner,args);}
  catch(InvocationTargetException e){Throwable cause=e.getCause();
   if(cause instanceof Exception)throw (Exception)cause;if(cause instanceof Error)throw (Error)cause;throw e;}
 }
 static Object field(Object owner,String name) throws Exception {
  boolean statics=owner instanceof Class;
  Field f=(statics?(Class<?>)owner:owner.getClass()).getDeclaredField(name);
  f.setAccessible(true);return f.get(statics?null:owner);
 }
 static void set(Object receiver,String name,Object value) throws Exception {
  Field f=receiver.getClass().getDeclaredField(name);f.setAccessible(true);f.set(receiver,value);
 }
 static void pass(String name){pass++;System.out.println("PASS "+name);}
 static Object freeProfile() throws Exception {
  Object free=field(type("com.podimo.app.core.profile.t"),"c");
  return Proxy.newProxyInstance(apk,new Class<?>[]{type("cx.k0")},(p,m,a)->"u".equals(m.getName())?free:null);
 }
 static Object featureGate() throws Exception {
  return Proxy.newProxyInstance(apk,new Class<?>[]{type("com.podimo.app.core.profile.a")},(p,m,a)->Boolean.TRUE);
 }
 static Object premiumEpisode() throws Exception {
  Class<?>[] sig=new Class<?>[]{String.class,double.class,String.class,String.class,Double.class,String.class,
   String.class,type("Fv.a"),String.class,String.class,type("com.podimo.dto.StreamMedia"),Double.class,
   String.class,type("com.podimo.dto.b"),String.class,String.class,String.class,String.class,String.class,
   type("jd.a"),Boolean.class,String.class,boolean.class,Float.class,String.class};
  Object[] args=new Object[25];
  for(int i=0;i<25;i++)args[i]=null;
  args[1]=0.0d;args[2]="episode-id";args[6]="title";args[7]=field(type("Fv.a"),"c");
  args[8]="thumb";args[9]="image";args[14]="artist";args[16]="datetime";
  args[17]="podcast-id";args[18]="podcast";
  args[19]=field(type("jd.a"),"d");args[20]=Boolean.FALSE;args[22]=Boolean.FALSE;
  return type("com.podimo.dto.AudioPlayerEpisodeItem").getDeclaredConstructor(sig).newInstance(args);
 }
 static Object validator() throws Exception {
  Object h0=instance("id.h0");
  set(h0,"b",freeProfile());set(h0,"d",featureGate());
  return h0;
 }
 static Object exclusivePodcast() throws Exception {
  Object z=instance("Kq.z");set(z,"a",field(type("Kq.y"),"e"));
  Object x=instance("Kq.x");set(x,"h",z);
  return x;
 }
 static void buttonCase(boolean available,String expected,String why) throws Exception {
  Object id=Proxy.newProxyInstance(apk,new Class<?>[]{type("ec.h")},(p,m,a)->null);
  Object state=type("Yf.e").getDeclaredConstructor(type("ec.h"),boolean.class,String.class,
   type("jd.o"),long.class,long.class,boolean.class).newInstance(id,available,"podcast-id",
   field(type("jd.o$b"),"a"),0L,0L,false);
  Method f=type("Yf.f").getDeclaredMethod("a",type("Yf.e"));
  f.setAccessible(true);
  Object result=f.invoke(null,state);
  Method stateOf=result.getClass().getDeclaredMethod("f");
  stateOf.setAccessible(true);
  Object button=stateOf.invoke(result);
  check(button==field(type("ag.l"),expected),why+" -> "+result);
  pass(why);
 }
 static void gateCase(Object h0,String method,boolean patched,String why,String[] params,Object... args) throws Exception {
  Method m=h0.getClass().getDeclaredMethod(method,types(params));
  m.setAccessible(true);
  Object result;
  try{result=m.invoke(h0,args);}
  catch(InvocationTargetException e){Throwable cause=e.getCause();
   if(cause instanceof Exception)throw (Exception)cause;if(cause instanceof Error)throw (Error)cause;throw e;}
  boolean success=result.getClass()==type("Sc.b$b");
  check(success==patched,why+" produced "+result.getClass().getName()+" for a FREE profile");
  pass(why);
 }
 static Class<?>[] types(String[] names) throws Exception {
  Class<?>[] params=new Class<?>[names.length];
  for(int i=0;i<names.length;i++)params[i]="boolean".equals(names[i])?boolean.class:type(names[i]);
  return params;
 }
 static void urlCase(boolean patched) throws Exception {
  Object urls=type("Tc.c$c").getDeclaredConstructor(Map.class,int.class,type("kotlin.jvm.internal.k"))
   .newInstance(null,1,null);
  Map<?,?> map=(Map<?,?>)call(urls,"a",new String[]{});
  String url=(String)map.get(field(type("Tc.b"),"c"));
  String expected=patched?"https://graphql.podimo.com/graphql":"https://graphql.pdm-gateway.com/graphql";
  check(expected.equals(url),"production GraphQL host: "+url);
  pass((patched?"patched":"original")+" production GraphQL host: "+url);
 }
 static void bannerCase(boolean patched) throws Exception {
  Object thread=Class.forName("android.app.ActivityThread").getMethod("currentActivityThread").invoke(null);
  Object context=thread.getClass().getMethod("getSystemContext").invoke(thread);
  Object menu=instance("Ze.b");
  set(menu,"a",context);
  Object state=instance("Ue.d$d");
  Method h=menu.getClass().getDeclaredMethod("h",type("Ue.d"));
  h.setAccessible(true);
  Object result=h.invoke(menu,state);
  Method visible=result.getClass().getDeclaredMethod("b");
  visible.setAccessible(true);
  Method text=result.getClass().getDeclaredMethod("a");
  text.setAccessible(true);
  check(visible.invoke(result)!=(Object)patched,"promotion pill visibility for state Ue.d$d: "+result);
  if(patched)check("".equals(text.invoke(result)),"promotion pill hides its text");
  pass((patched?"hidden":"shown")+" top-left promotion pill (Start free trial)");
 }
 public static void main(String[] a) {
  try {
  apk=new PathClassLoader(a[0],null,PodimoProbe.class.getClassLoader());
  Field f=Class.forName("sun.misc.Unsafe").getDeclaredField("theUnsafe");f.setAccessible(true);
  unsafe=f.get(null);allocate=unsafe.getClass().getDeclaredMethod("allocateInstance",Class.class);
  boolean patched="true".equals(a[1]);
  buttonCase(false,"b","play button stays LOCKED when unavailable");
  buttonCase(true,"a","play button becomes READY when available");
  urlCase(patched);
  bannerCase(patched);
  Object h0=validator();
  gateCase(h0,"m",patched,"PREMIUM episode gate for a FREE guest profile",new String[]{});
  gateCase(h0,"n",patched,"PREMIUM_ONLY episode gate for a FREE guest profile",new String[]{"boolean"},Boolean.TRUE);
  gateCase(h0,"p",patched,"PREMIUM_PLUS episode gate for a FREE guest profile",new String[]{"boolean"},Boolean.TRUE);
  gateCase(h0,"f",patched,"exclusive podcast gate for a FREE guest profile",new String[]{"Kq.x"},exclusivePodcast());
  gateCase(h0,"e",patched,"PREMIUM episode play action for a FREE guest profile",
   new String[]{"com.podimo.dto.AudioPlayerItem","id.C"},premiumEpisode(),field(type("id.C"),"b"));
  check(pass==9,"missing cases: "+pass);
  System.out.println("PASS: 9 Podimo ART cases ("+(patched?"patched":"original")+" build)");
 } catch(Throwable failure) {
  System.err.println("FAIL Podimo probe ("+(a.length>1&&"true".equals(a[1])?"patched":"original")+")");
  failure.printStackTrace();System.exit(1);
 }
 }
}
'''


def run(command, **kwargs):
    result = subprocess.run([str(x) for x in command], capture_output=True, text=True, **kwargs)
    if result.returncode:
        raise RuntimeError(f'Command failed: {command[0]}\n{result.stdout}\n{result.stderr}')
    return result.stdout


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--apk', required=True, type=Path)
    parser.add_argument('--patched', action='store_true', help='Expect the patched behavior; default checks the original')
    parser.add_argument('--sdk', type=Path, default=Path.home() / 'Library/Android/sdk')
    parser.add_argument('--java-home', type=Path, default=Path('/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'))
    args = parser.parse_args()
    if not args.apk.is_file():
        parser.error('Provide an APK')
    adb = args.sdk / 'platform-tools/adb'
    if run([adb, '-s', args.serial, 'get-state']).strip() != 'device':
        raise RuntimeError('Device unavailable')

    def version(path):
        return tuple(map(int, re.findall(r'\d+', path.parent.name)))

    android = max((args.sdk / 'platforms').glob('android-*/android.jar'), key=version)
    d8 = max((args.sdk / 'build-tools').glob('*/d8'), key=version)
    with tempfile.TemporaryDirectory(prefix='podimo-art-') as temporary:
        local = Path(temporary)
        source = local / 'PodimoProbe.java'
        source.write_text(PROBE)
        classes, dex = local / 'classes', local / 'dex'
        classes.mkdir()
        dex.mkdir()
        run([args.java_home / 'bin/javac', '-source', '8', '-target', '8', '-cp', android, '-d', classes, source])
        run([d8, '--min-api', '26', '--lib', android, '--output', dex, *classes.rglob('*.class')],
            env=dict(os.environ, JAVA_HOME=str(args.java_home)))
        remote = '/data/local/tmp/podimo-probe-' + uuid.uuid4().hex
        try:
            run([adb, '-s', args.serial, 'push', args.apk, remote + '.apk'])
            run([adb, '-s', args.serial, 'push', dex / 'classes.dex', remote + '.dex'])
            run([adb, '-s', args.serial, 'shell', 'chmod', '444', remote + '.apk', remote + '.dex'])
            print('APK SHA256:', hashlib.sha256(args.apk.read_bytes()).hexdigest(), flush=True)
            result = run([adb, '-s', args.serial, 'shell', 'CLASSPATH=' + remote + '.dex',
                          'app_process', '/system/bin', 'PodimoProbe', remote + '.apk',
                          str(args.patched).lower()], timeout=90)
            print(result, end='')
            assert 'PASS: 9 Podimo ART cases' in result
        finally:
            run([adb, '-s', args.serial, 'shell', 'rm', '-f', remote + '.apk', remote + '.dex'])


if __name__ == '__main__':
    main()
