rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!String(app.getPackageName()).endsWith('.resumefix226')){reject(new Error('verification package required'));return;}
 const P=Java.use('app.morphe.extension.chmate.PersonalNgSubmissions'),S=Java.use('app.morphe.extension.chmate.SharedNg'),Store=Java.use('app.morphe.extension.chmate.NativeNgStore'),Entry=Java.use('app.morphe.extension.chmate.NativeNgStore$Entry'),List=Java.use('java.util.ArrayList'),J=Java.use('org.json.JSONObject');
 const prefs=app.getSharedPreferences('haiagaru.personal-ng-submissions',0),saved=Java.retain(prefs.getAll()),entries=Store.entries.overload(),request=S.request.overload('java.lang.String','java.lang.String','org.json.JSONObject');let enabled=true,checks=[],sent=[],outcome,failure,withdrawn=false;
 const word='haiagaru-synthetic-'+String(Java.use('java.util.UUID').randomUUID());
 function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 try{
  prefs.edit().putBoolean('consent',false).commit();P.cancelRetry();
  entries.implementation=function(){const list=List.$new();if(enabled)list.add(Entry.$new(this.item(word,16,0,'synthetic-unresolved-board')));return list;};
  request.implementation=function(method,url,body){if(String(method)!=='POST')throw Error('only synthetic POST expected');const data=JSON.parse(String(body));if(data.reports.some(r=>r.value!==word))throw Error('non synthetic upload blocked');const answer=request.call(S,method,url,body);sent.push({body:data,answer:JSON.parse(String(answer))});return answer;};
  prefs.edit().clear().putBoolean('consent',true).putBoolean('type.ID',false).putBoolean('type.NAME',false).putBoolean('type.WORD',true).commit();
  P.collect();check(sent.length===1&&sent[0].answer.ok&&sent[0].answer.accepted===1,'Android collector POST accepted by deployed GAS');
  const first=sent[0];check(first.body.reports[0].board==='unknown.invalid/unresolved','synthetic unresolved candidate cannot be published');
  const replay=request.call(S,'POST',S.endpoint(),J.$new(JSON.stringify(first.body))),again=JSON.parse(String(replay));check(again.ok&&again.accepted===0,'same operation retry deduplicated by live GAS');
  const key='queue.'+String(P.hash(S.endpoint()));check(JSON.parse(String(prefs.getString(key,'[]'))).length===0,'server ACK removes durable queue');
  const beforeUnchanged=sent.length;P.collect();check(sent.length===beforeUnchanged,'unchanged NG produces no further request');
  enabled=false;prefs.edit().putLong('retryAfter',0).commit();P.collect();const last=sent[sent.length-1];withdrawn=sent.length>beforeUnchanged&&last.answer.ok&&last.answer.accepted===1&&last.body.reports[0].action==='delete';check(withdrawn,'synthetic registration withdrawal accepted');
  check(JSON.parse(String(prefs.getString(key,'[]'))).length===0,'withdrawal ACK clears queue');outcome={checks,syntheticOnly:true,withdrawn:true,realPersonalNgSent:false};
 }catch(e){failure=String(e)+' '+String(e.stack);}finally{
  if(!withdrawn&&sent.length){try{enabled=false;prefs.edit().putLong('retryAfter',0).commit();P.collect();console.log('SYNTHETIC_WITHDRAWAL_RECOVERY_ATTEMPTED');}catch(e){console.log('WITHDRAWAL_RECOVERY_ERROR '+e);}}
  entries.implementation=null;request.implementation=null;const edit=prefs.edit().clear(),it=saved.entrySet().iterator();while(it.hasNext()){const row=Java.cast(it.next(),Java.use('java.util.Map$Entry')),key=String(row.getKey()),v=row.getValue(),name=String(v.getClass().getName());if(name==='java.lang.String')edit.putString(key,String(v));else if(name==='java.lang.Boolean')edit.putBoolean(key,String(v)==='true');else if(name==='java.lang.Long')edit.putLong(key,parseInt(String(v)));else if(name==='java.lang.Integer')edit.putInt(key,parseInt(String(v)));else edit.putStringSet(key,Java.cast(v,Java.use('java.util.Set')));}edit.commit();P.cancelRetry();console.log('PERSONAL_PREFS_AND_SCHEDULE_RESTORED; native NG untouched');
 }
 if(failure)reject(new Error(failure));else resolve(outcome);
}));}};
