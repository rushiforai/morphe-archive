// One user-like Kyodemo search, no crawl, authentication or posting. Test app only.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.settingsfix191')throw Error('191 verification only');
 const Ui=Java.use('app.morphe.extension.chmate.EddiArchiveSearchUi'),Uri=Java.use('android.net.Uri');
 const prefs=app.getSharedPreferences('haiagaru_eddi_search',0),had=prefs.contains('last'),old=prefs.getString('last',null);
 const base='https://eddiarchive3rd.boy.jp/';
 let ui,host,checks=0,done=false;
 function field(o,k){const f=o.getClass().getDeclaredField(k);f.setAccessible(true);return f.get(o);}
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function javaText(value){return String(Java.use('java.lang.String').valueOf.overload('java.lang.Object').call(Java.use('java.lang.String'),value));}
 function cleanup(){if(done)return;done=true;try{if(ui)ui.dispose();if(host)host.finish();}finally{const edit=prefs.edit();if(had)edit.putString('last',old);else edit.remove('last');edit.commit();console.log('PREFERENCES_RESTORED checks='+checks);}}
 Java.scheduleOnMainThread(()=>{
  prefs.edit().putString('last',JSON.stringify({query:'https://www.kyodemo.net/sdemo/b/e_e_liveedge/?kt=k_&k=12%8B%85%92%63',threads:[],total:0,page:1})).commit();
  const intent=Java.use('android.content.Intent').$new(app,Java.use('app.morphe.extension.chmate.HissiMenuActivity').class);
  intent.setData(Uri.parse(base));intent.addFlags(0x10000000);app.startActivity(intent);
 });
 setTimeout(()=>Java.perform(()=>Java.choose('app.morphe.extension.chmate.EddiArchiveSearchUi',{onMatch(found){
  if(ui)return;const a=Java.cast(field(found,'activity'),Java.use('android.app.Activity'));if(a.isFinishing()||!String(a.getClass().getName()).endsWith('HissiMenuActivity'))return;
  ui=Java.retain(found);host=Java.retain(a);
  Java.scheduleOnMainThread(()=>{try{
   ui.restoreQuery(Uri.parse('https://www.kyodemo.net/sdemo/b/e_e_liveedge/?kt=k_&k=12%8B%85%92%63'));
   ui.updateProviderControls();
   check(Java.cast(field(ui,'provider'),Java.use('android.widget.Spinner')).getSelectedItemPosition()===1,'Kyodemo provider selected');
   const actualKeyword=javaText(Java.cast(field(ui,'keyword'),Java.use('android.widget.EditText')).getText());
   console.log('QUERY='+actualKeyword);
   check(actualKeyword==='12球団','Japanese query restored');
   check(Java.cast(field(ui,'exclude'),Java.use('android.view.View')).getVisibility()===8,'unsupported exclusion hidden');
   ui.search(1);
  }catch(e){console.log('FAIL START '+e.stack);cleanup();}});
 },onComplete(){}})),2500);
 const timer=setInterval(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(done||!ui)return;try{
  const text=javaText(Java.cast(field(ui,'status'),Java.use('android.widget.TextView')).getText());
  if(text.includes('SEARCH_'))throw Error(text);
  if(!text.startsWith('検索結果'))return;
  clearInterval(timer);
  const rows=Java.cast(field(ui,'results'),Java.use('android.widget.LinearLayout'));
  check(rows.getChildCount()===50,'live Android search rendered 50 rows');
  check(text.includes('このページ'),'unknown total is not reported as a false total');
  check(Java.cast(field(ui,'next'),Java.use('android.widget.Button')).isEnabled(),'live next page enabled');
  const state=Java.use('android.os.Bundle').$new();ui.saveState(state);
  const saved=JSON.parse(String(state.getString('haiagaru.eddi.search.state')));
  check(saved.query.includes('www.kyodemo.net'),'provider persisted in saved query');
  check(saved.threads.some(r=>r.url==='https://bbs.eddibb.cc/test/read.cgi/liveedge/1792624518/'),'provided thread canonical URL preserved');
  const Close=Java.registerClass({name:'org.haiagaru.test.ArchiveRestoreClose',implements:[Java.use('java.lang.Runnable')],methods:{run(){}}});
  const restored=Ui.embed(host,Uri.parse(base),null,state,Close.$new());
  check(Java.cast(field(restored,'provider'),Java.use('android.widget.Spinner')).getSelectedItemPosition()===1,'recreated view restores provider');
  check(Java.cast(field(restored,'results'),Java.use('android.widget.LinearLayout')).getChildCount()===50,'recreated view restores cached results without a search');
  restored.dispose();
  console.log('READY_KYODEMO_SCREEN checks='+checks);
  setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
   const selector=Java.cast(field(ui,'provider'),Java.use('android.widget.Spinner'));
   selector.setSelection(0);
   // Same callback delivery as BoundSettingRow, whose Spinner model is offscreen.
   selector.getOnItemSelectedListener().onItemSelected(selector,null,0,selector.getItemIdAtPosition(0));
   setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
    check(Java.cast(field(ui,'exclude'),Java.use('android.view.View')).getVisibility()===0,'original provider controls return');
    check(rows.getChildCount()===0,'switch clears previous provider results');
    check(!Java.cast(field(ui,'next'),Java.use('android.widget.Button')).isEnabled(),'switch cannot navigate stale provider results');
    console.log('KYODEMO_ARCHIVE_COMPLETE checks='+checks);
   }catch(e){console.log('FAIL SWITCH '+e.stack);}finally{cleanup();}})),800);
  }catch(e){console.log('FAIL SWITCH '+e.stack);cleanup();}})),22000);
 }catch(e){console.log('FAIL RESULT '+e.stack);clearInterval(timer);cleanup();}})),1000);
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(!done){console.log('FAIL TIMEOUT');cleanup();}clearInterval(timer);})),40000);
});
