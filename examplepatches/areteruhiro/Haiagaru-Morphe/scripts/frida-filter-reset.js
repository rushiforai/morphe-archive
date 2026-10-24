Java.perform(()=>{
 console.log('Filter reset fixture attached');
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!String(app.getPackageName()).endsWith('.settingsfix191'))throw Error('Test package required');
  Java.scheduleOnMainThread(()=>{
  console.log('Filter reset fixture on UI thread');
  try{
  const ownersField=Java.use('app.morphe.extension.chmate.ExtraQuickFilters').class.getDeclaredField('OWNERS');ownersField.setAccessible(true);
  const owners=Java.cast(ownersField.get(null),Java.use('java.util.List'));let found=false;
  for(let ix=0;ix<owners.size();ix++){const reference=Java.cast(owners.get(ix),Java.use('java.lang.ref.WeakReference'));const value=reference.get();if(!value)continue;const f=Java.cast(value,Java.use('o.pa'));if(found||!f.getView()||!f.getView().isShown())continue;found=true;
   try{const C=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),P=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
    const field=(o,n)=>{let t=o.getClass();while(t){try{const q=t.getDeclaredField(n);q.setAccessible(true);return q.get(o);}catch(e){t=t.getSuperclass();}}throw Error(n);};
    const a=field(f,'c'),m=field(a,'Y'),flags=['c','a','e','b'];let initial=[];
    const stateMethod=C.class.getDeclaredMethod('state',Java.array('java.lang.Class',[Java.use('java.lang.Object').class]));stateMethod.setAccessible(true);
    const state=stateMethod.invoke(null,Java.array('java.lang.Object',[a])),mask=state.getClass().getDeclaredField('pendingFilterMask');mask.setAccessible(true);mask.setInt(state,0);
    const extras=state.getClass().getDeclaredField('extra');extras.setAccessible(true);const oldExtras=extras.getInt(state);extras.setInt(state,7);
    for(const k of flags){const v=field(m,k),b=v.getClass().getDeclaredField('mValue');b.setAccessible(true);initial.push(b.getBoolean(v));b.setBoolean(v,true);}
    const had=P.contains('popularReplyPopup'),old=P.getBoolean('popularReplyPopup',false);P.edit().putBoolean('popularReplyPopup',true).commit();
    try{const anchor=Java.use('android.view.View').$new(app);anchor.setId(0x7e000002);const started=Date.now();if(!f.onLongClick(anchor))throw Error('native long-click not handled');console.log('Native reset callback duration: '+(Date.now()-started)+' ms');for(const k of flags)if(Java.cast(field(field(m,k),'mValue'),Java.use('java.lang.Boolean')).booleanValue())throw Error('still selected '+k);if(extras.getInt(state)!==0)throw Error('extra filters retained');console.log('PASS native long-click dispatch resets four native + three extra filters with popular popup enabled');}
    finally{extras.setInt(state,oldExtras);mask.setInt(state,0);let notify=null;for(let i=0;i<4;i++){const v=field(m,flags[i]),b=v.getClass().getDeclaredField('mValue');b.setAccessible(true);b.setBoolean(v,initial[i]);notify=v;}const e=P.edit();if(had)e.putBoolean('popularReplyPopup',old);else e.remove('popularReplyPopup');e.commit();if(notify)notify.getClass().getMethod('c',Java.array('java.lang.Class',[])).invoke(notify,Java.array('java.lang.Object',[]));console.log('PASS initial filter selection and popup preference restored');}
   }catch(e){console.log('FAIL '+e.stack);}
  }if(!found)console.log('FAIL no visible thread');
  }catch(error){console.log('FAIL fixture '+error.stack);}
  });
});
