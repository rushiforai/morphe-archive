// Isolated verification package; no thread/read state edits. Preference restored.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 Java.scheduleOnMainThread(function(){
  const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='popularReplyPopup',had=p.contains(key),old=p.getBoolean(key,false);
  try{
   const a=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
   if(!a)throw Error('No foreground Activity');
   const owner=Java.use('app.morphe.extension.chmate.PopularReplies');
   const panel=Java.use('android.widget.LinearLayout').$new(a);owner.addSettings(panel,a);
   const toggle=Java.cast(panel.getChildAt(0),Java.use('android.widget.Switch'));
   for(let i=0;i<4;i++){
    const before=toggle.isChecked();toggle.performClick();const on=p.getBoolean(key,false);
    if(on===before||owner.enabledFor(app)!==on)throw Error('Toggle not persisted/applied');
    if(!on&&owner.interceptLegacy(null))throw Error('OFF still intercepts native popularity');
    console.log('PASS settings tap '+i+' saved='+on+' effective='+owner.enabledFor(app));
   }
   console.log('LABEL='+toggle.getText());
  }catch(e){console.log('FAIL '+e.stack);}
  finally{const edit=p.edit();if(had)edit.putBoolean(key,old);else edit.remove(key);edit.commit();console.log('POPULAR_PREFERENCE_RESTORED');}
 });
});
