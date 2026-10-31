rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
const app=Java.use('android.app.ActivityThread').currentApplication(),S=Java.use('app.morphe.extension.chmate.SharedNg'),C=Java.use('app.morphe.extension.chmate.ProgrammableNgController'),E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),R=Java.use('app.morphe.extension.chmate.SharedNgRules'),J=Java.use('org.json.JSONArray'),List=Java.use('java.util.List');
const prefs=app.getSharedPreferences('haiagaru.shared-ng',0),saved={};for(const k of ['enabled','threshold','filterLevel'])saved[k]={has:prefs.contains(k),value:k==='enabled'?prefs.getBoolean(k,false):prefs.getInt(k,k==='threshold'?5:3)};
function field(o,k){const f=o.getClass().getDeclaredField(k);f.setAccessible(true);return f.get(o);}function stat(t,k){const f=t.class.getDeclaredField(k);f.setAccessible(true);return f;}
const rules=stat(S,'rules'),old=Java.retain(rules.get(null)),next=stat(S,'nextSync'),oldNext=next.getLong(null);let adapter,checks=[];
try{
 const refs=Java.cast(stat(E,'OWNERS').get(null),List);for(let i=0;i<refs.size();i++){const raw=Java.cast(refs.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!raw)continue;const frag=Java.cast(raw,Java.use(String(raw.getClass().getName())));if(frag.getView()&&frag.getView().isShown())adapter=E.adapter(raw);}if(!adapter)throw Error('visible native response adapter required');
 const middle=String(adapter.getClass().getName())==='o.listener',legacy=String(adapter.getClass().getName())==='o.m9ExternalSyntheticLambda1';if(!middle&&!legacy)throw Error('191/226 native row test');
 prefs.edit().putBoolean('enabled',true).putInt('threshold',1).putInt('filterLevel',5).commit();next.setLong(null,Date.now()+3600000);S.reload();
 if(middle)C.prepareModernResponses(adapter);else C.prepareLegacyResponses(adapter);
 const inputs=Java.cast(stat(C,'lastBodies').get(null),List),source=Java.cast(field(adapter,middle?'J':'K'),List);if(inputs.size()===0)throw Error('real DAT responses required');
 const Input=Java.use('app.morphe.extension.chmate.ProgrammableNgScript$Input'),input=Java.cast(inputs.get(0),Input),values=Java.cast(field(input,'values'),Java.use('java.util.Map'));
 const board=String(values.get(Java.use('java.lang.String').$new('boardUrl'))),id=String(values.get(Java.use('java.lang.String').$new('responseId'))),date=String(values.get(Java.use('java.lang.String').$new('dateText')));
 const tuple={id:'c'.repeat(64),board:String(R.board(board)),kind:'id',value:id,period:String(R.day(date)),votes:5,minLevel:3,minVotes:5};
 rules.set(null,S.decode(J.$new.overload('java.lang.String').call(J,JSON.stringify([tuple]))));
 if(middle)C.prepareModernResponses(adapter);else C.prepareLegacyResponses(adapter);
 const row=source.get(0),on=middle?C.mergeModernResponseFlags(adapter,row,0):C.mergeLegacyResponseFlags(adapter,row,0);if((on&16)===0)throw Error('real response did not receive NG flag');checks.push('real DAT ID mapped to native NGWord flag');
 prefs.edit().putBoolean('enabled',false).commit();S.reload();const off=middle?C.mergeModernResponseFlags(adapter,row,0):C.mergeLegacyResponseFlags(adapter,row,0);if((off&16)!==0)throw Error('NG flag persisted after OFF');checks.push('receive OFF restores native flag');resolve({checks,adapter:String(adapter.getClass().getName())});
}catch(e){reject(String(e.stack));}finally{
 rules.set(null,old);next.setLong(null,oldNext);const edit=prefs.edit();for(const k in saved){let p=saved[k];if(!p.has)edit.remove(k);else if(k==='enabled')edit.putBoolean(k,p.value);else edit.putInt(k,p.value);}edit.commit();S.reload();if(adapter){if(String(adapter.getClass().getName())==='o.listener')C.prepareModernResponses(adapter);else C.prepareLegacyResponses(adapter);}console.log('NATIVE_RULE_FLAGS_RESTORED');
}
})));}};
