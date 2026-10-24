// Open the existing settings form only. Never save domains or connect to any domain.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.settingsfix191')throw Error('191 verification only');
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),F=Java.use('app.morphe.extension.chmate.ExtraQuickFilters');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='bottomQuickFilterPanel';
 const had=prefs.contains(key),old=prefs.getBoolean(key,false),Text=Java.use('android.widget.TextView'),Group=Java.use('android.view.ViewGroup');
 let host,dialog,count=0;
 function text(o){const J=Java.use('java.lang.String');return String(J.valueOf.overload('java.lang.Object').call(J,o));}
 function check(ok,label){if(!ok)throw Error(label);count++;console.log('PASS '+label);}
 function find(view,predicate){if(predicate(view))return view;if(Group.class.isInstance(view)){const g=Java.cast(view,Group);for(let i=0;i<g.getChildCount();i++){const result=find(g.getChildAt(i),predicate);if(result)return result;}}return null;}
 Java.scheduleOnMainThread(()=>{try{
  host=Java.retain(H.toolbarActivity(null));check(!!host,'verification activity available');
  const floating=v=>Text.class.isInstance(v)&&text(Java.cast(v,Text).getText())==='フィルター ▴';
  prefs.edit().putBoolean(key,true).commit();F.updateOptions(host);
  check(!find(host.getWindow().getDecorView(),floating),'ON adds no floating filter button, including hidden Views');
  prefs.edit().putBoolean(key,false).commit();F.updateOptions(host);
  check(!find(host.getWindow().getDecorView(),floating),'OFF adds no floating filter button');
  const root=H.settingsCategory(host,'MEDIA');
  const button=find(root,v=>Java.use('android.widget.Button').class.isInstance(v)&&text(Java.cast(v,Text).getText())==='VPN取得の対象ドメイン');
  check(!!button,'real domain setting action available');button.performClick();
 }catch(e){console.log('FAIL '+e.stack);}finally{
  const edit=prefs.edit();if(had)edit.putBoolean(key,old);else edit.remove(key);edit.commit();if(host)F.updateOptions(host);console.log('PREFERENCES_RESTORED');
 }});
 setTimeout(()=>Java.perform(()=>Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{
  onMatch(value){try{if(value.getWindow().getDecorView().isAttachedToWindow()&&value.getWindow().getDecorView().isShown())dialog=Java.retain(value);}catch(ignored){}},
  onComplete(){check(!!dialog,'real domain dialog window attached');console.log('READY_VPN_HELP_SCREEN checks='+count);}
 })),2000);
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(dialog)dialog.dismiss();console.log('VPN_HELP_NO_FLOATING_COMPLETE checks='+count);})),50000);
});
