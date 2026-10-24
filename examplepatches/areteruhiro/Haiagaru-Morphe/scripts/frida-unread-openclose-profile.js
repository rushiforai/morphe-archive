// Profile real open/close activity. Restore the feature preference on detach/timer.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();
 const H=Java.use('app.morphe.extension.chmate.HiddenNgUnread'),Clock=Java.use('android.os.SystemClock');
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='excludeHiddenNgUnread',had=p.contains(key),before=p.getBoolean(key,false);
 const totals={},methods=[];
 ['begin','bind242','modern','total','totalFromStoredRead','rowKey','responseUrl'].forEach(name=>{
  H[name].overloads.forEach(method=>{const item={calls:0,ms:0,max:0};totals[name]=item;methods.push(method);
   method.implementation=function(){const start=Number(Clock.elapsedRealtimeNanos());try{return method.apply(this,arguments);}finally{const ms=(Number(Clock.elapsedRealtimeNanos())-start)/1e6;item.calls++;item.ms+=ms;item.max=Math.max(item.max,ms);}};
  });
 });
 p.edit().putBoolean(key,true).commit();console.log('OPEN_CLOSE_PROFILE_READY');
 setTimeout(()=>{Java.perform(()=>{methods.forEach(m=>m.implementation=null);const e=p.edit();if(had)e.putBoolean(key,before);else e.remove(key);e.commit();console.log('OPEN_CLOSE_PROFILE '+JSON.stringify(totals));});},35000);
});
