// Isolated emulator only. Temporary in-memory fixture rows are restored in the same main-thread call.
let threadLaunch;
const originalSetup=rpc.exports.setup;
rpc.exports.setup=function(value){return originalSetup(value).then(result=>main(()=>{
 for(const key of ['gifUseNativeViewer','videoUseNativeViewer','mediaSwipeWholeThread','videoLetterboxTouch','xMp4GifAutoplay','inlineGifAutoplay','inlineGifWifiOnly']){
  saved.push({key,had:prefs.contains(key),value:prefs.getBoolean(key,key==='videoLetterboxTouch'||key==='xMp4GifAutoplay')});prefs.edit().putBoolean(key,key==='videoLetterboxTouch').commit();
 }
 return result;
}));};
rpc.exports.threadCollection=function(){return main(()=>{
 const Extra=Java.use(P+'ExtraQuickFilters'),Popular=Java.use(P+'PopularReplies'),Nav=Java.use(P+'MediaViewerNavigation');
 const Activity=Java.use('android.app.Activity'),Collection=Java.use('java.util.Collection'),List=Java.use('java.util.List');
 const ownersField=Extra.class.getDeclaredField('OWNERS');ownersField.setAccessible(true);
 const refs=Java.cast(ownersField.get(null),List);let owner,source;
 for(let n=0;n<refs.size();n++){const ref=Java.cast(refs.get(n),Java.use('java.lang.ref.WeakReference')),raw=ref.get();if(!raw)continue;
  const f=Java.cast(raw,Java.use(String(raw.getClass().getName()))),root=f.getView(),rect=Java.use('android.graphics.Rect').$new();if(root&&root.isShown()&&root.hasWindowFocus()&&root.getGlobalVisibleRect(rect)&&!rect.isEmpty()){owner=f;source=Java.cast(f.getActivity(),Activity);}}
 if(!owner)throw Error('No visible native thread');
 const adapter=Extra.adapter(owner),full=Java.cast(Popular.fullList(field(adapter,'o').get(adapter)),List);
 const original=Java.use('java.util.ArrayList').$new(Java.cast(full,Collection)),index=Extra.index(adapter),Index=Java.use(String(index.getClass().getName()));
 const numbers=[];for(let n=0;n<full.size()&&numbers.length<2;n++){const r=Java.cast(full.get(n),Java.use('o.KeJ11'));if((Java.cast(index,Index).b.overload('int').call(Java.cast(index,Index),r.o.value)&0x1010)===0)numbers.push(r.o.value);}
 if(numbers.length!==2)throw Error('Two normal fixture posts required');
 const key='mediaSwipeWholeThread',had=prefs.contains(key),old=prefs.getBoolean(key,false);
 const first='https://gallery.example.org/a.jpg',second='https://gallery.example.org/b.gif',third='https://gallery.example.org/c.mp4';
 function response(text,number){const r=Java.use('o.KeJ11').$new.overload('java.lang.String','java.lang.String','java.lang.String','java.lang.String').call(Java.use('o.KeJ11'),'','','',text);r.o.value=number;return r;}
 const chosen=[response(first+' '+second,numbers[0]),response(third+' '+first,numbers[1])];
 const native=Java.use('jp.syoboi.a2chMate.activity.ImagesViewer2Activity$RemoteActionCompatParcelizer');
 const input=Java.use('java.util.ArrayList').$new();input.add(J().$new(second));
 try{
  full.clear();chosen.forEach(r=>full.add(r));
  prefs.edit().putBoolean(key,false).commit();
  const off=native.e.overload('android.content.Context','java.util.List','int','java.util.List').call(native,source,input,0,null);
  if(off.hasExtra('haiagaru.media.links'))throw Error('OFF unexpectedly expands native thumbnail');
  prefs.edit().putBoolean(key,true).commit();
  const shared=Java.use('java.util.ArrayList').$new();shared.add(J().$new('fixture-thumbnail'));
  const on=native.e.overload('android.content.Context','java.util.List','int','java.util.List').call(native,source,input,0,shared);
  const group=on.getStringArrayListExtra('haiagaru.media.links');
  threadLaunch=Java.retain(on);
  if(!group||group.size()!==3||String(group.get(0))!==first||String(group.get(1))!==second||String(group.get(2))!==third)throw Error('Wrong thread media collection '+(group?group.toString():'null'));
  if(!on.getBooleanExtra('haiagaru.media.thread',false)||on.getIntExtra('index',-1)!==0||on.getStringArrayListExtra('links').size()!==1||on.getStringArrayListExtra('sharedElements').size()!==1)throw Error('Native selection or original transition changed');
  const appIntent=native.e.overload('android.content.Context','java.util.List','int','java.util.List').call(native,source.getApplicationContext(),input,0,null);
  if(!appIntent.getBooleanExtra('haiagaru.media.thread',false)||appIntent.getStringArrayListExtra('haiagaru.media.links').size()!==3)throw Error('Application context loses the source thread gallery');
  if(Extra.threadMedia(source,'https://gallery.example.org/other.jpg')!==null)throw Error('Foreign thread URL accepted');
  const flagMethod=Index.b.overload('int'),fixtureThread=String(Java.use('java.lang.Thread').currentThread().getId()),blocked=chosen[1].o.value;
  try{
   flagMethod.implementation=function(no){return String(Java.use('java.lang.Thread').currentThread().getId())===fixtureThread&&no===blocked?0x1000:flagMethod.call(this,no);};
   const ng=Extra.threadMedia(source,second);if(!ng||ng.size()!==2)throw Error('Hidden NG media not excluded');
  }finally{flagMethod.implementation=null;}
  const many=[];for(let n=0;n<180;n++)many.push('https://gallery.example.org/'+n+'.jpg');
  full.clear();full.add(response(many.join(' '),numbers[0]));full.add(response(third,numbers[1]));
  const manyInput=Java.use('java.util.ArrayList').$new();manyInput.add(J().$new(many[150]));
  const wide=native.e.overload('android.content.Context','java.util.List','int','java.util.List').call(native,source,manyInput,0,null);
  const wideGroup=wide.getStringArrayListExtra('haiagaru.media.links');
  if(!wideGroup||wideGroup.size()!==181||String(wideGroup.get(150))!==many[150])throw Error('Thread collection truncated at old 128 limit');
  return 'PASS native thumbnail factory: OFF preserves scope, ON orders/deduplicates across posts, foreign URL/hidden NG excluded, 181 media retained with selected index';
 }finally{
  full.clear();full.addAll(Java.cast(original,Collection));
  const edit=prefs.edit();if(had)edit.putBoolean(key,old);else edit.remove(key);edit.commit();
 }
});};

