const fs=require('node:fs'),vm=require('node:vm'),assert=require('node:assert/strict'),crypto=require('node:crypto');
const sheets=new Map(),props=new Map([['REPORTER_PEPPER','test-pepper']]),cache=new Map();let checks=0,fetches=0,locked=false,redirect=null;
class Sheet{constructor(){this.rows=[];}getLastRow(){return this.rows.length;}getLastColumn(){return 3;}setFrozenRows(){}getRange(r,c,n,m){return {getValues:()=>Array.from({length:n},(_,i)=>Array.from({length:m},(_,j)=>this.rows[r+i-1]?.[c+j-1]??'')),setValues:v=>v.forEach((row,i)=>{this.rows[r+i-1]=row.slice();}),clearContent:()=>{for(let i=0;i<n;i++)this.rows[r+i-1]=['','',''];}};}}
const book={getSheetByName:n=>sheets.get(n),insertSheet:n=>{let s=new Sheet();sheets.set(n,s);return s;}};
const now=new Date(),day=new Date(+now+9*3600000).toISOString().slice(0,10),old='2020-01-01';
function line(level,id='uaP115Eek',body='test',date=day){return `名無し </b>(L${level} abcd-1234)<b><>sage<>${date.replaceAll('-','/')} (x) 00:00:01.123 ID:${id}<>${body}<>test`;}
// Match native DAT without a space between date and weekday.
const dat=()=>line(2).replace('/ (x)','/(x)')+'\n'+line(3).replace('/ (x)','/(x)').replace('01.123','02.123');
let text=dat().replaceAll(day.replaceAll('-','/')+' (x)',day.replaceAll('-','/')+'(x)');
const ctx=vm.createContext({console,Date,Map,Set,JSON,Number,String,Object,Array,Error,NG_CONFIG:{spreadsheetId:'test'},
SpreadsheetApp:{openById:()=>book},PropertiesService:{getScriptProperties:()=>({getProperty:k=>props.get(k)||null,setProperty:(k,v)=>props.set(k,v)})},
LockService:{getScriptLock:()=>({waitLock(){assert.equal(locked,false);locked=true;},releaseLock(){locked=false;},hasLock:()=>locked})},
CacheService:{getScriptCache:()=>({get:k=>cache.get(k),put:(k,v)=>cache.set(k,v),remove:k=>cache.delete(k)})},
Utilities:{formatDate:()=>day,newBlob:s=>({getBytes:()=>Array.from(Buffer.from(s))}),DigestAlgorithm:{SHA_256:1},Charset:{UTF_8:1},computeDigest:(_,s)=>Array.from(crypto.createHash('sha256').update(s).digest())},ContentService:{MimeType:{JSON:1},createTextOutput:text=>({text,getContent(){return text;},setMimeType(){return this;}})},
UrlFetchApp:{fetch:(url,opt)=>{if(redirect&&url.includes('/dat/')){fetches++;return {getResponseCode:()=>302,getAllHeaders:()=>({Location:redirect})};}assert.match(url,/^https:\/\/(bbs\.eddibb\.cc|d1ch\.cc|v1ch\.cc)\/[\w-]+\/(?:dat|kako\/\d+\/\d+)\/\d+\.dat$/);assert.equal(opt.followRedirects,false);fetches++;return {getResponseCode:()=>200,getContent:()=>Buffer.from(text),getContentText:enc=>{assert.equal(enc,'MS932');return text;}};}},
ngRows_:s=>s.rows.slice(1),ngHash_:s=>crypto.createHash('sha256').update(s).digest('hex'),ngJson_:v=>v});
vm.runInContext(fs.readFileSync(__dirname+'/EdgeLevels.gs','utf8'),ctx);
const url='https://bbs.eddibb.cc/test/read.cgi/liveedge/1793457978/';
function check(x,label){assert.ok(x,label);checks++;}
check(ctx.edgeThread_(url).board==='edge/liveedge','board scope');
for(const url of ['https://bbs.eddibb.cc.evil.invalid/test/read.cgi/liveedge/1793457978/','https://bbs.eddibb.cc:80/test/read.cgi/liveedge/1793457978/','https://user@bbs.eddibb.cc/test/read.cgi/liveedge/1793457978/','file:///test/read.cgi/liveedge/1793457978/']){assert.throws(()=>ctx.edgeThread_(url));checks++;}
let facts=ctx.edgeParse_(url,text);check(facts.length===2&&facts[1].level===3,'real-style DAT badge');
check(ctx.edgeParse_(url,text.replaceAll('</b>','&lt;/b&gt;')).every(f=>!f.verified),'escaped badge not authority');
check(ctx.edgeParse_(url,text.replaceAll('(L','(X')).every(f=>!f.verified),'body cannot supply badge');
check(ctx.edgeParse_(url,text.replaceAll(day.replaceAll('-','/'),old.replaceAll('-','/'))).length===0,'expired observations ignored');
check(ctx.crawlEdgeLevels().observed===1,'latest ID observation merged');
let feed=JSON.parse(ctx.edgeLevelFeed_().text);check(feed.observed[0].level===3,'latest level published');
check(ctx.crawlEdgeLevels().skipped&&fetches===1,'central crawl interval');
const n=fetches;ctx.edgeLevelFeed_();check(fetches===n,'feed read never crawls');
redirect='/liveedge/kako/1793/17934/1793457978.dat';check(ctx.edgeFetch_(url).length===2,'exact same-thread archive redirect');
for(const bad of ['https://evil.invalid/liveedge/kako/1793/17934/1793457978.dat','/liveedge/kako/1793/17934/1793457979.dat','http://bbs.eddibb.cc/liveedge/kako/1793/17934/1793457978.dat']){redirect=bad;assert.throws(()=>ctx.edgeFetch_(url));checks++;}redirect=null;
check(locked===false,'locks released');
vm.runInContext(fs.readFileSync(__dirname+'/Code.gs','utf8'),ctx);
check(JSON.parse(ctx.doGet({parameter:{action:'edgeLevels'}}).text).observed.length===1,'real doGet dispatch');
console.log(`Edge level server: ${checks} checks passed`);
