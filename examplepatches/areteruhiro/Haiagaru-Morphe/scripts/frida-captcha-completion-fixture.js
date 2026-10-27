// Dedicated verification app only. Local HTML and an in-memory editor persistence stub.
// No real site, CAPTCHA answer, native draft file or network POST is used.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.captchadialog191')throw Error('Dedicated verification app required');
 if(Java.use('android.os.Build$VERSION').SDK_INT.value>=35)Java.deoptimizeEverything();
 Java.classFactory.loader=app.getClassLoader();
 Java.openClassFile('/data/local/tmp/haiagaru-board-challenge-fixture.dex').load();
 const Fixture=Java.use('app.morphe.extension.chmate.BoardChallengeWebViewFixture');
 const Auth=Java.use('app.morphe.extension.chmate.ExternalBoardAuthActivity');
 const Hub=Java.use('app.morphe.extension.chmate.ExternalBoardAuth');
 const prepare=Hub.prepareWebSession.overload('android.app.Activity','java.lang.String','java.lang.String','java.lang.Runnable');
 prepare.implementation=function(a,board,url,ready){
  if(String(board)==='https://fixture.invalid/board/'){ready.run();return;}
  return prepare.call(this,a,board,url,ready);
 };
 const prefs=app.getSharedPreferences('haiagaru.external-board-auth',0),key='enabled:https://fixture.invalid';
 const had=prefs.contains(key),old=prefs.getBoolean(key,false);
 let home,auth,web,timer,index=0,phase=0,attempts=0,checks=0;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function restore(){let edit=prefs.edit();if(had)edit.putBoolean(key,old);else edit.remove(key);edit.apply();}
 function clean(){if(timer)clearInterval(timer);timer=null;if(auth&&!auth.isFinishing())auth.finish();restore();}
 function fail(e){console.log('FAIL '+(e.stack||e));clean();prepare.implementation=null;}
 const Callback=Java.registerClass({name:'app.morphe.fixture.PostingResultCallback'+Date.now(),implements:[Java.use('android.webkit.ValueCallback')],methods:{onReceiveValue:function(value){try{
  const title=JSON.parse(String(value));
  if(phase===0){
   if(title!=='Captcha認証'){if(++attempts>25)throw Error('CAPTCHA fixture did not load');return;}
   check(Fixture.captchaChecks(auth)===7,'floating transparent CAPTCHA; both permissions ON');
   check(Fixture.draftChecks(index===1,false)===4,'original/new draft retained before posting');
   phase=1;attempts=0;Fixture.showResult(auth,false);
  }else if(phase===1){
   if(title!=='ERROR'){if(++attempts>25)throw Error('Error fixture did not load');return;}
   check(!auth.isFinishing()&&Fixture.draftChecks(index===1,false)===4,'posting error retains editor, original body and stored draft');
   phase=2;clearInterval(timer);timer=null;
   if(index===2)auth.onBackPressed();else Fixture.showResult(auth,true);
   setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
    check(auth.isFinishing()||auth.isDestroyed(),'confirmation closes after '+(index===2?'cancel':'server posting success'));
    check(Fixture.draftChecks(index===1,index!==2)===4,index===0?'success clears matching body, persists it and closes posting dialog':index===1?'success preserves a newer draft and keeps its editor':'cancel preserves body, stored draft and posting editor');
    check(Fixture.forgotten(home),'closed confirmation discards original HTML');
    restore();
    if(++index<3){start();return;}
    prepare.implementation=null;
    console.log('CAPTCHA_COMPLETION_FIXTURE_COMPLETE '+checks+' checks; no real post or native draft file changed');
   }catch(e){fail(e);}})),1800);
  }
 }catch(e){fail(e);}}}});
 function start(){auth=null;web=null;phase=0;attempts=0;
  console.log(Fixture.openDraftCompletion(home,index===1));
  timer=setInterval(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
   if(!web)Java.choose(Auth.$className,{onMatch(a){if(!a.isFinishing()&&String(a.getIntent().getStringExtra('board'))==='https://fixture.invalid/board/'){auth=Java.retain(a);web=Java.retain(a.web.value);}},onComplete(){}});
   if(!web){if(++attempts>25)throw Error('Confirmation Activity unavailable');return;}
   web.evaluateJavascript('document.title',Callback.$new());
  }catch(e){fail(e);}})),400);
 }
 const records=Java.use('android.app.ActivityThread').currentActivityThread().mActivities.value.values().iterator();
 while(records.hasNext()){
  const record=Java.cast(records.next(),Java.use('android.app.ActivityThread$ActivityClientRecord'));
  const a=record.activity.value;
  if(a&&!a.isFinishing()&&String(a.getPackageName())===String(app.getPackageName())&&!String(a.getClass().getName()).includes('ExternalBoardAuthActivity'))home=Java.retain(a);
 }
 Java.scheduleOnMainThread(()=>{try{if(!home)throw Error('Verification home unavailable');start();}catch(e){fail(e);}});
});