rpc.exports.launchThread=function(){return main(()=>{
 if(!threadLaunch)throw Error('Thread factory fixture missing');
 const intent=Java.use('android.content.Intent').$new(threadLaunch),group=Java.use('java.util.ArrayList').$new(),single=Java.use('java.util.ArrayList').$new();
 ['/a.png','/one.gif','/clip.mp4'].forEach(path=>group.add(J().$new(base+path)));single.add(J().$new(base+'/one.gif'));
 intent.putStringArrayListExtra('haiagaru.media.links',group).putStringArrayListExtra('links',single);
 prefs.edit().putBoolean('mediaSwipeWholeThread',true).putBoolean('mediaSwipeNavigation',false).commit();
 current().startActivity(intent);return true;
});};

rpc.exports.threadSnapshotReuse=function(){return main(()=>{
 const nav=Java.use(P+'MediaViewerNavigation'),activity=current(),System=Java.use('java.lang.System');
 const first=nav.links(activity),identity=System.identityHashCode(first),begin=Date.now();
 if(activity.getIntent().hasExtra('sharedElements'))throw Error('Old thumbnail transition leaked into a different media page');
 for(let n=0;n<100;n++)if(System.identityHashCode(nav.links(activity))!==identity)throw Error('Thread gallery rebuilt on interaction');
 return {count:first.size(),index:first.indexOf(J().$new(String(nav.current(activity)))),elapsed:Date.now()-begin};
});};

