// Isolated emulator only. Temporary in-memory fixture rows are restored in the same main-thread call.
let threadLaunch;
const originalSetup=rpc.exports.setup;
rpc.exports.setup=function(value){return originalSetup(value).then(result=>main(()=>{
 for(const key of ['gifUseNativeViewer','videoUseNativeViewer','mediaSwipeWholeThread']){
  saved.push({key,had:prefs.contains(key),value:prefs.getBoolean(key,false)});prefs.edit().putBoolean(key,false).commit();
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
