// Local verification packages only. Restore preferences and close created tabs.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();
 const T=Java.use('app.morphe.extension.chmate.NativeToolTabs'),H=Java.use('app.morphe.extension.chmate.Haiagaru');
 const A=Java.use('java.lang.reflect.Array'),Fragment=Java.use('androidx.fragment.app.Fragment');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
 const had=prefs.contains('nativeToolTabs'),original=prefs.getBoolean('nativeToolTabs',false);
 const version=String(app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName.value);
 let host,created,checks=0,index=0,failed=false;
 const cases=[];[true,false].forEach(home=>['settings','eddi','search','checker','hissi','wacchoi'].forEach(tool=>cases.push({home,tool})));
 function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
 function check(ok,message){if(!ok)throw Error(message);checks++;console.log('PASS '+message);}
 function restore(){const e=prefs.edit();if(had)e.putBoolean('nativeToolTabs',original);else e.remove('nativeToolTabs');e.commit();}
 function main(fn){Java.perform(()=>Java.scheduleOnMainThread(()=>{if(failed)return;try{fn();}catch(e){failed=true;if(created)T.closeCurrentTab(host,created);restore();console.log('FAIL '+e.stack);}}));}
 function next(){main(()=>{
  if(index===cases.length){restore();console.log('PANE_CHOICE_COMPLETE checks='+checks+' preferences restored');return;}
  const c=cases[index];prefs.edit().putBoolean('nativeToolTabs',c.home).commit();
  check(T.openManual(host,c.tool),'open '+c.tool+' '+(c.home?'HOME':'thread'));
  setTimeout(()=>Java.perform(()=>{
   let found;
   Java.choose('app.morphe.extension.chmate.NativeToolFragment',{onMatch(f){const base=Java.cast(f,Fragment);const args=base.getArguments();if(args&&String(args.getString('_data'))==='haiagaru-tool://'+c.tool+'?pane='+(c.home?'home':'thread')&&base.isAdded())found=Java.retain(f);},onComplete(){main(()=>{
    check(!!found,'fragment created in requested pane');created=found;
    let expected;
    if(version==='0.8.10.191 dev')expected=field(host,c.home?'k':'I');
    else expected=A.get(field(host,version==='0.8.10.226 dev'?'r':'w'),c.home?0:1);
    const methods=host.getClass().getDeclaredMethods();let owner;
    for(let i=0;i<methods.length;i++){const m=methods[i],p=m.getParameterTypes();if(p.length===1&&String(m.getReturnType().getName())===String(expected.getClass().getName())&&String(p[0].getName())==='androidx.fragment.app.Fragment'){m.setAccessible(true);owner=m.invoke(host,Java.array('java.lang.Object',[found]));break;}}
    check(owner&&owner.equals(expected),'native owning pane matches '+(c.home?'HOME':'thread'));
    check(T.openManual(host,c.tool),'reopening existing tab handled');
    check(T.closeCurrentTab(host,found),'native close works');created=null;index++;setTimeout(next,700);
   });}});
  }),2500);
 });}
 main(()=>{host=Java.retain(T.manualHost(H.toolbarActivity(null)));check(!!host,'tablet host available');next();});
});
