// Actual cached response list. Restores filter preferences and original scroll.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Verification only');
 Java.classFactory.loader=app.getClassLoader();
 const E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),F=Java.use('app.morphe.extension.chmate.FilterPosition'),P=Java.use('app.morphe.extension.chmate.FilterPosition$Pending'),List=Java.use('java.util.List'),RV=Java.use('androidx.recyclerview.widget.RecyclerView'),prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='keepQuickFilterPosition',had=prefs.contains(key),old=prefs.getBoolean(key,false);
 let fragment,list,adapter,panel,button,original,top=0,anchor=-1,target,targetTop=0,n=0,failed=false;
 function field(o,name){const f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(o);}
 function check(v,s){if(!v)throw Error(s);console.log('PASS '+s);n++;}
 function restore(){try{if(button&&button.isChecked())button.performClick();if(anchor>=0)F.jumpToResponse.overload('java.lang.Object','int','int').call(F,fragment,anchor,top);}finally{const e=prefs.edit();if(had)e.putBoolean(key,old);else e.remove(key);e.commit();console.log('BOTTOM_FILTER_POSITION_RESTORED');}}
 function later(fn){setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(failed)return;try{fn();}catch(e){failed=true;console.log('FAIL '+e.stack);restore();}})),1200);}
 function capture(){return P.$new(list,true);}
 later(()=>{
  const ownersField=E.class.getDeclaredField('OWNERS');ownersField.setAccessible(true);const owners=Java.cast(ownersField.get(null),List);for(let i=0;i<owners.size();i++){const o=Java.cast(owners.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!o)continue;const f=Java.cast(o,Java.use('jp.syoboi.a2chMate.ui.reslist.ResListFragment'));if(f.isResumed()&&f.getView()&&f.getView().isShown())fragment=Java.retain(f);}
  check(!!fragment,'resumed native thread');list=Java.retain(Java.cast(F.findList(fragment.getView()),RV));adapter=Java.retain(Java.cast(list.getAdapter(),Java.use('o.zzacr')));
  original=Java.retain(capture());const initial=Java.cast(field(original,'before'),List),idx=Java.cast(field(original,'anchor'),Java.use('java.lang.Integer')).intValue();top=Java.cast(field(original,'offset'),Java.use('java.lang.Integer')).intValue();if(idx>=0){const post=initial.get(idx);if(post)anchor=Java.cast(post,Java.use('o.KeJ11')).o.value;}
  const selected=E.selected(adapter);check(!selected[1],'link filter initially clear');prefs.edit().putBoolean(key,false).commit();
  const R=Java.registerClass({name:'app.morphe.extension.chmate.BottomPositionClose',implements:[Java.use('java.lang.Runnable')],methods:{run(){}}});panel=Java.retain(Java.use('app.morphe.extension.chmate.ExtraQuickFilters$BottomControls').$new(fragment.getActivity(),adapter,R.$new()));button=Java.retain(Java.cast(Java.cast(panel,Java.use('android.view.ViewGroup')).getChildAt(1),Java.use('android.widget.ToggleButton')));
  button.performClick();later(()=>{
   check(button.isChecked(),'bottom link filter enabled');list.scrollToPosition(Math.max(2,Math.floor(adapter.getItemCount()/2)));
   later(()=>{const saved=capture(),before=Java.cast(field(saved,'before'),List),index=Java.cast(field(saved,'anchor'),Java.use('java.lang.Integer')).intValue();check(index>0&&before.get(index)!==null,'filtered non-first response anchor captured');target=Java.retain(before.get(index));targetTop=Java.cast(field(saved,'offset'),Java.use('java.lang.Integer')).intValue();button.performClick();
    later(()=>{check(!button.isChecked(),'bottom filter disabled');const a=capture(),after=Java.cast(field(a,'before'),List),pos=Java.cast(field(a,'anchor'),Java.use('java.lang.Integer')).intValue(),offset=Java.cast(field(a,'offset'),Java.use('java.lang.Integer')).intValue();console.log('POSITION target='+Java.cast(target,Java.use('o.KeJ11')).o.value+' current='+(pos>=0&&after.get(pos)?Java.cast(after.get(pos),Java.use('o.KeJ11')).o.value:-1)+' offset='+offset+' expected='+targetTop+' index='+pos);check(pos>=0&&target.equals(after.get(pos)),'clearing bottom filter retains same response with optional setting OFF');check(Math.abs(offset-targetTop)<=1,'response pixel offset retained');restore();console.log('BOTTOM_FILTER_POSITION_COMPLETE '+n+' checks');});
   });
  });
 });
});
