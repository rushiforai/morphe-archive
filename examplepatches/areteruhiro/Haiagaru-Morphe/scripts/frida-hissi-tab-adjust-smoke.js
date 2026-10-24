// Adds/closes only one test Hissi tab. Restores display preferences; no login/posting.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Verification 242 required');
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),T=Java.use('app.morphe.extension.chmate.NativeToolTabs'),H=Java.use('app.morphe.extension.chmate.Haiagaru');
 const bools=['nativeToolTabs','nativeToolTabHissi','dedicatedViewerEnabled'],ints=['hissiCheckerMode','hissiViewerTextZoom','hissiViewerResponseSpacingDp','hissiViewerToolbarHeightDp'];
 const saved=bools.concat(ints).map(k=>({k,had:p.contains(k),v:bools.includes(k)?p.getBoolean(k,false):p.getInt(k,0)}));
 let host,fragment,controller,dialog;
 function field(o,k){const f=o.getClass().getDeclaredField(k);f.setAccessible(true);return f.get(o);}
 function check(ok,label){if(!ok)throw Error(label);console.log('PASS '+label);}
 function run(fn){Java.perform(()=>Java.scheduleOnMainThread(()=>{try{fn();}catch(e){console.log('FAIL '+e.stack);}}));}
 function restore(){const e=p.edit();saved.forEach(s=>{if(!s.had)e.remove(s.k);else if(bools.includes(s.k))e.putBoolean(s.k,s.v);else e.putInt(s.k,s.v);});e.commit();}
 function find(v,text){if(Java.use('android.widget.TextView').class.isInstance(v)&&String(Java.cast(v,Java.use('android.widget.TextView')).getText())===text)return v;if(Java.use('android.view.ViewGroup').class.isInstance(v)){const g=Java.cast(v,Java.use('android.view.ViewGroup'));for(let i=0;i<g.getChildCount();i++){const r=find(g.getChildAt(i),text);if(r)return r;}}return null;}
 run(()=>{host=Java.retain(H.toolbarActivity(null));check(host&&String(host.getClass().getName())==='jp.syoboi.a2chMate.activity.TabletHomeActivity','foreground tablet host');
  p.edit().putBoolean(bools[0],true).putBoolean(bools[1],true).putBoolean(bools[2],true).putInt(ints[0],1).commit();
  const intent=Java.use('android.content.Intent').$new().setData(Java.use('android.net.Uri').parse('http://hissi.org/read.php/android/'));
  check(T.open(host,'hissi',intent),'dedicated Hissi viewer opens in native tab');
 });
 setTimeout(()=>Java.perform(()=>Java.choose('app.morphe.extension.chmate.NativeToolFragment',{onMatch(f){const b=Java.cast(f,Java.use('androidx.fragment.app.Fragment'));if(b.getArguments()&&String(b.getArguments().getString('_data'))==='haiagaru-tool://hissi'&&b.isResumed())fragment=Java.retain(b);},onComplete(){run(()=>{
  check(!!fragment&&!!fragment.getView(),'Hissi tab content attached');
  const content=field(Java.cast(fragment,Java.use('app.morphe.extension.chmate.NativeToolFragment')),'content');
  controller=Java.retain(Java.cast(field(content,'controller'),Java.use('app.morphe.extension.chmate.HissiMenuController')));
  check(!!controller,'embedded Hissi controller bound to test tab');
  const root=Java.cast(field(controller,'rootLayout'),Java.use('android.view.View'));
  check(!!find(root,'‹   必死チェッカー · ChMateビュー'),'compact checker heading retained');
  check(find(root,'スレ立て')===null,'removed thread-count summary absent');
  const adjust=find(root,'調整');check(!!adjust,'viewer adjustment button');adjust.performClick();
 });}})),7000);
 setTimeout(()=>Java.perform(()=>Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch(d){if(d.isShowing()&&String(field(field(d,'spec'),'title'))==='必死チェッカーの表示調整')dialog=Java.retain(d);},onComplete(){run(()=>{
  check(!!dialog,'adjustment dialog shown');const content=Java.cast(field(field(dialog,'spec'),'view'),Java.use('android.view.ViewGroup'));const sliders=[];
  for(let i=0;i<content.getChildCount();i++){const v=content.getChildAt(i);if(Java.use('android.widget.SeekBar').class.isInstance(v))sliders.push(Java.cast(v,Java.use('android.widget.SeekBar')));}
  check(sliders.length===3,'zoom spacing height sliders available');sliders[0].setProgress(10);sliders[1].setProgress(2);sliders[2].setProgress(0);dialog.getButton(-1).performClick();
 });}})),13000);
 setTimeout(()=>run(()=>{try{check(H.hissiViewerTextZoom()===110&&H.hissiViewerResponseSpacingDp()===2&&H.hissiViewerToolbarHeightDp()===32,'adjustments applied and saved');console.log('HISSI_TAB_ADJUST_COMPLETE');}finally{if(dialog&&dialog.isShowing())dialog.dismiss();if(host&&fragment)T.closeCurrentTab(host,fragment);restore();console.log('HISSI_TEST_TAB_CLOSED_PREFERENCES_RESTORED');}}),20000);
});
