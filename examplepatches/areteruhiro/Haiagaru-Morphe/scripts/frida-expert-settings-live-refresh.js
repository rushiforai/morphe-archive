// Tests the live 242 SettingsActivity context with real ExpertSettings bindings; restores the saved preference.
setImmediate(function(){Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.reporter242')throw Error('reporter242 only');
 const AT=Java.use('android.app.ActivityThread'),Settings=Java.use('app.morphe.extension.chmate.HaiagaruSettingsActivity'),Haiagaru=Java.use('app.morphe.extension.chmate.Haiagaru'),Form=Java.use('app.morphe.extension.chmate.SettingsFormKt');
 const map=AT.currentActivityThread().mActivities.value,it=map.values().iterator();let host=null;
 while(it.hasNext()){const record=it.next(),fields=record.getClass().getDeclaredFields();for(let i=0;i<fields.length;i++){const f=fields[i];if(String(f.getName())==='activity'){f.setAccessible(true);const a=f.get(record);if(String(a.getClass().getName())===Settings.$className)host=Java.cast(a,Settings);}}}
 if(!host){send('FAIL settings activity not running');return;}
 Java.scheduleOnMainThread(function(){const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='expertSettingsMode',had=prefs.contains(key),old=prefs.getBoolean(key,false);let checks=0;
  function check(ok,label){if(!ok)throw Error(label);checks++;send('PASS '+label);}
  try{prefs.edit().putBoolean(key,false).commit();const root=Haiagaru.settingsCategory(host,'EXPERT');const mode=Java.cast(root.getChildAt(0),Java.use('android.widget.CompoundButton')),options=root.getChildAt(2),rows=Form.settingsRows.overload('android.view.ViewGroup');
   check(options.getVisibility()===8,'expert options hidden when OFF');const off=rows.call(Form,root).size();mode.performClick();
   check(prefs.getBoolean(key,false),'ON toggle writes the real setting');check(options.getVisibility()===0,'ON options appear synchronously');const on=rows.call(Form,root).size();check(on>off,'Compose settingsRows reflects expert options immediately');
   mode.performClick();check(!prefs.getBoolean(key,true),'OFF toggle writes the real setting');check(options.getVisibility()===8,'OFF options disappear synchronously');check(rows.call(Form,root).size()===off,'Compose settingsRows removes expert options immediately');send('EXPERT_SETTINGS_LIVE_REFRESH_COMPLETE '+checks+' checks');
  }catch(e){send('FAIL '+String(e.stack||e));}finally{const edit=prefs.edit();if(had)edit.putBoolean(key,old);else edit.remove(key);edit.commit();}
 });
});});
