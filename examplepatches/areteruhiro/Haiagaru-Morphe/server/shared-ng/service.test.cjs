const fs=require('node:fs'),vm=require('node:vm'),crypto=require('node:crypto'),assert=require('node:assert/strict');
const properties=new Map(),cache=new Map(),sheets=new Map();let checks=0,failSheet='',activeBook=null,activeSheet=null,activeRow=2;
class Sheet{
 constructor(name){this.name=name;this.rows=[];}
 getLastRow(){return this.rows.length;}getLastColumn(){return this.rows.reduce((n,r)=>Math.max(n,r.length),0);}
 setFrozenRows(){}
 getName(){return this.name;}getActiveRange(){return {getRow:()=>activeRow};}
 getRange(r,c,n,m){return {setValues:values=>{if(failSheet===this.name){failSheet='';throw Error('Injected sheet failure');}assert.equal(values.length,n);for(let i=0;i<n;i++){this.rows[r+i-1]??=[];for(let j=0;j<m;j++){const value=values[i][j];if(typeof value==='string')assert.ok(!value.startsWith('='),'No spreadsheet formula injection');this.rows[r+i-1][c+j-1]=value;}}},getValues:()=>Array.from({length:n},(_,i)=>Array.from({length:m},(_,j)=>this.rows[r+i-1]?.[c+j-1]??''))};}
 appendRow(r){if(failSheet===this.name){failSheet='';throw Error('Injected append failure');}this.rows.push(r.slice());}
}
const book={getId:()=> '1mKo9ogD2ePwu16hgya8pu2-fF7g-I3ERPgm18PCO_oc',getActiveSheet:()=>activeSheet,getSheetByName:n=>sheets.get(n),insertSheet:n=>{const s=new Sheet(n);sheets.set(n,s);return s;}};
const props={getProperty:k=>properties.get(k)||null,setProperty:(k,v)=>properties.set(k,String(v)),deleteProperty:k=>properties.delete(k)};
let locked=false;
const context=vm.createContext({console,Date,Map,Set,JSON,Number,String,Object,Array,Error,
 SpreadsheetApp:{openById:()=>book,getActiveSpreadsheet:()=>activeBook,flush(){}},PropertiesService:{getScriptProperties:()=>props},
 CacheService:{getScriptCache:()=>({get:k=>cache.get(k),put:(k,v)=>cache.set(k,v)})},
 LockService:{getScriptLock:()=>({waitLock(){assert.ok(!locked);locked=true;},releaseLock(){locked=false;},hasLock(){return locked;}})},
 Utilities:{newBlob:v=>({getBytes:()=>Array.from(Buffer.from(v,'utf8'))}),getUuid:()=>crypto.randomUUID(),DigestAlgorithm:{SHA_256:1},Charset:{UTF_8:1},computeDigest:(_,v)=>Array.from(crypto.createHash('sha256').update(v).digest())},
 ContentService:{MimeType:{JSON:'json'},createTextOutput:text=>({text,setMimeType(){return this;}})}
});
vm.runInContext(fs.readFileSync(__dirname+'/Code.gs','utf8'),context);
function run(code){return vm.runInContext(code,context);}
function get(since){return JSON.parse(context.doGet({parameter:{since:String(since)}}).text);}
function post(device,reports){return JSON.parse(context.doPost({postData:{contents:JSON.stringify({version:1,device,reports})}}).text);}
function check(value,label){assert.ok(value,label);checks++;}
properties.set('ALLOW_LEGACY_REPORTS','true');context.setupSharedNg();context.setupSharedNg();check(sheets.size===4,'setup idempotent');
const condition={board:'5ch/poverty',kind:'id',value:'abc123',period:'2026-10-22'},d='a'.repeat(64);
let first=post(d,[condition]);check(first.ok&&first.accepted===1,'first report');
let duplicate=post(d,[condition]);check(duplicate.ok&&duplicate.accepted===0,'duplicate one vote');
let full=get(0);check(full.ok&&full.full&&full.rules[0].votes===1,'initial snapshot');
check(!JSON.stringify(full).includes(d)&&!JSON.stringify(full).includes('reporter'),'no reporter leakage');
check(get(full.revision).unchanged,'unchanged cheap response');
for(let n=0;n<4;n++)check(post(String(n).repeat(64),[condition]).ok,'independent report');
let delta=get(first.revision);check(delta.ok&&!delta.full&&delta.rules.length===1&&delta.rules[0].votes===5,'deduplicated delta');
check(!post(d,[{...condition,kind:'keyword',value:'too short',period:''}]).ok,'reject short keyword');
check(!post(d,[{...condition,period:'2026-02-30'}]).ok,'reject invalid date');
check(!post(d,[{...condition,kind:'javascript'}]).ok,'no executable rules');
const formula={board:'5ch/poverty',kind:'keyword',value:'=IMPORTXML("https://example.invalid", "'+ 'x'.repeat(55)+'")',period:''};
check(post(d,[formula]).ok,'formula-like keyword stored as JSON text');
check(get(0).rules.some(r=>r.value===formula.value),'keyword roundtrip');
const recover={...condition,value:'recovery123'};failSheet='Rules';
check(!post(d,[recover]).ok&&properties.has('PENDING'),'failed transaction journal retained');
const recovered=get(0);check(recovered.ok&&recovered.rules.find(r=>r.value==='recovery123').votes===1&&!properties.has('PENDING'),'read repairs interrupted write');
check(post(d,[recover]).accepted===0,'retry after repair does not inflate vote');
const revokeId=get(0).rules.find(r=>r.value==='abc123').id;
assert.throws(()=>context.revokeSelectedSharedNg(),/共有NG/);checks++;
activeBook=book;activeSheet=sheets.get('Votes');assert.throws(()=>context.revokeSelectedSharedNg(),/Rules/);checks++;
activeSheet=sheets.get('Rules');activeRow=1;assert.throws(()=>context.revokeSelectedSharedNg(),/Rules/);checks++;
activeRow=2;context.revokeSelectedSharedNg();check(get(0).rules.find(r=>r.id===revokeId).revoked,'admin uses active spreadsheet selection');
check(get(0).rules.find(r=>r.id===revokeId).revoked,'admin revocation');
check(post('f'.repeat(64),[condition]).accepted===0,'revoked condition cannot be revived by report');
const interruptedId=get(0).rules.find(r=>r.value==='recovery123').id,revisionBeforeRevoke=Number(properties.get('REVISION'));failSheet='Rules';
assert.throws(()=>context.revokeSharedNg(interruptedId));
check(properties.has('REVOKE_PENDING'),'interrupted revocation retained');
const repairedRevoke=get(revisionBeforeRevoke);
check(repairedRevoke.ok&&repairedRevoke.rules.some(r=>r.id===interruptedId&&r.revoked)&&!properties.has('REVOKE_PENDING'),'delta repairs interrupted revocation before unchanged fast path');
const lateId=get(0).rules.find(r=>r.value===formula.value).id,lateRevision=Number(properties.get('REVISION'));failSheet='Changes';
assert.throws(()=>context.revokeSharedNg(lateId));
check(properties.has('REVOKE_PENDING')&&Number(properties.get('REVISION'))===lateRevision,'revocation failure after rule write retains journal and old cursor');
const lateRecovered=get(lateRevision);
check(lateRecovered.ok&&lateRecovered.rules.some(r=>r.id===lateId&&r.revoked)&&!properties.has('REVOKE_PENDING'),'revocation recovers after rule already changed');
const utf8Oversize=JSON.stringify({version:1,device:d,reports:Array(12).fill({...condition,kind:'keyword',value:'あ'.repeat(2000),period:''})});
check(utf8Oversize.length<65536&&!JSON.parse(context.doPost({postData:{contents:utf8Oversize}}).text).ok,'request limit counts UTF8 bytes');
check(!get(999999).ok,'future cursor rejected');
const beforeVotes=sheets.get('Votes').rows.length;
check(!post('b'.repeat(64),[{...condition,value:'valid123'},{...condition,value:'invalid space'}]).ok&&sheets.get('Votes').rows.length===beforeVotes,'invalid batch writes nothing');
check(!post(d,Array(21).fill(condition)).ok,'bounded batch');
// Large snapshot: exactly bounded pages, stable revision, no report history reads.
const smallRules=sheets.get('Rules').rows.map(r=>r.slice()),smallRevision=properties.get('REVISION');
const largeSheet=sheets.get('Rules');
for(let n=0;n<405;n++)largeSheet.rows.push(['z'+n,'5ch/poverty','keyword',JSON.stringify('長文'.repeat(1000)), '',5,false,100+n,'2026-10-22T00:00:00Z']);
properties.set('REVISION','1000');cache.clear();
let page=get(0);check(page.rules.length===200&&page.nextOffset===200,'bounded full first page');
const page2=JSON.parse(context.doGet({parameter:{since:'0',offset:'200',snapshot:'1000'}}).text);
check(page2.ok&&page2.rules.length===200&&page2.nextOffset===400&&page2.revision===1000,'stable full second page');
const last=JSON.parse(context.doGet({parameter:{since:'0',offset:'400',snapshot:'1000'}}).text);
check(last.ok&&last.rules.length===largeSheet.rows.length-401&&last.nextOffset===null,'full last page');
check(!JSON.parse(context.doGet({parameter:{since:'0',offset:'200'}}).text).ok,'page snapshot required');
properties.set('REVISION','1001');
check(JSON.parse(context.doGet({parameter:{since:'0',offset:'200',snapshot:'1000'}}).text).restart,'concurrent update restarts snapshot');
const changeSheet=sheets.get('Changes'),savedChanges=changeSheet.rows;changeSheet.rows=[['revision','ruleJson'],[999,'not json']];cache.clear();
check(get(450).ok,'delta reads latest rule state not unbounded change history');
changeSheet.rows=savedChanges;largeSheet.rows=smallRules;properties.set('REVISION',smallRevision);cache.clear();
check(locked===false,'locks always released');
console.log('PASS '+checks+' shared NG service checks');

properties.delete('ALLOW_LEGACY_REPORTS');
check(!post('a'.repeat(64),[{board:'5ch/android',kind:'id',value:'legacyBlocked',period:'2026-10-22'}]).ok,'legacy public write disabled by default');
console.log('PASS '+checks+' legacy migration checks');
