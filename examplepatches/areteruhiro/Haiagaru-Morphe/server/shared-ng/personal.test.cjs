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
function allRecords(){return [...sheets.entries()].filter(([n])=>n==='Inbox'||n==='Reviewed'||n.startsWith('NG_')).flatMap(([,s])=>s.rows.slice(1)).filter(r=>r.some(v=>v!==''&&v!=null)).sort((a,b)=>String(a[4]).localeCompare(String(b[4])));}
const c={operationId:'a'.repeat(64),action:'upsert',board:'edge/all',kind:'keyword',value:'今すぐ死ね',period:'',regex:false,flags:16};
check(personal('a'.repeat(64),[c]).accepted===1,'personal accepted');
check(personal('a'.repeat(64),[c]).accepted===0,'retry deduplicated');
check(get(0).rules.length===0,'personal submissions never immediately public');
for(const d of ['b','c'])check(personal(d.repeat(64),[{...c,operationId:d.repeat(64)}]).ok,'independent submit');
context.reviewPersonalNg();let exported=JSON.parse(context.exportReviewedSharedNg());check(exported.rules.length===1&&exported.rules[0].votes===3&&exported.rules[0].minLevel===1,'basic rules approved after 3 reporters');
check(personal('a'.repeat(64),[{...c,operationId:'d'.repeat(64),action:'delete'}]).ok,'withdraw accepted');
exported=JSON.parse(context.exportReviewedSharedNg());check(exported.rules.length===1&&exported.rules[0].votes===2,'withdraw removes one vote while remaining reports stay available');
check(!personal('a'.repeat(64),[{...c,operationId:'e'.repeat(64),kind:'suffix',value:'ab'}]).ok,'invalid suffix rejected');
check(personal('a'.repeat(64),[{...c,operationId:'f'.repeat(64),kind:'suffix',value:'Ab12',period:''}]).ok,'unknown period collected');
context.reviewPersonalNg();check(allRecords().at(-1)[5]==='approved','board-only identity approved without period');
console.log('PASS '+checks+' personal Inbox integration checks');
// Export revocation, board isolation and configurable thresholds.
const before=JSON.parse(context.exportReviewedSharedNg());
check(before.rules.every(r=>!r.reporter&&!r.operationId&&!r.regex),'feed excludes reporter and source executable data');
const d2='9'.repeat(64),rule={...c,operationId:'8'.repeat(64),board:'bbs.punipuni.eu/all'};
check(personal(d2,[rule]).ok,'external word accepted');
properties.set('REVIEW_POLICY_JSON',JSON.stringify({wordVotes:1}));
let ext=JSON.parse(context.exportReviewedSharedNg());check(ext.rules.some(r=>r.board==='bbs.punipuni.eu/all'),'external word reaches approved feed');
const exportedId=ext.rules.find(r=>r.board==='bbs.punipuni.eu/all').id;
properties.set('REVIEW_REVOKED_IDS',JSON.stringify([exportedId]));ext=JSON.parse(context.exportReviewedSharedNg());check(ext.rules.find(r=>r.id===exportedId).revoked,'revoked included in snapshot');
const oldRevision=ext.revision;check(JSON.parse(context.exportReviewedSharedNg()).revision===oldRevision,'unchanged feed stable revision');
const policySheet=sheets.get('ReviewPolicy');policySheet.rows.push(['wordVotes','20']);ext=JSON.parse(context.exportReviewedSharedNg());check(ext.rules.some(r=>r.board==='bbs.punipuni.eu/all'&&r.minVotes===1),'legacy sheet threshold cannot override app threshold');
console.log('PASS '+checks+' personal and publish checks');

