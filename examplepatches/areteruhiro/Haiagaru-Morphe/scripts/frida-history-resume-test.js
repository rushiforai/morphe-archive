// All HTTP fetches are replaced with a deterministic interruption. No external requests.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=app.getPackageName().toString();
 if(!pkg.endsWith('.resumefix226'))throw Error('Dedicated 226 fixture only');
 const S=Java.use('app.morphe.extension.chmate.WacchoiSearchService'),J=Java.use('app.morphe.extension.chmate.WacchoiBackgroundJob');
 const H=Java.use('app.morphe.extension.chmate.WacchoiHistory'),I=Java.use('android.content.Intent');
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
 const saved=['wacchoiSearchEnabled','wacchoiSearchHistory'].map(k=>[k,p.contains(k),p.getBoolean(k,true)]);
 const ids=[Java.use('java.util.UUID').randomUUID().toString(),Java.use('java.util.UUID').randomUUID().toString()];
 const historyIds=[],urls=[],previous=S.current.value;
 let checks=0;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function args(i,resume){
  const intent=I.$new();intent.setClassName(pkg,'app.morphe.extension.chmate.WacchoiSearchService');
  for(const pair of [['haiagaru.searchJobId',ids[i]],['boards','android'],['from','20261020'],['to','20261020'],['four','Ab12'],['startAt','3']])
   intent.putExtra.overload('java.lang.String','java.lang.String').call(intent,pair[0],pair[1]);
  intent.putExtra.overload('java.lang.String','int').call(intent,'limit',100);
  if(resume)intent.putExtra.overload('java.lang.String','java.lang.String').call(intent,'resumeHistory',resume);
  return intent;
 }
 function cleanup(){
  for(let i=0;i<ids.length;i++){const j=S.get(ids[i]);if(j!==null&&!j.running.value){j.release();S.JOBS.value.remove(ids[i]);}}
  S.current.value=previous;
  const set=Java.use('java.util.HashSet').$new();historyIds.forEach(id=>set.add(Java.use('java.lang.String').$new(id)));
  H.deleteNow(app,set,false);
  const e=p.edit();saved.forEach(v=>v[1]?e.putBoolean(v[0],v[2]):e.remove(v[0]));e.commit();J.fetch.implementation=null;
  console.log('HISTORY_FIXTURE_CLEANUP '+checks);
 }
 J.fetch.implementation=function(url){
  urls.push(url.toString());
  this.publishResult('http://hissi.org/read.php/android/20261020/example.html\nfixture','fixture result');
  throw Java.use('java.lang.InterruptedException').$new('fixture: interrupted page');
 };
 function step(delay,fn){setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{fn();}catch(e){console.log('FAIL '+e.stack);cleanup();}})),delay);}
 step(0,()=>{check(S.jobs().size()===0,'no existing jobs');p.edit().putBoolean('wacchoiSearchEnabled',true).putBoolean('wacchoiSearchHistory',true).commit();app.startForegroundService(args(0,null));});
 step(3000,()=>{
  const first=S.get(ids[0]);check(first!==null&&!first.running.value,'interrupted worker finished');
  const id=first.history.value.data.value.getString('id').toString();historyIds.push(id);
  const disk=H.readOne(app,id);
  check(disk.getJSONObject('checkpoint').getInt('page')===3,'stopped position persisted on disk');
  check(disk.getJSONArray('results').length()===1,'results persisted on disk');
  app.startForegroundService(args(1,id));
 });
 step(6500,()=>{
  const second=S.get(ids[1]);check(second!==null&&!second.running.value,'new worker restored durable history');
  check(urls.length===2&&urls[0]===urls[1]&&urls[1].endsWith('?p=3'),'interrupted page replayed at correct board/date/page');
  check(second.records().size()===1,'seeded results are not duplicated on replay');
  const id=second.history.value.data.value.getString('id').toString();historyIds.push(id);
  check(H.readOne(app,id).getJSONArray('results').length()===1,'resumed history deduplicated on disk');
  console.log('PASS '+checks+' disk history resume checks');cleanup();
 });
});
