const fs=require('node:fs'),vm=require('node:vm'),crypto=require('node:crypto'),assert=require('node:assert/strict');
const properties=new Map(),cache=new Map(),sheets=new Map();let checks=0,failSheet='',activeBook=null,activeSheet=null,activeRow=2;
class Sheet{
 constructor(name){this.name=name;this.rows=[];}
 getLastRow(){let n=this.rows.length;while(n&&this.rows[n-1].every(v=>v===''||v==null))n--;return n;}getLastColumn(){return this.rows.reduce((n,r)=>Math.max(n,r.length),0);}
 setFrozenRows(){}
 getName(){return this.name;}getActiveRange(){return {getRow:()=>activeRow};}
 getRange(r,c,n,m){return {setValues:values=>{if(failSheet===this.name){failSheet='';throw Error('Injected sheet failure');}assert.equal(values.length,n);for(let i=0;i<n;i++){this.rows[r+i-1]??=[];for(let j=0;j<m;j++){const value=values[i][j];if(typeof value==='string')assert.ok(!value.startsWith('='),'No spreadsheet formula injection');this.rows[r+i-1][c+j-1]=value;}}},clearContent:()=>{if(failSheet===this.name){failSheet='';throw Error('Injected clear failure');}for(let i=0;i<n;i++)for(let j=0;j<m;j++)if(this.rows[r+i-1])this.rows[r+i-1][c+j-1]='';},getValues:()=>Array.from({length:n},(_,i)=>Array.from({length:m},(_,j)=>this.rows[r+i-1]?.[c+j-1]??''))};}
 appendRow(r){if(failSheet===this.name){failSheet='';throw Error('Injected append failure');}this.rows.push(r.slice());}
}
const book={getId:()=> '1mKo9ogD2ePwu16hgya8pu2-fF7g-I3ERPgm18PCO_oc',getActiveSheet:()=>activeSheet,getSheetByName:n=>sheets.get(n),insertSheet:n=>{const s=new Sheet(n);sheets.set(n,s);return s;}};
const props={getProperty:k=>properties.get(k)||null,setProperty:(k,v)=>properties.set(k,String(v)),deleteProperty:k=>properties.delete(k)};
let locked=false;
const context=vm.createContext({console,Date,Map,Set,JSON,Number,String,Object,Array,Error,
 SpreadsheetApp:{openById:()=>book,getActiveSpreadsheet:()=>activeBook,flush(){}},PropertiesService:{getScriptProperties:()=>props},
 CacheService:{getScriptCache:()=>({get:k=>cache.get(k),put:(k,v)=>cache.set(k,v),remove:k=>cache.delete(k)})},
 LockService:{getScriptLock:()=>({waitLock(){assert.ok(!locked);locked=true;},releaseLock(){locked=false;},hasLock(){return locked;}})},
 Utilities:{newBlob:v=>({getBytes:()=>Array.from(Buffer.from(v,'utf8'))}),getUuid:()=>crypto.randomUUID(),DigestAlgorithm:{SHA_256:1},Charset:{UTF_8:1},computeDigest:(_,v)=>Array.from(crypto.createHash('sha256').update(v).digest())},
 ContentService:{MimeType:{JSON:'json'},createTextOutput:text=>({text,setMimeType(){return this;}})}
});
vm.runInContext(fs.readFileSync(process.cwd()+'/server/shared-ng/Code.gs','utf8'),context);
function run(code){return vm.runInContext(code,context);}
function get(since){return JSON.parse(context.doGet({parameter:{since:String(since)}}).text);}
function post(device,reports){return JSON.parse(context.doPost({postData:{contents:JSON.stringify({version:1,device,reports})}}).text);}
function check(value,label){assert.ok(value,label);checks++;}

for(const name of ['Moderation','PersonalInbox','Publish'])vm.runInContext(fs.readFileSync(process.cwd()+'/server/shared-ng/'+name+'.gs','utf8'),context);
context.setupSharedNg();
function personal(device,reports){return JSON.parse(context.doPost({postData:{contents:JSON.stringify({version:2,action:'personal',device,reports})}}).text);}

