// Read-only rendering counters in the existing verification package.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 verification app required');
 Java.classFactory.loader=app.getClassLoader();
 const E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),FP=Java.use('app.morphe.extension.chmate.FilterPosition');
 let fragment,list,pads=0,layouts=0,drawables=0,binds=0;
 const IV=Java.use('android.widget.ImageView'),setter=IV.setImageDrawable.overload('android.graphics.drawable.Drawable');
 setter.implementation=function(d){if(this.isShown())drawables++;return setter.call(this,d);};
 const P=Java.use('app.morphe.extension.chmate.ExtraQuickFilters$PinnedPanel');
 P.layout.implementation=function(){layouts++;return this.layout();};
 const A=Java.use('o.zzacr'),bind=A.onBindViewHolder.overloads[0];
 bind.implementation=function(holder,pos){binds++;return bind.call(this,holder,pos);};
 const View=Java.use('android.view.View'),padding=View.setPadding.overload('int','int','int','int');
 padding.implementation=function(l,t,r,b){if(list&&this.equals(list)){pads++;console.log('PADDING '+this.getPaddingBottom()+' -> '+b+' '+Java.use('android.util.Log').getStackTraceString(Java.use('java.lang.Exception').$new()));}return padding.call(this,l,t,r,b);};
 Java.choose('jp.syoboi.a2chMate.ui.reslist.ResListFragment',{onMatch(f){const root=f.getView();if(f.isResumed()&&root&&root.isShown()){fragment=Java.retain(f);}},onComplete(){Java.scheduleOnMainThread(()=>{if(!fragment){console.log('NO_FRAGMENT');return;}list=Java.retain(FP.findList(fragment.getView()));console.log('LIST '+list.getClass().getName()+' padding='+list.getPaddingBottom());console.log('MANAGER '+list.getClass().getMethod('getLayoutManager',Java.array('java.lang.Class',[])).invoke(list,Java.array('java.lang.Object',[])));});}});
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),had=prefs.contains('persistentBottomQuickFilters'),old=prefs.getBoolean('persistentBottomQuickFilters',false);
 function toggle(value){Java.perform(()=>Java.scheduleOnMainThread(()=>{prefs.edit().putBoolean('persistentBottomQuickFilters',value).commit();if(fragment)E.updateOptions(fragment.getActivity());}));}
 setTimeout(()=>toggle(true),2000);
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{const e=prefs.edit();if(had)e.putBoolean('persistentBottomQuickFilters',old);else e.remove('persistentBottomQuickFilters');e.commit();if(fragment)E.updateOptions(fragment.getActivity());})),18000);
 setInterval(()=>{console.log('COUNTS layouts='+layouts+' padding='+pads+' drawable='+drawables+' binds='+binds);},3000);
});
