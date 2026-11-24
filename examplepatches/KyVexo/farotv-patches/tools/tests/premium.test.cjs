const assert=require('node:assert/strict');
const fs=require('node:fs');
const vm=require('node:vm');
const {execFileSync}=require('node:child_process');
const {test}=require('node:test');
const file='extensions/extension/src/main/js/premium.js';
const old=execFileSync('git',['show','v1.7.0-dev.9:'+file],{encoding:'utf8'});
const current=fs.readFileSync(file,'utf8');
function filter(source){
    let feature; const reports=[];
    const p=vm.createContext({youtv:{feature:f=>feature=f,mentions:(text,markers)=>markers.some(m=>text.includes(m)),report:m=>reports.push(m)}});
    vm.runInContext('window=this;',p);vm.runInContext(fs.readFileSync('extensions/extension/src/main/js/response-tree.js','utf8'),p);vm.runInContext(source,p);
    return function(data,text=JSON.stringify(data)){if(feature.onResponse) feature.onResponse(data,null,text);
        else if(p.youtv.mentions(text,feature.treeFilter.markers)) {
            const entry={rule:feature.treeFilter,removed:0};p.youtv.applyTreeFilters(data,[entry]);
            if(entry.removed)entry.rule.report(entry.removed);
        }
        return {data,reports:reports.splice(0)};};
}
const baseline=filter(old), optimized=filter(current);
function compare(input){assert.deepEqual(optimized(structuredClone(input)),baseline(structuredClone(input)));}
test('premium filter preserves renderers, popups, nested arrays, depth boundary and order',()=>{
    compare({items:[{id:1},{mealbarPromoRenderer:{}},{openPopupAction:{popup:{tvUpsellDialogRenderer:{}}}},
        {id:2,children:[{id:3},{statementBannerRenderer:{}}]},null,4,[],{messages:{ypcPromoRenderer:{},text:'keep'}}]});
    for(let depth=28;depth<34;depth++){
        let input={items:[{mealbarPromoRenderer:{}},{id:9}]};
        for(let i=0;i<depth;i++)input={child:input};compare(input);
    }
    const sparse=[];sparse[0]={mealbarPromoRenderer:{}};sparse[3]={id:7};compare({items:sparse});
    compare({items:[{mealbarPromoRenderer:{}},{mealbarPromoRenderer:{}}]});
});
test('premium name cache preserves regex semantics and eviction, including unusual field names',()=>{
    const items=[];
    for(let i=0;i<600;i++)items.push({['ordinary'+i+'Renderer']:{id:i}});
    for(const key of ['mealbarPromoRenderer','mealbarPromoRenderer\n','customUpsellFooRenderer','otherRenderer',
        'mealbarPromoSomethingRenderer','premiumUpsellRenderer','UpsellRenderer','xUpsellRenderer','__proto__Renderer']){
        items.push({[key]:{},id:key});
    }
    compare({items});compare({items});
});
test('premium filter matches previous behavior for generated mixed response trees',()=>{
    let seed=12345;
    function random(n){seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed%n;}
    function node(depth){
        if(!depth)return random(2)?null:random(999);
        switch(random(5)){
            case 0:return Array.from({length:random(8)},()=>node(depth-1));
            case 1:return {mealbarPromoRenderer:node(depth-1)};
            case 2:return {openPopupAction:{popup:{upsellDialogRenderer:node(depth-1)}}};
            default:return {contents:node(depth-1),items:node(depth-1),title:'keep',thumbnailRenderer:{url:'keep'}};
        }
    }
    for(let i=0;i<150;i++)compare(node(5));
});
test('premium filter does not modify responses without promotion markers or replace surviving objects',()=>{
    const keep={id:1};const input={items:[{mealbarPromoRenderer:{}},keep]};
    optimized(input);assert.equal(input.items[0],keep);
    const untouched={items:[{mealbarPromoRenderer:{}}]};optimized(untouched,'{}');assert.equal(untouched.items.length,1);
});
