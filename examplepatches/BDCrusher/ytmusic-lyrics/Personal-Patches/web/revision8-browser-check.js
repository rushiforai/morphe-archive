async (page) => {
  const errors=[];page.on('pageerror',error=>errors.push(error.message));
  await page.setViewportSize({width:412,height:760});
  await page.evaluate(async()=>{
    window.BDC.track({generation:1,title:'Synthetic vocal layout',artist:'Local verification fixture',album:'',duration:40,videoId:'fixture'});
    window.BDC.settings({fontSize:28,translation:true,romanization:true,language:'en'});
    await window.BDC.source(1,{key:'bLyrics-richsynced',source:'Synthetic TTML',format:'ttml',raw:`
    <tt xmlns="http://www.w3.org/ns/ttml" xmlns:ttm="http://www.w3.org/ns/ttml#metadata" xml:lang="en">
    <head><metadata><ttm:agent type="person" xml:id="one"/><ttm:agent type="person" xml:id="two"/><ttm:agent type="group" xml:id="all"/>
    <translations lang="en"><translation for="opening"><text>Embedded translation</text></translation></translations>
    <transliterations><transliteration xml:lang="en-Latn"><text for="opening"><span begin="1s" end="3s">Morning light</span></text></transliteration></transliterations>
    </metadata></head><body dur="40s"><div>
    <p begin="1s" end="8s" key="opening" ttm:agent="one"><span begin="1s" end="3s">Morning </span><span begin="3s" end="6s">light </span><span ttm:role="x-bg"><span begin="4s" end="8s">a quiet echo</span></span></p>
    <p begin="8s" end="15s" ttm:agent="two"><span begin="8s" end="11s">Across </span><span begin="11s" end="15s">the room</span></p>
    <p begin="15s" end="23s" ttm:agent="all"><span begin="15s" end="19s">Together </span><span begin="19s" end="23s">we sing</span></p>
    <p begin="24s" end="30s" ttm:agent="one"><span begin="24s" end="27s">Another </span><span begin="27s" end="30s">line</span></p>
    </div></body></tt>`});
    window.BDC.state({generation:1,position:4800,playing:false,rate:1,visible:true});
  });
  await page.waitForTimeout(250);
  const initial=await page.evaluate(()=>{
    const lines=[...document.querySelectorAll('.blyrics--line')].filter(line=>!line.dataset.instrumental);
    return {agents:lines.map(line=>line.dataset.agent),alignment:lines.map(line=>getComputedStyle(line).textAlign),
      background:document.querySelectorAll('.blyrics-background-line').length,
      letters:document.querySelectorAll('.blyrics--letter').length,
      translation:document.querySelector('.blyrics--translated')?.textContent,
      romanization:document.querySelector('.blyrics--romanized')?.textContent,
      animations:document.getAnimations().length,overflow:document.documentElement.scrollWidth>innerWidth};
  });
  if(initial.agents[0]!=='v1'||initial.agents[1]!=='v2'||initial.agents[2]!=='v1000')throw Error('Agent conversion failed: '+JSON.stringify(initial));
  if(initial.alignment[1]!=='right'||initial.alignment[2]!=='center'||initial.background<1||initial.letters<1||initial.overflow)throw Error('Vocal layout failed: '+JSON.stringify(initial));
  await page.screenshot({path:'output/playwright/revision8-vocals-default.png'});
  await page.evaluate(()=>window.BDC.settings({agents:{v1:'right',v2:'left',v1000:'center'},letterWave:false,background:false}));
  const customized=await page.evaluate(()=>({alignment:[...document.querySelectorAll('.blyrics--line')].filter(line=>!line.dataset.instrumental).map(line=>getComputedStyle(line).textAlign),
    letters:document.querySelectorAll('.blyrics--letter').length,bgDisplay:getComputedStyle(document.querySelector('.blyrics-background-line')).display}));
  if(customized.alignment[0]!=='right'||customized.alignment[1]!=='left'||customized.letters!==0||customized.bgDisplay!=='none')throw Error('Customization failed: '+JSON.stringify(customized));
  await page.screenshot({path:'output/playwright/revision8-vocals-custom.png'});
  const before=await page.locator('#lyrics').textContent();
  await page.evaluate(()=>window.BDC.source(0,{key:'bLyrics-richsynced',raw:'stale',format:'plain',source:'Stale track'}));
  if(before!==await page.locator('#lyrics').textContent())throw Error('Stale response entered current track');
  await page.evaluate(async()=>{
    window.BDC.track({generation:2,title:'Plain fallback',artist:'Fixture',duration:30,videoId:'plain'});
    await window.BDC.source(2,{key:'lrclib-plain',format:'plain',raw:'First untimed line\nSecond untimed line',source:'Plain fixture'});
    window.BDC.state({generation:2,position:5000,playing:false,rate:1,visible:true});
  });
  if(await page.locator('.blyrics--line').count()!==2)throw Error('Plain fallback failed');
  const plainCount=await page.locator('.blyrics--line').count();
  if(errors.length)throw Error(errors.join('\n'));
  return {passed:true,initial,customized,plainCount,staleResponseRejected:true,errors};
}

