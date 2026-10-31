rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg)){reject(Error('verification package required'));return;}
 const C=Java.use('app.morphe.extension.chmate.EdgeLevelNg');
 C.schedule(true);let tries=0;const timer=setInterval(()=>Java.perform(()=>{
 const f=C.class.getDeclaredField('queued');f.setAccessible(true);if(Java.cast(f.get(null),Java.use('java.util.concurrent.atomic.AtomicBoolean')).get()){if(++tries>45){clearInterval(timer);reject(Error('sync timeout'));}return;}
 clearInterval(timer);const status=String(C.status.value);if(!status.startsWith('同期済み：確認済み1件')){reject(Error(status));return;}resolve({ok:true,observed:1,noPersonalSubmission:true});
 }),1000);
}));}};