rpc.exports.nativeRouting=function(){return main(()=>{
 const keys=['gifUseNativeViewer','videoUseNativeViewer'],old=keys.map(key=>({key,had:prefs.contains(key),value:prefs.getBoolean(key,false)})),a=current(),Nav=Java.use(P+'MediaViewerNavigation'),Video=Java.use(P+'VideoViewerActivity'),Intent=Java.use('android.content.Intent'),Uri=Java.use('android.net.Uri');let count=0;
 try{
  for(const gif of [false,true])for(const video of [false,true]){
   prefs.edit().putBoolean(keys[0],gif).putBoolean(keys[1],video).commit();
   for(const item of [{index:1,gif:true,path:'/one.gif'},{index:2,gif:false,path:'/clip.mp4'}]){
    const native=item.gif?gif:video,expect=native?'jp.syoboi.a2chMate.activity.ImagesViewer2Activity':P+(item.gif?'GifViewerActivity':'VideoViewerActivity');
    const target=Nav.destination(a,urls(),item.index);if(String(target.getComponent().getClassName())!==expect)throw Error('Gallery routing mismatch');
    const original=Intent.$new('android.intent.action.VIEW',Uri.parse(base+item.path));Video.prepareExternalIntent(original);
    if(native?original.getComponent()!==null:!original.getComponent()||String(original.getComponent().getClassName())!==expect)throw Error('External boundary routing mismatch');
    count+=2;
   }
   const yt=Intent.$new('android.intent.action.VIEW',Uri.parse('https://www.youtube.com/watch?v=dQw4w9WgXcQ'));Video.prepareExternalIntent(yt);
   if(video&&yt.getComponent()!==null)throw Error('YouTube ignores native video preference');
  }
  return 'PASS '+count+' independent GIF/video gallery and native-launch routing checks, YouTube opt-out';
 }finally{const edit=prefs.edit();old.forEach(s=>s.had?edit.putBoolean(s.key,s.value):edit.remove(s.key));edit.commit();}
});};

rpc.exports.nativeDeclined=function(){return main(()=>{
 const a=current(),intent=a.getIntent(),keys=['gifUseNativeViewer','videoUseNativeViewer'],prior=keys.map(key=>({key,had:prefs.contains(key),value:prefs.getBoolean(key,false)}));
 try{
  prefs.edit().putBoolean(keys[0],true).putBoolean(keys[1],true).commit();
  for(const path of ['/one.gif','/clip.mp4']){
   const list=Java.use('java.util.ArrayList').$new();list.add(J().$new(base+path));
   const test=Java.use('android.content.Intent').$new(intent);test.setData(null);test.putStringArrayListExtra('links',list);test.putExtra.overload('java.lang.String','int').call(test,'index',0);a.setIntent(test);
   if(Java.use(P+'GifViewerActivity').redirectNative(a))throw Error('Standard media redirected to dedicated viewer');
  }
  return true;
 }finally{a.setIntent(intent);const e=prefs.edit();prior.forEach(s=>s.had?e.putBoolean(s.key,s.value):e.remove(s.key));e.commit();}
});};

