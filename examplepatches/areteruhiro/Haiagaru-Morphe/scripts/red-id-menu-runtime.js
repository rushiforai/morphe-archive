rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
const app=Java.use('android.app.ActivityThread').currentApplication(),R=Java.use('app.morphe.extension.chmate.RedIdAutoNg'),P=Java.use('app.morphe.extension.chmate.PosterHighlight');if(!String(app.getPackageName()).includes('.haiagaru.')){reject('test app required');return;}
const pref=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='autoNgRedIdExclusions',had=pref.contains(key),old=pref.getString(key,'');let activity;
for(const name of ['jp.syoboi.a2chMate.activity.TabletHomeActivity','jp.syoboi.a2chMate.activity.HomeActivity'])Java.choose(name,{onMatch(a){if(!a.isFinishing())activity=Java.retain(a);},onComplete(){}});if(!activity){reject('home required');return;}
Java.scheduleOnMainThread(()=>{try{
const menu=Java.use('android.widget.PopupMenu').$new(activity,activity.getWindow().getDecorView()).getMenu();
const item=menu.add.overload('int','int','int','java.lang.CharSequence').call(menu,0,0x7e484b02,0,'fixture');
const f=R.class.getDeclaredField('MENU_IDS');f.setAccessible(true);const targets=Java.cast(f.get(null),Java.use('java.util.Map'));targets.put(item,Java.use('java.lang.String').$new('FixtureExclusion00'));
pref.edit().putString(key,'ExistingFixture00').commit();if(!P.handle(item))throw Error('handler bypassed');let result=String(pref.getString(key,''));if(result!=='ExistingFixture00\nFixtureExclusion00')throw Error('literal append mismatch');P.handle(item);if(String(pref.getString(key,''))!==result)throw Error('duplicate added');if(!P.handle(item))throw Error('repeat handler');resolve({literalAdd:true,preservedExisting:true,duplicateIgnored:true,normalNgUntouched:true});
}catch(e){console.log('MENU_TEST_ERROR '+String(e.stack||e));reject('menu test failed');}finally{const e=pref.edit();if(had)e.putString(key,old);else e.remove(key);e.commit();}});
}));}};