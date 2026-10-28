const P='app.morphe.extension.chmate.',J=()=>Java.use('java.lang.String');let prefs,saved,cache,oldCache,chars,oldChars,chosen,subject,app;
function field(type,name){const f=type.class.getDeclaredField(name);f.setAccessible(true);return f;}
function perform(fn,main){return new Promise((resolve,reject)=>Java.perform(()=>{const run=()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}};if(main)Java.scheduleOnMainThread(run);else run();}));}
function current(){let found;Java.choose('android.app.Activity',{onMatch(a){if(a.getWindow().getDecorView().hasWindowFocus())found=Java.retain(a);},onComplete(){}});if(!found)throw Error('No foreground Activity');return found;}
function nativeParser(text){const version=String(app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName.value),type=version.includes('191')?'o.getSdkVersion':version.includes('226')?'o.afterHandshake':'o.AXE3',provider=Java.use(type).$new();const query='GlobalTitleFixtureUnique';if(version.includes('242'))provider.c(query);else provider.b(query);
 if(version.includes('191')){const list=Java.use('jp.syoboi.a2chMate.data.BBSThreadList').$new();provider.d(text,list);return Java.cast(list,Java.use('java.util.List'));}
 return Java.cast(version.includes('226')?provider.e(text):provider.b(text),Java.use('java.util.List'));
}
rpc.exports.setup=function(){return perform(()=>{
 app=Java.use('android.app.ActivityThread').currentApplication();if(!/haiagaru\.(resumefix|settingsfix)(191|226|242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);saved=['globalTitleSearchExternalBoards','globalTitleSearchBoards'].map(key=>({key,had:prefs.contains(key),value:key.endsWith('Boards')&&!key.endsWith('ExternalBoards')?String(prefs.getString(key,'')):prefs.getBoolean(key,false)}));
 const Global=Java.use(P+'GlobalTitleSearch'),rows=Global.candidates(app);if(rows.isEmpty())throw Error('No registered external boards available');
 chosen=Java.retain(Java.cast(rows.get(0),Java.use(P+'GlobalTitleSearch$Board')));
 for(let n=0;n<rows.size();n++){const b=Java.cast(rows.get(n),Java.use(P+'GlobalTitleSearch$Board'));if(String(b.url.value).includes('liveedge')){chosen=Java.retain(b);break;}}
 cache=Java.cast(field(Global,'CACHE').get(null),Java.use('java.util.Map'));oldCache=cache.get(chosen.url.value);if(oldCache)oldCache=Java.retain(oldCache);chars=field(Global,'cachedCharacters');oldChars=chars.getInt(null);
 const Cached=Java.use(P+'GlobalTitleSearch$Cached');subject='1792624518.dat<>GlobalTitleFixtureUnique 外部板 (103)\n1792624519.dat<>別のタイトル (4)\n';cache.put(chosen.url.value,Cached.$new(subject));chars.setInt(null,oldChars+subject.length);
 return {candidates:rows.size(),selected:String(chosen.url.value),pink:Global.validSelection('["https://aoi.bbspink.com/pinkplus/"]')};
});};
rpc.exports.tests=function(){return perform(()=>{
 const results=[];function check(value,label){if(!value)throw Error(label);results.push(label);}
 const G=Java.use(P+'GlobalTitleSearch'),url=String(chosen.url.value),base='ff2ch\t\nGlobalTitleFixtureUnique 標準\t7\thttps://egg.5ch.io/test/read.cgi/android/1792500780/\n';
 prefs.edit().putBoolean('globalTitleSearchExternalBoards',false).putString('globalTitleSearchBoards',JSON.stringify([url])).commit();check(nativeParser(base).size()===1,'OFF retains original native search results');
 prefs.edit().putBoolean('globalTitleSearchExternalBoards',true).putString('globalTitleSearchBoards','[]').commit();check(nativeParser(base).size()===1,'empty selected-board set adds no requests/results');
 prefs.edit().putString('globalTitleSearchBoards',JSON.stringify([url])).commit();const list=nativeParser(base);check(list.size()===2,'selected external result merged through real native parser');
 const row=list.get(1);let count=false;for(const f of row.getClass().getDeclaredFields()){if(String(f.getType().getName())==='int'){f.setAccessible(true);if(f.getInt(row)===103)count=true;}}check(count,'external reply count 103 is retained by native result row');
 const thread=String(Java.use(P+'GlobalTitleSearchRules').threadUrl(url,'1792624518'));
 check(nativeParser(base+'GlobalTitleFixtureUnique 外部板\t103\t'+thread+'\n').size()===2,'same native/external URL is displayed only once');
 check(!G.validSelection('["file:///private"]')&&!G.validSelection('not-json')&&G.validSelection('[]')&&G.validSelection(''),'selection import validates URLs and all/none states');
 return {checks:results.length,passed:results};
});};
rpc.exports.show=function(){return perform(()=>{Java.use(P+'GlobalTitleSearchBoards').show.overload('android.app.Activity').call(Java.use(P+'GlobalTitleSearchBoards'),current());return true;},true);};
rpc.exports.cleanup=function(){return perform(()=>{
 if(prefs&&saved){const e=prefs.edit();saved.forEach(s=>{if(!s.had)e.remove(s.key);else if(typeof s.value==='boolean')e.putBoolean(s.key,s.value);else e.putString(s.key,s.value);});e.commit();}
 if(cache&&chosen){if(oldCache)cache.put(chosen.url.value,oldCache);else cache.remove(chosen.url.value);chars.setInt(null,oldChars);}
 Java.choose(P+'HaiagaruDialog',{onMatch(d){if(d.isShowing())d.dismiss();},onComplete(){}});return true;
},true);};
rpc.exports.uiTests=function(){return perform(()=>{
 let dialog;Java.choose(P+'HaiagaruDialog',{onMatch(d){if(d.isShowing())dialog=Java.retain(d);},onComplete(){}});if(!dialog)throw Error('Board chooser missing');
 const specField=dialog.getClass().getDeclaredField('spec');specField.setAccessible(true);const spec=Java.cast(specField.get(dialog),Java.use(P+'HaiagaruDialog$Builder'));
 const viewField=spec.getClass().getDeclaredField('view');viewField.setAccessible(true);const root=viewField.get(spec),Group=Java.use('android.view.ViewGroup'),Text=Java.use('android.widget.TextView'),Edit=Java.use('android.widget.EditText'),List=Java.use('android.widget.ListView');let search,list,all,none;
 function walk(v){if(Edit.class.isInstance(v))search=Java.cast(v,Edit);if(List.class.isInstance(v))list=Java.cast(v,List);if(Text.class.isInstance(v)){const text=String(Java.cast(v,Text).getText());if(text==='表示中をすべて選択')all=v;if(text==='表示中を解除')none=v;}if(Group.class.isInstance(v)){const g=Java.cast(v,Group);for(let i=0;i<g.getChildCount();i++)walk(g.getChildAt(i));}}
 walk(root);if(!search||!list||!all||!none)throw Error('Chooser controls missing');
 const checks=[];function check(v,m){if(!v)throw Error(m);checks.push(m);}
 Java.use('android.widget.TextView').setText.overload('java.lang.CharSequence').call(search,J().$new('__no_such_board__'));check(list.getAdapter().getCount()===0,'board text filter excludes unmatched entries');
 Java.use('android.widget.TextView').setText.overload('java.lang.CharSequence').call(search,J().$new(String(chosen.url.value)));check(list.getAdapter().getCount()===1&&list.isItemChecked(0),'URL filter preserves saved selection');
 Java.cast(none,Java.use('android.view.View')).performClick();check(!list.isItemChecked(0),'clear visible boards updates the checked state');
 Java.use('android.widget.TextView').setText.overload('java.lang.CharSequence').call(search,J().$new(''));Java.use('android.widget.TextView').setText.overload('java.lang.CharSequence').call(search,J().$new(String(chosen.url.value)));check(!list.isItemChecked(0),'selection is retained when the text filter changes');
 Java.cast(all,Java.use('android.view.View')).performClick();check(list.isItemChecked(0),'select visible boards checks the filtered item');
 dialog.getButton(-1).performClick();const selection=Java.use(P+'GlobalTitleSearch').selected(prefs);check(selection!==null&&selection.contains(chosen.url.value),'real save action persists selected board URLs');
 return {checks:checks.length,passed:checks};
},true);};
rpc.exports.live=function(){return perform(()=>{
 const G=Java.use(P+'GlobalTitleSearch'),Job=Java.use(P+'GlobalTitleSearch$Job'),job=Job.$new('live-read-only-probe');
 const text=String(G.fetch(job,chosen.url.value));job.cancel();
 return {board:String(chosen.url.value),characters:text.length,matchingLines:text.split('\n').filter(line=>/\d{9,12}\.(dat<>|cgi,)/.test(line)).length};
});};
rpc.exports.uiQuery=function(){return perform(()=>{
 const G=Java.use(P+'GlobalTitleSearch'),Cached=Java.use(P+'GlobalTitleSearch$Cached');
 cache.put(chosen.url.value,Cached.$new('1792624518.dat<>Haiagaru 外部板テスト (103)\n'));
 prefs.edit().putBoolean('globalTitleSearchExternalBoards',true).putString('globalTitleSearchBoards',JSON.stringify([String(chosen.url.value)])).commit();return true;
});};
rpc.exports.liveUncached=function(){return perform(()=>{
 cache.remove(chosen.url.value);const Job=Java.use(P+'GlobalTitleSearch$Job'),job=Job.$new('live-read-only-probe');
 try{const text=String(Java.use(P+'GlobalTitleSearch').fetch(job,chosen.url.value));return {board:String(chosen.url.value),characters:text.length,matchingLines:text.split('\n').filter(line=>/\d{9,12}\.(dat<>|cgi,)/.test(line)).length};}finally{job.cancel();}
});};
