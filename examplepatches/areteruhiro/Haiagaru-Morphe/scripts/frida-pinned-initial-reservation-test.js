// Checks reservation synchronously before first layout and on retained-view reattachment.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg))throw Error('Verification app only');
 Java.classFactory.loader=app.getClassLoader();
 const E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),F=Java.use('app.morphe.extension.chmate.FilterPosition'),V=Java.use('android.view.View'),P=Java.use('app.morphe.extension.chmate.ExtraQuickFilters$PinnedPanel');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='persistentBottomQuickFilters',had=prefs.contains(key),old=prefs.getBoolean(key,false);
 let fragment,activity,list,root,baseline,binding,panel,checks=0,failed=false;
 const LV=Java.use('android.widget.ListView'),RV=Java.use('androidx.recyclerview.widget.RecyclerView');let first=-1,top=0;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function margin(){return Java.cast(list.getLayoutParams(),Java.use('android.view.ViewGroup$MarginLayoutParams')).bottomMargin.value;}
 function restore(){if(first>=0&&LV.class.isInstance(list))Java.cast(list,LV).setSelectionFromTop(first,top);const edit=prefs.edit();if(had)edit.putBoolean(key,old);else edit.remove(key);edit.commit();if(activity)E.updateOptions(activity);console.log('INITIAL_RESERVATION_PREF_RESTORED');}
 function later(fn,delay){setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(failed)return;try{fn();}catch(e){failed=true;console.log('FAIL '+e.stack);restore();}})),delay||1200);}
 function laidOut(next,attempt){later(()=>{const found=activity.getWindow().getDecorView().findViewWithTag('haiagaru.persistentBottomFilters');if(found)panel=Java.retain(Java.cast(found,V));const a=Java.use('android.graphics.Rect').$new(),b=Java.use('android.graphics.Rect').$new();if(panel&&list.getGlobalVisibleRect(a)&&panel.getGlobalVisibleRect(b)){next(a,b);return;}console.log('LAYOUT_WAIT '+attempt+' listShown='+list.isShown()+' listHeight='+list.getHeight()+' panelHeight='+(panel?panel.getHeight():-1)+' focus='+activity.hasWindowFocus());if(attempt>=8)throw Error('both views not laid out after bounded reattach wait');laidOut(next,attempt+1);},1000);}
 Java.choose(pkg.endsWith('191')?'o.pa':'jp.syoboi.a2chMate.ui.reslist.ResListFragment',{onMatch(f){const view=f.getView(),rect=Java.use('android.graphics.Rect').$new();if(f.isResumed()&&view&&view.isAttachedToWindow()&&view.getGlobalVisibleRect(rect)&&rect.width()>200)fragment=Java.retain(f);},onComplete(){later(()=>{
  check(!!fragment,'native response fragment');activity=fragment.getActivity();root=fragment.getView();list=Java.retain(F.findList(root));prefs.edit().putBoolean(key,false).commit();E.updateOptions(activity);
  later(()=>{baseline=margin();prefs.edit().putBoolean(key,true).commit();E.updateOptions(activity);
   const found=activity.getWindow().getDecorView().findViewWithTag('haiagaru.persistentBottomFilters');check(!!found,'panel created without waiting for global layout');panel=Java.retain(Java.cast(found,V));check(margin()>baseline,'reservation is present synchronously before first measure');
   later(()=>{const field=E.class.getDeclaredField('PINNED');field.setAccessible(true);const map=Java.cast(field.get(null),Java.use('java.util.Map'));binding=Java.retain(Java.cast(Java.cast(map.get(root),Java.use('java.lang.ref.WeakReference')).get(),P));
    const fullMargin=margin();binding.onViewDetachedFromWindow(root);check(margin()===baseline,'detach restores original viewport');
    binding.onViewAttachedToWindow(root);check(margin()===fullMargin,'reattach reserves space before native measure/restore');
    laidOut((a,b)=>{check(true,'both views laid out after reattach');check(a.bottom.value<=b.top.value,'native viewport excludes fixed filters');
     E.updateOptions(activity);later(()=>{check(margin()===fullMargin,'no reservation accumulation');
      if(!LV.class.isInstance(list)){restore();console.log('PINNED_INITIAL_RESERVATION_COMPLETE '+checks+' checks');return;}
      const lv=Java.cast(list,LV);first=lv.getFirstVisiblePosition();top=lv.getChildCount()>0?lv.getChildAt(0).getTop():0;lv.setSelection(lv.getCount()-1);
      later(()=>{const last=lv.getChildAt(lv.getChildCount()-1),pos=Java.array('int',[0,0]),filter=Java.use('android.graphics.Rect').$new();last.getLocationOnScreen(pos);panel.getGlobalVisibleRect(filter);check(lv.getLastVisiblePosition()===lv.getCount()-1,'native footer last row reachable');check(pos[1]+last.getHeight()<=filter.top.value+1,'native end/next footer not covered by fixed filters');restore();console.log('PINNED_INITIAL_RESERVATION_COMPLETE '+checks+' checks');});
     });
    },0);
   });
  });
 });}});
});