// Let ChMate itself change its native page first, then turn our mixed-media
// gestures on. This detects regressions hidden by destination-only fixtures.
rpc.exports.nativeMulti=function(){return main(()=>{
 const all=Java.use('java.util.ArrayList').$new();['/a.png','/b.png','/clip.mp4','/one.gif'].forEach(path=>all.add(J().$new(base+path)));
 prefs.edit().putBoolean('gifUseNativeViewer',true).putBoolean('videoUseNativeViewer',false).putBoolean('mediaSwipeWholeThread',false).putBoolean('mediaSwipeNavigation',false).commit();
 const intent=Java.use(P+'MediaViewerNavigation').destination(current(),all,0);intent.putExtra.overload('java.lang.String','boolean').call(intent,'haiagaru.media.thread',true);
 current().startActivity(intent);return true;
});};
rpc.exports.nativeGifPage=function(){return main(()=>{
 const all=Java.use('java.util.ArrayList').$new();['/a.png','/b.png','/one.gif','/clip.mp4'].forEach(path=>all.add(J().$new(base+path)));
 prefs.edit().putBoolean('gifUseNativeViewer',true).putBoolean('mediaSwipeWholeThread',true).putBoolean('mediaSwipeNavigation',true).commit();
 const intent=Java.use(P+'MediaViewerNavigation').destination(current(),all,2);intent.putExtra.overload('java.lang.String','boolean').call(intent,'haiagaru.media.thread',true);current().startActivity(intent);return true;
});};
rpc.exports.nativeModelRegistered=function(){return main(()=>{const Nav=Java.use(P+'MediaViewerNavigation'),a=current(),models=Nav.class.getDeclaredField('MODELS');models.setAccessible(true);const map=Java.cast(models.get(null),Java.use('java.util.Map')),weak=map.get(a);if(!weak)throw Error('Native screen model registration missing');const model=Java.cast(weak,Java.use('java.lang.ref.WeakReference')).get();if(!model||String(model.getClass().getName())!=='jp.syoboi.a2chMate.activity.ImagesViewerViewModel')throw Error('Wrong native screen model');return Number(Nav.nativeIndex(a).intValue());});};
rpc.exports.nativeCounterText=function(){return main(()=>{
 const a=current(),Text=Java.use('android.widget.TextView'),Group=Java.use('android.view.ViewGroup'),labels=[];
 function walk(v){if(Text.class.isInstance(v)){const text=String(Java.cast(v,Text).getText());if(/^\d+\/\d+$/.test(text)&&v.isShown())labels.push(text);}if(Group.class.isInstance(v)){const g=Java.cast(v,Group);for(let i=0;i<g.getChildCount();i++)walk(g.getChildAt(i));}}
 walk(a.getWindow().getDecorView());return labels;
});};
rpc.exports.counterRemap=function(){return main(()=>{
 const a=current(),Nav=Java.use(P+'MediaViewerNavigation'),Text=Java.use('android.widget.TextView'),view=Text.$new(a),intent=a.getIntent();
 const original=Java.use('android.content.Intent').$new(intent),list=Java.use('java.util.ArrayList').$new(),native=Java.use('java.util.ArrayList').$new();
 ['/one.gif','/a.png','/clip.mp4','/b.png'].forEach(path=>list.add(J().$new(base+path)));['/a.png','/b.png'].forEach(path=>native.add(J().$new(base+path)));
 try{
  intent.putStringArrayListExtra('haiagaru.media.links',list).putStringArrayListExtra('links',native).putExtra.overload('java.lang.String','boolean').call(intent,'haiagaru.media.thread',true);
  Nav.setNativeCounter(view,J().$new('1/2'));if(String(view.getText())!=='2/4')throw Error('First native image should be mixed page 2/4');
  Nav.setNativeCounter(view,J().$new('2/2'));if(String(view.getText())!=='4/4')throw Error('Second native image should be mixed page 4/4');
  const single=Java.use('java.util.ArrayList').$new();single.add(J().$new(base+'/b.png'));intent.putStringArrayListExtra('links',single);Nav.setNativeCounter(view,J().$new('1/1'));if(String(view.getText())!=='4/4')throw Error('Singleton native image should show full gallery 4/4');intent.putStringArrayListExtra('links',native);
  Nav.setNativeCounter(view,J().$new('103/200'));if(String(view.getText())!=='103/200')throw Error('Unknown native page changed');
  intent.removeExtra('haiagaru.media.links');Nav.setNativeCounter(view,J().$new('1/2'));if(String(view.getText())!=='1/2')throw Error('Native-only scope changed');
  return 'PASS selected media uses full-gallery position/total, out-of-range and native-only scope preserved';
 }finally{a.setIntent(original);}
});};
rpc.exports.portrait=function(){return main(()=>{current().setRequestedOrientation(1);return true;});};
rpc.exports.letterboxPoint=function(){return main(()=>{
 const a=cast(current()),video=a.video.value,frame=a.mediaFrame.value,p=Java.array('int',[0,0]),q=Java.array('int',[0,0]);video.getLocationOnScreen(p);frame.getLocationOnScreen(q);
 const top=Number(q[1]),videoTop=Number(p[1]),gap=videoTop-top;
 if(gap<100)throw Error('Reference video has no usable vertical letterbox gap: '+gap);
 return {x:Number(q[0])+frame.getWidth()*.5,y:top+gap*.65,videoTop,frameTop:top,frameHeight:frame.getHeight(),videoHeight:video.getHeight()};
});};
rpc.exports.touchPoint=function(action,x,y){return main(()=>{const a=current();if(action===0)pressDown=Number(Java.use('android.os.SystemClock').uptimeMillis());touch(a,action,x,y,pressDown);return true;});};
rpc.exports.swipePoint=function(x,y){return main(()=>{const a=current(),t=Number(Java.use('android.os.SystemClock').uptimeMillis());touch(a,0,x,y,t);touch(a,2,x-260,y,t);touch(a,1,x-260,y,t);return true;});};
rpc.exports.playbackActions=function(){return main(()=>{const a=cast(current());return {muted:a.muted.value,speed:Number(a.playbackSpeed.value),speedCaption:String(a.speedButton.value.getText()),muteCaption:String(a.muteButton.value.getText())};});};

