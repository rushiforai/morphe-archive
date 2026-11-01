#!/usr/bin/env node
/* A/B benchmark on the real HBC98 Hermes VM (see AGENTS.md, "Benchmarking optimizations").
 *
 *   node tests/bench/hermes_bench.cjs <bench.js> [--rounds 15] [--min-ms 40]
 *   node tests/bench/hermes_bench.cjs --startup [old-bootstrap.js] [--features '{...}']
 *
 * A bench file is plain JS (ES5-friendly) that calls bench(name, fn) for every variant and may define
 * setup code at the top. The first variant is the baseline. Each variant is compiled with the pinned
 * hermesc (`-O`, like Discord's bundle), calibrated to a batch of at least --min-ms (Hermes' Date.now()
 * only has 1 ms resolution), then all variants run in interleaved rounds so drift hits them equally.
 * The report is the median per-call time, the spread (min..max) and the speedup against the baseline.
 *
 * --startup measures what every Discord launch pays: (0,eval) of the compacted runtime plus the
 * module-define wrapper over the 17.7k-module __d storm, for the working tree and optionally an older copy.
 */
"use strict";
const fs = require("node:fs"), path = require("node:path"), {execFileSync} = require("node:child_process");
const ROOT = path.resolve(__dirname, "../..");
const HERMESC = path.join(ROOT, "work/tools/hermesc");
const VM = process.env.HERMES_BIN ? path.resolve(process.env.HERMES_BIN) : path.join(ROOT, "work/hermes/hermes-vm");
const OUT = path.join(ROOT, "work/bench");

function option(name, fallback) {
    const i = process.argv.indexOf(name);
    return i > 0 ? process.argv[i + 1] : fallback;
}
function need(file, hint) {
    if (!fs.existsSync(file)) { console.error(`Missing ${path.relative(ROOT, file)}: run ${hint}`); process.exit(2); }
}
need(HERMESC, "python3 scripts/build.py (or build.tools())");
need(VM, "sh scripts/hbc/hermes_vm.sh");

const HARNESS = String.raw`
var __benches = [];
function bench(name, fn) { __benches.push({name: name, fn: fn}); }
function __batch(fn, n) { var s = Date.now(); for (var i = 0; i < n; i++) fn(); return Date.now() - s; }
function __run(rounds, minMs) {
    var sink = 0;
    for (var b = 0; b < __benches.length; b++) {
        var v = __benches[b], n = 1;
        v.fn(); v.fn();
        // Capped so a near-free variant (sub-microsecond) can't double forever under the 1 ms clock.
        while (n < 1048576 && __batch(v.fn, n) < minMs) n *= 2;
        v.n = n; v.samples = [];
    }
    for (var r = 0; r < rounds; r++)
        for (var b = 0; b < __benches.length; b++) {
            var v = __benches[(b + r) % __benches.length];
            v.samples.push(__batch(v.fn, v.n) / v.n);
        }
    var out = [];
    for (var b = 0; b < __benches.length; b++) {
        out.push({name: __benches[b].name, n: __benches[b].n, samples: __benches[b].samples});
    }
    print("__BENCH__" + JSON.stringify(out));
}
`;

function runBench(source, label) {
    fs.mkdirSync(OUT, {recursive: true});
    const base = path.join(OUT, label.replace(/[^\w.-]/g, "_"));
    const rounds = +option("--rounds", 15), minMs = +option("--min-ms", 40);
    fs.writeFileSync(base + ".gen.js", HARNESS + "\n" + source + `\n;__run(${rounds}, ${minMs});\n`);
    execFileSync(HERMESC, ["-emit-binary", "-O", "-g0", "-w", "-out=" + base + ".hbc", base + ".gen.js"]);
    const stdout = execFileSync(VM, [base + ".hbc"], {encoding: "utf8", maxBuffer: 64 << 20, timeout: 600000});
    const line = stdout.split("\n").find(l => l.startsWith("__BENCH__"));
    if (!line) throw new Error("Benchmark printed no result:\n" + stdout);
    return JSON.parse(line.slice(9)).map(r => Object.assign({name: r.name}, stat(r.samples)));
}

