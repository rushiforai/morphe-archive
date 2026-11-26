rpc.exports.test=()=>new Promise(resolve=>Java.perform(()=>{
 let prefs,had,old,store,rule;
 try{
  const p='app.morphe.extension.chmate.',app=Java.use('android.app.ActivityThread').currentApplication();
  if(!/\.haiagaru\.reporter242$/.test(String(app.getPackageName())))throw Error('Use isolated reporter242');
  const Feature=Java.use(p+'FeatureSwitches'),ThreadRules=Java.use(p+'ThreadWatchRules'),Ng=Java.use(p+'NotificationNg');
  prefs=Feature.prefs(app);const key='suppressNgReplyNotifications',chain='suppressChainedNgReplyNotifications';had=[prefs.contains(key),prefs.contains(chain)];old=[prefs.getBoolean(key,true),prefs.getBoolean(chain,false)];
  prefs.edit().putBoolean(key,true).putBoolean(chain,false).commit();
  const url='https://kizuna.5ch.io/test/read.cgi/android/1794740000/',target=ThreadRules.target(url),Store=Java.use(p+'NativeNgStore');
  store=Store.$new(app,'ID');const pattern='HaiNgFrida'+String(Date.now()).slice(-8),timestamp=Date.now();
  rule=store.item(pattern,Java.use('java.lang.Short').valueOf(24).shortValue(),timestamp,null);store.update(null,rule);
  const dat='safe<><>2026/11/25 ID:own0001<>own<>title\n'
    +'safe<><>2026/11/25 ID:'+pattern+'<>direct NG<>hidden reply\n'
    +'safe<><>2026/11/25 ID:normal02<>visible reply<>title\n';
  const filtered=Ng.filter(app,target,dat,1,3),checks=[];
  checks.push(filtered.size()===1&&filtered.containsKey(3));
  checks.push(!filtered.containsKey(2));
  if(!checks.every(Boolean))throw Error('Registered ID NG was not excluded from the new-arrival notification: '+filtered);
  resolve({passed:2,registeredNgExcluded:true,normalNewReplyRetained:true});
 }catch(e){resolve({error:String(e)});}finally{
  try{if(store&&rule)store.update(rule,null);}catch(_){}
  try{if(prefs){let e=prefs.edit();if(had[0])e.putBoolean('suppressNgReplyNotifications',old[0]);else e.remove('suppressNgReplyNotifications');if(had[1])e.putBoolean('suppressChainedNgReplyNotifications',old[1]);else e.remove('suppressChainedNgReplyNotifications');e.commit();}}catch(_){}
 }
}));
