// Compara el trabajo por tarea; no mide los FPS ni simula el coste del CSSOM del TV.
const fs = require('node:fs');
const vm = require('node:vm');
const {execFileSync} = require('node:child_process');
const {performance} = require('node:perf_hooks');
const baseline = process.argv[2] || 'v1.7.0-dev.8';
if (!/^[A-Za-z0-9._/-]+$/.test(baseline)) throw Error('Referencia no válida');
const file = 'extensions/extension/src/main/js/branding.js';
function measure(ref) {
    const source = ref ? execFileSync('git',['show',ref+':'+file],{encoding:'utf8'}) : fs.readFileSync(file,'utf8');
    let examined=0, writes=0;
    const queue=[];
    const rules=Array.from({length:10000},(_,i)=>({selectorText:'.rule'+i,style:{
        0:'color',length:1,get cssText(){examined++;return 'color: rgb(255, 0, 0)';},
        getPropertyValue:()=> 'rgb(255, 0, 0)'
    }}));
    const p=vm.createContext({performance,__youtvBranding:'FaroTV',
        youtv:{report(){}},document:{styleSheets:[{cssRules:rules}],adoptedStyleSheets:[]},
        CSSStyleSheet:class{replaceSync(){writes++;}},
        setTimeout:fn=>queue.push(fn),setInterval:()=>0});
    vm.runInContext('window=this;',p);
    vm.runInContext(source,p);
    let maximum=examined, tasks=examined?1:0;
    while(queue.length){const before=examined;queue.shift()();maximum=Math.max(maximum,examined-before);tasks++;}
    return {reglasExaminadas:examined,tareasDeRecorrido:tasks,maximoReglasPorTarea:maximum,escriturasCSS:writes};
}
console.log(JSON.stringify({referencia:baseline,anterior:measure(baseline),actual:measure(null)},null,2));
