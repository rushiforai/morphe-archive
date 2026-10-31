async page=>{
 const errors=[];page.on('pageerror',e=>errors.push(e.message));
 await page.addInitScript(()=>{window.bridgeCalls=[];window.BDNative=Object.fromEntries(['ready','displayed','noLyrics','pin','dock','copy','refresh','connect','configure','diagnostics','toggle','offset','cacheResult','diagnostic','seek'].map(n=>[n,(...a)=>bridgeCalls.push([n,...a])]));});
 for(const [file,type] of [['host.css','text/css'],['index.html','text/html'],['renderer.js','application/javascript']]){await page.unroute('**/'+file);await page.route('**/'+file,r=>r.fulfill({path:"C:/Morphe/App's/YT-Music/Personal-Patches/patches/src/main/resources/bdcrusher-lyrics/"+file,contentType:type}));}
 await page.setViewportSize({width:412,height:820});await page.goto('http://127.0.0.1:8766/index.html');
 await page.evaluate(async()=>{
  document.documentElement.style.setProperty('background','linear-gradient(145deg,#371023,#201332)','important');await document.fonts.ready;BDC.track({generation:3300,title:'Local fixture',artist:'Local',duration:180,videoId:'local'});
  BDC.settings({fontSize:28,letterWave:true,wordSync:true,dockCollapsed:true,reducedMotion:false});
  await BDC.source(3300,{key:'lrclib-synced',source:'Local',format:'lrc',raw:'[00:01.00]A locally authored line\n[00:04.00]Another local line'});
  BDC.state({generation:3300,position:1500,playing:false,visible:true});BDC.insets({left:0,right:0,bottom:0});
 });await page.waitForTimeout(350);
 const bottom=await page.locator('#collapse').evaluate(v=>v.getBoundingClientRect().bottom);if(Math.abs(bottom-820)>1)throw Error('Collapsed opener moved above native bottom '+bottom);
 await page.evaluate(()=>BDC.insets({left:0,right:0,bottom:24}));await page.waitForTimeout(100);
 const insetBottom=await page.locator('#collapse').evaluate(v=>v.getBoundingClientRect().bottom);if(Math.abs(insetBottom-796)>1)throw Error('Navigation inset counted more than once '+insetBottom);
 await page.locator('#collapse').click();await page.waitForTimeout(400);
 const expanded=await page.evaluate(()=>({opener:document.querySelector('#collapse').getBoundingClientRect().bottom,source:document.querySelector('.source-row').getBoundingClientRect().top,toolbar:document.querySelector('.toolbar').getBoundingClientRect().top}));if(!(expanded.opener<expanded.source&&expanded.source<expanded.toolbar))throw Error('Expanded collapse is not above controls');
 await page.evaluate(()=>BDC.health(3300,{pending:0,failed:true,connectionNeeded:false}));await page.locator('#source-health').click();
 const popup=await page.evaluate(()=>{let a=document.querySelector('#connection').getBoundingClientRect(),b=document.querySelector('#dock').getBoundingClientRect();return {width:a.width,height:a.height,bottom:a.bottom,dockTop:b.top,text:document.querySelector('#connection').innerText,title:document.querySelector('#source-health').getAttribute('title'),backdrop:getComputedStyle(document.querySelector('#collapse')).backdropFilter};});
 if(popup.bottom>popup.dockTop||popup.width>280||popup.height>116||popup.title||popup.backdrop!=='none'||popup.text.includes('available lyrics have been kept'))throw Error('Status overlaps dock or duplicates messages '+JSON.stringify(popup));
 await page.screenshot({path:"C:/Morphe/App's/YT-Music/Personal-Patches/output/playwright/revision33-status.png"});
 await page.locator('#configure').click();const details=await page.evaluate(()=>bridgeCalls.filter(c=>c[0]==='diagnostics').length);if(details!==1)throw Error('Details did not open diagnostics');
 await page.locator('#collapse').click();await page.waitForTimeout(350);const finalBottom=await page.locator('#collapse').evaluate(v=>v.getBoundingClientRect().bottom);if(Math.abs(finalBottom-796)>1)throw Error('Collapsed opener failed to return to bottom');
 await page.screenshot({path:"C:/Morphe/App's/YT-Music/Personal-Patches/output/playwright/revision33-bottom-opener.png"});
 if(errors.length)throw Error(JSON.stringify(errors));return {passed:true,collapsedBottom:bottom,singleInsetBottom:insetBottom,expandedOrder:expanded,popup,details,phoneVerified:false};
}
