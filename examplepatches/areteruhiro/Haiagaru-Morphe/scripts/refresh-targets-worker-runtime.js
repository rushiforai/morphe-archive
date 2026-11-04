/* Actual WorkManager constructor/dispatch; intercepts the native fetch boundary before any I/O. */
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());if(!/\.haiagaru\.bindings(191|226|242)$/.test(pkg))throw Error('isolated binding package only');
 const v=pkg.slice(-3),R=Java.use('app.morphe.extension.chmate.RefreshTargets'),W=Java.use('jp.syoboi.a2chMate.autocheck.AutoCheckWork'),SQL=Java.use('android.database.sqlite.SQLiteDatabase'),J=Java.use('java.lang.String'),HashSet=Java.use('java.util.HashSet'),p=R.prefs(app),previous=Java.retain(p.getAll());
 const url='https://fixture.invalid/test/read.cgi/refreshfixture/1790000991/',B=Java.use('jp.syoboi.a2chMate.client.BBSUrlInfo'),info=B[v==='242'?'d':'c'].overload('java.lang.String').call(B,url),board=String(R.nativeBoard(info,String(app.getPackageManager().getPackageInfo(pkg,0).versionName.value)));
 if(!/^[A-Za-z0-9%._-]+$/.test(board))throw Error('unsafe fixture identity');
 const db=SQL.openDatabase.overload('java.lang.String','android.database.sqlite.SQLiteDatabase$CursorFactory','int').call(SQL,app.getDatabasePath('roidon.sqlite').getAbsolutePath(),null,0);
 let owned=false,timer,observed=[],filtered=[],checks=[];const check=(ok,label)=>{if(!ok)throw Error(label);checks.push(label);};
 const native=W[v==='191'?'d':v==='226'?'b':'c'].overload(v==='191'?'o.getLabel':v==='226'?'o.OpenJSSEPlatformCompanion':'o.getBackImage',v==='242'?'java.util.List':'java.util.ArrayList','boolean');
 const clean=()=>{if(timer)clearInterval(timer);native.implementation=null;R.filter.implementation=null;const e=p.edit(),value=previous.get('manualRefreshTargets');if(value===null)e.remove('manualRefreshTargets');else e.putStringSet('manualRefreshTargets',Java.cast(value,Java.use('java.util.Set')));e.commit();if(owned){db.execSQL("DELETE FROM bookmarks WHERE name='"+board+"' AND created IN (1790000991,1790000992)");db.execSQL("DELETE FROM boards WHERE name='"+board+"'");}db.close();};
 try{
  let q=db.rawQuery("SELECT COUNT(*) FROM boards WHERE name='"+board+"'",null);q.moveToFirst();check(q.getInt(0)===0,'fixture board absent');q.close();owned=true;
  db.execSQL("INSERT INTO boards(name,server,title,category,is_external,flag) VALUES('"+board+"','fixture.invalid','更新対象検証','検証',1,0)");
  for(const id of [1790000991,1790000992])db.execSQL("INSERT INTO bookmarks(name,created,title,res_count,server_res_count,read_count,flag,state,access) VALUES('"+board+"',"+id+",'更新対象検証',0,0,0,0,0,1790000991000)");
  const keys=HashSet.$new();keys.add(board+'\n1790000991');p.edit().putStringSet('manualRefreshTargets',keys).commit();
  R.filter.implementation=function(worker,rows){const result=R.filter.call(this,worker,rows);filtered.push({before:rows.size(),after:result.size()});return result;};
  native.implementation=function(client,rows,download){observed.push({rows:rows.size(),download});return v==='242'?Java.use('jp.syoboi.a2chMate.autocheck.AutoCheckWork$write').$new(0,''):0;};
  const owner=Java.use(v==='191'?'o.mdExternalSyntheticLambda0':v==='226'?'o.settings':'o.TTRewardVideoActivity8');owner.haiagaruRefreshTargets(app,true);owner.haiagaruRefreshTargets(app,true);
  let attempts=0,settled=0;timer=setInterval(()=>Java.perform(()=>{
   try{
    if(observed.length>0){settled++;if(settled<5)return;check(observed.length===1,'KEEP coalesces duplicate WorkManager requests');check(observed[0].rows===1,'native work fetch receives only selected thread');check(observed[0].download===true,'native work forces body download');check(filtered.length===1&&filtered[0].after===1&&filtered[0].before>=2,'filter runs on real native bookmark query');const result={ok:true,version:v,checks:checks.length,labels:checks,observed,filtered,realNetworkRequests:0};clean();resolve(result);return;}
    if(++attempts>50)throw Error('WorkManager did not dispatch selected refresh');
   }catch(e){clean();reject(Error(String(e.stack||e)));}
  }),200);
 }catch(e){clean();reject(Error(String(e.stack||e)));}
}));}};
