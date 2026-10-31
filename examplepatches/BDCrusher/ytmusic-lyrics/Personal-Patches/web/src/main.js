/* BDCrusher's Android host for Braccato. Copyright 2026 BDCrusher. GPL-3.0. */
import { createLyricsRenderer, resetPlaybackClock, injectTranslation, injectRomanization } from '@braccato/core';
import { parseTTMLContent, parseLRC, parseQRC, PlainParser } from '@braccato/parsers';
import { processStreamData, fillTtml } from './upstream-providers.ts';
import { stringSimilarity } from './lyric-parse-utils.ts';
import { catalog, controls } from './catalog.js';
import { PlaybackClock } from './playback-clock.js';
import { FrameBudget } from './frame-budget.js';
import { RenderDiagnostics } from './render-diagnostics.js';

export const PRIORITY = ['bLyrics-richsynced','unison-richsynced','binimum-richsynced',
  'unison-wordsynced','portato-richsynced','musixmatch-richsync','bLyrics-synced',
  'unison-synced','yt-captions','binimum-synced','lrclib-synced','legato-synced',
  'musixmatch-synced','yt-lyrics','unison-plain','lrclib-plain'];
const $ = id => document.getElementById(id);
const native = window.BDNative;
let settings = {fontSize:28, letterWave:true, wordSync:true, background:true,
  bgSize:0.65, bgOpacity:0.7, agents:{}, translation:false, romanization:false,
  language:'en', passive:false, tapSeek:true, reducedMotion:false};
