// Synthetic rows in the real visible adapter only; restore all fields/preferences. No DB writes.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.settingsfix191')throw Error('191 verification only');
 Java.openClassFile('/data/local/tmp/history-drop-regression-v4.dex').load();
 const Test=Java.use('app.morphe.extension.chmate.DroppedThreadsAndroidTest');
 const B=Java.use('app.morphe.extension.chmate.BrowsingHistory'),H=Java.use('app.morphe.extension.chmate.HiddenDroppedThreads');
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),keys=['hideDroppedHomeThreads','groupBrowsingHistoryByBoard'];
 const saved=keys.map(k=>({k,had:p.contains(k),value:p.getBoolean(k,false)}));
 const f=B.class.getDeclaredField('legacyFragments');f.setAccessible(true);
 const list=Java.cast(f.get(null),Java.use('java.util.List'));let fragment=null;
 function field(o,k){const v=o.getClass().getDeclaredField(k);v.setAccessible(true);return v;}
 for(let i=list.size()-1;i>=0;i--){let item=list.get(i);if(field(item,'mode').getInt(item)!==100)continue;fragment=Java.cast(field(item,'fragment').get(item),Java.use('java.lang.ref.WeakReference')).get();if(fragment)break;}
 if(!fragment)throw Error('Open native HOME history first');fragment=Java.retain(fragment);
 Java.scheduleOnMainThread(function(){let adapter=null,originals=[];try{
  adapter=Java.cast(field(fragment,'e').get(fragment),Java.use('o.r8lambdaXZREaGE4vvLAA2ZOtsKBd3knAPA'));
  for(const key of ['g','i','j'])originals.push({key,value:field(adapter,key).get(adapter)});
  const board=Test.board(app),type=Java.use('o.onAdDisplayed$setIcon').class;
  const drop=Test.row(type,board,1999000211,1,true),live=Test.row(type,board,1999000212,0,true);
  const Heading=Java.use('o.onAdDisplayed$write'),rows=Java.use('java.util.ArrayList').$new();
  rows.add(Heading.$new('1分前'));rows.add(drop);rows.add(Heading.$new('2分前'));rows.add(live);rows.add(Heading.$new('3分前'));rows.add(drop);
  const W=Java.use('o.onAdDisplayed$setBackgroundResource');
  for(const on of [false,true,false,true]){
   p.edit().putBoolean(keys[0],on).putBoolean(keys[1],false).commit();
   const wrapper=W.$new(rows);for(const key of ['g','i','j'])field(adapter,key).set(adapter,wrapper);
   B.applyLegacy(fragment,100);adapter.notifyDataSetChanged();
   const count=adapter.getCount();if(count!==(on?2:6))throw Error('visible count '+count+' ON='+on);
   const current=Java.cast(field(adapter,'j').get(adapter),Java.use('java.util.List'));
   let dropped=0;for(let i=0;i<current.size();i++)if(H.dropped(current.get(i)))dropped++;
   if(dropped!==(on?0:2))throw Error('visible DAT rows '+dropped);
   console.log('PASS actual visible HOME103 ON='+on+' rows='+count+' DAT='+dropped);
  }
 }catch(e){console.log('FAIL '+e.stack);}finally{
  const edit=p.edit();saved.forEach(s=>s.had?edit.putBoolean(s.k,s.value):edit.remove(s.k));edit.commit();
  if(adapter){originals.forEach(o=>field(adapter,o.key).set(adapter,o.value));adapter.notifyDataSetChanged();}
  console.log('VISIBLE_HISTORY_AND_SETTINGS_RESTORED');
 }});
});
