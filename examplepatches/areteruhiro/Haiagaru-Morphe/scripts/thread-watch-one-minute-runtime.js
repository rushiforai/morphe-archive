rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const P='app.morphe.extension.chmate.',app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.migration191242'){reject(Error('Isolated package required'));return;}
 const W=Java.use(P+'ThreadWatch'),p=app.getSharedPreferences('haiagaru_thread_watch',0),o=app.getSharedPreferences('haiagaru_thread_watch_options',0);
 if(!p.getAll().isEmpty()){reject(Error('Existing registrations must be preserved'));return;}
 const had=o.contains('minutes'),saved=o.getInt('minutes',15),jobs=Java.cast(app.getSystemService('jobscheduler'),Java.use('android.app.job.JobScheduler'));
 const schedule=Java.use(String(jobs.getClass().getName())).schedule.overload('android.app.job.JobInfo'),start=Java.use(P+'ThreadWatchService').onStartJob;
 let calls=0,checks=0;function check(v,label){if(!v)throw Error(label);checks++;}
 schedule.implementation=function(job){if(job.getId()===0x48690031)calls++;return schedule.call(this,job);};
 start.implementation=function(parameters){return false;};
 try{
  p.edit().putString('https://fixture.invalid/test/read.cgi/a/1793113633/','{"count":-1,"token":"short-interval"}').commit();
  for(const minutes of [1,2,14,15,30,10080]){
   o.edit().putInt('minutes',minutes).commit();W.schedule.overload('android.content.Context').call(W,app);
   const job=jobs.getPendingJob(0x48690031);check(job!==null&&job.isPersisted(),'persisted '+minutes);
   check(job.isPeriodic()===(minutes>=15),'scheduling mode '+minutes);
   check(Number(minutes>=15?job.getIntervalMillis():job.getMinLatencyMillis())===minutes*60000,'requested delay '+minutes);
   const before=calls;W.schedule.overload('android.content.Context').call(W,app);check(calls===before,'duplicate schedule suppressed '+minutes);
   W.completed(app);check(calls===before+(minutes<15?1:0),'completion re-arms only short job '+minutes);
  }
  o.edit().putInt('minutes',1).commit();W.schedule.overload('android.content.Context').call(W,app);
  p.edit().clear().commit();W.completed(app);check(jobs.getPendingJob(0x48690031)===null,'completion cannot resurrect removed registration');
  o.edit().remove('minutes').commit();check(W.interval(app)===15,'initial value remains 15');
  W.completed(app);check(jobs.getPendingJob(0x48690031)===null,'periodic completion cannot create a new job');
  resolve({checks,networkRequests:0,shortDelayMinutes:[1,2,14],periodicMinutes:[15,30,10080]});
 }catch(e){reject(Error(String(e.stack||e)));}finally{
  p.edit().clear().commit();if(had)o.edit().putInt('minutes',saved).commit();else o.edit().remove('minutes').commit();W.schedule.overload('android.content.Context').call(W,app);schedule.implementation=null;start.implementation=null;
 }
}));}};
