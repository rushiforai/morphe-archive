// Current source in an isolated loader: never accidentally test an older installed helper.
Java.perform(function(){
    const thread=Java.use('android.app.ActivityThread'),app=thread.currentApplication();
    if(!String(app.getPackageName()).match(/\.haiagaru\.(resumefix226|resumefix242|full191)$/))throw Error('Isolated regression app required');
    const loader=Java.use('dalvik.system.DexClassLoader').$new('/data/local/tmp/haiagaru-position-fixture.dex',String(app.getCodeCacheDir().getAbsolutePath()),null,app.getClassLoader().getParent());
    const factory=Java.ClassFactory.get(loader),test=factory.use('app.morphe.extension.chmate.PositionTest');
    Java.scheduleOnMainThread(function(){
        const records=thread.currentActivityThread().mActivities.value.values().toArray();
        const recordType=Java.use('android.app.ActivityThread$ActivityClientRecord');
        for(const record of records){const activity=Java.cast(record,recordType).activity.value;
            if(activity)console.log('ACTIVITY '+activity.getClass().getName()+' focus='+activity.hasWindowFocus()+' finishing='+activity.isFinishing());
            if(activity&&!activity.isFinishing()&&activity.hasWindowFocus()){test.start(activity);console.log('POSITION_FIXTURE_STARTED');return;}}
        throw Error('Foreground regression activity required');
    });
    let tries=0;
    const timer=setInterval(function(){Java.perform(function(){
        const result=String(test.result.value);if(result.startsWith('PASS')||result.startsWith('FAIL')||++tries>=20){console.log('POSITION_RESULT '+result);clearInterval(timer);}
    });},1000);
});
