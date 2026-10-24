// Old-candidate reproduction followed by temporary routing proof. Does not save any NG.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 test app required');
 Java.classFactory.loader=app.getClassLoader();
 const A=Java.use('app.morphe.extension.chmate.ResponseArchive'),W=Java.use('app.morphe.extension.chmate.WacchoiLongPressMenu');
 const S=Java.use('app.morphe.extension.chmate.WacchoiSuffixNg'),Item=Java.use('android.view.MenuItem');
 const handle=A.handle.overload('java.lang.Object'),confirm=S.confirm.overload('android.content.Context','java.lang.String','java.lang.String');
 let routing=false,baseline=false;
 handle.implementation=function(item){
  const result=handle.call(this,item);
  if(item&&Item.class.isInstance(item)&&Java.cast(item,Item).getItemId()===76&&!routing){
   console.log('BODY_SUFFIX_DISPATCH native helper result='+result);
   if(!result&&!baseline){baseline=true;console.log('REPRODUCED suffix listener not routed; next click uses temporary fix');}
   else if(!result){routing=true;try{const fixed=W.dispatchSuffixNgItem(item);console.log('PROTOTYPE_SUFFIX_ROUTED '+fixed);return fixed;}finally{routing=false;}}
  }
  return result;
 };
 confirm.implementation=function(c,q,b){console.log('SUFFIX_DIALOG_REQUEST suffix='+S.suffix(q)+' board='+b);return confirm.call(this,c,q,b);};
 const append=A.appendDialog242.overload('java.lang.Object','java.lang.Object');
 append.implementation=function(d,m){const r=append.call(this,d,m),menu=Java.cast(m,Java.use('android.view.Menu')),item=menu.findItem(76);console.log('BODY_MENU_BUILT suffix='+(item?item.getTitle():null));return r;};
 console.log('NG242_BODY_DIAGNOSTIC_READY: first suffix click reproduces; second tests routing; do not press OK');
});
