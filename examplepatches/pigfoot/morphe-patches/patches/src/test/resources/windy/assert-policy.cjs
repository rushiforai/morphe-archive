const vm=require('node:vm');
const assert=require('node:assert/strict');
let input='';process.stdin.setEncoding('utf8');process.stdin.on('data',x=>input+=x);
process.stdin.on('end',()=>{
 const {original,patched}=JSON.parse(input);
 function run(source,values={},body=true){
  const classes=new Set(['unrelated']);const events=[];const account={user:'real-user',token:'***'};
  const context=vm.createContext({input:{values,savedFeature:'custom'},classes,events,account,
   document:{body:body?{classList:{add:x=>classes.add(x),remove:x=>classes.delete(x)}}:null}},
   {codeGeneration:{strings:false,wasm:false}});
  vm.runInContext(source+';globalThis.api=api;',context,{timeout:1000});
  return {api:context.api,events,account,classes};
 }
 assert.equal(run(original).api.result().latch,false);
 assert.equal(run(original).api.result().feature,'default');
 let cases=0;
 for(const tier of [undefined,null,false,0,'','free','premium',{},'bad tier']){
  const values=tier===undefined?{}:{subscription:tier};
  const x=run(patched,values);const before=x.api.result();
  assert.equal(before.latch,true);assert.equal(before.hasAny,true);assert.equal(before.feature,'custom');
  assert(x.classes.has('subs-premium'));assert(x.classes.has('unrelated'));
  x.api.clear();assert.equal(x.api.result().subscription,'premium');assert.equal(x.api.result().info,null);
  assert.equal(x.account.token,'real-token');assert(x.events.includes('clear'));cases++;
 }
 for(const state of ['onhold','paused','graced','canceled']){
  const info={isSubscription:true,isTrial:false,state};const x=run(patched,{subscription:'premium',subscriptionInfo:info});
  x.api.clear();assert.equal(x.api.result().info,null);assert.equal(x.api.result().hasAny,true);cases++;
 }
 const paid={status:'active',tier:'premium',isSubscription:true,state:'active'};
 const active=run(patched);active.api.active(paid);assert.equal(active.api.result().info,paid);
 assert.equal(active.account.user,'real-user');assert.equal(active.account.token,'real-token');cases++;
 active.api.logout();assert.equal(active.api.result().info,null);assert.equal(active.account.user,null);
 assert.equal(active.account.token,null);assert(active.events.includes('logout'));assert.equal(active.api.result().hasAny,true);cases++;
 assert.equal(run(patched,{},false).api.result().latch,true);cases++;
 console.log('PASS: '+cases+' local feature/account-reset scenarios; no network/device test');
});
