async page=>{
 const base="C:/Morphe/App's/YT-Music/",reports=[],errors=[];page.on('pageerror',error=>errors.push(String(error)));
 const headers={'User-Agent':'BDCrusher-YTMusic-Lyrics/0.1 (personal Android client)','Accept':'application/json, text/event-stream'};
 const fixtures=[];
 for(const [videoId,url,kind] of [['sN_tJ8d3c0I','https://api.betterlyrics.org/getLyrics?s=Wake+Up&a=Imagine+Dragons&al=LOOM&d=167','better'],['MYal8NoVQXs','https://unison.betterlyrics.org/lyrics?v=MYal8NoVQXs','unison']]){
  const response=await page.request.get(url,{headers,timeout:25000});if(!response.ok())throw Error('Fixture HTTP '+response.status());fixtures.push({videoId,kind,data:await response.json()});
 }
 const cdp=await page.context().newCDPSession(page);
 for(const rate of [1,4])for(const fixture of fixtures){
  await page.reload();await page.addStyleTag({content:'html{background:#321212!important}'});await page.evaluate(()=>document.fonts.ready);
  await page.evaluate(async fixture=>{
   BDC.track({generation:3030,title:'Recording fixture',artist:'Local',duration:260,videoId:fixture.videoId});BDC.settings({letterWave:true,wordSync:true,background:true,reducedMotion:false,dockCollapsed:false});
   await BDC.source(3030,fixture.kind==='unison'?{kind:'unison',data:fixture.data}:{key:'bLyrics-richsynced',source:'Better Lyrics',format:'ttml',raw:fixture.data.ttml});
   BDC.state({generation:3030,position:30000,playing:true,rate:1,revision:1,sampledAt:Date.now(),visible:true});BDC.health(3030,{pending:0,failed:false,connectionNeeded:false});
  },fixture);await page.waitForTimeout(1200);
  await cdp.send('Emulation.setCPUThrottlingRate',{rate});
  const metrics=await page.evaluate(()=>new Promise(resolve=>{
   const start=performance.now(),frames=[],tasks=[];const observer=new PerformanceObserver(list=>tasks.push(...list.getEntries().map(e=>e.duration)));observer.observe({type:'longtask'});
   const interval=setInterval(()=>BDC.state({generation:3030,position:31200+performance.now()-start,playing:true,rate:1,revision:1,sampledAt:Date.now(),visible:true}),250);
   function f(now){frames.push(now);if(now-start<6500)requestAnimationFrame(f);else{clearInterval(interval);observer.disconnect();BDC.state({generation:3030,position:37700,playing:false,visible:true});const d=frames.slice(1).map((t,i)=>t-frames[i]).sort((a,b)=>a-b);resolve({frames:frames.length,p95:d[Math.floor(d.length*.95)],max:Math.max(...d),longTasks:tasks.length,longTaskMax:Math.max(0,...tasks),letters:document.querySelectorAll('.blyrics--letter').length,active:document.querySelectorAll('.blyrics--active').length});}}requestAnimationFrame(f);
  }));await cdp.send('Emulation.setCPUThrottlingRate',{rate:1});if(!metrics.letters||!metrics.active)throw Error('Rich highlighting not active');reports.push({videoId:fixture.videoId,cpuThrottle:rate,...metrics});
 }
 if(errors.length)throw Error(JSON.stringify(errors));return {passed:true,reports,phoneVerified:false,errors};
}