rpc.exports.rotationMenu=function(){return main(()=>{
 const a=current(),menu=Java.use('android.widget.PopupMenu').$new(a,a.getWindow().getDecorView()).getMenu(),Rotate=Java.use(P+'ImageViewerRotationButton');
 const key='imageViewerRotationInMenu',had=prefs.contains(key),old=prefs.getBoolean(key,true),enabledHad=prefs.contains('imageViewerRotationButton'),enabled=prefs.getBoolean('imageViewerRotationButton',true);
 try{prefs.edit().putBoolean('imageViewerRotationButton',true).putBoolean(key,true).commit();Rotate.prepareMenu(a,menu);let item=menu.findItem(0x48415255);if(!item||!item.isVisible())throw Error('Rotation menu missing');
 prefs.edit().putBoolean(key,false).commit();Rotate.prepareMenu(a,menu);if(item.isVisible())throw Error('Screen button mode still shows menu');
 prefs.edit().putBoolean(key,true).putBoolean('imageViewerRotationButton',false).commit();Rotate.prepareMenu(a,menu);if(item.isVisible())throw Error('Disabled rotation still shown');return 'PASS overflow/screen/off';
 }finally{const e=prefs.edit();had?e.putBoolean(key,old):e.remove(key);enabledHad?e.putBoolean('imageViewerRotationButton',enabled):e.remove('imageViewerRotationButton');e.commit();}
});};
rpc.exports.corners=function(){return main(()=>{
 const a=cast(current()),key1='viewerBackCorner',key2='viewerMoreCorner',keys=[key1,key2],before=keys.map(k=>({k,had:prefs.contains(k),v:prefs.getInt(k,k===key1?1:0)}));
 const cls=Java.use(P+'ViewerCornerControls'),b=Java.use('android.widget.Button').$new(a),m=Java.use('android.widget.Button').$new(a),root=Java.cast(a.findViewById(16908290),Java.use('android.view.ViewGroup'));
 const host=cls.$new(a,b,m);root.addView(host,Java.use('android.view.ViewGroup$LayoutParams').$new(-1,-1));
 try{let count=0;for(let x=0;x<4;x++)for(let y=0;y<4;y++){prefs.edit().putInt(key1,x).putInt(key2,y).commit();host.bottomInset(count%2?100:101);let p=Java.cast(b.getLayoutParams(),Java.use('android.widget.FrameLayout$LayoutParams')),q=Java.cast(m.getLayoutParams(),Java.use('android.widget.FrameLayout$LayoutParams'));
 const gs=[53,51,85,83];if(p.gravity.value!==gs[x]||q.gravity.value!==gs[y])throw Error('Wrong corner '+x+'/'+y);
 if(x===y&&p.leftMargin.value===q.leftMargin.value&&p.rightMargin.value===q.rightMargin.value)throw Error('Buttons overlap');count++;}return 'PASS '+count+' independent positions with same-corner separation';}
 finally{root.removeView(host);const e=prefs.edit();before.forEach(s=>s.had?e.putInt(s.k,s.v):e.remove(s.k));e.commit();}
});};

