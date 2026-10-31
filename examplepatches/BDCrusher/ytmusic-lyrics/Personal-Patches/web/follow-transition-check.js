async(page)=>{
  const errors=[];page.on('pageerror',e=>errors.push(e.message));
  await page.addInitScript(()=>{
    window.bridgeCalls=[];window.BDNative=Object.fromEntries(['ready','displayed','noLyrics','pin','dock','copy','refresh','connect','configure','toggle','offset','diagnostic','seek'].map(n=>[n,(...a)=>bridgeCalls.push([n,...a])]));
    window.lineMeasures=0;
    const top=Object.getOwnPropertyDescriptor(HTMLElement.prototype,'offsetTop');
    Object.defineProperty(HTMLElement.prototype,'offsetTop',{...top,get(){if(this.classList.contains('blyrics--line'))lineMeasures++;return top.get.call(this);}});
  });
  await page.setViewportSize({width:412,height:740});
  async function fixture(){await page.evaluate(async()=>{
    document.documentElement.style.setProperty('background','#35110f','important');
    BDC.track({generation:611,title:'Local transition measurement',artist:'Local fixture',duration:180,videoId:'fixture'});
    BDC.settings({fontSize:28,translation:false,romanization:false,dockCollapsed:true,reducedMotion:false});
    await BDC.source(611,{key:'lrclib-synced',source:'Local fixture',format:'lrc',raw:Array.from({length:60},(_,i)=>`[${String(Math.floor(i*2/60)).padStart(2,'0')}:${String(i*2%60).padStart(2,'0')}.00]Locally authored lyric number ${i+1}`).join('\n')});
    BDC.state({generation:611,position:22000,playing:false,visible:true});
  });await page.waitForTimeout(1100);}
  const old="C:/Morphe/App's/YT-Music/Personal-Patches/output/playwright/follow-previous-renderer.js";
  await page.route('**/renderer.js',route=>route.fulfill({path:old,contentType:'application/javascript'}));
  await page.reload();await fixture();
  async function repeatedVisibility(){return page.evaluate(async()=>{const start=lineMeasures;for(let i=0;i<15;i++){BDC.visible(true);await new Promise(r=>setTimeout(r,20));}return lineMeasures-start;});}
  const previousMeasures=await repeatedVisibility();
  await page.unroute('**/renderer.js');await page.route('**/renderer.js',route=>route.fulfill({path:"C:/Morphe/App's/YT-Music/Personal-Patches/patches/src/main/resources/bdcrusher-lyrics/renderer.js",contentType:'application/javascript'}));await page.reload();await fixture();
  const currentMeasures=await repeatedVisibility();
  if(previousMeasures<500||currentMeasures>10)throw Error('Visibility layout regression '+JSON.stringify({previousMeasures,currentMeasures}));
  const dockStart=await page.evaluate(()=>lineMeasures);await page.locator('#collapse').click();await page.waitForTimeout(400);
  const dockMeasures=await page.evaluate(start=>lineMeasures-start,dockStart);
  if(dockMeasures>400)throw Error('Dock remeasured every animation frame: '+dockMeasures);
  const hiddenBars=await page.evaluate(()=>['#scroll','#source-menu','footer span'].map(s=>({selector:s,width:getComputedStyle(document.querySelector(s)).scrollbarWidth,webkit:getComputedStyle(document.querySelector(s),'::-webkit-scrollbar').display})));
  if(hiddenBars.some(x=>x.width!=='none'||x.webkit!=='none'))throw Error('Scrollbar still visible '+JSON.stringify(hiddenBars));
  const motion=await page.evaluate(()=>new Promise(resolve=>{
    const start=performance.now(),frames=[];let last=0;
    const timer=setInterval(()=>{BDC.state({generation:611,position:22000+performance.now()-start,playing:true,visible:true,rate:1});BDC.visible(true);},100);
    const line=document.querySelectorAll('.blyrics--line')[13];
    function frame(now){const y=line.getBoundingClientRect().top;frames.push({dt:now-last,y,active:document.querySelectorAll('.blyrics--active').length});last=now;if(now-start<4500)requestAnimationFrame(frame);else{clearInterval(timer);BDC.state({generation:611,position:26500,playing:false,visible:true});const steps=frames.slice(1).map((x,i)=>x.y-frames[i].y);resolve({frames:frames.length,reverseSteps:steps.filter(d=>d>2).length,maxForwardStep:Math.max(...steps.map(d=>-d)),active:frames.at(-1).active});}}requestAnimationFrame(frame);
  }));
  if(motion.reverseSteps||motion.maxForwardStep>45||!motion.active)throw Error('Transition discontinuity '+JSON.stringify(motion));
  await page.waitForTimeout(2200);await page.locator('#scroll').hover();await page.mouse.wheel(0,450);await page.waitForTimeout(150);
  if(!await page.locator('#resume').isVisible())throw Error('Manual scroll did not pause follow');
  await page.locator('#resume').click();await page.waitForTimeout(1000);
  if(await page.locator('#resume').isVisible())throw Error('Resume follow failed');
  await page.evaluate(()=>BDC.settings({reducedMotion:true,dockCollapsed:true}));await page.waitForTimeout(100);
  const reduced=await page.locator('#dock-content').evaluate(x=>getComputedStyle(x).transitionDuration);
  if(reduced!=='0s')throw Error('Reduced motion regression');
  await page.screenshot({path:'output/playwright/follow-final-collapsed.png'});
  if(errors.length)throw Error(errors.join('\n'));
  return {passed:true,previousMeasures,currentMeasures,dockMeasures,hiddenBars,motion,manualAndResume:true,reducedMotion:true,phoneVerified:false};
}
