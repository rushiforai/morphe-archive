#!/usr/bin/env python3
"""Build a standard JVM+DEX Morphe bundle from pinned public release toolchains."""
import hashlib
import json
import sys
from datetime import datetime, timezone
import os
from pathlib import Path
import subprocess
import urllib.request
import zipfile
import tarfile

ROOT = Path(__file__).resolve().parents[1]
TOOLS = ROOT / "work" / "tools"
BUILD = ROOT / "patches" / "build"
PROPERTIES = dict(line.split("=", 1) for line in (ROOT / "gradle.properties").read_text().splitlines() if "=" in line)
PROPERTIES = {key.strip(): value.strip() for key, value in PROPERTIES.items()}
VERSION = PROPERTIES["version"]
RELEASE_TAG = PROPERTIES.get("releaseTag", f"v{VERSION}")
ASSET_NAME = PROPERTIES.get("releaseAsset", f"patches-{VERSION}.mpp")
DEPENDENCIES = {
    "terser.tgz": (
        "https://registry.npmjs.org/terser/-/terser-5.44.0.tgz",
        "86b954e059e70d536a7918fdf7f2f74292e81e03f30a9ab4bd281484e7c9edfc"),
    "android-platform.zip": (
        "https://dl.google.com/android/repository/platform-35_r02.zip",
        "0988cacad01b38a18a47bac14a0695f246bc76c1b06c0eeb8eb0dc825ab0c8e0"),
    "gson.jar": (
        "https://repo.maven.apache.org/maven2/com/google/code/gson/gson/2.14.0/gson-2.14.0.jar",
        "2cbd119bf1961c28788310963dc80ba65f58cdeec1dd139c8bdb1240faa2c36f"),
    "morphe.jar": (
        "https://github.com/MorpheApp/morphe-desktop/releases/download/v1.18.0/morphe-desktop-1.18.0-all.jar",
        "36e20d7a18f655fb5829ae50aadd61217e2208536c0741df5f7799300f758f56"),
    "kotlin24.zip": (
        "https://github.com/JetBrains/kotlin/releases/download/v2.4.0/kotlin-compiler-2.4.0.zip",
        "ba1b9e6eb6ddc3275079224f2e9ea4a2b02eef7d59ce2d38404f04b22613c20a"),
    "r8.jar": (
        "https://storage.googleapis.com/r8-releases/raw/8.12.22/r8.jar",
        "f18a6d1d7b37b7c9c8fbbcb5fd65b62f18bf7ce8f5be8e623b72648e282d964e"),
    "acorn.tgz": (
        "https://registry.npmjs.org/acorn/-/acorn-8.15.0.tgz",
        "e46eae89bd9761f16d1d25563b837b55b4b78f3ece06ee0b9789cb2644f523b3"),
    "hermes-compiler.tgz": (
        "https://registry.npmjs.org/hermes-compiler/-/hermes-compiler-250829098.0.19.tgz",
        "839af099f0926b5ebbd738ba54764a3f40e35dfc3aac91babf56f8eb7c69280e"),
}


def run(*args, cwd=ROOT, env=None):
    subprocess.run([str(a) for a in args], cwd=cwd, check=True,
                   env={**os.environ, "JAVA_OPTS": "-Xmx384m", **(env or {})})


def digest(path):
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def tools():
    TOOLS.mkdir(parents=True, exist_ok=True)
    for name, (url, sha) in DEPENDENCIES.items():
        path = TOOLS / name
        if not path.exists():
            print(f"Downloading {name}", flush=True)
            temporary = path.with_suffix(".download")
            try:
                urllib.request.urlretrieve(url, temporary)
                if digest(temporary) != sha:
                    raise SystemExit(f"Checksum mismatch for downloaded {name}")
                temporary.replace(path)
            finally:
                temporary.unlink(missing_ok=True)
        if digest(path) != sha:
            raise SystemExit(f"Checksum mismatch: {path}; remove it and retry")
    # Read one known tool file; never extract arbitrary npm archive paths.
    with tarfile.open(TOOLS / "terser.tgz") as archive:
        (TOOLS / "terser.js").write_bytes(archive.extractfile("package/dist/bundle.min.js").read())
    with tarfile.open(TOOLS / "acorn.tgz") as archive:
        (TOOLS / "acorn.js").write_bytes(archive.extractfile("package/dist/acorn.js").read())
    with tarfile.open(TOOLS / "hermes-compiler.tgz") as archive:
        (TOOLS / "hermesc").write_bytes(archive.extractfile("package/hermesc/linux64-bin/hermesc").read())
    (TOOLS / "hermesc").chmod(0o755)
    # Always extract the pinned compiler, not an arbitrary previously installed version.
    with zipfile.ZipFile(TOOLS / "kotlin24.zip") as compiler:
        for entry in compiler.infolist():
            target = (TOOLS / entry.filename).resolve()
            if not target.is_relative_to(TOOLS.resolve()):
                raise SystemExit("Unsafe compiler archive path")
        compiler.extractall(TOOLS)
    (TOOLS / "kotlinc/bin/kotlinc").chmod(0o755)
    with zipfile.ZipFile(TOOLS / "android-platform.zip") as platform:
        (TOOLS / "android.jar").write_bytes(platform.read("android-35/android.jar"))


