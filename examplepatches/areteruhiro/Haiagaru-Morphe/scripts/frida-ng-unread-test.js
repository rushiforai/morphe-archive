Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();
 const pkg=String(app.getPackageName());if(!['.settingsfix191','.resumefix226','.resumefix242'].some(s=>pkg.endsWith(s)))throw Error('Test package required');
 Java.openClassFile('/data/local/tmp/haiagaru-ng-unread-tests.dex').load();
 console.log(Java.use('app.morphe.extension.chmate.HiddenNgUnreadAndroidTest').run(app));
});
