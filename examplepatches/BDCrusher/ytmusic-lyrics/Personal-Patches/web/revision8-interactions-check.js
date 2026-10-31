async(page)=>{
  const errors=[];page.on('pageerror',error=>errors.push(error.message));
  await page.addInitScript(()=>{window.bridgeCalls=[];window.BDNative=Object.fromEntries(['ready','displayed','noLyrics','pin','dock','copy','refresh','connect','configure','toggle','offset','diagnostic','seek'].map(name=>[name,(...args)=>window.bridgeCalls.push([name,...args])]));});
  await page.reload();await page.setViewportSize({width:412,height:820});
  const nativeHeaders={'User-Agent':'BDCrusher-YTMusic-Lyrics/0.1 (personal Android client)','Accept':'application/json, text/event-stream'};
  const response=await page.request.get('https://unison.betterlyrics.org/lyrics?v=MYal8NoVQXs',{headers:nativeHeaders});
  if(!response.ok())throw Error('Exact recording lookup HTTP '+response.status());
  const data=await response.json();
  if(data.data.videoId!=='MYal8NoVQXs')throw Error('Wrong recording returned');
  await page.evaluate(async(data)=>{
    BDC.track({generation:990,title:'Love Me Dead (Female Cover)',artist:'CottontailVA Music',duration:0,videoId:'MYal8NoVQXs'});
    BDC.settings({disabled:[],priority:[],translation:false,romanization:false,letterWave:true,wordSync:true,reducedMotion:false});
    await BDC.source(990,{kind:'unison',data});
  },data);
  const cover=await page.evaluate(()=>({selected:document.querySelector('#sources').value,lines:document.querySelectorAll('.blyrics--line').length,letters:document.querySelectorAll('.blyrics--letter').length}));
  if(cover.selected!=='unison-richsynced'||cover.lines<10||cover.letters<1)throw Error('Cover TTML failed: '+JSON.stringify(cover));
  await page.evaluate(async()=>{
    BDC.track({generation:991,title:'Local glass and follow fixture',artist:'Local fixture',duration:160,videoId:'fixture'});
    BDC.settings({reducedMotion:false,translation:false,romanization:false,dockCollapsed:false,fontSize:28});
    const raw=Array.from({length:32},(_,i)=>`[${String(Math.floor(i*4/60)).padStart(2,'0')}:${String(i*4%60).padStart(2,'0')}.00]Locally authored line ${i+1}`).join('\n');
    await BDC.source(991,{key:'lrclib-synced',source:'LRCLib',format:'lrc',raw});
    await BDC.source(991,{key:'bLyrics-synced',source:'Better Lyrics',format:'lrc',raw});
    await BDC.source(991,{key:'binimum-synced',source:'BiniLyrics',format:'lrc',raw});
    BDC.state({generation:991,position:8000,playing:false,visible:true});
    document.documentElement.style.setProperty('background','#35110f','important');
    window.originalLine=document.querySelector('.blyrics--line');
    BDC.settings({offset:100});
    window.lineSurvived=originalLine===document.querySelector('.blyrics--line');
  });
  await page.waitForTimeout(300);
  await page.locator('#source-label').click();await page.waitForTimeout(200);
  const flyout=await page.evaluate(()=>{
    const menu=document.querySelector('#source-menu'),rect=menu.getBoundingClientRect(),pill=document.querySelector('#source-label').getBoundingClientRect();
    return {bodyPortal:menu.parentElement===document.body,visible:getComputedStyle(menu).opacity,blur:getComputedStyle(menu).backdropFilter,bottom:rect.bottom,pillTop:pill.top,selected:menu.querySelectorAll('.selected').length,noExtraTypeText:!menu.querySelector('small'),width:rect.width};
  });
  if(!flyout.bodyPortal||flyout.visible!=='1'||!flyout.blur.includes('26px')||flyout.bottom>flyout.pillTop||flyout.selected!==1||!flyout.noExtraTypeText)throw Error('Flyout mismatch '+JSON.stringify(flyout));
  await page.screenshot({path:'output/playwright/revision8-glass-flyout.png'});
  await page.keyboard.press('ArrowDown');
  if(await page.locator('#source-menu button:focus').count()!==1)throw Error('Menu keyboard navigation failed');
  await page.keyboard.press('Escape');await page.waitForTimeout(180);
  if(await page.locator('#source-label').getAttribute('aria-expanded')!=='false')throw Error('Escape did not close flyout');
  const layout=await page.evaluate(()=>{
    const dock=document.querySelector('#dock'),scroll=document.querySelector('#scroll');
    const centers=['collapse','previous','next','earlier','later'].map(id=>{const b=document.getElementById(id).getBoundingClientRect(),s=document.querySelector(`#${id} svg`).getBoundingClientRect();return {id,dx:Math.abs(b.x+b.width/2-s.x-s.width/2),dy:Math.abs(b.y+b.height/2-s.y-s.height/2)};});
    return {dockBackground:getComputedStyle(dock).backgroundColor,scrollHeight:scroll.clientHeight,viewport:innerHeight,overlap:scroll.getBoundingClientRect().bottom>dock.getBoundingClientRect().top,pillBlur:getComputedStyle(document.querySelector('.source-pill')).backdropFilter,centers,lineSurvived,tapHighlight:getComputedStyle(document.querySelector('#lyrics')).webkitTapHighlightColor};
  });
  if(!layout.lineSurvived||!layout.overlap||layout.dockBackground!=='rgba(0, 0, 0, 0)'||layout.centers.some(c=>c.dx>1||c.dy>1))throw Error('Overlay/alignment/reset failed '+JSON.stringify(layout));
  // Pause automatic follow with real wheel input, then seek using a lyric's actual click handler.
  // Allow the core's two-second programmatic-scroll suppression to expire after fixture injection.
  await page.evaluate(()=>BDC.state({generation:991,position:8000,playing:true,visible:true}));
  await page.waitForTimeout(2200);
  await page.locator('#scroll').hover();await page.mouse.wheel(0,550);await page.waitForTimeout(250);
  if(!await page.locator('#resume').isVisible())throw Error('Manual scrolling did not pause follow');
  await page.locator('.blyrics--line').nth(8).click();
  const target=await page.evaluate(()=>bridgeCalls.filter(c=>c[0]==='seek').at(-1)?.[1]);
  if(!Number.isFinite(target))throw Error('Lyric click did not seek');
  await page.evaluate(position=>BDC.state({generation:991,position,playing:false,visible:true}),target);
  await page.waitForTimeout(1200);
  if(await page.locator('#resume').isVisible())throw Error('Seek did not resume extension follow');
  const follow=await page.evaluate(()=>({active:document.querySelectorAll('.blyrics--active').length,tap:getComputedStyle(document.querySelector('#lyrics')).webkitTapHighlightColor,scrollTop:document.querySelector('#scroll').scrollTop}));
  if(!follow.active||follow.tap!=='rgba(0, 0, 0, 0)')throw Error('Seek highlighting failed '+JSON.stringify(follow));
  await page.locator('#collapse').click();await page.waitForTimeout(280);await page.screenshot({path:'output/playwright/revision8-glass-collapsed.png'});
  await page.evaluate(()=>BDC.settings({reducedMotion:true,dockCollapsed:false}));
  await page.locator('#source-label').click();await page.waitForTimeout(30);
  const reduced=await page.locator('#source-menu').evaluate(m=>getComputedStyle(m).transitionDuration);
  if(reduced!=='0s')throw Error('Flyout ignores reduced motion');
  if(errors.length)throw Error(JSON.stringify(errors));
  return {passed:true,cover:{...cover,videoId:data.data.videoId,ttmlChars:data.data.lyrics.length},flyout,layout,follow,seekMs:target,reducedMotion:true,errors};
}
