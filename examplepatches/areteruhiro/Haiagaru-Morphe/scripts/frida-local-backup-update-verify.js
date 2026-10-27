// Verify after reinstall; always restore the exact original preferences.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.settingsfix191')throw Error('191 verification only');
 const p=app.getSharedPreferences('haiagaru.local-auto-backup',0),fixture=app.getSharedPreferences('haiagaru.test.local-auto-update',0);
 const saved=fixture.getString('saved',null);if(saved===null)throw Error('No prepared fixture');
 let checks=0;function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 try{
  check(p.getBoolean('enabled',false),'enabled retained across same-package install-r');
  check(String(p.getString('tree',''))==='content://com.android.externalstorage.documents/tree/primary%3AHaiagaru-test-no-write','folder retained across same-package install-r');
  check(p.getInt('hours',0)===12&&p.getInt('keep',0)===5,'interval and retention retained');
  if(fixture.contains('expectedLast'))check(String(p.getLong('last',0))===String(fixture.getLong('expectedLast',-1)),'last successful backup marker unchanged');
  else console.log('Initial fixture used a future timestamp; no automatic-run assertion made');
  const L=Java.use('app.morphe.extension.chmate.LocalAutoBackup'),before=String(p.getString('files','[]')),last=String(p.getLong('last',0));
  L.setFolder(app,Java.use('android.net.Uri').parse('content://com.android.externalstorage.documents/tree/%70rimary%3AHaiagaru-test-no-write'));
  check(String(p.getString('files','[]'))===before&&String(p.getLong('last',0))===last,'same folder with alternate URI encoding retains ownership and last success');
  console.log('LOCAL_BACKUP_UPDATE_COMPLETE '+checks+' checks');
 }catch(e){console.log('FAIL '+e.stack);}finally{
  const json=Java.use('org.json.JSONObject').$new(saved),keys=json.keys(),edit=p.edit().clear();
  while(keys.hasNext()){const key=String(keys.next()),item=json.getJSONObject(key),type=String(item.getString('type'));
   if(type==='java.lang.String')edit.putString(key,item.getString('value'));
   else if(type==='java.lang.Boolean')edit.putBoolean(key,item.getBoolean('value'));
   else if(type==='java.lang.Integer')edit.putInt(key,item.getInt('value'));
   else if(type==='java.lang.Long')edit.putLong(key,item.getLong('value'));
  }
  if(!edit.commit())throw Error('Fixture restore failed; recovery retained');
  app.deleteSharedPreferences('haiagaru.test.local-auto-update');console.log('ORIGINAL_LOCAL_BACKUP_PREFERENCES_RESTORED; no actual backup documents created/deleted');
 }
});
