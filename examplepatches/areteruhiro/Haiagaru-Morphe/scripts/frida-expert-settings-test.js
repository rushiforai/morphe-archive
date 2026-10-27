rpc.exports.run=function(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!String(app.getPackageName()).endsWith('.resumefix242')){reject(Error('Verification package only'));return;}
 Java.classFactory.loader=app.getClassLoader();
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),keys=['expertSettingsMode','previewScrollPositionRetention'];
 const saved=keys.map(key=>({key,had:prefs.contains(key),value:prefs.getBoolean(key,false)}));
 const Activity=Java.use('android.app.Activity'),Group=Java.use('android.view.ViewGroup'),Text=Java.use('android.widget.TextView'),Toggle=Java.use('android.widget.Switch');
 let activity;const checks=[];function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 function text(v){return Text.class.isInstance(v)?String(Java.cast(v,Text).getText()):'';}
 Java.choose('jp.syoboi.a2chMate.activity.HomeActivity',{onMatch(a){if(!a.isFinishing()&&a.getWindow().getDecorView().hasWindowFocus())activity=Java.retain(a);},onComplete(){Java.scheduleOnMainThread(()=>{
  try{
   check(!!activity,'foreground Activity');prefs.edit().putBoolean(keys[0],false).commit();
   const featureBefore=prefs.getBoolean(keys[1],true),root=Java.use('app.morphe.extension.chmate.ExpertSettings').create(activity),mode=Java.cast(root.getChildAt(0),Toggle),options=Java.cast(root.getChildAt(2),Group);
   check(!mode.isChecked()&&options.getVisibility()===8,'OFF hides controls');mode.performClick();check(prefs.getBoolean(keys[0],false)&&options.getVisibility()===0,'ON saves and displays controls');
   let preview;for(let i=0;i<options.getChildCount();i++){const v=options.getChildAt(i);if(text(v)==='リンクカード更新時にスクロール位置を保持')preview=Java.cast(v,Toggle);}
   check(!!preview,'preview switch exists');const old=preview.isChecked();preview.performClick();check(prefs.getBoolean(keys[1],old)===!old,'individual switch saves');
   const position=Java.use('app.morphe.extension.chmate.XPostPreviewPosition'),method=position.class.getDeclaredMethod('enabled',Java.array('java.lang.Class',[Java.use('android.view.View').class]));method.setAccessible(true);
   check(String(method.invoke(null,Java.array('java.lang.Object',[root])))===String(!old),'runtime reads changed setting');preview.performClick();check(prefs.getBoolean(keys[1],!old)===old,'individual switch restores');
   mode.performClick();check(options.getVisibility()===8&&prefs.getBoolean(keys[1],true)===featureBefore,'closing expert keeps feature setting');
   const h=Java.use('app.morphe.extension.chmate.Haiagaru'),advanced=h.class.getDeclaredMethod('settingsADVANCED',Java.array('java.lang.Class',[Activity.class]));advanced.setAccessible(true);
   const panel=Java.cast(advanced.invoke(null,Java.array('java.lang.Object',[activity])),Group);let ua=-1,template=-1;
   for(let i=0;i<panel.getChildCount();i++){const t=text(panel.getChildAt(i));if(t==='User-Agentを変更する')ua=i;if(t==='UAテンプレートを選ぶ')template=i;}
   check(ua>=0&&template===ua+1,'template directly below UA switch');resolve({checks:checks.length,passed:checks});
  }catch(e){reject(Error(String(e.stack||e)));}finally{const edit=prefs.edit();saved.forEach(s=>s.had?edit.putBoolean(s.key,s.value):edit.remove(s.key));edit.commit();}
 });}});
}));};