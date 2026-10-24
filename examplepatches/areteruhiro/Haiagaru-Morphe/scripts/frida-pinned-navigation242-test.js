// Cached responses only. Checks native navigation against the real reserved viewport.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!String(app.getPackageName()).endsWith('.haiagaru.resumefix242'))throw Error('242 verification only');
 Java.classFactory.loader=app.getClassLoader();
 const F=Java.use('app.morphe.extension.chmate.FilterPosition'),E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),VG=Java.use('android.view.ViewGroup'),RV=Java.use('androidx.recyclerview.widget.RecyclerView'),V=Java.use('android.view.View');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='persistentBottomQuickFilters',had=prefs.contains(key),old=prefs.getBoolean(key,false);
 let fragment,list,adapter,activity,anchor=-1,offset=0,checks=0,failed=false;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function restore(){try{if(anchor>=0){const manager=Java.cast(list.getLayoutManager(),Java.use('androidx.recyclerview.widget.LinearLayoutManager'));list.scrollToPosition(anchor);const f=Java.use('androidx.recyclerview.widget.LinearLayoutManager').class.getDeclaredField('k');f.setAccessible(true);f.setInt(manager,offset);list.requestLayout();}}finally{const edit=prefs.edit();if(had)edit.putBoolean(key,old);else edit.remove(key);edit.commit();if(activity)E.updateOptions(activity);console.log('NAVIGATION_SETTINGS_RESTORED');}}
 function later(fn,ms){setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(failed)return;try{fn();}catch(e){failed=true;console.log('FAIL '+e.stack);restore();}})),ms||1000);}
 Java.choose('jp.syoboi.a2chMate.ui.reslist.ResListFragment',{onMatch(f){if(f.getView()&&f.getView().isShown())fragment=Java.retain(f);},onComplete(){later(()=>{
  check(!!fragment,'visible native fragment');activity=fragment.getActivity();list=Java.retain(Java.cast(F.findList(fragment.getView()),RV));adapter=Java.retain(Java.cast(E.adapter(fragment),Java.use('o.zzacr')));
  const g=Java.cast(list,VG);for(let i=0;i<g.getChildCount();i++){const child=g.getChildAt(i);if(child.getBottom()>list.getPaddingTop()){anchor=list.getChildAdapterPosition(child);offset=child.getTop()-list.getPaddingTop();break;}}
  prefs.edit().putBoolean(key,true).commit();E.updateOptions(activity);
  later(()=>{const panel=Java.cast(activity.getWindow().getDecorView().findViewWithTag('haiagaru.persistentBottomFilters'),V),bounds=Java.use('android.graphics.Rect').$new();panel.getGlobalVisibleRect(bounds);
   const pos=Java.array('int',[0,0]);list.getLocationOnScreen(pos);check(pos[1]+list.getHeight()<=bounds.top.value,'native viewport ends before filter overlay');
   const target=150;check(adapter.e(target)>=0,'cached target response exists');Java.use('o.zzabe').b.overload('jp.syoboi.a2chMate.ui.reslist.ResListFragment','int').call(Java.use('o.zzabe'),fragment,target);
   later(()=>{const holder=list.findViewHolderForAdapterPosition(adapter.e(target));check(!!holder,'native navigation displays target response');const row=holder.itemView.value;row.getLocationOnScreen(pos);check(pos[1]>=bounds.top.value-list.getHeight()&&pos[1]<bounds.top.value,'native target is inside unobscured viewport');
    list.scrollToPosition(adapter.getItemCount()-1);later(()=>{const last=list.findViewHolderForAdapterPosition(adapter.getItemCount()-1);check(!!last,'last native row reachable');const v=last.itemView.value;v.getLocationOnScreen(pos);check(pos[1]+v.getHeight()<=bounds.top.value+1,'last native row is not hidden behind filters');console.log('PINNED_NAVIGATION242_COMPLETE '+checks+' checks');restore();});
   });
  });
 });}});
});
