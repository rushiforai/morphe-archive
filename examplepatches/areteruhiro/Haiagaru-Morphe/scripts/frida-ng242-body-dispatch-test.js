// Real 242 MenuItem / NG dialog. Only opens and cancels; never writes an NG entry.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 verification app required');
 Java.classFactory.loader=app.getClassLoader();
 const A=Java.use('app.morphe.extension.chmate.ResponseArchive'),W=Java.use('app.morphe.extension.chmate.WacchoiLongPressMenu');
 const S=Java.use('app.morphe.extension.chmate.WacchoiSuffixNg'),H=Java.use('app.morphe.extension.chmate.Haiagaru');
 const callbackType=Java.use('android.view.MenuItem$OnMenuItemClickListener');let calls=0,activity;
 const Callback=Java.registerClass({name:'app.morphe.extension.chmate.fixture.SuffixNg242Dispatch'+Date.now(),implements:[callbackType],methods:{onMenuItemClick(item){calls++;S.confirm.overload('android.content.Context','java.lang.String','java.lang.String').call(S,activity,'(ﾜｯﾁｮｲ a32b-m/EI)','android');return true;}}});
 Java.scheduleOnMainThread(()=>{try{
  const records=Java.use('android.app.ActivityThread').currentActivityThread().mActivities.value.values().toArray();
  for(let n=0;n<records.length;n++){const f=records[n].getClass().getDeclaredField('activity');f.setAccessible(true);const candidate=Java.cast(f.get(records[n]),Java.use('android.app.Activity'));if(!candidate.isFinishing()&&candidate.getWindow().getDecorView().hasWindowFocus())activity=Java.retain(candidate);}
  if(!activity)throw Error('Focused host required');
  const menu=Java.use('o.TTPlayableLandingPageActivity10').$new.overload('android.content.Context','o.TTPlayableLandingPageActivity15').call(Java.use('o.TTPlayableLandingPageActivity10'),activity,null);
  const item=menu.add.overload('int','int','int','java.lang.CharSequence').call(menu,0,76,0,'ﾜｯﾁｮｲ下4桁をNG登録');item.setOnMenuItemClickListener(Callback.$new());
  const result=A.handle(item);console.log('COMPOSE_ROUTE result='+result+' callbacks='+calls);
  if(!result){if(calls!==0)throw Error('Unexpected old-route callback');console.log('REPRODUCED 242 Compose route drops suffix NG listener');
   if(!W.dispatchSuffixNgItem(item)||calls!==1)throw Error('Existing popup route failed');console.log('EXISTING_POPUP_ROUTE opens suffix NG dialog once');
  }else if(calls!==1)throw Error('Callback must run exactly once');
  const native=menu.add.overload('int','int','int','java.lang.CharSequence').call(menu,0,103,0,'コピー');
  if(A.handle(native))throw Error('Native copy action intercepted');
  console.log('NG242_BODY_DISPATCH_READY_FOR_UI_CHECK: cancel NG dialog; do not press OK');
 }catch(e){console.log('FAIL '+e.stack);}});
});
