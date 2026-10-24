Java.perform(function(){Java.scheduleOnMainThread(function(){try{
 const E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),f=E.class.getDeclaredField('OWNERS');f.setAccessible(true);const owners=Java.cast(f.get(null),Java.use('java.util.List'));
 function field(o,k){const f=o.getClass().getDeclaredField(k);f.setAccessible(true);return f.get(o);}
 for(let i=owners.size()-1;i>=0;i--){const owner=Java.cast(owners.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!owner)continue;
  const m=Java.use('app.morphe.extension.chmate.QuickFilterToolbar').findResponseViewModel(owner);if(!m)continue;
  const flow=field(m,'w');const value=flow.getClass().getMethod('d',Java.array('java.lang.Class',[])).invoke(flow,Java.array('java.lang.Object',[]));console.log('NATIVE_FILTER_STATE='+String(value));
  const a=E.class.getDeclaredMethod('adapter',Java.array('java.lang.Class',[Java.use('java.lang.Object').class]));a.setAccessible(true);const adapter=a.invoke(null,Java.array('java.lang.Object',[owner]));
  const state=E.class.getDeclaredField('STATES');state.setAccessible(true);const st=Java.cast(state.get(null),Java.use('java.util.Map')).get(adapter);const counts=field(st,'counts');console.log('HAIAGARU_COUNT='+Java.use('java.lang.reflect.Array').getInt(counts,0));console.log('FAILURE='+field(st,'failure'));
  const app=Java.use('android.app.ActivityThread').currentApplication(),p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);console.log('DIRECT='+p.getBoolean('popularReplyDirect',false)+' POPUP='+p.getBoolean('popularReplyPopup',false));
  const raw=field(adapter,'o');console.log('RAW_LIST='+raw.getClass().getName()+' size='+Java.cast(raw,Java.use('java.util.List')).size());
  const P=Java.use('app.morphe.extension.chmate.PopularReplies'),source=P.fullList(raw);const N=Java.use('app.morphe.extension.chmate.PopularNativeRows'),snapshot=N.find(source);console.log('SNAPSHOT='+snapshot);if(snapshot)console.log('FLAT='+field(snapshot,'flat')+' THRESHOLD='+field(snapshot,'threshold'));
  const types=Java.array('java.lang.Class',[Java.use('java.lang.Object').class,Java.use('java.util.List').class]);const collect=E.class.getDeclaredMethod('collect',types);collect.setAccessible(true);collect.invoke(null,Java.array('java.lang.Object',[adapter,source]));console.log('RECOLLECT_COUNT='+Java.use('java.lang.reflect.Array').getInt(field(st,'counts'),0));return;
 }throw Error('No response model');
 }catch(e){console.log('FAIL '+e.stack);}});});