// Identity kinds keep independent thresholds and expire in defined date buckets.
properties.set('REVIEW_POLICY_JSON','{}');policySheet.rows=policySheet.rows.slice(0,1);
for(const kind of ['id','wacchoi','prefix','suffix']){
 const value=kind==='id'?'TestId123':kind==='wacchoi'?'Ab12-Cd34':'Cd34';
 const condition={...c,board:'5ch/all',kind,value,period:'2026-10-22'};
 const required=kind==='prefix'||kind==='suffix'?10:5;
 for(let i=0;i<required;i++){
  const device=crypto.createHash('sha256').update(kind+':reporter:'+i).digest('hex');
  const operationId=crypto.createHash('sha256').update(kind+':operation:'+i).digest('hex');
  check(personal(device,[{...condition,operationId}]).ok,kind+' report accepted');
  const result=JSON.parse(context.exportReviewedSharedNg()).rules.find(r=>r.kind===kind&&r.board==='5ch/all');
  check(result.votes===i+1&&result.minVotes===1&&result.minLevel===1,kind+' each vote available for client threshold');
 }
}
check(personal('a'.repeat(64),[{...c,operationId:'7'.repeat(64),kind:'suffix',value:'Ab12',period:'2026-10-23'}]).ok,'legacy dates accepted and ignored');
console.log('PASS '+checks+' Inbox and identity publication checks');

// Publication sends only the reviewed snapshot, retains revision on retry, and surfaces HTTP failures.
let calls=[],existing=null,putStatus=201;
context.Utilities.base64Encode=v=>Buffer.from(v,'utf8').toString('base64');
context.Utilities.base64Decode=v=>Buffer.from(v.replace(/\s/g,''),'base64');
context.Utilities.newBlob=v=>({getBytes:()=>Array.from(Buffer.from(v)),getDataAsString:()=>Buffer.from(v).toString('utf8')});
context.UrlFetchApp={fetch:(url,options)=>{
 check(locked,'publication lock held through GitHub read/write');calls.push({url,options});
 if(options.method==='put'){
  const payload=JSON.parse(options.payload);const feed=JSON.parse(Buffer.from(payload.content,'base64').toString('utf8'));
  check(feed.full===true&&feed.rules.every(r=>!r.reporter&&!r.sourceScope&&!r.operationId),'only public conditions uploaded');
  if(putStatus===201)existing=payload.content;
  return {getResponseCode:()=>putStatus,getContentText:()=>''};
 }
 return {getResponseCode:()=>existing?200:404,getContentText:()=>JSON.stringify({sha:'testsha',content:existing})};
}};
properties.set('GITHUB_FEED_TOKEN','synthetic-token');
check(context.publishReviewedSharedNg()==='published','first GitHub publication');
check(context.publishReviewedSharedNg()==='unchanged','unchanged snapshot skips write');
existing=null;putStatus=503;
assert.throws(()=>context.publishReviewedSharedNg(),/GitHub publish failed: 503/);checks++;
check(!locked,'export lock released after publication');
console.log('PASS '+checks+' Inbox and GitHub publication checks');

properties.set('REVIEW_POLICY_JSON',JSON.stringify({wordVotes:2}));
const flagRule={...c,board:'talk.jp/all',value:'今すぐ死ね',operationId:crypto.randomBytes(32).toString('hex')};
check(personal('1'.repeat(64),[flagRule]).ok,'flags initial report');
check(personal('1'.repeat(64),[{...flagRule,flags:25,operationId:crypto.randomBytes(32).toString('hex')}]).ok,'same reporter presentation change');
check(JSON.parse(context.exportReviewedSharedNg()).rules.some(r=>r.board==='talk.jp/all'&&r.votes===1),'one reporter never double-votes across hidden/chain modes');
check(personal('2'.repeat(64),[{...flagRule,flags:25,operationId:crypto.randomBytes(32).toString('hex')}]).ok,'second reporter with different presentation');
check(JSON.parse(context.exportReviewedSharedNg()).rules.some(r=>r.board==='talk.jp/all'&&r.votes===2),'presentation flags do not split aggregate votes');
console.log('PASS '+checks+' total personal integration checks');

check(personal('3'.repeat(64),[{...c,kind:'id',value:'^(abc|def)$',regex:true,operationId:crypto.randomBytes(32).toString('hex')}]).ok,'personal ID regex can enter private review without blocking batch');
context.reviewPersonalNg();check(allRecords().at(-1)[5]==='approved','ID regex approved as data');
console.log('PASS '+checks+' total Inbox checks');

