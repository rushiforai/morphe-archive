// Existing cached native rows only; no direct DAT/read-count/network-state writes.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.settingsfix191')throw Error('191 verification only');
 Java.classFactory.loader=app.getClassLoader();
 const E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),F=Java.use('app.morphe.extension.chmate.FilterPosition'),LV=Java.use('android.widget.ListView'),Pos=Java.use('o.onAdExpired'),Rect=Java.use('android.graphics.Rect');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='persistentBottomQuickFilters',had=prefs.contains(key),old=prefs.getBoolean(key,false);
 const recovery=app.getSharedPreferences('haiagaru.test.pinned-native191',0);
 if(recovery.getBoolean('pending',false))throw Error('Previous test needs preference recovery before retry');
 let fragment,activity,list,adapter,first=-1,top=0,checks=0,failed=false,finished=false;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
 function restore(){const e=prefs.edit();if(had)e.putBoolean(key,old);else e.remove(key);if(!e.commit())throw Error('Preference restore failed');if(activity)E.updateOptions(activity);if(list&&first>=0)list.setSelectionFromTop(first,top);recovery.edit().clear().commit();finished=true;console.log('NATIVE_RESTORE191_SETTINGS_RESTORED');}
 function later(fn){setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(failed)return;try{fn();}catch(e){failed=true;console.log('FAIL '+e.stack);restore();}})),1600);}
 later(()=>{
  // Walk the extension's registered owners, without a stop-the-world heap scan.
  const owners=Java.cast(field(E,'OWNERS'),Java.use('java.util.List'));
  for(let i=0;i<owners.size();i++){const ref=Java.cast(owners.get(i),Java.use('java.lang.ref.WeakReference')),o=ref.get();if(!o)continue;const f=Java.cast(o,Java.use('o.pa')),v=f.getView(),r=Rect.$new();if(f.isResumed()&&v&&v.isAttachedToWindow()&&v.getGlobalVisibleRect(r)&&r.width()>200)fragment=Java.retain(f);}
  check(!!fragment,'resumed visible native fragment');activity=fragment.getActivity();list=Java.retain(Java.cast(F.findList(fragment.getView()),LV));adapter=Java.retain(Java.cast(list.getAdapter(),Java.use('o.m9ExternalSyntheticLambda1')));
  first=list.getFirstVisiblePosition();top=list.getChildCount()?list.getChildAt(0).getTop():0;
  if(!recovery.edit().putBoolean('pending',true).putBoolean('had',had).putBoolean('old',old).commit())throw Error('Cannot save test recovery');
  prefs.edit().putBoolean(key,true).commit();E.updateOptions(activity);
  later(()=>{
   const rows=Java.cast(field(adapter,'z'),Java.use('java.util.List'));let target=-1,number=0;
   for(let i=Math.floor(rows.size()/2);i<rows.size();i++){const row=Java.cast(rows.get(i),Java.use('o.r8lambdakfayx3RllpZib32UTPpeXfQjw'));if(row.j.value&&row.i.value===0){target=i;number=row.j.value.o.value;break;}}
   check(target>=0&&number>0,'existing cached response for native position restoration');
   // Same native method invoked by cached-DAT onMeasure restoration.
   Pos.$new(String(number),0,number).Tj_(list,number);
   later(()=>{
    const child=list.getChildAt(target-list.getFirstVisiblePosition());check(!!child,'native saved-position restore displays cached target');
    const found=activity.getWindow().getDecorView().findViewWithTag('haiagaru.persistentBottomFilters'),panel=found?Java.cast(found,Java.use('android.view.View')):null,r=Rect.$new(),pos=Java.array('int',[0,0]);check(!!panel&&panel.getGlobalVisibleRect(r),'fixed filter visible');
    list.getLocationOnScreen(pos);check(Math.abs(child.getBottom()-list.getHeight())<=2,'native restore uses reserved viewport bottom');check(pos[1]+child.getBottom()<=r.top.value+1,'restored response ends above filters');
    list.setSelection(list.getCount()-1);
    later(()=>{const last=list.getChildAt(list.getChildCount()-1),p=Java.array('int',[0,0]);last.getLocationOnScreen(p);check(list.getLastVisiblePosition()===list.getCount()-1,'native end/next footer reachable');check(p[1]+last.getHeight()<=r.top.value+1,'native end/next footer visible above filters');restore();console.log('NATIVE_RESTORE191_COMPLETE '+checks+' checks');});
   });
  });
 });
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(!finished){failed=true;console.log('FAIL bounded test timeout');restore();}})),22000);
});
