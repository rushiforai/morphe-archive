async page=>{
 const base="C:/Morphe/App's/YT-Music/",fixture=base+'Personal-Patches/output/playwright/revision32-generated-cover.mp4';
 const tab=await page.context().newPage(),errors=[];tab.on('pageerror',e=>errors.push(e.message));
 await tab.addInitScript(()=>{window.__samples=[];window.shaderCalls=[];window.BDShader=Object.fromEntries(['ready','failure','proof','mediaReady','mediaError'].map(k=>[k,(...a)=>shaderCalls.push([k,...a])]));});
 await tab.route('**/shaders-video',r=>r.fulfill({path:base+'Personal-Patches/patches/src/main/resources/bdcrusher-shaders/index.html',contentType:'text/html'}));
 await tab.route('**/shaders.js',r=>r.fulfill({path:base+'Personal-Patches/output/playwright/revision32-shaders-video-instrumented.js',contentType:'application/javascript'}));
 await tab.route('**/cover.mp4*',r=>r.fulfill({path:fixture,contentType:'video/mp4'}));
 await tab.goto('http://127.0.0.1:8766/shaders-video');
 const download=tab.waitForEvent('download');
 const generated=await tab.evaluate(async()=>{
  if(!MediaRecorder.isTypeSupported('video/mp4'))throw Error('MP4 recorder unavailable');
  const c=document.createElement('canvas');c.width=c.height=128;const ctx=c.getContext('2d'),stream=c.captureStream(30),chunks=[];
  const recorder=new MediaRecorder(stream,{mimeType:'video/mp4',videoBitsPerSecond:250000});recorder.ondataavailable=e=>{if(e.data.size)chunks.push(e.data)};
  let running=true,start=performance.now();function draw(now){ctx.fillStyle=`hsl(${((now-start)/1800*360)%360} 100% 50%)`;ctx.fillRect(0,0,128,128);if(running)requestAnimationFrame(draw);}requestAnimationFrame(draw);recorder.start();
  await new Promise(r=>setTimeout(r,2000));const stopped=new Promise(r=>recorder.onstop=r);recorder.stop();await stopped;running=false;stream.getTracks().forEach(t=>t.stop());
  const blob=new Blob(chunks,{type:'video/mp4'}),a=document.createElement('a');a.href=URL.createObjectURL(blob);a.download='generated-cover.mp4';a.click();return {bytes:blob.size,mime:blob.type};
 });await(await download).saveAs(fixture);
 await tab.evaluate(()=>{BDS.settings({fps:30,speed:1,strength:1,saturation:1,opacity:1,dimming:0,animateBackground:true});BDS.state({generation:4,visible:true,playing:true,cover:false,background:true,image:'',video:'http://127.0.0.1:8766/cover.mp4?g=4'});});
 await tab.waitForTimeout(2600);
 const background=await tab.evaluate(()=>({time:document.querySelector('video').currentTime,muted:document.querySelector('video').muted,colors:__samples.map(s=>s.slice(1)),failures:shaderCalls.filter(c=>c[0]==='failure'),ready:shaderCalls.some(c=>c[0]==='mediaReady')}));
 const spread=[0,1,2].map(i=>Math.max(...background.colors.map(c=>c[i]))-Math.min(...background.colors.map(c=>c[i])));
 if(!background.ready||!background.muted||!background.colors.length||Math.max(...spread)<60)throw Error('Animated cover frames did not reach background '+JSON.stringify({background:{...background,colors:background.colors.length},spread}));
 await tab.evaluate(()=>BDS.state({generation:4,visible:true,playing:true,cover:true,background:false,image:'',video:'http://127.0.0.1:8766/cover.mp4?g=4'}));await tab.waitForTimeout(120);const cover=await tab.evaluate(()=>({hidden:document.querySelector('video').hidden,opacity:getComputedStyle(document.querySelector('video')).opacity,paused:document.querySelector('video').paused}));if(cover.hidden||cover.opacity!=='1'||cover.paused)throw Error('Cover-only playback failed');
 await tab.evaluate(()=>BDS.state({generation:4,visible:false,playing:true,cover:true,background:false,image:'',video:'http://127.0.0.1:8766/cover.mp4?g=4'}));const before=await tab.evaluate(()=>document.querySelector('video').currentTime);await tab.waitForTimeout(250);const after=await tab.evaluate(()=>document.querySelector('video').currentTime);if(Math.abs(after-before)>.08)throw Error('Hidden loop did not pause');
 await tab.evaluate(()=>BDS.close());await tab.close();if(errors.length)throw Error(JSON.stringify(errors));return {passed:true,generated,backgroundFollowsAnimatedFrames:true,colorSpread:spread,coverOnly:cover,hiddenTimeDelta:after-before,realProgressiveMp4:true,nativeAndroidDecoderVerified:false,errors};
}