def compact_runtime():
    # Parser/printer only for the eager header; the two lazily eval'd chunks are re-printed by compactLazyChunks.
    script = r"""
const fs = require('node:fs'), vm = require('node:vm'), context = {};
vm.runInNewContext(fs.readFileSync(process.argv[1], 'utf8'), context);
const source = fs.readFileSync(process.argv[2], 'utf8').replace('/*__FEATURES__*/', '__VENUS_FEATURES__');
context.Terser.minify(source, {compress:false, mangle:false,
    format:{comments:false, ascii_only:true}}).then(result => compactLazyChunks(lazyCoreRuntime(lazySettingsUi(jsonLiterals(result.code))))).then(code => {
    process.stdout.write(code.replace('__VENUS_FEATURES__', '/*__FEATURES__*/'));
});
// Every Discord launch pays for the injected runtime's text before any of it runs: the prelude rebuilds it from
// ~300k reused bundle strings (HbcPrelude), and eval scans it. Almost all of it is the two lazily evaluated chunks
// ($core and the settings UI), each one (0,eval)'d function expression that receives everything it needs as
// parameters. So inside them: rename parameters and locals to short names (no chunk reads a function's .name or
// uses eval/with), and print strings with single quotes so the JSON-escaped literal carries ~3x fewer
// backslashes. Property names, the eager header and behavior stay the same. 690 -> 501 KB, and on the HBC98 VM
// the core compiles 1.08x and the settings UI 1.10x faster.
async function compactLazyChunks(code) {
    const found = [];
    for (let i = 0; ;) {
        i = code.indexOf('"', i);
        if (i < 0) break;
        let k = i + 1;
        while (code[k] !== '"') k += code[k] === '\\' ? 2 : 1;
        if (k - i > 50000) found.push([i, k + 1]);
        i = k + 1;
    }
    if (found.length !== 2) throw new Error('expected the core and settings UI chunks, found ' + found.length);
    for (const [start, end] of found.reverse()) {
        const chunk = lazyGroups(JSON.parse(code.slice(start, end)), 400, 60000);
        const result = await context.Terser.minify(chunk, {compress:false, mangle:{toplevel:false},
            format:{comments:false, ascii_only:true, quote_style:1}});
        if (/[^.\w$](eval|Function)\s*\(|\bwith\s*\(/.test(chunk)) throw new Error('lazy chunk uses eval/with: renaming is unsafe');
        const literal = JSON.stringify(result.code).replace(/[\u007f-\uffff]/g, c => '\\u' + c.charCodeAt(0).toString(16).padStart(4, '0'));
        code = code.slice(0, start) + literal + code.slice(end);
    }
    return code;
}
// Hermes compiles a function body on its first call, and the first call of $core (when the first hooked Discord module
// loads) builds a closure for every one of its ~570 top-level functions. Most of them are only ever reached from one
// feature: a function and the helpers that nothing else calls form a group. Each group moves into one builder function,
// and the group's entry point becomes a small stub with the same name and the same .length that builds the group on
// its first call and forwards to it. Every feature is still in the chunk and works the same; the cost of a group is
// paid only when its feature first runs. Groups are 400-60k characters; an entry point that's constructed with new is
// left alone. HBC98 VM, real 350.8 bundle: boot plus loading every hooked module 1.04x faster (136 -> 131 ms p10, 80
// interleaved runs); the plain cold boot is unchanged (within noise).
function lazyGroups(code, min, max) {
    const acorn = require(process.argv[3]);
    if (code.includes('$lz')) throw new Error('lazy chunk already uses the $lz prefix');
    const body = acorn.parse(code, {ecmaVersion: 'latest'}).body[0].expression.body.body;
    const refs = node => {
        const r = new Set();
        (function walk(n, parent, key) {
            if (!n || typeof n !== 'object') return;
            if (Array.isArray(n)) { for (const x of n) walk(x, parent, key); return; }
            if (n.type === 'Identifier') {
                if (parent && parent.type === 'MemberExpression' && key === 'property' && !parent.computed) return;
                if (parent && /^(Property|MethodDefinition|PropertyDefinition)$/.test(parent.type) && key === 'key' && !parent.computed && !parent.shorthand) return;
                r.add(n.name);
                return;
            }
            for (const k in n) if (k !== 'type' && k !== 'start' && k !== 'end') walk(n[k], n, k);
        })(node);
        return r;
    };
    const items = body.map((s, i) => {
        const names = [];
        if (s.type === 'FunctionDeclaration' || s.type === 'ClassDeclaration') names.push(s.id.name);
        else if (s.type === 'VariableDeclaration') for (const d of s.declarations) for (const n of refs(d.id)) names.push(n);
        return {i, s, names, refs: refs(s), len: s.end - s.start, fn: s.type === 'FunctionDeclaration'};
    });
    const owner = new Map();
    for (const it of items) for (const n of it.names) owner.set(n, it.i);
    const users = items.map(() => new Set());
    for (const it of items) for (const r of it.refs) { const j = owner.get(r); if (j !== undefined && j !== it.i) users[j].add(it.i); }
    // A function joins a group when every top-level user of it is already in the group (names are matched
    // conservatively: a shadowed name still counts as a use, which only keeps a function out).
    const group = root => {
        const set = new Set([root]);
        for (let grew = true; grew;) {
            grew = false;
            for (const it of items) if (it.fn && !set.has(it.i) && users[it.i].size && [...users[it.i]].every(u => set.has(u))) { set.add(it.i); grew = true; }
        }
        return set;
    };
    const usesThisOrArguments = fnNode => {
        let hit = false;
        (function walk(n) {
            if (!n || typeof n !== 'object' || hit) return;
            if (Array.isArray(n)) { for (const x of n) walk(x); return; }
            if (n !== fnNode && (n.type === 'FunctionDeclaration' || n.type === 'FunctionExpression')) return;
            if (n.type === 'ThisExpression' || n.type === 'MetaProperty' || (n.type === 'Identifier' && n.name === 'arguments')) { hit = true; return; }
            for (const k in n) if (k !== 'type' && k !== 'start' && k !== 'end') walk(n[k]);
        })(fnNode);
        return hit;
    };
    const candidates = items.filter(it => it.fn).map(it => {
        const set = group(it.i);
        let len = 0;
        for (const i of set) len += items[i].len;
        return {root: it.s, set, len};
    }).filter(c => c.set.size > 1 && c.len >= min && c.len <= max).sort((a, b) => b.len - a.len);
    const taken = new Set(), edits = [];
    let n = 0;
    for (const c of candidates) {
        if ([...c.set].some(i => taken.has(i))) continue;
        const name = c.root.id.name;
        if (new RegExp('\\bnew\\s+' + name.replace(/\$/g, '\\$') + '\\b').test(code)) continue;
        for (const i of c.set) taken.add(i);
        const build = '$lzG' + n, cache = '$lzg' + n++;
        const simple = c.root.params.every(p => p.type === 'Identifier') && !usesThisOrArguments(c.root);
        // Same .length as the original: parameters before the first default or rest.
        let length = 0;
        while (length < c.root.params.length && c.root.params[length].type === 'Identifier') length++;
        const params = simple ? c.root.params.map(p => p.name) : Array.from({length}, (_, i) => '$lzp' + i);
        const call = simple ? '(' + params.join(',') + ')' : '.apply(this,arguments)';
        const members = [...c.set].filter(i => items[i].s !== c.root).sort((a, b) => a - b).map(i => code.slice(items[i].s.start, items[i].s.end));
        // Anonymous, so the entry point's own name inside its body still means the stub, the same function as before.
        const impl = (c.root.async ? 'async ' : '') + 'function' + (c.root.generator ? '*' : '') + code.slice(c.root.id.end, c.root.end);
        edits.push([c.root.start, c.root.end, 'function ' + name + '(' + params.join(',') + '){return(' + cache + '||(' + cache + '=' + build + '()))' + call + '}' +
            'var ' + cache + ';function ' + build + '(){' + members.join('\n') + '\nreturn ' + impl + '}']);
        for (const i of c.set) if (items[i].s !== c.root) edits.push([items[i].s.start, items[i].s.end, '']);
    }
    edits.sort((a, b) => b[0] - a[0]);
    for (const [s, e, r] of edits) code = code.slice(0, s) + r + code.slice(e);
    acorn.parse(code, {ecmaVersion: 'latest'});
    return code;
}
// At startup (load_calls.cjs), only 5 functions run: the outer IIFE, selectModules, decorateDefine,
// defineValue, and the __d wrapper for each of the ~17.7k Metro modules. No target module factory executes
// until React Native's initializer (Module 120) runs. Wrap all feature hooks, stores, and helpers into an
// ASCII string literal ($core) evaluated once on the first target module activation (or __venusPatches call),
// leaving only the ~6 KB module-selection and __d-decoration header to compile during startup eval.
function lazyCoreRuntime(code) {
    const acorn = require(process.argv[3]);
    const ast = acorn.parse(code, {ecmaVersion: 'latest'});
    const iife = ast.body[0].expression.callee.body.body;

    function stmtDecls(stmt) {
        const out = [];
        if (stmt.type === 'FunctionDeclaration' && stmt.id) out.push(stmt.id.name);
        else if (stmt.type === 'VariableDeclaration') {
            for (const d of stmt.declarations) if (d.id.type === 'Identifier') out.push(d.id.name);
        }
        return out;
    }

    const items = iife.map((stmt, idx) => ({
        idx,
        stmt,
        decls: stmtDecls(stmt),
        src: code.slice(stmt.start, stmt.end),
    }));
    const declToIdx = new Map();
    for (const it of items) for (const d of it.decls) declToIdx.set(d, it.idx);

    const setIdx = declToIdx.get('settings');
    const stIdx = declToIdx.get('status');
    const ddIdx = declToIdx.get('decorateDefine');
    const hdIdx = declToIdx.get('holdDefine');
    const dvIdx = declToIdx.get('defineValue');
    const exIdx = declToIdx.get('existing');

    const eagerSet = new Set();
    for (let i = 0; i <= setIdx; i++) eagerSet.add(i);
    eagerSet.add(stIdx);
    for (let i = ddIdx; i <= exIdx + 2; i++) eagerSet.add(i);

    const stage2Items = items.filter(it => !eagerSet.has(it.idx));
    let stage2Code = stage2Items.map(it => it.src).join('\n') +
        '\nreturn{listImport:listImport,lengthConstants:lengthConstants,multiAccountConstants:multiAccountConstants,activateModule:activateModule,setSetting:setSetting,formatSize:formatSize,getSize:getSize};';
    let nrStr = null;
    const nrAst = acorn.parse('(function(){' + stage2Code + '})', {ecmaVersion: 'latest'});
    const nrBody = nrAst.body[0].expression.body.body;
    const nrAssign = nrBody[nrBody.length - 2];
    let nrLit = null;
    (function findLit(n) {
        if (!n || typeof n !== 'object') return;
        if (n.type === 'Literal' && typeof n.value === 'string' && n.value.length > 10000) { nrLit = n; return; }
        for (const k of Object.keys(n)) if (k !== 'type' && k !== 'start' && k !== 'end') {
            const v = n[k];
            if (Array.isArray(v)) v.forEach(findLit);
            else findLit(v);
        }
    })(nrAssign);
    if (nrLit) {
        const off = '(function(){'.length;
        nrStr = stage2Code.slice(nrLit.start - off, nrLit.end - off);
        stage2Code = stage2Code.slice(0, nrLit.start - off) + '$nrStr' + stage2Code.slice(nrLit.end - off);
    }
    const stage2Fn = '(function(global,features,revision,DISCORD_VERSION,settings,status' + (nrStr ? ',$nrStr' : '') + '){' + stage2Code + '})';
    const stage2Str = JSON.stringify(stage2Fn).replace(/[\u007f-\uffff]/g, c => '\\u' + c.charCodeAt(0).toString(16).padStart(4, '0'));

    let eagerHeader = '';
    for (let i = 0; i <= setIdx; i++) eagerHeader += items[i].src;
    eagerHeader += items[stIdx].src;
    eagerHeader += 'let pastelHash,$c;function $core(){return $c||($c=(0,eval)(' + stage2Str + ')(global,features,revision,DISCORD_VERSION,settings,status' + (nrStr ? ',' + nrStr : '') + '));}';

    const ddSrc = items[ddIdx].src
        .replace(/listImport\(/g, '$core().listImport(')
        .replace(/lengthConstants\(/g, '$core().lengthConstants(')
        .replace(/multiAccountConstants\(/g, '$core().multiAccountConstants(')
        .replace(/activateModule\(/g, '$core().activateModule(');

    let eagerFooter = ddSrc + items[hdIdx].src + items[dvIdx].src + items[exIdx].src + items[exIdx + 1].src;
    eagerFooter += 'global.__venusPatches=Object.freeze({revision:revision,settings:settings,features:features,status:status,setSetting:function(k,v){return $core().setSetting(k,v)},formatSize:function(b){return $core().formatSize(b)},getSize:function(u){return $core().getSize(u)}});';

    return '(function(global){' + eagerHeader + eagerFooter + '})(globalThis);';
}
// Hermes's (0, eval) eagerly compiles every FunctionDeclaration and closure inside the runtime at startup,
// even though load_calls.cjs shows only 5 functions run at startup. The Venus Settings pages, live previews,
// and preview style/sample tables (~160 KB, 155 top-level statements) are only reachable after nativeRegistry
// (Module 14409) runs. Wrap them in an ASCII string literal and evaluate once on first nativeRegistry call,
// avoiding parsing, bytecode compilation, and closure allocation for all settings UI components during cold boot.
function lazySettingsUi(code) {
    const acorn = require(process.argv[3]);
    const ast = acorn.parse(code, {ecmaVersion: 'latest'});
    const iife = ast.body[0].expression.callee.body.body;

    function stmtDecls(stmt) {
        const out = [];
        if (stmt.type === 'FunctionDeclaration' && stmt.id) out.push(stmt.id.name);
        else if (stmt.type === 'VariableDeclaration') {
            for (const d of stmt.declarations) if (d.id.type === 'Identifier') out.push(d.id.name);
        }
        return out;
    }

    function stmtRefs(node) {
        const refs = new Set();
        function walk(n, parent, prop) {
            if (!n || typeof n !== 'object') return;
            if (Array.isArray(n)) { for (const x of n) walk(x, parent, prop); return; }
            if (n.type === 'Identifier') {
                if (parent && parent.type === 'MemberExpression' && prop === 'property' && !parent.computed) return;
                if (parent && parent.type === 'Property' && prop === 'key' && !parent.computed) return;
                refs.add(n.name);
                return;
            }
            for (const k of Object.keys(n)) {
                if (k === 'type' || k === 'start' || k === 'end') continue;
                walk(n[k], n, k);
            }
        }
        walk(node, null, null);
        return refs;
    }

    const items = iife.map((stmt, idx) => ({
        idx,
        stmt,
        decls: stmtDecls(stmt),
        refs: stmtRefs(stmt),
        src: code.slice(stmt.start, stmt.end),
    }));

    const declToIdx = new Map();
    for (const it of items) for (const d of it.decls) declToIdx.set(d, it.idx);

    const nrIdx = declToIdx.get('nativeRegistry');
    const nrStmt = items[nrIdx].stmt;
    const keepMain = new Set(['section', 'PopIn', 'popIn', 'DISCORD_VERSION', 'DEFAULT_SETTINGS']);
    const pageRoots = new Set();
    for (const r of stmtRefs(nrStmt.body)) {
        if (declToIdx.has(r)) {
            const idx = declToIdx.get(r);
            if (idx === nrIdx || items[idx].decls.some(d => keepMain.has(d))) continue;
            let usedOutside = false;
            for (let j = 0; j < items.length; j++) {
                if (j === idx || j === nrIdx) continue;
                for (const d of items[idx].decls) {
                    if (items[j].refs.has(d)) usedOutside = true;
                }
            }
            if (!usedOutside) pageRoots.add(idx);
        }
    }

    const pageSet = new Set(pageRoots);
    let changed = true;
    while (changed) {
        changed = false;
        for (let i = 0; i < items.length; i++) {
            if (pageSet.has(i) || i === nrIdx || items[i].decls.length === 0) continue;
            if (items[i].decls.some(d => keepMain.has(d))) continue;
            let usedOutside = false, usedInside = false;
            for (let j = 0; j < items.length; j++) {
                if (j === i) continue;
                for (const d of items[i].decls) {
                    if (items[j].refs.has(d)) {
                        if (pageSet.has(j)) usedInside = true;
                        else usedOutside = true;
                    }
                }
            }
            if (usedInside && !usedOutside) {
                pageSet.add(i);
                changed = true;
            }
        }
    }

    const pageDecls = new Set();
    for (const idx of pageSet) for (const d of items[idx].decls) pageDecls.add(d);

    const mainVars = new Map();
    for (const it of items) {
        if (pageSet.has(it.idx)) continue;
        const s = it.stmt;
        if (s.type === 'FunctionDeclaration' && s.id) mainVars.set(s.id.name, 'function');
        else if (s.type === 'VariableDeclaration') {
            for (const d of s.declarations) if (d.id.type === 'Identifier') mainVars.set(d.id.name, s.kind);
        }
    }
    mainVars.set('global', 'param');

    const neededMain = new Set();
    for (const idx of pageSet) {
        for (const r of items[idx].refs) {
            if (!pageDecls.has(r) && mainVars.has(r)) neededMain.add(r);
        }
    }
    for (const r of items[nrIdx].refs) {
        if (!pageDecls.has(r) && mainVars.has(r) && r !== 'nativeRegistry') neededMain.add(r);
    }

    const letVars = [...neededMain].filter(v => mainVars.get(v) === 'let');
    const constVars = [...neededMain].filter(v => mainVars.get(v) !== 'let');
    const letSet = new Set(letVars);

    function rewriteSubSource(subSrc) {
        const subAst = acorn.parse(subSrc, {ecmaVersion: 'latest'});
        const edits = [];
        function walk(n, scope, parent, prop) {
            if (!n || typeof n !== 'object') return;
            if (Array.isArray(n)) { for (const x of n) walk(x, scope, parent, prop); return; }
            let nextScope = scope;
            if (n.type === 'FunctionDeclaration' || n.type === 'FunctionExpression' || n.type === 'ArrowFunctionExpression') {
                nextScope = new Set(scope);
                if (n.id && n.id.type === 'Identifier') nextScope.add(n.id.name);
                for (const p of n.params || []) {
                    if (p.type === 'Identifier') nextScope.add(p.name);
                    else for (const r of stmtRefs(p)) nextScope.add(r);
                }
                if (n.body && n.body.type === 'BlockStatement') {
                    for (const st of n.body.body) for (const d of stmtDecls(st)) nextScope.add(d);
                }
            } else if (n.type === 'BlockStatement') {
                nextScope = new Set(scope);
                for (const st of n.body) for (const d of stmtDecls(st)) nextScope.add(d);
            } else if (n.type === 'CatchClause' && n.param && n.param.type === 'Identifier') {
                nextScope = new Set(scope);
                nextScope.add(n.param.name);
            }
            if (n.type === 'Identifier') {
                if (parent && parent.type === 'MemberExpression' && prop === 'property' && !parent.computed) return;
                if (parent && parent.type === 'Property' && prop === 'key' && !parent.computed) {
                    if (parent.shorthand && letSet.has(n.name) && !scope.has(n.name)) {
                        edits.push([n.start, n.end, n.name + ':$live.' + n.name]);
                    }
                    return;
                }
                if (parent && (parent.type === 'FunctionDeclaration' || parent.type === 'FunctionExpression') && prop === 'id') return;
                if (parent && parent.type === 'VariableDeclarator' && prop === 'id') return;
                if (letSet.has(n.name) && !scope.has(n.name)) {
                    edits.push([n.start, n.end, '$live.' + n.name]);
                }
                return;
            }
            for (const k of Object.keys(n)) {
                if (k === 'type' || k === 'start' || k === 'end') continue;
                walk(n[k], nextScope, n, k);
            }
        }
        walk(subAst, new Set(), null, null);
        edits.sort((a, b) => b[0] - a[0]);
        let res = subSrc;
        for (const [s, e, rep] of edits) res = res.slice(0, s) + rep + res.slice(e);
        return res;
    }

    const rawPageCode = items.filter(it => pageSet.has(it.idx)).map(it => it.src).join('\n');
    const nrBodySrc = code.slice(nrStmt.body.start + 1, nrStmt.body.end - 1);
    const lazyFnExpr = rewriteSubSource('(function($live,' + constVars.join(',') + '){' + rawPageCode + '\nreturn function(registry){' + nrBodySrc + '};})');
    const lazyFnString = JSON.stringify(lazyFnExpr).replace(/[\u007f-\uffff]/g, c => '\\u' + c.charCodeAt(0).toString(16).padStart(4, '0'));
    const liveObjCode = '{' + letVars.map(v => 'get ' + v + '(){return ' + v + ';},set ' + v + '(_v){' + v + '=_v;}').join(',') + '}';
    const newNrCode = 'let $nr;function nativeRegistry(registry){if(!$nr)$nr=(0,eval)(' + lazyFnString + ')(' + liveObjCode + ',' + constVars.join(',') + ');return $nr(registry);}';

    const repList = [];
    for (const idx of pageSet) repList.push([items[idx].stmt.start, items[idx].stmt.end, '']);
    repList.push([nrStmt.start, nrStmt.end, 'let $nr;function nativeRegistry(registry){return $nr(registry);}']);
    repList.push([items[items.length - 1].stmt.end, items[items.length - 1].stmt.end, ';$nr=function(registry){if($nr.$)return $nr.$(registry);return($nr.$=(0,eval)(' + lazyFnString + ')(' + liveObjCode + ',' + constVars.join(',') + '))(registry);};']);
    repList.sort((a, b) => b[0] - a[0]);
    let out = code;
    for (const [s, e, r] of repList) out = out.slice(0, s) + r + out.slice(e);
    return out;
}
// Hermes compiles an object/array literal into bytecode that builds it one property at a time, and
// JSON.parse of a string builds the same value natively, much faster. Rewrite the runtime's large constant
// tables (theme aliases, styles, icons, languages) to JSON.parse, only where the literal is pure JSON data,
// so the value is identical: same keys, order, types, a fresh mutable object. Measured on the HBC98 VM.
function jsonLiterals(code) {
    const acorn = require(process.argv[3]);
    const ast = acorn.parse(code, {ecmaVersion: 'latest'});
    const value = node => {
        switch (node.type) {
        case 'Literal':
            return node.regex || typeof node.value === 'bigint' || (typeof node.value === 'number' && !isFinite(node.value)) ? undefined : node.value;
        case 'UnaryExpression':
            // -0 has no JSON form.
            return node.operator === '-' && node.argument.type === 'Literal' && typeof node.argument.value === 'number' &&
                node.argument.value !== 0 ? -node.argument.value : undefined;
        case 'ArrayExpression': {
            const out = [];
            for (const element of node.elements) {
                const v = element && element.type !== 'SpreadElement' ? value(element) : undefined;
                if (v === undefined) return undefined;
                out.push(v);
            }
            return out;
        }
        case 'ObjectExpression': {
            const out = {}, seen = new Set();
            for (const p of node.properties) {
                if (p.type !== 'Property' || p.computed || p.kind !== 'init' || p.method || p.shorthand) return undefined;
                const key = p.key.type === 'Identifier' ? p.key.name : p.key.value;
                // Plain string keys only (integer-like keys reorder), no duplicates.
                if (typeof key !== 'string' || key === '__proto__' || /^\d/.test(key) || seen.has(key)) return undefined;
                seen.add(key);
                const v = value(p.value);
                if (v === undefined) return undefined;
                out[key] = v;
            }
            return out;
        }
        }
        return undefined;
    };
    // Only the runtime's top-level tables, which are built once at startup. A literal inside a function is built on
    // every call, where re-parsing a string could cost more than it saves.
    const edits = [];
    const iife = ast.body[0].expression.callee.body.body;
    for (const statement of iife) {
        if (statement.type !== 'VariableDeclaration') continue;
        for (const node of statement.declarations) {
            if (!node.init || !/^(Object|Array)Expression$/.test(node.init.type) || node.init.end - node.init.start < 40) continue;
            const v = value(node.init);
            if (v !== undefined) edits.push([node.init.start, node.init.end, v]);
        }
    }
    edits.sort((a, b) => b[0] - a[0]);
    let out = code;
    for (const [start, end, v] of edits) {
        const text = JSON.stringify(JSON.stringify(v)).replace(/[\u007f-\uffff]/g, c => '\\u' + c.charCodeAt(0).toString(16).padStart(4, '0'));
        out = out.slice(0, start) + 'JSON.parse(' + text + ')' + out.slice(end);
    }
    return out;
}
"""
    source = ROOT / "patches/src/main/resources/venus/bootstrap.js"
    result = subprocess.run(["node", "-e", script, str(TOOLS / "terser.js"), str(source), str(TOOLS / "acorn.js")],
                            cwd=ROOT, check=True, capture_output=True, text=True)
    content = result.stdout
    # The About page reads this, so it must match the release. 1.5.1 still said 1.5.0.
    import re
    revision = re.search(r'const revision\s*=\s*"([^"]+)"', source.read_text())
    if not revision or revision.group(1) != VERSION:
        raise SystemExit(f"bootstrap.js revision {revision and revision.group(1)} != gradle.properties version {VERSION}")
    # No size budget: the injector stores the runtime as bytecode, not in a size-limited slot.
    if content.count("/*__FEATURES__*/") != 1:
        raise SystemExit("Invalid compact runtime")
    BUILD.mkdir(parents=True, exist_ok=True)
    output = BUILD / "bootstrap.js"
    output.write_text(content)
    # Precompile/verify the compacted Venus runtime against Hermes HBC98 (250829098.0.19).
    precompile = BUILD / "bootstrap.precompile.js"
    precompile.write_text(content.replace("/*__FEATURES__*/", "globalThis.__venusFeatures"))
    hbc_output = BUILD / "bootstrap.hbc"
    run(TOOLS / "hermesc", "-emit-binary", "-O", "-g0", "-w", f"-out={hbc_output}", precompile)
    print(f"Prelude characters: {len(source.read_text())} -> {len(content)} (HBC98: {hbc_output.stat().st_size} bytes)", flush=True)
    return output


