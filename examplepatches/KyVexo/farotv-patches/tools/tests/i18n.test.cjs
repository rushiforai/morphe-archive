const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const { test } = require('node:test');
const {execFileSync} = require('node:child_process');
const main = path.resolve(__dirname, '../../extensions/extension/src/main');
const catalogs = Object.fromEntries(fs.readdirSync(path.join(main, 'locales')).filter(f => f.endsWith('.json'))
    .map(f => [f.slice(0, -5), JSON.parse(fs.readFileSync(path.join(main, 'locales', f), 'utf8'))]));

function page(language = 'es-PE', browser = 'en-US', diagnostics = false, sourceRef = null) {
    const intervals = [];
    const styleWrites = [];
    const timers = new Map();
    let nextTimer = 1;
    let clock = 0;
    const observers = [];
    const context = vm.createContext({
        __farotvTranslations: structuredClone(catalogs),
        __farotvDiagnostics: diagnostics,
        performance: { now: () => ++clock, getEntriesByType: () => [] },
        URL,
        PerformanceObserver: class {
            static supportedEntryTypes = ['resource', 'longtask'];
            constructor(callback) { this.callback = callback; observers.push(this); }
            observe(options) { this.types = options.entryTypes; }
        },
        document: { documentElement: { lang: language }, title: 'YouTube', adoptedStyleSheets: [], querySelector: () => null },
        navigator: { language: browser }, location: { hostname: 'www.youtube.com', href: 'https://www.youtube.com/tv', hash: '' },
        setTimeout: (fn, ms) => { const id = nextTimer++; timers.set(id, { fn, ms }); return id; },
        clearTimeout: id => timers.delete(id), setInterval: (fn, ms) => { intervals.push({ fn, ms }); return 0; },
        CSSStyleSheet: class { replaceSync(css) { styleWrites.push(css); } }, Intl
    });
    vm.runInContext(`window = this; class Storage { constructor() { this.data = {}; }
        getItem(k) { return this.data[k] || null; } setItem(k,v) { this.data[k] = v; } removeItem(k) { delete this.data[k]; } }
        localStorage = new Storage();
        _yttv = { registry: { ENABLE_PREVIEWS_WITH_SOUND: true }, defaults: new Map([['ENABLE_PREVIEWS_WITH_SOUND', true]]) };`, context);
    for (const name of ['i18n', 'runtime', 'diagnostics', 'response-tree', 'ads', 'player', 'premium', 'ryd', 'shorts', 'sponsorblock', 'topics']) {
        if (sourceRef && name === 'response-tree') continue;
        const source = sourceRef ? execFileSync('git', ['show', sourceRef + ':extensions/extension/src/main/js/' + name + '.js'], {encoding:'utf8'})
            : fs.readFileSync(path.join(main, 'js', name + '.js'), 'utf8');
        vm.runInContext(source, context, { filename: name + '.js' });
    }
    context.intervals = intervals;
    context.styleWrites = styleWrites;
    context.timers = timers;
    context.observers = observers;
    return context;
}

test('performance diagnostics are inactive by default', () => {
    const p = page('en');
    assert.equal(p.observers.length, 0);
    assert.ok(!p.intervals.some(t => t.ms === 15000));
    assert.equal(p.youtv.performanceSnapshot(), null);
});

test('reinjecting icons keeps one sheet and reuses the image definitions', () => {
    const p = page('en');
    const source = fs.readFileSync(path.join(main, 'js/icons.js'), 'utf8');
    const initial = p.document.adoptedStyleSheets.length;
    vm.runInContext(source, p);
    const first = p.__farotvIconsSheet;
    const urls = p.youtv.iconUrls;
    for (let i = 0; i < 100; i++) vm.runInContext(source, p);
    assert.equal(p.document.adoptedStyleSheets.length, initial + 1);
    assert.equal(p.__farotvIconsSheet, first);
    assert.equal(p.youtv.iconUrls, urls);
    assert.ok(urls.length > 0);
    p.document.adoptedStyleSheets = p.document.adoptedStyleSheets.filter(sheet => sheet !== first);
    vm.runInContext(source, p);
    assert.notEqual(p.__farotvIconsSheet, first);
    assert.equal(p.document.adoptedStyleSheets.length, initial + 1);
});

