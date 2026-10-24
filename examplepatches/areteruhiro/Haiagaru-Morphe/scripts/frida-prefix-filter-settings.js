// Isolated verification only; restores preferences and never saves an NG item.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 let checks=0;const old=[];let opened=null;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function put(p,k,v){old.push([p,k,p.contains(k),p.contains(k)?p.getBoolean(k,false):false]);p.edit().putBoolean(k,v).commit();}
 function field(o,k){const f=o.getClass().getDeclaredField(k);f.setAccessible(true);return f.get(o);}
 function find(v,cls){if(Java.use(cls).class.isInstance(v))return v;if(Java.use('android.view.ViewGroup').class.isInstance(v)){const g=Java.cast(v,Java.use('android.view.ViewGroup'));for(let i=0;i<g.getChildCount();i++){const r=find(g.getChildAt(i),cls);if(r)return r;}}return null;}
 function tokenInput(v){if(Java.use('android.widget.EditText').class.isInstance(v)&&String(Java.cast(v,Java.use('android.widget.EditText')).getText())==='ab12-')return true;if(Java.use('android.view.ViewGroup').class.isInstance(v)){const g=Java.cast(v,Java.use('android.view.ViewGroup'));for(let i=0;i<g.getChildCount();i++)if(tokenInput(g.getChildAt(i)))return true;}return false;}
 Java.scheduleOnMainThread(()=>{try{
  const Ng=Java.use('app.morphe.extension.chmate.WacchoiSuffixNg');
  check(String(Ng.prefix('(ﾜｯﾁｮｲ ab12-Cd34)'))==='ab12','upper half extracted from name');
  check(Ng.prefix('quotedxab12-Cd34')===null,'longer prefix rejected');
  check(Ng.prefix('no slip')===null,'missing Wacchoi rejected');
  const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),Q=Java.use('app.morphe.extension.chmate.QuickFilterOptions');
  put(prefs,'quickFilterExtras',true);put(prefs,'quickFilterAA',false);put(prefs,'quickFilterMine',true);put(prefs,'quickFilterReplies',false);
  check(!Q.visible(4)&&Q.visible(5)&&!Q.visible(6),'extra filters independently enabled');
  check(Q.visible(0)&&Q.visible(1)&&Q.visible(2)&&Q.visible(3),'native filters retained');
  check(!Q.visible(-1)&&!Q.visible(7),'invalid filter indices rejected');
  const Extras=Java.use('app.morphe.extension.chmate.ExtraQuickFilters');
  const method=Extras.class.getDeclaredMethod('visibleIndices',Java.array('java.lang.Class',[]));method.setAccessible(true);
  const indices=method.invoke(null,Java.array('java.lang.Object',[]));
  const Array=Java.use('java.lang.reflect.Array');
  check(Array.getLength(indices)===5&&Array.getInt(indices,4)===5,'dialog indices preserve own-post filter');
  const Dialog=Java.use('app.morphe.extension.chmate.HaiagaruDialog'),show=Dialog.show.overload();
  show.implementation=function(){show.call(this);const root=field(field(this,'spec'),'view');if(root&&tokenInput(root)){opened=Java.retain(this);check(find(root,'app.morphe.extension.chmate.NgBoardScopePicker')!==null,'upper NG contains board scope');}};
  const activity=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
  check(activity!==null,'resumed activity available for upper NG');
  try{Ng.confirmPrefix(activity,'ab12-Cd34','android');}finally{show.implementation=null;}
 }catch(e){console.log('FAIL '+e.stack);}finally{for(let i=old.length-1;i>=0;i--){const [p,k,had,value]=old[i],e=p.edit();if(had)e.putBoolean(k,value);else e.remove(k);e.commit();}}});
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
  try{check(opened!==null,'upper NG opens with prefix token; no registration saved');if(opened)opened.dismiss();console.log('PASS '+checks+' prefix/filter checks');}catch(e){console.log('FAIL '+e.stack);}
 })),6000);
});
