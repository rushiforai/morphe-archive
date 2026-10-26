// Redirect preference access to isolated fixture stores for this synchronous reset check.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Verification package required');
    Java.classFactory.loader=app.getClassLoader();
    const C=Java.use('android.app.ContextImpl');
    const method=C.getSharedPreferences.overload('java.lang.String','int');
    const names=new Set(),prefix='haiagaru.reset-test.';
    const main='io.github.areteruhiro.chmate.haiagaru.ui-config';
    let count=0;
    function check(ok,label){if(!ok)throw Error(label);console.log('PASS '+label);count++;}
    Java.scheduleOnMainThread(()=>{
        try{
            method.implementation=function(name,mode){names.add(String(name));return method.call(this,prefix+name,mode);};
            const p=app.getSharedPreferences(main,0);
            p.edit().putBoolean('hideAd',false).putBoolean('videoAutoplay',false).putBoolean('videoSwipeVolume',true)
                .putString('fixtureCredential','preserve').commit();
            const archive=app.getSharedPreferences('haiagaru_eddi_search',0);
            archive.edit().putBoolean('hideSearchForm',true).putInt('controlTextScale',150).putString('fixtureSearchHistory','preserve').commit();
            const a=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
            check(a!==null,'active Activity found');
            const S=Java.use('app.morphe.extension.chmate.SettingsProfiles');
            check(S.resetDefaults(a),'defaults reset saved in fixture stores');
            check(!p.contains('hideAd')&&!p.contains('videoAutoplay')&&!p.contains('videoSwipeVolume'),'known settings removed to use built-in defaults');
            check(String(p.getString('fixtureCredential',''))==='preserve','unrelated credentials preserved');
            check(!archive.contains('hideSearchForm')&&!archive.contains('controlTextScale'),'archive appearance reset');
            check(String(archive.getString('fixtureSearchHistory',''))==='preserve','search history preserved');
            check(p.getBoolean('videoAutoplay',true),'autoplay built-in default restored');
            console.log('SETTINGS_DEFAULTS_COMPLETE '+count);
        }catch(error){console.log('FAIL '+error.stack);}
        finally{
            method.implementation=null;
            for(const name of names)app.getSharedPreferences(prefix+name,0).edit().clear().commit();
            console.log('REAL_PREFERENCES_UNCHANGED');
        }
    });
});
