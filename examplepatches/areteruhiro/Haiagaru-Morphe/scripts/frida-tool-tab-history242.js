// Visible WebView history with local HTML/.invalid same-document URLs; no network posting.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 verification clone required');
 if(Java.use('android.os.Build$VERSION').SDK_INT.value>=35)Java.deoptimizeEverything();
 Java.classFactory.loader=app.getClassLoader();
 const H=Java.use('app.morphe.extension.chmate.NativeToolTabHistory');
 let activity,root,web,checks=0;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function main(fn){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{resolve(fn());}catch(e){reject(e);}})));}
 function wait(ms){return new Promise(resolve=>setTimeout(resolve,ms));}
 function evaluate(script){return new Promise((resolve,reject)=>{
  const Callback=Java.registerClass({name:'app.morphe.fixture.ToolHistoryCallback'+Date.now(),implements:[Java.use('android.webkit.ValueCallback')],methods:{onReceiveValue(v){resolve(String(v));}}});
  main(()=>web.evaluateJavascript(script,Callback.$new())).catch(reject);
 });}
 (async function(){try{
  await main(()=>{
   const records=Java.use('android.app.ActivityThread').currentActivityThread().mActivities.value.values().iterator();
   while(records.hasNext()){
    const r=Java.cast(records.next(),Java.use('android.app.ActivityThread$ActivityClientRecord')),a=r.activity.value;
    if(a&&!a.isFinishing()&&a.hasWindowFocus())activity=Java.retain(a);
   }
   check(!!activity,'focused verification Activity available');
   root=Java.retain(Java.use('android.widget.FrameLayout').$new(activity));
   web=Java.retain(Java.use('android.webkit.WebView').$new(activity));web.getSettings().setJavaScriptEnabled(true);
   root.addView(web,Java.use('android.widget.FrameLayout$LayoutParams').$new(-1,-1));
   const host=Java.cast(activity.findViewById(16908290),Java.use('android.view.ViewGroup'));
   host.addView(root,Java.use('android.view.ViewGroup$LayoutParams').$new(-1,180));
   web.loadDataWithBaseURL('https://fixture.invalid/a/','<html><body>LOCAL HISTORY TEST</body></html>','text/html','UTF-8','https://fixture.invalid/a/');
  });
  await wait(700);
  await main(()=>check(!H.navigate(root,false)&&!H.navigate(root,true),'empty Back/Forward are no-ops'));
  await evaluate("history.pushState({},'', '/b/'); 'ready'");await wait(200);
  await main(()=>{check(web.canGoBack(),'same-document local history exists');check(H.navigate(root,false),'Back accepted by production history handler');});
  await wait(250);await main(()=>check(String(web.getUrl())==='https://fixture.invalid/a/','Back reaches previous URL'));
  await main(()=>check(H.navigate(root,true),'Forward accepted by production history handler'));
  await wait(250);await main(()=>{
   check(String(web.getUrl())==='https://fixture.invalid/b/','Forward reaches next URL');
   check(!H.navigate(root,true),'Forward at boundary does nothing');
   root.setVisibility(8);check(!H.navigate(root,false),'hidden browser ignored');root.setVisibility(0);
  });
  console.log('TOOL_TAB_HISTORY_COMPLETE checks='+checks);
 }catch(e){console.log('FAIL '+e.stack);}
 finally{await main(()=>{if(root&&root.getParent())Java.cast(root.getParent(),Java.use('android.view.ViewGroup')).removeView(root);if(web)web.destroy();console.log('HISTORY_FIXTURE_REMOVED');});}
 })();
});
