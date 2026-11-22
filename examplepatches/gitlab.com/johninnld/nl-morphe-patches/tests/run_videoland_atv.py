"""Execute actual candidate DEX gates in isolated ART, without installing/starting the app."""
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
import android.content.ContextWrapper;
import java.lang.reflect.*;
import java.util.List;

public class VideolandProbe {
 static ClassLoader apk; static Object unsafe; static Method allocate; static int count;
 static Class<?> type(String name) throws Exception {return Class.forName(name,false,apk);}
 static void check(boolean value,String why){if(!value)throw new AssertionError(why);}
 static Object instance(String name) throws Exception {return allocate.invoke(unsafe,type(name));}
 static Class<?> parameter(String name) throws Exception {return name.equals("long")?long.class:type(name);}
 static Object call(String owner,String name,String[] names,Object... args) throws Exception {
  Class<?>[] params=new Class<?>[names.length];
  for(int i=0;i<names.length;i++)params[i]=parameter(names[i]);
  Method method=type(owner).getDeclaredMethod(name,params);method.setAccessible(true);
  try{return method.invoke(instance(owner),args);}
  catch(InvocationTargetException e){Throwable cause=e.getCause();
   if(cause instanceof Exception)throw (Exception)cause;if(cause instanceof Error)throw (Error)cause;throw e;}
 }
 static void pass(String name){count++;System.out.println("PASS "+name);}
 static void empty(Object value,String name){check(value instanceof List&&((List)value).isEmpty(),name);pass(name);}
 static void nil(Object value,String name){check(value==null,name);pass(name);}
 static void set(Object receiver,String name,Object value) throws Exception {
  Field field=receiver.getClass().getDeclaredField(name);field.setAccessible(true);field.set(receiver,value);
 }
 static Object get(Object receiver,String name) throws Exception {
  Field field=receiver.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(receiver);
 }
 static Object asset(String source) throws Exception {
  Object result=instance("com.bedrockstreaming.component.layout.domain.core.model.player.Asset");
  set(result,"N","https://example.invalid/"+source+".mpd");set(result,"R",source);return result;
 }
 static void liveFallbackCase(boolean dai,boolean alternative,boolean alreadySelected) throws Exception {
  String root="com.bedrockstreaming.";
  Object main=asset(dai?"yospace":"dash"),fallback=asset("dash");
  Object drm=instance(root+"component.layout.domain.core.model.player.Drm");set(fallback,"P",drm);
  Object mainWrapper=type("Ie.c").getConstructor(type(root+"component.layout.domain.core.model.player.Asset"),Boolean.TYPE).newInstance(main,false);
  Object fallbackWrapper=type("Ie.c").getConstructor(type(root+"component.layout.domain.core.model.player.Asset"),Boolean.TYPE).newInstance(fallback,false);
  Object content=alternative?type("Ie.b").getConstructor(type("Ie.a"),type("Ie.a")).newInstance(mainWrapper,fallbackWrapper):mainWrapper;
  if(alternative)set(content,"c",alreadySelected);
  Object media=instance("sf.a");set(media,"c",content);
  Object queue=instance(root+"feature.player.domain.queue.item.LiveQueueItem");set(queue,"p",media);
  set(queue,"y",instance(root+"plugin.yospace.YospaceIsDaiAssetUseCase"));
  Object creator=instance(root+"plugin.yospace.YospaceDaiResourceCreator");int[] calls={0};
  Object factory=Proxy.newProxyInstance(apk,new Class<?>[]{type("Ve.b")},(p,m,a)->{
   calls[0]++;return type(root+"plugin.yospace.YospaceDaiResourceCreator").getDeclaredMethod("a",type("sf.a")).invoke(creator,(Object)null);
  });set(queue,"x",factory);
  // Deliberately stop at the next dependency, after the source decision. No
  // real preferences, media resource, player, DRM session or network is opened.
  try{type(root+"feature.player.domain.queue.item.LiveQueueItem").getDeclaredMethod("u").invoke(queue);
   throw new AssertionError("Live fixture must stop at its absent player config");}
  catch(InvocationTargetException wrapped){
   Throwable failure=wrapped.getCause();
   check(failure instanceof NullPointerException&&failure.getMessage().contains("PlayerConfigImpl.d()"),"Unexpected live fixture failure: "+failure);
  }
  boolean selected=alternative&&(alreadySelected||dai);
  if(alternative)check(Boolean.valueOf(selected).equals(get(content,"c")),"fallback selection state");
  Object actual=type(alternative?"Ie.b":"Ie.c").getDeclaredMethod("a").invoke(content);
  check(actual==(selected?fallback:main),"live source identity changed");
  if(selected)check(get(actual,"P")==drm,"fallback DRM object changed");
  check(calls[0]==(dai&&!alreadySelected?1:0),"unexpected DAI factory calls");
  pass("live source decision: dai="+dai+", fallback="+alternative+", alreadySelected="+alreadySelected);
 }
 static void snowplow() throws Exception {
  String owner="com.bedrockstreaming.plugin.snowplow.SnowplowTracker";
  Class<?> c=type(owner);Constructor<?> constructor=c.getDeclaredConstructors()[0];
  Class<?>[] params=constructor.getParameterTypes();Object[] args=new Object[params.length];
  args[0]=new ContextWrapper(null);
  for(int i=1;i<params.length;i++)args[i]=params[i].isInterface()?
   Proxy.newProxyInstance(apk,new Class<?>[]{params[i]},(p,m,a)->null):allocate.invoke(unsafe,params[i]);
  Object object=constructor.newInstance(args);
  for(String name:new String[]{"a","b","c","d","f"}){
   Field f=c.getDeclaredField(name);f.setAccessible(true);Object value=f.get(object);
   int position=name.equals("a")?2:name.equals("b")?3:name.equals("c")?4:-1;
   check(position<0?value==null:value==args[position],"Snowplow field "+name);
  }
  pass("Snowplow initialized dependencies, no emitter or session");
 }
 public static void main(String[] args) throws Exception {
  try {
  System.out.println("Videoland ART probe started");
  apk=new PathClassLoader(args[0],ClassLoader.getSystemClassLoader());
  Class<?> u=Class.forName("sun.misc.Unsafe");
  for(String name:new String[]{"theUnsafe","THE_ONE"}){
   try{Field f=u.getDeclaredField(name);f.setAccessible(true);unsafe=f.get(null);break;}
   catch(NoSuchFieldException ignored){}
  }
  check(unsafe!=null,"Unsafe unavailable");allocate=u.getMethod("allocateInstance",Class.class);
  boolean ads=Boolean.parseBoolean(args[1]),tracking=Boolean.parseBoolean(args[2]);
  String root="com.bedrockstreaming.";
  if(ads){
   check(Boolean.FALSE.equals(call(root+"feature.player.data.config.PlayerConfigImpl","d",new String[]{})),"loader gate");pass("loader gate");
   String requester=root+"feature.adengine.domain.requester.AdEngineAdRequester";
   empty(call(requester,"a",new String[]{"tv.c"},(Object)null),"video cuepoints");
   empty(call(requester,"b",new String[]{"long","Ee.p"},0L,null),"video ads");
   requester=root+"feature.adengine.domain.lbanner.LBannerAdRequester";
   empty(call(requester,"a",new String[]{"tv.c"},(Object)null),"banner cuepoints");
   nil(call(requester,"b",new String[]{"long","Ee.p"},0L,null),"nullable banner item");
   nil(call(root+"feature.adengine.data.config.AdEngineConfigImpl","a",new String[]{}),"pause configuration");
   Object pause=call(root+"feature.adengine.domain.pausead.usecase.GetFirstPlayablePauseAdItemUseCaseImpl","a",
    new String[]{root+"feature.adengine.domain.pausead.requester.PauseAdAdRequestUrlData","tv.c"},null,null);
   check(pause.getClass()==type("L9.d")&&pause.toString().equals("Empty"),"typed pause Empty");pass("typed pause Empty");
   nil(call(root+"feature.player.presentation.tv.control.TvReplayControl","U",new String[]{}),"legacy pause gate");
   nil(call(root+"plugin.yospace.YospaceDaiResourceCreator","a",new String[]{"sf.a"},(Object)null),"Yospace nullable resource");
   liveFallbackCase(true,true,false);
   liveFallbackCase(false,true,false);
   liveFallbackCase(true,true,true);
   liveFallbackCase(true,false,false);
  }
  if(tracking){
   String config=root+"component.config.domain.ConfigImpl";
   for(String key:new String[]{"activateTealium","playerNPAWv7Enabled","playerSnowplowMediaTrackingEnabled"}){
    check(Boolean.FALSE.equals(call(config,"h",new String[]{"java.lang.String"},key)),key);pass("disabled "+key);
   }
   for(String key:new String[]{null,"","playerHeartbeatEnabled","playerAdsLoaderEnabled","ActivateTealium"}){
    try{call(config,"h",new String[]{"java.lang.String"},key);throw new AssertionError("Unknown key did not delegate");}
    catch(NullPointerException expected){pass("unknown/null key delegates to original backing store");}
   }
   nil(call(root+"plugin.tealium.TealiumTaggingPlan","J0",new String[]{"java.lang.String","java.util.Map"},null,null),"Tealium event gate");
   nil(call(root+"plugin.tealium.TealiumTaggingPlan","U0",new String[]{"java.util.Map"},(Object)null),"Tealium view gate");
   Object id=call(root+"plugin.advertisingid.google.data.GoogleAdvertisingIdSource","a",new String[]{});
   check(id.getClass()==type("z6.b"),"limited advertising ID result");pass("limited advertising ID result");
   nil(call("com.newrelic.agent.android.NewRelic","start",new String[]{"android.content.Context"},(Object)null),"New Relic start gate");
   Object response=call("Yb.a","c",new String[]{"F2.c"},(Object)null);
   check(response.getClass()==type("A3.b0"),"CCT response type");
   check(type("A3.b0").getDeclaredField("a").getInt(response)==403,"CCT fatal403");
   check(type("A3.b0").getDeclaredField("b").getLong(response)==0L,"CCT zero delay");
   check(type("A3.b0").getDeclaredField("c").get(response)==null,"CCT no redirect");pass("CCT typed fatal403");
   snowplow();
  }
  check(count==(ads?13:0)+(tracking?14:0),"missing cases");
  System.out.println("PASS: "+count+" actual Videoland APK ART cases");
  } catch(Throwable failure) {
   System.err.println("FAIL Videoland ART probe");failure.printStackTrace();System.exit(1);
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
    parser.add_argument('--ads', action='store_true')
    parser.add_argument('--tracking', action='store_true')
    parser.add_argument('--sdk', type=Path, default=Path.home() / 'Library/Android/sdk')
    parser.add_argument('--java-home', type=Path, default=Path('/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'))
    args = parser.parse_args()
    if not args.apk.is_file() or not (args.ads or args.tracking):
        parser.error('Provide an APK and at least one selection')
    adb = args.sdk / 'platform-tools/adb'
    if run([adb, '-s', args.serial, 'get-state']).strip() != 'device':
        raise RuntimeError('Device unavailable')
    def version(path):
        return tuple(map(int, re.findall(r'\d+', path.parent.name)))
    android = max((args.sdk / 'platforms').glob('android-*/android.jar'), key=version)
    d8 = max((args.sdk / 'build-tools').glob('*/d8'), key=version)
    with tempfile.TemporaryDirectory(prefix='videoland-art-') as temporary:
        local = Path(temporary)
        source = local / 'VideolandProbe.java'
        source.write_text(PROBE)
        classes, dex = local / 'classes', local / 'dex'
        classes.mkdir()
        dex.mkdir()
        run([args.java_home / 'bin/javac', '-source', '8', '-target', '8', '-cp', android, '-d', classes, source])
        run([d8, '--min-api', '24', '--lib', android, '--output', dex, *classes.rglob('*.class')],
            env=dict(os.environ, JAVA_HOME=str(args.java_home)))
        remote = '/data/local/tmp/videoland-probe-' + uuid.uuid4().hex
        try:
            run([adb, '-s', args.serial, 'push', args.apk, remote + '.apk'])
            run([adb, '-s', args.serial, 'push', dex / 'classes.dex', remote + '.dex'])
            run([adb, '-s', args.serial, 'shell', 'chmod', '444', remote + '.apk', remote + '.dex'])
            print('APK SHA256:', hashlib.sha256(args.apk.read_bytes()).hexdigest(), flush=True)
            result = run([adb, '-s', args.serial, 'shell', 'CLASSPATH=' + remote + '.dex',
                          'app_process', '/system/bin', 'VideolandProbe', remote + '.apk',
                          str(args.ads).lower(), str(args.tracking).lower()], timeout=60)
            print(result, end='')
            expected = (13 if args.ads else 0) + (14 if args.tracking else 0)
            assert f'PASS: {expected} actual Videoland APK ART cases' in result
        finally:
            run([adb, '-s', args.serial, 'shell', 'rm', '-f', remote + '.apk', remote + '.dex'])


if __name__ == '__main__':
    main()
