Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 test package required');
 Java.classFactory.loader=app.getClassLoader();
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),B=Java.use('app.morphe.extension.chmate.HaiagaruDialog$Builder');
 let dialog,checks=0;function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 Java.scheduleOnMainThread(()=>{try{const a=H.toolbarActivity(null),b=B.$new(a),S=Java.use('java.lang.String');b.setTitle.overload('java.lang.CharSequence').call(b,S.$new('ダイアログ終了検証'));b.setMessage.overload('java.lang.CharSequence').call(b,S.$new('ローカル検証'));dialog=Java.retain(b.show());dialog.dismiss();dialog.dismiss();dialog.dismiss();}catch(e){console.log('FAIL '+e.stack);}});
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
  check(!dialog.isShowing(),'queued multiple dismiss is harmless');
  dialog.show();const decor=dialog.getWindow().getDecorView();dialog.getWindow().getWindowManager().removeViewImmediate(decor);
  check(!decor.isAttachedToWindow(),'test dialog externally detached');dialog.dismiss();dialog.dismiss();
 }catch(e){console.log('FAIL '+e.stack);}})),1700);
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
  check(!dialog.getWindow().getDecorView().isAttachedToWindow(),'detached dismiss returns without crash');console.log('DIALOG_DETACH_COMPLETE checks='+checks);
 }catch(e){console.log('FAIL '+e.stack);}})),4000);
});
