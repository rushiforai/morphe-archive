const P='app.morphe.extension.chmate.';let owner,source,prefs,saved;
function cast(o){return Java.cast(o,Java.use(String(o.getClass().getName())));}
function fld(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
function main(fn){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}})));}
rpc.exports.inspect=function(){return main(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();Java.classFactory.loader=app.getClassLoader();prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
 const Extra=Java.use(P+'ExtraQuickFilters'),F=Extra.class.getDeclaredField('OWNERS');F.setAccessible(true);const refs=Java.cast(F.get(null),Java.use('java.util.List')),result=[];
 for(let n=0;n<refs.size();n++)try{const raw=Java.cast(refs.get(n),Java.use('java.lang.ref.WeakReference')).get();if(!raw)continue;const frag=cast(raw),root=frag.getView();const entry={type:String(raw.getClass().getName()),shown:root&&root.isShown(),focus:root&&root.hasWindowFocus()};result.push(entry);if(!entry.shown)continue;
 const a=Extra.adapter(raw),index=Extra.index(a),legacy=String(a.getClass().getName())==='o.m9ExternalSyntheticLambda1',middle=String(a.getClass().getName())==='o.listener';entry.adapter=String(a.getClass().getName());const rows=Java.cast(Java.use(P+'PopularReplies').fullList(fld(a,legacy?'K':middle?'J':'o')),Java.use('java.util.List'));entry.rows=rows.size();entry.media=[];
 for(let k=0;k<rows.size();k++){const row=cast(rows.get(k));if(!Extra.response(row))continue;const links=(legacy||middle)?row.d():row.haiagaruPatrolAttachments();if(links&&links.length){const no=Extra.number(row);const group=Extra.threadMedia(frag.getActivity(),links[0]);entry.media.push({number:no,links:Array.from(links).map(String),thread:group?group.size():null});if(entry.media.length>=8)break;}}
 owner=Java.retain(frag);source=Java.retain(frag.getActivity());
 }catch(e){result.push({error:String(e)});}
 return {prefs:{thread:prefs.getBoolean('mediaSwipeWholeThread',false),enabled:prefs.getBoolean('videoViewerEnabled',true)},owners:result};
});};
rpc.exports.jump=function(number){return main(()=>Java.use(P+'FilterPosition').jumpToResponse(owner,number,0));};
rpc.exports.views=function(){return main(()=>{
 const root=source.getWindow().getDecorView(),Group=Java.use('android.view.ViewGroup'),result=[];
 function walk(v){if(!v.isShown())return;const pos=Java.array('int',[0,0]);v.getLocationOnScreen(pos);if(v.isClickable()||String(v.getClass().getName()).includes('Image'))result.push({type:String(v.getClass().getName()),x:pos[0],y:pos[1],w:v.getWidth(),h:v.getHeight(),click:v.isClickable(),tag:v.getTag()?String(v.getTag()):null});if(Group.class.isInstance(v)){const g=Java.cast(v,Group);for(let i=0;i<g.getChildCount();i++)walk(g.getChildAt(i));}}walk(root);return result;
});};
rpc.exports.enable=function(){return main(()=>{saved={had:prefs.contains('mediaSwipeWholeThread'),value:prefs.getBoolean('mediaSwipeWholeThread',false)};prefs.edit().putBoolean('mediaSwipeWholeThread',true).commit();return true;});};
rpc.exports.trace=function(){return main(()=>{
 const N=Java.use(P+'MediaViewerNavigation');N.prepareNativeIntent.implementation=function(intent,context){const before=intent.getStringArrayListExtra('links');console.log('FACTORY_SOURCE '+context.getClass().getName()+' native='+before+'\n'+Java.use('android.util.Log').getStackTraceString(Java.use('java.lang.Exception').$new()));N.prepareNativeIntent.call(this,intent,context);console.log('FACTORY_RESULT '+intent.getStringArrayListExtra('haiagaru.media.links')+' thread='+intent.getBooleanExtra('haiagaru.media.thread',false));};return true;
});};
rpc.exports.cleanup=function(){return main(()=>{if(saved){const e=prefs.edit();if(saved.had)e.putBoolean('mediaSwipeWholeThread',saved.value);else e.remove('mediaSwipeWholeThread');e.commit();}return true;});};
rpc.exports.viewer=function(){return main(()=>{let result=[];Java.choose('jp.syoboi.a2chMate.activity.ImagesViewer2Activity',{onMatch(a){if(!a.isFinishing()){const i=a.getIntent(),all=i.getStringArrayListExtra('haiagaru.media.links');result.push({native:String(i.getStringArrayListExtra('links')),gallery:all?all.size():null,thread:i.getBooleanExtra('haiagaru.media.thread',false)});}},onComplete(){}});return result;});};

rpc.exports.currentViewer=function(){return main(()=>{
 const Nav=Java.use(P+'MediaViewerNavigation'),result=[];
 for(const type of ['jp.syoboi.a2chMate.activity.ImagesViewer2Activity',P+'GifViewerActivity',P+'VideoViewerActivity'])Java.choose(type,{onMatch(a){if(!a.isFinishing()&&a.getWindow().getDecorView().hasWindowFocus()){
  const i=a.getIntent(),all=Nav.links(a),selected=Nav.current(a),labels=[],Group=Java.use('android.view.ViewGroup'),Text=Java.use('android.widget.TextView');
  function walk(v){if(Text.class.isInstance(v)&&v.isShown()){const text=String(Java.cast(v,Text).getText());if(/^\d+\/\d+$/.test(text))labels.push(text);}if(Group.class.isInstance(v)){const g=Java.cast(v,Group);for(let k=0;k<g.getChildCount();k++)walk(g.getChildAt(k));}}walk(a.getWindow().getDecorView());
  result.push({type,url:selected===null?null:String(selected),count:all.size(),position:all.indexOf(selected)+1,thread:i.getBooleanExtra('haiagaru.media.thread',false),labels});
 }},onComplete(){}});return result[0]||null;
});};