BENCH_TOOLS = {"hermes_bench.cjs", "cold_boot.sh", "load_profile.cjs", "load_calls.cjs", "runtime_eval.cjs"}


def check_benches():
    """tests/bench/ keeps only the general tools. A bench for one optimization lives in tests/bench/scratch/ on its pull
    request and is deleted before the merge: on main or a release tag, any scratch file fails the build."""
    folder = ROOT / "tests/bench"
    stray = sorted(p.name for p in folder.iterdir() if p.is_file() and p.name not in BENCH_TOOLS)
    if stray:
        raise SystemExit(f"tests/bench: {stray} aren't general tools; one optimization's bench goes in tests/bench/scratch/ (AGENTS.md)")
    scratch = sorted(str(p.relative_to(ROOT)) for p in (folder / "scratch").rglob("*") if p.is_file()) if (folder / "scratch").is_dir() else []
    if not scratch:
        return
    ref = os.environ.get("GITHUB_REF", "")
    if ref == "refs/heads/main" or ref.startswith("refs/tags/") or os.environ.get("VENUS_RELEASE"):
        raise SystemExit(f"{scratch}: per-optimization benches never reach main or a release; delete tests/bench/scratch/")
    print(f"::warning::Delete tests/bench/scratch/ before merging: {', '.join(scratch)}", flush=True)


