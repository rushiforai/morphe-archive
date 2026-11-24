// Comparación controlada de CPU y operaciones; no mide la red ni los FPS del TV.
const fs=require('node:fs'),vm=require('node:vm'),assert=require('node:assert/strict');
const {performance}=require('node:perf_hooks');
const {execFileSync}=require('node:child_process');
const baseline=process.argv[2]||'v1.7.0-dev.9';
if(!/^[A-Za-z0-9._/-]+$/.test(baseline))throw Error('Referencia no válida');
const file='extensions/extension/src/main/js/premium.js';
function measure(ref){
    const source=ref?execFileSync('git',['show',ref+':'+file],{encoding:'utf8'}):fs.readFileSync(file,'utf8');
    let feature;const p=vm.createContext({youtv:{feature:f=>feature=f,mentions:(t,m)=>m.some(x=>t.includes(x)),report(){}}});
    vm.runInContext('window=this; regexTests=0; splices=0; const test=RegExp.prototype.test; RegExp.prototype.test=function(s){regexTests++;return test.call(this,s);}; const splice=Array.prototype.splice; Array.prototype.splice=function(...args){splices++;return splice.apply(this,args);};',p);
    vm.runInContext(fs.readFileSync('extensions/extension/src/main/js/response-tree.js','utf8'),p);
    vm.runInContext(source,p);
    const input=JSON.stringify({items:Array.from({length:10000},(_,i)=>i%2?{mealbarPromoRenderer:{text:'Premium'}}:{tileRenderer:{id:i,title:'keep',metadata:{text:'ordinary'}}})});
    const times=[];let output;
    for(let i=0;i<15;i++){
        const data=vm.runInContext('JSON.parse('+JSON.stringify(input)+')',p);
        const start=performance.now();if(feature.onResponse) feature.onResponse(data,null,input); else p.youtv.applyTreeFilters(data,[{rule:feature.treeFilter,removed:0}]);times.push(performance.now()-start);output=data;
    }
    assert.equal(output.items.length,5000);assert.equal(output.items[4999].tileRenderer.id,9998);
    times.sort((a,b)=>a-b);
    return {elementos:10000,repeticiones:15,medianaMs:Math.round(times[7]*100)/100,comprobacionesRegex:p.regexTests,operacionesSplice:p.splices};
}
console.log(JSON.stringify({referencia:baseline,anterior:measure(baseline),actual:measure(null)},null,2));
