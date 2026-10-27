// Native blank-tab integration test. Only creates local tabs in the verification clone.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 verification clone required');
 if(Java.use('android.os.Build$VERSION').SDK_INT.value>=35)Java.deoptimizeEverything();
 Java.classFactory.loader=app.getClassLoader();
 const T=Java.use('app.morphe.extension.chmate.NativeToolTabs'),H=Java.use('app.morphe.extension.chmate.Haiagaru');
 const Fragment=Java.use('androidx.fragment.app.Fragment'),Integer=Java.use('java.lang.Integer'),Page=Java.use('o.zzeq');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),had=prefs.contains('nativeToolTabs'),saved=prefs.getBoolean('nativeToolTabs',false);
 let host,checks=0;const created=[];
 function check(ok,text){if(!ok)throw Error(text);checks++;console.log('PASS '+text);}
 function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
 function call(o,n){const m=o.getClass().getMethod(n,Java.array('java.lang.Class',[]));m.setAccessible(true);return m.invoke(o,Java.array('java.lang.Object',[]));}
 function state(home){
  const p=Java.use('java.lang.reflect.Array').get(field(host,'w'),home?0:1),model=field(p,'e'),s=call(field(model,'e'),'d');
  return {model,index:Java.cast(field(s,'b'),Integer).intValue(),pages:Java.cast(field(s,'a'),Java.use('java.util.List'))};
 }
 function main(fn){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{resolve(fn());}catch(e){reject(e);}})));}
 function wait(ms){return new Promise(resolve=>setTimeout(resolve,ms));}
 (async function(){
  try{
   await main(()=>{host=Java.retain(T.manualHost(H.toolbarActivity(null)));check(!!host,'tablet host available');});
   for(const home of [false,true]){
    let previous,base,tool;
    await main(()=>{
     const before=state(home);base=before.pages.size();previous=before.index>=0?Java.retain(Java.cast(before.pages.get(before.index),Page)):null;
     prefs.edit().putBoolean('nativeToolTabs',home).commit();
     const launch=Java.use('android.content.Intent').$new();launch.putExtra.overload('java.lang.String','boolean').call(launch,'haiagaru.blank.fixture',true);
     check(T.createTab(host,'hissi',launch),'create local tool in '+(home?'HOME':'thread'));
    });
    await wait(700);
    await main(()=>{
     let s=state(home);check(s.pages.size()===base+1,'one fixture tool added');
     tool=Java.retain(Java.cast(s.pages.get(s.index),Page));created.push(tool);
     const f=Java.cast(field(tool,'d'),Fragment);check(!!f,'native tool Fragment exists');
     // Change default destination deliberately: New tab must follow actual ownership.
     prefs.edit().putBoolean('nativeToolTabs',!home).commit();
     check(T.newBlankTab(host,f),'native New tab invocation succeeds');
     s=state(home);check(s.pages.size()===base+2,'blank added to same pane despite opposite default');
     const blank=Java.retain(Java.cast(s.pages.get(s.index),Page));created.push(blank);
     check(Java.cast(field(blank,'f'),Integer).intValue()===3,'new page is native blank type 3');
     const model=Java.cast(T.tabletModel(host,'getValue','jp.syoboi.a2chMate.feature.tabletmode.TabletHomeViewModel'),Java.use('jp.syoboi.a2chMate.feature.tabletmode.TabletHomeViewModel'));
     for(const p of [blank,tool])check(model.d.overload('o.zzeq','boolean').call(model,p,false),'native fixture page removal');
     created.splice(0,created.length);
     s=state(home);check(s.pages.size()===base,'original tab count restored');
     if(previous){for(let n=0;n<s.pages.size();n++)if(previous.equals(s.pages.get(n))){const select=s.model.getClass().getMethod('e',Java.array('java.lang.Class',[Integer.TYPE.value]));select.setAccessible(true);select.invoke(s.model,Java.array('java.lang.Object',[Integer.valueOf(n)]));break;}}
    });
   }
   console.log('NATIVE_NEW_BLANK_COMPLETE checks='+checks);
  }catch(e){console.log('FAIL '+e.stack);}
  finally{await main(()=>{
   if(host&&created.length){const m=Java.cast(T.tabletModel(host,'getValue','jp.syoboi.a2chMate.feature.tabletmode.TabletHomeViewModel'),Java.use('jp.syoboi.a2chMate.feature.tabletmode.TabletHomeViewModel'));for(const p of created.reverse())m.d.overload('o.zzeq','boolean').call(m,p,false);}
   const edit=prefs.edit();if(had)edit.putBoolean('nativeToolTabs',saved);else edit.remove('nativeToolTabs');edit.commit();console.log('FIXTURE_CLEANUP_COMPLETE');
  });}
 })();
});
