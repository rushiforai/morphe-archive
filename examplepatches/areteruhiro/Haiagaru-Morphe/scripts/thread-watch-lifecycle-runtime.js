/* Isolated subscriptions; mock all network responses and restore every preference. */
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.bindings(191|226|242)$/.test(String(app.getPackageName())))throw Error('isolated bindings only');
 const W=Java.use('app.morphe.extension.chmate.ThreadWatch'),M=Java.use('app.morphe.extension.chmate.ThreadWatchManagement'),B=Java.use('app.morphe.extension.chmate.ThreadWatchBackup'),J=Java.use('org.json.JSONObject'),A=Java.use('java.util.concurrent.atomic.AtomicBoolean');
 const p=W.prefs(app),o=app.getSharedPreferences('haiagaru_thread_watch_options',0),r=Java.use('app.morphe.extension.chmate.RefreshTargets').prefs(app);
 if(!p.getAll().isEmpty())throw Error('existing subscriptions');
 const saved=[p,o,r].map(x=>[x,Java.retain(x.getAll())]),url='https://fixture.invalid/test/read.cgi/lifecycle/1790000999/',checks=[];
 const check=(ok,label)=>{if(!ok)throw Error(label);checks.push(label);},item=()=>J.$new(p.getString(url,'{}')),put=v=>p.edit().putString(url,JSON.stringify(v)).commit(),tick=()=>W.check(app,A.$new(false));
 let subject='1790000998.dat<>Other (5)\n',status=404,requests=0,datReads=0;
 W.fetch.implementation=function(address,cancel){requests++;if(String(address).endsWith('subject.txt'))return subject;datReads++;if(status)throw Java.use('app.morphe.extension.chmate.ThreadWatch$HttpStatus').$new(status);return 'name<>sage<>date<>body<>title\n';};
 try{
  o.edit().remove('durationMinutes').commit();check(M.defaultDuration(app)===10080,'new default is seven days');
  put({count:10,token:'expired',expiresAt:Date.now()-1000});tick();check(requests===0&&!W.hasActive(app),'expired registration makes no requests');
  check(String(M.status(item())).includes('期限切れ'),'expired state visible in management');
  W.completed(app);check(Java.cast(app.getSystemService('jobscheduler'),Java.use('android.app.job.JobScheduler')).getPendingJob(0x48690031)===null,'last expired subscription cancels job');
  put({count:10,token:'legacy'});check(W.hasActive(app),'legacy registration remains unlimited');
  tick();check(!item().optBoolean('paused',false)&&datReads===0,'one subject omission does not stop or fetch DAT');
  put({count:10,token:'missing',missingChecks:2,missingSince:Date.now()-31*60000});tick();check(item().getBoolean('paused')&&String(item().getString('pauseReason'))==='missing','repeated omissions plus DAT 404 stop monitoring');
  const before=requests;tick();check(requests===before,'dat-expired subscription skips requests');
  for(const code of [403,500,0,410]){
   status=code;put({count:10,token:'status-'+code,missingChecks:2,missingSince:Date.now()-31*60000});tick();
   check(item().optBoolean('paused',false)===(code===410),'only explicit gone status stops: '+code);
  }
  subject='<html>error</html>';put({count:10,token:'empty',missingChecks:2,missingSince:Date.now()-31*60000});const oldDat=datReads;tick();check(datReads===oldDat&&!item().optBoolean('paused',false),'invalid subject cannot stop subscription');
  subject='1790000999.dat<>Watched title (10)\n';tick();check(item().getInt('missingChecks')===0&&item().getLong('missingSince').toString()==='0'&&String(item().getString('title'))==='Watched title','returning subject resets missing evidence and saves title');
  r.edit().putBoolean('watchAfterPosting',true).putBoolean('watchAutoRepliesOnly',true).putBoolean('watchAutoStopAfterReply',true).commit();
  put({count:10,token:'manual',repliesOnly:false,stopAfterReply:false,durationMinutes:60,paused:true});W.confirmed(url+'11');
  check(!item().getBoolean('repliesOnly')&&!item().getBoolean('stopAfterReply')&&!item().getBoolean('paused'),'automatic posting preserves individual options and resumes');
  const end=Number(item().getLong('expiresAt').toString());check(end>Date.now()+59*60000&&end<=Date.now()+61*60000,'posting renews individual deadline');
  p.edit().remove(url).commit();W.confirmed(url+'12');check(item().getBoolean('repliesOnly')&&item().getBoolean('stopAfterReply')&&item().getInt('durationMinutes')===10080,'new automatic registration uses defaults');
  const backup=B.capture(app),deadline=String(item().getLong('expiresAt'));p.edit().remove(url).commit();B.restore(app,backup,false);
  check(String(item().getLong('expiresAt'))===deadline&&item().getInt('durationMinutes')===10080,'backup preserves absolute deadline without extending');
  const legacy=J.$new('{"intervalMinutes":15,"threads":[{"url":"'+url+'","count":10}]}');B.restore(app,legacy,false);
  check(item().getLong('expiresAt').toString()==='0'&&item().getInt('durationMinutes')===0,'old backup keeps unlimited expiry');
  for(const bad of [-1,1.5,43201]){const data=J.$new('{"intervalMinutes":15,"threads":[],"durationMinutes":'+bad+'}');let failed=false;try{B.validate(data);}catch(e){failed=true;}check(failed,'reject invalid duration '+bad);}
  resolve({ok:true,version:String(app.getPackageName()).slice(-3),checks:checks.length,labels:checks,realNetworkRequests:0});
 }catch(e){reject(Error(String(e.stack||e)));}finally{
  W.fetch.implementation=null;
  for(const [prefs,map] of saved){const edit=prefs.edit().clear(),it=map.entrySet().iterator();while(it.hasNext()){const row=Java.cast(it.next(),Java.use('java.util.Map$Entry')),key=String(row.getKey()),v=row.getValue(),type=String(v.getClass().getName()),value=Java.cast(v,Java.use(type));if(type==='java.lang.String')edit.putString(key,String(v));else if(type==='java.lang.Integer')edit.putInt(key,value.intValue());else if(type==='java.lang.Long')edit.putLong(key,value.longValue());else if(type==='java.lang.Boolean')edit.putBoolean(key,value.booleanValue());else if(type==='java.lang.Float')edit.putFloat(key,value.floatValue());else if(Java.use('java.util.Set').class.isInstance(v))edit.putStringSet(key,Java.cast(v,Java.use('java.util.Set')));else throw Error('unsupported pref type '+type);}edit.commit();}
  W.schedule.overload('android.content.Context').call(W,app);
 }
}));}};