test('icons retry after a stylesheet failure instead of marking a failed load as complete', () => {
    const p = page('en');
    let attempts = 0;
    p.CSSStyleSheet = class { replaceSync() { if (++attempts === 1) throw new Error('not ready'); } };
    const source = fs.readFileSync(path.join(main, 'js/icons.js'), 'utf8');
    assert.doesNotThrow(() => vm.runInContext(source, p));
    assert.equal(p.__farotvIconsSheet, undefined);
    vm.runInContext(source, p);
    assert.ok(p.__farotvIconsSheet);
    vm.runInContext(source, p);
    assert.equal(attempts, 2);
});

test('optional diagnostics aggregate durations without recording URLs or content and reset each window', () => {
    const p = page('en', 'en-US', true);
    const reports = [];
    p.youtv.report = message => reports.push(message);
    p.youtv.performanceSnapshot();
    vm.runInContext(`JSON.parse('{"private_content":"never_log_this"}')`, p);
    p.observers.find(o => o.types[0] === 'resource').callback({ getEntries: () => [{
        name: 'https://www.youtube.com/youtubei/v1/player?key=secret_key&videoId=private_id',
        duration: 1200, startTime: 100, responseStart: 350, initiatorType: 'fetch'
    }] });
    p.observers.find(o => o.types[0] === 'longtask').callback({ getEntries: () => [{ duration: 80 }] });
    const tick = p.intervals.find(t => t.ms === 15000).fn;
    tick();
    const report = JSON.parse(reports[0].slice(5));
    assert.equal(report.runtime.responses, 1);
    assert.ok(report.runtime.parseMs > 0);
    assert.ok(report.runtime.treeFilters.responses > 0);
    assert.equal(report.resources.player.count, 1);
    assert.equal(report.resources.player.maxMs, 1200);
    assert.equal(report.resources.player.ttfbMs, 250);
    assert.equal(report.longTasks.count, 1);
    assert.ok(!/secret_key|private_id|never_log_this|youtube\.com/.test(reports[0]));
    tick();
    const empty = JSON.parse(reports[1].slice(5));
    assert.equal(empty.runtime.responses, 0);
    assert.deepEqual(empty.resources, {});
    assert.equal(empty.longTasks.count, 0);
});

test('diagnostics tolerate browsers without PerformanceObserver', () => {
    const p = page('en');
    p.PerformanceObserver = undefined;
    p.__farotvDiagnostics = true;
    assert.doesNotThrow(() => vm.runInContext(fs.readFileSync(path.join(main, 'js/diagnostics.js'), 'utf8'), p));
    assert.ok(p.intervals.some(t => t.ms === 15000));
});

test('identical in-flight requests share one request and clear their timeout on delivery', () => {
    const p = page('en');
    const results = [];
    const ids = Array.from({ length: 100 }, () => p.youtv.request('https://returnyoutubedislikeapi.com/votes?videoId=dQw4w9WgXcQ', (status, body) => results.push([status, body])));
    assert.equal(new Set(ids).size, 1);
    assert.equal([...p.timers.values()].filter(t => t.ms === 60000).length, 1);
    const other = p.youtv.request('https://sponsor.ajay.app/api/skipSegments?videoID=dQw4w9WgXcQ', () => {});
    assert.notEqual(other, ids[0]);
    p.youtv.deliver(ids[0], 200, '{"dislikes":7}');
    assert.equal(results.length, 100);
    assert.ok(results.every(([status, body]) => status === 200 && body === '{"dislikes":7}'));
    p.youtv.deliver(ids[0], 200, '{}');
    assert.equal(results.length, 100);
    p.youtv.deliver(other, 404, '');
    assert.equal([...p.timers.values()].filter(t => t.ms === 60000).length, 0);
});

