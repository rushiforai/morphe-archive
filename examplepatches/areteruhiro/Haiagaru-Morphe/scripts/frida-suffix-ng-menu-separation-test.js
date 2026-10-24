// Independent name/body-menu settings. No NG records are created.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg))throw Error('Verification app only');
 Java.classFactory.loader=app.getClassLoader();
 const S=Java.use('app.morphe.extension.chmate.ResponseMenuSettings'),prefs=app.getSharedPreferences('haiagaru_response_actions',0),old=prefs.getAll();
 const keys=['wacchoiLongPressSuffixNg','visibility.76','responseVisibility.76'];let checks=0;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 Java.scheduleOnMainThread(()=>{try{
  prefs.edit().remove(keys[0]).remove(keys[2]).putInt(keys[1],2).commit();
  const defaultName=S.nameMenuVisible(76);check(!S.visible(76),'old hidden body preference preserved');
  prefs.edit().putInt(keys[1],1).commit();check(S.nameMenuVisible(76)===defaultName,'unset name toggle is independent of body visibility');
  for(const name of [false,true])for(const mode of [1,2]){
   prefs.edit().putBoolean(keys[0],name).putInt(keys[2],mode).commit();
   check(S.nameMenuVisible(76)===name,'name menu '+name+' / body mode '+mode);
   check(S.visible(76)===(mode===1),'body mode '+mode+' / name '+name);
  }
  prefs.edit().remove(keys[2]).putInt(keys[1],2).putBoolean(keys[0],true).commit();
  check(!S.visible(76)&&S.nameMenuVisible(76),'new name toggle does not discard legacy body override');
  let activity;const records=Java.use('android.app.ActivityThread').currentActivityThread().mActivities.value.values().toArray();
  for(let i=0;i<records.length;i++){const f=records[i].getClass().getDeclaredField('activity');f.setAccessible(true);const a=Java.cast(f.get(records[i]),Java.use('android.app.Activity'));if(a.getWindow().getDecorView().hasWindowFocus())activity=a;}
  check(!!activity,'focused activity for settings UI');
  const box=Java.use('android.widget.LinearLayout').$new(activity);S.addWacchoiSearchSetting(box,activity);
  let toggle;const Switch=Java.use('android.widget.Switch');
  for(let i=0;i<box.getChildCount();i++){const v=box.getChildAt(i);if(Switch.class.isInstance(v)){const s=Java.cast(v,Switch);if(String(s.getText()).includes('下4桁をNG登録'))toggle=s;}}
  check(!!toggle,'dedicated lower-four NG switch restored in settings');toggle.setChecked(false);
  check(!S.nameMenuVisible(76)&&!S.visible(76),'switch changes name menu only');
  toggle.setChecked(true);check(S.nameMenuVisible(76)&&!S.visible(76),'switch ON leaves body hidden');
  // 191 can receive a pre-existing native item. OFF must remove that item too.
  const Fake=Java.registerClass({name:'app.morphe.test.SuffixNgResponse',fields:{n:'java.lang.String',q:'java.lang.String'}}),response=Fake.$new();
  response.n.value='名無しさん (ﾜｯﾁｮｲ 1234-abCD)';response.q.value='';
  let fragment;const refsField=Java.use('app.morphe.extension.chmate.FilterPosition').class.getDeclaredField('fragments');refsField.setAccessible(true);const refs=Java.cast(refsField.get(null),Java.use('java.util.List'));
  for(let i=0;i<refs.size();i++){const f=Java.cast(refs.get(i),Java.use('java.lang.ref.WeakReference')).get();if(f){const typed=Java.cast(f,Java.use('jp.syoboi.a2chMate.ui.reslist.ResListFragment'));if(typed.getView()&&typed.getView().isShown())fragment=typed;}}
  if(fragment){const menu=Java.use('android.widget.PopupMenu').$new(activity,Java.use('android.view.View').$new(activity)).getMenu();
   menu.add.overload('int','int','int','java.lang.CharSequence').call(menu,0,76,0,Java.use('java.lang.String').$new('existing native suffix NG'));prefs.edit().putBoolean(keys[0],false).commit();
   Java.use('app.morphe.extension.chmate.WacchoiLongPressMenu').appendLegacyForName(fragment,menu,response);
   check(menu.findItem(76)===null,'legacy OFF removes a pre-existing lower-four NG item');
   prefs.edit().putBoolean(keys[0],true).commit();Java.use('app.morphe.extension.chmate.WacchoiLongPressMenu').appendLegacyForName(fragment,menu,response);
   check(menu.findItem(76)!==null,'legacy ON adds lower-four NG independently of body');
  }
  console.log('SUFFIX_NG_MENU_SEPARATION_COMPLETE '+checks+' checks');
 }catch(e){console.log('FAIL '+e.stack);}finally{
  const edit=prefs.edit();for(const k of keys){if(!old.containsKey(k))edit.remove(k);else if(k===keys[0])edit.putBoolean(k,Java.cast(old.get(k),Java.use('java.lang.Boolean')).booleanValue());else edit.putInt(k,Java.cast(old.get(k),Java.use('java.lang.Integer')).intValue());}edit.commit();console.log('PREFERENCES_RESTORED');
 }});
});
