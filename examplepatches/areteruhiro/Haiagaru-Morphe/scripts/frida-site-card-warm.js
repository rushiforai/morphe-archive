// No remote lookup: fixture URL and memory-only metadata, restored preferences/cache.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!String(app.getPackageName()).endsWith('.resumefix242'))throw Error('Test package only');
 Java.scheduleOnMainThread(()=>{const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),keys=['siteCardsEnabled','siteCardImages'],saved=keys.map(k=>({k,had:prefs.contains(k),v:prefs.getBoolean(k,false)}));
 let cache=null;const url='https://example.invalid/haiagaru-warm-fixture';let checks=0;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 try{
  prefs.edit().putBoolean(keys[0],true).putBoolean(keys[1],false).commit();
  const Cards=Java.use('app.morphe.extension.chmate.SiteCards'),Entry=Java.use('app.morphe.extension.chmate.SiteCards$Entry'),Data=Java.use('app.morphe.extension.chmate.SiteCardMetadata$Data');
  const f=Cards.class.getDeclaredField('CACHE');f.setAccessible(true);cache=Java.cast(f.get(null),Java.use('java.util.Map'));
  const entry=Entry.$new();entry.data.value=Data.$new(url,'WARM-CARD-FIXTURE','cached description','','fixture');entry.expiry.value=Date.now()+60000;entry.imageTried.value=true;cache.put(url,entry);
  const activity=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null),view=Java.use('android.widget.TextView').$new(activity);
  const text=Java.use('android.text.SpannableString').$new(Java.use('java.lang.String').$new('>>1 '+url));view.setText(text);
  check(!view.isShown(),'row not attached before native measurement');
  Cards.onBound(view);check(String(view.getText()).includes('WARM-CARD-FIXTURE'),'cached card appears before shown/measurement');
  const once=String(view.getText());Cards.onBound(view);check(String(view.getText())===once,'rebind does not append duplicate cards');
  check(String(Cards.strip(view.getText()))==='>>1 '+url,'original anchor text preserved');
  prefs.edit().putBoolean(keys[0],false).commit();Cards.onBound(view);check(String(view.getText())==='>>1 '+url,'OFF restores native body without card');
  console.log('SITE_WARM_PASS '+checks);
 }catch(e){console.log('FAIL '+e.stack);}finally{if(cache)cache.remove(url);const e=prefs.edit();saved.forEach(s=>{if(s.had)e.putBoolean(s.k,s.v);else e.remove(s.k);});e.commit();console.log('SITE_FIXTURE_RESTORED');}
 });
});
