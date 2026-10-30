"""Probe actual APK privacy gates on the spare ART device without installing it.

Only the APK and a synthetic probe DEX are copied to unique /data/local/tmp paths.
No NPO application is started, no APK is installed, and no app storage is opened.
"""
import argparse
import hashlib
import os
from pathlib import Path
import subprocess
import tempfile
import uuid


PROBE = r'''
import dalvik.system.PathClassLoader;
import java.lang.reflect.*;

public class NpoPrivacyProbe {
 static ClassLoader apk;
 static Object unsafe;
 static Method allocate;
 static int cases;

 static Class<?> actual(String name) throws Exception {return Class.forName(name,false,apk);}
 static void check(boolean condition,String message){if(!condition)throw new AssertionError(message);}
 static void setupUnsafe() throws Exception {
  Class<?> type=Class.forName("sun.misc.Unsafe");
  try {unsafe=type.getDeclaredMethod("getUnsafe").invoke(null);}catch(ReflectiveOperationException ignored){}
  if(unsafe==null){
   for(String name:new String[]{"theUnsafe","THE_ONE"}){
    try {Field field=type.getDeclaredField(name);field.setAccessible(true);unsafe=field.get(null);break;}
    catch(ReflectiveOperationException ignored){}
   }
  }
  check(unsafe!=null,"Unsafe unavailable");allocate=type.getMethod("allocateInstance",Class.class);
 }
 static Object instance(Class<?> type) throws Exception {return allocate.invoke(unsafe,type);}
 static Object invoke(Method method,Object receiver,Object... args) throws Exception {
  try {return method.invoke(receiver,args);}
  catch(InvocationTargetException wrapped){
   Throwable cause=wrapped.getCause();
   if(cause instanceof Exception)throw (Exception)cause;
   if(cause instanceof Error)throw (Error)cause;
   throw wrapped;
  }
 }
 static void pass(String name){cases++;System.out.println("PASS "+name);}
 static void cct() throws Exception {
  Class<?> owner=actual("nl.npo.player.library.nw.a");
  Method gate=owner.getDeclaredMethod("f",actual("nl.npo.player.library.qn.j"));
  Object response=invoke(gate,Modifier.isStatic(gate.getModifiers())?null:instance(owner),(Object)null);
  check(response!=null&&response.getClass()==actual("nl.npo.player.library.f7.c1"),"actual typed CCT response required");
  Field code=response.getClass().getDeclaredField("a"),wait=response.getClass().getDeclaredField("b"),redirect=response.getClass().getDeclaredField("c");
  check(code.getInt(response)==403,"CCT response must be fatal HTTP403");
  check(wait.getLong(response)==0L,"CCT response wait must be zero");
  check(redirect.get(response)==null,"CCT response must not redirect");
  pass("actual CCT gate returns typed403 before reading request/context");
 }
 static void voidGate(String ownerName,String methodName,String[] names,Object[] args) throws Exception {
  Class<?> owner=actual(ownerName);Class<?>[] parameters=new Class<?>[names.length];
  for(int i=0;i<names.length;i++){
   parameters[i]="int".equals(names[i])?int.class:"long".equals(names[i])?long.class:actual(names[i]);
  }
  Method method=owner.getDeclaredMethod(methodName,parameters);
  check(method.getReturnType()==void.class,"void boundary changed: "+ownerName+"."+methodName);
  Object receiver=Modifier.isStatic(method.getModifiers())?null:instance(owner);
  invoke(method,receiver,args);pass("actual void gate "+ownerName+"."+methodName);
 }
 public static void main(String[] args) throws Exception {
  try {
   check(args.length==1,"APK path required");
   apk=new PathClassLoader(args[0],ClassLoader.getSystemClassLoader());setupUnsafe();
   cct();
   voidGate("nl.npo.player.library.im.i2","a",new String[]{"nl.npo.player.library.im.g3","int"},new Object[]{null,0});
   voidGate("nl.npo.player.library.gm.d1","c",new String[]{"nl.npo.player.library.gm.a"},new Object[]{null});
   voidGate("nl.npo.player.library.a9.t","O",new String[]{"nl.npo.player.library.qk.a"},new Object[]{null});
   voidGate("nl.npo.player.library.el.b","d",new String[]{"nl.npo.player.library.el.a","long","java.lang.Throwable"},new Object[]{null,0L,null});
   voidGate("com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver","onReceive",new String[]{"android.content.Context","android.content.Intent"},new Object[]{null,null});
   check(cases==6,"missing privacy case");System.out.println("PASS: "+cases+" actual APK privacy gate cases");
  }catch(Exception|Error failure){System.err.println("FAIL actual APK privacy gate");failure.printStackTrace();throw failure;}
 }
}
'''