const replacementBase={...flagRule,flags:16};
check(personal('1'.repeat(64),[{...replacementBase,action:'delete',operationId:crypto.randomBytes(32).toString('hex')},{...replacementBase,flags:25,action:'upsert',operationId:crypto.randomBytes(32).toString('hex')}]).ok,'presentation replacement batch accepted');
check(JSON.parse(context.exportReviewedSharedNg()).rules.some(r=>r.board==='talk.jp/all'&&r.votes===2),'delete then replacement preserves existing reporter vote');
console.log('PASS '+checks+' total replacement checks');

check(personal('4'.repeat(64),[{...c,flags:32,regex:false,operationId:crypto.randomBytes(32).toString('hex')}]).ok,'native regex flag accepted privately');
context.reviewPersonalNg();const regexRow=allRecords().at(-1);check(JSON.parse(regexRow[2]).regex===true&&regexRow[5]==='approved','native regex flag retained in approved condition');
check(personal('4'.repeat(64),[{...c,flags:64,operationId:crypto.randomBytes(32).toString('hex')}]).ok,'special match mode accepted privately');
context.reviewPersonalNg();check(allRecords().at(-1)[5]==='pending','unsupported special mode never broadened into substring rule');
console.log('PASS '+checks+' final Inbox checks');

const reviewed=JSON.parse(context.exportReviewedSharedNg()).rules.find(r=>r.board==='talk.jp/all');
context.setReviewedSharedNgRevoked_(reviewed.id,true);
check(JSON.parse(context.exportReviewedSharedNg()).rules.find(r=>r.id===reviewed.id).revoked,'admin revoke reaches full snapshot');
context.setReviewedSharedNgRevoked_(reviewed.id,true);
check(JSON.parse(properties.get('REVIEW_REVOKED_IDS')).filter(id=>id===reviewed.id).length===1,'repeat revoke does not duplicate ID');
context.setReviewedSharedNgRevoked_(reviewed.id,false);
check(!JSON.parse(context.exportReviewedSharedNg()).rules.find(r=>r.id===reviewed.id).revoked,'admin resume restores approved condition');
assert.throws(()=>context.setReviewedSharedNgRevoked_('bad',true),/Invalid reviewed rule ID/);checks++;
check(!locked,'admin lock released');
console.log('PASS '+checks+' admin revocation checks');

let triggers=[{name:'unrelated',getHandlerFunction(){return this.name;}}];
context.ScriptApp={getProjectTriggers:()=>triggers,deleteTrigger:t=>{triggers=triggers.filter(x=>x!==t);},newTrigger:name=>({timeBased(){return this;},everyHours:n=>{assert.equal(n,1);return {create:()=>triggers.push({name,getHandlerFunction(){return this.name;}})};}})};
properties.delete('GITHUB_FEED_TOKEN');context.installSharedNgReviewTrigger();context.installSharedNgReviewTrigger();
check(triggers.filter(t=>t.name==='reviewPersonalNg').length===1,'review trigger installs without GitHub token and without duplicates');
check(triggers.some(t=>t.name==='unrelated'),'unrelated triggers preserved');
assert.throws(()=>context.installSharedNgPublishTrigger(),/GITHUB_FEED_TOKEN/);checks++;
properties.set('GITHUB_FEED_TOKEN','synthetic');context.installSharedNgPublishTrigger();context.installSharedNgPublishTrigger();
check(triggers.filter(t=>t.name==='publishReviewedSharedNg').length===1,'publication trigger separate and idempotent');
check(triggers.some(t=>t.name==='reviewPersonalNg'),'publication setup preserves review trigger');
console.log('PASS '+checks+' trigger and admin checks');

check(!post('5'.repeat(64),[{board:'5ch/all',kind:'id',value:'unreviewed',period:'2026-10-22'}]).ok,'version1 cannot bypass Inbox review by default');
check(personal('5'.repeat(64),[{...c,operationId:crypto.randomBytes(32).toString('hex')}]).ok,'reviewed version2 remains available without legacy flag');
console.log('PASS '+checks+' reviewed-only ingress checks');