rpc.exports.backPriority=async function(){
 let state;
 await main(()=>{
 const a=cast(current()),p=Java.use('android.preference.PreferenceManager').getDefaultSharedPreferences(a),keys=['gesture','gestureBack','gestureLength'],old=keys.map(k=>({k,had:p.contains(k),v:k==='gesture'?p.getBoolean(k,true):p.getInt(k,0)}));
 const finish=Java.use('android.app.Activity').finish.overload();state={p,old,finish,closed:false};finish.implementation=function(){state.closed=true;};
 p.edit().putBoolean('gesture',true).putInt('gestureLength',40).putInt('gestureBack',4).commit();
 const Back=Java.use(P+'MediaViewerBackGesture'),recognizer=Back.$new(a),r=area(a),t=Number(Java.use('android.os.SystemClock').uptimeMillis()),Motion=Java.use('android.view.MotionEvent');state.recognizer=recognizer;const native=Java.cast(recognizer.recognizer.value,Java.use('o.TTVideoLandingPageActivity3'));state.native=native;
 for(const [action,x,y] of [[0,r.x,r.y],[2,r.x-200,r.y],[2,r.x-500,r.y],[1,r.x-600,r.y]]){const e=Motion.obtain(t,t+100,action,x,y,0);try{recognizer.dispatch(e);}finally{e.recycle();}}
 });
 await new Promise(resolve=>setTimeout(resolve,250));
 return main(()=>{try{if(!state.recognizer.returned())throw Error('Asynchronous Back did not finish; closed='+state.closed+' code='+field(state.native,'d').getInt(state.native)+' phase='+field(state.native,'c').getInt(state.native));return 'PASS native asynchronous Back completion';}
 finally{state.finish.implementation=null;const e=state.p.edit();state.old.forEach(s=>s.had?(s.k==='gesture'?e.putBoolean(s.k,s.v):e.putInt(s.k,s.v)):e.remove(s.k));e.commit();}});
};

rpc.exports.actualSearch=function(){return main(()=>{
 const i=Java.use('android.content.Intent').$new(app(),Java.use(P+'HissiWacchoiSearchActivity').class);
 i.putExtra('haiagaru.wacchoi.query','abcd-');i.putExtra('haiagaru.wacchoi.half','upper');
 Java.use(P+'WacchoiLongPressMenu').launchSearch(app(),i);return true;
});};

rpc.exports.threadGallery=function(){return main(()=>{const a=current(),i=Java.use('android.content.Intent').$new(a.getIntent());i.putExtra('haiagaru.media.thread',true);a.setIntent(i);prefs.edit().putBoolean('mediaSwipeWholeThread',true).commit();return true;});};
rpc.exports.upSwipe=function(direction){return main(()=>{const a=current(),r=area(a),t=Number(Java.use('android.os.SystemClock').uptimeMillis());touch(a,0,r.x,r.y,t);touch(a,2,r.x,r.y+direction*240,t);touch(a,1,r.x,r.y+direction*240,t);return true;});};

rpc.exports.rotateCheck=function(){return main(()=>{
 const a=current(),root=a.findViewById(16908290),R=Java.use(P+'ImageViewerRotationButton'),clazz=String(a.getPackageManager().getPackageInfo(a.getPackageName(),0).versionName.value).includes('191')?'o.qhbExternalSyntheticLambda0':'o.TTVideoLandingPageActivity4';
 function image(v){if(String(v.getClass().getName())===clazz)return v;if(Java.use('android.view.ViewGroup').class.isInstance(v)){const g=Java.cast(v,Java.use('android.view.ViewGroup'));for(let n=0;n<g.getChildCount();n++){const found=image(g.getChildAt(n));if(found)return found;}}return null;}
 const v=image(root);if(!v)throw Error('No image canvas');
 const key='imageViewerRotationInMenu',before={had:prefs.contains(key),v:prefs.getBoolean(key,true)},en={had:prefs.contains('imageViewerRotationButton'),v:prefs.getBoolean('imageViewerRotationButton',true)};
 try{prefs.edit().putBoolean(key,true).putBoolean('imageViewerRotationButton',true).commit();const menu=Java.use('android.widget.PopupMenu').$new(a,root).getMenu();R.prepareMenu(a,menu);const start=v.getRotation(),clicked=Java.use('jp.syoboi.a2chMate.activity.ImagesViewer2Activity').onOptionsItemSelected.call(a,menu.findItem(0x48415255));const after=v.getRotation();if(after!==(start+90)%360)throw Error('Native menu did not rotate');
 for(let n=0;n<3;n++)Java.use('jp.syoboi.a2chMate.activity.ImagesViewer2Activity').onOptionsItemSelected.call(a,menu.findItem(0x48415255));if(v.getRotation()!==start)throw Error('Four rotations did not restore');
 prefs.edit().putBoolean(key,false).commit();Java.cast(a.findViewById(0x48415254),Java.use('android.view.View')).performClick();if(v.getRotation()!==(start+90)%360)throw Error('Screen button broken');
 prefs.edit().putBoolean('imageViewerRotationButton',false).commit();Java.use('jp.syoboi.a2chMate.activity.ImagesViewer2Activity').onOptionsItemSelected.call(a,menu.findItem(0x48415255));if(v.getRotation()!==(start+90)%360)throw Error('Disabled rotation still acts');
 return {start,after,clicked,canvas:clazz,button:!!a.findViewById(0x48415254)};
 }finally{const e=prefs.edit();before.had?e.putBoolean(key,before.v):e.remove(key);en.had?e.putBoolean('imageViewerRotationButton',en.v):e.remove('imageViewerRotationButton');e.commit();}
});};

