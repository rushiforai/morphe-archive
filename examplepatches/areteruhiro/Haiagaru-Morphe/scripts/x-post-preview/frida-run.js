/* Source-level Android preview tests, isolated loader, no network or real browser launch. */
Java.perform(function () {
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(!/^jp\.co\.airfront\.android\.a2chMate\.haiagaru\.(?:responsearchive(191|226)|reporter(191|226|242))$/.test(String(app.getPackageName())))
        throw Error('Isolated preview test app required');
    const Loader=Java.use('dalvik.system.DexClassLoader');
    const loader=Loader.$new('/data/local/tmp/haiagaru-x-preview-cache-test.dex',String(app.getCodeCacheDir().getPath()),null,
        Java.use('java.lang.ClassLoader').getSystemClassLoader().getParent());
    const clazz=loader.loadClass('app.morphe.extension.chmate.PreviewTest');
    const method=clazz.getMethod('run',Java.array('java.lang.Class',[Java.use('android.content.Context').class]));
    Java.scheduleOnMainThread(function () {
        try {
            method.invoke(null,Java.array('java.lang.Object',[app]));
            const checks=clazz.getDeclaredField('checks');checks.setAccessible(true);
            console.log('PASS '+checks.getInt(null)+' Android preview checks (isolated loader; no actual post opened)');
            const retry=loader.loadClass('app.morphe.extension.chmate.RetryTest');
            retry.getMethod('start',Java.array('java.lang.Class',[Java.use('android.content.Context').class]))
                .invoke(null,Java.array('java.lang.Object',[app]));
            setTimeout(()=>Java.perform(()=>console.log(String(retry.getField('result').get(null)))),12500);
            Java.choose('jp.syoboi.a2chMate.activity.TabletHomeActivity',{
                onMatch:activity=>{
                    if(!activity.getWindow().getDecorView().isShown())return;
                    const position=loader.loadClass('app.morphe.extension.chmate.PositionTest');
                    position.getMethod('start',Java.array('java.lang.Class',[Java.use('android.app.Activity').class]))
                        .invoke(null,Java.array('java.lang.Object',[activity]));
                    setTimeout(()=>Java.perform(()=>console.log(String(position.getField('result').get(null)))),2300);
                    return 'stop';
                },onComplete:()=>{}
            });
        } catch(error) {
            console.log('FAIL '+error);
            if(error.cause) console.log('CAUSE '+error.cause);
            if(error.$h) console.log(Java.use('android.util.Log').getStackTraceString(error));
            throw error;
        }
    });
});