test('request timeouts allow retry, ignore late replies and isolate callback errors', () => {
    const p = page('en');
    const received = [];
    const url = 'https://returnyoutubedislikeapi.com/votes?videoId=dQw4w9WgXcQ';
    const expired = p.youtv.request(url, status => received.push(status));
    [...p.timers.values()].find(t => t.ms === 60000).fn();
    assert.deepEqual(received, [0]);
    const retry = p.youtv.request(url, () => { throw new Error('consumer'); });
    assert.notEqual(expired, retry);
    p.youtv.request(url, status => received.push(status));
    p.youtv.deliver(expired, 200, '{}');
    assert.deepEqual(received, [0]);
    p.youtv.deliver(retry, 503, '');
    assert.deepEqual(received, [0, 503]);
    assert.equal([...p.timers.values()].filter(t => t.ms === 60000).length, 0);
});

test('repeated RYD player responses share the native request and all receive the count', () => {
    const p = page('en');
    const responses = [];
    p.responseText = '{"transportControls":{"transportControlsRenderer":{"promotedActions":[{"button":{"likeButtonRenderer":{"target":{"videoId":"dQw4w9WgXcQ"}}}}]}}}';
    for (let i = 0; i < 100; i++) responses.push(vm.runInContext('JSON.parse(responseText)', p));
    assert.equal([...p.timers.values()].filter(t => t.ms === 60000).length, 1);
    p.youtv.deliver(1, 200, '{"dislikes":521904}');
    for (const response of responses) {
        assert.equal(response.transportControls.transportControlsRenderer.promotedActions[0].button.likeButtonRenderer.dislikeCountText.simpleText, '521.9K');
    }
    assert.equal([...p.timers.values()].filter(t => t.ms === 60000).length, 0);
});

test('RYD cache expires, evicts old videos and reuses number formatters by language', () => {
    const p = page('en');
    let requests = 0;
    let formatters = 0;
    const NativeNumberFormat = Intl.NumberFormat;
    p.Intl = { NumberFormat: function (...args) { formatters++; return new NativeNumberFormat(...args); } };
    p.mockNow = 0;
    vm.runInContext('Date.now = () => mockNow;', p);
    p.youtv.request = (url, done) => { requests++; done(200, '{"dislikes":521904}'); };
    function video(id) {
        p.responseText = JSON.stringify({ transportControls: { transportControlsRenderer: { promotedActions: [{ button: { likeButtonRenderer: { target: { videoId: id } } } }] } } });
        return vm.runInContext('JSON.parse(responseText)', p);
    }
    video('dQw4w9WgXcQ'); video('dQw4w9WgXcQ');
    assert.equal(requests, 1); assert.equal(formatters, 1);
    p.document.documentElement.lang = 'es';
    const translated = video('dQw4w9WgXcQ').transportControls.transportControlsRenderer.promotedActions[0].button.likeButtonRenderer;
    assert.equal(translated.dislikeCountText.simpleText.replace(/\s/g, ' '), '521,9 mil');
    assert.equal(formatters, 2); assert.equal(requests, 1);
    p.mockNow = 600001; video('dQw4w9WgXcQ'); assert.equal(requests, 2);
    for (let i = 0; i < 100; i++) video(String(i).padStart(11, '0'));
    assert.equal(requests, 102);
    video('dQw4w9WgXcQ'); assert.equal(requests, 103);
    assert.equal(formatters, 2);
});

test('repeated player responses avoid redundant CSS writes and toggles still apply immediately', () => {
    const p = page('es');
    const initial = p.styleWrites.length;
    const response = '{"transportControls":{"transportControlsRenderer":{"promotedActions":[]}}}';
    p.playerResponse = response;
    vm.runInContext('for (var i = 0; i < 500; i++) JSON.parse(playerResponse);', p);
    assert.equal(p.styleWrites.length - initial, 1);
    vm.runInContext(`localStorage.setItem('yt.leanback.default::YOUTV_PLAYER_RELATED', '{"data":true}'); JSON.parse(playerResponse);`, p);
    assert.equal(p.styleWrites.at(-1), 'ytlr-pivot { display: none !important; }');
    assert.equal(p.styleWrites.length - initial, 2);
    vm.runInContext(`localStorage.setItem('yt.leanback.default::YOUTV_PLAYER_RELATED', '{"data":false}'); JSON.parse(playerResponse);`, p);
    assert.equal(p.styleWrites.at(-1), '');
    assert.equal(p.styleWrites.length - initial, 3);
});

