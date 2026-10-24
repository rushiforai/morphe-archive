// Independent name/body visibility, including old coupled saves; restore all touched preferences.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();
 const R=Java.use('app.morphe.extension.chmate.ResponseMenuSettings'),p=app.getSharedPreferences('haiagaru_response_actions',0);
 const ids=[75,0x7e000077,0x7e000078,0x7e000079],names=['wacchoiLongPressSearch','wacchoiLongPressSuffixSearch','wacchoiLongPressPrefixSearch','wacchoiLongPressPrefixNg'];
 const keys=ids.flatMap((id,i)=>['visibility.'+id,'responseVisibility.'+id,names[i]]),saved=keys.map(k=>({k,had:p.contains(k),v:k.startsWith('wacchoi')?p.getBoolean(k,false):p.getInt(k,0)}));
 const native=app.getSharedPreferences('resMenuDialog',0),had=native.contains('toolbarSettings'),before=native.getString('toolbarSettings','');
 Java.scheduleOnMainThread(function(){let checks=0;const f=R.class.getDeclaredField('BUILD_TOOLS');f.setAccessible(true);const local=Java.cast(f.get(null),Java.use('java.lang.ThreadLocal')),old=local.get();
  function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
  try{
   const a=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
   native.edit().putString('toolbarSettings',JSON.stringify({buttons:ids.map(id=>({id,visible:false}))})).commit();
   for(let i=0;i<ids.length;i++){
    const id=ids[i],key=names[i];p.edit().putInt('visibility.'+id,1).remove('responseVisibility.'+id).putBoolean(key,true).commit();
    check(R.nameMenuVisible(id),'old name ON '+id);check(!R.visible(id),'old coupled override does not leak into toolbar '+id);
    const panel=Java.use('android.widget.LinearLayout').$new(a);R.addWacchoiSearchSetting(panel,a);const toggle=Java.cast(panel.getChildAt(i),Java.use('android.widget.Switch'));
    toggle.performClick();check(!R.nameMenuVisible(id)&&!R.visible(id),'name OFF keeps toolbar hidden '+id);
    toggle.performClick();check(R.nameMenuVisible(id)&&!R.visible(id),'name ON keeps toolbar hidden '+id);
    R.storeVisibility(p,id,1);check(R.visible(id)&&R.nameMenuVisible(id),'independent toolbar ON '+id);
    toggle.performClick();check(!R.nameMenuVisible(id)&&R.visible(id),'name OFF keeps explicit toolbar ON '+id);
    R.storeVisibility(p,id,2);check(!R.visible(id)&&!R.nameMenuVisible(id),'both OFF '+id);
    toggle.performClick();local.set(Java.use('java.lang.Boolean').TRUE.value);
    check(R.nameMenuVisible(id)&&!R.visible(id),'Extra Tools body OFF/name ON '+id);local.set(old);
   }
   console.log('RESPONSE_MENU_SEPARATE_COMPLETE checks='+checks);
  }catch(e){console.log('FAIL '+e.stack);}
  finally{local.set(old);const e=p.edit();saved.forEach(s=>{if(!s.had)e.remove(s.k);else if(s.k.startsWith('wacchoi'))e.putBoolean(s.k,s.v);else e.putInt(s.k,s.v);});e.commit();const n=native.edit();if(had)n.putString('toolbarSettings',before);else n.remove('toolbarSettings');n.commit();console.log('RESPONSE_MENU_PREFS_RESTORED');}
 });
});
