// Original public site scripts, synthetic unsigned challenge, .invalid origin only.
// No real CAPTCHA, authentication token, draft file or network posting is used.
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
 prepare.implementation=function(a,board,url,ready){if(String(board)==='https://fixture.invalid/board/'){ready.run();return;}return prepare.call(this,a,board,url,ready);};
 let home,auth,web,timer,checks=0,attempts=0,phase=0;
 function check(ok,message){if(!ok)throw Error(message);checks++;console.log('PASS '+message);}
 function clean(){if(timer)clearInterval(timer);timer=null;prepare.implementation=null;if(auth&&!auth.isFinishing())auth.finish();}
 function fail(e){console.log('FAIL '+(e.stack||e));clean();}
 const Callback=Java.registerClass({name:'app.morphe.fixture.RussiaPowCallback'+Date.now(),implements:[Java.use('android.webkit.ValueCallback')],methods:{onReceiveValue:function(raw){try{
  const r=JSON.parse(JSON.parse(String(raw)));
  if(phase===0){
   if(!r.initialized||!r.compact){if(++attempts>60)throw Error('Original site script did not initialize');return;}
   check(Fixture.captchaChecks(auth)===7,'Russia calculation uses transparent dialog and both permissions ON');
   check(r.origin==='https://fixture.invalid'&&r.state==='idle'&&r.empty&&r.submits===0,'original public scripts wait for explicit calculation start');
   check(r.hidden&&r.startEnabled&&!r.stopEnabled&&!r.submitEnabled,'only original calculation form shown with native site button state');
   phase=1;attempts=0;
   web.evaluateJavascript("document.querySelector('[data-pow-start]').click()",null);
  }else if(phase===1){
   if(r.state!=='solved'){if(r.state==='broken'||r.state==='expired'||++attempts>240)throw Error('Original public Worker did not complete: '+r.state);return;}
   check(!r.empty&&r.submitEnabled&&r.submits===0,'original public Worker completes unsigned synthetic challenge without sending');
   phase=2;web.evaluateJavascript("document.getElementById('form-btn').click()",null);
  }else if(phase===2){
   if(r.submits!==1){if(++attempts>25)throw Error('Original submit gate failed');return;}
   check(r.submits===1,'site submit gate accepts its Worker result; fixture prevents network POST');
   phase=3;clean();
   setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
    check(Fixture.forgotten(home),'closing discards synthetic calculation page');
    console.log('RUSSIA_POW_FIXTURE_COMPLETE '+checks+' checks; original site scripts, no real authentication or posting');
   }catch(e){fail(e);}})),1600);
  }
 }catch(e){fail(e);}}}});
 const records=Java.use('android.app.ActivityThread').currentActivityThread().mActivities.value.values().iterator();
 while(records.hasNext()){const record=Java.cast(records.next(),Java.use('android.app.ActivityThread$ActivityClientRecord')),a=record.activity.value;if(a&&!a.isFinishing()&&String(a.getPackageName())===String(app.getPackageName())&&!String(a.getClass().getName()).includes('ExternalBoardAuthActivity'))home=Java.retain(a);}
 Java.scheduleOnMainThread(()=>{try{
  if(!home)throw Error('Verification home unavailable');console.log(Fixture.openRussia(home));
  timer=setInterval(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
   if(!web)Java.choose(Auth.$className,{onMatch(a){if(!a.isFinishing()&&String(a.getIntent().getStringExtra('board'))==='https://fixture.invalid/board/'){auth=Java.retain(a);web=Java.retain(a.web.value);}},onComplete(){}});
   if(!web){if(++attempts>25)throw Error('Calculation dialog unavailable');return;}
   web.evaluateJavascript("JSON.stringify({origin:location.origin,initialized:!!document.querySelector('.local-pow')?.dataset.powInitialized,compact:!!document.getElementById('haiagaru-captcha-presentation'),hidden:!!document.getElementById('outside')&&getComputedStyle(document.getElementById('outside')).display==='none',state:document.getElementById('form-btn')?.dataset.powState,empty:!document.querySelector('[name=\"pow-response\"]')?.value,submits:window.syntheticSubmits,startEnabled:!document.querySelector('[data-pow-start]')?.disabled,stopEnabled:!document.querySelector('[data-pow-stop]')?.disabled,submitEnabled:!document.getElementById('form-btn')?.disabled})",Callback.$new());
  }catch(e){fail(e);}})),350);
 }catch(e){fail(e);}});
});
