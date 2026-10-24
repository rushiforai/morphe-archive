// Exercise chooser in separately opened settings, without setting an origin extra.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),T=Java.use('app.morphe.extension.chmate.NativeToolTabs'),Intent=Java.use('android.content.Intent');
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),keys=['nativeToolTabs','nativeToolTabSearch'];
 const saved=keys.map(k=>({k,had:p.contains(k),v:p.getBoolean(k,false)}));let host,settings,fragment,checks=0;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
 function restore(){const e=p.edit();saved.forEach(s=>{if(s.had)e.putBoolean(s.k,s.v);else e.remove(s.k);});e.commit();}
 function run(fn){Java.perform(()=>Java.scheduleOnMainThread(()=>{try{fn();}catch(e){restore();console.log('FAIL '+e.stack);}}));}
 run(()=>{host=Java.retain(T.manualHost(H.toolbarActivity(null)));check(host&&String(host.getClass().getName())==='jp.syoboi.a2chMate.activity.TabletHomeActivity','tablet host');
  p.edit().putBoolean(keys[0],false).putBoolean(keys[1],false).commit();
  check(!T.open(host,'search'),'individual screen OFF retains separate-screen routing');
  host.startActivity(Intent.$new(host,Java.use('app.morphe.extension.chmate.HaiagaruSettingsActivity').class));
 });
 setTimeout(()=>Java.perform(()=>Java.choose('app.morphe.extension.chmate.HaiagaruSettingsActivity',{onMatch(s){if(!s.isFinishing()&&!s.isDestroyed()&&s.equals(H.toolbarActivity(null)))settings=Java.retain(s);},onComplete(){run(()=>{
  check(!!settings,'standalone settings is foreground');
  // First-run offer can cover the Activity; dismiss only, never apply a preset.
  Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch(d){if(d.isShowing()&&String(field(field(d,'spec'),'title'))==='Haiagaruの初期設定')d.dismiss();},onComplete(){}});
  check(T.manualHost(settings).equals(host),'settings without origin extra resolves same-task tablet');T.showChooser(settings);
 });}})),4500);
 setTimeout(()=>Java.perform(()=>Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch(d){if(!d.isShowing())return;const spec=field(d,'spec');if(String(field(spec,'title'))!=='タブに追加する画面')return;
  run(()=>{check(Java.use('java.lang.reflect.Array').getLength(field(spec,'items'))===6,'all six manual tools available while auto/individual switches off');
   const callback=Java.cast(field(spec,'itemClick'),Java.use('android.content.DialogInterface$OnClickListener'));d.dismiss();callback.onClick(d,2);
  });},onComplete(){}})),7500);
 setTimeout(()=>Java.perform(()=>Java.choose('app.morphe.extension.chmate.NativeToolFragment',{onMatch(f){const n=Java.cast(f,Java.use('androidx.fragment.app.Fragment'));if(n.isResumed()&&n.getArguments()&&String(n.getArguments().getString('_data'))==='haiagaru-tool://search')fragment=Java.retain(f);},onComplete(){run(()=>{
  check(!!fragment,'manual chooser creates visible native search tab');
  check(!p.getBoolean(keys[0],true)&&!p.getBoolean(keys[1],true),'automatic preferences remain off');
  check(settings.isFinishing()||settings.isDestroyed(),'separate settings closed after tablet resume');
  check(T.closeCurrentTab(host,fragment),'test tab closes normally');restore();console.log('MANUAL_CHOOSER_COMPLETE checks='+checks+' preferences restored');
 });}})),25000);
});
