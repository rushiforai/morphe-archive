async(page)=>{
 const errors=[];page.on('pageerror',e=>errors.push(e.message));
 await page.addInitScript(()=>{window.bridgeCalls=[];window.BDNative=Object.fromEntries(['ready','displayed','noLyrics','pin','dock','copy','refresh','connect','configure','toggle','offset','diagnostic','seek'].map(n=>[n,(...a)=>bridgeCalls.push([n,...a])]));});
 await page.setViewportSize({width:412,height:820});
 async function load(reference){
  await page.unroute('**/renderer.js');await page.route('**/renderer.js',r=>r.fulfill({path:reference?"C:/Morphe/App's/YT-Music/Personal-Patches/output/playwright/revision28-reference-renderer.js":"C:/Morphe/App's/YT-Music/Personal-Patches/patches/src/main/resources/bdcrusher-lyrics/renderer.js",contentType:'application/javascript'}));await page.reload();
  await page.evaluate(async()=>{
   BDC.track({generation:2800,title:'Local motion fixture',artist:'Local',duration:180,videoId:'local-motion'});BDC.settings({priority:[],disabled:[],fontSize:28,translation:false,romanization:false,letterWave:false,wordSync:true,reducedMotion:false,dockCollapsed:true});
   await BDC.source(2800,{key:'lrclib-synced',source:'Local',format:'lrc',raw:Array.from({length:65},(_,i)=>`[${String(Math.floor(i*2/60)).padStart(2,'0')}:${String(i*2%60).padStart(2,'0')}.00]Locally authored lyric number ${i}`).join('\n')});BDC.state({generation:2800,position:20000,playing:false,visible:true});
  });await page.waitForTimeout(1100);
  return await page.evaluate(async()=>{
   BDC.state({generation:2800,position:22000,playing:false,visible:true});await new Promise(r=>setTimeout(r,60));
   const animations=document.getAnimations().filter(a=>a.effect?.target?.classList.contains('blyrics--line')).map(a=>({frames:a.effect.getKeyframes().map(f=>({transform:f.transform,translate:f.translate,easing:f.easing,offset:f.computedOffset})),duration:a.effect.getTiming().duration,delay:a.effect.getTiming().delay,easing:a.effect.getTiming().easing}));
   return {animations,customViewportHook:typeof document.querySelector('#scroll').__bdScrollTo};
  });
 }
 const reference=await load(true),actual=await load(false);
 const scrollAnimations=actual.animations.filter(a=>a.frames.some(f=>f.translate));
 if(scrollAnimations.length<2||JSON.stringify(reference.animations)!==JSON.stringify(actual.animations)||actual.customViewportHook!=='undefined')throw Error('Extension animation mismatch '+JSON.stringify({reference,actual}));
 await page.evaluate(()=>BDC.state({generation:2800,position:30000,playing:true,visible:true}));await page.waitForTimeout(120);await page.mouse.move(60,310);await page.mouse.wheel(0,300);await page.waitForTimeout(130);
 if(!await page.locator('#resume').isVisible())throw Error('Real gesture did not pause during extension scroll');await page.locator('#resume').click();await page.waitForTimeout(1000);if(await page.locator('#resume').isVisible())throw Error('Resume failed');
 await page.locator('.blyrics--line').nth(12).click();const seek=await page.evaluate(()=>bridgeCalls.filter(c=>c[0]==='seek').at(-1)?.[1]);if(!Number.isFinite(seek))throw Error('Seek missing');await page.evaluate(position=>BDC.state({generation:2800,position,playing:false,visible:true}),seek);await page.waitForTimeout(1000);if(await page.locator('#resume').isVisible())throw Error('Seek left follow paused');
 const trace=await page.evaluate(()=>new Promise(resolve=>{
  const start=performance.now(),frames=[];const line=document.querySelectorAll('.blyrics--line')[17];const timer=setInterval(()=>BDC.state({generation:2800,position:28000+performance.now()-start,playing:true,visible:true}),100);
  function f(t){frames.push({t,y:line.getBoundingClientRect().top});if(t-start<5000)requestAnimationFrame(f);else{clearInterval(timer);BDC.state({generation:2800,position:33000,playing:false,visible:true});const delta=frames.slice(1).map((v,i)=>v.y-frames[i].y);resolve({frames:frames.length,reverse:delta.filter(d=>d>2).length,maxStep:Math.max(...delta.map(d=>-d))});}}requestAnimationFrame(f);
 }));
 if(trace.reverse||trace.maxStep>70)throw Error('Visual line trace unstable '+JSON.stringify(trace));
 const headers={'User-Agent':'BDCrusher-YTMusic-Lyrics/0.1 (personal Android client)','Accept':'application/json, text/event-stream'};
 const cases=[];for(const [id,url,key] of [['sN_tJ8d3c0I','https://api.betterlyrics.org/getLyrics?s=Wake+Up&a=Imagine+Dragons&al=LOOM&d=167','bLyrics-richsynced'],['MYal8NoVQXs','https://unison.betterlyrics.org/lyrics?v=MYal8NoVQXs','unison-richsynced']]){
  const response=await page.request.get(url,{headers});if(!response.ok())throw Error('HTTP '+response.status());const data=await response.json();
  const result=await page.evaluate(async({id,key,data})=>{BDC.track({generation:2801,title:'Live recording fixture',artist:'Local',duration:260,videoId:id});BDC.settings({letterWave:true});await BDC.source(2801,key.startsWith('unison')?{kind:'unison',data}:{key,source:'Better Lyrics',format:'ttml',raw:data.ttml});BDC.state({generation:2801,position:20000,playing:true,visible:true});return {key:document.querySelector('#sources').value,letters:document.querySelectorAll('.blyrics--letter').length};},{id,key,data});if(result.key!==key||!result.letters)throw Error('Rich decode failed');await page.waitForTimeout(800);cases.push({videoId:id,...result});
 }
 await page.evaluate(()=>{BDC.notice(2801,'Connect sources to enable additional providers',true);});if(!await page.locator('#connection').isVisible()||!await page.locator('#connect').isVisible())throw Error('Additional provider connection status hidden by valid lyrics');
 await page.evaluate(()=>{BDC.settings({reducedMotion:true});BDC.state({generation:2801,position:120000,playing:false,visible:true});});await page.waitForTimeout(100);
 if(errors.length)throw Error(JSON.stringify(errors));
 return {passed:true,exactUpstreamLineAnimations:true,lineAnimations:actual.animations.length,scrollAnimations:scrollAnimations.length,firstTiming:scrollAnimations[0],customViewportHook:false,manualResumeSeek:true,trace,cases,connectionExplanationVisible:true,reducedMotion:true,phoneVerified:false,errors};
}
