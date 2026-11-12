const fs=require('node:fs'),vm=require('node:vm'),crypto=require('node:crypto'),assert=require('node:assert/strict');
let checks=0,held=false,acquires=0,releases=0,builds=0,reads=0,writes=0,onAcquire=null,available=true,failExport=false,failPut=false,revision=1;
const cache=new Map(),properties=new Map(),cacheKey='test-reviewed-feed';
function ok(value,label){assert.ok(value,label);checks++;}
const hash=value=>crypto.createHash('sha256').update(value).digest('hex');
const cacheApi={get:key=>cache.get(key)??null,put:(key,value)=>cache.set(key,value),
 getAll:keys=>{reads++;return Object.fromEntries(keys.filter(key=>cache.has(key)).map(key=>[key,cache.get(key)]));},
 putAll:parts=>{writes++;if(failPut)throw Error('cache unavailable');for(const [key,value] of Object.entries(parts))cache.set(key,value);}};
const props={getProperty:key=>properties.get(key)||null};
const context=vm.createContext({console,JSON,Map,Set,Date,Number,String,Object,Array,Error,
 ngHash_:hash,ngReviewedCacheKey_:()=>cacheKey,
 CacheService:{getScriptCache:()=>cacheApi},
 LockService:{getScriptLock:()=>({waitLock(){assert.equal(held,false);held=true;acquires++;},tryLock(ms){ok(ms===25000||ms===1000,'bounded server lock wait');acquires++;if(onAcquire)onAcquire();if(!available)return false;assert.equal(held,false);held=true;return true;},releaseLock(){assert.equal(held,true);held=false;releases++;}})},
 PropertiesService:{getScriptProperties:()=>props},
 Utilities:{Charset:{UTF_8:1},base64Decode:s=>Buffer.from(s,'base64'),newBlob:s=>({getDataAsString:()=>Buffer.from(s).toString('utf8')})},
 ContentService:{MimeType:{JSON:'json'},createTextOutput:text=>({text,setMimeType(){return this;}})}
});
vm.runInContext(fs.readFileSync(__dirname+'/Publish.gs','utf8'),context);
const snapshot=()=>JSON.stringify({ok:true,full:true,revision,rules:[{id:'a',board:'5ch/all',kind:'keyword',value:'有効な共有条件',flags:16,contributors:['public-id']}],nextOffset:null});
context.ngExportReviewedLocked_=()=>{ok(held,'snapshot created only while owning lock');builds++;if(failExport)throw Error('injected export failure');return snapshot();};
const feed=()=>JSON.parse(context.reviewedSharedNgFeed({parameter:{contributors:'1'}}).text);
let first=feed();ok(first.ok&&first.revision===1&&builds===1,'cold miss builds one complete snapshot');ok(!held&&releases===1,'builder releases lock');ok(writes===1,'parts written in one cache RPC');
held=true;let previous=acquires;ok(feed().revision===1&&acquires===previous,'warm reads bypass a lock held by review or publishing');held=false;
cache.clear();onAcquire=()=>context.ngReviewedCachePut_(snapshot());previous=builds;ok(feed().revision===1&&builds===previous,'a waiter double-checks the cache populated while it waited');onAcquire=null;
cache.clear();available=false;onAcquire=()=>context.ngReviewedCachePut_(snapshot());previous=releases;ok(feed().revision===1&&releases===previous,'failed acquisition can use a snapshot committed just before timeout without releasing another owner');onAcquire=null;
cache.clear();assert.throws(feed,/配信データを更新中/);checks++;ok(!held&&releases===previous,'no snapshot plus contention is a controlled failure with no false ownership');available=true;
failExport=true;assert.throws(feed,/injected export/);checks++;ok(!held&&context.ngReviewedCacheGet_()===null,'failed build releases lock without publishing partial data');failExport=false;
failPut=true;assert.throws(feed,/cache unavailable/);checks++;ok(!held&&!cache.has(cacheKey),'failed part write cannot commit a manifest or retain lock');failPut=false;
revision=2;ok(feed().revision===2,'next request can recover after build failure');
let manifest=JSON.parse(cache.get(cacheKey));cache.delete('reviewed-part:'+manifest.hash+':0');ok(context.ngReviewedCacheGet_()===null,'missing chunk invalidates complete snapshot');previous=builds;ok(feed().revision===2&&builds===previous+1,'missing chunk rebuilds safely');
manifest=JSON.parse(cache.get(cacheKey));cache.set('reviewed-part:'+manifest.hash+':0','corrupted');ok(context.ngReviewedCacheGet_()===null,'hash mismatch invalidates snapshot');ok(feed().ok,'corrupted snapshot is repaired');
const large=JSON.stringify({ok:true,rules:[{value:'あいう😀'.repeat(18000)}]});context.ngReviewedCachePut_(large);ok(context.ngReviewedCacheGet_()===large,'large Unicode response survives batched chunk write/read');manifest=JSON.parse(cache.get(cacheKey));ok(manifest.count>1&&reads>1,'multi-part response uses batched reads');
for(let i=0;i<manifest.count;i++){const part=cache.get('reviewed-part:'+manifest.hash+':'+i);ok(Buffer.byteLength(part)<=80000,'each chunk remains below GAS 100KB limit');ok(!/[\uD800-\uDBFF]$/.test(part),'surrogate pair is not split at a chunk boundary');}
revision=3;cache.clear();const admin=JSON.parse(context.exportReviewedSharedNg());ok(admin.revision===3&&context.ngReviewedCacheGet_()===snapshot(),'manual export warms feed before releasing its lock');
properties.set('GITHUB_FEED_TOKEN','fixture-token');context.UrlFetchApp={fetch(){ok(held&&context.ngReviewedCacheGet_()===snapshot(),'publication makes feed readable before external GitHub I/O');return {getResponseCode:()=>200,getContentText:()=>JSON.stringify({sha:'old-sha',content:Buffer.from(snapshot()).toString('base64')})};}};
ok(context.publishReviewedSharedNg()==='unchanged'&&!held,'publication keeps existing behavior and releases lock');
const compatible=JSON.parse(context.reviewedSharedNgFeed({parameter:{}}).text);ok(!compatible.rules[0].contributors,'capability filtering still strips contributor IDs for older clients');
// Compatibility with older isolated fixtures and partial CacheService implementations.
delete cacheApi.getAll;delete cacheApi.putAll;cache.clear();context.ngReviewedCachePut_(snapshot());ok(context.ngReviewedCacheGet_()===snapshot(),'single-key fallback remains valid');
const inbox=fs.readFileSync(__dirname+'/PersonalInbox.gs','utf8');vm.runInContext(inbox.slice(inbox.indexOf('function reviewPersonalNg(){'),inbox.indexOf('function ngReviewPersonalLocked_(')),context);
let reviews=0;const reviewedRows=[['reviewed-snapshot']];
context.ngReviewPersonalLocked_=capture=>{ok(held,'scheduled review holds the lock');reviews++;capture.rows=reviewedRows;return reviewedRows.length;};
context.ngExportReviewedLocked_=rows=>{ok(rows===reviewedRows,'scheduled publication reuses the exact reviewed rows instead of rereading sheets');return snapshot();};
available=false;previous=releases;ok(context.reviewPersonalNg()==='busy'&&reviews===0&&releases===previous,'overlapping scheduled review skips work and does not release another execution lock');available=true;
cache.clear();ok(context.reviewPersonalNg()===1&&reviews===1&&!held,'scheduled review keeps its result and releases lock');ok(context.ngReviewedCacheGet_()===snapshot(),'scheduled review leaves a complete feed ready for anonymous reads');
const beforeFailure=context.ngReviewedCacheGet_();context.ngReviewPersonalLocked_=()=>{throw Error('review failure');};assert.throws(()=>context.reviewPersonalNg(),/review failure/);checks++;ok(!held&&context.ngReviewedCacheGet_()===beforeFailure,'failed scheduled review releases lock and does not commit a partial replacement');
console.log('PASS '+checks+' shared NG cache/lock contention checks');
