Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();
 Java.openClassFile('/data/local/tmp/haiagaru-native-unread-tests.dex').load();
 Java.scheduleOnMainThread(()=>{try{console.log(Java.use('app.morphe.extension.chmate.HiddenNgUnreadNativeRowTest').run(app));}catch(e){console.log('FAIL '+e.stack);if(e.cause)console.log(Java.use('android.util.Log').getStackTraceString(e.cause));}});
});
