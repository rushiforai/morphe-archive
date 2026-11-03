// Isolated emulator packages only. No requests are connected or sent.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/^jp\.co\.airfront\.android\.a2chMate\.haiagaru\.bindings(191|226|242)$/.test(String(app.getPackageName()))){reject(Error('Binding verification package required'));return;}
 const P='app.morphe.extension.chmate.',U=Java.use(P+'ViewingUserAgent'),B=Java.use(P+'BrowserUaTemplates'),H=Java.use(P+'Haiagaru');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),keys=['userAgent','viewingBrowserUserAgentEnabled','randomUserAgentEveryFiveSeconds'];
 const original=keys.map(key=>({key,had:prefs.contains(key),value:key==='userAgent'?prefs.getString(key,null):prefs.getBoolean(key,false)}));
 const fallback=U.defaultAgent.value;let checks=0;function check(ok,label){if(!ok)throw Error(label);checks++;}
 try{
  const agent=String(B.value(1));prefs.edit().putString('userAgent',agent).putBoolean(keys[1],true).putBoolean(keys[2],true).commit();U.init(prefs,fallback);
  check(!prefs.contains(keys[2]),'retired experiment key removed');check(String(prefs.getString('userAgent',null))===agent,'selected template retained');
  const url='https://fixture.invalid/test/read.cgi/a/123/';
  for(const method of ['GET','POST'])check(String(U.selected(url,method))===agent&&String(U.selected(url,method))===agent,'fixed template stable for '+method);
  prefs.edit().putString('userAgent','Haiagaru-Custom/Fixture').commit();check(String(U.selected(url,'GET'))==='Haiagaru-Custom/Fixture','custom UA retained');
  const activity=H.toolbarActivity(null);check(!!activity,'settings host available');
  const root=H.settingsCategory(activity,'ADVANCED'),Text=Java.use('android.widget.TextView'),Group=Java.use('android.view.ViewGroup');let template=false,experiment=false;
  function walk(view){if(Text.class.isInstance(view)){const text=String(Java.cast(view,Text).getText());template=template||text==='UAテンプレートを選ぶ';experiment=experiment||text.includes('5秒');}if(Group.class.isInstance(view)){const g=Java.cast(view,Group);for(let i=0;i<g.getChildCount();i++)walk(g.getChildAt(i));}}
  walk(root);check(template,'template picker shown');check(!experiment,'experiment setting absent');
  resolve({checks,networkRequests:0});
 }catch(e){reject(Error(String(e.stack||e)));}finally{
  const edit=prefs.edit();for(const saved of original){if(!saved.had)edit.remove(saved.key);else if(saved.key==='userAgent')edit.putString(saved.key,saved.value);else edit.putBoolean(saved.key,saved.value);}edit.commit();U.init(prefs,fallback);
 }
})));}};
