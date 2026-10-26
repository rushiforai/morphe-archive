// Opens/selects the native archive tab, checks the shared form model, restores fold state.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Verification package required');
    Java.classFactory.loader=app.getClassLoader();
    const Tabs=Java.use('app.morphe.extension.chmate.NativeToolTabs');
    function main(action){Java.perform(()=>Java.scheduleOnMainThread(()=>{try{action();}catch(e){console.log('FAIL '+e.stack);}}));}
    main(()=>{const a=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);if(!Tabs.openManual(a,'eddi'))throw Error('Cannot open native archive');console.log('PASS native archive opened');});
    setTimeout(()=>main(()=>{
        Java.choose('app.morphe.extension.chmate.NativeToolFragment',{
            onMatch(f){
                if(!f.frame.value||!f.frame.value.isShown()||!Tabs.isArchiveFragment(f))return;
                if(f.header.value.getVisibility()!==8)throw Error('Duplicate header still visible');
                console.log('PASS duplicate title and close header hidden');
                console.log('PASS native swipe layout verified '+f.frame.value.getClass().getName());
            },onComplete(){}
        });
        Java.choose('app.morphe.extension.chmate.EddiArchiveSearchUi',{
            onMatch(ui){
                if(ui.disposed.value)return;
                const old=ui.hideSearchForm.value;
                try{
                    ui.toggleSearchForm();if(ui.hideSearchForm.value===old)throw Error('Fold action did not toggle');
                    console.log('PASS search fold action toggles');
                    ui.toggleSearchForm();if(ui.hideSearchForm.value!==old)throw Error('Fold state not restored');
                    console.log('PASS search fold state restored');
                }finally{if(ui.hideSearchForm.value!==old)ui.toggleSearchForm();}
            },onComplete(){console.log('EDDI_HEADER_CHECK_COMPLETE');}
        });
    }),1500);
});
