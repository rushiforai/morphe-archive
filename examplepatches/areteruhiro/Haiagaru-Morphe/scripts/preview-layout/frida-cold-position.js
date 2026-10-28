// Emulator-only position regression: native list and original persistent anchor
// are restored by cleanup. No posting, Cookie access, or DAT writes.
const P='app.morphe.extension.chmate.';
function main(fn){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}})));}
function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f;}
function cast(o){return Java.cast(o,Java.use(String(o.getClass().getName())));}
let session,owner,prefs,prior,originalFile,anchorFile,oldNumber,oldOffset;
function find(){const R=Java.use(P+'ReadingPosition'),f=R.class.getDeclaredField('SESSIONS');f.setAccessible(true);const map=Java.cast(f.get(null),Java.use('java.util.Map')),items=map.values().toArray();for(const item of items){const s=cast(item),list=s.list.value;if(list.isShown()&&list.hasWindowFocus()){session=Java.retain(s);owner=Java.retain(s.fragment.value.get());return;}}throw Error('No focused native reading-position session');}
function read(file){try{return String(Java.use('java.lang.String').$new(Java.use('android.util.AtomicFile').$new(file).readFully(),'UTF-8'));}catch(e){return null;}}
function write(file,text){const storage=Java.use('android.util.AtomicFile').$new(file),out=storage.startWrite();try{out.write(Java.use('java.lang.String').$new(text).getBytes('UTF-8'));storage.finishWrite(out);}catch(e){storage.failWrite(out);throw e;}}
rpc.exports.prepare=function(){return main(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!String(app.getPackageName()).includes('resumefix242'))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();find();const a=cast(session.anchor());oldNumber=a.number.value;oldOffset=a.offset.value;
 anchorFile=Java.retain(session.file(a.key.value));originalFile=read(anchorFile);
 prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
 prior=['xPostPreviewEnabled','siteCardsEnabled'].map(key=>({key,had:prefs.contains(key),value:prefs.getBoolean(key,false)}));
 const edit=prefs.edit();prior.forEach(s=>edit.putBoolean(s.key,true));edit.commit();
 const h=Java.use(P+'Haiagaru');
 return {number:oldNumber,offset:oldOffset,file:String(anchorFile.getAbsolutePath()),x:h.xPostPreviewEnabled(),site:h.siteCardsEnabled()};
});};
rpc.exports.inspect=function(){return main(()=>{find();const a=cast(session.anchor());return {number:a.number.value,offset:a.offset.value,key:String(a.key.value),explicit:a.explicit.value,saved:read(session.file(a.key.value)),inspected:String(session.inspectedKey.value),cold:session.coldPreview.value!==null};});};
rpc.exports.simulate=function(){return main(()=>{
 const a=cast(session.anchor()),target=103;
 if(!Java.use(P+'FilterPosition').jumpToResponse(owner,target,-17))throw Error('Target response missing');
 return target;
});};
rpc.exports.saveAndReset=function(){return main(()=>{
 session.save();const a=cast(session.anchor());if(a.number.value<20)throw Error('Native target did not settle');
 const data=JSON.parse(read(anchorFile));data.process='cold-process-fixture';write(anchorFile,JSON.stringify(data));
 Java.use(P+'FilterPosition').jumpToResponse(owner,1,0);
 session.inspectedKey.value=null;return data;
});};
rpc.exports.cleanup=function(){return main(()=>{
 if(owner)Java.use(P+'FilterPosition').jumpToResponse(owner,oldNumber,oldOffset);
 if(session){session.coldPreview.value=null;session.inspectedKey.value=cast(session.anchor()).key.value;}
 if(prefs&&prior){const edit=prefs.edit();prior.forEach(s=>s.had?edit.putBoolean(s.key,s.value):edit.remove(s.key));edit.commit();}
 if(anchorFile){if(originalFile===null)Java.use('android.util.AtomicFile').$new(anchorFile).delete();else write(anchorFile,originalFile);}
 return true;
});};
rpc.exports.checkpoint=function(){return main(()=>{session.save();return {target:JSON.parse(read(anchorFile)),original:originalFile,path:String(anchorFile.getAbsolutePath()),number:oldNumber,offset:oldOffset,preferences:prior};});};
rpc.exports.restoreState=function(data){return main(()=>{find();const saved=JSON.parse(data),app=Java.use('android.app.ActivityThread').currentApplication(),config=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),edit=config.edit();for(const s of saved.preferences)s.had?edit.putBoolean(s.key,s.value):edit.remove(s.key);edit.commit();Java.use(P+'FilterPosition').jumpToResponse(session.fragment.value.get(),saved.number,saved.offset);session.coldPreview.value=null;session.inspectedKey.value=cast(session.anchor()).key.value;const file=Java.use('java.io.File').$new(saved.path);if(saved.original===null)Java.use('android.util.AtomicFile').$new(file).delete();else write(file,saved.original);return true;});};
