// Exercises the reset handler used by the actual dialog in reporter builds and restores preferences.
Java.perform(function(){
  const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
  if(!/\.reporter(191|226|242)$/.test(pkg))throw Error('Reporter verification build only');
  const N=Java.use('app.morphe.extension.chmate.NativeImagePaging'),P=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
  const R=Java.use('app.morphe.extension.chmate.ThreadRefreshOptions');
  const keys=['imagePagingGestures','imagePagingNext','imagePagingPrevious','imagePagingDisabled'];
  const saved=keys.map(k=>({key:k,had:P.contains(k),value:k==='imagePagingNext'||k==='imagePagingPrevious'?P.getInt(k,0):P.getBoolean(k,false)}));
  const refreshHad=P.contains(R.KEY.value),refreshOld=P.getBoolean(R.KEY.value,false);
  let done=false;
  function check(ok,msg){if(!ok)throw Error(msg);console.log('PASS '+msg);}
  function restore(){if(done)return;done=true;const e=P.edit();saved.forEach(x=>{if(!x.had)e.remove(x.key);else if(x.key==='imagePagingNext'||x.key==='imagePagingPrevious')e.putInt(x.key,x.value);else e.putBoolean(x.key,x.value);});if(refreshHad)e.putBoolean(R.KEY.value,refreshOld);else e.remove(R.KEY.value);e.commit();console.log('IMAGE_PAGING_PREFS_RESTORED');}
  try{
    P.edit().remove(R.KEY.value).commit();
    check(!R.skipConditionalHeaders(),'normal thread refresh validators are default after search-route slowdown fix');
    P.edit().putBoolean(R.KEY.value,true).commit();
    check(R.skipConditionalHeaders(),'conditional-validator option can still be enabled');
    P.edit().remove(R.KEY.value).commit();
    P.edit().putBoolean('imagePagingGestures',true).putInt('imagePagingNext',4).putInt('imagePagingPrevious',3).remove('imagePagingDisabled').commit();
    check(N.enabled(app),'custom gesture switch begins ON');
    N.resetDirections(P);
    check(P.getBoolean('imagePagingGestures',false),'reset persists enabled state');
    check(!P.contains('imagePagingNext')&&!P.contains('imagePagingPrevious'),'reset clears direction overrides');
    check(!P.getBoolean('imagePagingDisabled',false),'reset clears legacy disable state');
    check(N.enabled(app),'reopened settings resolve to enabled after reset');
    console.log('IMAGE_PAGING_RESET_COMPLETE');
  }catch(e){console.log('FAIL '+e.stack);}finally{restore();}
});
