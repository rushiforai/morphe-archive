// Developer harness for Custom themes: installs every real published Revenge / Vendetta theme through the real
// Custom themes page (link field + Install), against Discord's real color tables decoded from the bundle, and
// reports what each theme changes, what it couldn't place, whether turning it off restores Discord exactly, and
// how long compiling takes.
//
//   python3 scripts/hbc/color_tables.py      # once per Discord version -> work/discord_colors.json
//   python3 tests/themes_fetch.py            # once -> work/themes/
//   node tests/theme_compat.cjs [--each] [--all]
//
// Not part of the shipped patch or the build.
const fs = require('node:fs'), vm = require('node:vm'), path = require('node:path');
const ROOT = path.resolve(__dirname, '..');
const src = fs.readFileSync(process.env.VENUS_RUNTIME_PATH || path.join(ROOT, 'patches/src/main/resources/venus/bootstrap.js'), 'utf8');
const TABLES = JSON.parse(fs.readFileSync(path.join(ROOT, 'work/discord_colors.json'), 'utf8'));
const index = JSON.parse(fs.readFileSync(path.join(ROOT, 'work/themes/index.json'), 'utf8'));
const SLOTS = Object.values(TABLES.themes);
// Module IDs as bootstrap.js uses them, so this harness follows every Discord port by itself.
const caseId = hook => +(new RegExp('case (\\d+): return features\\.customThemes \\? ' + hook).exec(src) || [])[1];
const partId = name => +(new RegExp('\\b' + name + ':(?:\\w+ \\|\\| )?x\\((\\d+),').exec(src) || [])[1];
const ID = {RawColors:caseId('hookRawColorsModule'), SemanticColors:caseId('hookSemanticColorsModule'),
    SemanticColorExperiments:caseId('hookExperimentColorsModule'),
    ThemeStore:+(/case (\d+): if \(\(features\.customThemes[^\n]*themeStore =/.exec(src) || [])[1],
    ThemeContext:+(/case (\d+): return \(features\.customThemes \|\| features\.iconPacks\) \? hookCreateThemedContext/.exec(src) || [])[1],
    SettingsRegistry:+(/case (\d+): exports\.SETTING_RENDERER_CONFIG = nativeRegistry/.exec(src) || [])[1],
    toasts:partId('toasts'), TableRow:partId('TableRow'), TableRowGroup:partId('TableRowGroup'), TextInput:partId('TextInput')};
for (const [name, id] of Object.entries(ID)) if (!id) throw new Error(`theme_compat: can't find ${name}'s module ID in bootstrap.js`);
// Venus's own alias table, read from bootstrap.js so the report follows the code.
const ALIASES = (0, eval)('(' + /const LEGACY_SEMANTIC_ALIASES = (\{[\s\S]*?\n    \});/.exec(src)[1] + ')');
const clone = o => JSON.parse(JSON.stringify(o));
const tick = () => new Promise(resolve => setImmediate(resolve));

function pageNodes(tree) {
    const out = [];
    (function walk(n) { if (!n || typeof n !== 'object') return; if (Array.isArray(n)) return n.forEach(walk); out.push(n); walk(n.props && n.props.children); })(tree);
    return out;
}
function bootWith(tables) {
    const context = vm.createContext({console:{warn(){}}, setTimeout, clearTimeout});
    vm.runInContext(src.replace('/*__FEATURES__*/', JSON.stringify({customThemes:true})), context);
    const factories = new Map();
    context.__d = (factory, id) => factories.set(id, factory);
    const load = (exports, id) => {
        context.__d(function (g, r, i, a, m) { m.exports = exports; }, id, []);
        const m = {exports:{}}; factories.get(id)(context, () => {}, () => {}, () => {}, m, m.exports, []); return m.exports;
    };
    load({default:function setUp(){}}, 120).default();
    const React = {createElement:(type, props, ...c) => ({type, props:Object.assign({}, props, c.length ? {children:c.length === 1 ? c[0] : c} : {})}),
        cloneElement:(n, p) => Object.assign({}, n, {props:Object.assign({}, n.props, p)}), useState:v => [v, () => {}], useEffect(){}, useRef:v => ({current:v})};
    load(React, 19);
    // Venus recognizes React Native by View, Text and Modal.
    load({View:'View', Text:'Text', Image:'Image', Modal:'Modal', Pressable:'Pressable'}, 17);
    load({default:{getConstants:() => ({DocumentsDirPath:'/data'}), fileExists:async () => false, readFile:async () => '{}', writeFile:async () => {}, getSize:async () => 0}}, 1162);
    load({_private:{RawColors:tables.raw}}, ID.RawColors);
    load({_private:{SemanticColors:tables.sem}}, ID.SemanticColors);
    load({_private:{SemanticColorExperiments:tables.exp}}, ID.SemanticColorExperiments);
    load({default:{emitChange(){}}}, ID.ThemeStore);
    load({FALLBACK_THEME_CONTEXT_VALUE:{key:'{}'}, createThemedContext:c => Object.assign({}, c, {key:JSON.stringify(c)})}, ID.ThemeContext);
    const modules = {[ID.RawColors]:{_private:{RawColors:tables.raw}}, [ID.SemanticColors]:{_private:{SemanticColors:tables.sem}},
        [ID.SemanticColorExperiments]:{_private:{SemanticColorExperiments:tables.exp}}, [ID.toasts]:{default:{open(){}}},
        [ID.TableRow]:{TableRow:'Row'}, [ID.TableRowGroup]:{TableRowGroup:'Group'}, [ID.TextInput]:{TextInput:'Input'}};
    context.__r = id => modules[id] || null;
    return {context, api:context.__venusPatches, load, React};
}
// What Discord would draw for a token: resolveSemanticColor (587) reads an active experiment override first.
function resolve(tables, token, slot) {
    const exp = tables.exp[token] && tables.exp[token]['mobile-visual-refresh'] && tables.exp[token]['mobile-visual-refresh'][slot];
    const e = exp || (tables.sem[token] && tables.sem[token][slot]);
    return e ? (tables.raw[e.raw] || '?') + '@' + e.opacity : null;
}
function snapshot(tables) {
    const out = {};
    for (const token of Object.keys(tables.sem)) for (const slot of SLOTS) out[token + ':' + slot] = resolve(tables, token, slot);
    return out;
}
async function install(b, url, text) {
    for (let i = 0; i < 20 && /loading|waiting/.test(b.api.status.storage); i++) await tick();
    b.context.fetch = async () => ({ok:true, status:200, text:async () => text});
    b.api.setSetting('customThemes', true);
    let draft = url;
    b.React.useState = init => typeof init === 'string' ? [draft, v => { draft = v; }] : [init, () => {}];
    const registry = b.load({SETTING_RENDERER_CONFIG:{ACCOUNT:{type:'route', IconComponent(){}}}}, ID.SettingsRegistry).SETTING_RENDERER_CONFIG;
    const page = () => pageNodes(registry.VENUS_CUSTOMTHEMES.screen.getComponent()());
    const button = page().find(n => n.props && n.props.accessibilityLabel === 'Install');
    if (!button) return {error:'no Install button (page did not render)', ms:0};
    const t0 = process.hrtime.bigint();
    button.props.onPress();
    for (let i = 0; i < 8; i++) await tick();
    const ms = Number(process.hrtime.bigint() - t0) / 1e6;
    const failed = page().find(n => n.props && n.props.color === 'text-feedback-critical');
    return {error:failed ? 'install failed: ' + page().filter(n => n.props && n.props.variant === 'text-xs/medium').map(n => n.props.children).join(' ') : null, ms};
}
const hexOf = v => { const c = Array.isArray(v) ? v[0] : v; if (typeof c !== 'string') return null; const m = /^#?([0-9a-f]{6})/i.exec(c.trim()); return m ? '#' + m[1].toLowerCase() : null; };

(async () => {
    const base = snapshot(TABLES);
    const results = [], fresh = new Map();
    for (const entry of index) {
        let theme, text;
        try { text = fs.readFileSync(path.join(ROOT, entry.file), 'utf8').replace(/^\uFEFF/, ''); theme = JSON.parse(text); }
        catch (e) { results.push({name:entry.name, error:'invalid JSON: ' + e.message}); continue; }
        const tables = clone(TABLES), b = bootWith(tables);
        const {error, ms} = await install(b, entry.url || 'https://example.com/theme.json', text);
        const after = snapshot(tables);
        const dark = Object.keys(after).filter(k => k.endsWith(':' + SLOTS[0]) && after[k] !== base[k]);
        // A declared key is placed when one of its own targets (the token itself, or its aliases) now draws its
        // color. Targets the theme also sets by their own current name are the theme's choice, not a miss. Keys with
        // no target at all count as placed only if their color shows on some token (a plus/background rule).
        const declaredKeys = theme.semanticColors || {};
        const drawn = new Set(Object.keys(after).filter(k => k.endsWith(':' + SLOTS[0])).map(k => String(after[k]).split('@')[0].toLowerCase().slice(0, 7)));
        const targetsOf = k => (k in TABLES.sem ? [k] : []).concat(ALIASES[k] || []);
        const unlanded = Object.entries(declaredKeys).filter(([k, v]) => {
            const h = hexOf(v); if (!h) return false;
            const all = targetsOf(k), own = all.filter(token => token === k || !(token in declaredKeys));
            if (all.length && !own.length) return false;
            if (own.length) return !own.some(token => String(after[token + ':' + SLOTS[0]]).split('@')[0].toLowerCase().slice(0, 7) === h);
            return !drawn.has(h);
        }).map(([k]) => k);
        // Revenge's false means "keep Discord's color for this slot": a theme key named after a current token must
        // leave those slots on Discord's own raw key
        // (which the theme's rawColors may still recolor, as in Revenge).
        const falseSlotsChanged = Object.entries(declaredKeys).filter(([k, v]) => k in TABLES.sem && Array.isArray(v))
            .flatMap(([k, v]) => v.slice(0, 4).map((c, i) => c === false && (tables.sem[k][SLOTS[i]] || {}).raw !== (TABLES.sem[k][SLOTS[i]] || {}).raw ? k + ':' + SLOTS[i] : null)).filter(Boolean);
        // Theme switch cost on its own: off then on again recompiles the whole theme into the tables.
        let switchMs = 0;
        if (!error) { const reps = 20, s0 = process.hrtime.bigint();
            for (let i = 0; i < reps; i++) { b.api.setSetting('customThemes', false); b.api.setSetting('customThemes', true); }
            switchMs = Number(process.hrtime.bigint() - s0) / 1e6 / reps; }
        b.api.setSetting('customThemes', false);
        const restored = JSON.stringify(snapshot(tables)) === JSON.stringify(base);
        fresh.set(entry.file, JSON.stringify(after));
        results.push({name:entry.name, error, ms, declared:Object.keys(theme.semanticColors || {}).length, darkTokens:dark.length, restored, unlanded, switchMs, falseSlotsChanged});
    }
    // Chain: one session installs every theme over the previous one. Each must draw exactly what a fresh install
    // draws, so nothing from an earlier theme leaks through the journaled restore.
    const chainLeaks = [];
    { const tables = clone(TABLES), b = bootWith(tables);
      for (const entry of index) {
          if (!fresh.has(entry.file)) continue;
          const text = fs.readFileSync(path.join(ROOT, entry.file), 'utf8').replace(/^\uFEFF/, '');
          const {error} = await install(b, entry.url || 'https://example.com/theme.json', text);
          if (error || JSON.stringify(snapshot(tables)) !== fresh.get(entry.file)) chainLeaks.push(entry.name);
      }
      b.api.setSetting('customThemes', false);
      if (JSON.stringify(snapshot(tables)) !== JSON.stringify(base)) chainLeaks.push('(off after chain)');
      const left = Object.keys(tables.raw).filter(k => k.startsWith('__VENUS_')).length;
      if (left) chainLeaks.push(left + ' synthetic keys left after off'); }
    const ok = results.filter(r => !r.error), times = ok.map(r => r.ms).sort((a, b) => a - b);
    const pct = p => times.length ? times[Math.min(times.length - 1, Math.floor(times.length * p))].toFixed(2) : '-';
    const misses = {};
    ok.forEach(r => r.unlanded.forEach(k => { misses[k] = (misses[k] || 0) + 1; }));
    const declared = ok.reduce((n, r) => n + r.declared, 0), unplaced = ok.reduce((n, r) => n + r.unlanded.length, 0);
    console.log(JSON.stringify({themes:results.length, installed:ok.length, errors:results.filter(r => r.error).map(r => [r.name, r.error]),
        notRestored:ok.filter(r => !r.restored).map(r => r.name), chainLeaks, noVisibleChange:ok.filter(r => !r.darkTokens).map(r => r.name),
        falseSlotsChanged:ok.filter(r => r.falseSlotsChanged.length).map(r => [r.name, r.falseSlotsChanged]),
        medianTokensThemed:ok.map(r => r.darkTokens).sort((a, b) => a - b)[Math.floor(ok.length / 2)],
        declaredKeysPlaced:declared ? ((1 - unplaced / declared) * 100).toFixed(1) + '%' : '-', unplacedKeyUses:unplaced,
        installMs:{median:pct(0.5), p95:pct(0.95), max:pct(1)},
        switchMs:(() => { const s = ok.map(r => r.switchMs).sort((x, y) => x - y); return {median:s[Math.floor(s.length / 2)].toFixed(3), p95:s[Math.floor(s.length * 0.95)].toFixed(3), max:s[s.length - 1].toFixed(3)}; })(),
        topUnplaced:Object.entries(misses).sort((a, b) => b[1] - a[1]).slice(0, process.argv.includes('--all') ? 999 : 40)}, null, 1));
    if (process.argv.includes('--each')) for (const r of results) console.log(r.name.padEnd(40), r.error || `${r.darkTokens} tokens, ${r.unlanded.length} unplaced, ${r.ms.toFixed(2)} ms`);
    // WHO=KEY lists the themes whose KEY did not land.
    if (process.env.WHO) for (const r of results) if (r.unlanded && r.unlanded.includes(process.env.WHO)) console.log("WHO", r.name);
})();
