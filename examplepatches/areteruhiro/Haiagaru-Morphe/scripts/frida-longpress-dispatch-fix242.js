// Emulator-only prototype of deferring the entire dialog/navigation operation.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!String(app.getPackageName()).endsWith('.resumefix242'))throw Error('Verification only');
 const D=Java.use('app.morphe.extension.chmate.HaiagaruDialog');
 const jobs=new Map();let id=0;
 const Run=Java.registerClass({name:'app.morphe.verification.DeferredFilterNavigation'+Date.now(),
 implements:[Java.use('java.lang.Runnable')],fields:{job:'int'},methods:{run:function(){
  const job=jobs.get(this.job.value);if(!job)return;jobs.delete(this.job.value);
  try{job.dialog.dismiss();console.log('DEFERRED_DISMISS showing='+job.dialog.isShowing()+' attached='+job.dialog.getWindow().getDecorView().isAttachedToWindow());job.action.run();console.log('DEFERRED_NATIVE_ACTION_COMPLETE');}
  catch(e){console.log('FAIL DEFERRED '+e.stack);}
 }}});
 D.dismissForNavigation.implementation=function(action){const n=++id;jobs.set(n,{dialog:Java.retain(this),action:Java.retain(action)});
  const task=Run.$new();task.job.value=n;Java.use('android.os.Handler').$new(Java.use('android.os.Looper').getMainLooper()).post(task);
 };
 console.log('DEFERRED_NAVIGATION_HOOK_READY');
});
