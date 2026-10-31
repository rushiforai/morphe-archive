// Scheduler-only integration: intercepted collect() prevents NG reads, writes and HTTP.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),P=Java.use('app.morphe.extension.chmate.PersonalNgSubmissions'),prefs=app.getSharedPreferences('haiagaru.personal-ng-submissions',0),has=prefs.contains('consent'),old=prefs.getBoolean('consent',false),checks=[];
 const retry=P.class.getDeclaredField('retryTask');retry.setAccessible(true);const original=retry.get(null);let delay=-1;if(original!==null)delay=Java.cast(original,Java.use('java.util.concurrent.Delayed')).getDelay(Java.use('java.util.concurrent.TimeUnit').MILLISECONDS.value);
 const collect=P.collect.overload();let calls=0,finished=false;collect.implementation=function(){calls++;};
 function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 function later(fn,ms){setTimeout(()=>Java.perform(()=>{try{fn();}catch(e){finish(e);}}),ms);}
 function finish(error){if(finished)return;finished=true;P.cancelRetry();const e=prefs.edit();if(has)e.putBoolean('consent',old);else e.remove('consent');e.commit();collect.implementation=null;if(delay>=0&&old)P.scheduleRetry(Math.max(1000,delay));if(error)reject(Error(String(error.stack||error)));else resolve({checks,collectIntercepted:true,networkRequests:false});}
 try{
  P.cancelRetry();prefs.edit().putBoolean('consent',true).commit();for(let i=0;i<20;i++)P.changed();
  check(calls===0,'native-save trigger waits off main thread');
  later(()=>{check(calls===1,'rapid NG saves collected once');P.changed();
   later(()=>{check(calls===2,'next NG save creates a new trigger');P.scheduleRetry(900000);let first=retry.get(null);check(first!==null,'pending failure schedules one retry');P.scheduleRetry(1000);check(Java.cast(first,Java.use('java.util.concurrent.Future')).isCancelled(),'new pending retry cancels old one');
    later(()=>{check(calls===3&&retry.get(null)===null,'retry runs once without recurring polling');P.scheduleRetry(1000);const queued=retry.get(null);prefs.edit().putBoolean('consent',false).commit();P.cancelRetry();
     later(()=>{check(calls===3&&Java.cast(queued,Java.use('java.util.concurrent.Future')).isCancelled(),'consent OFF cancels pending retry');P.changed();later(()=>{check(calls===3,'no save trigger while consent OFF');finish();},1200);},1200);
    },1400);
   },1400);
  },1400);
 }catch(e){finish(e);}
}));}};
