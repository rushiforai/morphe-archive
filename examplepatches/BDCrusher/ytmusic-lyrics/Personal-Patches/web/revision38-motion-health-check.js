async page=>{
 const base="C:/Morphe/App's/YT-Music/",assets='Personal-Patches/patches/src/main/resources/bdcrusher-lyrics/';
 const before=base+'Verification/publication/v0.2.1-beta.1/repository/'+assets;
 const errors=[];page.on('pageerror',e=>errors.push(String(e)));
 await page.setViewportSize({width:412,height:915});
 await page.addInitScript(()=>{window.bridgeCalls=[];window.BDNative=Object.fromEntries(['ready','seek','pin','dock','copy','refresh','connect','configure','displayed','noLyrics','diagnostic','toggle','offset','cacheResult'].map(name=>[name,(...args)=>bridgeCalls.push([name,...args])]));});
 const cdp=await page.context().newCDPSession(page);await cdp.send('Performance.enable');
 const results={};
 async function fixture(legacy){
  await page.unroute('**/index.html');await page.unroute('**/host.css');await page.unroute('**/renderer.js');
  for(const [file,type] of [['index.html','text/html'],['host.css','text/css'],['renderer.js','application/javascript']])await page.route('**/'+file,route=>route.fulfill({path:(legacy?before:base+assets)+file,contentType:type}));
  await page.reload();await page.addStyleTag({content:'html{background:#321212!important}'});await page.evaluate(()=>document.fonts.ready);
  await page.evaluate(async()=>{
   BDC.track({generation:3000,title:'Motion fixture',artist:'Local',duration:180,videoId:'local-motion'});
   BDC.settings({fontSize:28,letterWave:false,wordSync:true,reducedMotion:false,dockCollapsed:false,priority:[],disabled:[]});
   await BDC.source(3000,{key:'lrclib-synced',source:'Local fixture',format:'lrc',raw:Array.from({length:65},(_,i)=>`[${String(Math.floor(i*2/60)).padStart(2,'0')}:${String(i*2%60).padStart(2,'0')}.00]Locally authored lyric number ${i}`).join('\n')});
   BDC.state({generation:3000,position:20000,playing:false,rate:1,visible:true});
   BDC.notice(3000,'Some sources failed; available lyrics have been kept',true);
   BDC.health?.(3000,{pending:0,failed:true,connectionNeeded:false,found:true});
  });await page.waitForTimeout(1300);
 }
 for(const legacy of [true,false]){
  const name=legacy?'baseline-0.5.0-beta.1':'current';await fixture(legacy);
  await cdp.send('Emulation.setCPUThrottlingRate',{rate:4});await cdp.send('Profiler.enable');await cdp.send('Profiler.setSamplingInterval',{interval:1000});await cdp.send('Profiler.start');
  const initial=await cdp.send('Performance.getMetrics');
  const motion=await page.evaluate(()=>new Promise(resolve=>{
   const start=performance.now(),frames=[],tasks=[];const line=document.querySelectorAll('.blyrics--line')[15];
   const observer=new PerformanceObserver(list=>tasks.push(...list.getEntries().map(e=>e.duration)));observer.observe({type:'longtask',buffered:false});
   BDC.state({generation:3000,position:20000,playing:true,rate:1,revision:1,visible:true});
   const timer=setInterval(()=>{const now=performance.now();BDC.state({generation:3000,position:20000+now-start+(Math.round((now-start)/100)%2?120:-120),playing:true,rate:1,revision:1,sampledAt:Date.now(),visible:true});},100);
   function frame(now){frames.push({t:now,y:line.getBoundingClientRect().top});if(now-start<8500)requestAnimationFrame(frame);else{
    clearInterval(timer);observer.disconnect();BDC.state({generation:3000,position:28500,playing:false,visible:true});
    const delta=frames.slice(1).map((v,i)=>v.y-frames[i].y),intervals=frames.slice(1).map((v,i)=>v.t-frames[i].t).sort((a,b)=>a-b);
    resolve({frames:frames.length,reverseSteps:delta.filter(d=>d>1).length,maxReversePx:Math.max(0,...delta),maxForwardPx:Math.max(0,...delta.map(x=>-x)),frameIntervalP95:intervals[Math.floor(intervals.length*.95)],frameIntervalMax:Math.max(...intervals),longTasks:tasks.length,longTaskMax:Math.max(0,...tasks)});
   }}requestAnimationFrame(frame);
  }));
  const final=await cdp.send('Performance.getMetrics'),profile=await cdp.send('Profiler.stop');
  const output=base+'Personal-Patches/output/playwright/revision38-delivery-'+name+'-cpu.json';const pendingDownload=page.waitForEvent('download');
  await page.evaluate(profile=>{const link=document.createElement('a');const url=URL.createObjectURL(new Blob([JSON.stringify(profile)],{type:'application/json'}));link.href=url;link.download='cpu-profile.json';link.click();setTimeout(()=>URL.revokeObjectURL(url),1000);},profile.profile);
  await (await pendingDownload).saveAs(output);
  const old=Object.fromEntries(initial.metrics.map(x=>[x.name,x.value]));
  motion.metrics=Object.fromEntries(final.metrics.filter(x=>['LayoutCount','RecalcStyleCount','TaskDuration','ScriptDuration','LayoutDuration','RecalcStyleDuration'].includes(x.name)).map(x=>[x.name,x.value-old[x.name]]));
  motion.cpuProfile=output;results[name]=motion;
  await cdp.send('Emulation.setCPUThrottlingRate',{rate:1});
 }
 if(results.current.reverseSteps)throw Error('Continuous-clock scroll reversed: '+JSON.stringify(results));
 if(results.current.frameIntervalMax>500)throw Error('Unbounded browser stall: '+JSON.stringify(results));
 if(await page.locator('#connection').isVisible())throw Error('Source warning banner appeared automatically');
 const states=[];
 for(const [state,status] of [['orange',{pending:2,failed:false,connectionNeeded:false}],['green',{pending:0,failed:false,connectionNeeded:false}],['orange',{pending:0,failed:true,connectionNeeded:false}]]){
  await page.evaluate(s=>BDC.health(3000,s),status);const actual=await page.locator('#source-health').getAttribute('data-state');if(actual!==state)throw Error('Wrong dot '+actual);states.push(actual);
 }
 await page.locator('#source-health').click();if(!await page.locator('#connection').isVisible())throw Error('Dot did not open source details');await page.keyboard.press('Escape');if(await page.locator('#connection').isVisible())throw Error('Details Escape failed');
 const duplicate=await page.evaluate(async()=>{
  const first=document.querySelector('.blyrics--line');await BDC.source(3000,{key:'lrclib-synced',source:'Local fixture',format:'lrc',raw:Array.from({length:65},(_,i)=>`[${String(Math.floor(i*2/60)).padStart(2,'0')}:${String(i*2%60).padStart(2,'0')}.00]Locally authored lyric number ${i}`).join('\n')});return first===document.querySelector('.blyrics--line');
 });if(!duplicate)throw Error('Equivalent source response rebuilt lyrics');
 await page.evaluate(()=>{BDC.track({generation:3001,title:'Empty fixture',artist:'Local',duration:180,videoId:'local-empty'});BDC.health(3001,{pending:0,failed:true,connectionNeeded:false});});if(await page.locator('#source-health').getAttribute('data-state')!=='red')throw Error('No-result dot is not red');if(await page.locator('#resume').isVisible())throw Error('New track inherited stale follow pause');states.push('red');
 await page.evaluate(()=>{BDC.health(2999,{pending:0,failed:false,connectionNeeded:false});});if(await page.locator('#source-health').getAttribute('data-state')!=='red')throw Error('Stale health changed current track');
 await page.evaluate(()=>document.activeElement?.blur());await page.screenshot({path:base+'Personal-Patches/output/playwright/revision38-dot.png'});
 if(errors.length)throw Error(JSON.stringify(errors));
 return {passed:true,results,healthStates:states,noAutomaticBanner:true,detailsAccessible:true,duplicatePreservesDOM:duplicate,staleHealthIgnored:true,phoneVerified:false,errors};
}
