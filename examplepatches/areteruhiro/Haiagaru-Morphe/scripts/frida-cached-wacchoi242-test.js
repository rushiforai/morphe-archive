// Verification package only; native cached-log search with a synthetic query, no network/posting.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 verification app only');
 Java.classFactory.loader=app.getClassLoader();
 const prefs=app.getSharedPreferences('haiagaru.cached-wacchoi-search',0),key='cachedWacchoiSuffixOnly',had=prefs.contains(key),old=prefs.getBoolean(key,false);
 const Intent=Java.use('android.content.Intent'),Cb=Java.use('android.widget.CheckBox');let checks=0,activity,fragment,model;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function field(o,n){for(let c=o.getClass();c;c=c.getSuperclass())try{const f=c.getDeclaredField(n);f.setAccessible(true);return f.get(o);}catch(e){}throw Error('Missing field '+n);}
 function call(o,name){const m=o.getClass().getMethod(name,Java.array('java.lang.Class',[]));m.setAccessible(true);return m.invoke(o,Java.array('java.lang.Object',[]));}
 function state(){return call(field(model,'c'),'d');}
 function query(){return String(field(state(),'a'));}
 function restore(){const edit=prefs.edit();if(had)edit.putBoolean(key,old);else edit.remove(key);edit.commit();console.log('CACHED_SEARCH_PREF_RESTORED');}
 Java.scheduleOnMainThread(()=>{try{
  const intent=Intent.$new(app,Java.use('jp.syoboi.a2chMate.activity.SearchActivity').class);
  const args=Java.use('jp.syoboi.a2chMate.feature.logsearch.SearchFragmentArgs').$new('bed4-6Zun',true,false,false,true);
  intent.putExtra.overload('java.lang.String','android.os.Parcelable').call(intent,'searchArgs',args);intent.addFlags(0x10000000);app.startActivity(intent);
 }catch(e){console.log('FAIL launch '+e.stack);restore();}});
 setTimeout(()=>Java.perform(()=>Java.choose('o.GNk49',{onMatch(f){if(f.isResumed()&&f.getView()&&f.getView().isShown())fragment=Java.retain(f);},onComplete(){Java.scheduleOnMainThread(()=>{try{
  const thread=Java.use('android.app.ActivityThread').currentActivityThread(),records=Java.cast(field(thread,'mActivities'),Java.use('java.util.Map')).values().iterator();
  while(records.hasNext()){const a=Java.cast(field(records.next(),'activity'),Java.use('android.app.Activity'));if(String(a.getClass().getName())==='jp.syoboi.a2chMate.activity.SearchActivity'&&a.hasWindowFocus())activity=Java.retain(a);}
  console.log('FRAGMENT_READY '+!!fragment);
  if(!activity&&fragment)activity=Java.retain(Java.cast(fragment.getActivity(),Java.use('android.app.Activity')));
  check(!!activity,'native cached search activity');
  const found=activity.getWindow().getDecorView().findViewWithTag('haiagaru.cachedWacchoiSuffixOnly');check(!!found,'toggle is inside cached search screen');const toggle=Java.cast(found,Cb);check(toggle.isEnabled(),'full slip enables suffix option');
  const bounds=Java.use('android.graphics.Rect').$new();console.log('TOGGLE_BOUNDS '+toggle.getGlobalVisibleRect(bounds)+' '+bounds+' height='+toggle.getHeight()+' shown='+toggle.isShown());check(bounds.height()>0&&toggle.isShown(),'toggle has visible screen area');
  const safe=activity.getWindow().getDecorView().getRootWindowInsets().getInsets(Java.use('android.view.WindowInsets$Type').systemBars());check(bounds.top.value>=safe.top.value,'toggle is below status bar');
  check(!!fragment,'native 242 search fragment');model=Java.retain(call(field(fragment,'b'),'getValue'));
  console.log('SEARCH_FRAGMENT_ARGUMENTS '+!!fragment.getArguments());
  if(toggle.isChecked())toggle.setChecked(false);check(query()==='bed4-6Zun','original full query');const original=String(state());
  toggle.setChecked(true);check(query()==='-6Zun','ON applies lower four only');check(prefs.getBoolean(key,false),'ON choice persisted');
  toggle.setChecked(false);check(query()==='bed4-6Zun','OFF restores full query');check(String(state())===original,'other native search conditions unchanged');
  toggle.setChecked(true);Java.cast(model,Java.use('jp.syoboi.a2chMate.feature.logsearch.SearchFragmentViewModel')).e.overload('java.lang.String').call(model,'user edited');toggle.setChecked(false);check(query()==='user edited','OFF preserves manually edited query');
  Java.cast(model,Java.use('jp.syoboi.a2chMate.feature.logsearch.SearchFragmentViewModel')).e.overload('java.lang.String').call(model,'bed4-6Zun');
  toggle.setChecked(true);activity.recreate();
  setTimeout(()=>Java.perform(()=>Java.choose('o.GNk49',{onMatch(f){if(f.isResumed()&&f.getView()&&f.getView().isShown())fragment=Java.retain(f);},onComplete(){Java.scheduleOnMainThread(()=>{try{
   model=Java.retain(call(field(fragment,'b'),'getValue'));
   const rs=Java.cast(field(Java.use('android.app.ActivityThread').currentActivityThread(),'mActivities'),Java.use('java.util.Map')).values().iterator();let recreated;
   while(rs.hasNext()){const a=Java.cast(field(rs.next(),'activity'),Java.use('android.app.Activity'));if(String(a.getClass().getName())==='jp.syoboi.a2chMate.activity.SearchActivity'&&a.hasWindowFocus())recreated=a;}
   check(!!recreated,'search activity recreated');const found=recreated.getWindow().getDecorView().findViewWithTag('haiagaru.cachedWacchoiSuffixOnly'),t=Java.cast(found,Cb);
   console.log('RECREATED_TOGGLE enabled='+t.isEnabled()+' checked='+t.isChecked()+' query='+query()+' pref='+prefs.getBoolean(key,false));
   check(t.isEnabled()&&t.isChecked(),'suffix toggle restored after recreation');check(query()==='-6Zun','suffix query retained after recreation');t.setChecked(false);check(query()==='bed4-6Zun','OFF after recreation restores original full query');restore();console.log('CACHED_WACCHOI242_COMPLETE '+checks+' checks');
  }catch(e){console.log('FAIL recreation '+e.stack);restore();}});}})),8000);
 }catch(e){console.log('FAIL '+e.stack);restore();}});}})),3500);
});
