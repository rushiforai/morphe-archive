rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),S=Java.use('app.morphe.extension.chmate.SharedNg'),prefs=app.getSharedPreferences('haiagaru.shared-ng',0),J=Java.use('org.json.JSONArray'),Map=Java.use('java.util.Map'),Set=Java.use('java.util.HashSet'),StringClass=Java.use('java.lang.String');
 const snapshot=Java.use('java.util.HashMap').$new(prefs.getAll()),checks=[];
 function f(key){const field=S.class.getDeclaredField(key);field.setAccessible(true);return field;}
 const rules=f('rules'),oldRules=Java.retain(rules.get(null)),next=f('nextSync'),oldNext=next.getLong(null),plan=f('matchPlan'),oldPlan=plan.get(null);let result,error;
 function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 function match(id,name,body){const values=Java.use('java.util.LinkedHashMap').$new();for(const [k,v] of Object.entries({boardUrl:'https://egg.5ch.io/android/',responseId:id,name,dateText:'invalid date'}))values.put(StringClass.$new(k),StringClass.$new(v));const input=Java.use('app.morphe.extension.chmate.ProgrammableNgScript$Input').$new(body,values),inputs=Java.use('java.util.ArrayList').$new();inputs.add(input);const method=S.class.getDeclaredMethod('match',Java.array('java.lang.Class',[Java.use('java.util.List').class]));method.setAccessible(true);const output=method.invoke(null,Java.array('java.lang.Object',[inputs]));return Java.use('java.lang.reflect.Array').getBoolean(output,0);}
 function decode(rows){return S.decode(J.$new.overload('java.lang.String').call(J,JSON.stringify(rows)));}
 try{
  prefs.edit().putBoolean('enabled',true).putInt('threshold',1).putInt('filterLevel',5).putBoolean('kind.id',true).putBoolean('kind.keyword',true).putStringSet('excludedBoards',Set.$new()).putStringSet('exceptions',Set.$new()).commit();next.setLong(null,Date.now()+3600000);S.reload();
  prefs.edit().putInt('filterLevel',1).commit();
  const first={id:'a'.repeat(64),board:'5ch/all',kind:'id',value:'SyntheticAuditId',period:'',votes:3,minLevel:5,minVotes:1};rules.set(null,decode([first]));
  check(match(first.value,'','unchanged'),'level-five approved ID applies despite obsolete level-one preference');const built=Java.retain(plan.get(null));check(match(first.value,'','unchanged'),'cached matcher keeps result');check(Java.use('java.lang.System').identityHashCode(built)===Java.use('java.lang.System').identityHashCode(plan.get(null)),'unchanged match reuses index');
  prefs.edit().putBoolean('kind.id',false).commit();check(!match(first.value,'',''),'kind toggle invalidates index without stale result');prefs.edit().putBoolean('kind.id',true).commit();check(match(first.value,'',''),'kind ON rebuilds index');
  const excluded=Set.$new();excluded.add(StringClass.$new('5ch/all'));prefs.edit().putStringSet('excludedBoards',excluded).commit();check(!match(first.value,'',''),'excluded board invalidates index');prefs.edit().putStringSet('excludedBoards',Set.$new()).commit();
  rules.set(null,decode([{...first,id:'b'.repeat(64),kind:'keyword',value:'全角Ａ'}]));check(match('','','全角A'),'new feed rebuilds index and retains normalization');check(!match(first.value,'','neutral'),'replaced feed removes old ID rule');
  prefs.edit().putInt('threshold',4).commit();S.reload();check(!match('','','全角A'),'threshold reload invalidates index');
  result={checks,networkRequests:false,nativeNgWrites:false};
 }catch(e){error=Error(String(e.stack||e));}finally{
  const edit=prefs.edit().clear(),iterator=snapshot.entrySet().iterator();while(iterator.hasNext()){const entry=Java.cast(iterator.next(),Java.use('java.util.Map$Entry')),key=String(entry.getKey()),value=entry.getValue(),type=String(value.getClass().getName());if(type==='java.lang.Boolean')edit.putBoolean(key,Java.cast(value,Java.use(type)).booleanValue());else if(type==='java.lang.Integer')edit.putInt(key,Java.cast(value,Java.use(type)).intValue());else if(type==='java.lang.Long')edit.putLong(key,Java.cast(value,Java.use(type)).longValue());else if(type==='java.lang.Float')edit.putFloat(key,Java.cast(value,Java.use(type)).floatValue());else if(type==='java.lang.String')edit.putString(key,Java.cast(value,StringClass));else edit.putStringSet(key,Java.cast(value,Java.use('java.util.Set')));}edit.commit();rules.set(null,oldRules);next.setLong(null,oldNext);S.reload();plan.set(null,oldPlan);
 }
 if(error)reject(error);else resolve(result);
}));}};
