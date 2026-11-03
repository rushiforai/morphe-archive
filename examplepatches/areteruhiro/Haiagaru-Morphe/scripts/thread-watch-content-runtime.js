let app,W,pref,nm,url='https://fixture.invalid/test/read.cgi/a/1793113633/',url2='https://fixture.invalid/test/read.cgi/a/1793113634/',count=10,datFail=false,checks=0,reads=[],beforeNotes;
function run(fn){return new Promise((resolve,reject)=>Java.perform(()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}}));}
function check(ok,label){if(!ok)throw Error(label);checks++;}
rpc.exports={test(){return run(()=>{
 app=Java.use('android.app.ActivityThread').currentApplication();if(!/^jp\.co\.airfront\.android\.a2chMate\.haiagaru\.bindings(191|226|242)$/.test(String(app.getPackageName())))throw Error('isolated bindings only');
 W=Java.use('app.morphe.extension.chmate.ThreadWatch');pref=app.getSharedPreferences('haiagaru_thread_watch',0);if(!pref.getAll().isEmpty())throw Error('preserve existing registrations');
 nm=Java.cast(app.getSystemService('notification'),Java.use('android.app.NotificationManager'));const Atomic=Java.use('java.util.concurrent.atomic.AtomicBoolean'),Json=Java.use('org.json.JSONObject');
 function stored(){return Json.$new(pref.getString(url,'{}')).getInt('count');}
 function notes(){return nm.getActiveNotifications().filter(n=>String(n.getTag())===url);}
 W.fetch.implementation=function(address,cancel){const u=String(address);reads.push(u);if(u.endsWith('subject.txt'))return '1793113633.dat<>Thread &amp; title (part 2) ('+count+')\n1793113634.dat<>Second (20)\n';if(datFail)throw Java.use('java.io.IOException').$new('controlled unavailable');let dat='';for(let n=1;n<=count;n++)dat+='<b>name</b><><>date<>body '+n+' &amp; <b>bold</b><br>next line<>title\n';return dat;};
 const end=()=>{pref.edit().remove(url).remove(url2).commit();for(const u of [url,url2])nm.cancel.overload('java.lang.String','int').call(nm,u,0x48690031);W.fetch.implementation=null;};
 try{
  pref.edit().putString(url,'{"count":-1,"token":"content-one"}').putString(url2,'{"count":-1,"token":"content-two"}').commit();
  W.check(app,Atomic.$new(false));check(reads.length===1,'baseline only subject');check(stored()===10&&notes().length===0,'initial baseline silent');
  count=12;reads=[];W.check(app,Atomic.$new(false));const active=notes();check(active.length===1,'notification posted');const n=active[0].getNotification(),e=n.extras.value;
  check(String(e.getString('android.title'))==='Thread & title (part 2)','decoded title');check(String(e.getString('android.subText'))==='新着 2件','count in subtitle');
  const body=String(e.getCharSequence('android.bigText'));check(body.includes('>>11 body 11 & bold next line')&&body.includes('>>12 body 12 & bold next line'),'new body previews decoded');check(!body.includes('>>10')&&!body.includes('<b>'),'old rows and HTML excluded');
  check(reads.length===2&&reads[1]==='https://fixture.invalid/a/dat/1793113633.dat','subject shared and one DAT only for changed thread');
  check(n.getSmallIcon().getResId()===app.getApplicationInfo().icon.value,'ChMate resource small icon');check(n.getLargeIcon()!==null,'ChMate color large icon');check(n.contentIntent.value!==null,'tap destination retained');
  reads=[];W.check(app,Atomic.$new(false));check(reads.length===1&&stored()===12,'unchanged does not refetch DAT');
  count=18;W.check(app,Atomic.$new(false));const expanded=String(notes()[0].getNotification().extras.value.getCharSequence('android.bigText'));check(expanded.includes('>>16')&&expanded.includes('>>18')&&!expanded.includes('>>15'),'large burst last three only');
  datFail=true;count=19;W.check(app,Atomic.$new(false));check(stored()===19,'DAT failure still notifies');check(String(notes()[0].getNotification().extras.value.getCharSequence('android.text')).includes('本文を取得できませんでした'),'fallback explained');
  const previousReads=reads.length;W.check(app,Atomic.$new(true));check(reads.length===previousReads,'cancelled skips network');
  check(String(W.notificationText('😀😀😀',2))==='😀😀…','truncation preserves codepoints');
  const result={version:String(app.getPackageName()).slice(-3),checks,realNetworkRequests:0,registrationRestored:true};end();return result;
 }catch(e){end();throw e;}
 });}};