def build():
    # Morphe Manager draws CHANGELOG.md as sections; a malformed entry shows as one grey block.
    run(sys.executable, ROOT / "scripts/release_notes.py", "--check")
    check_benches()
    tools()
    runtime = compact_runtime()
    libs = BUILD / "libs"
    libs.mkdir(parents=True, exist_ok=True)
    # Compile-only bridge ABI stubs are on the classpath, never in the extension DEX.
    stubs = BUILD / "bridge-stubs.jar"
    compiler = TOOLS / "kotlinc/bin/kotlinc"
    run(compiler, "-no-stdlib", "-no-reflect", "-cp", TOOLS / "morphe.jar",
        *sorted((ROOT / "extensions/voice/stubs").rglob("*.kt")), "-d", stubs)
    voice_classes = BUILD / "voice-classes.jar"
    voice_sources = sorted((ROOT / "extensions/voice/src/main/kotlin").rglob("*.kt"))
    run(compiler, "-no-stdlib", "-no-reflect", "-language-version", "2.1", "-api-version", "2.1", "-Xsuppress-version-warnings",
        "-jvm-target", "11", "-Xlambdas=class", "-cp",
        f"{TOOLS / 'android.jar'}:{TOOLS / 'morphe.jar'}:{stubs}",
        *voice_sources, "-d", voice_classes)
    # The Android host obfuscates collection/text/Result/Unit helpers. A JVM compile
    # alone can succeed with dependencies that will not link inside Discord.
    with zipfile.ZipFile(voice_classes) as native:
        for name in native.namelist():
            if not name.endswith(".class"):
                continue
            content = native.read(name)
            for unsafe in (b"kotlin/text/", b"kotlin/collections/", b"kotlin/Result", b"kotlin/Unit"):
                if unsafe in content:
                    raise SystemExit(f"Unsafe host Kotlin helper in {name}: {unsafe.decode()}; use Java APIs")
    voice_dex = BUILD / "voice-dex"
    voice_dex.mkdir(exist_ok=True)
    for stale in voice_dex.glob("classes*.dex"):
        stale.unlink()
    run("java", "-Xmx384m", "-cp", TOOLS / "r8.jar", "com.android.tools.r8.D8",
        "--release", "--min-api", "26", "--lib", TOOLS / "android.jar",
        "--classpath", TOOLS / "morphe.jar", "--classpath", stubs,
        "--output", voice_dex, voice_classes)
    # Force system font: the same Java-only rules as the voice extension.
    font_classes = BUILD / "font-classes.jar"
    run(compiler, "-no-stdlib", "-no-reflect", "-language-version", "2.1", "-api-version", "2.1", "-Xsuppress-version-warnings",
        "-jvm-target", "11", "-Xlambdas=class", "-cp", f"{TOOLS / 'android.jar'}:{TOOLS / 'morphe.jar'}:{stubs}",
        *sorted((ROOT / "extensions/font/src/main/kotlin").rglob("*.kt")), "-d", font_classes)
    with zipfile.ZipFile(font_classes) as native:
        for name in native.namelist():
            if not name.endswith(".class"):
                continue
            content = native.read(name)
            for unsafe in (b"kotlin/text/", b"kotlin/collections/", b"kotlin/Result", b"kotlin/Unit", b"kotlin/io/"):
                if unsafe in content:
                    raise SystemExit(f"Unsafe host Kotlin helper in {name}: {unsafe.decode()}; use Java APIs")
    font_dex = BUILD / "font-dex"
    font_dex.mkdir(exist_ok=True)
    for stale in font_dex.glob("classes*.dex"):
        stale.unlink()
    run("java", "-Xmx384m", "-cp", TOOLS / "r8.jar", "com.android.tools.r8.D8",
        "--release", "--min-api", "26", "--lib", TOOLS / "android.jar",
        "--classpath", stubs, "--output", font_dex, font_classes)
    # Force system emojis: the same Java-only rules again.
    emoji_classes = BUILD / "emoji-classes.jar"
    run(compiler, "-no-stdlib", "-no-reflect", "-language-version", "2.1", "-api-version", "2.1", "-Xsuppress-version-warnings",
        "-jvm-target", "11", "-Xlambdas=class", "-cp", f"{TOOLS / 'android.jar'}:{TOOLS / 'morphe.jar'}:{stubs}",
        *sorted((ROOT / "extensions/emoji/src/main/kotlin").rglob("*.kt")), "-d", emoji_classes)
    with zipfile.ZipFile(emoji_classes) as native:
        for name in native.namelist():
            if not name.endswith(".class"):
                continue
            content = native.read(name)
            for unsafe in (b"kotlin/text/", b"kotlin/collections/", b"kotlin/Result", b"kotlin/Unit", b"kotlin/io/"):
                if unsafe in content:
                    raise SystemExit(f"Unsafe host Kotlin helper in {name}: {unsafe.decode()}; use Java APIs")
    emoji_dex = BUILD / "emoji-dex"
    emoji_dex.mkdir(exist_ok=True)
    for stale in emoji_dex.glob("classes*.dex"):
        stale.unlink()
    run("java", "-Xmx384m", "-cp", TOOLS / "r8.jar", "com.android.tools.r8.D8",
        "--release", "--min-api", "26", "--lib", TOOLS / "android.jar",
        "--classpath", stubs, "--output", emoji_dex, emoji_classes)
    # Settings languages: the same Java-only rules again.
    i18n_classes = BUILD / "i18n-classes.jar"
    run(compiler, "-no-stdlib", "-no-reflect", "-language-version", "2.1", "-api-version", "2.1", "-Xsuppress-version-warnings",
        "-jvm-target", "11", "-Xlambdas=class", "-cp", f"{TOOLS / 'android.jar'}:{TOOLS / 'morphe.jar'}:{stubs}",
        *sorted((ROOT / "extensions/i18n/src/main/kotlin").rglob("*.kt")), "-d", i18n_classes)
    with zipfile.ZipFile(i18n_classes) as native:
        for name in native.namelist():
            if not name.endswith(".class"):
                continue
            content = native.read(name)
            for unsafe in (b"kotlin/text/", b"kotlin/collections/", b"kotlin/Result", b"kotlin/Unit", b"kotlin/io/"):
                if unsafe in content:
                    raise SystemExit(f"Unsafe host Kotlin helper in {name}: {unsafe.decode()}; use Java APIs")
    i18n_dex = BUILD / "i18n-dex"
    i18n_dex.mkdir(exist_ok=True)
    for stale in i18n_dex.glob("classes*.dex"):
        stale.unlink()
    run("java", "-Xmx384m", "-cp", TOOLS / "r8.jar", "com.android.tools.r8.D8",
        "--release", "--min-api", "26", "--lib", TOOLS / "android.jar",
        "--classpath", stubs, "--output", i18n_dex, i18n_classes)
    # Material You colors: the same Java-only rules again.
    monet_classes = BUILD / "monet-classes.jar"
    run(compiler, "-no-stdlib", "-no-reflect", "-language-version", "2.1", "-api-version", "2.1", "-Xsuppress-version-warnings",
        "-jvm-target", "11", "-Xlambdas=class", "-cp", f"{TOOLS / 'android.jar'}:{TOOLS / 'morphe.jar'}:{stubs}",
        *sorted((ROOT / "extensions/monet/src/main/kotlin").rglob("*.kt")), "-d", monet_classes)
    with zipfile.ZipFile(monet_classes) as native:
        for name in native.namelist():
            if not name.endswith(".class"):
                continue
            content = native.read(name)
            for unsafe in (b"kotlin/text/", b"kotlin/collections/", b"kotlin/Result", b"kotlin/Unit", b"kotlin/io/", b"kotlin/ranges/"):
                if unsafe in content:
                    raise SystemExit(f"Unsafe host Kotlin helper in {name}: {unsafe.decode()}; use Java APIs")
    monet_dex = BUILD / "monet-dex"
    monet_dex.mkdir(exist_ok=True)
    for stale in monet_dex.glob("classes*.dex"):
        stale.unlink()
    run("java", "-Xmx384m", "-cp", TOOLS / "r8.jar", "com.android.tools.r8.D8",
        "--release", "--min-api", "26", "--lib", TOOLS / "android.jar",
        "--classpath", stubs, "--output", monet_dex, monet_classes)
    # Chat row decorations (Bulk delete right-side selection circle): Java-only rules again.
    chat_classes = BUILD / "chat-classes.jar"
    run(compiler, "-no-stdlib", "-no-reflect", "-language-version", "2.1", "-api-version", "2.1", "-Xsuppress-version-warnings",
        "-jvm-target", "11", "-Xlambdas=class", "-cp", f"{TOOLS / 'android.jar'}:{TOOLS / 'morphe.jar'}:{stubs}",
        *sorted((ROOT / "extensions/chat/src/main/kotlin").rglob("*.kt")), "-d", chat_classes)
    with zipfile.ZipFile(chat_classes) as native:
        for name in native.namelist():
            if not name.endswith(".class"):
                continue
            content = native.read(name)
            for unsafe in (b"kotlin/text/", b"kotlin/collections/", b"kotlin/Result", b"kotlin/Unit", b"kotlin/io/", b"kotlin/ranges/"):
                if unsafe in content:
                    raise SystemExit(f"Unsafe host Kotlin helper in {name}: {unsafe.decode()}; use Java APIs")
    chat_dex = BUILD / "chat-dex"
    chat_dex.mkdir(exist_ok=True)
    for stale in chat_dex.glob("classes*.dex"):
        stale.unlink()
    run("java", "-Xmx384m", "-cp", TOOLS / "r8.jar", "com.android.tools.r8.D8",
        "--release", "--min-api", "26", "--lib", TOOLS / "android.jar",
        "--classpath", stubs, "--output", chat_dex, chat_classes)
    # Keep Bluetooth audio clear in calls: Java-only rules again.
    audio_classes = BUILD / "audio-classes.jar"
    run(compiler, "-no-stdlib", "-no-reflect", "-language-version", "2.1", "-api-version", "2.1", "-Xsuppress-version-warnings",
        "-jvm-target", "11", "-Xlambdas=class", "-cp", f"{TOOLS / 'android.jar'}:{TOOLS / 'morphe.jar'}:{stubs}",
        *sorted((ROOT / "extensions/audio/src/main/kotlin").rglob("*.kt")), "-d", audio_classes)
    with zipfile.ZipFile(audio_classes) as native:
        for name in native.namelist():
            if not name.endswith(".class"):
                continue
            content = native.read(name)
            for unsafe in (b"kotlin/text/", b"kotlin/collections/", b"kotlin/Result", b"kotlin/Unit", b"kotlin/io/", b"kotlin/ranges/"):
                if unsafe in content:
                    raise SystemExit(f"Unsafe host Kotlin helper in {name}: {unsafe.decode()}; use Java APIs")
    audio_dex = BUILD / "audio-dex"
    audio_dex.mkdir(exist_ok=True)
    for stale in audio_dex.glob("classes*.dex"):
        stale.unlink()
    run("java", "-Xmx384m", "-cp", TOOLS / "r8.jar", "com.android.tools.r8.D8",
        "--release", "--min-api", "26", "--lib", TOOLS / "android.jar",
        "--classpath", stubs, "--output", audio_dex, audio_classes)
    check_languages()
    classes = BUILD / "classes.jar"
    sources = sorted((ROOT / "patches/src/main/kotlin").rglob("*.kt"))
    run(TOOLS / "kotlinc/bin/kotlinc", "-no-stdlib", "-no-reflect",
        "-jvm-target", "11", "-Xlambdas=class", "-cp", f"{TOOLS / 'morphe.jar'}:{TOOLS / 'gson.jar'}",
        *sources, "-d", classes)
    # Static privacy ABI checks and detached assembler fixtures, never the APK patching engine.
    privacy_tests = BUILD / "privacy-tests.jar"
    run(compiler, "-no-stdlib", "-no-reflect", "-Xfriend-paths=" + str(classes),
        "-cp", f"{classes}:{TOOLS / 'morphe.jar'}", ROOT / "tests/native/PrivacyTest.kt", "-d", privacy_tests)
    original_apk = os.environ.get("VENUS_ORIGINAL_APK")
    run("java", "-Xmx384m", "-cp", f"{privacy_tests}:{classes}:{TOOLS / 'morphe.jar'}",
        "app.venus.patches.PrivacyTestKt", *([original_apk, str(BUILD / "privacy-fixtures")] if original_apk else []))
    dex = BUILD / "dex"
    dex.mkdir(exist_ok=True)
    for stale in dex.glob("classes*.dex"):
        stale.unlink()
    run("java", "-Xmx384m", "-cp", TOOLS / "r8.jar", "com.android.tools.r8.D8",
        "--release", "--min-api", "26", "--classpath", TOOLS / "morphe.jar",
        "--classpath", TOOLS / "gson.jar",
        "--output", dex, classes)
    # Same JVM classes + classes.dex layout and manifest keys as the official plugin.
    manifest = "\r\n".join([
        "Manifest-Version: 1.0", "Name: Venus Patches",
        "Description: Extra features and privacy options for Discord on Android.",
        f"Version: {VERSION}", "Patcher-Version: 1.15.0",
        "Source: https://github.com/VenusIsJaded/Venus-Patches",
        "Author: VenusIsJaded", "License: GPL-3.0", "", "",
    ])
    bundle = libs / ASSET_NAME
    # Normalize ZIP timestamps, order and modes so identical inputs produce identical bundles.
    with zipfile.ZipFile(bundle, "w", zipfile.ZIP_DEFLATED) as out:
        def add(name, content):
            entry = zipfile.ZipInfo(str(name), date_time=(1980, 1, 1, 0, 0, 0))
            entry.compress_type = zipfile.ZIP_DEFLATED
            entry.create_system = 3
            entry.external_attr = 0o100644 << 16
            out.writestr(entry, content)

        add("META-INF/MANIFEST.MF", manifest)
        with zipfile.ZipFile(classes) as compiled:
            for name in sorted(compiled.namelist()):
                if name != "META-INF/MANIFEST.MF":
                    add(name, compiled.read(name))
        for path in sorted((ROOT / "patches/src/main/resources").rglob("*")):
            if path.is_file():
                content = runtime.read_bytes() if path.name == "bootstrap.js" else path.read_bytes()
                add(path.relative_to(ROOT / "patches/src/main/resources"), content)
        add("extensions/voice.mpe", (voice_dex / "classes.dex").read_bytes())
        add("extensions/font.mpe", (font_dex / "classes.dex").read_bytes())
        add("extensions/emoji.mpe", (emoji_dex / "classes.dex").read_bytes())
        add("extensions/i18n.mpe", (i18n_dex / "classes.dex").read_bytes())
        add("extensions/monet.mpe", (monet_dex / "classes.dex").read_bytes())
        add("extensions/chat.mpe", (chat_dex / "classes.dex").read_bytes())
        add("extensions/audio.mpe", (audio_dex / "classes.dex").read_bytes())
        for path in sorted(dex.glob("classes*.dex")):
            add(path.name, path.read_bytes())
    run("java", "-Xmx256m", "-cp", f"{bundle}:{TOOLS / 'morphe.jar'}:{TOOLS / 'gson.jar'}",
        "util.PatchListGeneratorKt", bundle, cwd=ROOT / "patches")
    checksum = libs / "SHA256SUMS"
    checksum.write_text(f"{digest(bundle)}  {bundle.name}\n")
    print(f"Bundle: {bundle.relative_to(ROOT)}", flush=True)


