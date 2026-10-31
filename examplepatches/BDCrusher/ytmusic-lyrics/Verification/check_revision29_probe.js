const fs=require('node:fs'),vm=require('node:vm'),assert=require('node:assert/strict');
const probe="(()=>{if(!window.__bdConnection){const token=window.turnstile&&window.turnstile.getResponse();if(!token)return JSON.stringify({waiting:true});window.__bdConnection={pending:true};fetch('/verify-turnstile',{method:'POST',credentials:'include',headers:{'Content-Type':'application/json'},body:JSON.stringify({token})}).then(async r=>{if(!r.ok){window.__bdConnection={status:r.status};return;}const data=await r.json();window.__bdConnection={jwt:data.jwt||'',status:200};}).catch(()=>window.__bdConnection={status:0});}return JSON.stringify(window.__bdConnection);})()";
(async()=>{
 let calls=0,request;const context=vm.createContext({window:{turnstile:{getResponse:()=>''}},fetch:async(url,options)=>{calls++;request={url,options};return {ok:true,json:async()=>({jwt:'local-fixture'})};}});
 assert.equal(JSON.parse(vm.runInContext(probe,context)).waiting,true);assert.equal(calls,0);
 context.window.turnstile.getResponse=()=> 'verification-fixture';
 assert.equal(JSON.parse(vm.runInContext(probe,context)).pending,true);
 vm.runInContext(probe,context);assert.equal(calls,1);
 await new Promise(resolve=>setImmediate(resolve));
 assert.equal(JSON.parse(vm.runInContext(probe,context)).jwt,'local-fixture');assert.equal(calls,1);
 assert.equal(request.url,'/verify-turnstile');assert.equal(request.options.credentials,'include');assert.equal(JSON.parse(request.options.body).token,'verification-fixture');
 delete context.window.__bdConnection;context.fetch=async()=>({ok:false,status:503});vm.runInContext(probe,context);await new Promise(resolve=>setImmediate(resolve));assert.equal(JSON.parse(vm.runInContext(probe,context)).status,503);
 delete context.window.__bdConnection;context.fetch=async()=>{throw new Error('local failure');};vm.runInContext(probe,context);await new Promise(resolve=>setImmediate(resolve));assert.equal(JSON.parse(vm.runInContext(probe,context)).status,0);
 fs.writeFileSync(process.argv[2],JSON.stringify({passed:true,checks:11,browserGlobalsSimulated:true,liveVerification:false},null,2)+'\n');console.log('PASS: 11 actual verification script checks');
})().catch(e=>{console.error(e);process.exitCode=1;});
