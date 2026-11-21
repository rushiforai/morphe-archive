/* Synthetic ListView/marker rows in reporter apps only; no network, posts or read-state writes. */
rpc.exports={run(){return new Promise((resolve,reject)=>Java.perform(()=>{try{
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!String(app.getPackageName()).match(/\.haiagaru\.(reporter191|reporter226|reporter242)$/))throw Error('isolated reporter app required');
 const loader=Java.use('dalvik.system.DexClassLoader').$new('/data/local/tmp/haiagaru-position-fixture.dex',String(app.getCodeCacheDir().getAbsolutePath()),null,app.getClassLoader());
 const test=Java.ClassFactory.get(loader).use('app.morphe.extension.chmate.PositionTest');
 const LV=Java.use('android.widget.ListView'),selection=LV.setSelectionFromTop.overload('int','int'),requests=[];
 selection.implementation=function(position,offset){if(String(this.getTag())==='haiagaru.read-marker-fixture')requests.push({position:Number(position),offset:Number(offset)});return selection.call(this,position,offset);};
 let activity;
 Java.choose('jp.syoboi.a2chMate.activity.ResListActivity',{onMatch(a){if(!activity&&!a.isFinishing())activity=Java.retain(a);},onComplete(){}});
 if(!activity)Java.choose('jp.syoboi.a2chMate.activity.HomeActivity',{onMatch(a){if(!activity&&!a.isFinishing())activity=Java.retain(a);},onComplete(){}});
 if(!activity)throw Error('live reporter Activity required');
 Java.scheduleOnMainThread(()=>{try{test.start(activity);}catch(error){reject(new Error(String(error.stack||error)));}});
 let tries=0;const timer=setInterval(()=>Java.perform(()=>{
  const result=String(test.result.value);
  if(result.startsWith('PASS')){clearInterval(timer);selection.implementation=null;const aligned=requests.some(r=>r.position===1&&r.offset===0);if(!aligned)reject(new Error('no ListView.setSelectionFromTop(1,0) for read boundary: '+JSON.stringify(requests)));else resolve(result+'; Frida observed native alignment request');}
  else if(result.startsWith('FAIL')){clearInterval(timer);selection.implementation=null;reject(new Error(result));}
  else if(++tries>=300){clearInterval(timer);selection.implementation=null;reject(new Error('position fixture timed out: '+result));}
 }),100);
}catch(error){reject(new Error(String(error.stack||error)));}}));}};
