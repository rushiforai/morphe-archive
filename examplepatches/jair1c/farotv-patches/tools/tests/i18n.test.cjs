const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const { test } = require('node:test');
const main = path.resolve(__dirname, '../../extensions/extension/src/main');
const catalogs = Object.fromEntries(fs.readdirSync(path.join(main, 'locales')).filter(f => f.endsWith('.json'))
    .map(f => [f.slice(0, -5), JSON.parse(fs.readFileSync(path.join(main, 'locales', f), 'utf8'))]));

function page(language = 'es-PE', browser = 'en-US') {
    const intervals = [];
    const context = vm.createContext({
        __farotvTranslations: structuredClone(catalogs),
        document: { documentElement: { lang: language }, title: 'YouTube', adoptedStyleSheets: [], querySelector: () => null },
        navigator: { language: browser }, location: { hostname: 'www.youtube.com', href: 'https://www.youtube.com/tv', hash: '' },
        setTimeout: () => 0, clearTimeout: () => {}, setInterval: (fn, ms) => { intervals.push({ fn, ms }); return 0; },
        CSSStyleSheet: class { replaceSync() {} }, Intl
    });
    vm.runInContext(`window = this; class Storage { constructor() { this.data = {}; }
        getItem(k) { return this.data[k] || null; } setItem(k,v) { this.data[k] = v; } removeItem(k) { delete this.data[k]; } }
        localStorage = new Storage();
        _yttv = { registry: { ENABLE_PREVIEWS_WITH_SOUND: true }, defaults: new Map([['ENABLE_PREVIEWS_WITH_SOUND', true]]) };`, context);
    for (const name of ['i18n', 'runtime', 'ads', 'player', 'premium', 'ryd', 'shorts', 'sponsorblock', 'topics']) {
        vm.runInContext(fs.readFileSync(path.join(main, 'js', name + '.js'), 'utf8'), context, { filename: name + '.js' });
    }
    context.intervals = intervals;
    return context;
}

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
    for (const [language, prefix, label] of [['en', 'Skipped: ', 'sponsorship'], ['es', 'Se omitió: ', 'patrocinio']]) {
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
    }
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
