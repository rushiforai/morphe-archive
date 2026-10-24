// Actual native response popup with cached responses. Settings restored; popup dismissed.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!String(app.getPackageName()).endsWith('.haiagaru.resumefix226'))throw Error('Verification app required');
 const E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),F=Java.use('app.morphe.extension.chmate.FilterPosition'),H=Java.use('app.morphe.extension.chmate.Haiagaru');
 const V=Java.use('android.view.View'),LV=Java.use('android.widget.ListView'),VG=Java.use('android.view.ViewGroup');
 const prefs=H.preferences(app),key='persistentBottomQuickFilters',had=prefs.contains(key),saved=prefs.getBoolean(key,false);
 let fragment,activity,root,mainList,popup,popupList,manager,originalPadding,checks=0,failed=false;
 function field(o,n){for(let c=o.getClass();c;c=c.getSuperclass())try{const f=c.getDeclaredField(n);f.setAccessible(true);return f.get(o);}catch(e){}throw Error(n);}
 function check(ok,s){if(!ok)throw Error(s);checks++;console.log('PASS '+s);}
 function cleanup(){try{if(manager&&popup)manager.a.overload().call(manager);}catch(e){}const edit=prefs.edit();if(had)edit.putBoolean(key,saved);else edit.remove(key);edit.commit();if(activity)E.updateOptions(activity);console.log('PINNED_POPUP_STATE_RESTORED');}
 function later(fn,ms){setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(failed)return;try{fn();}catch(e){failed=true;console.log('FAIL '+e.stack);cleanup();}})),ms||700);}
 later(()=>{
 const ff=F.class.getDeclaredField('fragments');ff.setAccessible(true);const refs=Java.cast(ff.get(null),Java.use('java.util.List'));
 for(let i=0;i<refs.size();i++){const f=Java.cast(refs.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!f)continue;const typed=Java.cast(f,Java.use('jp.syoboi.a2chMate.ui.reslist.ResListFragment')),r=typed.getView();if(r&&r.isShown()){fragment=Java.retain(typed);root=Java.retain(r);}}
 check(!!fragment,'native visible response fragment');activity=fragment.getActivity();mainList=F.findList(root);prefs.edit().putBoolean(key,true).commit();E.updateOptions(activity);
 later(()=>{
 const found=activity.getWindow().getDecorView().findViewWithTag('haiagaru.persistentBottomFilters'),panel=found?Java.cast(found,V):null;check(!!panel&&panel.isShown(),'fixed filter visible');
 manager=Java.cast(field(fragment,'ac'),Java.use('o.setInnerBorderWidth'));check(Java.cast(field(manager,'e'),Java.use('java.util.List')).size()===0,'no user popup is replaced');
 const adapter=Java.cast(E.adapter(fragment),Java.use('o.listener')),posts=Java.cast(field(adapter,'J'),Java.use('o.AndroidSocketAdapterCompanionfactory1'));
 const anchor=Java.use('o.setMaskColor').$new();anchor.e.overload('android.view.View').call(anchor,mainList);
 const data=Java.use('o.setInnerBorderColor').$new(posts,anchor,'Haiagaru popup regression',0,-1,null,false);
 popup=Java.retain(manager.b.overload('o.listener','o.setInnerBorderColor','int','boolean','boolean').call(manager,adapter,data,0,false,false));
 popupList=Java.retain(Java.cast(field(popup,'a'),LV));originalPadding=popupList.getPaddingBottom();
 later(()=>{
  const filter=Java.cast(activity.getWindow().getDecorView().findViewWithTag('haiagaru.persistentBottomFilters'),V),r=Java.use('android.graphics.Rect').$new(),p=Java.use('android.graphics.Rect').$new();
  popupList.getGlobalVisibleRect(r);filter.getGlobalVisibleRect(p);console.log('BOUNDS popup='+r+' filter='+p+' padding='+popupList.getPaddingBottom()+' original='+originalPadding);
  check(r.bottom.value>p.top.value,'real popup overlaps fixed filter');check(popupList.getPaddingBottom()>originalPadding,'popup reserves overlap space');
  const count=popupList.getAdapter().getCount();popupList.setSelection(count-1);
  later(()=>{const last=popupList.getChildAt(popupList.getChildCount()-1),pos=Java.array('int',[0,0]);last.getLocationOnScreen(pos);
   check(popupList.getLastVisiblePosition()===count-1,'last popup response reachable');check(pos[1]+last.getHeight()<=p.top.value+2,'last response bottom is above filter');
   const padding=popupList.getPaddingBottom();E.updateOptions(activity);later(()=>{
    check(popupList.getPaddingBottom()===padding,'re-layout does not accumulate popup padding');console.log('PINNED_POPUP_SCREENSHOT_READY');
    later(()=>{prefs.edit().putBoolean(key,false).commit();E.updateOptions(activity);later(()=>{
     check(popupList.getPaddingBottom()===originalPadding,'OFF restores native popup padding');console.log('PINNED_POPUP_COMPLETE '+checks+' checks');cleanup();
    });},20000);
   });
  });
 });
 });
 });
});
