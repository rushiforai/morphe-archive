/* Production templates, preference migration and offline request preparation. */
function main(fn){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}})));}
rpc.exports={test(){return main(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(!/\.haiagaru\.bindings(191|226|242)$/.test(pkg))throw Error('isolated bindings only');
 const T=Java.use('app.morphe.extension.chmate.BrowserUaTemplates'),V=Java.use('app.morphe.extension.chmate.ViewingUserAgent'),P=Java.use('app.morphe.extension.chmate.SettingsProfiles').prefs(app),H=Java.use('app.morphe.extension.chmate.Haiagaru');
 const saved=Java.retain(P.getAll()),flag='viewingBrowserUserAgentEnabled',legacy='Dalvik/2.1.0 (Linux; U; Android 4.0.3; HT-01 Build/XYZ0.123456.789)',expected='Dalvik/2.1.0 (Linux; U; Android 14; HT-01 Build/XYZ0.123456.789)',checks=[];let dialog=null;
 const check=(ok,label)=>{if(!ok)throw Error(label);checks.push(label);},init=()=>V.init(P,T.value(0));
 try{
  const labels=Array.from(T.labels(),String);check(JSON.stringify(labels)===JSON.stringify(['Android 14（標準）','Android 15','Android 16']),'three labels updated');
  for(let i=0;i<3;i++)check(String(T.value(i))===expected.replace('Android 14','Android '+[14,15,16][i]),'template '+[14,15,16][i]);
  check(String(T.value(-1))===expected&&String(T.value(99))===expected,'invalid index defaults to 14');
  check(T.resolve(null)===null,'unset migration remains unset');
  P.edit().putBoolean(flag,true).putString('userAgent',legacy).commit();init();
  check(String(P.getString('userAgent',''))===expected&&P.getBoolean(flag,false),'exact legacy template migrated without disabling');
  for(const method of ['GET','POST'])check(String(V.selected('https://fixture.invalid/test/read.cgi/a/1790000001/',method))===expected,'selected 14 for '+method);
  for(const index of [1,2]){P.edit().putString('userAgent',T.value(index)).commit();init();check(String(P.getString('userAgent',''))===String(T.value(index)),'preserve template '+[14,15,16][index]);}
  const custom=legacy+' Custom';P.edit().putString('userAgent',custom).commit();init();check(String(P.getString('userAgent',''))===custom,'custom UA is not rewritten');
  P.edit().putBoolean(flag,false).putString('userAgent',legacy).commit();init();check(String(P.getString('userAgent',''))===expected&&!P.getBoolean(flag,true)&&V.selected('https://fixture.invalid/','GET')===null&&V.browserAgent(app)===null,'disabled legacy migrates and stays disabled');
  P.edit().putBoolean(flag,true).remove('userAgent').commit();init();check(String(V.selected('https://fixture.invalid/','GET'))===expected&&String(V.browserAgent(app))===expected,'unset UA defaults to 14 for request and browser');
  const conn=Java.use('java.net.URL').$new('https://fixture.invalid/').openConnection(),http=Java.cast(conn,Java.use('java.net.HttpURLConnection')),native='Monazilla/1.00 2chMate/0.8.10.'+pkg.slice(-3)+' Dalvik/2.1.0 (Linux; U; Android 4.0.3)';
  http.setRequestProperty('User-Agent',native);http.setRequestProperty('X-Test','keep');V.prepare(conn);check(String(http.getRequestProperty('User-Agent'))==='Monazilla/1.00 2chMate/0.8.10.'+pkg.slice(-3)+' '+expected&&String(http.getRequestProperty('X-Test'))==='keep','request retains native client identity and other headers without connecting');
  const a=H.toolbarActivity(null),model=H.settingsCategory(a,'ADVANCED'),Button=Java.use('android.widget.Button'),Group=Java.use('android.view.ViewGroup');
  function find(view){if(Button.class.isInstance(view)){const b=Java.cast(view,Button);if(['UAテンプレートを選ぶ','Choose UA template'].includes(String(b.getText())))return b;}if(Group.class.isInstance(view)){const g=Java.cast(view,Group);for(let i=0;i<g.getChildCount();i++){const b=find(g.getChildAt(i));if(b)return b;}}return null;}
  const b=find(model);check(b!==null,'settings template button present');b.performClick();Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch(d){if(!d.isShowing())return;const f=d.getClass().getDeclaredField('spec');f.setAccessible(true);const spec=f.get(d),title=spec.getClass().getDeclaredField('title');title.setAccessible(true);if(String(title.get(spec))==='UAテンプレート')dialog=Java.retain(d);},onComplete(){}});
  check(dialog!==null&&dialog.getListView().getAdapter().getCount()===3,'production template dialog opens with three choices');
  for(let i=0;i<3;i++)check(String(dialog.getListView().getAdapter().getItem(i))===labels[i],'dialog label '+i);
  const sf=dialog.getClass().getDeclaredField('spec');sf.setAccessible(true);const spec=sf.get(dialog),cf=spec.getClass().getDeclaredField('itemClick');cf.setAccessible(true);Java.cast(cf.get(spec),Java.use('android.content.DialogInterface$OnClickListener')).onClick(dialog,0);
  check(String(P.getString('userAgent',''))===expected,'selecting standard template saves Android 14');
  return {ok:true,version:pkg.slice(-3),checks:checks.length,labels:checks,realNetworkRequests:0};
 }finally{
  if(dialog!==null)dialog.dismiss();
  init();const edit=P.edit();for(const key of ['userAgent',flag,'randomUserAgentEveryFiveSeconds']){const value=saved.get(key);if(value===null)edit.remove(key);else if(key==='userAgent')edit.putString(key,String(value));else edit.putBoolean(key,Java.cast(value,Java.use('java.lang.Boolean')).booleanValue());}edit.commit();
 }
});}};
