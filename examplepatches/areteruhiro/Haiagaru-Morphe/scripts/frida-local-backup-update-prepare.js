// Dedicated verification app only. No backup files or real SAF permissions touched.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.settingsfix191')throw Error('191 verification only');
 const p=app.getSharedPreferences('haiagaru.local-auto-backup',0),fixture=app.getSharedPreferences('haiagaru.test.local-auto-update',0);
 if(fixture.contains('saved'))throw Error('Previous fixture requires cleanup first');
 const root=Java.use('org.json.JSONObject').$new(),entries=p.getAll().entrySet().iterator();
 while(entries.hasNext()){const row=Java.cast(entries.next(),Java.use('java.util.Map$Entry')),value=row.getValue(),type=String(value.getClass().getName());
  if(!['java.lang.String','java.lang.Boolean','java.lang.Integer','java.lang.Long'].includes(type))throw Error('Unexpected original preference type');
  const item=Java.use('org.json.JSONObject').$new();item.put.overload('java.lang.String','java.lang.Object').call(item,'value',value);item.put.overload('java.lang.String','java.lang.Object').call(item,'type',Java.use('java.lang.String').$new(type));root.put.overload('java.lang.String','java.lang.Object').call(root,String(row.getKey()),item);
 }
 if(!fixture.edit().putString('saved',root.toString()).commit())throw Error('Cannot save fixture recovery');
 // Use now: a future timestamp intentionally triggers the clock-rollback policy.
 const last=Java.use('java.lang.System').currentTimeMillis();
 if(!fixture.edit().putLong('expectedLast',last).commit())throw Error('Fixture marker failed');
 if(!p.edit().putString('tree','content://com.android.externalstorage.documents/tree/primary%3AHaiagaru-test-no-write').putBoolean('enabled',true).putInt('hours',12).putInt('keep',5).putLong('last',last).putString('files','[]').commit())throw Error('Fixture save failed');
 console.log('LOCAL_BACKUP_UPDATE_PREPARED enabled=true, folder sentinel, hours=12 keep=5; original prefs retained privately for cleanup');
});
