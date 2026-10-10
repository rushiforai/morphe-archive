const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const root = path.resolve(__dirname, '../../patches/src/main/resources/reactnative');

function install(file, symbol, placeholder, original) {
    let policy;
    const context = vm.createContext({console: {info() {}},
        RN$registerCallableModule(name, factory) { policy = factory(); }});
    const React = {
        useSyncExternalStore(subscribe, snapshot) { return snapshot(); },
        useMemo(factory) { return factory(); },
        createElement(type, props) { return {type, props}; }
    };
    vm.runInContext(fs.readFileSync(path.join(root, 'bootstrap.js'), 'utf8')
        .replace('__TWITCH_REACT_MODULE__', '7'), context);
    vm.runInContext(fs.readFileSync(path.join(root, file), 'utf8').replace(placeholder, '12'), context);
    let factory;
    context.__d = function (value) { factory = value; };
    context.__d(function (global, require, a, b, module, exports) { exports[symbol] = original; }, 12, []);
    const module = {exports: {}};
    factory(context, () => React, null, null, module, module.exports, []);
    return {render: module.exports[symbol], theme(light) { policy.set(...Array(11).fill(false), light); }};
}

test('feed theme updates preserve identity, route and the original component', () => {
    const original = () => {};
    const state = install('theme.js', 'AppCore', '__TWITCH_APP_CORE_MODULE__', original);
    const identity = {colorScheme: 'dark', userId: 'fixture', authSession: {token: 'fixture'}};
    const route = {name: 'DiscoveryFeed'};
    const props = {identity, initialRoute: route};
    assert.equal(state.render(props).props.identity, identity, 'keeps native props until policy arrives');
    for (const light of [true, false, true]) {
        state.theme(light);
        const result = state.render(props);
        assert.equal(result.type, original);
        assert.equal(result.props.identity.colorScheme, light ? 'light' : 'dark');
        assert.equal(result.props.identity.authSession, identity.authSession);
        assert.equal(result.props.initialRoute, route);
        assert.equal(identity.colorScheme, 'dark', 'does not mutate native props');
    }
});

test('DJ settings retain rendition availability and the original actions', () => {
    const original = () => {};
    const state = install('playback-settings.js', 'PlaybackSettingsSheet', '__TWITCH_PLAYBACK_SETTINGS_MODULE__', original);
    const actions = {onAudioOnlyChange() {}, onBgaSettingChange() {}, onPipAutoPopoutChange() {}};
    for (const hasAudioRendition of [false, true]) {
        const props = {...actions, isParticipatingDJ: true, hasAudioRendition, audioOnly: false,
            bgaSetting: 'never', pipAutoPopout: false, drmEnabled: true};
        const result = state.render(props);
        assert.equal(result.type, original);
        assert.equal(result.props.isParticipatingDJ, false);
        assert.equal(result.props.hasAudioRendition, hasAudioRendition);
        assert.equal(result.props.drmEnabled, true);
        assert.equal(result.props.bgaSetting, 'never');
        assert.equal(result.props.pipAutoPopout, false);
        for (const key of Object.keys(actions)) assert.equal(result.props[key], actions[key]);
        assert.equal(props.isParticipatingDJ, true, 'the channel model remains intact');
    }
    const ordinary = {...actions, isParticipatingDJ: false};
    assert.deepEqual(state.render(ordinary).props, ordinary);
});
