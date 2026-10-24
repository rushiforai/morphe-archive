setTimeout(()=>Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(?:settingsfix191|resumefix226|resumefix242)$/.test(app.getPackageName().toString()))throw Error('Verification package required');
 Java.openClassFile('/data/local/tmp/haiagaru-settings-history-tests-v3.dex').load();
 const status=Java.use('app.morphe.extension.chmate.DroppedThreadStatus');
 status.droppedUrl('https://greta.5ch.io/test/read.cgi/poverty/1999999999/');
 status.results.value.clear();status.boards.value.clear();
 const cache=app.getSharedPreferences('haiagaru-confirmed-dropped-threads',0),key='poverty/1792155688';
 const had=cache.contains(key),before=cache.getLong(key,0);
 cache.edit().putLong(key,Date.now()+3600000).commit();
 console.log('OFFLINE positive-confirmation cache fixture; not a live site test');
 try{console.log(Java.use('app.morphe.extension.chmate.DroppedThreadsAndroidTest').run(app));}
 catch(e){console.log('FAIL '+e);if(e.$h)console.log(Java.use('android.util.Log').getStackTraceString(e));}
 finally{const e=cache.edit();if(had)e.putLong(key,before);else e.remove(key);e.commit();status.results.value.clear();}
}),1500);