let generation = -1, params, selected = '', pinned = '', currentResult;
const clock = new PlaybackClock();
const frameBudget = new FrameBudget();
const diagnostics=new RenderDiagnostics((source,message)=>native?.diagnostic(generation,source,message));
let sourceHealth={pending:1,failed:false,connectionNeeded:false},parsing=0,lookupFinished=false,emptyReported=false,lastHealthLabel='';
const resultSignatures=new WeakMap();
let seenPayloads=new Set(),seenPayloadBytes=0;
function signature(result){if(!resultSignatures.has(result))resultSignatures.set(result,JSON.stringify([result.source,result.language,result.songwriters,result.lyrics]));return resultSignatures.get(result);}
function updateHealth(){
 const pending=Math.max(0,sourceHealth.pending||0)+parsing,found=availableKeys.length>0;
 const color=pending||sourceHealth.connectionNeeded||found&&sourceHealth.failed?'orange':found?'green':'red';
 const message=pending?'Sources loading':color==='green'?'All source requests completed':found?'Some sources unavailable':'No lyrics available';
 const label=`${message}. ${availableKeys.length} lyric formats available.${sourceHealth.connectionNeeded?' Verification may need attention.':''}`;
 if(lookupFinished&&!pending&&!found&&!emptyReported){emptyReported=true;native?.noLyrics(generation);}
 if(found||pending)emptyReported=false;
 if(lastHealthLabel===color+'|'+label)return;lastHealthLabel=color+'|'+label;
 $('source-health').dataset.state=color;$('source-health').setAttribute('aria-label',label);
 $('connect').hidden=!sourceHealth.connectionNeeded;
 $('source-summary').textContent=`${availableKeys.length} ${availableKeys.length===1?'format':'formats'} · ${sourceHealth.connectionNeeded?'Verification needed':pending?'Checking sources':sourceHealth.failed?'Some sources unavailable':found?'Checks complete':'No lyrics found'}`;

}
let active = true, raf = 0, enrichmentGeneration = 0;
let availableKeys = [], autoPreferred='', collapsed = false;
const reportedMismatches=new Set();
const icon = (key) => catalog.icons[catalog.providers.find(p=>p.key===key)?.type] || '';
const config = key => catalog.providers.find(p=>p.key===key);
function svgInto(target,svg){target.replaceChildren();if(!svg)return;const doc=new DOMParser().parseFromString(svg,'image/svg+xml');if(!doc.querySelector('parsererror'))target.appendChild(document.importNode(doc.documentElement,true));}
for(const [key,svg] of Object.entries(controls)){if($(key))svgInto($(key),svg);}
svgInto($('collapse'),controls.chevron);
svgInto($('copy'),'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="8" y="3" width="12" height="15" rx="1.5"/><path d="M4 7v14h12"/></svg>');
const arrow=direction=>`<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="${direction<0?'M14 6l-6 6 6 6':'M10 6l6 6-6 6'}"/></svg>`;
svgInto($('previous'),arrow(-1));svgInto($('next'),arrow(1));
for(const [id,path] of [['earlier','M5 12h14'],['later','M5 12h14M12 5v14']])svgInto($(id),`<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="${path}"/></svg>`);
// Like the extension, the flyout lives in body: a blurred pill is a backdrop root.
document.body.appendChild($('source-menu'));
$('dock').prepend($('resume'));
let menuCloseTimer,menuEpoch=0;
function closeSources(){const menu=$('source-menu');menuEpoch++;clearTimeout(menuCloseTimer);menu.classList.remove('open');menu.inert=true;$('source-label').setAttribute('aria-expanded','false');menuCloseTimer=setTimeout(()=>{menu.hidden=true;},settings.reducedMotion?0:160);}
function positionSources(){const menu=$('source-menu'),rect=$('source-label').getBoundingClientRect();menu.style.maxHeight=`${Math.max(48,Math.min(240,rect.top-16))}px`;menu.style.left=`${Math.max(8,Math.min(rect.left-4,innerWidth-menu.offsetWidth-8))}px`;menu.style.bottom=`${innerHeight-rect.top+8}px`;}
function openSources(){if(!availableKeys.length)return;clearTimeout(menuCloseTimer);const epoch=++menuEpoch,menu=$('source-menu');menu.hidden=false;menu.inert=false;positionSources();requestAnimationFrame(()=>{if(epoch===menuEpoch)menu.classList.add('open');});$('source-label').setAttribute('aria-expanded','true');}
function selectSource(key){pinned=key===autoPreferred?'':key;native?.pin(generation,pinned);closeSources();choose(true);}
let dockSignature='';
function updateDock(){
  updateHealth();const key=selected+'|'+availableKeys.join('|');if(dockSignature===key)return;dockSignature=key;
  const entry=config(selected),i=availableKeys.indexOf(selected);
  $('source-name').textContent=entry?.name||(availableKeys.length?'Choose a source':'Looking for lyrics…');
  $('source-position').textContent=i<0?'':`${i+1}/${availableKeys.length}`;
  svgInto($('source-icon'),icon(selected));$('source-icon').style.color=catalog.colors[entry?.type]||'inherit';
  $('previous').disabled=$('next').disabled=availableKeys.length<2;
  const menu=$('source-menu');menu.replaceChildren();
  menu.style.setProperty('--dock-accent',catalog.colors[entry?.type]||'#fde69b');
  for(const key of availableKeys){const p=config(key),button=document.createElement('button'),image=document.createElement('span'),label=document.createElement('span');
    svgInto(image,icon(key));image.style.color=catalog.colors[p.type];label.textContent=p.name;button.append(image,label);button.setAttribute('role','menuitemradio');button.setAttribute('aria-checked',String(key===selected));button.setAttribute('aria-label',`${p.name}, ${p.type}`);button.classList.toggle('selected',key===selected);button.onclick=()=>selectSource(key);menu.append(button);}
  if(menu.classList.contains('open'))positionSources();
}
function setCollapsed(value,persist=false){value=value===true;if(collapsed===value&&dockSignature)return;collapsed=value;$('dock').classList.toggle('collapsed',collapsed);$('collapse').setAttribute('aria-expanded',String(!collapsed));$('collapse').setAttribute('aria-label',collapsed?'Expand lyrics controls':'Collapse lyrics controls');$('dock-content').inert=collapsed;closeSources();if(persist)native?.dock(collapsed);}
let dockLayoutTimer,lastDockClearance=-1;
function settleDockLayout(){
  clearTimeout(dockLayoutTimer);
  const height=Math.round(innerHeight-$('dock').getBoundingClientRect().top+12);
  if(height===lastDockClearance)return;
  lastDockClearance=height;document.documentElement.style.setProperty('--dock-clearance',`${height}px`);renderer.relayout(false);
}
const dockResize=new ResizeObserver(()=>{
  if($('source-menu').classList.contains('open'))positionSources();
  if(!$('connection').hidden)positionStatus();
  clearTimeout(dockLayoutTimer);dockLayoutTimer=setTimeout(settleDockLayout,64);
});
$('dock-content').addEventListener('transitionend',event=>{if(event.propertyName==='grid-template-rows')settleDockLayout();});
const enrichmentRequested=new Set();
let resumeScrollUntil=0;
function resumeFollow(){resumeScrollUntil=performance.now()+120;renderer.resumeAutoscroll();}
let renderer = createLyricsRenderer({document,window,mount:$('lyrics'),host:{
  getScrollElement:()=>$('scroll'),
  isViewVisible:()=>active && !document.hidden,
  setResumeAffordanceVisible:visible=>$('resume').hidden=!visible,
  seek:seconds=>{if(settings.tapSeek){native?.seek(generation,Math.round(seconds*1000));resumeFollow();}},
  log:message=>native?.diagnostic(generation,'Renderer',String(message).slice(0,240)),
}});

