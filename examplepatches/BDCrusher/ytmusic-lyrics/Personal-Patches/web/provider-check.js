async(page)=>{
  const results=[];
  const cases=[
    ['bLyrics-richsynced','golyrics','rich'],['bLyrics-synced','golyrics','line'],
    ['binimum-richsynced','binimum','rich'],['binimum-synced','binimum','line'],
    ['portato-richsynced','qq','qrc'],['legato-synced','kugou','lrc'],
    ['musixmatch-richsync','musixmatch','word'],['musixmatch-synced','musixmatch','lrc'],
    ['lrclib-synced','lrclib','lrc'],['lrclib-plain','lrclib','plain'],
    ['unison-richsynced','unison','rich'],['unison-wordsynced','unison','word'],
    ['unison-synced','unison','lrc'],['unison-plain','unison','plain'],
    ['yt-captions','native','normal'],['yt-lyrics','native','plain'],
  ];
  let generation=100;
  for(const [key,provider,format] of cases){
    const observed=await page.evaluate(async({key,provider,format,generation})=>{
      const rich='<tt xmlns="http://www.w3.org/ns/ttml"><body><div><p begin="1s" end="4s"><span begin="1s" end="2s">A </span><span begin="2s" end="4s">quiet start</span></p></div></body></tt>';
      const line='<tt xmlns="http://www.w3.org/ns/ttml"><body><div><p begin="1s" end="4s">A quiet start</p></div></body></tt>';
      const lrc='[00:01.00]A quiet start\n[00:04.00]Another line';
      const word='[00:01.00]<00:01.00>A <00:02.00>quiet <00:03.00>start<00:04.00>';
      const plain='A quiet start\nAnother line';
      window.BDC.track({generation,title:'Source decoder fixture',artist:'Local fixture',duration:12,videoId:'fixture'});
      window.BDC.settings({translation:false,romanization:false});
      if(provider==='unison'){
        const type=format==='rich'?'ttml':format==='plain'?'plain':'lrc';
        await window.BDC.source(generation,{kind:'unison',data:{data:{format:type,syncType:format==='word'?'richsync':'linesync',lyrics:format==='rich'?rich:format==='word'?word:format==='plain'?plain:lrc}}});
      }else if(provider==='native'){
        await window.BDC.source(generation,format==='plain'?{key,source:'Native fixture',format:'plain',raw:plain}:
          {key,source:'Native fixture',lyrics:[{startTimeMs:1000,durationMs:3000,words:'A quiet start'}]});
      }else{
        let response;
        if(provider==='golyrics')response={lyrics:format==='rich'?rich:line};
        if(provider==='binimum')response={lyrics:format==='rich'?rich:line,timingType:format==='rich'?'syllable':'line'};
        if(provider==='qq')response={lyrics:JSON.stringify({lyrics:'[1000,3000]A(1000,500) quiet(1500,1000) start(2500,1500)'})};
        if(provider==='kugou')response={lyrics:JSON.stringify({lyrics:lrc})};
        if(provider==='musixmatch')response=format==='word'?{wordByWord:word}:{synced:lrc};
        if(provider==='lrclib')response=format==='plain'?{plain}:{synced:lrc};
        await window.BDC.source(generation,{event:'provider',data:{provider,results:response}});
      }
      window.BDC.state({generation,position:1800,playing:false,visible:true,rate:1});
      return {key:document.querySelector('#sources').value,lines:document.querySelectorAll('.blyrics--line').length};
    },{key,provider,format,generation:generation++});
    if(observed.key!==key||!observed.lines)throw Error('Source decode failed '+key+': '+JSON.stringify(observed));
    results.push({key,passed:true});
  }
  const rejection=await page.evaluate(async()=>{
    window.BDC.track({generation:500,title:'Matching fixture',artist:'Local',duration:30,videoId:'match'});
    await window.BDC.source(500,{key:'yt-lyrics',source:'YouTube Music',format:'plain',raw:'Morning light across the room\nTogether we sing'});
    await window.BDC.source(500,{key:'bLyrics-richsynced',source:'Wrong song',lyrics:[{startTimeMs:1000,durationMs:2000,words:'Completely unrelated lexical material'}]});
    return document.querySelector('#sources').value;
  });
  if(rejection!=='yt-lyrics')throw Error('Wrong-song guard did not reject mismatching text');
  await page.evaluate(()=>{
    window.BDC.settings({backgroundColor:'#ffffff',textColor:'#111111',fontSize:32,reducedMotion:true});
    window.BDC.state({generation:500,position:2000,playing:false,visible:true,rate:1});
  });
  await page.setViewportSize({width:360,height:720});
  const light=await page.evaluate(()=>({background:getComputedStyle(document.body).backgroundColor,
    inactive:getComputedStyle(document.documentElement).getPropertyValue('--blyrics-lyric-inactive-color'),
    overflow:document.documentElement.scrollWidth>innerWidth,letters:document.querySelectorAll('.blyrics--letter').length}));
  if(light.background!=='rgba(0, 0, 0, 0)'||light.overflow||light.letters!==0)throw Error('Light/reduced-motion narrow layout failed: '+JSON.stringify(light));
  await page.screenshot({path:'output/playwright/beta2-light-narrow.png'});
  await page.evaluate(()=>window.BDC.visible(false));
  await page.evaluate(()=>window.BDC.visible(true));
  return {passed:true,providerVariants:results,wrongSongRejected:true,light,navigator:await page.evaluate(()=>navigator.userAgent)};
}