function settings(context) {
    return vm.runInContext(`JSON.parse(' {"items":[{"settingCategoryCollectionRenderer":{"categoryId":"SETTING_CAT_TVHTML5_ABOUT","items":[]}}]}')`, context);
}

test('catalogs contain the same nonempty keys and placeholders', () => {
    const tokens = value => [...value.matchAll(/\{([A-Za-z0-9_]+)\}/g)].map(m => m[1]).sort();
    for (const [language, catalog] of Object.entries(catalogs)) {
        assert.deepEqual(Object.keys(catalog).sort(), Object.keys(catalogs.en).sort(), language);
        for (const [key, value] of Object.entries(catalog)) {
            assert.equal(typeof value, 'string', language + '/' + key);
            assert.ok(value.trim(), language + '/' + key);
            assert.deepEqual(tokens(value), tokens(catalogs.en[key]), language + '/' + key);
        }
    }
});

test('dislike count formatting and accessibility follow the current language', () => {
    for (const [language, expected] of [['en', '521.9K'], ['es', '521,9 mil']]) {
        const p = page(language);
        p.youtv.request = (url, done) => done(200, '{"dislikes":521904}');
        const response = vm.runInContext(`JSON.parse('{"transportControls":{"transportControlsRenderer":{"promotedActions":[{"type":"TRANSPORT_CONTROLS_BUTTON_TYPE_LIKE_BUTTON","button":{"likeButtonRenderer":{"target":{"videoId":"dQw4w9WgXcQ"}}}}]}}}')`, p);
        const button = response.transportControls.transportControlsRenderer.promotedActions[0].button.likeButtonRenderer;
        assert.equal(button.dislikeCountText.simpleText.replace(/\s/g, ' '), expected);
        assert.match(button.dislikeCountText.accessibility.accessibilityData.label, language === 'en' ? /521904 dislikes/ : /521904 “No me gusta”/);
    }
});

test('SponsorBlock keeps skipping behavior and translates the visible notice', () => {
    for (const [language, prefix, label] of [['en', 'Skipped: ', 'sponsorship'], ['es', 'Se omitió: ', 'patrocinio'], ['ar', catalogs.ar['sponsor.skipped'], catalogs.ar['sponsor.sponsor.label']]]) {
        const p = page(language);
        const video = { paused: false, duration: 300, currentTime: 22 };
        const body = { children: [], appendChild(node) { this.children.push(node); node.parentNode = this; } };
        p.document.body = body;
        p.document.createElement = () => ({ children: [], appendChild(node) { this.children.push(node); } });
        p.document.createTextNode = text => ({ textContent: text });
        p.document.querySelector = () => video;
        p.location.hash = '#/watch?v=edkymo3w4Ms';
        p.youtv.request = (url, done) => done(200, '[{"category":"sponsor","segment":[21.5,72.8],"actionType":"skip"}]');
        p.intervals.find(x => x.ms === 400).fn();
        assert.equal(video.currentTime, 72.8);
        assert.equal(body.children[0].children[0].textContent, prefix);
        assert.equal(body.children[0].children[1].textContent, label);
        assert.equal(body.children[0].dir, language === 'ar' ? 'rtl' : 'ltr');
        p.location.hash = ''; p.intervals.find(x => x.ms === 400).fn();
        p.youtv.request = () => { throw Error('A cached replay must not access the network'); };
        p.location.hash = '#/watch?v=edkymo3w4Ms'; video.currentTime = 22;
        p.intervals.find(x => x.ms === 400).fn();
        assert.equal(video.currentTime, 72.8);

    }
});