function theme() {
  const css = `/* blyrics-letter-wave = ${settings.letterWave&&!settings.reducedMotion&&!window.matchMedia('(prefers-reduced-motion: reduce)').matches};
    blyrics-disable-richsync = ${!settings.wordSync}; */`;
  const rebuild=renderer.setTheme(css);
  const root=document.documentElement.style;
  root.setProperty('--blyrics-font-size',`${settings.fontSize}px`);
  root.setProperty('--bd-bg-size',String(settings.bgSize));
  root.setProperty('--bd-bg-opacity',String(settings.bgOpacity));
  document.body.classList.toggle('no-background',!settings.background);
  document.body.classList.toggle('reduce-motion',settings.reducedMotion);
  const rules=[];
  if(['left','center','right'].includes(settings.bgAlignment))rules.push(`.blyrics-background-line{text-align:${settings.bgAlignment}}`);
  for(const [agent,alignment] of Object.entries(settings.agents||{})) {
    if(!/^v\d+$/.test(agent)||!['left','center','right'].includes(alignment))continue;
    const origin=alignment==='center'?'center':alignment;
    rules.push(`.blyrics--line[data-agent="${agent}"]{text-align:${alignment};transform-origin:${origin} center}`);
    rules.push(`.blyrics--line[data-agent="${agent}"]>.blyrics--romanized{margin-left:${alignment==='left'?'0':'auto'};margin-right:${alignment==='right'?'0':'auto'}}`);
  }
  $('agents').textContent=rules.join('\n');
  return rebuild;
}

function parsePayload(payload) {
  const text=payload.raw;
  if(payload.format==='ttml') return parseTTMLContent(text,{songDurationMs:params.duration*1000}).lyrics;
  if(payload.format==='lrc')return parseLRC(text,params.duration*1000);
  if(payload.format==='qrc')return parseQRC(text,params.duration*1000,{title:params.song,artist:params.artist});
  if(payload.lyrics)return payload.lyrics;
  return PlainParser.parse(text||'');
}

function put(key,result) {
  if(!params?.sourceMap[key]||!result?.lyrics?.length)return;
  // Protect the view against unexpectedly large provider responses.
  if(result.lyrics.length>2000)throw Error('Too many lyric lines');
  params.sourceMap[key].lyricSourceResult=result;
}

