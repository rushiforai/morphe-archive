async(page)=>{
 await page.reload();
 const outcome=await page.evaluate(async()=>{
  BDC.track({generation:2750,title:'Matching fixture',artist:'Local',duration:30,videoId:'local-match'});BDC.settings({reducedMotion:false,disabled:[],priority:[]});
  await BDC.source(2750,{key:'yt-lyrics',source:'YouTube Music',format:'plain',raw:'Morning light across the room\nTogether we sing'});
  await BDC.source(2750,{key:'bLyrics-richsynced',source:'Better Lyrics',lyrics:[{startTimeMs:1000,durationMs:2000,words:'Completely unrelated lexical material'}]});
  const automatic=document.querySelector('#sources').value,offered=[...document.querySelector('#sources').options].map(x=>x.value);
  document.querySelector('#sources').value='bLyrics-richsynced';document.querySelector('#sources').dispatchEvent(new Event('change'));
  await BDC.source(2750,{key:'lrclib-synced',source:'LRCLib',format:'lrc',raw:'[00:01.00]Morning light across the room\n[00:04.00]Together we sing'});
  const manual=document.querySelector('#sources').value;
  await BDC.source(2750,{event:'provider',data:{provider:'golyrics',results:{lyrics:''}}});
  const afterEmpty=document.querySelector('#sources').value;
  BDC.settings({disabled:['bLyrics-richsynced']});const disabled=document.querySelector('#sources').value;
  return {automatic,offered,manual,afterEmpty,disabled};
 });
 if(outcome.automatic!=='yt-lyrics'||!outcome.offered.includes('bLyrics-richsynced')||outcome.manual!=='bLyrics-richsynced'||outcome.afterEmpty!=='bLyrics-richsynced'||outcome.disabled==='bLyrics-richsynced')throw Error('Selection regression '+JSON.stringify(outcome));
 return {passed:true,...outcome,phoneVerified:false};
}
