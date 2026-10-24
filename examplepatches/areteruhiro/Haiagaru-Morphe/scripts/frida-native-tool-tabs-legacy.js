// Actual native tablet UI smoke test for the two legacy verification packages.
// Only test tool tabs are opened. Existing tabs/data are not deleted; preference is restored.
Java.perform(function () {
    const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
    const config=pkg.endsWith('.settingsfix191')?['o.MediationServiceImpldExternalSyntheticLambda0','o.onAppOpenAdLoaded','o.r8lambdahIGIGCNpKpFqE0lgDli724UCuDM']:pkg.endsWith('.resumefix226')?['o.Kjv','o.setFallbackResource','o.redirect']:null;
    if(!config)throw Error('Verification packages only');
    const Tools=Java.use('app.morphe.extension.chmate.NativeToolTabs'),Bundle=Java.use('android.os.Bundle'),Page=Java.use(config[0]);
    const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),had=prefs.contains('nativeToolTabs'),old=prefs.getBoolean('nativeToolTabs',false);
    let host=null,checks=0;
    function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
    function restore(){const edit=prefs.edit();if(had)edit.putBoolean('nativeToolTabs',old);else edit.remove('nativeToolTabs');edit.commit();}
    function find(view,predicate){if(predicate(view))return view;const G=Java.use('android.view.ViewGroup');if(G.class.isInstance(view)){const g=Java.cast(view,G);for(let i=0;i<g.getChildCount();i++){const found=find(g.getChildAt(i),predicate);if(found)return found;}}return null;}
    function fragments(callback){const found=[];Java.choose('app.morphe.extension.chmate.NativeToolFragment',{onMatch(f){const v=f.getClass().getMethod('getView',Java.array('java.lang.Class',[])).invoke(f,Java.array('java.lang.Object',[]));if(v!==null)found.push({f:Java.retain(f),view:Java.cast(v,Java.use('android.view.View'))});},onComplete(){callback(found);}});}
    Java.scheduleOnMainThread(()=>{try{
        check(Tools.supported(),'native bridge wired');
        const args=Bundle.$new();args.putString('_data','https://example.invalid/');
        check(String(Tools.createFragment(Page.$new(4,args)).getClass().getName())===config[1],'ordinary Web tab preserved');
        args.putString('_data','haiagaru-tool://settings');
        check(Java.use(config[2]).class.isInstance(Tools.createFragment(Page.$new(4,args))),'native Fragment ART verification');
        const Tablet=Java.use('jp.syoboi.a2chMate.activity.TabletHomeActivity');
        app.startActivity(Java.use('android.content.Intent').$new(app,Tablet.class).addFlags(0x10000000));
    }catch(e){console.log('FAIL INITIAL '+e.stack);restore();}});
    setTimeout(()=>Java.perform(()=>Java.choose('jp.syoboi.a2chMate.activity.TabletHomeActivity',{
        onMatch(a){if(host||!a.getWindow().getDecorView().isShown())return;host=Java.retain(a);Java.scheduleOnMainThread(()=>{try{
            prefs.edit().putBoolean('nativeToolTabs',false).commit();check(!Tools.open(host,'settings'),'OFF keeps standalone route');
            prefs.edit().putBoolean('nativeToolTabs',true).commit();check(Tools.open(host,'settings'),'ON opens settings in native tablet host');
        }catch(e){console.log('FAIL OPEN '+e.stack);restore();}});},onComplete(){}
    })),5000);
    setTimeout(()=>Java.perform(()=>fragments(items=>Java.scheduleOnMainThread(()=>{try{
        const settings=items.find(item=>{
            const args=item.f.getClass().getMethod('getArguments',Java.array('java.lang.Class',[])).invoke(item.f,Java.array('java.lang.Object',[]));
            return args!==null&&String(Java.cast(args,Bundle).getString('_data'))==='haiagaru-tool://settings';
        });
        check(!!settings,'native settings Fragment has real view');
        let button=find(settings.view,v=>Java.use('android.widget.Button').class.isInstance(v)&&String(Java.cast(v,Java.use('android.widget.Button')).getText())==='基本設定');
        if(!button){const back=find(settings.view,v=>Java.use('android.widget.Button').class.isInstance(v)&&String(Java.cast(v,Java.use('android.widget.Button')).getText())==='戻る');if(back)Java.cast(back,Java.use('android.widget.Button')).performClick();button=find(settings.view,v=>Java.use('android.widget.Button').class.isInstance(v)&&String(Java.cast(v,Java.use('android.widget.Button')).getText())==='基本設定');}
        check(button!==null,'settings categories available');Java.cast(button,Java.use('android.widget.Button')).performClick();
        const composeClass=Java.use('app.morphe.extension.chmate.HaiagaruDialog').class.getDeclaredField('composeContent').getType().getSuperclass();
        check(find(settings.view,v=>composeClass.isInstance(v)&&v.isAttachedToWindow())!==null,'shared Compose settings cards attached');
        prefs.edit().putBoolean('nativeToolTabs',false).commit();check(!Tools.open(host,'eddi'),'OFF stops new tool tabs');
        prefs.edit().putBoolean('nativeToolTabs',true).commit();check(prefs.getBoolean('nativeToolTabs',false),'ON policy restored');
        check(Tools.open(host,'eddi'),'archive opens in native tablet host');
    }catch(e){console.log('FAIL SETTINGS '+e.stack);restore();}}))),11000);
    setTimeout(()=>Java.perform(()=>fragments(items=>Java.scheduleOnMainThread(()=>{try{
        check(items.some(item=>find(item.view,v=>Java.use('android.widget.TextView').class.isInstance(v)&&String(Java.cast(v,Java.use('android.widget.TextView')).getText()).includes('エッヂ過去ログ'))),'archive native content attached');
        console.log('NATIVE_LEGACY_COMPLETE checks='+checks);
    }catch(e){console.log('FAIL ARCHIVE '+e.stack);}finally{restore();console.log('PREFERENCE_RESTORED');}}))),18000);
});
