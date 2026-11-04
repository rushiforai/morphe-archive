/* Synthetic notification fixtures, no real network or posting. */
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!/\.haiagaru\.bindings(191|226|242)$/.test(String(app.getPackageName())))throw Error('isolated binding app only');
 const W=Java.use('app.morphe.extension.chmate.ThreadWatch'),J=Java.use('org.json.JSONObject'),B=Java.use('app.morphe.extension.chmate.ThreadWatchBackup'),Atomic=Java.use('java.util.concurrent.atomic.AtomicBoolean');
 const nativePrefs=Java.use('android.preference.PreferenceManager').getDefaultSharedPreferences(app),hadNative=nativePrefs.contains('notifyReply'),savedNative=nativePrefs.getBoolean('notifyReply',true);nativePrefs.edit().putBoolean('notifyReply',false).commit();
 const p=app.getSharedPreferences('haiagaru_thread_watch',0),url='https://jbbs.shitaraba.net/bbs/read.cgi/computer/987654/1790000001/',nm=Java.cast(app.getSystemService('notification'),Java.use('android.app.NotificationManager'));
 if(!p.getAll().isEmpty())throw Error('Existing subscriptions must be preserved');
 let count=10,reads=0,fail=false,checks=[];
 const check=(ok,label)=>{if(!ok)throw Error(label);checks.push(label);},item=()=>J.$new(p.getString(url,'{}')),notes=()=>nm.getActiveNotifications().filter(n=>String(n.getTag())===url),put=obj=>p.edit().putString(url,JSON.stringify(obj)).commit(),tick=()=>W.check(app,Atomic.$new(false));
 const own=Java.use('app.morphe.extension.chmate.ThreadWatchOwnPosts').read.overload('android.content.Context','app.morphe.extension.chmate.ThreadWatchRules$Target');
 own.implementation=function(context,target){const set=Java.use('java.util.HashSet').$new();set.add(Java.use('java.lang.Integer').valueOf(3));return set;};
 W.fetch.implementation=function(address,cancel){reads++;if(String(address).endsWith('subject.txt'))return '1790000001.cgi,したらば通知テスト('+count+')\n';if(fail)throw Java.use('java.io.IOException').$new('controlled body unavailable');let dat='';for(let n=1;n<=count;n++)dat+=n+'<>name<>sage<>date<>'+(n===11||n===16?'&gt;&gt;3 返信 '+n:'通常 '+n)+'<>title<>ID\n';return dat;};
 try{
  put({count:10,token:'fixture',repliesOnly:true,stopAfterReply:true});tick();check(reads===1&&notes().length===0,'unchanged count silent');count=15;tick();
  check(notes().length===1,'reply-only notification posted');const extra=notes()[0].getNotification().extras.value;check(String(extra.getString('android.title'))==='したらば通知テスト','thread title present');check(String(extra.getCharSequence('android.text')).includes('>>11')&&!String(extra.getCharSequence('android.text')).includes('通常'),'reply before last three retained; unrelated bodies excluded');check(item().getBoolean('paused'),'stop option pauses after reply notification');
  W.completed(app);check(!W.hasActive(app)&&Java.cast(app.getSystemService('jobscheduler'),Java.use('android.app.job.JobScheduler')).getPendingJob(0x48690031)===null,'paused final thread cancels periodic job');const before=reads;tick();check(reads===before,'paused thread skips all requests');
  put({count:15,token:'continuous',repliesOnly:true,stopAfterReply:false});count=16;tick();check(item().getInt('count')===16&&!item().optBoolean('paused',false),'stop option off continues monitoring');
  fail=true;count=17;tick();check(item().getInt('count')===16&&!item().optBoolean('paused',false),'body failure preserves unnotified count');
  put({count:16,token:'backup',repliesOnly:true,stopAfterReply:true,paused:true,own:[3,7]});const data=B.capture(app);p.edit().remove(url).commit();B.restore(app,data,false);check(item().getBoolean('repliesOnly')&&item().getBoolean('stopAfterReply')&&item().getBoolean('paused')&&item().getJSONArray('own').length()===2,'notification settings and own numbers survive backup');check(String(item().getString('token'))!=='backup','backup renews operation token');
  resolve({ok:true,checks:checks.length,labels:checks,realNetworkRequests:0,realPosts:0});
 }catch(e){reject(Error(String(e.stack||e)));}finally{if(hadNative)nativePrefs.edit().putBoolean('notifyReply',savedNative).commit();else nativePrefs.edit().remove('notifyReply').commit();p.edit().remove(url).commit();nm.cancel.overload('java.lang.String','int').call(nm,url,0x48690031);W.fetch.implementation=null;own.implementation=null;W.schedule.overload('android.content.Context').call(W,app);}
}));}};
