'use strict';
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const P='app.morphe.extension.chmate.',app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.migration191242'){reject(Error('Isolated package required'));return;}
 const W=Java.use(P+'ThreadWatch'),pref=app.getSharedPreferences('haiagaru_thread_watch',0),nm=Java.cast(app.getSystemService('notification'),Java.use('android.app.NotificationManager'));
 const options=app.getSharedPreferences('haiagaru_thread_watch_options',0),hadMinutes=options.contains('minutes'),savedMinutes=options.getInt('minutes',15);
 if(!pref.getAll().isEmpty()){reject(Error('Existing watch registrations must be preserved'));return;}
 const Atomic=Java.use('java.util.concurrent.atomic.AtomicBoolean'),fetch=W.fetch,Json=Java.use('org.json.JSONObject');
 const startJob=Java.use(P+'ThreadWatchService').onStartJob;startJob.implementation=function(parameters){return false;};
 const url='https://fixture.invalid/test/read.cgi/a/1793113633/',url2='https://fixture.invalid/test/read.cgi/a/1793113634/';
 let checks=0,reads=0,response='1793113633.dat<>fixture (10)\n1793113634.dat<>second (20)\n',race=false;
 function check(value,label){if(!value)throw Error(label);checks++;}
 function stored(key){return Json.$new(pref.getString(key,'{}'));}
 fetch.implementation=function(address,cancel){reads++;if(race){pref.edit().putString(url,'{"count":-1,"token":"new-registration"}').commit();race=false;}return response;};
 try{
  options.edit().remove('minutes').commit();
  pref.edit().putString(url,'{"count":-1,"token":"one"}').putString(url2,'{"count":-1,"token":"two"}').commit();
  W.schedule(app);const jobs=Java.cast(app.getSystemService('jobscheduler'),Java.use('android.app.job.JobScheduler'));
  const job=jobs.getPendingJob(0x48690031);check(job!==null&&Number(job.getIntervalMillis())===900000&&job.isPersisted(),'persisted 15 minute job');
  for(const minutes of [17,30,60,1440,10080]){options.edit().putInt('minutes',minutes).commit();W.schedule(app);check(Number(jobs.getPendingJob(0x48690031).getIntervalMillis())===minutes*60000,'custom interval '+minutes);}
  options.edit().remove('minutes').commit();W.schedule(app);
  W.check(app,Atomic.$new(false));check(reads===1,'one fetch per board reads='+reads);check(stored(url).getInt('count')===10&&stored(url2).getInt('count')===20,'initial baseline');
  check(nm.getActiveNotifications().filter(n=>String(n.getTag())===url).length===0,'no initial notification');
  response='1793113633.dat<>fixture (12)\n1793113634.dat<>second (20)\n';W.check(app,Atomic.$new(false));
  let notes=nm.getActiveNotifications().filter(n=>String(n.getTag())===url);check(notes.length===1,'new responses notify');
  check(String(notes[0].getNotification().extras.value.getString('android.subText')).includes('2件'),'delta in notification');
  W.check(app,Atomic.$new(false));check(nm.getActiveNotifications().filter(n=>String(n.getTag())===url).length===1&&stored(url).getInt('count')===12,'no duplicate');
  response='1793113633.dat<>fixture (9)\n';W.check(app,Atomic.$new(false));check(stored(url).getInt('count')===12,'decrease does not reset');
  response='<html>challenge</html>';W.check(app,Atomic.$new(false));check(stored(url).getInt('count')===12,'challenge does not consume count');
  const oldReads=reads;W.check(app,Atomic.$new(true));check(reads===oldReads,'cancelled job avoids fetch');
  response='1793113633.dat<>fixture (15)\n';race=true;W.check(app,Atomic.$new(false));check(stored(url).getInt('count')===-1,'old result cannot alter new registration');
  pref.edit().clear().commit();W.schedule(app);check(jobs.getPendingJob(0x48690031)===null,'last removal cancels periodic job');
 }catch(e){fetch.implementation=null;pref.edit().clear().commit();W.schedule(app);nm.cancel.overload('java.lang.String','int').call(nm,url,0x48690031);reject(Error(String(e.stack||e)));return;}
 finally{fetch.implementation=null;pref.edit().clear().commit();if(hadMinutes)options.edit().putInt('minutes',savedMinutes).commit();else options.edit().remove('minutes').commit();W.schedule(app);startJob.implementation=null;nm.cancel.overload('java.lang.String','int').call(nm,url,0x48690031);nm.cancel.overload('java.lang.String','int').call(nm,url2,0x48690031);}
 Java.scheduleOnMainThread(()=>{try{
  const H=Java.use(P+'Haiagaru'),a=H.toolbarActivity(null),E=Java.use(P+'EmojiFontFallback'),Edit=Java.use('android.widget.EditText'),System=Java.use('java.lang.System');
  function field(n){const f=E.class.getDeclaredField(n);f.setAccessible(true);return f;}
  function plain(value){return String(Java.use('java.lang.String').valueOf.overload('java.lang.Object').call(Java.use('java.lang.String'),value));}
  const mode=field('renderMode'),font=field('emojiTypeface'),beforeMode=mode.get(null),beforeFont=font.get(null);
  const e=Edit.$new(a),Span=Java.use('android.view.inputmethod.BaseInputConnection');
  try{
   font.set(null,Java.use('android.graphics.Typeface').createFromAsset(app.getAssets(),'haiagaru/NotoColorEmoji.ttf'));
   for(const m of ['all','missing'])for(const text of ['a','あ','abc😀def','👁️‍🗨️']){
    mode.set(null,Java.use('java.lang.String').$new(m));Java.use('android.widget.TextView').setText.overload('java.lang.CharSequence').call(e,Java.use('java.lang.String').$new(text));
    const editable=e.getText(),identity=System.identityHashCode(editable);e.setSelection(text.length);Span.setComposingSpans(editable);
    const start=Span.getComposingSpanStart(editable),end=Span.getComposingSpanEnd(editable);
    for(let i=0;i<3;i++)E.applyToRow(e);
    check(System.identityHashCode(e.getText())===identity&&plain(e.getText())===text,'editable preserved '+m+text);
    check(e.getSelectionStart()===text.length&&e.getSelectionEnd()===text.length,'selection preserved '+m+text);
    check(Span.getComposingSpanStart(e.getText())===start&&Span.getComposingSpanEnd(e.getText())===end,'IME preserved '+m+text);
    const input=Java.use('java.lang.String').$new(text);check(plain(H.processEmojiTextForView(e,input))===text,'native editor bridge '+m+text);
   }
  }finally{mode.set(null,beforeMode);font.set(null,beforeFont);}
  const ra=Java.use(P+'ReadingAuth');check(ra.eligible('https://bbs.eddibb.cc/test/read.cgi/liveedge/1793457978/'),'edge reading eligible');
  check(!ra.eligible('https://bbs.eddibb.cc/test/bbs.cgi')&&!ra.eligible('https://other.invalid/liveedge/subject.txt'),'posting and other hosts excluded');
  const version=String(app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName.value),old=version.includes('191'),mid=version.includes('226');
  const info=Java.use('jp.syoboi.a2chMate.client.BBSUrlInfo'),U=Java.use('sun.misc.Unsafe'),uf=U.class.getDeclaredField('theUnsafe');uf.setAccessible(true);const native=Java.cast(uf.get(null),U).allocateInstance(info.class);
  for(const [name,value] of [[old?'i':mid?'g':'f','bbs.eddibb.cc'],[old?'b':mid?'f':'g','liveedge'],[mid?'c':'e',Java.use('java.lang.Long').valueOf(1793457978)]]){const f=info.class.getDeclaredField(name);f.setAccessible(true);f.set(native,typeof value==='string'?Java.use('java.lang.String').$new(value):value);}
  const bundle=Java.use('android.os.Bundle').$new();bundle.putParcelable('threadUrl',Java.cast(native,Java.use('android.os.Parcelable')));
  const original=Java.use('android.view.View').$new(a);
  const Dialog=Java.use('android.app.Dialog'),fixtureDialog=old?null:Dialog.$new(a);
  if(fixtureDialog)fixtureDialog.setContentView.overload('android.view.View').call(fixtureDialog,original);
  const heldActivity=Java.retain(a),heldBundle=Java.retain(bundle),heldView=Java.retain(original);
  const Fake=Java.registerClass({name:'app.haiagaru.fixture.Title'+Date.now(),methods:{getArguments:[{returnType:'android.os.Bundle',argumentTypes:[],implementation(){return Java.retain(heldBundle);}}],getActivity:[{returnType:'android.app.Activity',argumentTypes:[],implementation(){return Java.retain(heldActivity);}}],isAdded:[{returnType:'boolean',argumentTypes:[],implementation(){return true;}}],getView:[{returnType:'android.view.View',argumentTypes:[],implementation(){return Java.retain(heldView);}}]}});
  const owner=Java.retain(Fake.$new()),Actions=Java.use(P+'ThreadTitleActions'),Group=Java.use('android.view.ViewGroup');let wrapped=Actions.wrap(owner,original);
  if(!old){check(wrapped.equals(original),'Compose fragment view untouched');Actions.decorateDialog(fixtureDialog);wrapped=Java.cast(fixtureDialog.getWindow().findViewById(16908290),Group).getChildAt(0);}
  check(!wrapped.equals(original),'title view wrapped');const root=Java.cast(wrapped,Group),buttons=Java.cast(root.getChildAt(1),Group);check(root.getChildAt(0).equals(original)&&buttons.getChildCount()===2,'native title retained plus notification and auth');
  resolve({version,checks,networkRequests:0,fixturePreferencesRestored:true});
 }catch(e){reject(Error(String(e.stack||e)));}});
}));}};
