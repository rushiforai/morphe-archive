// Offline fetch fixture in a real native tab; preserves the prior search and tab preferences.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Verification 242 only');
 Java.classFactory.loader=app.getClassLoader();
 const T=Java.use('app.morphe.extension.chmate.NativeToolTabs'),E=Java.use('app.morphe.extension.chmate.EddiArchiveSearchUi');
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),keys=['nativeToolTabs','nativeToolTabEddi'],saved=keys.map(k=>({k,had:p.contains(k),v:p.getBoolean(k,false)}));
 const last=app.getSharedPreferences('haiagaru_eddi_search',0),hadLast=last.contains('last'),oldLast=last.getString('last',null);
 let host,ui,fragment,baseline=0,requests=[],expected='',ready=false;
 function field(o,k){const f=o.getClass().getDeclaredField(k);f.setAccessible(true);return f.get(o);}
 function check(ok,label){if(!ok)throw Error(label);console.log('PASS '+label);}
 function run(fn){Java.perform(()=>Java.scheduleOnMainThread(()=>{try{fn();}catch(e){console.log('FAIL '+e.stack);}}));}
 function page(){const rows=Java.use('java.util.ArrayList').$new(),Row=Java.use('app.morphe.extension.chmate.EddiArchiveSearchUi$ThreadResult');for(let i=0;i<30;i++)rows.add(Row.$new('Pull refresh fixture '+i,'2026-10-23','https://bbs.eddibb.cc/test/read.cgi/liveedge/1792292838/'));return Java.use('app.morphe.extension.chmate.EddiArchiveSearchUi$SearchPage').$new.overload('java.util.List','int','boolean').call(Java.use('app.morphe.extension.chmate.EddiArchiveSearchUi$SearchPage'),rows,60,true);}
 E.fetch.overload('android.net.Uri').implementation=function(uri){requests.push(String(uri));Java.use('java.lang.Thread').sleep(300);return page();};
 run(()=>{host=Java.retain(Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null));const edit=p.edit();keys.forEach(k=>edit.putBoolean(k,true));edit.commit();check(T.open(host,'eddi'),'open actual archive tab');});
 setTimeout(()=>Java.perform(()=>Java.choose('app.morphe.extension.chmate.NativeToolFragment',{onMatch(f){const b=Java.cast(f,Java.use('androidx.fragment.app.Fragment'));if(b.isResumed()&&b.getArguments()&&String(b.getArguments().getString('_data'))==='haiagaru-tool://eddi')fragment=Java.retain(b);},onComplete(){run(()=>{
  check(!!fragment,'archive Fragment resumed');
  const content=field(Java.cast(fragment,Java.use('app.morphe.extension.chmate.NativeToolFragment')),'content'),fields=content.getClass().getDeclaredFields();
  for(let i=0;i<fields.length;i++)if(String(fields[i].getType().getName())==='app.morphe.extension.chmate.EddiArchiveSearchUi'){fields[i].setAccessible(true);ui=Java.retain(Java.cast(fields[i].get(content),E));}
  check(!!ui,'archive UI bound to test tab');const input=Java.cast(field(ui,'keyword'),Java.use('android.widget.TextView'));input.setText.overload('java.lang.CharSequence').call(input,Java.use('java.lang.String').$new('displayed query'));
  // Seed synchronously: cold-start font/Compose work can otherwise delay the
  // first asynchronous fixture response past the gesture setup timer.
  const gen=ui.getClass().getDeclaredField('generation');gen.setAccessible(true);gen.setInt(ui,gen.getInt(ui)+1);
  const query=ui.getClass().getDeclaredField('displayedQuery');query.setAccessible(true);query.set(ui,Java.use('java.lang.String').$new('https://eddiarchive3rd.boy.jp/?page=2&keyword=displayed%20query'));
  ui.display(2,page());Java.cast(field(ui,'root'),Java.use('android.view.View')).setTag(0x48690c09,Java.use('java.lang.Boolean').FALSE.value);
 });}})),4000);
 setTimeout(()=>run(()=>{
  check(!!ui,'test UI ready');expected=String(field(ui,'displayedQuery'));check(expected.includes('page=2'),'fixture displays second page');
  const input=Java.cast(field(ui,'keyword'),Java.use('android.widget.TextView'));input.setText.overload('java.lang.CharSequence').call(input,Java.use('java.lang.String').$new('unsubmitted edit'));
  Java.cast(field(ui,'searchForm'),Java.use('android.view.View')).setVisibility(8);
  baseline=requests.length;ready=true;console.log('PULL_REFRESH_GESTURE_READY baseline='+baseline+' expected='+expected);
 }),8000);
 setTimeout(()=>run(()=>{
  check(ready,'fixture initialized before gesture verification');check(requests.length===baseline+1,'actual downward pull triggered exactly one fetch');check(requests.slice(baseline).every(u=>u===expected),'refresh keeps displayed conditions and page despite unsubmitted edits');
  const root=Java.cast(field(ui,'root'),Java.use('android.view.View'));check(!Java.cast(root.getTag(0x48690c09),Java.use('java.lang.Boolean')).booleanValue(),'refresh spinner stops after completion');
  console.log('EDDI_PULL_REFRESH_COMPLETE requests='+requests.length);
 }),60000);
 setTimeout(()=>run(()=>{
  if(host&&fragment)T.closeCurrentTab(host,fragment);
  const edit=p.edit();saved.forEach(s=>{if(s.had)edit.putBoolean(s.k,s.v);else edit.remove(s.k);});edit.commit();
  const restore=last.edit();if(hadLast)restore.putString('last',oldLast);else restore.remove('last');restore.commit();E.fetch.overload('android.net.Uri').implementation=null;console.log('ARCHIVE_FIXTURE_CLOSED_PREFERENCES_RESTORED');
 }),65000);
});