function choose(force=false) {
  if(!params)return;
  const custom=Array.isArray(settings.priority)?settings.priority.filter(k=>PRIORITY.includes(k)):[];
  const disabled=new Set(settings.disabled||[]);
  const order=[...new Set([...custom,...PRIORITY])].filter(key=>!disabled.has(key));
  const baseline=params.sourceMap['yt-lyrics']?.lyricSourceResult?.lyrics;
  const reference=baseline?.map(line=>line.words).join('\n');
  const available=order.filter(key=>params.sourceMap[key]?.lyricSourceResult?.lyrics?.length);
  const automatic=available.filter(key=>{
    const result=params.sourceMap[key]?.lyricSourceResult;
    if(!result?.lyrics?.length)return false;
    if(!reference||key==='yt-lyrics'||key.startsWith('unison-'))return true;
    const accepted=stringSimilarity(result.lyrics.map(line=>line.words+'\n').join(''),reference)>=0.5;
    if(!accepted&&!reportedMismatches.has(key)){reportedMismatches.add(key);native?.diagnostic(generation,key,'Automatic match rejected; received lyrics remain available for manual selection');}
    return accepted;
  });
  if(available.join('|')!==availableKeys.join('|'))$('sources').replaceChildren(...available.map(key=>{
    const option=document.createElement('option');option.value=key;
    option.textContent=params.sourceMap[key].lyricSourceResult.source+' · '+key.split('-').slice(1).join('-');
    return option;
  }));
  autoPreferred=automatic[0]||'';
  const key=available.includes(pinned)?pinned:autoPreferred;
  availableKeys=available;
  if(!key){
    selected='';currentResult=null;renderer.clear();updateDock();$('sources').value='';
    if(available.length){$('empty').textContent='These lyrics differ from YouTube Music. Choose a source to use them.';$('empty').hidden=false;native?.displayed(generation,'choose-source');}

    return;
  }
  $('sources').value=key;
  const result=params.sourceMap[key].lyricSourceResult;
  if(!force&&key===selected&&(result===currentResult||currentResult&&signature(result)===signature(currentResult))){params.sourceMap[key].lyricSourceResult=currentResult;updateDock();return;}
  selected=key;currentResult=result;
  
  updateDock();
  renderer.setLyrics(result.lyrics,{language:result.language,songwriters:result.songwriters});
  
  diagnostics.lines(renderer.lines);
  decorate();
  $('status').textContent=result.source;
  $('status').title=key;
  $('empty').hidden=true;

  renderer.relayout();
  native?.displayed(generation,key);
  enrichMissing();
}

function translationFor(line,language){
  const translations=line.translations||{};
  const key=Object.keys(translations).find(key=>key===language)||
    Object.keys(translations).find(key=>key.split('-')[0]===language.split('-')[0]);
  if(key)return {text:translations[key],language:key};
  if(line.translation?.text&&(!line.translation.lang||line.translation.lang.split('-')[0]===language.split('-')[0]))return {text:line.translation.text,language:line.translation.lang||language};
  return null;
}
function enrichMissing(){
  if(!native?.enrich||!currentResult||(!settings.translation&&!settings.romanization))return;
  const requestKey=`${generation}|${selected}|${settings.language}`;
  if(enrichmentRequested.has(requestKey))return;
  const missing=currentResult.lyrics.some(line=>!line.isInstrumental&&
    ((settings.translation&&!translationFor(line,settings.language))||
     (settings.romanization&&!line.romanization)));
  if(!missing)return;
  enrichmentRequested.add(requestKey);
  for(let start=0;start<currentResult.lyrics.length;start+=200){
    const lines=currentResult.lyrics.slice(start,start+200).map(line=>line.isInstrumental?'':line.words);
    if(lines.some(line=>line.length>500))continue;
    native.enrich(generation,selected,JSON.stringify({lines,to:settings.language,videoId:params.videoId,start}));
  }
}

function decorate() {
  const lines=$('lyrics').querySelectorAll('.blyrics--line');
  currentResult?.lyrics.forEach((lyric,index)=>{
    const line=lines[index];if(!line)return;
    if(settings.translation){
      const translated=translationFor(lyric,settings.language);
      if(translated)injectTranslation(document,line,translated.text,translated.language);
    }
    if(settings.romanization&&lyric.romanization){
      injectRomanization(document,line,renderer.lines[index],lyric.romanization,lyric.timedRomanization);
    }
  });
}

function renderFrame(now) {
  raf=0;
  if(!active||document.hidden)return;
  if(!clock.initialized){raf=requestAnimationFrame(renderFrame);return;}
  if(diagnostics.enabled){const timing=frameBudget.sample(now,clock.playing);if(timing)native?.diagnostic(generation,'Frame-timing',timing);}
  // Android delivers asynchronous snapshots, not a synchronous HTML media element.
  // Extrapolate once at the supplied rate on a monotonic clock; hand Braccato "now".
  const position=clock.read(now);
  const before=diagnostics.enabled?performance.now():0;
  renderer.tick(position/1000,{eventCreationTime:Date.now(),isPlaying:clock.playing,
    playbackRate:clock.rate,passiveScrollEnabled:settings.passive,smoothScroll:!settings.reducedMotion});
  diagnostics.sample(now,position/1000,diagnostics.enabled?performance.now()-before:0,clock.playing);
  raf=requestAnimationFrame(renderFrame);
}
function startClock(){if(!raf&&active&&!document.hidden)raf=requestAnimationFrame(renderFrame);}

