import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import vm from 'node:vm';

const source = fs.readFileSync(new URL('../patches/src/main/kotlin/app/pigfoot/patches/camscanner/CamScannerLotteryInitGuard.kt', import.meta.url), 'utf8');
function raw(name) { return source.split('internal val ' + name + ' = """')[1].split('""".trimIndent()')[0].trim(); }
const factory = raw('lotteryInitGuardFactory');
const script = raw('lotteryInitOnlyScript').replace('$lotteryInitGuardFactory',factory).replace('function(url) { return import(url); }','__importer');
const pins = JSON.parse(fs.readFileSync(new URL('./fixtures/camscanner-init-functions.json', import.meta.url), 'utf8'));

function fixture(options = {}) {
  const timers = new Map(); let id = 0, imports = 0, pageCalls = 0, preloadCalls = 0, nativeCalls = 0, receiver;
  const failure = new Error('Synthetic original failure');
  const scope = {localStorage:{getItem:()=>null},N:'',Nt:'/',he:'',Xe:'',de:true,Ct:()=>1,ge:{},i:'watchad_lottery',se(){},U(){},Se(){},
    y:{event_tracking(){pageCalls++;receiver=this;if(options.pageFail)throw failure;return 41;}},
    r(){nativeCalls++;if(options.preloadFail)throw failure;return 42;}};
  vm.createContext(scope);vm.runInContext('page=('+pins.page_source+');preload=('+pins.preload_source+');',scope);
  const originalPage = scope.page, originalPreload = scope.preload;
  const mod = {L:{page:options.changed ? function changed(){} : originalPage},C:{watchad_lottery:originalPreload}};
  if(options.locked)Object.defineProperty(mod.C,'watchad_lottery',{writable:false});
  const context = {location:new URL(options.location || 'https://mo.camscanner.com/lottery/relottery'),Reflect,window:{jsapi_ready:options.ready!==false},
    document:{getElementById(){throw Error('Silent production mode must not inspect DOM');}},
    performance:{getEntriesByType(){return options.unloaded?[]:[{name:pins.config_url}];}},
    setTimeout(fn,delay){assert.equal(delay,30000);timers.set(++id,fn);return id;},clearTimeout(id){timers.delete(id);},
    __importer:async url=>{imports++;assert.equal(url,pins.config_url);if(options.importFail)throw failure;return mod;},
    fetch(){throw Error('No additional network request');},XMLHttpRequest:class{constructor(){throw Error('No quota request');}},
  };
  vm.createContext(context);vm.runInContext(script,context);
  return {context,mod,originalPage,originalPreload,failure,scope,
    async flush(){for(let n=0;n<20;n++)await Promise.resolve();},
    repeat(){vm.runInContext(script,context);},expire(){for(const fn of [...timers.values()])fn();},
    get imports(){return imports;},get pageCalls(){return pageCalls;},get preloadCalls(){return preloadCalls;},get nativeCalls(){return nativeCalls;},get receiver(){return receiver;}};
}

test('silent guard installs without invoking tracking/native or querying quota',async()=>{
 const f=fixture();await f.flush();assert.notEqual(f.mod.L.page,f.originalPage);assert.equal(f.pageCalls,0);assert.equal(f.nativeCalls,0);assert.equal(f.imports,1);
 assert.equal(f.mod.L.page('CSPlaytable',{}),undefined);assert.equal(f.receiver,f.scope.y);
 assert.equal(f.mod.C.watchad_lottery({data:{prestrain:1},close_web:0}),undefined);
 assert.equal(f.nativeCalls,1);assert.equal(f.mod.L.page,f.originalPage);assert.equal(f.mod.C.watchad_lottery,f.originalPreload);
});
test('qualified synchronous initialization failures do not prevent original page query progression',async()=>{
 const f=fixture({pageFail:true,preloadFail:true});await f.flush();let originalQueries=0;
 assert.doesNotThrow(()=>{f.mod.L.page('CSPlaytable',{});f.mod.C.watchad_lottery({data:{prestrain:1},close_web:0});originalQueries++;});
 assert.equal(originalQueries,1);assert.equal(f.pageCalls,1);assert.equal(f.nativeCalls,1);assert.equal(f.mod.L.page,f.originalPage);
});
test('active claims and malformed preload options preserve original errors and do not consume the wrapper',async()=>{
 for(const args of [[{data:{prestrain:0},close_web:0}],[{data:{prestrain:'1'},close_web:0}],[{data:{prestrain:1},close_web:1}],[{data:{prestrain:1},close_web:0},()=>{}]]){
  const f=fixture({preloadFail:true});await f.flush();const wrapper=f.mod.C.watchad_lottery;
  assert.throws(()=>Reflect.apply(wrapper,f.mod.C,args),e=>e===f.failure);assert.equal(f.mod.C.watchad_lottery,wrapper);
 }
});
test('unrelated page events and route changes preserve original exception identity',async()=>{
 const f=fixture({pageFail:true,preloadFail:true});await f.flush();
 assert.throws(()=>f.mod.L.page('OtherPage',{}),e=>e===f.failure);
 f.context.location=new URL('https://mo.camscanner.com/task/index');
 assert.throws(()=>f.mod.L.page('CSPlaytable',{}),e=>e===f.failure);
 assert.throws(()=>f.mod.C.watchad_lottery({data:{prestrain:1},close_web:0}),e=>e===f.failure);
});
test('host route and unloaded-module gates never import or mutate unknown pages',async()=>{
 for(const options of [{location:'https://mo.camscanner.com.evil.invalid/lottery/relottery'},{location:'https://mo.camscanner.com/task/index'},{unloaded:true}]){
  const f=fixture(options);await f.flush();assert.equal(f.imports,0);assert.equal(f.mod.L.page,f.originalPage);assert.equal(f.mod.C.watchad_lottery,f.originalPreload);
 }
});
test('changed functions non-writable methods unready bridges and import failures fail closed',async()=>{
 for(const options of [{changed:true},{locked:true},{ready:false},{importFail:true}]){
  const f=fixture(options);const page=f.mod.L.page;await f.flush();assert.equal(f.mod.L.page,page);assert.equal(f.mod.C.watchad_lottery,f.originalPreload);assert.equal(f.nativeCalls,0);
 }
});
test('duplicate page finish cannot rewrap or import twice',async()=>{
 const f=fixture();await f.flush();const page=f.mod.L.page;f.repeat();await f.flush();assert.equal(f.imports,1);assert.equal(f.mod.L.page,page);
});
test('deadline restores owned methods while preserving later SDK owners',async()=>{
 const f=fixture({pageFail:true});await f.flush();const wrapper=f.mod.L.page;function sdk(...a){return Reflect.apply(wrapper,this,a);}f.mod.L.page=sdk;
 f.expire();assert.equal(f.mod.L.page,sdk);assert.equal(f.mod.C.watchad_lottery,f.originalPreload);assert.throws(()=>sdk('CSPlaytable',{}),e=>e===f.failure);
});
test('frozen retained wrappers deactivate instead of swallowing future errors',async()=>{
 const f=fixture({pageFail:true});await f.flush();const wrapper=f.mod.L.page;Object.defineProperty(f.mod.L,'page',{writable:false});f.expire();
 assert.equal(f.mod.L.page,wrapper);assert.throws(()=>wrapper('CSPlaytable',{}),e=>e===f.failure);
});
