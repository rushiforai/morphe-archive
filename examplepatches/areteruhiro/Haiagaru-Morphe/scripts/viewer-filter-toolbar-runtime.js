// Isolated verification packages only. Restore preferences; no NG values are logged.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 const P='app.morphe.extension.chmate.',app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg)){reject('verification package required');return;}
 const H=Java.use(P+'Haiagaru'),Q=Java.use(P+'ExtraQuickFilters'),pref=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='urlVideoFetchMode',had=pref.contains(key),old=pref.getInt(key,1),checks=[];
 function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 try{
  H.shouldHideAds(app);
  const media=['https://i.imgur.com/EivpeMG.mp4','https://video.twimg.com/example/movie.mp4?tag=29','https://example.org/a.webm'];
  for(const mode of [0,3]){pref.edit().putInt(key,mode).commit();check(H.mediaAutoFetchMode()===mode,'fetch mode '+mode);
   for(const url of media){let native=null;if(pkg.endsWith('191'))native=Java.use('o.r0ExternalSyntheticLambda3').b(url);check(Q.videoFilterMatch(url,native),'direct video classified in mode '+mode);}
   check(!Q.videoFilterMatch('https://example.org/image.png',null),'image remains image '+mode);
   check(!Q.videoFilterMatch('https://example.org/page',null),'page remains link '+mode);
   check(Q.videoFilterMatch('https://youtube.com/watch?v=fixture',Java.use('java.lang.Object').$new()),'native video result retained '+mode);
  }
  const Icons=Java.use(P+'ToolbarIcons');check(Icons.index(0x7e000009)===8&&Icons.index(0x7e00000a)===9,'old icon indices retained; new action appended');
  const res=app.getResources(),id=res.getIdentifier('haiagaru_auto_ng_exclusions','drawable',pkg);check(id!==0&&res.getDrawable.overload('int').call(res,id)!==null,'new toolbar drawable loadable');
  const activity=H.toolbarActivity(null);check(activity!==null,'foreground activity available');
  let models=[];
  if(pkg.endsWith('191')){const fragment=Q.visibleFragment(activity);if(fragment)models.push(Java.cast(fragment,Java.use('o.pa')).j());}
  else {const catalog=Java.use(pkg.endsWith('226')?'o.AdSlot':'o.zzaB');for(const method of catalog.class.getDeclaredMethods())if(String(method.getReturnType().getName())==='jp.syoboi.a2chMate.feature.toolbar.ToolbarDefault'&&method.getParameterTypes().length===0){method.setAccessible(true);models.push(method.invoke(null,Java.array('java.lang.Object',[])));}}
  let found=false;for(const model of models){if(Java.use('java.util.List').class.isInstance(model)&&H.containsToolbarChoice(Java.cast(model,Java.use('java.util.List')),0x7e00000a))found=true;for(const f of model.getClass().getDeclaredFields())if(Java.use('java.util.List').class.isAssignableFrom(f.getType())){f.setAccessible(true);if(H.containsToolbarChoice(Java.cast(f.get(model),Java.use('java.util.List')),0x7e00000a))found=true;}}
  check(found,'native toolbar catalog includes exclusions action');
  const before=String(pref.getString('autoNgRedIdExclusions',''));check(H.handleEdgeArchiveToolbarClick(null,0x7e00000a),'toolbar dispatch handled');
  let dialogs=[];Java.choose(P+'HaiagaruDialog',{onMatch(d){if(d.isShowing()&&String(d.getWindow().getDecorView().getContext().getClass().getName()).length)dialogs.push(Java.retain(d));},onComplete(){}});
  check(dialogs.length>0,'exclusions editor opened');for(const d of dialogs)d.dismiss();check(String(pref.getString('autoNgRedIdExclusions',''))===before,'cancel preserves exclusions');
  if(pkg.endsWith('242')){const F=Java.use('o.VN10'),f=F.$new();check(!f.isAdded(),'detached fixture');F.G(f);checks.push('detached animation callback no exception');}
  resolve({checks:checks.length,passed:checks});
 }catch(e){console.log('TEST_ERROR '+String(e.stack||e));reject(Error(String(e.stack||e)));}finally{const e=pref.edit();if(had)e.putInt(key,old);else e.remove(key);e.commit();}
})));}};
