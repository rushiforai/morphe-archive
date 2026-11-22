const fs=require('node:fs'),vm=require('node:vm'),assert=require('node:assert/strict');
const {test}=require('node:test');const {execFileSync}=require('node:child_process');
const root='extensions/extension/src/main/js/';const names=['ads','premium','shorts'];
function engine(old){
    const defs=[];const p=vm.createContext({youtv:{feature:f=>defs.push(f),report(){},mentions:(t,m)=>!t||m.some(k=>t.includes(k))}});
    vm.runInContext('window=this;',p);
    if(!old)vm.runInContext(fs.readFileSync(root+'response-tree.js','utf8'),p);
    for(const name of names)vm.runInContext(old?execFileSync('git',['show','v1.7.0-dev.10:'+root+name+'.js'],{encoding:'utf8'}):fs.readFileSync(root+name+'.js','utf8'),p);
    return (input,mask,text=JSON.stringify(input))=>{
        if(old){defs.forEach((f,i)=>{if(mask&(1<<i))f.onResponse(input,null,text);});return {input};}
        const active=[];
        defs.forEach((f,i)=>{if(!(mask&(1<<i)))return;if(f.beforeTree)f.beforeTree(input);
            const rule=f.treeFilter;if((!rule.eligible||rule.eligible(input))&&p.youtv.mentions(text,rule.markers))active.push({rule,removed:0});});
        const visited=active.length?p.youtv.applyTreeFilters(input,active):0;
        return {input,visited,active:active.length};
    };
}
const old=engine(true),current=engine(false);
function compare(input){for(let mask=0;mask<8;mask++)assert.deepEqual(current(structuredClone(input),mask).input,old(structuredClone(input),mask).input,'switch mask '+mask);}
test('shared pass preserves all eight enabled combinations, gating, schedules, popups and depth',()=>{
    const items=[{tileRenderer:{title:'keep'}},{adSlotRenderer:{}},{mealbarPromoRenderer:{}},
        {shelfRenderer:{tvhtml5ShelfRendererType:'TVHTML5_SHELF_RENDERER_TYPE_SHORTS'}},
        {openPopupAction:{popup:{upsellDialogRenderer:{}}}},
        {guideEntryRenderer:{navigationEndpoint:{reelWatchEndpoint:{}}}}];
    compare({contents:{items},playerResponse:{adPlacements:[],playerResponse:{adSlots:[]}},adBreakHeartbeatParams:'ad'});
    compare({items});
    for(let n=27;n<34;n++){let branch={items};for(let i=0;i<n;i++)branch={child:branch};compare({contents:branch});}
});
test('shared pass matches sequential filters on mixed generated trees and preserves retained references',()=>{
    let seed=739;function random(n){seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed%n;}
    function node(d){if(!d)return random(2)?'keep':null;
        switch(random(7)){
            case 0:return Array.from({length:random(5)},()=>node(d-1));
            case 1:return {adSlotRenderer:{items:node(d-1)}};
            case 2:return {mealbarPromoRenderer:{items:node(d-1)}};
            case 3:return {shelfRenderer:{tvhtml5ShelfRendererType:'TVHTML5_SHELF_RENDERER_TYPE_SHORTS',items:node(d-1)}};
            default:return {items:node(d-1),contents:node(d-1),title:'keep'};
        }}
    for(let i=0;i<150;i++)compare({contents:node(5)});
    const keep={tileRenderer:{id:1}};const data={contents:[{mealbarPromoRenderer:{}},keep]};current(data,7);assert.equal(data.contents[0],keep);
    const sparse=[];sparse[0]={adSlotRenderer:{}};sparse[4]=keep;compare({contents:sparse});
});
test('shared pass visits a clean subtree once with three active filters and skips absent markers',()=>{
    const input={contents:{items:Array.from({length:100},(_,i)=>({tileRenderer:{id:i}}))},text:'adSlotRenderer premiumUpsellRenderer reelWatchEndpoint'};
    const result=current(structuredClone(input),7);assert.equal(result.active,3);assert.equal(result.visited,203);
    const absent=current({contents:[{tileRenderer:{}}]},7);assert.equal(absent.active,0);assert.equal(absent.visited,0);
});
