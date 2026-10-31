async page=>{
 const tab=await page.context().newPage();
 try{
  const response=await tab.goto('https://lyrics.api.dacubeking.com/challenge',{waitUntil:'domcontentloaded',timeout:30000});
  const result=await tab.evaluate(async probe=>{
   const until=performance.now()+22000;let state;
   do{state=JSON.parse(eval(probe));if(state.status!==undefined)break;await new Promise(r=>setTimeout(r,500));}while(performance.now()<until);
   if(state.status!==200||!state.jwt)return {connected:false,status:state.status||null,waiting:!!state.waiting,pending:!!state.pending};
   const expiry=JSON.parse(atob(state.jwt.split('.')[1].replace(/-/g,'+').replace(/_/g,'/'))).exp;
   const body=new URLSearchParams({videoId:'sN_tJ8d3c0I',song:'Wake Up',artist:'Imagine Dragons',album:'LOOM',duration:'167',alwaysFetchMetadata:'true',token:state.jwt});
   const response=await fetch('/v2/lyrics',{method:'POST',body,signal:AbortSignal.timeout(22000)});let providers=[];
   if(response.ok){const text=await response.text();for(const line of text.split(/\r?\n/)){if(!line.startsWith('data:'))continue;try{const d=JSON.parse(line.slice(5));if(d.provider)providers.push({provider:d.provider,hasLyrics:Object.values(d.results||{}).some(v=>typeof v==='string'&&v.length>50),error:!!d.error});}catch{}}}
   return {connected:true,secondsUntilExpiry:Math.round(expiry-Date.now()/1000),brokerStatus:response.status,providers};
  },"(()=>{if(!window.__bdListener){window.__bdListener=true;window.addEventListener('message',event=>{if(event.source!==window||event.origin!==location.origin)return;if(event.data?.type==='turnstile-token'&&typeof event.data.token==='string')window.__bdChallengeToken=event.data.token;});}if(!window.__bdConnection){let token=window.__bdChallengeToken;try{token||=window.turnstile&&window.turnstile.getResponse();}catch{}if(!token)return JSON.stringify({waiting:true});window.__bdConnection={pending:true};fetch('/verify-turnstile',{method:'POST',credentials:'include',headers:{'Content-Type':'application/json'},body:JSON.stringify({token})}).then(async r=>{if(!r.ok){window.__bdConnection={status:r.status,retryAfter:r.headers?.get('Retry-After')||''};return;}const data=await r.json();window.__bdConnection={jwt:typeof data.jwt==='string'?data.jwt:'',status:200};}).catch(()=>window.__bdConnection={status:0});}return JSON.stringify(window.__bdConnection);})()");
  let nativeTransportStatus=null;
  if(result.connected){
   const jwt=await tab.evaluate(()=>window.__bdConnection.jwt);
   const response=await page.request.post('https://lyrics.api.dacubeking.com/v2/lyrics',{headers:{'User-Agent':'BDCrusher-YTMusic-Lyrics/0.1 (personal Android client)','Accept':'application/json, text/event-stream','Cookie':''},form:{videoId:'sN_tJ8d3c0I',song:'Wake Up',artist:'Imagine Dragons',album:'LOOM',duration:'167',alwaysFetchMetadata:'true',token:jwt},timeout:25000});
   nativeTransportStatus=response.status();
  }
  return {challengeStatus:response?.status(),...result,nativeHeadersBrokerStatus:nativeTransportStatus,androidVerified:false};
 }finally{await tab.close();}
}