const failDevice='6'.repeat(64),failOp={...c,operationId:crypto.randomBytes(32).toString('hex')};
const inboxRows=sheets.get('Inbox').rows.length;failSheet='Inbox';
check(!personal(failDevice,[failOp]).ok,'failed Inbox write is not acknowledged');
check(sheets.get('Inbox').rows.length===inboxRows,'failed write has no partial rows');
check(personal(failDevice,[failOp]).accepted===1,'same operation accepted after write failure');
check(personal(failDevice,[failOp]).accepted===0,'retry after successful write is deduplicated');
const beforeLimit=sheets.get('Inbox').rows.length;
const oversized=Array.from({length:21},()=>({...c,operationId:crypto.randomBytes(32).toString('hex')}));
check(!personal(failDevice,oversized).ok&&sheets.get('Inbox').rows.length===beforeLimit,'oversized batch rejects atomically');
console.log('PASS '+checks+' failure-recovery checks');

cache.delete('reviewed-feed-v6');
const direct=JSON.parse(context.doGet({parameter:{action:'reviewed'}}).text);
check(direct.ok&&direct.full&&direct.format===1,'GAS direct route returns approved full feed');
check(direct.rules.every(r=>!r.reporter&&!r.operationId&&!r.sourceScope),'GAS direct route excludes private metadata');
check(!direct.rules.some(r=>r.board==='unknown.invalid/unresolved'),'unresolved submissions never exposed');
check(JSON.parse(context.doGet({parameter:{action:'reviewed'}}).text).revision===direct.revision,'cached GAS feed retains revision');
console.log('PASS '+checks+' direct-feed checks');
// Audit must inspect real stored decisions and refuse corrupted approval/export state.
let auditLog='';context.console={log:s=>auditLog=s};
context.reviewPersonalNg();const audit=context.auditReviewedSharedNg();
check(audit.ok&&audit.readOnly&&audit.policyProbes===8,'administrative audit verifies reviewed publication');
check(!auditLog.includes('reporterId')&&!auditLog.includes('死ね')&&!auditLog.includes('SyntheticId'),'audit log excludes raw conditions and identities');
console.log('PASS '+checks+' privacy-preserving audit checks');

check(context.ngFamilyBoard_('5ch/android')===context.ngFamilyBoard_('5ch/poverty'),'fine 5ch boards share parent scope');
check(context.ngFamilyBoard_('mercury.bbspink.com/erobbs')==='pink/all','PINK parent isolated');
check(context.ngFamilyBoard_('bbs.eddibb.cc/liveedge')==='edge/all','Edge parent isolated');
check(context.ngFamilyName_('jbbs.shitaraba.net/game/123')==='したらば掲示板','external parent has name');
check(JSON.parse(context.exportReviewedSharedNg()).rules.every(r=>r.period===''&&r.board.endsWith('/all')&&typeof r.boardName==='string'),'feed includes parent name and no individual board or period');
console.log('PASS '+checks+' parent service scope checks');

const beforeAuditRows=JSON.stringify(allRecords()),beforeAuditProps=JSON.stringify(Array.from(properties.entries()));
context.auditReviewedSharedNg();
check(JSON.stringify(allRecords())===beforeAuditRows&&JSON.stringify(Array.from(properties.entries()))===beforeAuditProps,'audit never changes review decisions or export revision');
const activeApproved=allRecords().findLast(r=>r[5]==='approved');const savedState=activeApproved[5];activeApproved[5]='pending';
const stale=context.auditReviewedSharedNg();check(!stale.ok&&stale.issues.REVIEW_STATE_MISMATCH>0&&activeApproved[5]==='pending','audit detects stale decision without silently fixing it');activeApproved[5]=savedState;
const invalidRow=['bad','private','not json','upsert','','approved','private condition text',1,'{}'];sheets.get('Inbox').rows.push(invalidRow);
check(!context.auditReviewedSharedNg().ok,'invalid private rows reported without throwing raw content');sheets.get('Inbox').rows.pop();
console.log('PASS '+checks+' read-only audit checks');

