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
  return {passed:true,normalAltcha:true,videoId:'WHmexVwElEE',song:'MAMMAMIA',artist:'Maneskin',challengeStatus:challenge.status(),mintStatus:mint.status(),lookupStatus:response.status(),progressiveMp4Available:true,mediaDownloaded:false,nativeAndroidPlaybackVerified:false,credentialsPersisted:false};
 }finally{await tab.close();}
}
