"""Execute Videoland mobile gates in isolated ART on an explicitly selected test emulator."""
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
 static Class<?> parameter(String name) throws Exception {return name.equals("long")?long.class:name.equals("int")?int.class:type(name);}
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
 static void unit(Object value,String name) throws Exception {check(value==type("qy.M").getDeclaredField("a").get(null),name);pass(name);}
 static void usability() throws Exception {
  String lifecycle="com.bedrockstreaming.plugin.usabilla.data.UsabillaRepositoryImpl$b";
  Object activity=instance("j.f"),owner=instance(lifecycle);
  type(lifecycle).getDeclaredMethod("onActivityResumed",android.app.Activity.class).invoke(owner,activity);
  check(((java.lang.ref.WeakReference)get(owner,"d")).get()==activity,"Usabilla Activity reference");
  pass("Usabilla keeps Activity without automatic initialization");
  nil(call("com.bedrockstreaming.plugin.usabilla.UsabillaTaggingPlan","c",new String[]{"java.lang.String","java.util.Map"},null,null),"Usabilla automatic events");
  nil(call("com.usabilla.sdk.ubform.Usabilla","sendEvent",new String[]{"android.content.Context","java.lang.String"},null,null),"Usabilla campaign triggers");
  nil(call("com.usabilla.sdk.ubform.telemetry.UbTelemetryRecorder","d",new String[]{}),"Usabilla telemetry recorder");
  nil(call("Ex.i","a",new String[]{"Iw.a","java.util.List"},null,null),"Usabilla queued telemetry upload");
  unit(call("Ex.d","invokeSuspend",new String[]{"java.lang.Object"},(Object)null),"Usabilla telemetry calibration coroutine");
  Object flow=call("ix.M","b",new String[]{"java.lang.String"},(Object)null);int[] emissions={0};
  Object collector=Proxy.newProxyInstance(apk,new Class<?>[]{type("az.k")},(p,m,a)->{
   check(a[0] instanceof List&&((List)a[0]).isEmpty(),"Usabilla campaign emission");emissions[0]++;
   return type("qy.M").getDeclaredField("a").get(null);
  });
  Object context=type("uy.j").getDeclaredField("d").get(null);Object[] resumed={null};
  check(context.toString().equals("EmptyCoroutineContext"),"campaign coroutine context");
  Object continuation=Proxy.newProxyInstance(apk,new Class<?>[]{type("uy.d")},(p,m,a)->{
   if(m.getName().equals("getContext"))return context;
   if(m.getName().equals("resumeWith")){resumed[0]=a[0];return null;}
   throw new AssertionError("Unexpected continuation method: "+m);
  });
  Object completed=type("az.F").getDeclaredMethod("collect",type("az.k"),type("uy.d")).invoke(flow,collector,continuation);
  check(completed==type("qy.M").getDeclaredField("a").get(null)&&emissions[0]==1&&resumed[0]==null,"Usabilla campaign Flow synchronous completion");
  pass("Usabilla campaign Flow emits empty list and completes");
  for(String[] entry:new String[][]{{"c","qz.y"},{"d","gv.c"},{"g","gv.e"}})
   unit(call("hv.h",entry[0],new String[]{entry[1],"wy.c"},null,null),"JOIN measurement "+entry[0]);
 }
 static void set(Object receiver,String name,Object value) throws Exception {
  Field field=receiver.getClass().getDeclaredField(name);field.setAccessible(true);field.set(receiver,value);
 }
 static Object get(Object receiver,String name) throws Exception {
  Field field=receiver.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(receiver);
 }
 static Object asset(String source) throws Exception {
  Object result=instance("com.bedrockstreaming.component.layout.domain.core.model.player.Asset");
  set(result,"d","https://example.invalid/"+source+".mpd");set(result,"h",source);return result;
 }
 static void liveFallbackCase(boolean dai,boolean alternative,boolean alreadySelected) throws Exception {
  String root="com.bedrockstreaming.";
  Object main=asset(dai?"yospace":"dash"),fallback=asset("dash");
  Object drm=instance(root+"component.layout.domain.core.model.player.Drm");set(fallback,"f",drm);
  Object mainWrapper=type("df.c").getConstructor(type(root+"component.layout.domain.core.model.player.Asset")).newInstance(main);
  Object fallbackWrapper=type("df.c").getConstructor(type(root+"component.layout.domain.core.model.player.Asset")).newInstance(fallback);
  Object content=alternative?type("df.b").getConstructor(type("df.a"),type("df.a")).newInstance(mainWrapper,fallbackWrapper):mainWrapper;
  if(alternative)set(content,"c",alreadySelected);
  Object media=instance("Of.a");set(media,"c",content);
  Object queue=instance(root+"feature.player.domain.queue.item.LiveQueueItem");set(queue,"s",media);
  set(queue,"C",instance(root+"plugin.yospace.YospaceIsDaiAssetUseCase"));
  Object creator=instance(root+"plugin.yospace.YospaceDaiResourceCreator");int[] calls={0};
  Object factory=Proxy.newProxyInstance(apk,new Class<?>[]{type("rf.b")},(p,m,a)->{
   calls[0]++;return type(root+"plugin.yospace.YospaceDaiResourceCreator").getDeclaredMethod("a",type("Of.a")).invoke(creator,(Object)null);
  });set(queue,"B",factory);
  // Deliberately stop at the next dependency, after the source decision. No
  // real preferences, media resource, player, DRM session or network is opened.
  try{type(root+"feature.player.domain.queue.item.LiveQueueItem").getDeclaredMethod("v").invoke(queue);
   throw new AssertionError("Live fixture must stop at its absent player config");}
  catch(InvocationTargetException wrapped){
   Throwable failure=wrapped.getCause();
   check(failure instanceof NullPointerException&&failure.getMessage().contains("PlayerConfigImpl.e()"),"Unexpected live fixture failure: "+failure);
  }
  boolean selected=alternative&&(alreadySelected||dai);
  if(alternative)check(Boolean.valueOf(selected).equals(get(content,"c")),"fallback selection state");
  Object actual=type(alternative?"df.b":"df.c").getDeclaredMethod("a").invoke(content);
  check(actual==(selected?fallback:main),"live source identity changed");
  if(selected)check(get(actual,"f")==drm,"fallback DRM object changed");
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
   check(Boolean.FALSE.equals(call(root+"feature.player.data.config.PlayerConfigImpl","e",new String[]{})),"loader gate");pass("loader gate");
   String requester=root+"feature.adengine.domain.requester.AdEngineAdRequester";
   empty(call(requester,"a",new String[]{"wy.c"},(Object)null),"video cuepoints");
   empty(call(requester,"b",new String[]{"long","Ye.n"},0L,null),"video ads");
   requester=root+"feature.adengine.domain.lbanner.LBannerAdRequester";
   empty(call(requester,"a",new String[]{"wy.c"},(Object)null),"banner cuepoints");
   nil(call(requester,"b",new String[]{"long","Ye.n"},0L,null),"nullable banner item");
   nil(call(root+"feature.adengine.data.config.AdEngineConfigImpl","a",new String[]{}),"pause configuration");
   Object pause=call(root+"feature.adengine.domain.pausead.usecase.GetFirstPlayablePauseAdItemUseCaseImpl","a",
    new String[]{root+"feature.adengine.domain.pausead.requester.PauseAdAdRequestUrlData","wy.c"},null,null);
   nil(pause,"typed nullable pause item");
   nil(call(root+"feature.player.presentation.mobile.control.MobileReplayControl","g0",new String[]{}),"legacy pause gate");
   nil(call(root+"plugin.yospace.YospaceDaiResourceCreator","a",new String[]{"Of.a"},(Object)null),"Yospace nullable resource");
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
   nil(call(root+"plugin.tealium.TealiumTaggingPlan","C0",new String[]{"java.lang.String","java.util.Map"},null,null),"Tealium event gate");
   nil(call(root+"plugin.tealium.TealiumTaggingPlan","D0",new String[]{"java.util.Map"},(Object)null),"Tealium view gate");
   Object id=call(root+"plugin.advertisingid.google.data.GoogleAdvertisingIdSource","a",new String[]{});
   check(id.getClass()==type("y6.b"),"limited advertising ID result");pass("limited advertising ID result");
   nil(call("com.newrelic.agent.android.NewRelic","start",new String[]{"android.content.Context"},(Object)null),"New Relic start gate");
   Object response=call("i3.u","c",new String[]{"B2.c"},(Object)null);
   check(response.getClass()==type("is.b"),"CCT response type");
   check(type("is.b").getDeclaredField("a").getInt(response)==403,"CCT fatal403");
   check(type("is.b").getDeclaredField("b").getLong(response)==0L,"CCT zero delay");
   check(type("is.b").getDeclaredField("c").get(response)==null,"CCT no redirect");pass("CCT typed fatal403");
   snowplow();
   String salesforce="com.salesforce.marketingcloud.analytics.h";
   nil(call(salesforce,"init",new String[]{"com.salesforce.marketingcloud.InitializationStatus$a","int"},null,0),"Salesforce analytics init");
   nil(call(salesforce,"controlChannelInit",new String[]{"int"},0),"Salesforce refreshed analytics init");
   nil(call(salesforce,"enableAnalytics",new String[]{}),"Salesforce runtime analytics enable");
   nil(call(salesforce,"enablePiAnalytics",new String[]{}),"Salesforce runtime PI analytics enable");
   check(Boolean.FALSE.equals(call(salesforce,"areAnalyticsEnabled",new String[]{})),"Salesforce analytics disabled");pass("Salesforce analytics disabled");
   check(Boolean.FALSE.equals(call(salesforce,"arePiAnalyticsEnabled",new String[]{})),"Salesforce PI analytics disabled");pass("Salesforce PI analytics disabled");
   check(Boolean.FALSE.equals(call("com.facebook.j","b",new String[]{})),"Facebook advertiser ID disabled");pass("Facebook advertiser ID disabled");
   check(Boolean.FALSE.equals(call("com.facebook.j","c",new String[]{})),"Facebook automatic app events disabled");pass("Facebook automatic app events disabled");
   check(Boolean.FALSE.equals(call("com.google.firebase.crashlytics.internal.common.DataCollectionArbiter","a",new String[]{})),"Crashlytics automatic collection disabled");pass("Crashlytics automatic collection disabled");
   usability();
  }
  check(count==(ads?13:0)+(tracking?28:0),"missing cases");
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
    if not args.serial.startswith('emulator-'):
        parser.error('Select the dedicated task emulator explicitly; physical devices are outside this runner scope')
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
            expected = (13 if args.ads else 0) + (28 if args.tracking else 0)
            assert f'PASS: {expected} actual Videoland APK ART cases' in result
        finally:
            run([adb, '-s', args.serial, 'shell', 'rm', '-f', remote + '.apk', remote + '.dex'])


if __name__ == '__main__':
    main()
