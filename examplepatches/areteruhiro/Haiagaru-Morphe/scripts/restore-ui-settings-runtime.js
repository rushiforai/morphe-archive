/* Isolated test package only; synthetic settings, no credentials or network. */
function run(fn){return new Promise((resolve,reject)=>Java.perform(()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}}));}
rpc.exports={test(){return run(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.restoreperf191')throw Error('restore fixture package required');
 const S=Java.use('app.morphe.extension.chmate.HaiagaruSyncSnapshot'),J=Java.use('org.json.JSONObject'),Entry=Java.use('java.util.Map$Entry');
 const ui=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),native=app.getSharedPreferences(String(app.getPackageName())+'_preferences',0),auto=app.getSharedPreferences('haiagaru.local-auto-backup',0);
 const saved=[ui,native,auto].map(p=>[p,Java.retain(p.getAll())]);let checks=0;function check(ok,label){if(!ok)throw Error(label);checks++;}
 function snapshot(values){return J.$new(JSON.stringify({schema:1,sourcePackage:String(app.getPackageName()),categories:4,settings:{'io.github.areteruhiro.chmate.haiagaru.ui-config':values}}));}
 const A=snapshot({settingsLanguage:{type:'string',value:'ja'}}),B=snapshot({settingsLanguage:{type:'string',value:'ja'},nativeToolTabs:{type:'boolean',value:true},siteCardsEnabled:{type:'boolean',value:true},hideDroppedHomeThreads:{type:'boolean',value:true},directBodySelection:{type:'boolean',value:true}});
 const keys=['nativeToolTabs','siteCardsEnabled','hideDroppedHomeThreads','directBodySelection'];
 try{
  ui.edit().putBoolean('minimalSetupPromptV1',true).putString('fixture_api_token','synthetic-local-marker').commit();native.edit().putString('restoreFixtureNativeSetting','keep').commit();auto.edit().putBoolean('enabled',false).putInt('hours',23).commit();
  for(let cycle=0;cycle<3;cycle++){
   S.restore(app,B,4);for(const k of keys)check(ui.getBoolean(k,false),'B enables '+k);
   S.restore(app,A,4);for(const k of keys)check(!ui.contains(k)&&!ui.getBoolean(k,false),'A resets absent '+k);
   check(ui.getBoolean('minimalSetupPromptV1',false),'local first-open marker retained');check(String(ui.getString('fixture_api_token',''))==='synthetic-local-marker','excluded secret key retained');
   check(String(native.getString('restoreFixtureNativeSetting',''))==='keep','native settings retained');check(!auto.getBoolean('enabled',true)&&auto.getInt('hours',0)===23,'local automatic backup settings retained');
   check(String(ui.getString('settingsLanguage',''))==='ja','present setting restored');
  }
  const state=ui.getAll();S.restore(app,A,4);check(state.equals(ui.getAll()),'same snapshot repeated is idempotent');
  S.mergeMissing(app,B,4);for(const k of keys)check(ui.getBoolean(k,false),'merge adds missing '+k);
  S.mergeMissing(app,A,4);for(const k of keys)check(ui.getBoolean(k,false),'merge keeps existing '+k);
  return {checks,ok:true,realNetworkRequests:0};
 }finally{
  for(const [p,map] of saved){const e=p.edit().clear(),it=map.entrySet().iterator();while(it.hasNext()){const row=Java.cast(it.next(),Entry),k=String(row.getKey()),v=row.getValue(),t=String(v.getClass().getName());if(t==='java.lang.Boolean')e.putBoolean(k,Java.cast(v,Java.use(t)).booleanValue());else if(t==='java.lang.Integer')e.putInt(k,Java.cast(v,Java.use(t)).intValue());else if(t==='java.lang.Long')e.putLong(k,Java.cast(v,Java.use(t)).longValue());else if(t==='java.lang.Float')e.putFloat(k,Java.cast(v,Java.use(t)).floatValue());else if(t==='java.lang.String')e.putString(k,String(v));else e.putStringSet(k,Java.cast(v,Java.use('java.util.Set')));}if(!e.commit())throw Error('fixture state restore failed');}
 }
 });}};
