rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{try{
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!String(app.getPackageName()).includes('.haiagaru.'))throw Error('test app required');
 const S=Java.use('app.morphe.extension.chmate.SharedNg'),A=Java.use('org.json.JSONArray'),I=Java.use('app.morphe.extension.chmate.SharedNgIndex'),Set=Java.use('java.util.HashSet');
 const rows=S.decode(A.$new.overload('java.lang.String').call(A,JSON.stringify([{id:'a'.repeat(64),board:'*',kind:'id',value:'FixtureGlobal',period:'',votes:5},{id:'b'.repeat(64),board:'edge/all',kind:'reporter',value:'FixtureReporter',period:'',votes:5}])));
 const index=I.$new(rows,1,Set.$new(),Set.$new(),255);let checks=[];function c(v,t){if(!v)throw Error(t);checks.push(t);}
 for(const board of ['5ch/all','edge/all','pink/all'])c(index.matches(board,'FixtureGlobal','',''),'global '+board);
 c(index.matchesTitle('edge/all','FixtureReporter'),'reporter Edge title');c(!index.matchesTitle('5ch/all','FixtureReporter'),'reporter separate service');c(!index.matches('edge/all','FixtureReporter','FixtureReporter','FixtureReporter'),'reporter excludes body');
 c(String(S.feedEndpoint()).includes('reporter=1&globalIdentity=1'),'capabilities');resolve({checks,preferencesChanged:false});
 }catch(e){console.log('INDEX_ERROR '+String(e)+' '+String(e.stack));reject('Index test failed');}}));}};