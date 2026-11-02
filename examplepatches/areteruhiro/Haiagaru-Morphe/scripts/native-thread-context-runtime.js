// Read-only native context and Intent preparation. No posting, NG registration or sending.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());if(!pkg.includes('.haiagaru.'))throw Error('isolated app required');
 const version=String(app.getPackageManager().getPackageInfo(pkg,0).versionName.value),Extra=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),Context=Java.use('app.morphe.extension.chmate.NativeThreadContext'),Search=Java.use('app.morphe.extension.chmate.HissiWacchoiSearchController');
 const f=Extra.class.getDeclaredField('OWNERS');f.setAccessible(true);const refs=Java.cast(f.get(null),Java.use('java.util.List'));let fragment,activity;
 for(let i=0;i<refs.size();i++){const raw=Java.cast(refs.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!raw)continue;const owner=Java.cast(raw,Java.use(String(raw.getClass().getName()))),root=owner.getView();if(root&&root.isShown()&&root.hasWindowFocus()){fragment=owner;activity=Java.cast(owner.getActivity(),Java.use('android.app.Activity'));}}
 if(!fragment)throw Error('visible thread required');const checks=[];
 function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 function field(obj,name){const x=obj.getClass().getDeclaredField(name);x.setAccessible(true);return x.get(obj);}
 const Frame=Java.use('android.widget.FrameLayout'),ListView=Java.use('android.widget.ListView'),filters=Java.use('app.morphe.extension.chmate.FilterPosition'),unattached=Frame.$new(activity),hidden=ListView.$new(activity);hidden.setVisibility(8);unattached.addView(hidden);
 check(filters.findList(unattached)===null,'active-list lookup ignores a hidden list');check(filters.findListForBinding(unattached).equals(hidden),'binding lookup can attach before first layout');
 const board=Context.board(fragment,version),url=String(Context.url(board,version,1)),uri=Java.use('android.net.Uri').parse(url),segments=uri.getPathSegments();check(board!==null&&segments.size()>=4,'native board resolves current thread');
 check(String(segments.get(0))==='test'&&String(segments.get(1))==='read.cgi','native read.cgi shape retained');
 for(const upper of [false,true]){const intent=Search.toolbarIntent(activity,fragment,upper);check(String(intent.getStringExtra('haiagaru.wacchoi.host'))===String(uri.getHost()),'toolbar host '+upper);check(String(intent.getStringExtra('haiagaru.wacchoi.board'))===String(segments.get(2)),'toolbar board '+upper);check(String(intent.getStringExtra('app.morphe.extension.chmate.WACCHOI_HALF'))===(upper?'upper':'lower'),'toolbar half '+upper);}
 const plain=Search.toolbarIntent(activity,null,true);check(!plain.hasExtra('haiagaru.wacchoi.host')&&!plain.hasExtra('haiagaru.wacchoi.board'),'generic search has no unrelated board');
 const Position=Java.use('app.morphe.extension.chmate.ReadingPosition'),sessions=Position.class.getDeclaredField('SESSIONS');sessions.setAccessible(true);const session=Java.cast(sessions.get(null),Java.use('java.util.Map')).get(fragment);check(session!==null,'position observer attached (enabled='+Java.use('app.morphe.extension.chmate.FeatureSwitches').enabled('readingPositionRecovery',true)+', sessions='+Java.cast(sessions.get(null),Java.use('java.util.Map')).size()+', fragment='+fragment.getClass().getName()+')');
 const method=session.getClass().getDeclaredMethod('anchor',Java.array('java.lang.Class',[]));method.setAccessible(true);const anchor=method.invoke(session,Java.array('java.lang.Object',[]));check(anchor!==null,'visible response anchor resolved');
 check(String(field(anchor,'url'))===url.replace(/\/1\/?$/,'/'),'position anchor uses same thread URL');
 const shared=Java.use('app.morphe.extension.chmate.ProgrammableNgController').captureSharedReportSource(activity),rows=Java.cast(shared[0],Java.use('java.util.List'));check(rows.size()>0,'shared-NG source contains displayed thread responses');
 check(String(shared[1]).includes('/'+String(segments.get(2))+'/'),'shared-NG source board agrees with toolbar');
 resolve({version,checks:checks.length,passed:checks});
}catch(e){console.log('THREAD_CONTEXT_ERROR '+String(e.stack||e));reject(Error(String(e.stack||e)));}})));}};