def check_languages():
    """Every language file the index lists exists, is valid JSON and keeps every {placeholder} of the English text."""
    import re
    folder = ROOT / "patches/src/main/resources/venus/i18n"
    codes = [line.strip() for line in (folder / "index.txt").read_text().splitlines() if line.strip()]
    for code in codes:
        pack = json.loads((folder / f"{code}.json").read_text(encoding="utf-8"))
        strings = pack.get("strings")
        if pack.get("code") != code or not isinstance(strings, dict) or not strings:
            raise SystemExit(f"i18n/{code}.json: bad header")
        for english, value in strings.items():
            needed = set(re.findall(r"\{\w+\}", english))
            for text in (value.values() if isinstance(value, dict) else [value]):
                if not isinstance(text, str) or set(re.findall(r"\{\w+\}", text)) != needed:
                    raise SystemExit(f"i18n/{code}.json: {english!r} must keep {sorted(needed)}")
    # Every text Venus passes through tr()/pl() ships translated, so a new row can't appear in English only.
    found = json.loads(subprocess.check_output(["node", ROOT / "scripts/i18n_strings.cjs"], cwd=ROOT, text=True))
    for code in codes:
        strings = json.loads((folder / f"{code}.json").read_text(encoding="utf-8"))["strings"]
        missing = [english for english in found if english not in strings]
        if missing:
            raise SystemExit(f"i18n/{code}.json: {len(missing)} untranslated, first: {missing[:5]}")
    print(f"Languages: {len(codes)}", flush=True)


