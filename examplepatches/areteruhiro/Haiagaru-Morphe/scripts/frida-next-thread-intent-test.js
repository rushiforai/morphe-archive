// Intent resolution only. Never launches a thread, posts or modifies preferences.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Verification app only');
 Java.classFactory.loader=app.getClassLoader();
 const I=Java.use('android.content.Intent'),U=Java.use('android.net.Uri'),C=Java.use('app.morphe.extension.chmate.HissiMenuCompatibility');let n=0;
 function check(v,s){if(!v)throw Error(s);console.log('PASS '+s);n++;}
 function intent(url){return I.$new('android.intent.action.VIEW',U.parse(url));}
 try{
  const a=intent('https://bbs.eddibb.cc/test/read.cgi/liveedge/1792587764/');a.setPackage(app.getPackageName());C.prepareExternalIntent(a);
  check(a.getComponent()!==null&&String(a.getComponent().getClassName())==='jp.syoboi.a2chMate.activity.ResListActivity','same-package Edge next-thread intent explicit');
  check(a.resolveActivity(app.getPackageManager())!==null,'explicit native thread screen resolves');
  const b=intent('https://bbs.eddibb.cc/test/read.cgi/liveedge/1792587764/');C.prepareExternalIntent(b);check(b.getComponent()===null,'unrestricted browser intent unchanged');
  const c=intent('https://bbs.eddibb.cc/liveedge/');c.setPackage(app.getPackageName());C.prepareExternalIntent(c);check(c.getComponent()===null,'board URL unchanged');
  const d=intent('https://bbs.eddibb.cc/test/read.cgi/liveedge/1792587764/');d.setClassName(app.getPackageName(),'app.morphe.extension.chmate.OpenUrlActivity');C.prepareExternalIntent(d);check(String(d.getComponent().getClassName()).endsWith('OpenUrlActivity'),'explicit routing preserved');
  const e=intent('https://example.org/test/read.cgi/liveedge/1792587764/');e.setPackage(app.getPackageName());C.prepareExternalIntent(e);check(e.getComponent()===null,'unrecognized host unchanged');
  console.log('NEXT_THREAD_INTENT_COMPLETE '+n+' checks');
 }catch(e){console.log('FAIL '+e.stack);}
});
