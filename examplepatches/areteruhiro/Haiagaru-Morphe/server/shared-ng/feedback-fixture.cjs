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
const props={getProperty:k=>properties.get(k)||null,setProperty:(k,v)=>properties.set(k,String(v)),deleteProperty:k=>properties.delete(k),getKeys:()=>Array.from(properties.keys())};
// Exercise historical protocol behavior explicitly; the production default rejects it.
properties.set('REQUIRE_DEVICE_KEY','true');
let locked=false;
const context=vm.createContext({console,Date,Map,Set,JSON,Number,String,Object,Array,Error,
 SpreadsheetApp:{openById:()=>book,getActiveSpreadsheet:()=>activeBook,flush(){}},PropertiesService:{getScriptProperties:()=>props},
 CacheService:{getScriptCache:()=>({get:k=>cache.get(k),put:(k,v)=>cache.set(k,v),remove:k=>cache.delete(k)})},
 LockService:{getScriptLock:()=>({waitLock(){assert.ok(!locked);locked=true;},tryLock(){if(locked)return false;locked=true;return true;},releaseLock(){locked=false;},hasLock(){return locked;}})},
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

module.exports={context,properties,sheets,cache,book,run,get,allRecords,check,setFailure:name=>{failSheet=name;},request:body=>JSON.parse(context.doPost({postData:{contents:JSON.stringify(body)}}).text)};
