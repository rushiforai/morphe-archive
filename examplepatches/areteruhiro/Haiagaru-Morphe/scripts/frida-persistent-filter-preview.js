// Exercise the actual settings switch; auto-restore after visual/ADB checks.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(!/\.haiagaru\.(settingsfix191|resumefix242)$/.test(pkg))throw Error('Verification app required');
 Java.classFactory.loader=app.getClassLoader();
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='persistentBottomQuickFilters',had=prefs.contains(key),old=prefs.getBoolean(key,false);
 let activity,toggle;
 Java.scheduleOnMainThread(()=>{try{
  const records=Java.use('android.app.ActivityThread').currentActivityThread().mActivities.value.values().toArray();
  for(let n=0;n<records.length;n++){const f=records[n].getClass().getDeclaredField('activity');f.setAccessible(true);const a=Java.cast(f.get(records[n]),Java.use('android.app.Activity'));if(!a.isFinishing()&&a.getWindow().getDecorView().hasWindowFocus())activity=Java.retain(a);}
  if(!activity)throw Error('Focused activity required');
  const root=H.settingsCategory(activity,'DISPLAY'),Group=Java.use('android.view.ViewGroup'),Switch=Java.use('android.widget.Switch');
  function visit(v){if(Switch.class.isInstance(v)&&String(Java.cast(v,Switch).getText())==='下部フィルターを常に表示')toggle=Java.retain(Java.cast(v,Switch));if(Group.class.isInstance(v)){const g=Java.cast(v,Group);for(let n=0;n<g.getChildCount();n++)visit(g.getChildAt(n));}}
  visit(root);if(!toggle)throw Error('Settings switch missing');toggle.setChecked(true);E.updateOptions(activity);
  console.log('PERSISTENT_FILTER_PREVIEW_READY actual settings switch ON; auto-restore in 60 seconds');
 }catch(e){console.log('FAIL '+e.stack);}});
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(!activity)return;try{
  const panel=activity.getWindow().getDecorView().findViewWithTag('haiagaru.persistentBottomFilters');
  console.log('PREVIEW_END panel='+!!panel);
  if(toggle)toggle.setChecked(old);const edit=prefs.edit();if(had)edit.putBoolean(key,old);else edit.remove(key);edit.commit();E.updateOptions(activity);
  console.log('PERSISTENT_FILTER_PREVIEW_RESTORED original preference presence/value');
 }catch(e){console.log('FAIL restore '+e.stack);}})),60000);
});
