/** Public Edge level observations only. No authentication data is accepted. */
const EDGE_LEVEL_SOURCE='https://bbs.eddibb.cc/test/read.cgi/liveedge/1793457978/';
const EDGE_LEVEL_HEADERS=['key','factJson','updatedAt'];
function edgeThread_(value){
 const m=typeof value==='string'&&/^https?:\/\/(bbs\.eddibb\.cc|d1ch\.cc|v1ch\.cc)\/test\/read\.cgi\/([A-Za-z0-9_-]{1,80})\/([0-9]{9,11})\/(?:[0-9l,-]*)?$/.exec(value);
 if(!m)throw Error('Invalid Edge thread');
 return {url:'https://'+m[1]+'/test/read.cgi/'+m[2]+'/'+m[3]+'/',dat:'https://'+m[1]+'/'+m[2]+'/dat/'+m[3]+'.dat',board:'edge/'+m[2]};
}
function edgeDay_(v){if(typeof v!=='string'||!/^20\d\d-\d\d-\d\d$/.test(v))throw Error('Invalid day');const d=new Date(v+'T00:00:00Z');if(!Number.isFinite(+d)||d.toISOString().slice(0,10)!==v)throw Error('Invalid day');return v;}
function edgeToday_(){return Utilities.formatDate(new Date(),'Asia/Tokyo','yyyy-MM-dd');}
function edgeRecent_(day){edgeDay_(day);const age=(Date.parse(edgeToday_())-Date.parse(day))/86400000;return age>=0&&age<=7;}
function edgeId_(id){if(typeof id!=='string'||!/^[A-Za-z0-9+/!_.-]{8,100}$/.test(id)||['DELETED','CAP_USER','OVER1000'].includes(id))throw Error('Invalid ID');return id;}
function edgeKey_(f){return f.board+'|'+f.day+'|'+f.id;}
function edgeParse_(url,text){
 const t=edgeThread_(url),out=[];if(typeof text!=='string'||text.length>4*1024*1024)throw Error('DAT too large');
 const lines=text.split('\n');if(lines.length>10002)throw Error('Too many responses');
 lines.slice(0,10000).forEach((line,i)=>{
  const f=line.replace(/\r$/,'').split('<>');if(f.length<5)return;
  const date=/^(20\d\d\/\d\d\/\d\d)\([^)]{1,8}\) (\d\d:\d\d:\d\d(?:\.\d{1,3})?).*? ID:([A-Za-z0-9+/!_.-]{8,100})(?:\s|$)/.exec(f[2]);
  if(!date)return;let day=date[1].replace(/\//g,'-');try{if(!edgeRecent_(day))return;edgeId_(date[3]);}catch(_){return;}
  const at=Date.parse(day+'T'+date[2]+'+09:00');if(!Number.isFinite(at)||at>Date.now()+300000)return;
  const badge=/<\/b>\s*\(L([0-9]{1,4})(?: [^<>()\r\n]{1,100})?\)<b>\s*$/i.exec(f[0]);
  out.push({board:t.board,day,id:date[3],level:badge?Number(badge[1]):-1,at,thread:t.url,response:i+1,verified:!!badge});
 });return out;
}
function edgeDownload_(url){
 const t=edgeThread_(url),parts=t.url.split('/'),host=parts[2],board=parts[5],id=parts[6],archive='/'+board+'/kako/'+id.slice(0,4)+'/'+id.slice(0,5)+'/'+id+'.dat';
 let target=t.dat;
 for(let n=0;n<2;n++){
  const r=UrlFetchApp.fetch(target,{followRedirects:false,muteHttpExceptions:true,validateHttpsCertificates:true});
  if(r.getResponseCode()===200){if(r.getContent().length>4*1024*1024)throw Error('DAT too large');return r;}
  if(r.getResponseCode()!==302&&r.getResponseCode()!==301)throw Error('Edge DAT HTTP '+r.getResponseCode());
  const h=r.getAllHeaders(),location=String(h.Location||h.location||'');
  if(n!==0||(location!==archive&&location!=='https://'+host+archive))throw Error('Unexpected Edge DAT redirect');
  target='https://'+host+archive;
 }throw Error('Edge DAT redirect limit');
}
function edgeFetch_(url){return edgeParse_(url,edgeDownload_(url).getContentText('MS932'));}

