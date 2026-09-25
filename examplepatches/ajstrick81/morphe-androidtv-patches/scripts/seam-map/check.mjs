// Seam drift checker: tests every fingerprint of one app against a decompiled APK
// (apktool output: smali/, smali_classes2/, ...) BEFORE a build, and says why each
// seam would miss. For a renamed class it proposes candidates (same method signature,
// or the fingerprint's strings).
//
// Usage: node scripts/seam-map/check.mjs <app> <apktool-dir> [--json]
// Statuses: OK · SIGNATURE_CHANGED · FLAGS_CHANGED · STRINGS_MISSING · METHOD_MISSING
//           CLASS_MISSING (+ candidates) · UNVERIFIABLE (custom matcher, no class/name)
import { existsSync, readdirSync, readFileSync, statSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = join(dirname(fileURLToPath(import.meta.url)), '..', '..');
const [app, dir] = process.argv.slice(2);
const asJson = process.argv.includes('--json');
if (!app || !dir) {
  console.error('usage: node scripts/seam-map/check.mjs <app> <apktool-dir> [--json]');
  process.exit(2);
}
const gen = JSON.parse(readFileSync(join(ROOT, 'docs/seam-map/seam-map.generated.json'), 'utf8')).apps[app];
if (!gen) {
  console.error(`unknown app "${app}"; run extract.mjs first`);
  process.exit(2);
}

// ---------------------------------------------------------------- smali index

const smaliRoots = readdirSync(dir).filter((d) => /^smali(_classes\d+)?$/.test(d)).map((d) => join(dir, d));
if (!smaliRoots.length) {
  console.error(`no smali*/ folders under ${dir}`);
  process.exit(2);
}
const classFile = (descriptor) => {
  const relPath = descriptor.replace(/^L/, '').replace(/;$/, '') + '.smali';
  for (const r of smaliRoots) if (existsSync(join(r, relPath))) return join(r, relPath);
  return null;
};

/** `.method <flags> name(params)ret` entries of one smali file. */
function methods(text) {
  const out = [];
  for (const m of text.matchAll(/^\.method\s+(.*?)\s*([\w$<>-]+)\((.*?)\)(\S+)\s*$/gm)) {
    out.push({ flags: m[1].split(/\s+/).filter(Boolean), name: m[2], params: m[3], ret: m[4], at: m.index });
  }
  return out;
}
const bodyOf = (text, method) => {
  const end = text.indexOf('.end method', method.at);
  return text.slice(method.at, end < 0 ? undefined : end);
};

const deep = process.argv.includes('--deep');
/**
 * Smali files to search for rename candidates. Default: the original class's package and
 * its parent (SDK renames usually stay inside the SDK's package tree) — cheap even on a
 * slow drive. `--deep` scans every class.
 */
function everySmali(scopeDescriptor) {
  const files = [];
  const walk = (d) => {
    if (!existsSync(d)) return;
    for (const e of readdirSync(d)) {
      const p = join(d, e);
      if (statSync(p).isDirectory()) walk(p);
      else if (e.endsWith('.smali')) files.push(p);
    }
  };
  if (deep || !scopeDescriptor) {
    smaliRoots.forEach(walk);
    return files;
  }
  const parts = scopeDescriptor.replace(/^L/, '').replace(/;$/, '').split('/');
  const pkg = parts.slice(0, -1);
  const scope = pkg.length > 2 ? pkg.slice(0, -1) : pkg; // package + parent
  for (const r of smaliRoots) walk(join(r, ...scope));
  return files;
}
const descriptorOf = (file) => {
  const r = smaliRoots.find((root) => file.startsWith(root));
  return 'L' + file.slice(r.length + 1).replace(/\\/g, '/').replace(/\.smali$/, '') + ';';
};

// ---------------------------------------------------------------- matching

const want = (fp) => ({
  params: fp.parameters ? fp.parameters.join('') : null,
  ret: fp.returnType ?? null,
  flags: fp.accessFlags ? fp.accessFlags.map((f) => f.toLowerCase()) : null,
});

function judgeMethod(fp, text, m) {
  const w = want(fp);
  const issues = [];
  if (w.ret && m.ret !== w.ret) issues.push(`returns ${m.ret} (want ${w.ret})`);
  if (w.params !== null && m.params !== w.params) issues.push(`params (${m.params}) (want (${w.params}))`);
  const sig = issues.length ? 'SIGNATURE_CHANGED' : null;
  if (w.flags && !w.flags.every((f) => m.flags.includes(f))) issues.push(`flags [${m.flags.join(' ')}] (want [${w.flags.join(' ')}])`);
  const flags = !sig && issues.length ? 'FLAGS_CHANGED' : null;
  const body = bodyOf(text, m);
  const missing = (fp.strings ?? []).filter((s) => !body.includes(`"${s}"`) && !text.includes(`"${s}"`));
  if (missing.length) issues.push(`strings missing: ${missing.map((s) => JSON.stringify(s)).join(', ')}`);
  const status = sig ?? flags ?? (missing.length ? 'STRINGS_MISSING' : 'OK');
  return { status, issues };
}

// One pass per scope over its classes: methods and const-strings, cached per scope.
const indexes = new Map();
function buildIndex(scopeDescriptor) {
  const key = deep ? '*' : scopeDescriptor ?? '*';
  if (indexes.has(key)) return indexes.get(key);
  const index = [];
  indexes.set(key, index);
  for (const file of everySmali(scopeDescriptor)) {
    const text = readFileSync(file, 'utf8');
    const consts = new Set([...text.matchAll(/const-string(?:\/jumbo)? [vp]\d+, "((?:[^"\\]|\\.)*)"/g)].map((m) => m[1]));
    index.push({ descriptor: descriptorOf(file), methods: methods(text).map(({ flags, name, params, ret }) => ({ flags, name, params, ret })), consts });
  }
  return index;
}

/**
 * Rename candidates, best first: classes holding all the fingerprint's strings and a
 * method with the same signature; the method name only has to match when it isn't
 * obfuscated-looking (short names are R8 renames, so they are not required).
 */
function candidates(fp, scope = fp.definingClass, { nameOptional = false } = {}) {
  if (!scope && !deep) return ['(no class to scope the search — rerun with --deep)'];
  const w = want(fp);
  const nameRequired = !nameOptional && fp.name && fp.name.length > 3;
  const scored = [];
  for (const c of buildIndex(scope)) {
    if (fp.strings?.length && !fp.strings.every((s) => c.consts.has(s))) continue;
    for (const m of c.methods) {
      const sigOk = (!w.ret || m.ret === w.ret) && (w.params === null || m.params === w.params);
      if (!sigOk) continue;
      const nameMatch = !fp.name || m.name === fp.name;
      if (nameRequired && !nameMatch && !fp.strings?.length) continue;
      // Compiler-generated names (Kotlin lambdas, synthetic accessors) differ mostly in their numbers.
      // Their stable part is the source name before the first `$` (e.g. `adEventListener_delegate`).
      const base = (s) => s.split('$')[0];
      const shapeMatch = !!fp.name && fp.name.includes('$') && base(m.name) === base(fp.name);
      const score = (nameMatch ? 4 : 0) + (shapeMatch ? 3 : 0) + (fp.strings?.length ? 2 : 0) + (w.flags && w.flags.every((f) => m.flags.includes(f)) ? 1 : 0);
      scored.push({ score, text: `${c.descriptor}->${m.name}(${m.params})${m.ret}` });
    }
  }
  scored.sort((a, b) => b.score - a.score);
  const shown = scored.slice(0, 5).map((s) => s.text);
  if (scored.length > 5) shown.push(`… ${scored.length - 5} more with the same signature`);
  return shown;
}

const results = [];
for (const fp of gen.fingerprints) {
  const r = { fingerprint: fp.id, usedBy: fp.usedBy, target: `${fp.definingClass ?? '*'}->${fp.name ?? '*'}` };
  if (!fp.definingClass) {
    if (!fp.name && !fp.strings?.length) {
      results.push({ ...r, status: 'UNVERIFIABLE', issues: ['custom matcher only; verify with a patch run'] });
      continue;
    }
    const c = candidates(fp);
    results.push({ ...r, status: c.length ? 'OK' : 'METHOD_MISSING', issues: c.length ? [`found by name/strings: ${c[0]}`] : ['no class has a matching method'], candidates: c.slice(1) });
    continue;
  }
  const file = classFile(fp.definingClass);
  if (!file) {
    results.push({ ...r, status: 'CLASS_MISSING', issues: ['class not found (renamed/obfuscated or removed)'], candidates: candidates(fp) });
    continue;
  }
  const text = readFileSync(file, 'utf8');
  const ms = methods(text).filter((m) => !fp.name || m.name === fp.name);
  if (!ms.length) {
    results.push({ ...r, status: 'METHOD_MISSING', issues: [`no method ${fp.name} in class`], candidates: candidates(fp, fp.definingClass, { nameOptional: true }) });
    continue;
  }
  const judged = ms.map((m) => judgeMethod(fp, text, m));
  const best = judged.find((j) => j.status === 'OK') ?? judged[0];
  results.push({ ...r, status: best.status, issues: best.issues, note: fp.hasCustomMatcher ? 'also has a custom matcher (not evaluated here)' : undefined });
}

if (asJson) {
  console.log(JSON.stringify({ app, dir, results }, null, 2));
} else {
  const counts = results.reduce((a, x) => ((a[x.status] = (a[x.status] ?? 0) + 1), a), {});
  console.log(`${app} vs ${dir}  (targets: ${gen.targets.join(', ')})`);
  for (const x of results) {
    console.log(`  ${x.status.padEnd(18)} ${x.fingerprint}  [${x.usedBy.join(', ') || 'unused'}]`);
    for (const i of x.issues ?? []) console.log(`      ${i}`);
    if (x.note) console.log(`      note: ${x.note}`);
    for (const c of x.candidates ?? []) console.log(`      candidate: ${c}`);
  }
  console.log(`SUMMARY ${Object.entries(counts).map(([k, v]) => `${k}=${v}`).join(' ')}`);
  process.exitCode = results.some((x) => !['OK', 'UNVERIFIABLE'].includes(x.status)) ? 1 : 0;
}
