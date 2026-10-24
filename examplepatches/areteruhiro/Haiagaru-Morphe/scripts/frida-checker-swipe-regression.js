// Native tablet ownership plus real touch dispatch. Local HTML and controlled
// history availability isolate navigation; this is not an external site test.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),T=Java.use('app.morphe.extension.chmate.NativeToolTabs'),C=Java.use('app.morphe.extension.chmate.HissiMenuController');
 const W=Java.use('android.webkit.WebView'),F=Java.use('androidx.fragment.app.Fragment'),I=Java.use('android.content.Intent'),U=Java.use('android.net.Uri'),M=Java.use('android.view.MotionEvent');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
 const keys=['nativeToolTabs','hissiViewerSwipeHistory'],saved=keys.map(k=>({k,had:prefs.contains(k),value:k==='nativeToolTabs'?prefs.getBoolean(k,false):prefs.getInt(k,0)}));
 let host,fragment,web,active,dispatching=false,backs=0,forwards=0,checks=0,index=0,failed=false;
 const cases=[];[true,false].forEach(home=>{[0,1,2].forEach(mode=>{[-1,1].forEach(direction=>cases.push({home,mode,direction,history:false}));});[1,2].forEach(mode=>[-1,1].forEach(direction=>cases.push({home,mode,direction,history:true})));});
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 const load=W.loadUrl.overload('java.lang.String'),canBack=W.canGoBack.overload(),canForward=W.canGoForward.overload(),goBack=W.goBack.overload(),goForward=W.goForward.overload();
 load.implementation=function(url){if(String(url).startsWith('http://hissi.org/read.php/android/'))this.loadDataWithBaseURL('http://hissi.org/','<html><body>SWIPE LOCAL TEST</body></html>','text/html','UTF-8',null);else load.call(this,url);};
 canBack.implementation=function(){return web&&this.equals(web)?active.history:canBack.call(this);};
 canForward.implementation=function(){return web&&this.equals(web)?active.history:canForward.call(this);};
 goBack.implementation=function(){if(web&&this.equals(web)){check(!dispatching,'back deferred beyond touch dispatch');backs++;}else goBack.call(this);};
 goForward.implementation=function(){if(web&&this.equals(web)){check(!dispatching,'forward deferred beyond touch dispatch');forwards++;}else goForward.call(this);};
 function cleanup(){[load,canBack,canForward,goBack,goForward].forEach(m=>m.implementation=null);const e=prefs.edit();saved.forEach(s=>{if(!s.had)e.remove(s.k);else if(s.k==='nativeToolTabs')e.putBoolean(s.k,s.value);else e.putInt(s.k,s.value);});e.commit();}
 function main(fn){Java.perform(()=>Java.scheduleOnMainThread(()=>{if(failed)return;try{fn();}catch(e){failed=true;console.log('FAIL '+e.stack);cleanup();}}));}
 function next(){main(()=>{
  if(index===cases.length){cleanup();console.log('CHECKER_SWIPE_COMPLETE cases='+index+' checks='+checks+' preferences restored');return;}
  active=cases[index];web=null;fragment=null;backs=0;forwards=0;prefs.edit().putBoolean('nativeToolTabs',active.home).putInt('hissiViewerSwipeHistory',active.mode).commit();
  const intent=I.$new();intent.setData(U.parse('http://hissi.org/read.php/android/'));intent.putExtra.overload('java.lang.String','boolean').call(intent,'haiagaru.native.hissiViewer',true);
  check(T.open(host,'hissi',intent),'open '+JSON.stringify(active));
  setTimeout(()=>Java.perform(()=>{
   Java.choose('app.morphe.extension.chmate.NativeToolFragment',{onMatch(f){const n=Java.cast(f,F);if(n.isResumed()&&String(n.getArguments().getString('_data'))==='haiagaru-tool://hissi?pane='+(active.home?'home':'thread'))fragment=Java.retain(f);},onComplete(){}});
   Java.choose('app.morphe.extension.chmate.HissiMenuController',{onMatch(c){const candidate=c.viewerWebView.value;if(candidate&&candidate.isShown())web=Java.retain(candidate);},onComplete(){main(()=>{
    check(!!fragment&&!!web,'visible checker tab and browser');
    const loc=Java.array('int',[0,0]);web.getLocationOnScreen(loc);const width=web.getWidth(),x=loc[0]+width*(active.direction>0?.2:.8),y=loc[1]+web.getHeight()*.5,delta=width*.6*active.direction;
    const clock=Java.use('android.os.SystemClock'),now=Number(clock.uptimeMillis());dispatching=true;
    try{for(let n=0;n<=6;n++){const e=M.obtain.overload('long','long','int','float','float','int').call(M,now,now+n*30,n===0?0:n===6?1:2,x+delta*n/6,y,0);host.dispatchTouchEvent(e);e.recycle();}
     check(!host.isFinishing(),'host not finishing during touch');
    }finally{dispatching=false;}
    setTimeout(()=>main(()=>{
     const forward=(active.direction>0)===(active.mode===1),expectClose=active.mode!==0&&!forward&&!active.history;
     check(!host.isFinishing()&&!host.isDestroyed(),'host remains alive');
     check(!Java.cast(fragment,F).isAdded()===expectClose,'only own tab closes at backward history boundary');
     check(backs===(active.mode!==0&&!forward&&active.history?1:0),'back history count');
     check(forwards===(active.mode!==0&&forward&&active.history?1:0),'forward history count');
     if(!expectClose)T.closeCurrentTab(host,fragment);index++;setTimeout(next,500);
    }),800);
   });}});
  }),1700);
 });}
 main(()=>{host=Java.retain(T.manualHost(H.toolbarActivity(null)));check(!!host,'tablet host');
  Java.choose('app.morphe.extension.chmate.NativeToolFragment',{onMatch(f){const n=Java.cast(f,F);if(n.isAdded()&&String(n.getArguments().getString('_data')).startsWith('haiagaru-tool://hissi'))T.closeCurrentTab(host,f);},onComplete(){setTimeout(next,800);}});
 });
});
