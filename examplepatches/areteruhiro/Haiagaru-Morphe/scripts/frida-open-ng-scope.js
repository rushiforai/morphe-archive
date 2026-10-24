setTimeout(()=>Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!app.getPackageName().toString().includes('.haiagaru.'))throw Error('Verification app required');
 Java.scheduleOnMainThread(function(){
  Java.choose('app.morphe.extension.chmate.HaiagaruSettingsActivity',{onMatch:function(a){
   if(!a.isFinishing())Java.use('app.morphe.extension.chmate.WacchoiSuffixNg').confirm.overload('android.content.Context','java.lang.String','java.lang.String').call(
    Java.use('app.morphe.extension.chmate.WacchoiSuffixNg'),a,'abcd-Ab12','android');
  },onComplete:function(){}});
  console.log('NG_SCOPE_OPEN_REQUESTED no registration');
 });
}),1000);
