// Reproduce a stale zero-result capture without changing native selection, DAT or read state.
Java.perform(function(){Java.scheduleOnMainThread(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 const E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),N=Java.use('app.morphe.extension.chmate.PopularNativeRows'),P=Java.use('app.morphe.extension.chmate.PopularReplies');
 const O=Java.use('java.lang.Object').class,L=Java.use('java.util.List'),I=Java.use('java.lang.Integer'),A=Java.use('java.util.ArrayList');
 function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f;}
 function invoke(c,n,types,args){const m=c.class.getDeclaredMethod(n,Java.array('java.lang.Class',types));m.setAccessible(true);return m.invoke(null,Java.array('java.lang.Object',args));}
 const pref=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),keys=['popularReplyDirect','popularReplyPopup'];
 const saved=keys.map(k=>({k,had:pref.contains(k),v:pref.getBoolean(k,false)}));
 let state=null,mask=0,pending=null,oldPending=false,snapshots=null,backup=null;
 try{
  const ownersField=E.class.getDeclaredField('OWNERS');ownersField.setAccessible(true);
  const owners=Java.cast(ownersField.get(null),L);let adapter=null;
  for(let i=owners.size()-1;i>=0;i--){const owner=Java.cast(owners.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!owner)continue;
   const v=owner.getClass().getMethod('getView',Java.array('java.lang.Class',[])).invoke(owner,Java.array('java.lang.Object',[]));
   if(v&&Java.cast(v,Java.use('android.view.View')).isShown()){adapter=invoke(E,'adapter',[O],[owner]);break;}
  }
  if(!adapter)throw Error('No visible thread');
  const name=String(adapter.getClass().getName()),source=P.fullList(field(adapter,name==='o.m9ExternalSyntheticLambda1'?'K':name==='o.listener'?'J':'o').get(adapter));
  const full=N.find(source);if(!full)throw Error('No complete layout');
  const rows=Java.cast(field(full,'rows').get(full),L);if(rows.size()<10)throw Error('Need a populated thread');
  const partial=A.$new();let first=null;
  for(let i=0;i<rows.size();i++){const row=rows.get(i),response=invoke(E,'rowResponse',[O],[row]);partial.add(row);if(response){first=response;break;}}
  const snapshotClass=Java.use('app.morphe.extension.chmate.PopularNativeRows$Snapshot');
  const ctor=snapshotClass.class.getDeclaredConstructor(Java.array('java.lang.Class',[L.class,Java.use('java.lang.Boolean').TYPE.value,I.TYPE.value]));ctor.setAccessible(true);
  const stale=ctor.newInstance(Java.array('java.lang.Object',[partial,Java.use('java.lang.Boolean').valueOf(false),I.valueOf(3)]));
  const sf=N.class.getDeclaredField('snapshots');sf.setAccessible(true);snapshots=Java.cast(sf.get(null),L);backup=A.$new(snapshots);snapshots.clear();snapshots.add(stale);
  const statesField=E.class.getDeclaredField('STATES');statesField.setAccessible(true);state=Java.cast(statesField.get(null),Java.use('java.util.Map')).get(adapter);
  mask=field(state,'pendingFilterMask').getInt(state);pending=field(state,'pendingFilters').get(state);
  const RA=Java.use('java.lang.reflect.Array');oldPending=RA.getBoolean(pending,0);RA.setBoolean(pending,0,true);field(state,'pendingFilterMask').setInt(state,mask|1);
  pref.edit().putBoolean(keys[0],false).putBoolean(keys[1],false).commit();
  const result=Java.cast(invoke(E,'filterCollected',[O,L.class],[adapter,rows]),L);
  let before=0,after=0;
  for(let i=0;i<rows.size();i++)if(invoke(E,'rowResponse',[O],[rows.get(i)]))before++;
  for(let i=0;i<result.size();i++)if(invoke(E,'rowResponse',[O],[result.get(i)]))after++;
  console.log('STALE_ZERO_LAYOUT nativeResponses='+before+' resultResponses='+after);
  if(after!==before)throw Error('Stale capture replaced valid native popular output');
  console.log('PASS standard popular output survives stale zero-result capture');
 }catch(e){console.log('FAIL '+e.stack);}
 finally{
  if(snapshots&&backup){snapshots.clear();snapshots.addAll(backup);}
  if(state&&pending){Java.use('java.lang.reflect.Array').setBoolean(pending,0,oldPending);field(state,'pendingFilterMask').setInt(state,mask);}
  const edit=pref.edit();saved.forEach(s=>{if(s.had)edit.putBoolean(s.k,s.v);else edit.remove(s.k);});edit.commit();
  console.log('STALE_LAYOUT_FIXTURE_RESTORED');
 }
});});
