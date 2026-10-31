async page=>{
 const base="C:/Morphe/App's/YT-Music/",errors=[];
 const tab=await page.context().newPage();tab.on('pageerror',e=>errors.push(e.message));
 await tab.setViewportSize({width:412,height:820});
 await tab.addInitScript(()=>{window.shaderCalls=[];window.__paints=[];window.BDShader=Object.fromEntries(['ready','failure','proof','mediaReady','mediaError'].map(key=>[key,(...a)=>shaderCalls.push([key,...a])]));});
 await tab.route('**/shaders-test',route=>route.fulfill({path:base+'Personal-Patches/patches/src/main/resources/bdcrusher-shaders/index.html',contentType:'text/html'}));
 await tab.route('**/shaders.js',route=>route.fulfill({path:base+'Personal-Patches/output/playwright/revision38-shaders-instrumented.js',contentType:'application/javascript'}));
 await tab.route('**/art.jpg*',route=>route.fulfill({body:'<svg xmlns="http://www.w3.org/2000/svg" width="128" height="128"><defs><linearGradient id="a"><stop stop-color="#ff2244"/><stop offset="1" stop-color="#0044ff"/></linearGradient></defs><rect width="128" height="128" fill="url(#a)"/></svg>',contentType:'image/svg+xml'}));
 await tab.goto('http://127.0.0.1:8766/shaders-test');await tab.waitForFunction(()=>window.BDS&&shaderCalls.some(c=>c[0]==='ready'));
 await tab.evaluate(()=>BDS.state({generation:0,visible:true,playing:true,background:true,image:''}));const emptyHidden=await tab.locator('canvas').evaluate(c=>c.hidden);if(!emptyHidden)throw Error('Uninitialized shader paints a black background');
 await tab.evaluate(()=>{BDS.settings({fps:30,speed:1,strength:1,saturation:1.5,opacity:.75,dimming:.3,transition:1000,animateBackground:true,reducedMotion:false});BDS.state({generation:1,visible:true,playing:true,background:true,cover:false,image:'/art.jpg?one',video:''});});
 await tab.waitForTimeout(1200);
 const frameLimits=[];
 for(const fps of [24,30,60]){
  await tab.evaluate(fps=>{__paints.length=0;BDS.settings({fps,speed:1,strength:1,saturation:1.5,opacity:.75,dimming:.3,animateBackground:true});},fps);await tab.waitForTimeout(1200);
  frameLimits.push(await tab.evaluate(fps=>({fps,frames:__paints.length,width:document.querySelector('canvas').width,height:document.querySelector('canvas').height,maxGap:Math.max(0,...__paints.slice(1).map((x,i)=>x-__paints[i]))}),fps));
 }
 if(frameLimits.some(x=>x.frames<5||x.frames>x.fps*1.35||x.width!==412||x.height!==820))throw Error('Effect pacing or native-sized canvas failed '+JSON.stringify(frameLimits));
 await tab.evaluate(()=>{__paints.length=0;BDS.state({generation:1,visible:false,playing:true,background:true,cover:false,image:'/art.jpg?one',video:''});});await tab.waitForTimeout(220);
 const hidden=await tab.evaluate(()=>__paints.length);if(hidden>1)throw Error('Hidden shader still runs');
 await tab.evaluate(()=>{__paints.length=0;BDS.state({generation:1,visible:true,playing:false,background:true,cover:false,image:'/art.jpg?one',video:''});});await tab.waitForTimeout(220);const paused=await tab.evaluate(()=>__paints.length);if(paused>1)throw Error('Paused shader still runs');
 await tab.evaluate(()=>{__paints.length=0;BDS.settings({fps:30,animateBackground:true,reducedMotion:true});BDS.state({generation:1,visible:true,playing:true,background:true,cover:false,image:'/art.jpg?one',video:''});});await tab.waitForTimeout(220);const reduced=await tab.evaluate(()=>__paints.length);if(reduced>1)throw Error('Reduced motion did not freeze Kawarp');
 await tab.setViewportSize({width:820,height:412});await tab.waitForTimeout(100);const landscape=await tab.evaluate(()=>({w:document.querySelector('canvas').width,h:document.querySelector('canvas').height}));if(landscape.w!==820||landscape.h!==412)throw Error('Canvas did not follow native container dimensions');
 const cdp=await tab.context().newCDPSession(tab);await cdp.send('Emulation.setDeviceMetricsOverride',{width:1080,height:2400,deviceScaleFactor:3.5,mobile:true});await tab.waitForTimeout(120);
 const highDpi=await tab.evaluate(()=>({dpr:devicePixelRatio,w:document.querySelector('canvas').width,h:document.querySelector('canvas').height,htmlVideos:document.querySelectorAll('video').length}));if(highDpi.dpr!==3.5||Math.max(highDpi.w,highDpi.h)>960||highDpi.htmlVideos!==0)throw Error('High DPI creates oversized background or another video decoder '+JSON.stringify(highDpi));await cdp.send('Emulation.clearDeviceMetricsOverride');
 const pointerEvents=await tab.evaluate(()=>[document.body,...document.querySelectorAll('canvas,video')].map(x=>getComputedStyle(x).pointerEvents));if(pointerEvents.some(x=>x!=='none'))throw Error('Effects intercept native gestures');
 await tab.screenshot({path:base+'Personal-Patches/output/playwright/revision38-shaders-still.png'});
 await tab.evaluate(()=>BDS.close());
 if(errors.length)throw Error(JSON.stringify(errors));const failures=await tab.evaluate(()=>shaderCalls.filter(c=>c[0]==='failure'));if(failures.length)throw Error(JSON.stringify(failures));
 await tab.close();return {passed:true,realKawarp:true,frameLimits,hidden,paused,reduced,landscape,highDpi,pointerEvents,emptyHidden,androidWebViewVerified:false,errors};
}