function edgeSheet_(name){const b=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId);let s=b.getSheetByName(name);if(!s){s=b.insertSheet(name);s.getRange(1,1,1,3).setValues([EDGE_LEVEL_HEADERS]);s.setFrozenRows(1);}if(JSON.stringify(s.getRange(1,1,1,3).getValues()[0])!==JSON.stringify(EDGE_LEVEL_HEADERS))throw Error('Unexpected Edge sheet');return s;}
function edgeRead_(s){const out=new Map();for(const r of ngRows_(s)){try{const f=JSON.parse(String(r[1]));if(edgeRecent_(f.day))out.set(String(r[0]),f);}catch(_){}}return out;}
function edgeWrite_(s,map){const old=s.getLastRow()-1,values=Array.from(map.entries()).slice(-10000).map(([k,f])=>[k,JSON.stringify(f),new Date().toISOString()]);if(values.length)s.getRange(2,1,values.length,3).setValues(values);if(old>values.length)s.getRange(values.length+2,1,old-values.length,3).clearContent();}
/** Administrative timer only: readers never trigger a board crawl. */
function crawlEdgeLevels(force){
 const p=PropertiesService.getScriptProperties(),last=Number(p.getProperty('EDGE_LEVEL_LAST_ATTEMPT')||0);if(force!==true&&Date.now()-last<15*60000)return {skipped:true};
 const lock=LockService.getScriptLock();lock.waitLock(15000);try{
  if(force!==true&&Date.now()-Number(p.getProperty('EDGE_LEVEL_LAST_ATTEMPT')||0)<15*60000)return {skipped:true};p.setProperty('EDGE_LEVEL_LAST_ATTEMPT',String(Date.now()));
  const sources=JSON.parse(p.getProperty('EDGE_LEVEL_SOURCES')||JSON.stringify([EDGE_LEVEL_SOURCE]));if(!Array.isArray(sources)||sources.length<1||sources.length>10)throw Error('Invalid sources');sources.forEach(edgeThread_);
  const sheet=edgeSheet_('EdgeLevels'),facts=edgeRead_(sheet);let fetched=0,failed=0;
  for(const source of sources){try{for(const f of edgeFetch_(source)){if(!f.verified)continue;const k=edgeKey_(f),old=facts.get(k);if(!old||f.at>old.at||(f.at===old.at&&f.level>old.level))facts.set(k,f);}fetched++;}catch(_){failed++;}}
  edgeWrite_(sheet,facts);CacheService.getScriptCache().remove('edge-level-feed2');return {ok:failed===0,fetched,failed,observed:facts.size};
 }finally{lock.releaseLock();}
}
function installEdgeLevelTrigger(){const name='crawlEdgeLevels';for(const t of ScriptApp.getProjectTriggers())if(t.getHandlerFunction()===name)ScriptApp.deleteTrigger(t);ScriptApp.newTrigger(name).timeBased().everyMinutes(30).create();return crawlEdgeLevels(true);}
function edgeLevelFeed_(){
 const cache=CacheService.getScriptCache(),hit=cache.get('edge-level-feed2');if(hit)return ContentService.createTextOutput(hit).setMimeType(ContentService.MimeType.JSON);
 const lock=LockService.getScriptLock();lock.waitLock(10000);try{
  const observed=Array.from(edgeRead_(edgeSheet_('EdgeLevels')).values()).filter(f=>f.verified===true).map(f=>({board:f.board,day:f.day,id:f.id,level:f.level,at:f.at,thread:f.thread,response:f.response,verified:true}));
  const json=JSON.stringify({ok:true,format:1,observed});if(json.length<90000)cache.put('edge-level-feed2',json,300);return ContentService.createTextOutput(json).setMimeType(ContentService.MimeType.JSON);
 }finally{lock.releaseLock();}
}
/** Editor-only audit: no ID, authentication date or submitter is logged. */
function auditEdgeLevels(){
 const feed=JSON.parse(edgeLevelFeed_().getContent());
 if(feed.format!==1||feed.observed.some(f=>!f.verified||!edgeRecent_(f.day)||f.board!==edgeThread_(f.thread).board||!Number.isInteger(f.level)||f.level<0||f.level>9999))throw Error('Invalid level feed');
 for(const f of feed.observed)for(const key of ['reporter','device','cookie','token','authTime'])if(key in f)throw Error('Private metadata exported');
 const result={ok:true,observed:feed.observed.length,crawlTriggers:ScriptApp.getProjectTriggers().filter(t=>t.getHandlerFunction()==='crawlEdgeLevels').length};
 console.log(JSON.stringify(result));return result;
}
/** Editor-only transport diagnostics; never logs response contents. */
function probeEdgeLevelSource(){
 const t=edgeThread_(EDGE_LEVEL_SOURCE),r=edgeDownload_(t.url);
 const result={http:r.getResponseCode(),bytes:r.getContent().length,parsed:0,verified:0};
 if(result.http===200){try{const facts=edgeParse_(t.url,r.getContentText('MS932'));result.parsed=facts.length;result.verified=facts.filter(f=>f.verified).length;}catch(e){result.error=String(e.message||e);}}
 console.log(JSON.stringify(result));return result;
}
