// Isolated application only. Native snapshots are restored in finally; no consent/network.
function run(fn){return new Promise((resolve,reject)=>Java.perform(()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}}));}
rpc.exports={test(){return run(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/^jp\.co\.airfront\.android\.a2chMate\.haiagaru\.bindings(191|226|242)$/.test(String(app.getPackageName())))throw Error('isolated bindings only');
 if(app.getSharedPreferences('haiagaru.personal-ng-submissions',0).getBoolean('consent',false))throw Error('submission consent must be OFF');
 const Store=Java.use('app.morphe.extension.chmate.NativeNgStore'),Entry=Java.use('app.morphe.extension.chmate.NativeNgStore$Entry'),Actions=Java.use('app.morphe.extension.chmate.ExistingNgActions'),List=Java.use('java.util.ArrayList'),Enum=Java.use('java.lang.Enum');
 let checks=0;const check=(ok,label)=>{if(!ok)throw Error(label);checks++;};
 const probe=Store.$new(app,'NAME'),categories=probe.category.value.getClass().getEnumConstants().map(x=>String(Java.cast(x,Enum).name()));
 const tested=[];
 for(const name of categories){
  const store=Store.$new(app,name),saved=store.entries(),original=List.$new();for(let i=0;i<saved.size();i++)original.add(Java.cast(saved.get(i),Entry).nativeItem.value);
  const token='Haiagaru-ng-fixture-'+name,stamp=Date.now()-1000,flags=0x19,board='fixture.invalid/one';
  function find(pattern,scope,bits){return Actions.find(store.entries(),pattern,scope,bits);}
  try{
   const all=List.$new(original);all.add(store.item(token,flags,stamp,board));all.add(store.item(token,flags,stamp,'fixture.invalid/two'));all.add(store.item(token,0x29,stamp,board));all.add(store.item(token+'-variants',0x10,stamp,board));all.add(store.item(token+'-variants',0x18,stamp,board));store.replace(saved,all);
   let target=find(token,board,flags);check(target!==null,'existing '+name);
   check(find(token+'-new',board,flags)===null,'new condition '+name);
   check(find(token,'fixture.invalid/absent',flags)===null,'scope exact '+name);
   check(Number(find(token,board,0x29).flags.value)===0x29,'match mode exact '+name);
   check(find(token+'-variants',board,0x11)===null,'ambiguous variants not selected '+name);
   const System=Java.use('java.lang.System'),identity=System.identityHashCode(target.nativeItem.value);Actions.change(store,target,1);check(System.identityHashCode(find(token,board,flags).nativeItem.value)===identity,'already enabled avoids rewrite '+name);
   Actions.change(store,target,2);let disabled=find(token,board,flags|4);
   check(disabled!==null&&Number(disabled.flags.value)===(flags|4),'disable bit '+name);
   const disabledIdentity=System.identityHashCode(disabled.nativeItem.value);Actions.change(store,disabled,2);check(System.identityHashCode(find(token,board,flags|4).nativeItem.value)===disabledIdentity,'already disabled avoids rewrite '+name);
   check(Number(disabled.timestamp.value)===stamp&&String(disabled.board.value)===board,'disable metadata '+name);
   check(Number(find(token,'fixture.invalid/two',flags).flags.value)===flags,'other board intact '+name);
   check(Number(find(token,board,0x29).flags.value)===0x29,'other mode intact '+name);
   let stale=false;try{Actions.change(store,target,0);}catch(e){stale=true;}check(stale,'stale original rejected '+name);
   Actions.change(store,disabled,1);target=find(token,board,flags);check(target!==null&&Number(target.flags.value)===flags&&Number(target.timestamp.value)===stamp,'enable metadata '+name);
   const count=store.entries().size();Actions.change(store,target,0);check(find(token,board,flags)===null&&store.entries().size()===count-1,'delete exact '+name);
   check(find(token,'fixture.invalid/two',flags)!==null&&find(token,board,0x29)!==null,'delete retains variants '+name);
   let repeat=false;try{Actions.change(store,target,0);}catch(e){repeat=true;}check(repeat,'repeat delete rejected '+name);
   tested.push(name);
  }finally{
   store.replace(store.entries(),original);const restored=store.entries();check(restored.size()===saved.size(),'restore size '+name);for(let i=0;i<saved.size();i++)check(Java.cast(saved.get(i),Entry).same(Java.cast(restored.get(i),Entry)),'restore original '+name);
  }
 }
 return {ok:true,checks,categories:tested,realNetworkRequests:0};
});}};
