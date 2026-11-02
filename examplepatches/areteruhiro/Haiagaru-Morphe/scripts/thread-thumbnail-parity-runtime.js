// Run only against an isolated emulator package with the cached Part4 thread open.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(!pkg.includes('.haiagaru.'))throw Error('isolated package required');
 const Nav=Java.use('app.morphe.extension.chmate.MediaViewerNavigation'),Extra=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),Activity=Java.use('android.app.Activity'),List=Java.use('java.util.List'),Array=Java.use('java.util.ArrayList'),StringClass=Java.use('java.lang.String'),Intent=Java.use('android.content.Intent');
 const f=Extra.class.getDeclaredField('OWNERS');f.setAccessible(true);const refs=Java.cast(f.get(null),List);let source;
 for(let i=0;i<refs.size();i++){const raw=Java.cast(refs.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!raw)continue;const owner=Java.cast(raw,Java.use(String(raw.getClass().getName()))),root=owner.getView();if(root&&root.isShown()&&root.hasWindowFocus())source=Java.cast(owner.getActivity(),Activity);}
 if(!source)throw Error('visible source thread required');
 const pref=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='mediaSwipeWholeThread',had=pref.contains(key),old=pref.getBoolean(key,false),checks=[];
 function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 try{
  pref.edit().putBoolean(key,true).commit();
  const selected='https://i.imgur.com/FPbIGqD.png',all=Extra.threadMedia(source,selected);check(all!==null&&all.size()>3,'source includes multiple responses');
  const version=String(source.getPackageManager().getPackageInfo(pkg,0).versionName.value),type=version.includes('191')?'jp.syoboi.a2chMate.activity.ImagesViewer2Activity':version.includes('226')?'jp.syoboi.a2chMate.activity.ImagesViewer2Activity$read':'jp.syoboi.a2chMate.activity.ImagesViewer2Activity$RemoteActionCompatParcelizer';
  const methods=Java.use(type).class.getDeclaredMethods();let factory;
  for(const m of methods){const p=m.getParameterTypes();if(String(m.getName())!=='haiagaruNativeMediaIntent'&&String(m.getReturnType().getName())==='android.content.Intent'&&p.length>=3&&String(p[0].getName())==='android.content.Context'&&String(p[2].getName())==='int')factory=m;}
  if(!factory)throw Error('native intent factory missing');factory.setAccessible(true);
  const input=Array.$new();input.add(StringClass.$new(selected));
  function create(){const args=[source,input,Java.use('java.lang.Integer').valueOf(0)];if(factory.getParameterTypes().length===4)args.push(null);return Java.cast(factory.invoke(null,Java.array('java.lang.Object',args)),Intent);}
  const on=create(),gallery=on.getStringArrayListExtra('haiagaru.media.links');check(gallery!==null&&gallery.equals(all),'native factory carries complete ordered snapshot');
  check(on.getBooleanExtra('haiagaru.media.thread',false),'native factory marks whole thread');check(on.getIntExtra('index',-1)===0&&on.getStringArrayListExtra('links').equals(input),'native selection remains independent of whole-thread index');
  const viewer=Java.use('android.content.ContextWrapper').$new(source);const wrapped=Intent.$new();wrapped.putStringArrayListExtra('links',input);Nav.prepareNativeIntent(wrapped,viewer);check(wrapped.getStringArrayListExtra('haiagaru.media.links').equals(all),'wrapped context uses same gallery');
  pref.edit().putBoolean(key,false).commit();check(!Nav.openThreadThumbnail(source,selected),'OFF leaves direct thumbnail to native handler');
  const off=create();check(!off.hasExtra('haiagaru.media.links')&&!off.hasExtra('haiagaru.media.thread')&&off.getStringArrayListExtra('links').equals(input),'OFF keeps native factory scope');
  pref.edit().putBoolean(key,true).commit();check(Nav.openThreadThumbnail(source,selected),'direct thumbnail route succeeds');
  setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
   try{let viewer;Java.choose('jp.syoboi.a2chMate.activity.ImagesViewer2Activity',{onMatch(a){if(!a.isFinishing()&&a.getWindow().getDecorView().hasWindowFocus())viewer=Java.retain(a);},onComplete(){}});
    if(!viewer)throw Error('thumbnail viewer not opened');
    try{const incoming=viewer.getIntent();check(incoming.getStringArrayListExtra('haiagaru.media.links').equals(all),'opened viewer carries complete factory snapshot');check(incoming.getStringArrayListExtra('links').equals(input)&&incoming.getIntExtra('index',-1)===0&&incoming.getData()===null,'opened viewer uses legacy native launch shape');check(String(Nav.current(viewer))===selected,'opened viewer selects clicked image');resolve({version,checks:checks.length,passed:checks});}finally{viewer.finish();}
   }catch(e){console.log('THUMBNAIL_VIEWER_ERROR '+String(e.stack||e));reject(Error(String(e.stack||e)));}
  })),2000);
 }finally{const edit=pref.edit();had?edit.putBoolean(key,old):edit.remove(key);edit.commit();}
}catch(e){console.log('THUMBNAIL_PARITY_ERROR '+String(e.stack||e));reject(Error(String(e.stack||e)));}})));}};
