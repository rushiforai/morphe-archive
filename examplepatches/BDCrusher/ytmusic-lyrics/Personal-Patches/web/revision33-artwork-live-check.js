async page=>{
 const base="C:/Morphe/App's/YT-Music/",tab=await page.context().newPage();
 await tab.addInitScript(()=>{window.proofs={};window.BDShader={ready(){},failure(){},proof(id,value){proofs[id]=value;}};});
 await tab.route('**/artwork-live',r=>r.fulfill({path:base+'Personal-Patches/patches/src/main/resources/bdcrusher-shaders/index.html',contentType:'text/html'}));
 await tab.route('**/shaders.js',r=>r.fulfill({path:base+'Personal-Patches/patches/src/main/resources/bdcrusher-shaders/shaders.js',contentType:'application/javascript'}));
 try{
  await tab.goto('http://127.0.0.1:8766/artwork-live');
  const challenge=await page.request.get('https://artwork.boidu.dev/challenge',{timeout:25000});if(!challenge.ok())throw Error('Artwork challenge HTTP '+challenge.status());
  const body=await challenge.json();await tab.evaluate(challenge=>{BDS.solve(1,challenge);},body);
  await tab.waitForFunction(()=>typeof proofs[1]==='string',null,{timeout:65000});
  const solution=await tab.evaluate(()=>proofs[1]);if(!solution)throw Error('Normal artwork proof not solved');
  const mint=await page.request.post('https://artwork.boidu.dev/mint',{data:{challenge:body,solution:JSON.parse(solution)},timeout:25000});if(!mint.ok())throw Error('Artwork mint HTTP '+mint.status());
  const token=(await mint.json()).token;if(typeof token!=='string')throw Error('Artwork token absent');
  const response=await page.request.get('https://artwork.boidu.dev/?s=MAMMAMIA&a=M%C3%A5neskin&al=&d=0',{headers:{Authorization:'Bearer '+token},timeout:25000});if(!response.ok())throw Error('Artwork lookup HTTP '+response.status());
  const result=await response.json();if(typeof result.videoUrl!=='string'||!result.videoUrl.includes('.mp4'))throw Error('No progressive artwork file');
  const file=await page.request.get(result.videoUrl,{timeout:60000});if(!file.ok())throw Error('Artwork MP4 HTTP '+file.status());const bytes=await file.body();if(bytes.length>128*1024*1024)throw Error('Artwork test file too large');
  await tab.route('**/fixture-cover.mp4',r=>r.fulfill({body:bytes,contentType:'video/mp4'}));
  await tab.route('**/clip-test',r=>r.fulfill({body:'<!doctype html><video muted playsinline preload="auto" style="width:300px;height:300px;object-fit:contain"></video>',contentType:'text/html'}));
  await tab.goto('http://127.0.0.1:8766/clip-test');await tab.evaluate(()=>{const v=document.querySelector('video');v.src='/fixture-cover.mp4';v.muted=true;v.load();});await tab.waitForFunction(()=>document.querySelector('video').readyState>=2,null,{timeout:25000});
  const clip=await tab.evaluate(()=>{const v=document.querySelector('video');return {duration:v.duration,width:v.videoWidth,height:v.videoHeight,error:v.error?.code||0};});if(!Number.isFinite(clip.duration)||clip.duration<=1||clip.error)throw Error('MP4 decoding failed');
  const pending=tab.waitForEvent('download');await tab.evaluate(base64=>{const bytes=Uint8Array.from(atob(base64),c=>c.charCodeAt(0));const a=document.createElement('a');a.href=URL.createObjectURL(new Blob([bytes],{type:'video/mp4'}));a.download='mammamia-cover.mp4';a.click();},bytes.toString('base64'));await(await pending).saveAs(base+'Inputs/revision33-artwork/mammamia-cover.mp4');
  await tab.evaluate(async()=>{const v=document.querySelector('video');v.loop=true;v.currentTime=Math.max(0,v.duration-.5);await v.play();});await tab.waitForTimeout(1400);
  const loop=await tab.evaluate(()=>{const v=document.querySelector('video');return {time:v.currentTime,paused:v.paused,error:v.error?.code||0};});if(loop.paused||loop.error||loop.time>2)throw Error('Artwork end/loop playback failed '+JSON.stringify(loop));
  return {passed:true,normalAltcha:true,videoId:'WHmexVwElEE',song:'MAMMAMIA',artist:'Måneskin',challengeStatus:challenge.status(),mintStatus:mint.status(),lookupStatus:response.status(),mp4Status:file.status(),mp4Bytes:bytes.length,clip,loop,nativeAndroidPlaybackVerified:false,credentialsPersisted:false};
 }finally{await tab.close();}
}