def release_summary():
    """This version's CHANGELOG.md entry, without its heading, in Morphe's section format.

    Morphe Manager shows it when the CHANGELOG.md it fetched doesn't list the installed version yet,
    which happens to every new release while GitHub's raw file cache (5 minutes) and Manager's own
    (10 minutes) still hold the old file. A plain sentence there shows as one grey block.
    """
    sys.path.insert(0, str(ROOT / "scripts"))
    from release_notes import notes
    body = notes(VERSION).split("\n", 1)[1].strip()
    return body + "\n"


def check_metadata(metadata):
    """Reject a manifest Morphe Manager cannot read before it is ever published."""
    import re
    for key in ("created_at", "description", "download_url", "version"):
        if not isinstance(metadata.get(key), str) or not metadata[key]:
            raise SystemExit(f"patches-bundle.json: missing {key}")
    # Morphe Manager parses created_at as a kotlinx LocalDateTime: no UTC offset or "Z".
    if not re.fullmatch(r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}(:\d{2}(\.\d{1,9})?)?", metadata["created_at"]):
        raise SystemExit("patches-bundle.json: created_at must be a LocalDateTime without a UTC offset")
    if not metadata["download_url"].startswith("https://github.com/VenusIsJaded/Venus-Patches/releases/download/"):
        raise SystemExit("patches-bundle.json: unexpected download_url")
    # The fallback release notes must split into Morphe's sections, like CHANGELOG.md does.
    if not re.search(r"^### \S", metadata["description"], re.M) or not re.search(r"^\* \*\*Discord", metadata["description"], re.M):
        raise SystemExit("patches-bundle.json: description must be the release's CHANGELOG.md sections (see AGENTS.md)")


def release_metadata():
    # An offset such as "+00:00" makes Morphe reject the whole remote source.
    created_at = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S")
    # Keep the published time for an already released version: Manager treats a new created_at as an update.
    existing = ROOT / "patches-bundle.json"
    if existing.exists():
        previous = json.loads(existing.read_text())
        if previous.get("version") == VERSION and previous.get("created_at"):
            created_at = previous["created_at"]
    metadata = {
        "created_at": created_at,
        "description": release_summary(),
        "download_url": f"https://github.com/VenusIsJaded/Venus-Patches/releases/download/{RELEASE_TAG}/{ASSET_NAME}",
        "page_url": f"https://github.com/VenusIsJaded/Venus-Patches/releases/tag/{RELEASE_TAG}",
        "signature_download_url": "",
        "version": VERSION,
    }
    check_metadata(metadata)
    (ROOT / "patches-bundle.json").write_text(json.dumps(metadata, indent=2) + "\n")


if __name__ == "__main__":
    if "--metadata-only" in sys.argv:
        release_metadata()
    elif "--check-metadata" in sys.argv:
        check_metadata(json.loads((ROOT / "patches-bundle.json").read_text()))
        print("patches-bundle.json is readable by Morphe Manager")
    else:
        build()
