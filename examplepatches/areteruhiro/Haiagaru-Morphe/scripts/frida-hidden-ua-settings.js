Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix242)$/.test(String(app.getPackageName())))throw Error('Test package required');
 Java.classFactory.loader=app.getClassLoader();
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),VG=Java.use('android.view.ViewGroup'),TV=Java.use('android.widget.TextView');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),before=prefs.getAll().toString();let rows=0;
 function visit(v){if(TV.class.isInstance(v)){const t=Java.cast(v,TV);if(/user.agent/i.test(String(t.getText())+' '+String(t.getHint())))throw Error('UA control remains');rows++;}if(VG.class.isInstance(v)){const g=Java.cast(v,VG);for(let i=0;i<g.getChildCount();i++)visit(g.getChildAt(i));}}
 Java.scheduleOnMainThread(()=>{try{const activity=H.toolbarActivity(null);const view=H.settingsCategory(activity,'ADVANCED');visit(view);if(String(prefs.getAll().toString())!==String(before))throw Error('Settings construction changed saved preferences');console.log('PASS UA controls absent from advanced settings model; inspected='+rows+'; preferences unchanged');}catch(e){console.log('FAIL '+e.stack);}});
});
