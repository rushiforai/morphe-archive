rpc.exports.test=()=>new Promise(resolve=>Java.perform(()=>{
 let file,prefs,had,previous;
 try{
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());if(!/\.haiagaru\.reporter(?:191|226|242)$/.test(pkg))throw Error('Isolated reporter only');
 const old=pkg.endsWith('191'),middle=pkg.endsWith('226');
 const File=Java.use('java.io.File');file=File.$new(app.getCacheDir(),'empty-edge-draft-fixture-'+Date.now()+'.json');const path=String(file.getAbsolutePath());if(file.exists())throw Error('Fixture exists');
 prefs=Java.use('android.preference.PreferenceManager').getDefaultSharedPreferences(app);had=prefs.contains('postDataListCount');previous=prefs.getInt('postDataListCount',100);prefs.edit().putInt('postDataListCount',100).commit();
 const Post=Java.use(old?'o.n7':middle?'o.setBorderWidth':'jp.syoboi.a2chMate.postdata.PostData'),Store=Java.use(old?'o.n9':middle?'o.getTileModeX':'o.PackageSignatureVerifier');
 const Wrapped=(old||middle)?Java.registerClass({name:'app.haiagaru.test.DraftContext'+Date.now(),superClass:Java.use('android.content.ContextWrapper'),methods:{$init:[{returnType:'void',argumentTypes:['android.content.Context'],implementation:function(c){this.$super.$init(c);}}],getFileStreamPath:[{returnType:'java.io.File',argumentTypes:['java.lang.String'],implementation:function(name){if(String(name)!=='postDataList.json')throw Error('Unexpected file');return File.$new(path);}}]}}):null;
 const store=(old||middle)?Store.$new.overload('android.content.Context','int').call(Store,Wrapped.$new(app),100):Store.$new(file);
 const f=Store.class.getDeclaredField(old?'d':middle?'b':'e');f.setAccessible(true);const list=Java.cast(f.get(store),Java.use('java.util.ArrayList'));
 const write=old?store.d.overload('o.n7'):middle?store.c.overload('o.setBorderWidth'):store.b.overload('jp.syoboi.a2chMate.postdata.PostData');
 const row=(url,body,posted)=>{if(old){const data=Post.$new();data.l.value=url;data.b.value=body;data.f.value=1234;data.j.value=posted;return data;}return Post.$new(url,'fixture','','',body,'',1234,posted,'','','');};
 const edge='https://bbs.eddibb.cc/test/read.cgi/liveedge/1999999901/';
 let checks=0;const check=(ok,label)=>{if(!ok)throw Error(label+' (rows='+list.size()+')');checks++;};const save=(url,body,posted=0)=>write.call(store,row(url,body,posted));
 save(edge,'');
 let guard;try{guard=Java.use('app.morphe.extension.chmate.EmptyPostDrafts');}catch(e){resolve({baseline:true,blankDraftRows:list.size(),fixtureOnly:true});return;}
 check(list.size()===0,'empty Edge reply not created');
 save(edge,'入力した本文');check(list.size()===1,'nonempty draft saved');save(edge,'');check(list.size()===0,'cleared submitted draft removed');
 save(edge,'送信済み',5678);check(list.size()===1,'sent history saved');save(edge,'');check(list.size()===1,'empty save preserves sent history');
 const other='https://bbs.eddibb.cc/test/read.cgi/liveedge/1999999902/';save(other,'別スレの下書き');save(edge,'');check(list.size()===2,'other thread draft preserved');
 save(edge,' ');check(list.size()===3,'intentional whitespace preserved');save(edge,'');check(list.size()===2,'only matching unsent draft removed');
 save('https://bbs.eddibb.cc/liveedge/','');check(list.size()===3,'new thread draft unaffected');
 save('https://egg.5ch.io/test/read.cgi/android/1999999903/','');check(list.size()===4,'other boards unaffected');
 save('https://bbs.eddibb.net/test/read.cgi/liveedge/1999999904/','');check(list.size()===4,'Edge net alias handled');
 save('https://bbs.eddibb.org/test/read.cgi/liveedge/1999999905/','');check(list.size()===4,'Edge org alias handled');
 for(let i=0;i<5;i++)save(edge,'');check(list.size()===4,'repeated onPause-equivalent saves stay empty');
 save(edge,'次の本文🪽');check(list.size()===5,'next composed body preserved');
 resolve({passed:checks,fixtureOnly:true,publicPosts:0,realHistoryChanged:false});
 }catch(e){resolve({error:String(e)});}finally{if(prefs){const edit=prefs.edit();if(had)edit.putInt('postDataListCount',previous);else edit.remove('postDataListCount');edit.commit();}if(file)file.delete();}
}));
