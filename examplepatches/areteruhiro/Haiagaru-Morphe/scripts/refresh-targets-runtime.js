/* Isolated apps, synthetic rows and intercepted reads only; never posts or contacts a board. */
let app,a,H,R,W,p,ui,J,Str,version,cfg,saved,ownFile,checks=[],reads=0,current=10,datFail=false,ownCreated=false,subscriptionsOwned=false;
function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
function onUi(fn){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}})));}
function main(fn){return new Promise((resolve,reject)=>Java.perform(()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}}));}
function field(o,name){const f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f;}
const watchUrl='https://jbbs.shitaraba.net/bbs/read.cgi/computer/987654/1790000001/';
function item(){return J.$new(p.getString(watchUrl,'{}'));}
function notes(){return Java.cast(app.getSystemService('notification'),Java.use('android.app.NotificationManager')).getActiveNotifications().filter(n=>String(n.getTag())===watchUrl);}
function stored(value){p.edit().putString(watchUrl,JSON.stringify(value)).commit();}
function restore(){
 if(W)W.fetch.implementation=null;
 if(p&&subscriptionsOwned)p.edit().remove(watchUrl).commit();
 if(ui&&saved){const e=ui.edit();for(const key of ['manualRefreshTargets','watchAfterPosting','watchAutoRepliesOnly','watchAutoStopAfterReply']){const v=saved.get(key);if(v===null)e.remove(key);else if(key==='manualRefreshTargets')e.putStringSet(key,Java.cast(v,Java.use('java.util.Set')));else e.putBoolean(key,Java.cast(v,Java.use('java.lang.Boolean')).booleanValue());}e.commit();}
 if(ownCreated&&ownFile&&ownFile.exists())ownFile.delete();
 if(app){Java.cast(app.getSystemService('notification'),Java.use('android.app.NotificationManager')).cancel.overload('java.lang.String','int').call(Java.cast(app.getSystemService('notification'),Java.use('android.app.NotificationManager')),watchUrl,0x48690031);W.schedule.overload('android.content.Context').call(W,app);}
}
rpc.exports={test:async function(){
 try{
 await onUi(()=>{
  app=Java.use('android.app.ActivityThread').currentApplication();const pkg=String(app.getPackageName());check(/\.haiagaru\.bindings(191|226|242)$/.test(pkg),'isolated package');
  version=pkg.slice(-3);cfg=version==='191'?{parser:'c',data:'o.a6',row:'RemoteActionCompatParcelizer',board:'c',id:'d'}:version==='226'?{parser:'c',data:'o.InMobiMediationAdapterNativeAdViewListener11',row:'write',board:'c',id:'b'}:{parser:'d',data:'o.isAndroid',row:'RemoteActionCompatParcelizer',board:'b',id:'c'};
  H=Java.use('app.morphe.extension.chmate.Haiagaru');a=H.toolbarActivity(null);check(a!==null,'foreground activity');R=Java.use('app.morphe.extension.chmate.RefreshTargets');W=Java.use('app.morphe.extension.chmate.ThreadWatch');J=Java.use('org.json.JSONObject');Str=Java.use('java.lang.String');
  p=app.getSharedPreferences('haiagaru_thread_watch',0);check(p.getAll().isEmpty(),'subscriptions empty before fixture');subscriptionsOwned=true;ui=R.prefs(app);saved=Java.retain(ui.getAll());ui.edit().remove('manualRefreshTargets').putBoolean('watchAfterPosting',false).commit();
  const B=Java.use('jp.syoboi.a2chMate.client.BBSUrlInfo'),targets=['https://egg.5ch.io/test/read.cgi/android/1790000001/',watchUrl];let key;
  for(const url of targets){const info=B[cfg.parser].overload('java.lang.String').call(B,url),box=R.control(a,info);check(box!==null,'native title target '+url.includes('shitaraba'));check(!box.isChecked(),'initial update target off');box.performClick();check(box.isChecked()&&ui.getStringSet('manualRefreshTargets',null).size()===1,'checkbox registers exact thread');key=String(ui.getStringSet('manualRefreshTargets',null).iterator().next());box.performClick();check(!box.isChecked()&&ui.getStringSet('manualRefreshTargets',null).isEmpty(),'checkbox removes thread');}
  const Keys=Java.use('java.util.HashSet'),keys=Keys.$new();keys.add(key);ui.edit().putStringSet('manualRefreshTargets',keys).commit();
  const Unsafe=Java.use('sun.misc.Unsafe'),uf=Unsafe.class.getDeclaredField('theUnsafe');uf.setAccessible(true);const unsafe=Java.cast(uf.get(null),Unsafe),Row=Java.use('jp.syoboi.a2chMate.autocheck.AutoCheckWork$'+cfg.row),rows=Java.use('java.util.ArrayList').$new();
  for(let i=0;i<2;i++){const row=unsafe.allocateInstance(Row.class);field(row,cfg.board).set(row,Str.$new(key.split('\n')[0]));field(row,cfg.id).setLong(row,1790000001+i);rows.add(row);}
  const worker=Java.use('java.lang.Object').$new(),normal=Java.use('java.lang.Object').$new(),map=Java.use('java.util.HashMap').$new();map.put('haiagaruRefreshTargets',Java.use('java.lang.Boolean').TRUE.value);R.mark(worker,Java.use(cfg.data).$new.overload('java.util.Map').call(Java.use(cfg.data),map));
  check(R.filter(worker,rows).size()===1,'selected native patrol rows only');check(R.filter(normal,rows).equals(rows),'ordinary patrol rows unchanged');check(R.download(worker,false)&&!R.download(normal,false),'only selected work forces DAT');check(String(R.keywords(worker,'existing keyword'))===''&&String(R.keywords(normal,'existing keyword'))==='existing keyword','selected work excludes keyword patrol');
  ui.edit().remove('manualRefreshTargets').commit();check(R.filter(worker,rows).isEmpty(),'removed registration excluded at worker execution');
  const target=Java.use('app.morphe.extension.chmate.ThreadWatchRules').target(watchUrl),nativeInfo=B[cfg.parser].overload('java.lang.String').call(B,watchUrl),board=String(R.nativeBoard(nativeInfo,String(app.getPackageManager().getPackageInfo(pkg,0).versionName.value))),File=Java.use('java.io.File');
  ownFile=File.$new(Java.use('app.morphe.extension.chmate.HaiagaruSyncSnapshot').externalRoot(app),'dat/'+board+'_1790000001.idx');check(!ownFile.exists(),'own-post fixture path unused');ownFile.getParentFile().mkdirs();const out=Java.use('java.io.FileOutputStream').$new(ownFile);out.write(Str.$new('0\tfixture\n3:1,4:16,7:17\n').getBytes('UTF-8'));out.close();ownCreated=true;
  const own=Java.use('app.morphe.extension.chmate.ThreadWatchOwnPosts').read(app,target);check(own.size()===2&&own.contains(Java.use('java.lang.Integer').valueOf(3)),'read actual native index own-post bit');
  W.confirmed(watchUrl+'3');check(!p.contains(watchUrl),'parent off does not register');ui.edit().putBoolean('watchAfterPosting',true).putBoolean('watchAutoRepliesOnly',true).putBoolean('watchAutoStopAfterReply',true).commit();W.confirmed(watchUrl+'3');check(item().getInt('count')===3&&item().getBoolean('repliesOnly')&&item().getBoolean('stopAfterReply'),'confirmed post automatically registers options and baseline');

  
  stored({count:10,token:'reply-test',repliesOnly:true,stopAfterReply:true});
 });
 return await main(()=>{const result={ok:true,version,checks:checks.length,labels:checks,realNetworkRequests:0,realPosts:0};restore();return result;});
 }catch(e){await main(()=>restore());throw e;}
}};
