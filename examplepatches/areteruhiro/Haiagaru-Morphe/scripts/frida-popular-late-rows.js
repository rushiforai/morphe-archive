// A previous successful zero count must not suppress a later complete layout.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 const E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),P=Java.use('app.morphe.extension.chmate.PopularReplies');
 const L=Java.use('java.util.List'),O=Java.use('java.lang.Object').class,RA=Java.use('java.lang.reflect.Array');
 function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f;}
 const pref=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),keys=['popularReplyDirect','popularReplyPopup'];
 const saved=keys.map(k=>({k,had:pref.contains(k),v:pref.getBoolean(k,false)}));
 let state=null,fields=[],values=[];
 Java.scheduleOnMainThread(function(){try{
  const f=E.class.getDeclaredField('OWNERS');f.setAccessible(true);const owners=Java.cast(f.get(null),L);let adapter=null;
  for(let i=owners.size()-1;i>=0;i--){const owner=Java.cast(owners.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!owner)continue;
   const v=owner.getClass().getMethod('getView',Java.array('java.lang.Class',[])).invoke(owner,Java.array('java.lang.Object',[]));if(!v||!Java.cast(v,Java.use('android.view.View')).isShown())continue;
   const m=E.class.getDeclaredMethod('adapter',Java.array('java.lang.Class',[O]));m.setAccessible(true);adapter=m.invoke(null,Java.array('java.lang.Object',[owner]));break;
  }
  if(!adapter)throw Error('No visible thread');
  const states=E.class.getDeclaredField('STATES');states.setAccessible(true);state=Java.retain(Java.cast(states.get(null),Java.use('java.util.Map')).get(adapter));
  for(const key of ['counts','failure','aa','mine','replies','popularSnapshot']){try{const f=field(state,key);fields.push(f);values.push(f.get(state));}catch(e){if(key!=='popularSnapshot')throw e;}}
  const previous=field(state,'counts').get(state),counts=[];for(let i=0;i<7;i++)counts.push(RA.getInt(previous,i));counts[0]=0;
  field(state,'counts').set(state,Java.array('int',counts));field(state,'failure').set(state,null);
  try{field(state,'popularSnapshot').set(state,null);}catch(e){}
  pref.edit().putBoolean(keys[0],false).putBoolean(keys[1],false).commit();E.nativeRowsReady();
  console.log('LATE_ROWS_ZERO_COUNT_SEEDED');
 }catch(e){console.log('FAIL '+e.stack);}});
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(function(){try{
  if(!state)throw Error('Fixture not initialized');const result=RA.getInt(field(state,'counts').get(state),0);
  console.log('LATE_ROWS_REFRESH_COUNT='+result);if(result<=0)throw Error('Complete layout did not refresh successful zero count');
  console.log('PASS late layout refreshes zero count without switching threads');
 }catch(e){console.log('FAIL '+e.stack);}finally{
  if(state)for(let i=0;i<fields.length;i++)fields[i].set(state,values[i]);
  const edit=pref.edit();saved.forEach(s=>{if(s.had)edit.putBoolean(s.k,s.v);else edit.remove(s.k);});edit.commit();console.log('LATE_ROWS_FIXTURE_RESTORED');
 }})),1500);
});