// The p10 is the headline: CPU-bound work is only ever slowed down by a busy shared host (the sandbox shows
// a two-speed CPU, ~40 vs ~85 ms for the same eval), never sped up, so the fast tail is the code's own cost.
function stat(values) {
    const s = values.slice().sort((a, b) => a - b), at = q => s[Math.min(s.length - 1, Math.floor(q * s.length))];
    return {p10: at(0.1), med: at(0.5), min: s[0], max: s[s.length - 1]};
}
// Differences inside this band are noise on a shared sandbox CPU: never claim them as a win or a loss.
const NOISE = +option("--noise", 0.05);
function report(title, results) {
    const fmt = ms => ms >= 1 ? ms.toFixed(3) + " ms" : (ms * 1000).toFixed(2) + " us";
    const base = results[0].p10;
    console.log(`\n${title} (Hermes HBC98, ${option("--rounds", 15)} interleaved samples each)`);
    const width = Math.max(...results.map(r => r.name.length));
    for (const r of results) {
        const ratio = base / r.p10;
        console.log(`  ${r.name.padEnd(width)}  p10 ${fmt(r.p10).padStart(10)}  median ${fmt(r.med).padStart(10)}  [${fmt(r.min)} .. ${fmt(r.max)}]` +
            (r === results[0] ? "  baseline" : `  ${ratio.toFixed(2)}x ` +
                (Math.abs(ratio - 1) < NOISE ? "(within noise)" : ratio > 1 ? "faster" : "SLOWER")));
    }
}

function compact(file) {
    // Same transform scripts/build.py applies before shipping (Terser + jsonLiterals + lazySettingsUi + lazyCoreRuntime).
    const buildPy = fs.readFileSync(path.join(ROOT, "scripts/build.py"), "utf8");
    const m = buildPy.match(/script = r"""([\s\S]*?)"""/);
    if (!m) throw new Error("Could not extract compact_runtime script from scripts/build.py");
    fs.mkdirSync(OUT, {recursive: true});
    return Promise.resolve(execFileSync(process.execPath, ["-e", m[1], path.join(ROOT, "work/tools/terser.js"), file, path.join(ROOT, "work/tools/acorn.js")], {encoding: "utf8", maxBuffer: 32 << 20}));
}

async function startup() {
    // Every Discord launch evals the runtime once, then Metro defines ~17.7k modules through the __d it installed.
    // Each sample is exactly that, from fresh globals; variants alternate sample by sample in one VM.
    const features = option("--features", "{picker:true,voice:true,noDelete:true,freeNitro:true,hiddenChannels:true," +
        "platformIndicators:true,quests:true,customThemes:true,translate:true,userNotif:true,messageHighlight:true}");
    const samples = +option("--samples", 120);
    const current = path.join(ROOT, "patches/src/main/resources/venus/bootstrap.js");
    const old = process.argv[3] && !process.argv[3].startsWith("--") ? path.resolve(process.argv[3]) : null;
    const variants = old ? [["old", old], ["new", current]] : [["current", current]];
    let source = "";
    for (const [name, file] of variants)
        source += `var SRC_${name} = ${JSON.stringify((await compact(file)).replace("/*__FEATURES__*/", features))};\n`;
    source += `var V = [${variants.map(([name]) => `{name:${JSON.stringify(name)}, src:SRC_${name}, e:[], d:[]}`).join(",")}];
var ids = []; for (var i = 0; i < 17700; i++) ids.push(i * 7 % 18000);
function factory() {}
for (var s = 0; s < ${samples}; s++) for (var k = 0; k < V.length; k++) {
    var v = V[(s + k) % V.length];
    delete globalThis.__venusPatches; delete globalThis.__d;
    var t0 = Date.now(); (0, eval)(v.src); var t1 = Date.now();
    globalThis.__d = function (f, id, deps) {};
    var d = globalThis.__d; for (var i = 0; i < ids.length; i++) d(factory, ids[i], null);
    var t2 = Date.now(); v.e.push(t1 - t0); v.d.push(t2 - t1);
}
var out = []; for (var k = 0; k < V.length; k++) out.push({name: V[k].name, e: V[k].e, d: V[k].d});
print("__BENCH__" + JSON.stringify(out));
`;
    fs.mkdirSync(OUT, {recursive: true});
    const base = path.join(OUT, "startup");
    fs.writeFileSync(base + ".gen.js", source);
    execFileSync(HERMESC, ["-emit-binary", "-O", "-g0", "-w", "-out=" + base + ".hbc", base + ".gen.js"]);
    const line = execFileSync(VM, [base + ".hbc"], {encoding: "utf8", timeout: 600000}).split("\n").find(l => l.startsWith("__BENCH__"));
    const programs = JSON.parse(line.slice(9));
    process.argv.push("--rounds", String(samples));
    const rows = pick => programs.map(p => Object.assign({name: p.name}, stat(pick(p))));
    report("Runtime eval", rows(p => p.e));
    report("17.7k module defines through Venus' __d", rows(p => p.d));
    report("Total", rows(p => p.e.map((e, i) => e + p.d[i])));
}

if (process.argv[2] === "--startup") startup().catch(error => { console.error(error); process.exit(1); });
else if (process.argv[2]) {
    const file = path.resolve(process.argv[2]);
    report(path.relative(ROOT, file), runBench(fs.readFileSync(file, "utf8"), path.basename(file, ".js")));
} else {
    console.error("usage: node tests/bench/hermes_bench.cjs <bench.js> | --startup [old-bootstrap.js]");
    process.exit(2);
}
