// Cached empty fixture. No network, search submission, posting or DAT writes.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Verification only');
 Java.classFactory.loader=app.getClassLoader();
 const E=Java.use('app.morphe.extension.chmate.EddiArchiveSearchUi'),L=Java.use('android.widget.LinearLayout'),B=Java.use('android.widget.Button'),p=app.getSharedPreferences('haiagaru_eddi_search',0),had=p.contains('hideSearchForm'),old=p.getBoolean('hideSearchForm',false);
 let ui,second,n=0;
 function check(v,s){if(!v)throw Error(s);console.log('PASS '+s);n++;}
 Java.scheduleOnMainThread(()=>{try{
  const activity=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null),state=Java.use('android.os.Bundle').$new();
  state.putString('haiagaru.eddi.search.state',JSON.stringify({query:'https://eddiarchive3rd.boy.jp/',threads:[],page:1,total:0}));
  const R=Java.registerClass({name:'app.morphe.extension.chmate.SearchVisibilityTestClose',implements:[Java.use('java.lang.Runnable')],methods:{run(){}}});
  p.edit().putBoolean('hideSearchForm',false).commit();
  ui=E.embed(activity,Java.use('android.net.Uri').parse('https://eddiarchive3rd.boy.jp/'),null,state,R.$new());
  const root=ui.rootView(),header=Java.cast(root.getChildAt(0),L),button=Java.cast(header.getChildAt(2),B),form=root.getChildAt(1);
  check(form.getVisibility()===0,'form initially visible');check(String(button.getText())==='検索欄を隠して結果を広く表示','direct hide action label');
  button.performClick();check(form.getVisibility()===8,'hide removes form');check(p.getBoolean('hideSearchForm',false),'hide saved');check(String(button.getText())==='検索欄を表示','restore action remains available');
  second=E.embed(activity,Java.use('android.net.Uri').parse('https://eddiarchive3rd.boy.jp/'),null,state,R.$new());check(second.rootView().getChildAt(1).getVisibility()===8,'new screen retains hidden state');
  button.performClick();check(form.getVisibility()===0&&!p.getBoolean('hideSearchForm',true),'restore shows form and saves');
  console.log('EDDI_SEARCH_VISIBILITY_COMPLETE '+n+' checks');
 }catch(e){console.log('FAIL '+e.stack);}finally{if(ui)ui.dispose();if(second)second.dispose();const edit=p.edit();if(had)edit.putBoolean('hideSearchForm',old);else edit.remove('hideSearchForm');edit.commit();console.log('SEARCH_VISIBILITY_PREF_RESTORED');}});
});
