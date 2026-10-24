// Real thread display counters: switch modes without changing native filter selection.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!/jp\.co\.airfront\.android\.a2chMate\.haiagaru\.(resumefix242|popularfix242)$/.test(String(app.getPackageName())))throw Error('242 verification only');
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),keys=['popularReplyDirect','popularReplyPopup'],saved=keys.map(k=>({k,had:p.contains(k),v:p.getBoolean(k,false)}));
 Java.scheduleOnMainThread(function(){try{
  const E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),P=Java.use('app.morphe.extension.chmate.PopularReplies');
  function field(o,k){const f=o.getClass().getDeclaredField(k);f.setAccessible(true);return f.get(o);}
  const f=E.class.getDeclaredField('OWNERS');f.setAccessible(true);const owners=Java.cast(f.get(null),Java.use('java.util.List'));
  for(let i=owners.size()-1;i>=0;i--){const owner=Java.cast(owners.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!owner)continue;
   const view=owner.getClass().getMethod('getView',Java.array('java.lang.Class',[])).invoke(owner,Java.array('java.lang.Object',[]));if(!view||!Java.cast(view,Java.use('android.view.View')).isShown())continue;
   const m=E.class.getDeclaredMethod('adapter',Java.array('java.lang.Class',[Java.use('java.lang.Object').class]));m.setAccessible(true);const adapter=m.invoke(null,Java.array('java.lang.Object',[owner]));
   const sf=E.class.getDeclaredField('STATES');sf.setAccessible(true);const states=Java.cast(sf.get(null),Java.use('java.util.Map'));let standard=-1,direct=-1;
   for(const mode of [false,true,false])for(const popup of [false,true]){
    p.edit().putBoolean(keys[0],mode).putBoolean(keys[1],popup).commit();E.refreshPopularity();
    const count=Java.use('java.lang.reflect.Array').getInt(field(states.get(adapter),'counts'),0);
    console.log('MODE direct='+mode+' popup='+popup+' count='+count);
    if(mode){if(direct<0)direct=count;else if(direct!==count)throw Error('Popup affects direct count');}
    else{if(standard<0)standard=count;else if(standard!==count)throw Error('Standard count stale after mode change');}
    if(P.enabledFor(app)!==popup||P.directFor(app)!==mode)throw Error('Settings are coupled');
   }
   if(!(standard>direct&&direct>0))throw Error('Expected thread with branch and direct count difference');
   console.log('PASS real thread independent modes and immediate round-trip counts: standard='+standard+' direct='+direct);return;
  }throw Error('No visible response owner');
 }catch(e){console.log('FAIL '+e.stack);}finally{
  const edit=p.edit();saved.forEach(s=>{if(s.had)edit.putBoolean(s.k,s.v);else edit.remove(s.k);});edit.commit();Java.use('app.morphe.extension.chmate.ExtraQuickFilters').refreshPopularity();console.log('POPULAR_TOGGLE_PREFERENCES_RESTORED');
 }});
});
