// Reproduce the popup cache collision using the real visible thread's rows; restore cache/preferences.
Java.perform(function(){Java.scheduleOnMainThread(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();
 const E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),N=Java.use('app.morphe.extension.chmate.PopularNativeRows'),P=Java.use('app.morphe.extension.chmate.PopularReplies');
 const O=Java.use('java.lang.Object').class,L=Java.use('java.util.List'),A=Java.use('java.util.ArrayList'),I=Java.use('java.lang.Integer'),B=Java.use('java.lang.Boolean');
 function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f;}
 function invoke(c,n,types,args){const m=c.class.getDeclaredMethod(n,Java.array('java.lang.Class',types));m.setAccessible(true);return m.invoke(null,Java.array('java.lang.Object',args));}
 let snapshots,backup;
 try{
  const sf=N.class.getDeclaredField('snapshots');sf.setAccessible(true);snapshots=Java.cast(sf.get(null),L);backup=A.$new(snapshots);
  const of=E.class.getDeclaredField('OWNERS');of.setAccessible(true);const owners=Java.cast(of.get(null),L);let adapter;
  for(let i=owners.size()-1;i>=0;i--){const owner=Java.cast(owners.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!owner)continue;
   const v=owner.getClass().getMethod('getView',Java.array('java.lang.Class',[])).invoke(owner,Java.array('java.lang.Object',[]));
   if(v&&Java.cast(v,Java.use('android.view.View')).isShown()){adapter=invoke(E,'adapter',[O],[owner]);break;}}
  if(!adapter)throw Error('No visible thread');
  const name=String(adapter.getClass().getName()),source=P.fullList(field(adapter,name==='o.m9ExternalSyntheticLambda1'?'K':name==='o.listener'?'J':'o').get(adapter));
  const original=N.find(source);if(!original)throw Error('No full layout');
  const threshold=field(original,'threshold').getInt(original),flat=field(original,'flat').getBoolean(original),rows=Java.cast(field(original,'rows').get(original),L);
  const before=N.select(source,threshold).size();if(before<=0)throw Error('Need existing popular posts');
  const popup=A.$new();let firstRow;
  for(let i=0;i<rows.size();i++){const r=invoke(E,'rowResponse',[O],[rows.get(i)]);if(!r)continue;const no=E.number(r);if(no===1)firstRow=rows.get(i);if(no>1&&popup.isEmpty())popup.add(rows.get(i));}
  if(popup.isEmpty())throw Error('Need response other than 1');
  invoke(N,'save',[L.class,B.TYPE.value,I.TYPE.value],[popup,B.valueOf(flat),I.valueOf(threshold)]);
  const after=N.select(source,threshold).size();console.log('POPUP_NONFIRST before='+before+' after='+after);
  if(after!==before)throw Error('Non-first popup replaced the main thread popularity');
  const popupSource=A.$new();popupSource.add(invoke(E,'rowResponse',[O],[popup.get(0)]));
  const popupCapture=N.find(popupSource);if(popupCapture&&popupCapture.equals(original))throw Error('Popup resolved to unrelated full-thread capture');
  if(firstRow){const prefix=A.$new();prefix.add(firstRow);
   invoke(N,'save',[L.class,B.TYPE.value,I.TYPE.value],[prefix,B.valueOf(!flat),I.valueOf(threshold)]);
   if(N.select(source,threshold).size()!==before)throw Error('First-response popup changed the full thread mode');}
  console.log('PASS main/popup layout identity, count and mode remain isolated');
 }catch(e){console.log('FAIL '+e.stack);}
 finally{if(snapshots&&backup){snapshots.clear();snapshots.addAll(backup);}console.log('POPUP_ISOLATION_CACHE_RESTORED');}
});});
