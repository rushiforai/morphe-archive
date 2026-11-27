// Prueba reproducible del trabajo propio de FaroTV; no mide la red ni los FPS del TV.
// node tools/benchmark-runtime.cjs [referencia Git anterior]
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const { execFileSync } = require('node:child_process');
const root = path.resolve(__dirname, '..');
const sourcePath = 'extensions/extension/src/main/';
const baseline = process.argv[2] || 'v1.7.0-dev.3';
if (!/^[A-Za-z0-9._/-]+$/.test(baseline)) throw new Error('Referencia Git no válida');

function measure(ref) {
    const timers = new Map();
    const requests = [];
    let nextTimer = 1;
    let formatters = 0;
    let title = 'YouTube';
    const document = { documentElement: { lang: 'en' } };
    Object.defineProperty(document, 'title', {
        get: () => title,
        set: value => { title = value; const m = /^tvp:@req (\d+) /.exec(value); if (m) requests.push(Number(m[1])); }
    });
    const context = vm.createContext({
        document, navigator: { language: 'en' },
        location: { hostname: 'www.youtube.com', href: 'https://www.youtube.com/tv' },
        __farotvTranslations: { en: JSON.parse(fs.readFileSync(path.join(root, sourcePath, 'locales/en.json'), 'utf8')) },
        Intl: { NumberFormat: function (...args) { formatters++; return new Intl.NumberFormat(...args); } },
        setTimeout: (fn, ms) => { const id = nextTimer++; timers.set(id, { fn, ms }); return id; },
        clearTimeout: id => timers.delete(id)
    });
    vm.runInContext(`window = this; localStorage = { getItem: () => null };
        _yttv = { registry: { ENABLE_PREVIEWS_WITH_SOUND: true }, defaults: new Map([['ENABLE_PREVIEWS_WITH_SOUND', true]]) };`, context);
    for (const script of ['i18n', 'runtime', 'ryd']) {
        const file = sourcePath + 'js/' + script + '.js';
        const source = ref ? execFileSync('git', ['show', ref + ':' + file], { cwd: root, encoding: 'utf8' })
                           : fs.readFileSync(path.join(root, file), 'utf8');
        vm.runInContext(source, context);
    }
    vm.runInContext(`responses = []; for (var i = 0; i < 100; i++) responses.push(JSON.parse(
        '{"transportControls":{"transportControlsRenderer":{"promotedActions":[{"button":{"likeButtonRenderer":{"target":{"videoId":"dQw4w9WgXcQ"}}}}]}}}'));`, context);
    // Procesa únicamente la cola de mensajes, sin simular que vence el plazo de red.
    for (let i = 0; i < 1000; i++) {
        const entry = [...timers].find(([, timer]) => timer.ms === 0);
        if (!entry) break;
        timers.delete(entry[0]); entry[1].fn();
    }
    const pendingBefore = [...timers.values()].filter(t => t.ms === 60000).length;
    for (const id of requests) context.youtv.deliver(id, 200, '{"dislikes":521904}');
    const populated = vm.runInContext(`responses.filter(r => r.transportControls.transportControlsRenderer.promotedActions[0].button.likeButtonRenderer.dislikeCountText.simpleText === '521.9K').length`, context);
    return { consultasSimultaneas: 100, peticionesAlPuente: requests.length,
             formateadoresCreados: formatters, temporizadoresAntes: pendingBefore,
             temporizadoresDespues: [...timers.values()].filter(t => t.ms === 60000).length,
             respuestasConContador: populated };
}
function icons(ref) {
    let writes = 0;
    const context = vm.createContext({
        document: { adoptedStyleSheets: [] },
        youtv: { setIcons() {}, report() {} },
        CSSStyleSheet: class { replaceSync() { writes++; } }
    });
    vm.runInContext('window = this;', context);
    const file = sourcePath + 'js/icons.js';
    const source = ref ? execFileSync('git', ['show', ref + ':' + file], { cwd: root, encoding: 'utf8' })
                       : fs.readFileSync(path.join(root, file), 'utf8');
    for (let i = 0; i < 100; i++) vm.runInContext(source, context);
    return { reinyecciones: 100, hojasAdoptadas: context.document.adoptedStyleSheets.length, escriturasCSS: writes };
}
console.log(JSON.stringify({ anterior: { referencia: baseline, ...measure(baseline), iconos: icons(baseline) },
                            actual: { ...measure(null), iconos: icons(null) } }, null, 2));


function settingDecodes(ref) {
    const file = sourcePath + 'js/runtime.js';
    const source = ref ? execFileSync('git', ['show', ref + ':' + file], { cwd: root, encoding: 'utf8' })
                       : fs.readFileSync(path.join(root, file), 'utf8');
    let decodes = 0, reads = 0;
    const context = vm.createContext({
        parse: value => { decodes++; return JSON.parse(value); },
        localStorage: { getItem: () => { reads++; return '{"data":true}'; } }
    });
    const start = source.indexOf('    function readSetting(setting)');
    const end = source.indexOf('    function registerSetting', start);
    vm.runInContext('var STORAGE_PREFIX="yt.leanback.default::"; var decodedSettings=Object.create(null);' + source.slice(start, end), context);
    vm.runInContext('for(var i=0;i<10000;i++) { if(!readSetting({key:"YOUTV_ADS",defaultValue:false})) throw Error("Incorrect setting"); }', context);
    return { lecturas: reads, decodificacionesJSON: decodes };
}
console.log(JSON.stringify({ ajustes: { anterior: settingDecodes(baseline), actual: settingDecodes(null) } }, null, 2));
