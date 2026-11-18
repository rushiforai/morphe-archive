// Writes work/bench/runtime_eval.js: (0,eval) of two already-compacted runtimes (what HbcPrelude ships), A/B.
//   node tests/bench/runtime_eval.cjs <old patches/build/bootstrap.js> <new patches/build/bootstrap.js>
//   node tests/bench/hermes_bench.cjs work/bench/runtime_eval.js
const fs = require("node:fs"), path = require("node:path");
const features = "{picker:true,voice:true,noDelete:true,freeNitro:true,hiddenChannels:true,platformIndicators:true,quests:true,customThemes:true}";
const [oldFile, newFile] = process.argv.slice(2);
const load = file => fs.readFileSync(file, "utf8").replace("/*__FEATURES__*/", features);
const out = path.resolve(__dirname, "../../work/bench/runtime_eval.js");
fs.mkdirSync(path.dirname(out), {recursive: true});
fs.writeFileSync(out, `var OLD = ${JSON.stringify(load(oldFile))};\nvar NEW = ${JSON.stringify(load(newFile))};
function fresh() { delete globalThis.__venusPatches; delete globalThis.__d; }
bench("old runtime eval", function () { fresh(); (0, eval)(OLD); });
bench("new runtime eval", function () { fresh(); (0, eval)(NEW); });
`);
console.log(path.relative(process.cwd(), out));
