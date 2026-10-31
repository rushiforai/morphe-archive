rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 const P='app.morphe.extension.chmate.',Q=Java.use(P+'ExtraQuickFilters'),H=Java.use(P+'Haiagaru'),app=Java.use('android.app.ActivityThread').currentApplication();
 if(!String(app.getPackageName()).endsWith('.settingsfix191')){reject('191 verification app only');return;}
 const pref=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='urlVideoFetchMode',had=pref.contains(key),old=pref.getInt(key,1);let a,saved;const results=[];
 function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
 try{
  const fragment=Q.visibleFragment(H.toolbarActivity(null));if(!fragment)throw Error('visible thread required');a=Q.adapter(fragment);saved=Array.from(Q.selected(a));
  for(let i=0;i<7;i++)if(Q.selected(a)[i])Q.toggle.overload('java.lang.Object','int','boolean').call(Q,a,i,true);
  Q.toggle.overload('java.lang.Object','int','boolean').call(Q,a,3,true);
  const source=Java.cast(Java.use(P+'PopularReplies').fullList(field(a,'K')),Java.use('java.util.List')),expected=new Set();
  for(let i=0;i<source.size();i++){const raw=source.get(i);if(!Q.response(raw))continue;const r=Java.cast(raw,Java.use('o.processAdDisplayErrorPostbackForUserError'));for(const url of r.d())if(Q.videoFilterMatch(String(url),null)){expected.add(Number(r.o.value));break;}}
  if(!expected.size)throw Error('direct video fixtures missing');
  for(const mode of [0,3]){pref.edit().putInt(key,mode).commit();Java.cast(a,Java.use('o.m9ExternalSyntheticLambda1')).c.overload('boolean').call(Java.cast(a,Java.use('o.m9ExternalSyntheticLambda1')),true);const rows=Java.cast(field(a,'z'),Java.use('java.util.List')),present=new Set();for(let i=0;i<rows.size();i++){const raw=Q.rowResponse(rows.get(i));if(raw)present.add(Q.number(raw));}const missing=[...expected].filter(n=>!present.has(n));if(missing.length)throw Error('direct video results missing '+missing.length);Q.collect(a,source);const videoCount=Java.use('java.lang.reflect.Array').getInt(field(Q.state(a),'counts'),3);if(videoCount<expected.size)throw Error('video filter count missing');results.push({mode,directVideos:expected.size,videoCount,displayedRows:rows.size(),allDirectVideosRetained:true});}
  resolve(results);
 }catch(e){console.log('TEST_ERROR '+String(e.stack||e));reject(Error(String(e.stack||e)));}finally{
  const e=pref.edit();if(had)e.putInt(key,old);else e.remove(key);e.commit();if(a&&saved){for(let i=0;i<7;i++)if(Q.selected(a)[i]!==saved[i])Q.toggle.overload('java.lang.Object','int','boolean').call(Q,a,i,true);Q.rebuild(a);}
 }
})));}};