def run(command, **kwargs):
    completed = subprocess.run([str(x) for x in command], text=True, capture_output=True, **kwargs)
    if completed.returncode:
        raise RuntimeError(f'Command failed ({completed.returncode}): {command[0]}\n{completed.stdout}\n{completed.stderr}')
    return completed.stdout


def execute(args):
    sdk, java_home = args.sdk, args.java_home
    platforms = sorted((sdk / 'platforms').glob('android-*/android.jar'),
                       key=lambda path: int(path.parent.name.split('-')[1]))
    if not platforms:
        raise FileNotFoundError(f'No Android platform found in {sdk}')
    android_jar = platforms[-1]
    versions = sorted((sdk / 'build-tools').iterdir(),
                      key=lambda path: tuple(int(x) for x in path.name.split('.') if x.isdigit()))
    d8 = next((path / 'd8' for path in reversed(versions) if (path / 'd8').is_file()), None)
    if d8 is None:
        raise FileNotFoundError(f'No d8 compiler found in {sdk}')
    adb = sdk / 'platform-tools/adb'
    if run([adb, '-s', args.serial, 'get-state']).strip() != 'device':
        raise RuntimeError('Spare device is not connected')
    with tempfile.TemporaryDirectory(prefix='npo-apk-privacy-') as temporary:
        root = Path(temporary)
        classes, output = root / 'classes', root / 'dex'
        classes.mkdir()
        output.mkdir()
        source = root / 'NpoPrivacyProbe.java'
        source.write_text(PROBE)
        run([java_home / 'bin/javac', '-source', '8', '-target', '8', '-cp', android_jar,
             '-d', classes, source])
        run([d8, '--min-api', '28', '--lib', android_jar, '--output', output,
             *classes.rglob('*.class')], env=dict(os.environ, JAVA_HOME=str(java_home)))
        identifier = uuid.uuid4().hex
        remote_apk = f'/data/local/tmp/npo-privacy-{identifier}.apk'
        remote_dex = f'/data/local/tmp/npo-privacy-{identifier}.dex'
        try:
            run([adb, '-s', args.serial, 'push', args.apk, remote_apk])
            run([adb, '-s', args.serial, 'push', output / 'classes.dex', remote_dex])
            with args.apk.open('rb') as stream:
                digest = hashlib.file_digest(stream, 'sha256').hexdigest()
            print(f'ART privacy input: {args.apk}\nAPK SHA-256: {digest}', flush=True)
            result = run([adb, '-s', args.serial, 'shell', f'CLASSPATH={remote_dex}',
                          'app_process', '/system/bin', 'NpoPrivacyProbe', remote_apk], timeout=60)
            print(result, end='')
            if 'PASS: 6 actual APK privacy gate cases' not in result:
                raise AssertionError('Missing complete actual-APK result')
        finally:
            run([adb, '-s', args.serial, 'shell', 'rm', '-f', remote_apk, remote_dex])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--apk', required=True, type=Path)
    parser.add_argument('--sdk', type=Path, default=Path(os.environ.get('ANDROID_HOME', Path.home() / 'Library/Android/sdk')))
    parser.add_argument('--java-home', type=Path, default=Path(os.environ.get('JAVA_HOME', '/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home')))
    args = parser.parse_args()
    if args.serial != '192.168.50.89:5555':
        parser.error('Harness is restricted to the spare 192.168.50.89:5555 device')
    if not args.apk.is_file() or args.apk.suffix != '.apk':
        parser.error('--apk must identify an existing APK file')
    execute(args)


if __name__ == '__main__':
    main()
