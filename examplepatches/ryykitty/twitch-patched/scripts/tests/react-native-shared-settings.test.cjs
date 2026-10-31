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
    vm.runInContext(fs.readFileSync(path.join(root, file), 'utf8').replace(placeholder, '12')
        .replace('__TWITCH_PLAYBACK_SETTINGS_MODULE__', '13').replace('__TWITCH_BACKGROUND_AUDIO_MODULE__', '13')
        .replace('__TWITCH_AUDIO_RENDITION_MODULE__', '13').replace('__TWITCH_BACKGROUND_VETO_MODULE__', '13'), context);
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
    const original = props => ({type: 'PlaybackSheet', props});
    const state = install('playback-settings.js', 'PlaybackSettingsSheet', '__TWITCH_PLAYBACK_SETTINGS_MODULE__', original);
    const actions = {onAudioOnlyChange() {}, onBgaSettingChange() {}, onPipAutoPopoutChange() {}};
    for (const hasAudioRendition of [false, true]) {
        const props = {...actions, isParticipatingDJ: true, hasAudioRendition, audioOnly: false,
            bgaSetting: 'never', pipAutoPopout: false, drmEnabled: true};
        const result = state.render(props);
        assert.equal(result.type, 'PlaybackSheet');
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

test('DJ background playback uses the normal lifecycle and respects the selected preference', () => {
    const decisions = [];
    function manager(props) {
        return state => {
            if (state === 'background' && props.isPlaying && !props.isPipActive) {
                if (props.playInBackground && !props.isParticipatingDJ) props.audioOnlyMode.beginBackgroundAudio();
                else props.onPlayingChange(false);
            }
            if (state === 'active') props.audioOnlyMode.endBackgroundAudio();
        };
    }
    const state = install('playback-settings.js', 'BackgroundAudioManager', '__TWITCH_BACKGROUND_AUDIO_MODULE__', manager);
    const props = {isParticipatingDJ: true, isPlaying: true, isPipActive: false, playInBackground: true,
        audioOnlyMode: {beginBackgroundAudio() { decisions.push('begin'); }, endBackgroundAudio() { decisions.push('end'); }},
        onPlayingChange(value) { decisions.push(value); }};
    const lifecycle = state.render(props);
    lifecycle('background');
    lifecycle('active');
    state.render({...props, playInBackground: false})('background');
    state.render({...props, isPlaying: false})('background');
    state.render({...props, isPipActive: true})('background');
    assert.deepEqual(decisions, ['begin', 'end', false]);
    assert.equal(props.isParticipatingDJ, true);
});

test('DJ background veto preserves chat-only and the saved playback preference', () => {
    const veto = install('playback-settings.js', 'backgroundAudioVeto', '__TWITCH_BACKGROUND_VETO_MODULE__',
        props => props.isParticipatingDJ || props.chatOnly ? 'never' : undefined);
    for (const saved of ['always', 'headphones', 'never']) {
        const props = {isParticipatingDJ: true, chatOnly: false};
        assert.equal(veto.render(props) ?? saved, saved);
        assert.equal(veto.render({...props, chatOnly: true}), 'never');
        assert.equal(props.isParticipatingDJ, true);
    }
});

test('DJ audio rendition policy keeps player, available qualities and lifecycle inputs', () => {
    const state = install('playback-settings.js', 'useAudioOnlyRendition', '__TWITCH_AUDIO_RENDITION_MODULE__', props => props);
    const props = {isParticipatingDJ: true, playerApiRef: {}, qualities: [], audioOnly: false,
        playInBackground: false, isPlaying: false, isPipSettled: true, isPlayingExternally: true};
    const result = state.render(props);
    assert.equal(result.isParticipatingDJ, false);
    for (const key of Object.keys(props).filter(key => key !== 'isParticipatingDJ'))
        assert.equal(result[key], props[key]);
    assert.equal(props.isParticipatingDJ, true);
});
