const fs=require('node:fs'),vm=require('node:vm'),assert=require('node:assert/strict');
const probe="(()=>{if(!window.__bdListener){window.__bdListener=true;window.addEventListener('message',event=>{if(event.source!==window||event.origin!==location.origin)return;if(event.data?.type==='turnstile-token'&&typeof event.data.token==='string')window.__bdChallengeToken=event.data.token;});}if(!window.__bdConnection){let token=window.__bdChallengeToken;try{token||=window.turnstile&&window.turnstile.getResponse();}catch{}if(!token)return JSON.stringify({waiting:true});window.__bdConnection={pending:true};fetch('/verify-turnstile',{method:'POST',credentials:'include',headers:{'Content-Type':'application/json'},body:JSON.stringify({token})}).then(async r=>{if(!r.ok){window.__bdConnection={status:r.status,retryAfter:r.headers?.get('Retry-After')||''};return;}const data=await r.json();window.__bdConnection={jwt:typeof data.jwt==='string'?data.jwt:'',status:200};}).catch(()=>window.__bdConnection={status:0});}return JSON.stringify(window.__bdConnection);})()";let checks=0;function equal(a,b){assert.equal(a,b);checks++;}
(async()=>{
 let calls=0,request;const listeners={};const window={turnstile:{getResponse:()=>''},addEventListener:(type,listener)=>listeners[type]=listener};
 const context=vm.createContext({window,location:{origin:'https://lyrics.api.dacubeking.com'},fetch:async(url,options)=>{calls++;request={url,options};return {ok:true,json:async()=>({jwt:'local-fixture'})};}});
 equal(JSON.parse(vm.runInContext(probe,context)).waiting,true);equal(calls,0);
 listeners.message({source:{},origin:'https://example.invalid',data:{type:'turnstile-token',token:'untrusted-fixture'}});
 equal(JSON.parse(vm.runInContext(probe,context)).waiting,true);equal(calls,0);
 listeners.message({source:window,origin:'https://lyrics.api.dacubeking.com',data:{type:'turnstile-token',token:'verification-fixture'}});
 equal(JSON.parse(vm.runInContext(probe,context)).pending,true);vm.runInContext(probe,context);equal(calls,1);
 await new Promise(resolve=>setImmediate(resolve));
 equal(JSON.parse(vm.runInContext(probe,context)).jwt,'local-fixture');equal(calls,1);
 equal(request.url,'/verify-turnstile');equal(request.options.credentials,'include');equal(JSON.parse(request.options.body).token,'verification-fixture');
 delete window.__bdConnection;context.fetch=async()=>({ok:false,status:503,headers:{get:()=> '5'}});vm.runInContext(probe,context);await new Promise(resolve=>setImmediate(resolve));let state=JSON.parse(vm.runInContext(probe,context));equal(state.status,503);equal(state.retryAfter,'5');
 delete window.__bdConnection;context.fetch=async()=>{throw new Error('local failure');};vm.runInContext(probe,context);await new Promise(resolve=>setImmediate(resolve));equal(JSON.parse(vm.runInContext(probe,context)).status,0);
 delete window.__bdConnection;context.fetch=async()=>({ok:true,json:async()=>({jwt:{invalid:'object'}})});vm.runInContext(probe,context);await new Promise(resolve=>setImmediate(resolve));equal(JSON.parse(vm.runInContext(probe,context)).jwt,'');
 delete window.__bdConnection;delete window.__bdChallengeToken;window.turnstile.getResponse=()=>{throw new Error('widget not ready');};equal(JSON.parse(vm.runInContext(probe,context)).waiting,true);
 fs.writeFileSync(process.argv[2],JSON.stringify({passed:true,checks,browserGlobalsSimulated:true,liveVerification:false},null,2)+'\n');console.log('PASS: '+checks+' actual verification script checks');
})().catch(e=>{console.error(e);process.exitCode=1;});