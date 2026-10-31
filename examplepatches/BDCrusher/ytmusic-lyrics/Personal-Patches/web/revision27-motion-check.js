async(page)=>{
 const errors=[];page.on('pageerror',e=>errors.push(e.message));
 await page.addInitScript(()=>{window.bridgeCalls=[];window.BDNative=Object.fromEntries(['ready','displayed','noLyrics','pin','dock','copy','refresh','connect','configure','toggle','offset','diagnostic','seek'].map(n=>[n,(...a)=>bridgeCalls.push([n,...a])]));});
 await page.unroute('**/renderer.js');await page.route('**/renderer.js',r=>r.fulfill({path:"C:/Morphe/App's/YT-Music/Personal-Patches/patches/src/main/resources/bdcrusher-lyrics/renderer.js",contentType:'application/javascript'}));await page.reload();await page.setViewportSize({width:412,height:820});
 const headers={'User-Agent':'BDCrusher-YTMusic-Lyrics/0.1 (personal Android client)','Accept':'application/json, text/event-stream'};
 const cases=[];
 for(const [id,url,key,title,artist,duration] of [
  ['sN_tJ8d3c0I','https://api.betterlyrics.org/getLyrics?s=Wake+Up&a=Imagine+Dragons&al=LOOM&d=167','bLyrics-richsynced','Wake Up','Imagine Dragons',167],
  ['MYal8NoVQXs','https://unison.betterlyrics.org/lyrics?v=MYal8NoVQXs','unison-richsynced','Love Me Dead (Female Cover)','CottontailVA Music',260]]){
  const r=await page.request.get(url,{headers});if(!r.ok())throw Error('HTTP '+r.status()+' '+id);const data=await r.json();
  const gen=cases.length+2700;
  await page.evaluate(async({id,key,title,artist,duration,data,gen})=>{
   BDC.track({generation:gen,title,artist,duration,videoId:id});BDC.settings({priority:[],disabled:[],fontSize:28,reducedMotion:false,letterWave:true,wordSync:true,translation:false,romanization:false,dockCollapsed:true});
   await BDC.source(gen,key.startsWith('unison')?{kind:'unison',data}:{key,source:'Better Lyrics',format:'ttml',raw:data.ttml});
   BDC.state({generation:gen,position:20000,playing:false,visible:true});
  },{id,key,title,artist,duration,data,gen});
  await page.waitForTimeout(1000);
  const before=await page.evaluate(()=>({key:document.querySelector('#sources').value,lines:document.querySelectorAll('.blyrics--line').length,letters:document.querySelectorAll('.blyrics--letter').length,paused:!document.querySelector('#resume').hidden}));
  if(before.key!==key||before.lines<10||before.letters<1||before.paused)throw Error('Rich result/false manual pause '+JSON.stringify(before));
  const trace=await page.evaluate(async(gen)=>{
   const el=document.querySelector('#scroll'),get=Object.getOwnPropertyDescriptor(Element.prototype,'scrollTop').get;
   BDC.state({generation:gen,position:30000,playing:false,visible:true});
   const frames=[];await new Promise(done=>{const start=performance.now();function frame(t){frames.push({t:t-start,physical:get.call(el),target:el.scrollTop,paused:!document.querySelector('#resume').hidden,lineAnimations:document.getAnimations().filter(a=>a.effect?.target?.classList.contains('blyrics--line')&&a.effect?.getKeyframes().some(f=>f.transform?.includes('translateY'))).length});if(t-start<950)requestAnimationFrame(frame);else done();}requestAnimationFrame(frame);});return frames;
  },gen);
  const dir=Math.sign(trace.at(-1).physical-trace[0].physical),distance=Math.abs(trace.at(-1).physical-trace[0].physical);
  const reversals=trace.slice(1).filter((f,i)=>(f.physical-trace[i].physical)*dir<-.6).length;
  if(distance>5&&(reversals||new Set(trace.map(f=>f.physical)).size<8))throw Error('Motion jumps or reverses '+JSON.stringify({id,distance,reversals}));
  if(trace.some(f=>f.paused||f.lineAnimations))throw Error('Competing animation or false manual pause '+id);
  // Empty or a less detailed late response may not remove the earlier rich result.
  if(key.startsWith('unison'))await page.evaluate(async(gen)=>{await BDC.source(gen,{kind:'unison',data:{data:{format:'ttml',lyrics:'<tt xmlns="http://www.w3.org/ns/ttml"><body><div><p begin="0s" end="10s">Local line-only fixture</p></div></body></tt>'}}});},gen);
  else await page.evaluate(async(gen)=>{await BDC.source(gen,{key:'bLyrics-richsynced',format:'ttml',source:'Better Lyrics',raw:''});},gen);
  if(await page.locator('#sources').inputValue()!==key)throw Error('Late response discarded rich '+id);
  const following=await page.evaluate(async(gen)=>{
   const e=document.querySelector('#scroll'),get=Object.getOwnPropertyDescriptor(Element.prototype,'scrollTop').get,start=performance.now(),samples=[];
   const timer=setInterval(()=>BDC.state({generation:gen,position:30000+performance.now()-start-100,sampledAt:Date.now()-100,playing:true,rate:1,visible:true}),100);
   await new Promise(done=>{function frame(t){samples.push({t,top:get.call(e),active:[...document.querySelectorAll('.blyrics--active')].map(x=>x.dataset.lineIndex||x.textContent).join('|'),paused:!document.querySelector('#resume').hidden});if(t-start<6200)requestAnimationFrame(frame);else done();}requestAnimationFrame(frame);});clearInterval(timer);BDC.state({generation:gen,position:36200,playing:false,visible:true});
   const d=samples.slice(1).map((s,i)=>({delta:s.top-samples[i].top,dt:s.t-samples[i].t}));return {frames:samples.length,reverse:d.filter(x=>x.delta<-.6).length,maxSpeed:Math.max(...d.map(x=>1000*x.delta/Math.max(x.dt,1))),activeChanges:new Set(samples.map(x=>x.active)).size,falsePause:samples.some(x=>x.paused)};
  },gen);
  if(following.reverse||following.falsePause||following.activeChanges<2||following.maxSpeed>6000)throw Error('Natural timed transitions failed '+JSON.stringify({id,following}));
  cases.push({videoId:id,...before,motionDistance:distance,frames:trace.length,reversals,lateRichPreserved:true,following});
 }
 // Real wheel input during a moving viewport must pause immediately, without waiting 2s.
 await page.evaluate(()=>{window.wheelEvents=[];for(const n of ['wheel','scroll'])document.querySelector('#scroll').addEventListener(n,e=>wheelEvents.push({n,target:e.target.id||e.target.className,top:Object.getOwnPropertyDescriptor(Element.prototype,'scrollTop').get.call(document.querySelector('#scroll'))}),true);BDC.state({generation:2701,position:75000,playing:false,visible:true});});
 await page.waitForTimeout(120);await page.mouse.move(60,310);await page.mouse.wheel(0,300);await page.waitForTimeout(150);
 if(!await page.locator('#resume').isVisible())throw Error('Wheel during motion did not pause follow '+JSON.stringify(await page.evaluate(()=>({wheelEvents,logs:bridgeCalls.slice(-10)}))));
 await page.locator('#resume').click();await page.waitForTimeout(950);
 if(await page.locator('#resume').isVisible())throw Error('Resume false manual pause');
 await page.locator('.blyrics--line').nth(10).click();
 const seek=await page.evaluate(()=>bridgeCalls.filter(c=>c[0]==='seek').at(-1)?.[1]);if(!Number.isFinite(seek))throw Error('No real lyric seek');
 await page.evaluate(position=>BDC.state({generation:2701,position,playing:false,visible:true}),seek);await page.waitForTimeout(950);
 if(await page.locator('#resume').isVisible())throw Error('Seek left manual pause');
 await page.evaluate(()=>{BDC.visible(false);BDC.state({generation:2701,position:120000,playing:false,visible:false});BDC.visible(true);});await page.waitForTimeout(950);
 // Delayed 2x snapshot should advance by snapshot age * 2, rather than applying elapsed time twice.
 await page.evaluate(async()=>{
  BDC.track({generation:2702,title:'Clock fixture',artist:'Local',duration:120,videoId:'local-clock'});
  const raw=Array.from({length:120},(_,i)=>`[${String(Math.floor(i/60)).padStart(2,'0')}:${String(i%60).padStart(2,'0')}.00]Clock line ${i}`).join('\n');
  await BDC.source(2702,{key:'lrclib-synced',source:'LRCLib',format:'lrc',raw});BDC.settings({reducedMotion:true});
  BDC.state({generation:2702,position:10000,playing:true,rate:2,sampledAt:Date.now()-1500,visible:true});
 });await page.waitForTimeout(220);
 const clock=await page.evaluate(()=>Array.from(document.querySelectorAll('.blyrics--active')).map(el=>el.textContent));
 if(!clock.some(s=>/Clock line (13|14)\b/.test(s)))throw Error('Delayed 2x clock wrong '+JSON.stringify(clock));
 await page.evaluate(()=>BDC.state({generation:2702,position:4000,playing:false,rate:2,visible:true}));await page.waitForTimeout(60);
 const paused=await page.evaluate(()=>Array.from(document.querySelectorAll('.blyrics--active')).map(el=>el.textContent));
 if(!paused.some(s=>s.includes('Clock line 4')))throw Error('Paused/backward seek wrong '+JSON.stringify(paused));
 const reduced=await page.evaluate(()=>{const e=document.querySelector('#scroll');return Math.abs(e.scrollTop-Object.getOwnPropertyDescriptor(Element.prototype,'scrollTop').get.call(e));});
 if(reduced>1)throw Error('Reduced motion animated viewport');
 await page.evaluate(async()=>{BDC.track({generation:2703,title:'Passive',artist:'Local',duration:120,videoId:'local-plain'});BDC.settings({reducedMotion:false,passive:true});await BDC.source(2703,{key:'lrclib-plain',source:'LRCLib',format:'plain',raw:Array.from({length:50},(_,i)=>'Untimed local line '+i).join('\n')});BDC.state({generation:2703,position:10000,playing:true,visible:true});});await page.waitForTimeout(500);
 const plain=await page.evaluate(()=>({scroll:document.querySelector('#scroll').scrollTop,paused:!document.querySelector('#resume').hidden}));if(plain.paused||plain.scroll<=0)throw Error('Plain passive follow failed '+JSON.stringify(plain));
 if(errors.length)throw Error(JSON.stringify(errors));
 return {passed:true,cases,wheelDuringMotion:true,seekMs:seek,delayedRate2:clock,pausedBackSeek:paused,plain,reducedMotion:true,phoneVerified:false,errors};
}