test('Arabic regional settings, restart and direction preserve saved settings', () => {
    const p = page('ar-SA', 'en-US');
    assert.equal(p.youtv.locale(), 'ar');
    assert.equal(p.farotvI18n.direction(), 'rtl');
    assert.ok(catalogs.ar['microg.missing.message'].includes('\n\n'));
    const arabic = settings(p).items[1].settingCategoryCollectionRenderer;
    assert.equal(arabic.title.runs[0].text, catalogs.ar['section.title'].replace('{brand}', 'FaroTV'));
    assert.equal(arabic.items.length, 26);
    const shorts = arabic.items.find(x => x.settingBooleanRenderer.itemId === 'YOUTV_SHORTS').settingBooleanRenderer;
    const popup = shorts.enableServiceEndpoint.commandExecutorCommand.commands[1].confirmDialogEndpoint.content.confirmDialogRenderer;
    assert.equal(popup.confirmButton.buttonRenderer.text.runs[0].text, catalogs.ar['restart.confirm']);
    p.document.documentElement.lang = 'en';
    assert.equal(p.farotvI18n.direction(), 'ltr');
    const english = settings(p).items[1].settingCategoryCollectionRenderer;
    assert.deepEqual(Array.from(arabic.items, x => x.settingBooleanRenderer.itemId), Array.from(english.items, x => x.settingBooleanRenderer.itemId));
});

test('app language wins over browser; regional locales and English fallback work', () => {
    assert.equal(page('es-PE', 'en-US').youtv.t('restart.confirm'), 'Reiniciar');
    assert.equal(page('en-GB', 'es-ES').youtv.t('restart.confirm'), 'Restart');
    assert.equal(page('fr-FR', 'es-ES').youtv.t('restart.confirm'), 'Restart');
    assert.equal(page('', 'es-MX').youtv.locale(), 'es');
    const p = page('es');
    p.ytcfg = { get: key => key === 'INNERTUBE_CONTEXT' ? { client: { hl: 'en-US' } } : null };
    assert.equal(p.youtv.locale(), 'en');
    p.ytcfg = { get: () => { throw new Error('Not ready'); } };
    assert.equal(p.youtv.locale(), 'es');
});

test('missing keys fall back per string; substitution does not interpret dollar signs', () => {
    const p = page('es');
    delete p.__farotvTranslations.es['restart.confirm'];
    assert.equal(p.youtv.t('restart.confirm'), 'Restart');
    assert.equal(p.youtv.t('section.title', { brand: '$& <Faro>' }), '$& <Faro> Parches');
});

test('all 26 settings, About and restart commands switch language without changing stored IDs', () => {
    const p = page('es');
    const spanish = settings(p);
    const a = spanish.items[1].settingCategoryCollectionRenderer;
    assert.equal(a.title.runs[0].text, 'FaroTV Parches');
    assert.equal(a.items.length, 26);
    assert.equal(a.items[0].settingBooleanRenderer.title.runs[0].text, 'Bloquear anuncios');
    vm.runInContext(`localStorage.setItem('yt.leanback.default::YOUTV_PLAYER_LIKE', '{"data":true}');`, p);
    p.document.documentElement.lang = 'en-US';
    const english = settings(p);
    const b = english.items[1].settingCategoryCollectionRenderer;
    assert.equal(b.title.runs[0].text, 'FaroTV Patches');
    assert.equal(b.items[0].settingBooleanRenderer.title.runs[0].text, 'Block ads');
    assert.deepEqual(Array.from(a.items, x => x.settingBooleanRenderer.itemId), Array.from(b.items, x => x.settingBooleanRenderer.itemId));
    const shorts = b.items.find(x => x.settingBooleanRenderer.itemId === 'YOUTV_SHORTS').settingBooleanRenderer;
    const popup = shorts.enableServiceEndpoint.commandExecutorCommand.commands[1].confirmDialogEndpoint.content.confirmDialogRenderer;
    assert.equal(popup.title.runs[0].text, 'Restart required');
    assert.equal(popup.confirmButton.buttonRenderer.text.runs[0].text, 'Restart');
    assert.equal(popup.cancelButton.buttonRenderer.text.runs[0].text, 'Later');
    assert.match(english.items[0].settingCategoryCollectionRenderer.items[1].settingActionRenderer.summary.runs[0].text, /Created by Gabriel Jair/);
    assert.equal(p.localStorage.getItem('yt.leanback.default::YOUTV_PLAYER_LIKE'), '{"data":true}');
    for (const item of b.items) {
        const renderer = item.settingBooleanRenderer;
        assert.ok(!/^(feature|player|sponsor)\./.test(renderer.title.runs[0].text), renderer.itemId);
    }
});


