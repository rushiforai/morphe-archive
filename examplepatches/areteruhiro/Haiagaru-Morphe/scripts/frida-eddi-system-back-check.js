Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Verification only');
    Java.classFactory.loader=app.getClassLoader();
    Java.scheduleOnMainThread(function(){
        const a=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
        const K=Java.use('android.view.KeyEvent');
        console.log('HOST '+a.getClass().getName());
        console.log('BACK_DOWN '+a.dispatchKeyEvent(K.$new(0,4)));
        console.log('BACK_UP '+a.dispatchKeyEvent(K.$new(1,4)));
    });
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
        let shown=0;
        const Tabs=Java.use('app.morphe.extension.chmate.NativeToolTabs');
        Java.choose('app.morphe.extension.chmate.NativeToolFragment',{
            onMatch(f){if(f.frame.value&&f.frame.value.isShown()&&Tabs.isArchiveFragment(f))shown++;},
            onComplete(){console.log(shown===0?'PASS archive closed after BACK':'FAIL archive still shown');}
        });
        const a=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
        console.log('HOST_ALIVE '+(!a.isFinishing()&&!a.isDestroyed()));
    })),800);
});
