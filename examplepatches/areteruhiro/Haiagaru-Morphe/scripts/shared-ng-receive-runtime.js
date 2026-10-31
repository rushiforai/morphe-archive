rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName()))){reject('verification package required');return;}
 const S=Java.use('app.morphe.extension.chmate.SharedNg'),Input=Java.use('app.morphe.extension.chmate.ProgrammableNgScript$Input'),Map=Java.use('java.util.HashMap'),List=Java.use('java.util.ArrayList'),Array=Java.use('org.json.JSONArray');

 const prefs=app.getSharedPreferences('haiagaru.shared-ng',0),saved=prefs.getAll(),field=S.class.getDeclaredField('rules');field.setAccessible(true);const old=Java.retain(field.get(null));let checks=[];
 function check(v,label){if(!v)throw Error(label);checks.push(label);}
 const keys={enabled:['boolean',false],threshold:['int',5],filterLevel:['int',3],cursor:['long',0],lastSync:['long',0],failures:['int',0],'kind.suffix':['boolean',true],exceptions:['set',null],excludedBoards:['set',null]};const previous={};for(const k in keys){let t=keys[k][0];previous[k]={has:prefs.contains(k),value:t==='boolean'?prefs.getBoolean(k,keys[k][1]):t==='int'?prefs.getInt(k,keys[k][1]):t==='long'?prefs.getLong(k,0):prefs.getStringSet(k,Java.use('java.util.HashSet').$new())};}
 function restore(){const e=prefs.edit();for(const k in keys){let p=previous[k],t=keys[k][0];if(!p.has)e.remove(k);else if(t==='boolean')e.putBoolean(k,p.value);else if(t==='int')e.putInt(k,p.value);else if(t==='long')e.putLong(k,p.value);else e.putStringSet(k,p.value);}e.commit();field.set(null,old);S.reload();}
 function match(board,id,name,date){const values=Map.$new(),str=Java.use('java.lang.String');values.put(str.$new('boardUrl'),str.$new(board));values.put(str.$new('responseId'),str.$new(id));values.put(str.$new('name'),str.$new(name));values.put(str.$new('dateText'),str.$new(date));let rows=List.$new();rows.add(Input.$new('synthetic',values));const method=Java.use('app.morphe.extension.chmate.ProgrammableNgController').class.getDeclaredMethod('evaluateBodies',Java.array('java.lang.Class',[Java.use('java.util.List').class]));method.setAccessible(true);const result=method.invoke(null,Java.array('java.lang.Object',[rows]));return Java.use('java.lang.reflect.Array').getBoolean(result,0);}
 try{
 prefs.edit().putBoolean('enabled',true).putInt('threshold',1).putInt('filterLevel',4).putLong('cursor',0).putStringSet('exceptions',Java.use('java.util.HashSet').$new()).putStringSet('excludedBoards',Java.use('java.util.HashSet').$new()).commit();
 const f=S.class.getDeclaredField('nextSync');f.setAccessible(true);const next=f.getLong(null);f.setLong(null,Date.now()+3600000);
 try{
 const rules=[{id:'a'.repeat(64),board:'5ch/android',kind:'id',value:'SyntheticId',period:'2026-10-22',votes:5,minVotes:5,minLevel:3},{id:'b'.repeat(64),board:'5ch/android',kind:'suffix',value:'Ab12',period:'2026-10-22',votes:10,minVotes:10,minLevel:4}];
 field.set(null,S.decode(Array.$new.overload('java.lang.String').call(Array,JSON.stringify(rules))));S.reload();
 check(match('https://egg.5ch.io/android/','SyntheticId','','2026/10/22'),'ID applies to exact day');
 check(!match('https://egg.5ch.io/android/','SyntheticId','','2026/10/23'),'ID expires by post day');
 check(match('https://egg.5ch.io/android/','','zz99-Ab12','2026/10/28'),'lower four applies within week');
 check(!match('https://egg.5ch.io/android/','','zz99-Ab12','2026/10/29'),'lower four expires next week');
 check(!match('https://egg.5ch.io/other/','','zz99-Ab12','2026/10/28'),'board isolation');
 const excluded=Java.use('java.util.HashSet').$new();excluded.add(Java.use('java.lang.String').$new('b'.repeat(64)));prefs.edit().putStringSet('exceptions',excluded).commit();S.reload();check(!match('https://egg.5ch.io/android/','','zz99-Ab12','2026/10/28'),'individual exception');prefs.edit().putStringSet('exceptions',Java.use('java.util.HashSet').$new()).commit();S.reload();
 prefs.edit().putBoolean('kind.suffix',false).commit();check(!match('https://egg.5ch.io/android/','','zz99-Ab12','2026/10/28'),'kind toggle OFF');
 prefs.edit().putBoolean('kind.suffix',true).putInt('filterLevel',3).commit();S.reload();check(match('https://egg.5ch.io/android/','','zz99-Ab12','2026/10/28'),'obsolete strength preference does not restrict lower four');
 prefs.edit().putBoolean('enabled',false).commit();S.reload();check(!match('https://egg.5ch.io/android/','SyntheticId','','2026/10/22'),'receive OFF');
 const request=S.request.overload('java.lang.String','java.lang.String','org.json.JSONObject');let response={ok:true,format:1,revision:1,full:true,rules};
 request.implementation=function(method,url,body){if(String(method)!=='GET')throw Error('No real POST permitted');return Java.use('org.json.JSONObject').$new(JSON.stringify(response));};
 try{
 prefs.edit().putLong('cursor',0).putBoolean('enabled',true).putBoolean('kind.suffix',true).putInt('filterLevel',4).commit();S.reload();S.sync(true);
 check(match('https://egg.5ch.io/android/','SyntheticId','','2026/10/22'),'full feed sync applies');
 response={ok:true,revision:2,full:true,rules:[{...rules[0],value:'invalid space'}]};S.sync(true);
 check(match('https://egg.5ch.io/android/','SyntheticId','','2026/10/22'),'invalid feed retains last valid snapshot');
 field.set(null,Java.use('java.util.Collections').emptyList());S.loadCache();
 check(match('https://egg.5ch.io/android/','SyntheticId','','2026/10/22'),'offline cache reload retains condition');
 response={ok:true,revision:3,full:true,rules:[]};S.sync(true);
 check(!match('https://egg.5ch.io/android/','SyntheticId','','2026/10/22'),'full empty feed removes withdrawn conditions');
 }finally{request.implementation=null;}
 resolve({checks});
 }finally{f.setLong(null,next);}
 }catch(e){console.log('TEST_ERROR '+e.stack);reject(String(e.stack));}finally{try{restore();console.log('SHARED_RULES_AND_PREFS_RESTORED');}catch(e){console.log('RESTORE_ERROR '+e.stack);}}
}));}};
