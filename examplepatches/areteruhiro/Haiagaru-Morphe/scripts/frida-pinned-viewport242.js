Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 verification only');
 Java.classFactory.loader=app.getClassLoader();
 const FP=Java.use('app.morphe.extension.chmate.FilterPosition');
 Java.choose('jp.syoboi.a2chMate.ui.reslist.ResListFragment',{onMatch(f){const root=f.getView();if(root&&root.isShown()){
 const l=FP.findList(root);if(l)console.log('LIST '+l+' PARENT '+l.getParent()+' PARAMS '+l.getLayoutParams().getClass().getName()+' SIZE '+l.getHeight()+' PAD '+l.getPaddingBottom());
 }},onComplete(){console.log('DONE');}});
});