rpc.exports.nativeMenu=function(){return main(()=>{current().openOptionsMenu();return true;});};

rpc.exports.openXGif=function(enabled){return main(()=>{
 prefs.edit().putBoolean('videoAutoplay',!enabled).putBoolean('gifAutoplay',!enabled).putBoolean('xMp4GifAutoplay',enabled).commit();
 const a=current(),Intent=Java.use('android.content.Intent'),i=Intent.$new(a,Java.use(P+'VideoViewerActivity').class);i.setData(Java.use('android.net.Uri').parse('https://video.twimg.com/tweet_video/G51IpxIXsAAZGU0.mp4'));a.startActivity(i);return true;
});};
rpc.exports.xGifState=function(){return main(()=>{
 const a=Java.cast(current(),Java.use(P+'VideoViewerActivity')),fallback=a.gifFallback.value;
 function invoke(o,name){const obj=Java.cast(o,Java.use('java.lang.Object'));return obj.getClass().getMethod(name,Java.array('java.lang.Class',[])).invoke(obj,Java.array('java.lang.Object',[]));}
 const player=fallback!==null?fallback:a.video.value;
 return {prepared:a.prepared.value,playing:String(invoke(player,'isPlaying'))==='true',wanted:a.playWhenReady.value,loop:fallback!==null?true:a.mediaPlayer.value!==null&&Java.cast(a.mediaPlayer.value,Java.use('android.media.MediaPlayer')).isLooping(),position:Number(invoke(player,'getCurrentPosition'))};
});};
let inlineFixture;
rpc.exports.inlineSetup=function(){return main(()=>{
 const a=current(),Group=Java.use('android.view.ViewGroup'),root=Java.cast(a.findViewById(16908290),Group),Direct=Java.use(P+'DirectBodySelection');
 function find(v){if(Direct.isBody(v)&&v.isShown()&&v.getGlobalVisibleRect(Java.use('android.graphics.Rect').$new()))return Java.cast(v,Java.use('android.widget.TextView'));if(Group.class.isInstance(v)){let g=Java.cast(v,Group);for(let n=0;n<g.getChildCount();n++){let child=find(g.getChildAt(n));if(child)return child;}}return null;}
 const body=find(root);if(!body)throw Error('Open thread body required');inlineFixture={body,root,original:body.getText(),visibility:body.getVisibility()};
 body.setText.overload('java.lang.CharSequence','android.widget.TextView$BufferType').call(body,Java.use('android.text.SpannableString').$new(J().$new('GIF https://fixture.example/one.gif')),Java.use('android.widget.TextView$BufferType').SPANNABLE.value);prefs.edit().putBoolean('inlineGifAutoplay',true).commit();const loader=Java.use(P+'GifMediaLoader').load;loader.implementation=function(context,url,limit,force,cancelled){return loader.call(this,context,J().$new(base+'/one.gif'),limit,force,cancelled);};Java.use(P+'InlineGifPlayback').onBound(body);return {type:String(body.getClass().getName()),spanned:Java.use('android.text.Spanned').class.isInstance(body.getText()),body:Direct.isBody(body),tag:body.getTag(0x48694731)!==null,text:String(body.getText())};
});};
rpc.exports.inlineState=function(){return main(()=>{const slot=inlineFixture.body.getTag(0x48694731);if(!slot)return {slot:false};const r=field(slot,'installed').getBoolean(slot),drawable=field(slot,'drawable').get(slot),player=field(slot,'player').get(slot);return {text:String(inlineFixture.body.getText()),expected:String(field(slot,'text').get(slot)),slot:true,installed:r,closed:field(slot,'closed').getBoolean(slot),animated:drawable!==null,playing:drawable!==null?Java.use('android.graphics.drawable.Animatable').class.isInstance(drawable)&&Java.cast(drawable,Java.use('android.graphics.drawable.Animatable')).isRunning():player!==null&&String(Java.cast(player,Java.use('java.lang.Object')).getClass().getMethod('isPlaying',Java.array('java.lang.Class',[])).invoke(player,Java.array('java.lang.Object',[])))==='true'};});};
rpc.exports.inlineX=function(){return main(()=>{inlineFixture.body.setVisibility(0);inlineFixture.body.setText(Java.use('android.text.SpannableString').$new(J().$new('https://x.com/Z3RO_GRAVITY_/status/1989826585013424339')));Java.use(P+'InlineGifPlayback').onBound(inlineFixture.body);return true;});};
rpc.exports.inlineHide=function(){return main(()=>{inlineFixture.body.setVisibility(4);return true;});};
rpc.exports.inlineCleanup=function(){return main(()=>{Java.use(P+'GifMediaLoader').load.implementation=null;Java.use(P+'VideoViewerSettings').inlineNetworkAllowed.implementation=null;if(inlineFixture){inlineFixture.body.setText(inlineFixture.original);inlineFixture.body.setVisibility(inlineFixture.visibility);inlineFixture=null;}return true;});};