test('cached setting decoding still observes native writes, removal, malformed values and storage failures', () => {
    const p = page();
    vm.runInContext(`probe = youtv.feature({id:'cache-probe', defaultEnabled:true});`, p);
    const key = 'yt.leanback.default::YOUTV_CACHE_PROBE';
    assert.equal(p.probe.enabled(), true);
    p.localStorage.setItem(key, '{"data":false}');
    for (let i=0; i<100; i++) assert.equal(p.probe.enabled(), false);
    p.localStorage.setItem(key, '{"data":true}');
    assert.equal(p.probe.enabled(), true);
    p.localStorage.setItem(key, 'broken');
    assert.equal(p.probe.enabled(), true);
    assert.equal(p.probe.enabled(), true);
    p.localStorage.setItem(key, '{"data":false}');
    assert.equal(p.probe.enabled(), false);
    p.localStorage.removeItem(key);
    assert.equal(p.probe.enabled(), true);
    p.localStorage.getItem = () => { throw Error('unavailable'); };
    assert.equal(p.probe.enabled(), true);
});

test('SponsorBlock reuses bounded expiring responses by video and categories without caching failures', () => {
    const p = page();
    p.now = 1000;
    vm.runInContext('Date.now = () => now;', p);
    const calls = [];
    p.youtv.request = (url, callback) => calls.push({url, callback});
    const tick = p.intervals.find(t => t.ms === 400).fn;
    function visit(id) { p.location.hash = '#/watch?v=' + id; tick(); }
    function leave() { p.location.hash = ''; tick(); }
    visit('abcdefghijk'); calls.at(-1).callback(404, 'Not Found'); leave(); visit('abcdefghijk');
    assert.equal(calls.length, 1);
    leave(); p.localStorage.setItem('yt.leanback.default::YOUTV_SPONSORBLOCK_INTRO', '{"data":true}');
    visit('abcdefghijk'); assert.equal(calls.length, 2);
    calls.at(-1).callback(500, 'failure'); leave(); visit('abcdefghijk');
    assert.equal(calls.length, 3);
    calls.at(-1).callback(200, '[]'); leave(); visit('abcdefghijk');
    assert.equal(calls.length, 3);
    leave(); p.now += 5*60*1000; visit('abcdefghijk');
    assert.equal(calls.length, 4);
    calls.at(-1).callback(200, '[]');
    for(let i=0;i<50;i++) { leave(); visit(String(i).padStart(11,'0')); calls.at(-1).callback(404, ''); }
    leave(); visit('abcdefghijk'); assert.equal(calls.length, 55);
});


