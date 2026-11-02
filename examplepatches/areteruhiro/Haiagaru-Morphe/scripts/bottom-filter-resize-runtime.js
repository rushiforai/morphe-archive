// Actual native thread, pinned viewport and popup. Restore all preferences; no NG/DAT writes.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg)){reject(Error('verification app required'));return;}
 const E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),F=Java.use('app.morphe.extension.chmate.FilterPosition'),V=Java.use('android.view.View'),Group=Java.use('android.view.ViewGroup'),Controls=Java.use('app.morphe.extension.chmate.ExtraQuickFilters$BottomControls'),Motion=Java.use('android.view.MotionEvent'),Rect=Java.use('android.graphics.Rect');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),old=prefs.getAll(),keys=['persistentBottomQuickFilters','bottomQuickFilterPanel','bottomQuickFilterResizeHandle','bottomQuickFilterHeightDp'];
 let fragment,host,list,popup,checks=0,panel,originalMargin;
 function check(ok,msg){if(!ok)throw Error(msg);checks++;}
 function main(fn){return new Promise((yes,no)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{yes(fn());}catch(e){no(e);}})));}
 function pause(){return new Promise(yes=>setTimeout(yes,400));}
 function refresh(){E.updateOptions(host);}
 function current(){return Java.cast(host.getWindow().getDecorView().findViewWithTag('haiagaru.persistentBottomFilters'),Controls);}
 function handle(p){return Java.cast(p,Group).getChildAt(0);}
 function margin(){return Java.cast(list.getLayoutParams(),Java.use('android.view.ViewGroup$MarginLayoutParams')).bottomMargin.value;}
 function gesture(p,dy,cancel){const h=handle(p),t=Java.use('android.os.SystemClock').uptimeMillis();for(const [action,y] of [[0,10],[2,10+dy],[cancel?3:1,10+dy]]){const event=Motion.obtain(t,t+action*20,action,10,y,0);check(h.dispatchTouchEvent(event),'resize touch consumed '+action);event.recycle();}}
 (async()=>{try{
  await main(()=>{const f=E.class.getDeclaredField('OWNERS');f.setAccessible(true);const owners=Java.cast(f.get(null),Java.use('java.util.List'));for(let i=0;i<owners.size();i++){const o=Java.cast(owners.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!o)continue;const view=E.call(o,'getView',Java.array('java.lang.Class',[]),Java.array('java.lang.Object',[]));if(view&&Java.cast(view,V).isShown())fragment=Java.retain(o);}
   check(!!fragment,'visible native response fragment');host=Java.retain(Java.cast(E.call(fragment,'getActivity',Java.array('java.lang.Class',[]),Java.array('java.lang.Object',[])),Java.use('android.app.Activity')));list=Java.retain(F.findList(E.call(fragment,'getView',Java.array('java.lang.Class',[]),Java.array('java.lang.Object',[]))));
   prefs.edit().putBoolean('persistentBottomQuickFilters',false).remove('bottomQuickFilterHeightDp').remove('bottomQuickFilterResizeHandle').commit();refresh();});
  await pause();
  await main(()=>{originalMargin=margin();prefs.edit().putBoolean('persistentBottomQuickFilters',true).commit();refresh();});await pause();
  let natural;
  await main(()=>{panel=Java.retain(current());natural=panel.getHeight();check(natural>0&&handle(panel).isShown(),'resize handle initially visible');check(margin()===originalMargin+natural,'pinned panel reserves actual native viewport');gesture(panel,-100,false);});await pause();
  let saved,expanded;
  await main(()=>{expanded=current().getHeight();saved=prefs.getInt('bottomQuickFilterHeightDp',0);check(saved>0&&expanded>natural,'upward drag enlarges and saves panel');check(margin()===originalMargin+expanded,'reservation follows dragged height');prefs.edit().putBoolean('bottomQuickFilterResizeHandle',false).commit();refresh();});await pause();
  await main(()=>{panel=Java.retain(current());check(handle(panel).getVisibility()===8,'handle can be hidden');check(Math.abs(panel.getHeight()-expanded)<=1,'hidden handle retains chosen total height');prefs.edit().putBoolean('persistentBottomQuickFilters',false).commit();refresh();});await pause();
  await main(()=>{check(margin()===originalMargin,'OFF restores viewport');prefs.edit().putBoolean('persistentBottomQuickFilters',true).putBoolean('bottomQuickFilterResizeHandle',true).commit();refresh();});await pause();
  await main(()=>{panel=Java.retain(current());check(Math.abs(panel.getHeight()-expanded)<=1,'reopening retains saved height');gesture(panel,60,true);});await pause();
  await main(()=>{check(prefs.getInt('bottomQuickFilterHeightDp',0)===saved&&Math.abs(current().getHeight()-expanded)<=1,'cancel does not persist drag');gesture(current(),10000,false);});await pause();
  await main(()=>{panel=Java.retain(current());const scroll=Java.cast(Java.cast(panel,Group).getChildAt(1),Java.use('android.widget.ScrollView'));check(scroll.getChildAt(0).getHeight()>scroll.getHeight(),'short panel keeps all filters reachable by scrolling: panel='+panel.getHeight()+' scroll='+scroll.getHeight()+' grid='+scroll.getChildAt(0).getHeight()+' saved='+prefs.getInt('bottomQuickFilterHeightDp',0)+' live='+panel.liveHeight.value+' measured='+panel.getMeasuredHeight()+' lp='+panel.getLayoutParams().height.value);const a=Rect.$new(),b=Rect.$new();check(list.getGlobalVisibleRect(a)&&panel.getGlobalVisibleRect(b)&&a.bottom.value===b.top.value,'resized panel does not cover response list');prefs.edit().putBoolean('persistentBottomQuickFilters',false).putBoolean('bottomQuickFilterPanel',true).commit();refresh();check(E.open(fragment),'transient popup opens');});await pause();
  await new Promise(yes=>Java.perform(()=>Java.choose('android.widget.PopupWindow',{onMatch(p){if(p.isShowing()&&Controls.class.isInstance(p.getContentView()))popup=Java.retain(p);},onComplete:yes})));
  await main(()=>{check(!!popup,'real transient popup found');panel=Java.retain(Java.cast(popup.getContentView(),Controls));gesture(panel,-80,false);});await pause();
  await main(()=>{check(popup.isShowing()&&panel.getHeight()>Math.round(88*host.getResources().getDisplayMetrics().density.value),'popup height follows resize');check(prefs.getInt('bottomQuickFilterHeightDp',0)>88,'popup drag is saved');});
  resolve({version:pkg.slice(-3),checks});
 }catch(e){reject(Error(String(e.stack||e)));}finally{await main(()=>{if(popup&&popup.isShowing())popup.dismiss();const edit=prefs.edit();for(const key of keys){if(!old.containsKey(key))edit.remove(key);else if(key.endsWith('HeightDp'))edit.putInt(key,Java.cast(old.get(key),Java.use('java.lang.Integer')).intValue());else edit.putBoolean(key,Java.cast(old.get(key),Java.use('java.lang.Boolean')).booleanValue());}edit.commit();if(host)refresh();});}
 })();
}));}};
