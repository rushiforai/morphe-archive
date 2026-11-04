/* Real native notification bridge plus intercepted poll data. No board requests or posting. */
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());if(!/\.haiagaru\.bindings(191|226|242)$/.test(pkg))throw Error('isolated bindings only');
 const v=pkg.slice(-3),W=Java.use('app.morphe.extension.chmate.ThreadWatch'),N=Java.use('app.morphe.extension.chmate.ThreadWatchNative'),R=Java.use('app.morphe.extension.chmate.RefreshTargets'),B=Java.use('jp.syoboi.a2chMate.client.BBSUrlInfo'),J=Java.use('org.json.JSONObject'),Str=Java.use('java.lang.String'),File=Java.use('java.io.File'),SQL=Java.use('android.database.sqlite.SQLiteDatabase');
 const url='https://jbbs.shitaraba.net/bbs/read.cgi/computer/987653/1790000993/',info=B[v==='242'?'d':'c'].overload('java.lang.String').call(B,url),board=String(R.nativeBoard(info,String(app.getPackageManager().getPackageInfo(pkg,0).versionName.value))),p=W.prefs(app),nm=Java.cast(app.getSystemService('notification'),Java.use('android.app.NotificationManager')),Atomic=Java.use('java.util.concurrent.atomic.AtomicBoolean');
 if(!p.getAll().isEmpty())throw Error('existing subscriptions');
 const dir=File.$new(Java.use('app.morphe.extension.chmate.HaiagaruSyncSnapshot').externalRoot(app),'dat'),dat=File.$new(dir,board+'_1790000993.dat'),idx=File.$new(dir,board+'_1790000993.idx');
 if(dat.exists()||idx.exists())throw Error('fixture files already exist');
 const db=SQL.openDatabase.overload('java.lang.String','android.database.sqlite.SQLiteDatabase$CursorFactory','int').call(SQL,app.getDatabasePath('roidon.sqlite').getAbsolutePath(),null,0);
 let owned=false,filesOwned=false,count=12,checks=[];const check=(ok,label)=>{if(!ok)throw Error(label);checks.push(label);};
 const notes=()=>nm.getActiveNotifications(),hai=()=>notes().filter(n=>String(n.getTag())===url),native=()=>notes().filter(n=>String(n.getNotification().extras.value.getCharSequence('android.title'))==='FIRST_WINS_NATIVE');
 function clearNative(){for(const n of native())nm.cancel.overload('java.lang.String','int').call(nm,n.getTag(),n.getId());}
 function clearHai(){nm.cancel.overload('java.lang.String','int').call(nm,url,0x48690031);}
 function write(file,text){const out=Java.use('java.io.FileOutputStream').$new(file);out.write(Str.$new(text).getBytes('EUC-JP'));out.close();}
 function raw(n){let text='';for(let i=1;i<=n;i++)text+='name<>sage<>date<>'+(i>=11?'&gt;&gt;3 返信 '+i:'通常 '+i)+'<>title\n';return text;}
 function put(stop){p.edit().putString(url,JSON.stringify({count:10,token:'winner-'+Date.now(),own:[3],repliesOnly:true,stopAfterReply:stop})).commit();}
 function sendNative(){N.begin(info);try{const Intent=Java.use('android.content.Intent'),Uri=Java.use('android.net.Uri'),Pending=Java.use('android.app.PendingIntent'),intent=Intent.$new('android.intent.action.VIEW',Uri.parse(url+'11')).setPackage(pkg),tap=Pending.getActivity(app,6931,intent,201326592),title=Str.$new('FIRST_WINS_NATIVE');
  if(v==='242')N.emitModern(app,app.getApplicationInfo().icon.value,title,title,Str.$new('自分への返信'),tap,null,'reply');
  else N.emitLegacy(app,app.getApplicationInfo().icon.value,title,title,Str.$new('自分への返信'),0,tap,null,Date.now(),'reply');
 }finally{N.end();}}
 const tick=()=>W.check(app,Atomic.$new(false));
 try{
  const q=db.rawQuery("SELECT COUNT(*) FROM bookmarks WHERE name=? AND created=1790000993",Java.array('java.lang.String',[board]));q.moveToFirst();check(q.getInt(0)===0,'fixture bookmark absent');q.close();
  db.execSQL("INSERT INTO bookmarks(name,created,title,res_count,server_res_count,read_count,flag,state,access) VALUES('"+board+"',1790000993,'通知重複検証',10,10,10,0,0,1790000993000)");owned=true;dir.mkdirs();filesOwned=true;write(idx,'0\tfixture\n3:1\n');write(dat,raw(count));
  W.fetch.implementation=function(address,cancel){if(String(address).endsWith('subject.txt'))return '1790000993.cgi,重複通知テスト('+count+')\n';let text='';for(let i=1;i<=count;i++)text+=i+'<>name<>sage<>date<>'+(i>=11?'&gt;&gt;3 返信 '+i:'通常 '+i)+'<>title<>id\n';return text;};
  const ledger=J.$new('{}'),ids=Java.use('java.util.ArrayList').$new();ids.add(Java.use('java.lang.Integer').valueOf(20));ids.add(Java.use('java.lang.Integer').valueOf(21));N.record(ledger,ids);N.recordRange(ledger,22,30);check(ledger.getJSONArray('delivered').length()===1&&ledger.getJSONArray('delivered').getJSONArray(0).getInt(1)===30,'consecutive response numbers stored as compact ranges');
  put(false);sendNative();check(native().length===1,'standard notification delivered first through real native helper');tick();check(hai().length===0&&J.$new(p.getString(url,'{}')).getInt('count')===12,'later Haiagaru notification suppressed for same incoming responses');
  clearNative();put(false);tick();check(hai().length===1,'Haiagaru notification can arrive first');sendNative();check(native().length===0,'later standard notification suppressed for same incoming responses');
  count=13;write(dat,raw(count));sendNative();check(native().length===1,'new response to same own anchor remains eligible');tick();check(!String(hai()[0].getNotification().extras.value.getCharSequence('android.text')).includes('>>13'),'later duplicate of response 13 does not replace winning native notice');
  count=14;write(dat,raw(count));tick();check(String(hai()[0].getNotification().extras.value.getCharSequence('android.text')).includes('>>14'),'another response to the same own anchor notifies separately');clearNative();sendNative();check(native().length===0,'second path for response 14 suppressed');
  clearNative();clearHai();count=12;put(false);write(dat,'1<>name<>sage<>date<>old<>title<>id\n11<>name<>sage<>date<>&gt;&gt;3 raw reply<>title<>id\n12<>name<>sage<>date<>&gt;&gt;3 raw reply<>title<>id\n');sendNative();check(native().length===1,'native numbered rawmode cache supports gaps');tick();check(hai().length===0,'numbered rawmode native notification also deduplicates');count=14;write(dat,raw(count));
  clearHai();put(true);sendNative();check(J.$new(p.getString(url,'{}')).getBoolean('paused'),'stop-after-reply also follows winning standard notification');tick();check(hai().length===0,'paused subscription does not emit a second notification');
  resolve({ok:true,version:v,checks:checks.length,labels:checks,realNetworkRequests:0,realPosts:0});
 }catch(e){reject(Error(String(e.stack||e)));}finally{
  W.fetch.implementation=null;p.edit().remove(url).commit();clearHai();clearNative();W.schedule.overload('android.content.Context').call(W,app);
  if(filesOwned){dat.delete();idx.delete();}if(owned)db.execSQL("DELETE FROM bookmarks WHERE name='"+board+"' AND created=1790000993");db.close();
 }
}));}};
