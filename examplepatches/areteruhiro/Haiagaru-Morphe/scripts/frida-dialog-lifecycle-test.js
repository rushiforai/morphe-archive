// Isolated dialog lifecycle only. No post, network request or preference change.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(!String(app.getPackageName()).endsWith('.resumefix242'))throw Error('242 verification only');
    const System=Java.use('java.lang.System'),old=System.getProperty('haiagaru.dialog.trace');
    System.setProperty('haiagaru.dialog.trace','true');
    let dialog=null,checks=0;
    function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
    function cleanup(){if(dialog&&dialog.isShowing())dialog.dismiss();if(old===null)System.clearProperty('haiagaru.dialog.trace');else System.setProperty('haiagaru.dialog.trace',old);}
    Java.scheduleOnMainThread(()=>{try{
        const activity=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
        const text=s=>Java.use('java.lang.String').$new(s);
        const builder=Java.use('app.morphe.extension.chmate.HaiagaruDialog$Builder').$new(activity);
        builder.setTitle.overload('java.lang.CharSequence').call(builder,text('表示の確認'));
        builder.setMessage.overload('java.lang.CharSequence').call(builder,text('検証用'));
        builder.setPositiveButton.overload('java.lang.CharSequence','android.content.DialogInterface$OnClickListener').call(builder,text('閉じる'),null);
        dialog=Java.retain(builder.create());
        dialog.show();check(dialog.isShowing(),'first show');
    }catch(e){console.log('FAIL FIRST_SHOW '+e.stack);cleanup();}});
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
        dialog.dismiss();
    }catch(e){console.log('FAIL REQUEST_DISMISS '+e.stack);cleanup();}})),1200);
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
        check(!dialog.isShowing(),'dismiss state after input dispatch');
        const window=dialog.getWindow(),attrs=window.getAttributes();
        check((attrs.flags.value&0x18)===0x18,'dismissed window cannot take touch or focus');
        check((attrs.flags.value&0x2)===0,'dismissed window cannot dim activity');
        check(window.getDecorView().getVisibility()===8,'dismissed decor hidden');
        dialog.show();check(dialog.isShowing(),'same dialog can reopen');
        check((dialog.getWindow().getAttributes().flags.value&0x18)===0,'reopened dialog restores interaction');
    }catch(e){console.log('FAIL DISMISS_REOPEN '+e.stack);cleanup();}})),1500);
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
        dialog.dismiss();
    }catch(e){console.log('FAIL REQUEST_FINAL_DISMISS '+e.stack);cleanup();}})),2600);
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
        check(!dialog.getWindow().getDecorView().isAttachedToWindow(),'final dismiss detaches decor');
        console.log('DIALOG_LIFECYCLE_COMPLETE checks='+checks);
    }catch(e){console.log('FAIL FINAL_DISMISS '+e.stack);}finally{cleanup();}})),2900);
});
