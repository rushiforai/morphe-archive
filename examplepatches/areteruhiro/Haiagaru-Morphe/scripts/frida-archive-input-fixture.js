// Real native tab/form. Suppress external search and restore disposable state.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 test package required');
 Java.classFactory.loader=app.getClassLoader();
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),T=Java.use('app.morphe.extension.chmate.NativeToolTabs'),E=Java.use('app.morphe.extension.chmate.EddiArchiveSearchUi');
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),ep=app.getSharedPreferences('haiagaru_eddi_search',0);
 const had=p.contains('nativeToolTabs'),value=p.getBoolean('nativeToolTabs',false),hadLast=ep.contains('last'),last=ep.getString('last',null);
 let host,fragment;const search=E.search.overload('int');search.implementation=function(n){console.log('FIXTURE_SEARCH_SUPPRESSED');};
 Java.scheduleOnMainThread(()=>{host=Java.retain(T.manualHost(H.toolbarActivity(null)));p.edit().putBoolean('nativeToolTabs',true).commit();T.openManual(host,'eddi');});
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
  Java.choose('app.morphe.extension.chmate.EddiArchiveSearchUi',{onMatch(ui){if(ui.disposed.value)return;ui.advancedScroll.value.setVisibility(0);ui.searchForm.value.setVisibility(0);console.log('ARCHIVE_INPUT_FIXTURE_READY');},onComplete(){}});
  Java.choose('app.morphe.extension.chmate.NativeToolFragment',{onMatch(f){const n=Java.cast(f,Java.use('androidx.fragment.app.Fragment'));if(n.isAdded()&&String(n.getArguments().getString('_data'))==='haiagaru-tool://eddi?pane=home')fragment=Java.retain(f);},onComplete(){}});
 })),2500);
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(fragment)T.closeCurrentTab(host,fragment);search.implementation=null;
  setTimeout(()=>Java.perform(()=>{const e=p.edit();if(had)e.putBoolean('nativeToolTabs',value);else e.remove('nativeToolTabs');e.commit();const ee=ep.edit();if(hadLast)ee.putString('last',last);else ee.remove('last');ee.commit();console.log('ARCHIVE_INPUT_FIXTURE_RESTORED');}),700);
 })),300000);
});