let now=Date.parse('2026-11-01T12:00:00Z');
context.Date=class extends Date{constructor(...args){super(...(args.length?args:[now]));}static now(){return now;}};
function condition(kind,value,flags=16){return {operationId:crypto.randomBytes(32).toString('hex'),action:'upsert',board:kind==='reporter'?'edge/all':'5ch/all',kind,value,period:'',regex:(flags&32)!==0,flags};}
function rows(name){const sheet=sheets.get(name);return sheet?sheet.rows.slice(1).filter(r=>r.some(v=>v!==''&&v!=null)):[];}
function feed(parameters={}){return JSON.parse(context.doGet({parameter:{action:'reviewed',reporter:'1',globalIdentity:'1',regex:'1',matchModes:'1',...parameters}}).text);}
function all(){return run('ngAllPersonalRows_(SpreadsheetApp.openById(NG_CONFIG.spreadsheetId))');}
const device='a'.repeat(64),sent=[];
for(const [kind,value,destination] of [['id','FixtureID','NG_ID'],['keyword','辞書にない文字列','NG_Word'],['keyword','正規表現.*対象','NG_Word'],['wacchoi','Ab12-Cd34','NG_Wacchoi'],['prefix','Ab12','NG_Wacchoi'],['suffix','Cd34','NG_Wacchoi'],['name','名前条件','NG_Name'],['trip','◆trip','NG_Name'],['reporter','Reporter01','NG_Reporter']]){
 const c=condition(kind,value,value.includes('.*')?32:16);sent.push(c);
 check(personal(device,[c]).ok,'received '+kind);
 check(rows('Inbox').some(r=>r[0]===c.operationId&&r[6]==='awaiting_policy'),'queued before review');
 context.reviewPersonalNg();
 check(!rows('Inbox').some(r=>r[0]===c.operationId),'review leaves Inbox');
 check(rows(destination).some(r=>r[0]===c.operationId&&r[5]==='approved'),'typed reviewed destination '+kind);
 check(personal(device,[c]).accepted===0,'moved operation remains deduplicated');
}
check(rows('ReviewTransfer').length===0&&!properties.has('REVIEW_TRANSFER'),'successful transfer journal cleared');
const full=JSON.parse(context.exportReviewedSharedNg());
check(full.rules.length===sent.length,'all ordinary and regex conditions approved without dictionary');
check(full.rules.some(r=>r.regex&&r.flags===32),'regex metadata exported explicitly');
cache.clear();check(!feed({regex:'0'}).rules.some(r=>r.regex),'legacy receivers never interpret regex as literal');
const chained=condition('id','LegacyChainID',18);personal(device,[chained]);
cache.clear();check(feed({regex:'0',matchModes:'0'}).rules.some(r=>r.value==='LegacyChainID'),'legacy match-mode gate preserves chain and presentation flags');
const invalid=condition('keyword','不正な正規表現[',32),short=condition('keyword','あ'),unsupported=condition('keyword','未対応の一致方式',64);
for(const c of [invalid,short,unsupported])check(personal(device,[c]).ok,'private acknowledgement before review');
context.reviewPersonalNg();
check(rows('NG_Word').find(r=>r[0]===invalid.operationId)[6]==='basic_rules_passed','regex syntax is deferred to Java receivers');
check(rows('NG_Word').find(r=>r[0]===short.operationId)[6]==='ineligible_keyword','short keyword rejected');
check(rows('NG_Word').find(r=>r[0]===unsupported.operationId)[5]==='pending','unsupported mode remains distinguishable');
check(rows('Inbox').length===0,'completed pending decisions also move to typed sheet');

// Lossless migration of already-reviewed legacy Inbox rows and retries after a partial move.
const again=condition('keyword','移動失敗テスト用'),identity=condition('id','MoveFailureId');
check(personal('b'.repeat(64),[again,identity]).accepted===2,'batch queued');
failSheet='NG_Word';assert.throws(()=>context.reviewPersonalNg(),/Injected sheet failure/);checks++;
check(properties.has('REVIEW_TRANSFER')&&rows('ReviewTransfer').length>0,'write-ahead snapshot survives failure');
context.reviewPersonalNg();
check(rows('NG_Word').filter(r=>r[0]===again.operationId).length===1&&rows('NG_ID').filter(r=>r[0]===identity.operationId).length===1,'recovery neither loses nor duplicates operations');
check(rows('ReviewTransfer').length===0&&!properties.has('REVIEW_TRANSFER'),'recovered journal cleared');
const snapshot=JSON.stringify(all()),propsBefore=JSON.stringify([...properties]);
context.auditReviewedSharedNg();
check(JSON.stringify(all())===snapshot&&JSON.stringify([...properties])===propsBefore,'audit remains read-only');

// Withdrawal after the original report moved still removes only that reporter's vote.
check(personal(device,[{...sent[0],operationId:crypto.randomBytes(32).toString('hex'),action:'delete'}]).ok,'withdraw moved ID');
context.reviewPersonalNg();check(!JSON.parse(context.exportReviewedSharedNg()).rules.some(r=>r.kind==='id'&&r.value==='FixtureID'),'withdrawal suppresses prior upsert across sheets');
now+=86400000-1;context.reviewPersonalNg();check(rows('NG_ID').length>0,'ID retained before 24 hours');
now++;context.reviewPersonalNg();
check(rows('NG_ID').length>0&&all().some(r=>JSON.parse(r[2]).kind==='id'),'ID history remains after 24 hours');
check(rows('NG_Wacchoi').length===3,'weekly identities survive daily cleanup');
now+=6*86400000;context.reviewPersonalNg();
check(rows('NG_Wacchoi').length===3,'all Wacchoi forms remain after seven days');
check(rows('NG_Name').length===2&&rows('NG_Reporter').length===1&&rows('NG_Word').length>0,'other kinds retain history');
check(rows('ReviewTransfer').length===0&&rows('Inbox').length===0,'completed rows leave queues and transfer journal');
console.log('PASS '+checks+' typed review/automatic approval/regex/history-retention/recovery checks');

const large=JSON.stringify({rules:[{value:'𠮷'.repeat(40000)}]});
context.ngReviewedCachePut_(large);check(context.ngReviewedCacheGet_()===large,'large Unicode snapshot survives chunk caching');
const manifest=JSON.parse(cache.get('reviewed-feed-v9'));
cache.delete('reviewed-part:'+manifest.hash+':0');check(context.ngReviewedCacheGet_()===null,'evicted chunk invalidates snapshot');
context.ngReviewedCachePut_(large);cache.set('reviewed-part:'+manifest.hash+':0','broken');check(context.ngReviewedCacheGet_()===null,'corrupt chunk invalidates snapshot');
console.log('PASS '+checks+' including large-feed cache checks');