rpc.exports.inlineLimits=function(){return main(()=>{
 const S=Java.use(P+'VideoViewerSettings'),keys=['inlineGifLimit','inlineGifMaxMb'],old=keys.map(k=>({k,had:prefs.contains(k),v:prefs.getInt(k,k==='inlineGifLimit'?2:8)}));
 try{for(const [limit,mb] of [[1,1],[2,8],[8,64]]){prefs.edit().putInt(keys[0],limit).putInt(keys[1],mb).commit();if(S.inlineLimit(app())!==limit||S.inlineMaxMb(app())!==mb)throw Error('Limits not applied');}return 'PASS user limits minimum/default/maximum';}
 finally{const e=prefs.edit();old.forEach(s=>s.had?e.putInt(s.k,s.v):e.remove(s.k));e.commit();}
});};

rpc.exports.inlineBounds=function(){return main(()=>{
 const body=inlineFixture.body,slot=body.getTag(0x48694731),texture=Java.cast(field(slot,'texture').get(slot),Java.use('android.view.View')),host=Java.cast(field(slot,'overlayHost').get(slot),Java.use('android.view.ViewGroup'));
 if(!host.equals(body.getParent()))throw Error('Overlay is not row-local');
 const point=Java.array('int',[0,0]),hp=Java.array('int',[0,0]),visible=Java.use('android.graphics.Rect').$new();body.getLocationOnScreen(point);host.getLocationOnScreen(hp);body.getGlobalVisibleRect(visible);
 const clip=texture.getClipBounds(),left=Number(hp[0])+texture.getLeft(),top=Number(hp[1])+texture.getTop();
 if(texture.isShown()&&clip!==null&&(left+clip.left.value<visible.left.value||top+clip.top.value<visible.top.value||left+clip.right.value>visible.right.value||top+clip.bottom.value>visible.bottom.value))throw Error('Playback escapes body visible bounds');
 const aspect=field(slot,'videoAspect').getFloat(slot),matrix=Java.use('android.graphics.Matrix').$new(),values=Java.array('float',[0,0,0,0,0,0,0,0,0]);Java.cast(texture,Java.use('android.view.TextureView')).getTransform(matrix);matrix.getValues(values);if(aspect>0&&Math.abs(texture.getWidth()*values[0]/(texture.getHeight()*values[4])-aspect)>.02)throw Error('Aspect stretched');return {rowLocal:true,left,top,clip:String(clip),body:String(visible),shown:texture.isShown(),aspect};
});};
rpc.exports.inlineNetwork=function(allowed){return main(()=>{const Settings=Java.use(P+'VideoViewerSettings');Settings.inlineNetworkAllowed.implementation=function(context){return allowed;};return true;});};