const beforeCorrupt=JSON.parse(context.exportReviewedSharedNg());
const broken=['broken-operation','synthetic-reporter','', 'upsert','','pending','awaiting_policy',0,'{}'];sheets.get('Inbox').rows.push(broken);
sheets.get('Inbox').rows.push(['','','','','','','','','']);
const afterCorrupt=JSON.parse(context.exportReviewedSharedNg());
check(JSON.stringify(afterCorrupt.rules)===JSON.stringify(beforeCorrupt.rules),'bad Inbox row does not stop or change valid publication');
check(allRecords().some(r=>r[0]==='broken-operation'&&r[2]===''&&r[5]==='rejected'&&r[6]==='invalid_inbox_row'),'invalid raw row retained and quarantined');
check(context.auditReviewedSharedNg().warnings.QUARANTINED_INBOX_ROW===1,'quarantine remains visible in audit');
sheets.get('Inbox').rows.splice(-2);
console.log('PASS '+checks+' malformed-row recovery checks');

// New keyword policy applies to old Inbox rows and cannot be bypassed by manual approval.
const short={...c,operationId:crypto.randomBytes(32).toString('hex'),value:'あ'};
check(personal('1'.repeat(64),[short]).ok,'old clients receive acknowledgement without poisoning a batch');
const shortKey=context.ngConditionKey_(context.ngInboxValidate_(short).condition);
properties.set('REVIEW_OVERRIDES',JSON.stringify({[shortKey]:{state:'approved',reason:'manual_review',minLevel:1,minVotes:1}}));
let safe=JSON.parse(context.exportReviewedSharedNg());
check(!safe.rules.some(r=>r.id===shortKey),'manual override cannot publish short keyword');
check(allRecords().at(-1)[6]==='ineligible_keyword','short keyword rejected with stable reason');
check(personal('1'.repeat(64),[{...short,action:'delete',operationId:crypto.randomBytes(32).toString('hex')}]).ok,'legacy short keyword can be withdrawn');
context.reviewPersonalNg();check(allRecords().at(-1)[5]==='withdrawn','withdrawal survives keyword policy');
console.log('PASS '+checks+' final keyword policy integration checks');

const reporterCondition={...c,operationId:crypto.randomBytes(32).toString('hex'),kind:'reporter',value:'ReporterFixture01',board:'edge/all'};
check(personal('7'.repeat(64),[reporterCondition]).ok,'reporter condition accepted');
check(!personal('7'.repeat(64),[{...reporterCondition,operationId:crypto.randomBytes(32).toString('hex'),board:'5ch/all'}]).ok,'reporter cannot target another service');
const globalCondition={...c,operationId:crypto.randomBytes(32).toString('hex'),kind:'id',value:'GlobalFixture01',board:'unknown.invalid/unresolved'};
check(personal('7'.repeat(64),[globalCondition]).ok,'legacy unknown ID accepted');
cache.delete('reviewed-feed-v9');const oldFeed=JSON.parse(context.doGet({parameter:{action:'reviewed'}}).text);
check(!oldFeed.rules.some(r=>r.kind==='reporter'||r.board==='*'&&['id','wacchoi','prefix','suffix'].includes(r.kind)),'old clients never receive incompatible conditions');
const newFeed=JSON.parse(context.doGet({parameter:{action:'reviewed',reporter:'1',globalIdentity:'1'}}).text);
check(newFeed.rules.some(r=>r.kind==='reporter'&&r.value==='ReporterFixture01'),'new client receives approved reporter ID');
check(newFeed.rules.some(r=>r.kind==='id'&&r.value==='GlobalFixture01'&&r.board==='*'),'past unknown ID migrates to approved global condition');
check(context.auditReviewedSharedNg().ok,'global and reporter publication passes audit');
console.log('PASS '+checks+' reporter/global identity compatibility checks');
