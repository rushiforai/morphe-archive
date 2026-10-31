const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const root = path.resolve(__dirname, '../../patches/src/main/resources/reactnative');

function install(djFirst = true) {
    const callable = {};
    const context = vm.createContext({console: {info() {}},
        RN$registerCallableModule(name, factory) { callable[name] = factory(); }});
    const React = {
        createElement(type, props, ...children) { return {type, props: children.length ? {...props,
            children: children.length === 1 ? children[0] : children} : props}; },
        isValidElement(element) { return !!element && !!element.type && !!element.props; },
        cloneElement(element, props) { return {type: element.type, props: {...element.props, ...props}}; },
        Children: {toArray(children) { return Array.isArray(children) ? [...children] : [children]; }},
        useSyncExternalStore(subscribe, snapshot) { return snapshot(); }
    };
    const opened = [];
    const Row = () => {};
    const Sheet = () => {};
    Sheet.Item = () => {};
    const modules = {7: React, 12: {BottomSheet: Sheet}, 13: {SettingsListItem: Row},
        14: {Linking: {openURL(url) { opened.push(url); return Promise.resolve(); }}},
        15: {PlaybackSettingsSheet: props => React.createElement('Fragment', {children: [React.createElement(Sheet, props), 'report-dialog']})},
        16: {ChatSettingsSheet: props => React.createElement(Sheet, props)}};
    vm.runInContext(fs.readFileSync(path.join(root, 'bootstrap.js'), 'utf8').replace('__TWITCH_REACT_MODULE__', '7'), context);
    const loadDj = () => vm.runInContext(fs.readFileSync(path.join(root, 'playback-settings.js'), 'utf8')
        .replace('__TWITCH_PLAYBACK_SETTINGS_MODULE__', '15').replace('__TWITCH_BACKGROUND_AUDIO_MODULE__', '17')
        .replace('__TWITCH_AUDIO_RENDITION_MODULE__', '18').replace('__TWITCH_BACKGROUND_VETO_MODULE__', '19'), context);
    if (djFirst) loadDj();
    vm.runInContext(fs.readFileSync(path.join(root, 'ui-settings.js'), 'utf8')
        .replace('__TWITCH_UI_SHEET_MODULE__', '12').replace('__TWITCH_UI_ROW_MODULE__', '13')
        .replace('__TWITCH_UI_PLAYBACK_MODULE__', '15').replace('__TWITCH_UI_CHAT_SETTINGS_MODULE__', '16')
        .replace('__TWITCH_UI_NATIVE_MODULE__', '14'), context);
    if (!djFirst) loadDj();
    let factory;
    context.__d = value => { factory = value; };
    for (const [id, symbol] of [[15, 'PlaybackSettingsSheet'], [16, 'ChatSettingsSheet']]) {
        const original = modules[id][symbol];
        context.__d((global, require, a, b, module, exports) => { exports[symbol] = original; }, id, []);
        factory(context, id => modules[id], null, null, {exports: modules[id]}, modules[id], []);
    }
    return {render: props => modules[15].PlaybackSettingsSheet(props).props.children[0],
        playback: modules[15].PlaybackSettingsSheet, chat: modules[16].ChatSettingsSheet,
        Sheet, Row, opened, ui: context.__twitchPatchRuntime.ui, set: callable.TwitchPatchUi.set, React};
}

test('V2 playback and chat sheets receive one native UI settings entry with their original close action', async () => {
    const state = install();
    const child = {type: 'View', props: {testID: 'playback-settings-sheet', children: ['existing-controls']}};
    let closed = 0;
    const close = () => { closed++; };
    const props = {children: child, visible: true, onClose: close, title: 'Localized title', footer: 'footer'};
    const result = state.render(props);
    assert.equal(result.type, state.Sheet);
    assert.equal(result.props.onClose, close);
    assert.equal(result.props.footer, 'footer');
    const children = result.props.children;
    assert.equal(children[0].type, state.Row);
    assert.equal(children[0].props.title, 'UI settings');
    assert.equal(children[1], child);
    children[0].props.onPress();
    assert.equal(closed, 1);
    assert.deepEqual(state.opened, ['twitch-patches://settings/ui']);
    assert.equal(child.props.children.length, 1, 'original element remains unchanged');
    assert.equal(state.render(props).props.children.length, 2, 'rerenders do not duplicate rows');
    assert.equal(state.render({...props, children}).props.children.length, 2, 'existing rows are not duplicated');
    const chatBody = {type: 'ChatSettingsBody', props: {settings: {chatSize: 'low'}}};
    const chat = state.chat({...props, children: chatBody});
    assert.equal(chat.props.children[0].type, state.Row);
    assert.equal(chat.props.children[1], chatBody);
    assert.equal(state.playback(props).props.children[1], 'report-dialog');
    assert.equal(state.Sheet.Item instanceof Function, true, 'shared BottomSheet is untouched');
});

test('UI navigation and DJ settings coexist in either adapter registration order', () => {
    for (const first of [true, false]) {
        const state = install(first);
        const props = {isParticipatingDJ: true, hasAudioRendition: false, onAudioOnlyChange() {}, onClose() {}, children: null};
        const result = state.render(props);
        assert.equal(result.props.isParticipatingDJ, false);
        assert.equal(result.props.hasAudioRendition, false);
        assert.equal(result.props.onAudioOnlyChange, props.onAudioOnlyChange);
        assert.equal(result.props.children[0].props.testID, 'twitch-patches-ui-settings');
        assert.equal(props.isParticipatingDJ, true);
    }
});

test('UI preferences update live and omitted keys remain disabled', () => {
    const state = install();
    let updates = 0;
    const unsubscribe = state.ui.subscribe(() => { updates++; });
    assert.equal(state.ui.enabled('hide_clip'), false);
    state.set('{"hide_clip":true,"hide_share":false,"invalid-key":true,"string_value":"true"}');
    assert.equal(state.ui.useEnabled(state.React, 'hide_clip'), true);
    assert.equal(state.ui.enabled('hide_share'), false);
    assert.equal(state.ui.enabled('invalid-key'), false);
    assert.equal(state.ui.enabled('string_value'), false);
    state.set('{"hide_clip":true,"hide_share":false}');
    assert.equal(updates, 1, 'identical state does not rerender');
    state.set('{}');
    assert.equal(state.ui.enabled('hide_clip'), false);
    assert.equal(updates, 2);
    unsubscribe();
    state.set('{"hide_clip":true}');
    assert.equal(updates, 2);
    state.set('broken');
    state.set('null');
    state.set('[]');
    assert.equal(state.ui.enabled('hide_clip'), true, 'malformed payload does not reset valid state');
});
