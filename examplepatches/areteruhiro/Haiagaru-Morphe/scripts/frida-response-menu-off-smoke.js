// Exercises actual settings switch callbacks, including stale override conflicts. Restores prefs.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();
 const R=Java.use('app.morphe.extension.chmate.ResponseMenuSettings'),p=app.getSharedPreferences('haiagaru_response_actions',0);
 const ids=[75,0x7e000077,0x7e000078,0x7e000079],names=['wacchoiLongPressSearch','wacchoiLongPressSuffixSearch','wacchoiLongPressPrefixSearch','wacchoiLongPressPrefixNg'];
 const all=[0x7e484b01,0x7e484a01,0x7e484a03].concat(ids).concat([76]),keys=all.map(id=>'visibility.'+id).concat(names),saved=keys.map(k=>({k,had:p.contains(k),v:k.startsWith('visibility.')?p.getInt(k,0):p.getBoolean(k,false)}));
 Java.scheduleOnMainThread(function(){let checks=0;const f=R.class.getDeclaredField('BUILD_TOOLS');f.setAccessible(true);const local=Java.cast(f.get(null),Java.use('java.lang.ThreadLocal')),old=local.get();
  function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
  try{
   const a=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
   for(let i=0;i<ids.length;i++){
    p.edit().putInt('visibility.'+ids[i],1).putBoolean(names[i],false).commit();check(!R.visible(ids[i]),'explicit OFF wins over stale always-show '+ids[i]);
    R.storeVisibility(p,ids[i],1);const panel=Java.use('android.widget.LinearLayout').$new(a);R.addWacchoiSearchSetting(panel,a);const toggle=Java.cast(panel.getChildAt(i),Java.use('android.widget.Switch'));
    check(toggle.isChecked(),'always-show reflected in switch '+ids[i]);toggle.performClick();check(!R.visible(ids[i])&&p.getInt('visibility.'+ids[i],0)===2,'OFF switch updates both settings '+ids[i]);
    const reopened=Java.use('android.widget.LinearLayout').$new(a);R.addWacchoiSearchSetting(reopened,a);check(!Java.cast(reopened.getChildAt(i),Java.use('android.widget.Switch')).isChecked(),'OFF remains after reopening '+ids[i]);
    toggle.performClick();check(R.visible(ids[i]),'ON switch restores action '+ids[i]);
   }
   local.set(Java.use('java.lang.Boolean').TRUE.value);
   for(const id of all){R.storeVisibility(p,id,2);check(!R.visible(id),'Extra Tools cannot override always-hidden '+id);}
   console.log('RESPONSE_MENU_OFF_COMPLETE checks='+checks);
  }catch(e){console.log('FAIL '+e.stack);}
  finally{local.set(old);const e=p.edit();saved.forEach(s=>{if(!s.had)e.remove(s.k);else if(s.k.startsWith('visibility.'))e.putInt(s.k,s.v);else e.putBoolean(s.k,s.v);});e.commit();console.log('RESPONSE_MENU_PREFS_RESTORED');}
 });
});
