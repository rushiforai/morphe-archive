#!/usr/bin/env node
/* Which runtime functions actually run during startup (eval + the 17.7k-module __d storm) on the HBC98 VM.
 *   node tests/bench/load_calls.cjs [--features '{...}']
 * Everything not listed is only compiled at startup, never run, so making it lazy saves only its compile share.
 */
"use strict";
const fs = require("node:fs"), path = require("node:path"), {execFileSync} = require("node:child_process");
const ROOT = path.resolve(__dirname, "../..");
const option = (name, fallback) => { const i = process.argv.indexOf(name); return i > 0 ? process.argv[i + 1] : fallback; };
const features = option("--features", "{picker:true,voice:true,noDelete:true,freeNitro:true,hiddenChannels:true," +
    "platformIndicators:true,quests:true,customThemes:true,translate:true,userNotif:true,messageHighlight:true}");
const acorn = require(path.join(ROOT, "work/tools/acorn.js"));
const code = fs.readFileSync(path.join(ROOT, "patches/build/bootstrap.js"), "utf8").replace("/*__FEATURES__*/", features);
const ast = acorn.parse(code, {ecmaVersion: "latest"});
const fns = [];
(function visit(node) {
    if (!node || typeof node.type !== "string") return;
    if (/Function/.test(node.type) && node.body.type === "BlockStatement") fns.push(node);
    for (const key in node) {
        const child = node[key];
        if (Array.isArray(child)) child.forEach(visit); else if (child && typeof child.type === "string") visit(child);
    }
})(ast);
const inserts = fns.map((f, i) => [f.body.start + 1, i]).sort((a, b) => b[0] - a[0]);
let out = code;
for (const [p, i] of inserts) {
    let at = p;
    if (out.startsWith('"use strict";', at)) at += 13;
    out = out.slice(0, at) + "__H[" + i + "]++;" + out.slice(at);
}
const names = fns.map(f => (f.id && f.id.name) || code.slice(f.start, f.start + 50).replace(/\s+/g, " "));
const sizes = fns.map(f => f.end - f.start);
const script = `globalThis.__d=function(){};var __H=[];for(var i=0;i<${fns.length};i++)__H.push(0);globalThis.__H=__H;
(0,eval)(${JSON.stringify(out)});
var d=globalThis.__d,fac=function(){};for(var i=0;i<17700;i++)d(fac,i*7%18000,null);
var N=${JSON.stringify(names)},S=${JSON.stringify(sizes)},r=[],t=0;
for(var i=0;i<N.length;i++)if(__H[i]){r.push([S[i],__H[i],N[i]]);t+=S[i];}
r.sort(function(a,b){return b[1]-a[1]});
print("run at startup: "+r.length+" of ${fns.length} functions ("+t+" chars, nested counted twice)");
for(var i=0;i<25&&i<r.length;i++)print("  calls "+r[i][1]+"  size "+r[i][0]+"  "+r[i][2]);`;
const gen = path.join(ROOT, "work/bench/load_calls.gen.js");
fs.mkdirSync(path.dirname(gen), {recursive: true});
fs.writeFileSync(gen, script);
execFileSync(path.join(ROOT, "work/tools/hermesc"), ["-emit-binary", "-O", "-g0", "-w", "-out=" + gen.replace(/js$/, "hbc"), gen]);
process.stdout.write(execFileSync(path.join(ROOT, "work/hermes/hermes-vm"), [gen.replace(/js$/, "hbc")], {encoding: "utf8", timeout: 100000}));
