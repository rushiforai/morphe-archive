// Verification package only. Intercept just this checker controller before external loading.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Verification app required');
 Java.classFactory.loader=app.getClassLoader();
 const C=Java.use('app.morphe.extension.chmate.HissiMenuController'),I=Java.use('android.content.Intent'),R=Java.use('java.lang.RuntimeException');
 let active=false,route=null,checks=0;
 const policy=Java.use('app.morphe.extension.chmate.FullWacchoiProvider');const orig=policy.full;policy.full.implementation=function(q){const result=orig.call(this,q);if(active)console.log('TOKEN '+q+' => '+result);return result;};
 C.openHissiWacchoiSearch.implementation=function(){if(active){route='hissi';return true;}return this.openHissiWacchoiSearch();};
 C.createViewerToolbar.implementation=function(w){if(active){route='kyodemo';throw R.$new('PROVIDER_FIXTURE_STOP');}return this.createViewerToolbar(w);};
 const Noop=Java.registerClass({name:'app.morphe.extension.chmate.ProviderFixtureClose',implements:[Java.use('java.lang.Runnable')],methods:{run(){}}});
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),choices=app.getSharedPreferences('haiagaru_checker_choice',0);
 const keys=['wacchoiFullSearchProvider','hissiCheckerMode','dedicatedViewerEnabled'];const old=keys.map(k=>({k,had:p.contains(k),v:p.getAll().get(k)}));
 const ck='wacchoi/egg.5ch.io/android',hadChoice=choices.contains(ck),oldChoice=choices.getBoolean(ck,false);
 let a;
 Java.choose('jp.syoboi.a2chMate.activity.TabletHomeActivity',{onMatch(x){if(!x.isFinishing())a=Java.retain(x);},onComplete(){Java.scheduleOnMainThread(function(){
 try{
  if(!a)throw Error('Tablet Activity missing');
  for(let mode=0;mode<4;mode++)for(let previous of [false,true])for(let idMode of [1,2]){
   p.edit().putInt(keys[0],mode).putInt(keys[1],idMode).putBoolean(keys[2],true).commit();choices.edit().putBoolean(ck,previous).commit();
   const i=I.$new();i.putExtra.overload('java.lang.String','boolean').call(i,'haiagaru.wacchoi.search',true);
   for(let [k,v] of [['query','名無しさん＠お腹いっぱい。(ﾜｯﾁｮｲ bed4-6Zun)'],['host','egg.5ch.io'],['board','android']])i.putExtra.overload('java.lang.String','java.lang.String').call(i,'haiagaru.wacchoi.'+k,v);
   const controller=C.$new(a,i,true,Noop.$new(),null);active=true;route=null;console.log('INPUT '+i.toUri(0));
   try{controller.create(null);}catch(e){if(String(e).indexOf('PROVIDER_FIXTURE_STOP')<0)throw e;}
   finally{console.log('RESOLVED '+controller.getIntent().toUri(0));active=false;controller.close();}
   const expected=mode===2||(mode===3&&previous)?'kyodemo':'hissi';if(route!==expected)throw Error('mode='+mode+' previous='+previous+' ID='+idMode+' expected='+expected+' actual='+route);
   checks++;console.log('PASS mode='+mode+' previous='+previous+' ID='+idMode+' => '+route);
  }
  console.log('PROVIDER_CONTROLLER_COMPLETE '+checks+' cases; no search request');
 }catch(e){console.log('FAIL '+e.stack);}
 finally{active=false;const edit=p.edit();for(let s of old){if(!s.had)edit.remove(s.k);else if(s.k==='dedicatedViewerEnabled')edit.putBoolean(s.k,Java.cast(s.v,Java.use('java.lang.Boolean')).booleanValue());else edit.putInt(s.k,Java.cast(s.v,Java.use('java.lang.Integer')).intValue());}edit.commit();const e=choices.edit();if(hadChoice)e.putBoolean(ck,oldChoice);else e.remove(ck);e.commit();console.log('PREFERENCES_RESTORED');}
 });}});
});
