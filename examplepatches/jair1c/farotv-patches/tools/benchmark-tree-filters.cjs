// Compara recorridos y CPU en una respuesta sintética; no mide FPS ni red del TV.
const fs=require('node:fs'),vm=require('node:vm'),assert=require('node:assert/strict');
const {execFileSync}=require('node:child_process'),{performance}=require('node:perf_hooks');
const root='extensions/extension/src/main/js/';
const fixture={contents:{items:Array.from({length:10000},(_,i)=>({tileRenderer:{id:i,title:'keep',metadata:{label:'keep',count:i}}}))},
    text:'adSlotRenderer premiumUpsellRenderer reelWatchEndpoint'};
fixture.contents.items.splice(5,0,{adSlotRenderer:{}},{mealbarPromoRenderer:{}},{shelfRenderer:{tvhtml5ShelfRendererType:'TVHTML5_SHELF_RENDERER_TYPE_SHORTS'}});
function run(old){
    const defs=[];const p=vm.createContext({visited:0,youtv:{feature:f=>defs.push(f),report(){},mentions:(t,m)=>m.some(k=>t.includes(k))}});vm.runInContext('window=this',p);
    if(!old)vm.runInContext(fs.readFileSync(root+'response-tree.js','utf8'),p);
    for(const name of ['ads','premium','shorts']){
        let source=old?execFileSync('git',['show','v1.7.0-dev.10:'+root+name+'.js'],{encoding:'utf8'}):fs.readFileSync(root+name+'.js','utf8');
        if(old)source=source.replace('        var removed = 0;', '        visited++; var removed = 0;');
        vm.runInContext(source,p);
    }
    const times=[];let visited=0,output;
    for(let i=0;i<9;i++){
        const data=structuredClone(fixture),text=JSON.stringify(data);p.visited=0;
        const started=performance.now();
        if(old){defs.forEach(f=>f.onResponse(data,null,text));visited=p.visited;}
        else{
            const active=[];defs.forEach(f=>{if(f.beforeTree)f.beforeTree(data);const rule=f.treeFilter;
                if((!rule.eligible||rule.eligible(data))&&p.youtv.mentions(text,rule.markers))active.push({rule,removed:0});});
            visited=p.youtv.applyTreeFilters(data,active);
        }
        times.push(performance.now()-started);output=data;
    }
    assert.equal(output.contents.items.length,10000);times.sort((a,b)=>a-b);
    return {nodosVisitados:visited,medianaMs:Math.round(times[4]*100)/100,output};
}
const old=run(true),current=run(false);assert.deepEqual(current.output,old.output);delete old.output;delete current.output;
console.log(JSON.stringify({referencia:'v1.7.0-dev.10',anterior:old,actual:current},null,2));
