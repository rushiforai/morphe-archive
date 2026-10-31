async page=>{
 const tab=await page.context().newPage();await tab.bringToFront();
 await tab.route('**/mammamia.mp4',r=>r.fulfill({path:"C:/Morphe/App's/YT-Music/Inputs/revision33-artwork/mammamia-normalized-fixture.mp4",contentType:'video/mp4'}));
 await tab.route('**/mammamia-test',r=>r.fulfill({body:'<!doctype html><style>body{background:#111}video{width:320px;height:320px;object-fit:contain}</style><video muted playsinline loop></video>',contentType:'text/html'}));
 await tab.goto('http://127.0.0.1:8766/mammamia-test');await tab.evaluate(()=>{const v=document.querySelector('video');v.src='/mammamia.mp4';v.muted=true;v.load();});await tab.waitForFunction(()=>document.querySelector('video').readyState>=2,null,{timeout:30000});
 const metadata=await tab.evaluate(()=>{const v=document.querySelector('video');return {duration:v.duration,width:v.videoWidth,height:v.videoHeight,error:v.error?.code||0,visibility:document.visibilityState};});
 const playback=await tab.evaluate(async()=>{const v=document.querySelector('video');await v.play();const frames=[];for(let i=0;i<4;i++){await new Promise(r=>setTimeout(r,750));frames.push({time:v.currentTime,decoded:v.getVideoPlaybackQuality().totalVideoFrames,dropped:v.getVideoPlaybackQuality().droppedVideoFrames});}return frames;});
 await tab.evaluate(async()=>{const v=document.querySelector('video');v.pause();const done=new Promise(r=>v.addEventListener('seeked',r,{once:true}));v.currentTime=v.duration-.3;await done;await v.play();});await tab.waitForTimeout(2500);
 const loop=await tab.evaluate(()=>{const v=document.querySelector('video');return {time:v.currentTime,duration:v.duration,paused:v.paused,error:v.error?.code||0,ended:v.ended};});
 await tab.screenshot({path:"C:/Morphe/App's/YT-Music/Personal-Patches/output/playwright/revision33-mammamia-frame.png"});await tab.close();
 if(metadata.error||loop.error||loop.paused||loop.time>=loop.duration/2||playback[3].time<=playback[0].time)throw Error('Artwork decode/loop failed '+JSON.stringify({metadata,playback,loop}));
 return {passed:true,videoId:'WHmexVwElEE',metadata,playback,loop,actualServiceFrames:true,referenceTimelineNormalization:true,productionAndroidMuxerVerified:false,phoneVerified:false};
}
