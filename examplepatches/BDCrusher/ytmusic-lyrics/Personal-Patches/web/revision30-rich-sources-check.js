async page=>{
 const base="C:/Morphe/App's/YT-Music/";const errors=[];page.on('pageerror',e=>errors.push(String(e)));
 const tab=await page.context().newPage();let events=[],challengeStatus,brokerStatus;
 try{
  challengeStatus=(await tab.goto('https://lyrics.api.dacubeking.com/challenge',{waitUntil:'domcontentloaded',timeout:30000})).status();
  const jwt=await tab.evaluate(async probe=>{const end=performance.now()+22000;do{const state=JSON.parse(eval(probe));if(state.status!==undefined){if(state.status===200&&state.jwt)return state.jwt;throw Error('Verification HTTP '+state.status);}await new Promise(r=>setTimeout(r,500));}while(performance.now()<end);throw Error('Ordinary verification timed out');},"(()=>{if(!window.__bdListener){window.__bdListener=true;window.addEventListener('message',event=>{if(event.source!==window||event.origin!==location.origin)return;if(event.data?.type==='turnstile-token'&&typeof event.data.token==='string')window.__bdChallengeToken=event.data.token;});}if(!window.__bdConnection){let token=window.__bdChallengeToken;try{token||=window.turnstile&&window.turnstile.getResponse();}catch{}if(!token)return JSON.stringify({waiting:true});window.__bdConnection={pending:true};fetch('/verify-turnstile',{method:'POST',credentials:'include',headers:{'Content-Type':'application/json'},body:JSON.stringify({token})}).then(async r=>{if(!r.ok){window.__bdConnection={status:r.status,retryAfter:r.headers?.get('Retry-After')||''};return;}const data=await r.json();window.__bdConnection={jwt:typeof data.jwt==='string'?data.jwt:'',status:200};}).catch(()=>window.__bdConnection={status:0});}return JSON.stringify(window.__bdConnection);})()");
  const response=await page.request.post('https://lyrics.api.dacubeking.com/v2/lyrics',{headers:{'User-Agent':'BDCrusher-YTMusic-Lyrics/0.1 (personal Android client)','Accept':'application/json, text/event-stream','Cookie':''},form:{videoId:'sN_tJ8d3c0I',song:'Wake Up',artist:'Imagine Dragons',album:'LOOM',duration:'167',alwaysFetchMetadata:'true',token:jwt},timeout:25000});brokerStatus=response.status();if(!response.ok())throw Error('Broker HTTP '+brokerStatus);
  for(const block of (await response.text()).split(/\r?\n\r?\n/)){let event='',data='';for(const line of block.split(/\r?\n/)){if(line.startsWith('event:'))event=line.slice(6).trim();else if(line.startsWith('data:'))data+=line.slice(5).trim();}if(data&&data!=='[DONE]')events.push({event,data:JSON.parse(data)});}
 }finally{await tab.close();}
 for(const file of ['index.html','host.css','renderer.js'])await page.unroute('**/'+file);
 await page.reload();await page.addStyleTag({content:'html{background:#321212!important}'});await page.evaluate(()=>document.fonts.ready);
 const loaded=await page.evaluate(async events=>{
  BDC.track({generation:3010,title:'Wake Up',artist:'Imagine Dragons',album:'LOOM',duration:167,videoId:'sN_tJ8d3c0I'});
  BDC.settings({fontSize:28,letterWave:true,wordSync:true,background:true,reducedMotion:false,dockCollapsed:false,priority:[],disabled:[],textColor:'#ffffff'});
  BDC.health(3010,{pending:1,failed:false,connectionNeeded:false});
  for(const payload of events)await BDC.source(3010,payload);
  BDC.health(3010,{pending:0,failed:false,connectionNeeded:false,found:true});BDC.notice(3010,'Source lookup complete',true);
  BDC.state({generation:3010,position:40000,playing:true,rate:1,revision:1,sampledAt:Date.now(),visible:true});
  return {keys:[...document.querySelector('#sources').options].map(o=>o.value),selected:document.querySelector('#sources').value,letters:document.querySelectorAll('.blyrics--letter').length,spuriousEmpty:bridgeCalls.filter(c=>c[0]==='noLyrics').length};
 },events);
 if(!loaded.keys.includes('bLyrics-richsynced')||!loaded.letters||loaded.spuriousEmpty)throw Error('Live rich source integration '+JSON.stringify(loaded));
 if(await page.locator('#connection').isVisible()||await page.locator('#source-health').getAttribute('data-state')!=='green')throw Error('Live source status not quiet and green');
 await page.waitForTimeout(1200);const cdp=await page.context().newCDPSession(page);await cdp.send('Emulation.setCPUThrottlingRate',{rate:4});await cdp.send('Profiler.enable');await cdp.send('Profiler.setSamplingInterval',{interval:1000});await cdp.send('Profiler.start');
 const motion=await page.evaluate(events=>new Promise(resolve=>{
  const start=performance.now(),frames=[],tasks=[];const first=document.querySelector('.blyrics--line');let replayDone=0;
  const observer=new PerformanceObserver(list=>tasks.push(...list.getEntries().map(x=>x.duration)));observer.observe({type:'longtask'});
  const timer=setInterval(()=>{const now=performance.now();BDC.state({generation:3010,position:41200+now-start,playing:true,rate:1,revision:1,sampledAt:Date.now(),visible:true});},250);
  const timeouts=events.map((payload,i)=>setTimeout(async()=>{await BDC.source(3010,payload);replayDone++;},4500+i*40));
  function f(now){frames.push(now);if(now-start<11000)requestAnimationFrame(f);else{clearInterval(timer);timeouts.forEach(clearTimeout);observer.disconnect();BDC.state({generation:3010,position:52200,playing:false,visible:true});const intervals=frames.slice(1).map((v,i)=>v-frames[i]).sort((a,b)=>a-b);resolve({frames:frames.length,median:intervals[Math.floor(intervals.length*.5)],p95:intervals[Math.floor(intervals.length*.95)],max:Math.max(...intervals),longTasks:tasks.length,longTaskMax:Math.max(0,...tasks),equivalentReplyPreservesDOM:first===document.querySelector('.blyrics--line'),replayed:replayDone});}}requestAnimationFrame(f);
 }),events);
 const profile=await cdp.send('Profiler.stop');await cdp.send('Emulation.setCPUThrottlingRate',{rate:1});
 const pending=page.waitForEvent('download');await page.evaluate(profile=>{const a=document.createElement('a'),url=URL.createObjectURL(new Blob([JSON.stringify(profile)],{type:'application/json'}));a.href=url;a.download='rich-cpu.json';a.click();setTimeout(()=>URL.revokeObjectURL(url),1000);},profile.profile);const cpuProfile=base+'Personal-Patches/output/playwright/revision30-rich-final-cpu.json';await(await pending).saveAs(cpuProfile);
 if(!motion.equivalentReplyPreservesDOM||motion.replayed!==events.length||motion.max>120)throw Error('Rich playback stress '+JSON.stringify(motion));
 await page.locator('#source-label').click();await page.locator('#source-menu').waitFor({state:'visible',timeout:3000});await page.keyboard.press('Escape');
 await page.screenshot({path:base+'Personal-Patches/output/playwright/revision30-rich.png'});
 if(errors.length)throw Error(JSON.stringify(errors));
 return {passed:true,challengeStatus,brokerStatus,backendProviders:events.filter(e=>e.event==='provider').map(e=>e.data.provider),loaded,motion,cpuProfile,sourceFlyout:true,noAutomaticBanner:true,androidWebViewVerified:false,errors};
}