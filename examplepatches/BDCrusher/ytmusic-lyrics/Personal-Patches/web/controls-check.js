async(page)=>{
  const errors=[];page.on('pageerror',error=>errors.push(error.message));
  await page.addInitScript(()=>{
    window.bridgeCalls=[];
    window.BDNative=Object.fromEntries(['ready','displayed','noLyrics','pin','dock','copy','refresh','connect','configure','toggle','offset','diagnostic','enrich','seek'].map(name=>[name,(...args)=>window.bridgeCalls.push([name,...args])]));
  });
  await page.reload();
  await page.setViewportSize({width:412,height:820});
  await page.evaluate(async()=>{
    window.BDC.track({generation:901,title:'Dock fixture',artist:'Local verification',duration:40,videoId:'fixture'});
    window.BDC.settings({letterWave:true,wordSync:true,reducedMotion:false,dockCollapsed:false,disabled:[],agents:{},textColor:'#ffffff',fontSize:28});
    await window.BDC.source(901,{key:'lrclib-synced',source:'LRCLib',format:'lrc',raw:'[00:01.00]A quiet beginning\n[00:04.00]An answering voice'});
  });
  const response=await page.request.get('https://api.betterlyrics.org/getLyrics?s=Wake%20Up&a=Imagine%20Dragons&al=LOOM&d=167');
  if(!response.ok())throw Error('Public Better Lyrics regression lookup HTTP '+response.status());
  const payload=await response.json();
  await page.evaluate(async(raw)=>window.BDC.source(901,{key:'bLyrics-richsynced',source:'Better Lyrics',format:'ttml',raw}),payload.ttml);
  const live=await page.evaluate(()=>({selected:document.querySelector('#sources').value,lines:document.querySelectorAll('.blyrics--line').length,parts:document.querySelectorAll('.blyrics--word').length,letters:document.querySelectorAll('.blyrics--letter').length,label:document.querySelector('#source-name').textContent,counter:document.querySelector('#source-position').textContent}));
  if(live.selected!=='bLyrics-richsynced'||live.lines<10||live.letters<1)throw Error('Live TTML promotion/rendering failed: '+JSON.stringify(live));
  await page.evaluate(()=>window.BDC.settings({priority:['lrclib-synced']}));
  if(await page.locator('#sources').inputValue()!=='lrclib-synced')throw Error('Priority reorder failed');
  await page.evaluate(()=>window.BDC.settings({priority:[]}));
  if(await page.locator('#sources').inputValue()!=='bLyrics-richsynced')throw Error('Default order restore failed');
  await page.locator('#next').click();
  if(await page.locator('#sources').inputValue()!=='lrclib-synced')throw Error('Source cycling failed');
  await page.locator('#previous').click();
  const clearPin=await page.evaluate(()=>window.bridgeCalls.filter(c=>c[0]==='pin').at(-1)?.[2]);
  if(clearPin!=='')throw Error('Choosing highest-priority source did not clear the saved pin');
  await page.locator('#copy').click();
  await page.locator('#earlier').click();await page.locator('#later').click();
  const expanded=await page.locator('#dock').boundingBox();
  const layers=await page.evaluate(()=>({chevron:document.querySelector('#collapse').getBoundingClientRect().top,source:document.querySelector('.source-row').getBoundingClientRect().top,defaults:document.querySelector('.toolbar').getBoundingClientRect().top,background:getComputedStyle(document.body).backgroundColor,icon:document.querySelector('#source-icon svg')?.outerHTML.length}));
  if(!(layers.chevron<layers.source&&layers.source<layers.defaults)||layers.background!=='rgba(0, 0, 0, 0)'||!layers.icon)throw Error('Dock layers/theme failed');
  await page.locator('#collapse').click();await page.waitForTimeout(300);
  const small=await page.locator('#dock').boundingBox();
  if(small.height>=expanded.height-40||await page.locator('#collapse').getAttribute('aria-expanded')!=='false')throw Error('Collapse failed');
  await page.locator('#collapse').click();await page.waitForTimeout(300);
  const calls=await page.evaluate(()=>window.bridgeCalls.map(c=>c[0]));
  for(const name of ['pin','copy','offset','dock'])if(!calls.includes(name))throw Error('Missing native bridge action '+name);
  await page.evaluate(async()=>{
    window.BDC.track({generation:902,title:'Synthetic vocal layout',artist:'Local fixture',duration:40,videoId:'fixture-two'});
    window.BDC.settings({translation:false,romanization:false,letterWave:true,wordSync:true,reducedMotion:false,disabled:[],dockCollapsed:false});
    await window.BDC.source(902,{key:'bLyrics-richsynced',source:'Better Lyrics',format:'ttml',raw:'<tt xmlns="http://www.w3.org/ns/ttml" xmlns:ttm="http://www.w3.org/ns/ttml#metadata"><body><div><p begin="1s" end="8s" ttm:agent="v1"><span begin="1s" end="3s">A quiet </span><span begin="3s" end="8s">beginning</span><span ttm:role="x-bg"><span begin="4s" end="8s">An answering voice</span></span></p><p begin="8s" end="14s" ttm:agent="v2"><span begin="8s" end="11s">Across </span><span begin="11s" end="14s">the room</span></p></div></body></tt>'});
    window.BDC.state({generation:902,position:5000,playing:false,visible:true,rate:1});
    document.documentElement.style.setProperty('background','#35110f','important');
  });
  await page.waitForTimeout(120);
  await page.screenshot({path:'output/playwright/beta2-three-layer-dock.png'});
  await page.evaluate(()=>window.BDC.settings({reducedMotion:true,dockCollapsed:true}));
  const reduced=await page.evaluate(()=>getComputedStyle(document.querySelector('#dock-content')).transitionDuration);
  if(reduced!=='0s')throw Error('Reduced-motion dock still animates');
  const orderChecks=await page.evaluate(()=>{
    window.BDC.settings({priority:['lrclib-synced'],disabled:[],dockCollapsed:false});
    // Synthetic second track has only Better Lyrics; disabling it must release the native panel.
    window.BDC.settings({disabled:['bLyrics-richsynced']});
    const hidden=document.querySelectorAll('.blyrics--line').length===0;
    window.BDC.settings({disabled:[],priority:[]});
    return hidden&&document.querySelectorAll('.blyrics--line').length>0;
  });
  if(!orderChecks)throw Error('Disabled source/native fallback restoration failed');
  const privateLyricsCopied=await page.evaluate(()=>window.bridgeCalls.find(c=>c[0]==='copy')?.[2]?.length>0);
  if(!privateLyricsCopied||errors.length)throw Error('Bridge or browser error '+JSON.stringify(errors));
  return {passed:true,live:{...live,ttmlChars:payload.ttml.length},layers,expandedHeight:expanded.height,collapsedHeight:small.height,threeLayers:true,copyAndOffsets:true,priorityReorder:true,clearSavedPin:true,disabledFallback:true,reducedMotion:true,errors};
}

