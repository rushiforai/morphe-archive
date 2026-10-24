Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();Java.classFactory.loader=app.getClassLoader();
 const C=Java.use('app.morphe.extension.chmate.HissiMenuController'),Base=Java.use('app.morphe.extension.chmate.ToolScreenController');
 const finish=Base.finish.overload();finish.implementation=function(){console.log('CHECKER_FINISH '+Java.use('android.util.Log').getStackTraceString(Java.use('java.lang.Exception').$new()));try{return finish.call(this);}catch(e){console.log('FINISH_ERROR '+e);throw e;}};
 const methods=C.class.getDeclaredMethods();
 for(let i=0;i<methods.length;i++){const m=methods[i],p=m.getParameterTypes();if(p.length===2&&String(p[0].getName())==='android.view.View'&&String(p[1].getName())==='android.view.MotionEvent'){
  const name=String(m.getName()),call=C[name].overload('android.view.View','android.view.MotionEvent');call.implementation=function(v,e){try{const r=call.call(this,v,e);if(e.getActionMasked()===1)console.log('SWIPE_UP handled='+r);return r;}catch(err){console.log('SWIPE_ERROR '+err);throw err;}};
  console.log('HOOK '+name);
 }}
 console.log('SWIPE_DIAGNOSTIC_READY');
});
