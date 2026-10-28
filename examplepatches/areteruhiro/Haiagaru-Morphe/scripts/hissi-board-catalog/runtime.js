const P='app.morphe.extension.chmate.';let cat,oldSnapshot,oldUntil,controller,original,release,primaryFuture,prefs,hadEnabled,oldEnabled;
function f(o,n){for(let c=o.getClass();c;c=c.getSuperclass())try{const field=c.getDeclaredField(n);field.setAccessible(true);return field;}catch(e){}throw Error('Field '+n);}
function cf(type,n){const field=type.class.getDeclaredField(n);field.setAccessible(true);return field;}
function main(fn){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}})));}
function cast(o){return Java.cast(o,Java.use(String(o.getClass().getName())));}
function read(o,n){return f(o,n).get(o);}
function bool(o,n,v){f(o,n).setBoolean(o,v);}
rpc.exports.seed=function(){return main(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();Java.classFactory.loader=app.getClassLoader();cat=Java.use(P+'HissiBoardCatalog');oldSnapshot=Java.retain(cf(cat,'snapshot').get(null));oldUntil=cf(cat,'until').getLong(null);
 const list=Java.use('java.util.ArrayList').$new(),Entry=Java.use(P+'HissiBoardCatalog$Entry');list.add(Entry.$new('android','Android'));list.add(Entry.$new('software','Software'));cf(cat,'snapshot').set(null,list);cf(cat,'until').setLong(null,Number(Java.use('android.os.SystemClock').elapsedRealtime())+120000);
 prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);hadEnabled=prefs.contains('wacchoiSearchEnabled');oldEnabled=prefs.getBoolean('wacchoiSearchEnabled',true);prefs.edit().putBoolean('wacchoiSearchEnabled',true).commit();return true;
});};
rpc.exports.prepare=function(){return main(()=>{
 Java.choose(P+'NativeToolTabs$SearchContent',{onMatch(content){const view=Java.cast(read(content,'view'),Java.use('android.view.View')),raw=read(content,'controller');if(view.isShown()&&view.hasWindowFocus()&&raw&&String(raw.getClass().getName())===P+'HissiWacchoiSearchController')controller=Java.retain(cast(raw));},onComplete(){}});
 if(!controller)Java.choose(P+'HissiWacchoiSearchController',{onMatch(a){const host=Java.cast(read(a,'host'),Java.use('android.app.Activity'));if(host.getWindow().getDecorView().hasWindowFocus())controller=Java.retain(a);},onComplete(){}});
 if(!controller)throw Error('No visible post-search controller');const a=controller;if(a.stopButton.value.isEnabled())throw Error('A real scan is running; test refused');
 const Collection=Java.use('java.util.Collection'),List=Java.use('java.util.ArrayList');
 original={boards:Java.retain(List.$new(Java.cast(read(a,'availableBoards'),Collection))),selected:Java.retain(List.$new(Java.cast(read(a,'selectedBoards'),Collection))),source:a.searchSource.value,status:String(a.boardStatus.value.getText()),filter:String(a.boardFilter.value.getText()),error:a.boardStatus.value.getError()===null?null:String(a.boardStatus.value.getError()),flags:{}};
 for(const key of ['boardsRequested','boardListLoading','restoredBoards','restoreAllBoards'])original.flags[key]=f(a,key).getBoolean(a);
 const selected=Java.cast(read(a,'selectedBoards'),Java.use('java.util.Set'));selected.clear();selected.add(Java.use('java.lang.String').$new('android'));Java.cast(read(a,'availableBoards'),Java.use('java.util.List')).clear();bool(a,'boardsRequested',false);bool(a,'boardListLoading',false);bool(a,'restoredBoards',true);bool(a,'restoreAllBoards',false);a.searchSource.value=0;Java.use('android.widget.TextView').setText.overload('java.lang.CharSequence').call(a.boardFilter.value,Java.use('java.lang.String').$new(''));
 const app=Java.use('android.app.ActivityThread').currentApplication(),loader=Java.use('dalvik.system.DexClassLoader').$new('/data/local/tmp/haiagaru-hissi-catalog-queue.dex',String(app.getCodeCacheDir().getAbsolutePath()),null,app.getClassLoader());
 const Block=Java.ClassFactory.get(loader).use('app.morphe.fixture.HissiCatalogQueueFixture'),block=Block.$new();release=Java.retain(Block.RELEASE.value);
 const executor=Java.cast(read(a,'executor'),Java.use('java.util.concurrent.ExecutorService'));const submitted=executor.submit.overload('java.lang.Runnable').call(executor,block);if(submitted)primaryFuture=Java.retain(submitted);
 const begin=Date.now();a.loadBoardsOnDemand();const elapsed=Date.now()-begin;
 if(a.boardChoices.value.getChildCount()!==2||f(a,'boardListLoading').getBoolean(a)||elapsed>250)throw Error('Catalog waits behind scan or misses warm cache: '+elapsed);
 a.searchUiChanged();return {elapsed,rows:a.boardChoices.value.getChildCount(),selected:Java.cast(read(a,'selectedBoards'),Java.use('java.util.Set')).size()};
});};
rpc.exports.selected=function(){return main(()=>{const set=Java.cast(read(controller,'selectedBoards'),Java.use('java.util.Set'));return {software:set.contains(Java.use('java.lang.String').$new('software')),count:set.size()};});};
rpc.exports.clearRace=function(){return main(()=>{
 bool(controller,'restoreAllBoards',true);const actions=Java.cast(controller.boardSection.value.getChildAt(2),Java.use('android.view.ViewGroup'));actions.getChildAt(2).performClick();
 controller.applyBoardCatalog(Java.cast(cf(cat,'snapshot').get(null),Java.use('java.util.List')));
 if(Java.cast(read(controller,'selectedBoards'),Java.use('java.util.Set')).size()!==0||f(controller,'restoreAllBoards').getBoolean(controller))throw Error('Late catalog overwrites user clear');return true;
});};
rpc.exports.cleanup=function(){return main(()=>{
 if(release)release.countDown();if(primaryFuture)primaryFuture.cancel(true);
 if(cat){cf(cat,'snapshot').set(null,oldSnapshot);cf(cat,'until').setLong(null,oldUntil);}
 if(controller&&original){const Collection=Java.use('java.util.Collection');const rows=Java.cast(read(controller,'availableBoards'),Java.use('java.util.List'));rows.clear();rows.addAll(Java.cast(original.boards,Collection));const selected=Java.cast(read(controller,'selectedBoards'),Java.use('java.util.Set'));selected.clear();selected.addAll(Java.cast(original.selected,Collection));controller.searchSource.value=original.source;for(const key in original.flags)bool(controller,key,original.flags[key]);Java.use('android.widget.TextView').setText.overload('java.lang.CharSequence').call(controller.boardFilter.value,Java.use('java.lang.String').$new(original.filter));controller.renderBoardChoices();controller.boardStatus.value.setError(original.error===null?null:Java.use('java.lang.String').$new(original.error));Java.use('android.widget.TextView').setText.overload('java.lang.CharSequence').call(controller.boardStatus.value,Java.use('java.lang.String').$new(original.status));controller.searchUiChanged();}
 if(prefs){const e=prefs.edit();if(hadEnabled)e.putBoolean('wacchoiSearchEnabled',oldEnabled);else e.remove('wacchoiSearchEnabled');e.commit();}return true;
});};
