// Controller fixture: no search requests, postings, DAT or preference writes.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Verification only');
 Java.classFactory.loader=app.getClassLoader();
 const E=Java.use('app.morphe.extension.chmate.EddiArchiveSearchUi'),G=Java.use('app.morphe.extension.chmate.HaiagaruSettingsGestures'),B=Java.use('android.widget.Button');let ui,n=0,requests=[];
 function check(v,s){if(!v)throw Error(s);console.log('PASS '+s);n++;}
 function field(o,name){const f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(o);}
 E.search.overload('int').implementation=function(page){requests.push(page);};
 E.search.overload('int','android.net.Uri').implementation=function(page,uri){requests.push(page);};
 Java.scheduleOnMainThread(()=>{try{
  const activity=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null),state=Java.use('android.os.Bundle').$new();
  state.putString('haiagaru.eddi.search.state',JSON.stringify({query:'https://eddiarchive3rd.boy.jp/',threads:[],page:1,total:0}));
  const R=Java.registerClass({name:'app.morphe.extension.chmate.PagesGestureTestClose',implements:[Java.use('java.lang.Runnable')],methods:{run(){}}});
  ui=E.embed(activity,Java.use('android.net.Uri').parse('https://eddiarchive3rd.boy.jp/'),null,state,R.$new());
  const page=Java.use('app.morphe.extension.chmate.EddiArchiveSearchUi$SearchPage'),rows=Java.use('java.util.ArrayList').$new(),first=Java.cast(field(ui,'firstPage'),B),last=Java.cast(field(ui,'lastPage'),B);
  check(E.lastPageNumber(0)===1&&E.lastPageNumber(50)===1&&E.lastPageNumber(51)===2&&E.lastPageNumber(123)===3,'last-page boundaries');
  ui.display(2,page.$new.overload('java.util.List','int','boolean').call(page,rows,123,false));check(first.isEnabled()&&last.isEnabled(),'middle page enables both endpoints');
  check(first.hasOnClickListeners()&&last.hasOnClickListeners(),'endpoint buttons have click handlers');
  check(String(ui.queryUri(1).getQueryParameter('page'))==='1'&&String(ui.queryUri(E.lastPageNumber(123)).getQueryParameter('page'))==='3','first and last target URI pages');
  ui.display(3,page.$new.overload('java.util.List','int','boolean').call(page,rows,123,false));check(first.isEnabled()&&!last.isEnabled(),'last page disables last button');
  ui.display(1,page.$new.overload('java.util.List','int','boolean').call(page,rows,-1,true));check(!first.isEnabled()&&!last.isEnabled(),'unknown total disables unsupported last page');
  check(G.gestureDistance(100,100)===100,'default gesture distance unchanged');check(G.gestureDistance(100,200)===50,'high sensitivity halves distance');check(G.gestureDistance(100,50)===200,'low sensitivity doubles distance');check(G.gestureDistance(100,0)===200&&G.gestureDistance(100,999)===50,'sensitivity bounds');
  console.log('PAGES_GESTURE_COMPLETE '+n+' checks');
 }catch(e){console.log('FAIL '+e.stack);}finally{if(ui)ui.dispose();}});
});
