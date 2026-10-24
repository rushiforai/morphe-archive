Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),I=Java.use('android.content.Intent');
 Java.scheduleOnMainThread(()=>{const host=H.toolbarActivity(null);host.startActivity(I.$new(host,Java.use('app.morphe.extension.chmate.ToolbarIconsActivity').class));});
 setTimeout(()=>Java.perform(()=>Java.choose('app.morphe.extension.chmate.ToolbarIconsActivity',{
  onMatch(activity){if(activity.isFinishing()||activity.isDestroyed())return;
   Java.scheduleOnMainThread(()=>{try{
    const f=activity.getClass().getDeclaredField('rows');f.setAccessible(true);
    const rows=Java.cast(f.get(activity),Java.use('android.widget.LinearLayout')),TV=Java.use('android.widget.TextView');let index=-1;
    for(let n=0;n<rows.getChildCount();n++){const v=rows.getChildAt(n);if(TV.class.isInstance(v)&&String(Java.cast(v,TV).getText())==='フローティングのフィルター')index=n;}
    if(index<0)throw Error('Floating icon setting row missing');
    const preview=rows.getChildAt(index+1),picker=Java.cast(rows.getChildAt(index+2),TV),reset=Java.cast(rows.getChildAt(index+3),TV);
    if(String(preview.getContentDescription())!=='フローティングのフィルターのアイコン'||String(picker.getText())!=='画像を選択'||String(reset.getText())!=='標準のアイコンに戻す')throw Error('Setting controls missing');
    console.log('PASS actual icon settings model contains separate floating preview/picker/reset');
   }catch(e){console.log('FAIL '+e.stack);}finally{activity.finish();}});
  },onComplete(){}
 })),5000);
});
