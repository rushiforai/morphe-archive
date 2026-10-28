// Isolated app, synthetic rows only, no search execution or saved DAT changes.
rpc.exports.verify=function(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();Java.use('app.morphe.extension.chmate.Haiagaru').shouldHideAds(app);
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='cachedSearchCreatedOrder',had=prefs.contains(key),old=prefs.getInt(key,0);let count=0;
 try{
  const Adapter=Java.use('o.m8'),Row=Java.use('o.mg'),Order=Java.use('app.morphe.extension.chmate.CachedSearchOrder'),adapter=Adapter.$new(),field=adapter.getClass().getDeclaredField('c');field.setAccessible(true);
  const list=Java.cast(field.get(adapter),Java.use('java.util.List'));
  const a=Row.$new('old','https://example.org/test/read.cgi/a/1500000000/',Java.use('java.lang.String').$new('body'),0),b=Row.$new('new','https://example.org/test/read.cgi/a/1700000000/',Java.use('java.lang.String').$new('body'),0);
  list.add(a);list.add(b);prefs.edit().putInt(key,1).commit();Order.beforeLegacyNotify(adapter);
  if(!list.get(0).equals(b)||!adapter.getItem(0).equals(b))throw Error('191 native clicks differ from display');count++;
  prefs.edit().putInt(key,2).commit();Order.applyLegacy(adapter);if(!list.get(0).equals(a))throw Error('oldest first');count++;
  prefs.edit().putInt(key,0).commit();Order.applyLegacy(adapter);if(!list.get(0).equals(a)||!list.get(1).equals(b))throw Error('standard native order not restored');count++;
  list.clear();list.add(b);prefs.edit().putInt(key,1).commit();Order.beforeLegacyNotify(adapter);
  prefs.edit().putInt(key,0).commit();Order.applyLegacy(adapter);if(list.size()!==1||!list.get(0).equals(b))throw Error('stale results after new search');count++;
  resolve('PASS '+count+' native191 adapter chronological order/click identity/standard restore/new results');
 }catch(e){reject(Error(String(e.stack||e)));}finally{const edit=prefs.edit();if(had)edit.putInt(key,old);else edit.remove(key);edit.commit();}
}));};