test('branding yields between CSS scan slices and preserves rule order and later sheets', () => {
    const p = page('es', 'en', true);
    p.__youtvBranding = 'FaroTV';
    function rule(n) {
        return { selectorText: '.rule' + n, style: {0:'color',length:1,cssText:'color: rgb(255, 0, 0)',getPropertyValue: () => 'rgb(255, 0, 0)' } };
    }
    const first = Array.from({length: 200}, (_,i) => rule(i));
    p.document.styleSheets = [{cssRules: first}, {cssRules: [{cssRules:[rule(200)]}]}];
    const source = fs.readFileSync(path.join(main,'js/branding.js'),'utf8');
    vm.runInContext(source,p);
    assert.equal(p.__farotvBrandingPerformance.rules, 0, 'the initial scan must yield');
    function flush() {
        let count=0;
        while(true) {
            const timer = [...p.timers].find(([,t]) => t.ms === 0);
            if(!timer) return;
            p.timers.delete(timer[0]); timer[1].fn();
            if(++count>10000) throw Error('Unbounded scan');
        }
    }
    flush();
    assert.equal(p.__farotvBrandingPerformance.rules, 202);
    assert.ok(p.__farotvBrandingPerformance.slices > 1);
    const css=p.styleWrites.find(s=>s.includes('.rule200'));
    assert.ok(css.indexOf('.rule0 ') < css.indexOf('.rule199 '));
    assert.ok(css.indexOf('.rule199 ') < css.indexOf('.rule200 '));
    const passes=p.__farotvBrandingPerformance.passes;
    const poll=p.intervals.find(t=>t.ms===2000).fn;
    poll(); flush(); assert.equal(p.__farotvBrandingPerformance.passes,passes);
    p.document.styleSheets.push({cssRules:[rule(201)]});
    poll(); flush();
    assert.equal(p.__farotvBrandingPerformance.passes,passes+1);
    assert.ok(p.styleWrites.at(-1).includes('.rule201'));
    assert.equal(p.styleWrites.at(-1).match(/\.rule0 /g).length,1);
    vm.runInContext(source,p); flush();
    assert.equal(p.__farotvBrandingPerformance.passes,passes+1);
});

test('branding slices fall back without performance API and ignore unreadable sheets', () => {
    const p=page(); p.__youtvBranding='FaroTV'; p.performance=undefined;
    p.document.styleSheets=[{get cssRules(){throw Error('cross origin');}}, {cssRules:[]}];
    vm.runInContext(fs.readFileSync(path.join(main,'js/branding.js'),'utf8'),p);
    for(let i=0;i<100;i++) {
        const timer=[...p.timers].find(([,t])=>t.ms===0);
        if(!timer)break;
        p.timers.delete(timer[0]); assert.doesNotThrow(()=>timer[1].fn());
    }
    assert.equal(p.__farotvBrandingPerformance,undefined);
});


test('full runtime keeps native switches and player output equivalent with shared filters', () => {
    const old=page('es','en',false,'v1.7.0-dev.10');const current=page();
    const input={contents:{items:[{tileRenderer:{title:'keep'}},{adSlotRenderer:{}},{mealbarPromoRenderer:{}},
        {shelfRenderer:{tvhtml5ShelfRendererType:'TVHTML5_SHELF_RENDERER_TYPE_SHORTS'}}]},
        adPlacements:[],transportControls:{transportControlsRenderer:{promotedActions:[
            {type:'TRANSPORT_CONTROLS_BUTTON_TYPE_LIKE_BUTTON',button:{likeButtonRenderer:{target:{videoId:'abcdefghijk'}}}},
            {button:{upsellDialogRenderer:{}}}]}}};
    for(let mask=0;mask<8;mask++){
        for(const p of [old,current]){
            ['ADS','PREMIUM_PROMOS','SHORTS'].forEach((key,i)=>p.localStorage.setItem('yt.leanback.default::YOUTV_'+key,JSON.stringify({data:!!(mask&(1<<i))})));
            p.localStorage.setItem('yt.leanback.default::YOUTV_PLAYER_LIKE','{"data":true}');
            p.payload=JSON.stringify(input);
        }
        const a=vm.runInContext('JSON.stringify(JSON.parse(payload))',old);
        const b=vm.runInContext('JSON.stringify(JSON.parse(payload))',current);
        assert.deepEqual(JSON.parse(b),JSON.parse(a),'mask '+mask);
    }
    const diagnostic=page('es','en',true);
    diagnostic.payload=JSON.stringify(input);vm.runInContext('JSON.parse(payload)',diagnostic);
    const snap=diagnostic.youtv.performanceSnapshot();assert.equal(snap.treeFilters.walks,1);assert.equal(snap.treeFilters.rules,3);
});
