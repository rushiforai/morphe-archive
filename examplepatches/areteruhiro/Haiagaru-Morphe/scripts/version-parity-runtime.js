// Intent preparation only: never launch a search provider or submit a query.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 try{
  const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
  if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg))throw Error('verification app required');
  const Intent=Java.use('android.content.Intent'),Component=Java.use('android.content.ComponentName'),H=Java.use('app.morphe.extension.chmate.Haiagaru');let checks=0;
  function check(ok,msg){if(!ok)throw Error(msg);checks++;}
  const search=Intent.$new('android.intent.action.WEB_SEARCH');search.putExtra.overload('java.lang.String','java.lang.String').call(search,'query','offline-fixture');search.addFlags(1);
  search.setComponent(Component.$new('test.search.provider','test.search.provider.Activity'));
  H.retargetSelfIntent(search);
  check((search.getFlags()&0x10000000)!==0,'external Web search has a separate task on all versions');
  check((search.getFlags()&1)!==0,'existing flags retained');
  check(String(search.getStringExtra('query'))==='offline-fixture','query retained');
  check(String(search.getComponent().getPackageName())==='test.search.provider','explicit provider retained');
  const view=Intent.$new('android.intent.action.VIEW');view.addFlags(1);H.retargetSelfIntent(view);
  check(view.getFlags()===1,'ordinary URL launches unchanged');
  check(H.retargetSelfIntent(null)===null,'null unchanged');
  resolve({version:pkg.slice(-3),checks});
 }catch(e){reject(Error(String(e.stack||e)));}
}));}};
