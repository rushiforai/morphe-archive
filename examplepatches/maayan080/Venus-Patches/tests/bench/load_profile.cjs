#!/usr/bin/env node
/* Where the runtime's load time goes on the HBC98 VM, per top-level statement of the compacted runtime.
 *   node tests/bench/load_profile.cjs [--features '{...}'] [--runs 40]
 * Inserts a timestamp after every top-level statement (function declarations are hoisted and cost nothing here),
 * evals the instrumented runtime --runs times, and prints the statements that took the most time. Compile time
 * (parse + bytecode for the whole runtime, ~11 ms) is reported separately: it isn't attributable to a statement.
 */
"use strict";
const fs = require("node:fs"), path = require("node:path"), {execFileSync} = require("node:child_process");
const ROOT = path.resolve(__dirname, "../..");
const option = (name, fallback) => { const i = process.argv.indexOf(name); return i > 0 ? process.argv[i + 1] : fallback; };
const features = option("--features", "{picker:true,voice:true,noDelete:true,freeNitro:true,hiddenChannels:true," +
    "platformIndicators:true,quests:true,customThemes:true,translate:true,userNotif:true,messageHighlight:true}");
const runs = +option("--runs", 40);
const acorn = require(path.join(ROOT, "work/tools/acorn.js"));
const code = fs.readFileSync(path.join(ROOT, "patches/build/bootstrap.js"), "utf8").replace("/*__FEATURES__*/", features);
const ast = acorn.parse(code, {ecmaVersion: "latest"});
const body = ast.body[0].expression.callee.body.body;
const labels = [], inserts = [];
body.forEach((st, i) => {
    if (st.type === "FunctionDeclaration") return;
    labels.push(code.slice(st.start, Math.min(st.end, st.start + 100)).replace(/\s+/g, " "));
    inserts.push([st.end, ";__M[" + (labels.length - 1) + "]+=__now()-__t;__t=__now();"]);
});
inserts.sort((a, b) => b[0] - a[0]);
let out = code;
for (const [at, text] of inserts) out = out.slice(0, at) + text + out.slice(at);
const script = `var __M=[];for(var q=0;q<${labels.length};q++)__M.push(0);var __now=Date.now,__t;
var SRC=${JSON.stringify(out)},PLAIN=${JSON.stringify(code)},WRAP="(function(){"+PLAIN+"\\n})";
var c0=Date.now();for(var i=0;i<${runs};i++)(0,eval)(WRAP);var compile=(Date.now()-c0)/${runs};
var f0=Date.now();for(var i=0;i<${runs};i++){delete globalThis.__venusPatches;delete globalThis.__d;(0,eval)(PLAIN);}var full=(Date.now()-f0)/${runs};
for(var i=0;i<${runs};i++){delete globalThis.__venusPatches;delete globalThis.__d;__t=__now();(0,eval)(SRC);}
var L=${JSON.stringify(labels)},idx=[];for(var k=0;k<L.length;k++)idx.push(k);idx.sort(function(a,b){return __M[b]-__M[a]});
var tot=0;for(var k=0;k<L.length;k++)tot+=__M[k];
print("full eval "+full.toFixed(2)+" ms = compile ~"+compile.toFixed(2)+" ms + run; statements measured "+(tot/${runs}).toFixed(2)+" ms over "+L.length);
for(var j=0;j<25&&j<L.length;j++){var k=idx[j];if(!__M[k])break;print("  "+(__M[k]/${runs}).toFixed(3)+" ms  "+L[k]);}`;
const gen = path.join(ROOT, "work/bench/load_profile.gen.js");
fs.mkdirSync(path.dirname(gen), {recursive: true});
fs.writeFileSync(gen, script);
execFileSync(path.join(ROOT, "work/tools/hermesc"), ["-emit-binary", "-O", "-g0", "-w", "-out=" + gen.replace(/js$/, "hbc"), gen]);
process.stdout.write(execFileSync(path.join(ROOT, "work/hermes/hermes-vm"), [gen.replace(/js$/, "hbc")], {encoding: "utf8", timeout: 280000}));
