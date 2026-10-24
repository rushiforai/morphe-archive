// Real native tabs and focused Activity touch dispatch. No posting or external search.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();
 const version=String(app.getPackageManager().getPackageInfo(pkg,0).versionName.value),v191=version.includes('191'),v226=version.includes('226');
 const T=Java.use('app.morphe.extension.chmate.NativeToolTabs'),F=Java.use('androidx.fragment.app.Fragment'),B=Java.use('android.os.Bundle');
 const Tablet=Java.use('jp.syoboi.a2chMate.activity.TabletHomeActivity'),I=Java.use('android.content.Intent'),M=Java.use('android.view.MotionEvent');
 const Page=Java.use(v191?'o.MediationServiceImpldExternalSyntheticLambda0':v226?'o.Kjv':'o.zzeq');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),saved=prefs.getAll();
 const Web=Java.use('android.webkit.WebView'),load=Web.loadUrl.overload('java.lang.String');
 load.implementation=function(url){this.loadDataWithBaseURL('http://hissi.org/','<html><body>LOCAL TAB SWIPE TEST</body></html>','text/html','UTF-8',null);};
 const E=Java.use('app.morphe.extension.chmate.EddiArchiveSearchUi'),search=E.search.overload('int');search.implementation=function(){};
 let host,originalIds,previousId,checks=0,dispatching=false,failed=false,toolIndex=0,fragment,pendingTouch=null,layoutRetries=0;
 const tools=['hissi','checker','wacchoi','settings','eddi','search'];
 function field(o,n){for(let c=o.getClass();c!==null;c=c.getSuperclass())try{const f=c.getDeclaredField(n);f.setAccessible(true);return f.get(o);}catch(e){}throw Error('field '+n);}
 function num(o,n){return Java.cast(field(o,n),Java.use('java.lang.Integer')).intValue();}
 function call(o,n){const m=o.getClass().getMethod(n,Java.array('java.lang.Class',[]));m.setAccessible(true);return m.invoke(o,Java.array('java.lang.Object',[]));}
 function pane(home){return v191?field(host,home?'k':'I'):Java.use('java.lang.reflect.Array').get(field(host,v226?'r':'w'),home?0:1);}
 function state(home){const p=pane(home);if(v191){const adapter=field(p,'d'),pager=field(p,'e');return {owner:p,index:num(pager,'a'),pages:Java.cast(field(adapter,'a'),Java.use('java.util.List'))};}
  const model=field(p,v226?'a':'e'),s=call(field(model,v226?'d':'e'),v226?'c':'d');return {owner:model,index:num(s,v226?'a':'b'),pages:Java.cast(field(s,v226?'b':'a'),Java.use('java.util.List'))};}
 function id(page){return String(field(page,v191?'h':v226?'h':'e'));}
 function select(home,n){const s=state(home),method=s.owner.getClass().getMethod(v191?'a':v226?'c':'e',Java.array('java.lang.Class',[Java.use('java.lang.Integer').TYPE.value]));method.setAccessible(true);method.invoke(s.owner,Java.array('java.lang.Object',[Java.use('java.lang.Integer').valueOf(n)]));}
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function main(fn,delay){setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(failed)return;try{if(pendingTouch){const retry=pendingTouch;pendingTouch=null;retry();main(fn,1500);return;}fn();}catch(e){failed=true;console.log('FAIL '+e.stack);restore();}})),Math.max(delay||50,1500));}
 function restore(){load.implementation=null;search.implementation=null;move.implementation=null;const edit=prefs.edit();['nativeToolTabs','hissiViewerSwipeHistory'].forEach(k=>{if(!saved.containsKey(k))edit.remove(k);else if(k==='nativeToolTabs')edit.putBoolean(k,Java.cast(saved.get(k),Java.use('java.lang.Boolean')).booleanValue());else edit.putInt(k,Java.cast(saved.get(k),Java.use('java.lang.Integer')).intValue());});edit.commit();}
 const move=T.moveThreadTool.overload('android.app.Activity','java.lang.Object','int');move.implementation=function(a,f,d){check(!dispatching,'tab selection deferred beyond touch dispatch');return move.call(this,a,f,d);};
 function blank(){const args=B.$new();args.putString('android.intent.extra.TITLE','SWIPE FIXTURE '+Date.now());args.putString('_data','about:blank#haiagaru-swipe-'+Date.now());const page=Page.$new(4,args),p=pane(false);
  const pos=Java.use(v191?'jp.syoboi.a2chMate.activity.TabletHomeActivity$write':v226?'o.fWG':'o.zzfc'),positionField=pos.class.getDeclaredField(v191?'a':'b');positionField.setAccessible(true);const position=Java.cast(positionField.get(null),pos);
  host[v191||v226?'c':'b'].overload(Page.$className,'boolean',p.getClass().getName().toString(),pos.$className,'boolean',v191?'o.r8lambdahIGIGCNpKpFqE0lgDli724UCuDM':'androidx.fragment.app.Fragment').call(host,page,true,p,position,true,null);
 }
 function find(tool){const s=state(false),page=s.pages.get(s.index);fragment=Java.retain(Java.cast(field(page,v191?'c':v226?'b':'d'),F));check(String(fragment.getArguments().getString('_data'))==='haiagaru-tool://'+tool+'?pane=thread'&&T.isSelectedThreadTool(host,fragment),'selected '+tool+' thread tool');}
 function touch(dx,dy,kind){find(tools[toolIndex]);const view=Java.cast(fragment,F).getView(),loc=Java.array('int',[0,0]),window=Java.array('int',[0,0]),visible=Java.use('android.graphics.Rect').$new();
  if(view.getWidth()<200||view.getHeight()<200||!view.getGlobalVisibleRect(visible)||visible.width()<view.getWidth()*.9){if(++layoutRetries>20)throw Error('Native pager layout did not settle');pendingTouch=()=>touch(dx,dy,kind);console.log('WAIT_LAYOUT '+tools[toolIndex]+' '+view.getWidth()+'x'+view.getHeight());return;}layoutRetries=0;
  view.getLocationOnScreen(loc);host.getWindow().getDecorView().getLocationOnScreen(window);const x=loc[0]-window[0]+view.getWidth()*.5,y=loc[1]-window[1]+view.getHeight()*.55,now=Number(Java.use('android.os.SystemClock').uptimeMillis());check(view.isShown()&&view.isAttachedToWindow(),'tool root attached to focused host');console.log('TOUCH_BOUNDS x='+loc[0]+' y='+loc[1]+' width='+view.getWidth()+' height='+view.getHeight()+' direction='+dx);dispatching=true;
  try{for(let n=0;n<=6;n++){const event=M.obtain.overload('long','long','int','float','float','int').call(M,now,now+n*(kind==='long'?110:25),n===0?0:n===6?kind==='cancel'?3:1:2,x+dx*n/6,y+dy*n/6,0);host.dispatchTouchEvent(event);event.recycle();}}finally{dispatching=false;}}
 function next(){if(toolIndex===tools.length)return finish();const tool=tools[toolIndex];blank();main(()=>{T.openManual(host,tool);main(()=>{blank();main(()=>{T.openManual(host,tool);main(()=>{
  find(tool);const initial=state(false).index,count=state(false).pages.size();check(count>1,'tool has native neighbours index='+initial+' count='+count);
  const density=app.getResources().getDisplayMetrics().density.value,delta=130*density;
  touch(-delta,0);main(()=>{check(state(false).index===Math.min(count-1,initial+1),tool+' left swipe selects right neighbour or stays at boundary');check(state(false).pages.size()===count,'swipe does not close tabs');select(false,initial);main(()=>{
   touch(delta,0);main(()=>{check(state(false).index===Math.max(0,initial-1),tool+' right swipe selects left neighbour or stays at boundary expected='+Math.max(0,initial-1)+' actual='+state(false).index);select(false,initial);main(()=>{
    touch(0,delta);main(()=>{check(state(false).index===initial,tool+' vertical scroll stays');touch(10,0);main(()=>{check(state(false).index===initial,tool+' short drag stays');touch(-delta,0,'cancel');main(()=>{check(state(false).index===initial,tool+' cancelled gesture stays');touch(-delta,0,'long');main(()=>{check(state(false).index===initial,tool+' long press stays');
     check(!host.isFinishing()&&!host.isDestroyed(),'host alive');toolIndex++;main(next);
    },500);},500);},500);},500);
   },500);},500);
  },500);},500);
 },900);},600);},900);},600);}
 function finish(){const s=state(false);for(let n=s.pages.size()-1;n>=0;n--){const page=s.pages.get(n);if(originalIds.indexOf(id(page))<0){
   if(v191){const p=Java.cast(page,Page),f=field(p,'c');if(f)host.e.overload('androidx.fragment.app.Fragment','boolean').call(host,f,false);else throw Error('fixture page has no fragment');}
   else{const m=Java.cast(s.owner,Java.use(v226?'o.GNk':'o.zzev'));m[v226?'d':'c'].overload('int').call(m,n);}return main(finish,400);
  }}
  if(previousId!==null){for(let n=0;n<s.pages.size();n++)if(id(s.pages.get(n))===previousId)select(false,n);}
  restore();console.log('THREAD_TOOL_SWIPE_COMPLETE '+version+' tools='+tools.length+' checks='+checks+' settings restored; fixture tabs removed');
 }
 Java.scheduleOnMainThread(()=>app.startActivity(I.$new(app,Tablet.class).addFlags(0x10000000)));
 setTimeout(()=>Java.perform(()=>Java.choose(Tablet.$className,{onMatch(a){if(!a.isFinishing()&&a.getWindow().getDecorView().hasWindowFocus())host=Java.retain(a);},onComplete(){main(()=>{check(!!host,'focused tablet host');const s=state(false);originalIds=[];for(let n=0;n<s.pages.size();n++)originalIds.push(id(s.pages.get(n)));previousId=s.index>=0?id(s.pages.get(s.index)):null;
  prefs.edit().putBoolean('nativeToolTabs',false).putInt('hissiViewerSwipeHistory',2).commit();next();
 });}})),2200);
});
