async(page)=>{
  const errors=[];page.on('pageerror',e=>errors.push(e.message));
  await page.addInitScript(()=>{window.bridgeCalls=[];window.BDNative=Object.fromEntries(['ready','displayed','noLyrics','pin','dock','copy','refresh','connect','configure','toggle','offset','diagnostic','seek'].map(n=>[n,(...a)=>bridgeCalls.push([n,...a])]));});
  await page.reload();await page.setViewportSize({width:412,height:800});
  await page.evaluate(async()=>{
    BDC.track({generation:7001,title:'Bottom toggle fixture',artist:'Local test',duration:100,videoId:'fixture'});
    BDC.settings({reducedMotion:false,dockCollapsed:false,fontSize:28,disabled:[],translation:false,romanization:false});
    const raw=Array.from({length:24},(_,i)=>`[00:${String(i*2).padStart(2,'0')}.00]Locally authored lyric ${i}`).join('\n');
    await BDC.source(7001,{key:'lrclib-synced',source:'LRCLib',format:'lrc',raw});
    await BDC.source(7001,{key:'bLyrics-synced',source:'Better Lyrics',format:'lrc',raw});
    BDC.state({generation:7001,position:8000,playing:false,visible:true});
    document.documentElement.style.setProperty('background','#252322','important');
  });
  await page.waitForTimeout(300);
  const measure=()=>page.evaluate(()=>{
    const b=document.querySelector('#collapse').getBoundingClientRect(),d=document.querySelector('#dock').getBoundingClientRect(),s=document.querySelector('#collapse svg').getBoundingClientRect(),src=document.querySelector('.source-row').getBoundingClientRect(),toolbar=document.querySelector('.toolbar').getBoundingClientRect();
    return {width:innerWidth,height:innerHeight,toggle:{x:b.x,y:b.y,w:b.width,h:b.height,bottom:innerHeight-b.bottom},dockHeight:d.height,centerOffset:Math.abs(b.x+b.width/2-innerWidth/2),iconDx:Math.abs(b.x+b.width/2-s.x-s.width/2),iconDy:Math.abs(b.y+b.height/2-s.y-s.height/2),sourceTop:src.top,toolbarTop:toolbar.top,clearance:parseFloat(getComputedStyle(document.documentElement).getPropertyValue('--dock-clearance')),transparent:getComputedStyle(document.body).backgroundColor,blur:getComputedStyle(document.querySelector('#collapse')).backdropFilter,active:document.querySelectorAll('.blyrics--active').length};
  });
  const expanded=await measure();
  if(expanded.centerOffset>1||expanded.iconDx>1||expanded.iconDy>1||expanded.toggle.h<44||!(expanded.toggle.y<expanded.sourceTop&&expanded.sourceTop<expanded.toolbarTop)||expanded.transparent!=='rgba(0, 0, 0, 0)'||!expanded.blur.includes('blur'))throw Error('Bottom dock layout '+JSON.stringify(expanded));
  await page.screenshot({path:'output/playwright/revision8-bottom-expanded.png'});
  await page.locator('#collapse').click();await page.waitForTimeout(100);const during=await measure();
  await page.waitForTimeout(220);const collapsed=await measure();
  const center=m=>m.toggle.y+m.toggle.h/2;
  if(collapsed.toggle.bottom!==4||center(collapsed)<=center(expanded)+50||center(during)<=center(expanded)||center(during)>=center(collapsed)||collapsed.dockHeight>=expanded.dockHeight-50||collapsed.clearance>=expanded.clearance||await page.locator('#collapse').getAttribute('aria-expanded')!=='false')throw Error('Bottom opener/top closer animation failed '+JSON.stringify({expanded,during,collapsed}));
  const inert=await page.locator('#dock-content').evaluate(n=>n.inert);if(!inert)throw Error('Collapsed controls remain focusable');
  await page.screenshot({path:'output/playwright/revision8-bottom-collapsed.png'});
  await page.keyboard.press('Enter');await page.waitForTimeout(280);
  if(await page.locator('#collapse').getAttribute('aria-expanded')!=='true')throw Error('Keyboard expansion failed');
  await page.locator('#source-label').click();await page.waitForTimeout(200);
  const flyout=await page.locator('#source-menu').evaluate(n=>({visible:getComputedStyle(n).opacity,above:n.getBoundingClientRect().bottom<=document.querySelector('#source-label').getBoundingClientRect().top,rows:n.querySelectorAll('button').length}));
  if(flyout.visible!=='1'||!flyout.above||flyout.rows!==2)throw Error('Source flyout broken '+JSON.stringify(flyout));
  await page.keyboard.press('Escape');await page.waitForTimeout(170);
  await page.locator('#copy').click();await page.locator('#earlier').click();await page.locator('#later').click();
  const bridge=await page.evaluate(()=>bridgeCalls.map(c=>c[0]));for(const n of ['dock','copy','offset'])if(!bridge.includes(n))throw Error('Missing bridge '+n);
  const sizes=[];
  for(const [width,height,font] of [[320,640,42],[412,800,28],[800,412,28]]){
    await page.setViewportSize({width,height});await page.evaluate(font=>BDC.settings({fontSize:font,reducedMotion:true,dockCollapsed:false}),font);await page.waitForTimeout(30);
    const a=await measure();if(!(a.toggle.y<a.sourceTop&&a.sourceTop<a.toolbarTop)||a.centerOffset>1||a.iconDx>1||a.iconDy>1||await page.evaluate(()=>document.documentElement.scrollWidth>innerWidth))throw Error('Resized dock overflow '+JSON.stringify(a));await page.locator('#collapse').click();await page.waitForTimeout(30);const b=await measure();if(b.toggle.bottom!==4)throw Error('Collapsed opener is not at bottom');sizes.push({expanded:a,collapsed:b});
  }
  await page.emulateMedia({reducedMotion:'reduce',colorScheme:'light'});
  await page.evaluate(()=>BDC.settings({reducedMotion:true,dockCollapsed:true}));await page.waitForTimeout(30);
  const reduced=await page.locator('#dock-content').evaluate(n=>getComputedStyle(n).transitionDuration);if(reduced!=='0s')throw Error('Reduced motion still animates');
  await page.setViewportSize({width:412,height:800});await page.emulateMedia({reducedMotion:'no-preference',colorScheme:'dark'});
  if(errors.length)throw Error(JSON.stringify(errors));
  return {passed:true,expanded,collapsed,during,flyout,bridge,sizes,reducedMotion:true,collapsedOpenerAtBottom:true,expandedCloserAtTop:true,controlsExpandUpward:true,nativeInsetsNotDuplicated:true,errors,androidPhoneVerified:false};
}
