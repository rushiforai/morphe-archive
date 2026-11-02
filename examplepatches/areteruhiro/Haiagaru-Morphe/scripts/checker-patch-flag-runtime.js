// Actual false-option APKs. Capture launches and block WebView navigation: no live checker request.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 const patchOff=/\.haiagaru\.checkerflag(191|226|242)$/.test(pkg);
 if(!patchOff&&!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg)){reject(Error('verification app required'));return;}
 Java.deoptimizeEverything(); // Prevent framework launch inlining from bypassing offline capture hooks.
 let host;
 Java.choose('app.morphe.extension.chmate.HaiagaruSettingsActivity',{onMatch(a){if(!a.isFinishing())host=Java.retain(a);},onComplete(){
  Java.scheduleOnMainThread(()=>{
   const P='app.morphe.extension.chmate.',H=Java.use(P+'Haiagaru'),C=Java.use(P+'HissiMenuController'),Tabs=Java.use(P+'NativeToolTabs'),I=Java.use('android.content.Intent'),Uri=Java.use('android.net.Uri');
   const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='dedicatedViewerEnabled',had=prefs.contains(key),saved=prefs.getBoolean(key,true);
   const available=H.dedicatedCheckerViewerAvailable.overload(),launch=Java.use('android.app.Activity').startActivity.overload('android.content.Intent'),wrappedLaunch=Java.use('android.content.ContextWrapper').startActivity.overload('android.content.Intent'),url=Java.use('android.webkit.WebView').loadUrl.overload('java.lang.String');
   let starts=[],renders=[],controllers=[],checks=0;
   function check(ok,msg){if(!ok)throw Error(msg);checks++;}
   try{
    check(!!host,'real settings Activity available');check(H.dedicatedCheckerViewerAvailable()!==patchOff,'actual APK option matches its manifest');
    launch.implementation=function(intent){starts.push({component:intent.getComponent()===null?null:String(intent.getComponent().getClassName()),url:String(intent.getDataString())});};
    wrappedLaunch.implementation=function(intent){starts.push({component:intent.getComponent()===null?null:String(intent.getComponent().getClassName()),url:String(intent.getDataString())});};
    url.implementation=function(){};
    const Back=Java.registerClass({name:'app.morphe.test.CheckerFlagBack',implements:[Java.use('java.lang.Runnable')],methods:{run(){}}});
    const Capture=Java.registerClass({name:'app.morphe.test.CheckerFlagContext',superClass:Java.use('android.content.ContextWrapper'),methods:{
     $init:[{returnType:'void',argumentTypes:['android.content.Context'],implementation:function(base){this.$super.$init(base);}}],
     startActivity:[{returnType:'void',argumentTypes:['android.content.Intent'],implementation:function(intent){starts.push({component:intent.getComponent()===null?null:String(intent.getComponent().getClassName()),url:String(intent.getDataString())});}}]
    }});
    const Consumer=Java.use('java.util.function.Consumer'),Handler=Java.registerClass({name:'app.morphe.test.CheckerFlagHandler',implements:[Java.use('java.lang.reflect.InvocationHandler')],methods:{invoke(proxy,method,args){if(String(method.getName())==='accept')renders.push(Java.retain(args[0]));return null;}}});
    function renderer(){return Java.cast(Java.use('java.lang.reflect.Proxy').newProxyInstance(app.getClassLoader(),Java.array('java.lang.Class',[Consumer.class]),Handler.$new()),Consumer);}
    function create(data,embedded){starts=[];renders=[];const intent=I.$new('android.intent.action.VIEW',Uri.parse(data));const c=C.$new(host,intent,embedded,Back.$new(),renderer());const base=Java.use('android.content.ContextWrapper').class.getDeclaredField('mBase');base.setAccessible(true);base.set(c,Capture.$new(c.getBaseContext()));controllers.push(c);c.create(null);return c;}
    prefs.edit().putBoolean(key,true).commit();
    if(patchOff){
    for(const scheme of ['https','http','haiagaru-hissi','haiagaru-hissis']){
     create(scheme+'://hissi.org/read.php/android/20261031/test-id.html',false);
     check(starts.length===1&&starts[0].component==='jp.syoboi.a2chMate.activity.WebViewActivity','false uses native viewer for '+scheme+': '+JSON.stringify(starts)+' renders='+renders.length);
     check(renders.length===0,'false never renders the dedicated viewer');
     check(/^https?:\/\/hissi\.org\/read.php\/android\/20261031\/test-id\.html/.test(starts[0].url),'destination retained as normal Web URL');
    }
    create('https://hissi.org/read.php/android/20261031/test-id.html',true);
    check(starts.length===1&&renders.length===0,'restored/embedded tab cannot bypass patch false');
    check(!Tabs.open.overload('android.app.Activity','java.lang.String','android.content.Intent').call(Tabs,host,'hissi',null),'false rejects new dedicated Hissi tab');
    check(!Tabs.open.overload('android.app.Activity','java.lang.String','android.content.Intent').call(Tabs,host,'checker',null),'false rejects new dedicated checker-result tab');
    }
    // Use a real patch-ON APK for the opposite branch; mocking manifest availability is insufficient.
    prefs.edit().putBoolean(key,false).commit();create('https://hissi.org/read.php/android/20261031/test-id.html',false);
    check(starts.length===1&&renders.length===0,'runtime OFF remains effective with patch ON');
    if(!patchOff){prefs.edit().putBoolean(key,true).commit();create('https://hissi.org/read.php/android/20261031/test-id.html',false);
    check(starts.length===0&&renders.length===1,'patch ON/runtime ON retains dedicated rendering: '+JSON.stringify(starts)+' renders='+renders.length+' runtime='+H.dedicatedViewerEnabled()+' available='+H.dedicatedCheckerViewerAvailable());}
    resolve({version:pkg.slice(-3),checks,actualPatchFalse:patchOff,networkRequests:0});
   }catch(e){reject(Error(String(e.stack||e)));}
   finally{for(const c of controllers)try{c.close();}catch(e){}available.implementation=null;launch.implementation=null;wrappedLaunch.implementation=null;url.implementation=null;const edit=prefs.edit();if(had)edit.putBoolean(key,saved);else edit.remove(key);edit.commit();}
  });
 }});
}));}};
