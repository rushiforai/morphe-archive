// Isolated verification packages only. Cache-only reads never fetch a live board.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const P='app.morphe.extension.chmate.',app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg)){reject(Error('verification app required'));return;}
 const Class=Java.use('java.lang.Class'),Obj=Java.use('java.lang.Object'),Str=Java.use('java.lang.String'),loader=app.getClassLoader(),classes=x=>Java.array('java.lang.Class',x),objects=x=>Java.array('java.lang.Object',x);let count=0;function check(ok,s){if(!ok)throw Error(s);count++;}
 function type(n){return Class.forName(n,false,loader);}const B=type('jp.syoboi.a2chMate.client.BBSUrlInfo');
 function parse(value){
  const args=objects([Str.$new(value)]);
  for(const m of B.getDeclaredMethods())if((m.getModifiers()&8)!==0&&m.getReturnType().equals(B)&&m.getParameterTypes().length===1&&String(m.getParameterTypes()[0].getName())==='java.lang.String'){m.setAccessible(true);const u=m.invoke(null,args);if(u)return u;}
  for(const f of B.getDeclaredFields())if((f.getModifiers()&8)!==0&&String(f.getType().getName()).startsWith('jp.syoboi.a2chMate.client.BBSUrlInfo$')){f.setAccessible(true);const companion=f.get(null);if(!companion)continue;for(const m of companion.getClass().getDeclaredMethods())if((m.getModifiers()&8)===0&&m.getReturnType().equals(B)&&m.getParameterTypes().length===1&&String(m.getParameterTypes()[0].getName())==='java.lang.String'){m.setAccessible(true);const u=m.invoke(companion,args);if(u)return u;}}
  throw Error('native board parser unavailable');
 }
 const historyPrefs=app.getSharedPreferences('haiagaru_patrol_errors',0),hadHistory=historyPrefs.contains('entries'),savedHistory=historyPrefs.getString('entries','[]');
 const legacy=pkg.endsWith('191'),middle=pkg.endsWith('226'),readerClass=type(legacy?'o.getLabel':middle?'o.OpenJSSEPlatformCompanion':'o.getImageView');let reader,hook,statuses=[];
 try{
  if(legacy||middle){const ctor=readerClass.getDeclaredConstructor(classes([Java.use('android.content.Context').class]));ctor.setAccessible(true);reader=ctor.newInstance(objects([app]));}
  else {const companion=type('jp.syoboi.a2chMate.RoidonApp$IconCompatParcelizer'),get=companion.getDeclaredMethod('k',classes([]));get.setAccessible(true);const client=get.invoke(null,objects([])),ctor=readerClass.getDeclaredConstructors()[0];ctor.setAccessible(true);reader=ctor.newInstance(objects([client,app]));}
  const read=readerClass.getDeclaredMethod(legacy?'b':'e',classes([B]));read.setAccessible(true);
  const Cache=Java.use(P+'NativeSubjectCache');hook=Cache.result.overload('java.lang.Object','int');hook.implementation=function(value,status){statuses.push(status);return hook.call(this,value,status);};
  for(let i=0;i<10;i++){const u=parse('https://bbs.eddibb.cc/haiagaru_cache_fixture_98765432'+i+'/'),result=read.invoke(reader,objects([u]));check(result===null,'cache miss '+i+' must fall back to native reload');}
  check(statuses.length===10&&statuses.every(s=>s===504),'all cache misses are local HTTP 504, not successful empty boards');
  const Details=Java.use(P+'PatrolErrorDetails');
  Details.begin();Details.recordInfo(parse('https://bbs.eddibb.cc/haiagaru_cache_fixture_987654321/'),Java.use('java.net.SocketTimeoutException').$new('fixture-do-not-store'));
  Details.end();
  const history=JSON.parse(String(historyPrefs.getString('entries','[]')));
  check(history.length>0&&history[0].url.replace(/^http:/,'https:')==='https://bbs.eddibb.cc/haiagaru_cache_fixture_987654321/','all versions persist the native board URL (legacy native getter may use http)');
  check(history[0].type==='SocketTimeoutException'&&history[0].time>0&&!JSON.stringify(history).includes('fixture-do-not-store'),'history stores timestamp and type, no exception message');
  check(String(Details.append('next patrol'))==='next patrol','completed patrol clears session');
  Details.begin();for(let i=0;i<105;i++)Details.recordInfo(parse('https://bbs.eddibb.cc/haiagaru_history_fixture_'+i+'/'),Java.use('java.io.IOException').$new('never-store-this-message'));
  Details.end();
  const bounded=JSON.parse(String(historyPrefs.getString('entries','[]')));
  check(bounded.length===100,'history bounded to 100 entries');
  check(bounded[0].url.endsWith('/haiagaru_history_fixture_0/')&&bounded[99].url.endsWith('/haiagaru_history_fixture_99/'),'first 100 failures retained within one patrol');
  if(legacy||middle){
   const worker=type('jp.syoboi.a2chMate.autocheck.AutoCheckWork'),fetch=Array.from(worker.getDeclaredMethods()).find(m=>String(m.getName())==='haiagaruPatrolBoardFetch');
   check(!!fetch,'legacy worker exposes scoped native board-fetch wrapper');fetch.setAccessible(true);
   const fixture=parse('https://bbs.eddibb.cc/haiagaru_native_failure_fixture/');let args=[app,null,fixture,Java.use('java.lang.Boolean').FALSE.value,null];
   if(middle){const f=type('o.dispatchTouchEvent').getDeclaredField('d');f.setAccessible(true);args.unshift(f.get(null));}
   Details.begin();let thrown=false;try{fetch.invoke(null,objects(args));}catch(e){thrown=true;}
   const text=String(Details.append('offline worker error'));
   check(thrown&&/https?:\/\/bbs\.eddibb\.cc\/haiagaru_native_failure_fixture\//.test(text),'native fetch failure logged and still thrown; null reader prevents network');
  }
  if(!legacy&&!middle){
   const D=Java.use(P+'PatrolErrorDetails'),url=parse('https://bbs.eddibb.cc/haiagaru_cache_fixture_987654321/');
   function field(c,n){const f=c.getDeclaredField(n);f.setAccessible(true);return f;}
   const lazy=field(url.getClass(),'c').get(url),getValue=lazy.getClass().getMethod('getValue',classes([]));getValue.setAccessible(true);const boardId=getValue.invoke(lazy,objects([])),U=Java.use('sun.misc.Unsafe'),unsafe=Java.cast(field(U.class,'theUnsafe').get(null),U),boardClass=type('o.KeJGNk'),board=unsafe.allocateInstance(boardClass);
   field(boardClass,'c').set(board,boardId);field(boardClass,'f').set(board,Str.$new('bbs.eddibb.cc'));
   D.begin();try{D.record(board,Java.use('java.net.SocketTimeoutException').$new('fixture token=do-not-export'));D.record(board,Java.use('java.io.IOException').$new('duplicate'));const text=String(D.append('Native patrol summary'));check(text.startsWith('Native patrol summary'),'native summary retained');check(text.includes('https://bbs.eddibb.cc/haiagaru_cache_fixture_987654321/'),'error board URL appended');check(text.includes('SocketTimeoutException')&&!text.includes('do-not-export')&&!text.includes('duplicate'),'type only and board deduplicated');check(String(D.append('next patrol'))==='next patrol','session cleared');}finally{D.end();}
  }
  resolve({version:legacy?'191':middle?'226':'242',checks:count,cacheMissStatuses:statuses});
 }catch(e){reject(Error(String(e.stack||e)));}finally{if(hook)hook.implementation=null;const edit=historyPrefs.edit();if(hadHistory)edit.putString('entries',savedHistory);else edit.remove('entries');edit.commit();}
}));}};