window.BDC = {
  debug(value){if(diagnostics.enabled!==(value===true))frameBudget.reset(performance.now());diagnostics.enable(value===true);},
  track(track) {
    
    reportedMismatches.clear();autoPreferred='';seenPayloads=new Set();seenPayloadBytes=0;clock.reset();frameBudget.reset(performance.now());sourceHealth={pending:1,failed:false,connectionNeeded:false};parsing=0;lookupFinished=false;emptyReported=false;$('connection').hidden=true;$('source-health').setAttribute('aria-expanded','false');
    generation=track.generation;selected='';pinned=track.preferredSource||'';currentResult=null;enrichmentGeneration++;enrichmentRequested.clear();
    params={song:track.title,artist:track.artist,album:track.album,duration:track.duration,
      videoId:track.videoId,sourceMap:Object.fromEntries([...PRIORITY,'metadata'].map(key=>[key,{filled:false,lyricSourceResult:null}]))};
    renderer.clear();resetPlaybackClock();renderer.resumeAutoscroll();$('resume').hidden=true;resumeScrollUntil=performance.now()+250;
    availableKeys=[];updateDock();$('sources').replaceChildren();$('status').textContent='Looking for lyrics…';
    $('empty').textContent='Looking for lyrics…';$('empty').hidden=false;
    $('track').textContent=track.title+' · '+track.artist;
  },
  metadata(track){
    if(!params||track.generation!==generation||track.videoId!==params.videoId)return;
    Object.assign(params,{song:track.title,artist:track.artist,album:track.album,duration:track.duration});
    $('track').textContent=[track.title,track.artist].filter(Boolean).join(' · ');
  },
  async source(id,payload) {
    if(id!==generation||!params)return;
    const expected=params,cache=seenPayloads;
    const payloadKey=JSON.stringify(payload.event==='provider'?[payload.event,payload.data?.provider,payload.data?.results,payload.data?.error]:payload);
    if(cache.has(payloadKey))return;
    const cached=cache.size<128&&seenPayloadBytes+payloadKey.length*2<=1024*1024;
    if(cached){cache.add(payloadKey);seenPayloadBytes+=payloadKey.length*2;}
    parsing++;updateHealth();
    const previous=new Map(PRIORITY.filter(key=>expected.sourceMap[key]?.lyricSourceResult?.lyrics?.length).map(key=>[key,expected.sourceMap[key].lyricSourceResult]));
    try {
      if(payload.event) {
        await processStreamData(payload.event,payload.data,expected);
        if(id!==generation||params!==expected)return;
      }else if(payload.kind==='cachedResult'){
        if(payload.result?.lyrics?.length)put(payload.key,payload.result);
      }else if(payload.kind==='unison'){
        const data=payload.data?.data||payload.data;
        if(data.format==='ttml')fillTtml(data.lyrics,params,{richsyncKey:'unison-richsynced',syncedKey:'unison-synced',source:'Unison',sourceHref:'https://unison.betterlyrics.org',cacheAllowed:false});
        else if(data.lyrics)put(data.format==='plain'?'unison-plain':data.syncType==='richsync'?'unison-wordsynced':'unison-synced',
          {lyrics:data.format==='plain'?PlainParser.parse(data.lyrics):parseLRC(data.lyrics,params.duration*1000),source:'Unison'});
      }else {
        const lyrics=parsePayload(payload);
        let key=payload.key;
        if(payload.format==='ttml'&&key?.endsWith('-richsynced')){
          const parsed=parseTTMLContent(payload.raw,{songDurationMs:params.duration*1000});
          if(!parsed.isWordSynced)key=key.replace('-richsynced','-synced');
        }
        put(key,{...payload,lyrics});
      }
      // A slower provider response may be empty or less detailed than an earlier
      // public result. Only a track change or explicit refresh clears good lyrics.
      for(const [key,result] of previous)if(!expected.sourceMap[key]?.lyricSourceResult?.lyrics?.length)expected.sourceMap[key].lyricSourceResult=result;
      if(payload.kind!=='cachedResult')for(const key of PRIORITY){const result=expected.sourceMap[key]?.lyricSourceResult;if(result?.lyrics?.length&&result!==previous.get(key))native?.cacheResult?.(generation,key,JSON.stringify(result));}
      choose();
    } catch(error){
      if(cached){cache.delete(payloadKey);if(params===expected)seenPayloadBytes-=payloadKey.length*2;}
      if(id!==generation||params!==expected)return;
      for(const [key,result] of previous)if(!expected.sourceMap[key]?.lyricSourceResult?.lyrics?.length)expected.sourceMap[key].lyricSourceResult=result;
      choose();native?.diagnostic(generation,payload.key||payload.event||payload.kind||'unknown',String(error?.message||error).slice(0,240));
      if(!selected)$('status').textContent='A lyric source could not be decoded';
    }finally{if(params===expected){parsing=Math.max(0,parsing-1);updateHealth();}}
  },
  insets(value){for(const key of ['left','right','bottom'])document.documentElement.style.setProperty(`--safe-${key}`,`${Math.max(0,Number(value[key])||0)}px`);settleDockLayout();if(!$('connection').hidden)positionStatus();},
  state(sample) {
    if(sample.generation!==generation)return;
    clock.accept(sample,performance.now(),Date.now());
    if(typeof sample.visible==='boolean')window.BDC.visible(sample.visible);
    startClock();
  },
  visible(visible){
    const next=visible===true;if(active===next)return;active=next;
    if(!active){diagnostics.pause();cancelAnimationFrame(raf);raf=0;}
    renderer.noteVisibilityChange();if(active){frameBudget.reset(performance.now());renderer.relayout();startClock();}
  },
  settings(next) {
    const rebuild=['translation','romanization','language'].some(key=>key in next&&next[key]!==settings[key]);
    const visual=['fontSize','letterWave','wordSync','background','bgSize','bgOpacity','bgAlignment','agents','reducedMotion'];
    const changed=visual.some(key=>key in next&&JSON.stringify(next[key])!==JSON.stringify(settings[key]));
    if('offset' in next&&next.offset!==settings.offset)clock.initialized=false;
    settings={...settings,...next};const themeRebuild=changed?theme():false;choose(rebuild||themeRebuild);
    if(changed||rebuild)renderer.relayout();
    
    setCollapsed(settings.dockCollapsed);
    for(const [key,url] of Object.entries(next.buttonIcons||{})){if(!$(key)||!/^data:image\/png;base64,[A-Za-z0-9+/=]+$/.test(url))continue;if($(key).firstElementChild?.getAttribute('src')===url)continue;const img=document.createElement('img');img.src=url;img.alt='';$(key).replaceChildren(img);}
    if(next.pillColor)document.documentElement.style.setProperty('--bd-pill',next.pillColor);
    $('translate').ariaPressed=String(settings.translation);
    $('romanize').ariaPressed=String(settings.romanization);
    $('offset').textContent=`${settings.offset||0} ms`;
    if(next.textColor){
      const style=document.documentElement.style;
      style.setProperty('--bd-status-bg',/^#(?:f|e|d|c|b|a)/i.test(next.textColor)?'rgba(28,28,32,.96)':'rgba(248,248,250,.97)');style.setProperty('--blyrics-text-color',next.textColor);style.setProperty('--bd-foreground',next.textColor);
      if(/^#[0-9a-f]{6}$/i.test(next.textColor)){
        const color=parseInt(next.textColor.slice(1),16),rgb=`${color>>16},${(color>>8)&255},${color&255}`;
        style.setProperty('--blyrics-lyric-active-color',next.textColor);
        style.setProperty('--blyrics-lyric-inactive-color',`rgba(${rgb},.3)`);
        style.setProperty('--blyrics-glow-color',`rgba(${rgb},.5)`);
        style.setProperty('--blyrics-translated-color',`rgba(${rgb},.6)`);
      }
    }
  },
  enrichment(id,key,start,language,response){
    if(id!==generation||key!==selected||!currentResult||!Array.isArray(response.lines))return;
    response.lines.forEach((data,index)=>{
      const line=currentResult.lyrics[start+index];if(!line||line.isInstrumental)return;
      if(data.translation&&data.needsTranslation){line.translations??={};line.translations[language]??=data.translation;}
      if(data.romanization&&!line.romanization)line.romanization=data.romanization;
    });
    choose(true);
  },
  health(id,status){if(id!==generation)return;sourceHealth=status;updateHealth();},
  notice(id,message,finished=false){
    if(id!==generation)return;
    if(!selected&&!availableKeys.length){$('empty').textContent=finished?'No lyrics found. YouTube Music’s lyrics remain available behind this panel.':message;}
    $('notice').textContent=message;


    lookupFinished=finished;updateHealth();
  },
  dispose(){cancelAnimationFrame(raf);clearTimeout(dockLayoutTimer);dockResize.disconnect();renderer.destroy();},
};
let statusCloseTimer;
function closeStatus(){clearTimeout(statusCloseTimer);$('connection').hidden=true;$('source-health').setAttribute('aria-expanded','false');}
function positionStatus(){} // Status expands inside the dock; no overlay across lyrics or controls.
$('source-health').onclick=()=>{const open=$('connection').hidden;closeStatus();if(!open)return;closeSources();$('connection').hidden=false;if(!settings.reducedMotion)$('connection').animate([{opacity:0,transform:'translateY(6px)'},{opacity:1,transform:'none'}],{duration:160});$('source-health').setAttribute('aria-expanded','true');positionStatus();statusCloseTimer=setTimeout(()=>{if(!$('connection').contains(document.activeElement))closeStatus();},6000);};
$('sources').addEventListener('change',()=>{pinned=$('sources').value;native?.pin(generation,pinned);choose(true);});
$('source-label').onclick=()=>{$('source-label').getAttribute('aria-expanded')==='true'?closeSources():openSources();};
document.addEventListener('click',event=>{if(!$('connection').contains(event.target)&&!$('source-health').contains(event.target)){$('connection').hidden=true;$('source-health').setAttribute('aria-expanded','false');}if(!$('source-menu').contains(event.target)&&!$('source-label').contains(event.target))closeSources();});
document.addEventListener('keydown',event=>{
  if(event.key==='Escape'&&!$('connection').hidden){$('connection').hidden=true;$('source-health').setAttribute('aria-expanded','false');$('source-health').focus();return;}
  if($('source-label').getAttribute('aria-expanded')!=='true')return;
  if(event.key==='Escape'){closeSources();$('source-label').focus();}
  if(['ArrowDown','ArrowUp','Home','End'].includes(event.key)){
    event.preventDefault();const items=[...$('source-menu').children],i=items.indexOf(document.activeElement);
    items[event.key==='Home'?0:event.key==='End'?items.length-1:(i+(event.key==='ArrowDown'?1:-1)+items.length)%items.length]?.focus();
  }
});
window.addEventListener('resize',()=>{if($('source-menu').classList.contains('open'))positionSources();if(!$('connection').hidden)positionStatus();});
for(const [id,direction] of [['previous',-1],['next',1]])$(id).onclick=()=>{if(availableKeys.length>1)selectSource(availableKeys[(Math.max(0,availableKeys.indexOf(selected))+direction+availableKeys.length)%availableKeys.length]);};
$('collapse').onclick=()=>setCollapsed(!collapsed,true);
$('copy').onclick=()=>native?.copy(generation,(currentResult?.lyrics||[]).map(line=>line.words).join('\n').slice(0,100000));
$('refresh').addEventListener('click',()=>native?.refresh(generation));
$('connect').addEventListener('click',()=>native?.connect());
$('resume').addEventListener('click',resumeFollow);
for(const kind of ['translate','romanize'])$(kind).addEventListener('click',()=>native?.toggle(kind));
$('earlier').addEventListener('click',()=>native?.offset(generation,-100));
$('later').addEventListener('click',()=>native?.offset(generation,100));
// Preserve extension scrolling; explicit gestures bypass only pending event suppression.
$('scroll').addEventListener('scroll',()=>{if(performance.now()>=resumeScrollUntil)renderer.noteUserScroll();},{passive:true});
function userScroll(){resumeScrollUntil=0;renderer.noteUserScroll(true);}
for(const type of ['wheel','touchmove'])$('scroll').addEventListener(type,userScroll,{passive:true});
$('scroll').addEventListener('keydown',event=>{if(['ArrowUp','ArrowDown','PageUp','PageDown','Home','End',' '].includes(event.key))userScroll();});

document.addEventListener('visibilitychange',()=>{diagnostics.pause();frameBudget.reset(performance.now());renderer.noteVisibilityChange();if(!document.hidden)startClock();});
dockResize.observe($('dock'));theme();startClock();native?.ready();
