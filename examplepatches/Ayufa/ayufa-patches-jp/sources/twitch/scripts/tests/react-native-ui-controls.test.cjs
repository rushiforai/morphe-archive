const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const root = path.resolve(__dirname, '../../patches/src/main/resources/reactnative');

function fixture(skyline = false) {
    const adapters = {}, preferences = {}, modules = {};
    const runtime = {ui: {useEnabled(React, key) { return preferences[key] === true; }}, log() {},
        target(id, name, adapter) { adapters[name] = adapter; }, decorate(id, name, adapter) { adapters[name] = adapter; }};
    const React = {
        createElement(type, props, ...children) { return {type, props: children.length ? {...props, children: children.length === 1 ? children[0] : children} : props}; },
        isValidElement(node) { return Boolean(node && node.type && node.props); },
        cloneElement(node, props) { return {type: node.type, props: {...node.props, ...props}}; },
        createContext(value) { return {current: value, Provider: 'Provider'}; },
        useContext(context) { return context.current; }
    };
    const source = fs.readFileSync(path.join(root, 'ui-controls.js'), 'utf8')
        .replace('__TWITCH_UI_SKYLINE_ROW_EXPORT__', skyline ? 'SkylineSupportActionRow' : 'SupportActionRow')
        .replace(/__TWITCH_UI_[A-Z_]+_MODULE__/g, '10');
    vm.runInNewContext(source, {globalThis: {__twitchPatchRuntime: runtime}});
    return {React, runtime, preferences, adapters, modules,
        adapt(name, original) { return adapters[name](original, React, runtime, () => modules); }};
}

test('retired whole-row preferences cannot hide remaining controls', () => {
    const f = fixture(), original = () => {}, props = {buttons: [{kind: 'follow'}, {kind: 'subscribe'}]};
    const render = f.adapt('SupportActionRow', original);
    f.preferences.classic_support_hide_row = true;
    assert.equal(render(props).props, props);
    assert.equal(render({...props, twitchPatchUiLayout: 'vertical'}).type, original);
    assert.equal(render({...props, twitchPatchUiLayout: 'vertical_header'}).type, original);
    f.preferences.classic_support_hide_row = false;
    assert.equal(render(props).props, props);
    assert.equal(f.preferences.classic_support_hide_subscribe, undefined);
});

test('vertical action rows collapse and restore with their visible buttons', () => {
    const f = fixture(), Row = () => {};
    f.modules.SupportActionRow = Row;
    const tree = f.React.createElement('View', {children: f.React.createElement(Row, {buttons: [{kind: 'subscribe'}, {kind: 'gift'}]})});
    let calls = 0;
    const render = f.adapt('SkylineSheetActions', () => { calls++; return tree; });
    f.preferences.vertical_support_hide_subscribe = true;
    f.preferences.vertical_support_hide_gift = true;
    assert.equal(render({}), null);
    assert.equal(calls, 1);
    f.preferences.vertical_support_hide_gift = false;
    assert.deepEqual(Array.from(render({}).props.children.props.buttons, button => button.kind), ['gift']);
    assert.equal(calls, 2);
    f.preferences.vertical_support_hide_subscribe = false;
    assert.equal(render({}).props.children.props.buttons, tree.props.children.props.buttons);
});

test('separate Skyline support rows retain their layout preferences and callbacks', () => {
    const f = fixture(true), e = f.React.createElement;
    const Row = () => {}, Generic = () => {}, onOpenGift = () => {};
    f.modules.SkylineSupportActionRow = Row;
    f.modules.SupportActionRow = Generic;
    const props = {buttons: [{kind: 'subscribe'}, {kind: 'gift'}], onOpenGift};
    const host = f.adapt('SkylineSheetActions', () => e('View', {children: e(Row, props)}));
    const render = f.adapt('SkylineSupportActionRow', Row);
    f.preferences.vertical_support_hide_subscribe = true;
    const nested = host({}).props.children;
    assert.equal(nested.props.twitchPatchUiLayout, 'vertical');
    assert.deepEqual(Array.from(render(nested.props).props.buttons, button => button.kind), ['gift']);
    assert.equal(render(nested.props).props.onOpenGift, onOpenGift);
    assert.equal(f.adapt('SupportActionRow', Generic)(props).props, props);
    f.preferences.vertical_support_hide_gift = true;
    assert.equal(host({}), null);
    f.preferences.vertical_support_hide_subscribe = false;
    assert.deepEqual(Array.from(host({}).props.children.props.buttons, button => button.kind), ['subscribe']);
});

test('hiding controls removes their wrappers and preserves the remaining order and actions', () => {
    const f = fixture(), e = f.React.createElement;
    const press = () => {};
    const bits = e('Tooltip', {children: e('Button', {testID: 'row-bits'})});
    const subscribe = e('Button', {testID: 'row-subscribe', onPress: press});
    const gift = e('Button', {testID: 'row-gift'});
    const row = e('View', {style: {flexDirection: 'row'}, children: [subscribe, bits, gift]});
    assert.equal(f.runtime.ui.filterControls(f.React, row, {bits: false}), row);
    const result = f.runtime.ui.filterControls(f.React, row, {bits: true});
    assert.deepEqual(Array.from(result.props.children), [subscribe, gift]);
    assert.equal(result.props.children[0].props.onPress, press);
    assert.equal(result.props.style, row.props.style);
    assert.equal(row.props.children.length, 3);
    assert.equal(f.runtime.ui.filterControls(f.React, row, {bits: true, subscribe: true, gift: true}), null);
});

test('native support models filter before layout and keep Follow and notifications intact', () => {
    const f = fixture(), original = () => {};
    const render = f.adapt('SupportActionRow', original);
    const props = {buttons: [{kind: 'follow'}, {kind: 'gift'}, {kind: 'subscribe'}, {kind: 'upgrade'}], onOpenSubscribe() {}};
    assert.equal(render(props).props, props);
    f.preferences.classic_support_hide_subscribe = true;
    assert.deepEqual(Array.from(render(props).props.buttons, button => button.kind), ['follow', 'gift']);
    assert.equal(render(props).props.onOpenSubscribe, props.onOpenSubscribe);
    assert.equal(props.buttons.length, 4);
    const vertical = {...props, twitchPatchUiLayout: 'vertical'};
    assert.equal(render(vertical).props, vertical);
    f.preferences.vertical_support_hide_gift = true;
    assert.deepEqual(Array.from(render(vertical).props.buttons, button => button.kind), ['follow', 'subscribe', 'upgrade']);
    const notificationSettings = {notificationSetting: 'always', notificationsLoaded: true, onOpenSubscribe() {}};
    f.preferences.classic_support_hide_gift = true;
    assert.equal(render({...notificationSettings, buttons: [{kind: 'subscribe'}, {kind: 'gift'}]}), null);
    const follow = render({...notificationSettings, buttons: [{kind: 'follow'}, {kind: 'subscribe'}]});
    assert.equal(follow.type, original);
    assert.deepEqual(Array.from(follow.props.buttons, button => button.kind), ['follow']);
    assert.equal(follow.props.notificationSetting, 'always');
    assert.equal(follow.props.onOpenSubscribe, notificationSettings.onOpenSubscribe);
});

test('chat Bits visibility follows its layout and restores the original availability', () => {
    const f = fixture(), original = () => {}, props = {showBitsButton: true, onOpenQuickCheering() {}};
    const render = f.adapt('ChatComposerBar', original);
    f.preferences.vertical_support_hide_bits = true;
    assert.equal(render(props).props, props);
    f.preferences.classic_support_hide_bits = true;
    assert.equal(render(props).props.showBitsButton, false);
    assert.equal(render(props).props.onOpenQuickCheering, props.onOpenQuickCheering);
    f.React.useContext = () => 'vertical';
    assert.equal(render(props).props.showBitsButton, false);
    f.preferences.vertical_support_hide_bits = false;
    assert.equal(render(props).props, props);
    const unavailable = {...props, showBitsButton: false};
    assert.equal(render(unavailable).props, unavailable);
    assert.equal(props.showBitsButton, true);
});

test('classic and vertical player controls observe separate options without hiding Reload or volume', () => {
    const f = fixture(), e = f.React.createElement;
    const Clip = () => {}, Row = () => {};
    f.modules.TheatreClipButton = Clip;
    f.modules.SupportActionRow = Row;
    const tree = e('View', {children: [e(Clip, {}), e('Button', {testID: 'player-controls-cast'}),
        e('Button', {testID: 'player-controls-mute'}), e('Button', {testID: 'player-controls-reload'})]});
    const classic = f.adapt('PlayerControlsOverlay', () => tree);
    const vertical = f.adapt('SkylineControlsOverlay', () => tree);
    assert.equal(classic({}), tree);
    f.preferences.classic_controls_hide_clip = true;
    f.preferences.classic_controls_hide_cast = true;
    assert.deepEqual(Array.from(classic({}).props.children, node => node.props.testID), ['player-controls-mute', 'player-controls-reload']);
    assert.equal(vertical({}), tree);
    f.preferences.classic_controls_hide_clip = false;
    f.preferences.classic_controls_hide_cast = false;
    assert.equal(classic({}), tree);
});

test('vertical support hosts mark their own rows and leave unrelated children unchanged', () => {
    const f = fixture(), e = f.React.createElement;
    const Row = () => {}, unrelated = e('Button', {});
    f.modules.SupportActionRow = Row;
    const tree = e('View', {children: [unrelated, e(Row, {buttons: []})]});
    const render = f.adapt('SkylineSheetActions', () => tree);
    const result = render({});
    assert.equal(result.props.children[0], unrelated);
    assert.equal(result.props.children[1].props.twitchPatchUiLayout, 'vertical');
    assert.equal(tree.props.children[1].props.twitchPatchUiLayout, undefined);
});

test('ambiguous deep trees fail without partially removing controls', () => {
    const f = fixture(), e = f.React.createElement;
    let tree = e('Button', {testID: 'row-bits'});
    for (let i = 0; i < 40; i++) tree = e('View', {children: tree});
    assert.equal(f.runtime.ui.filterControls(f.React, tree, {bits: true}), tree);
});

test('vertical header hides Gift and Leaderboard independently and collapses empty action wrappers', () => {
    const f = fixture(), e = f.React.createElement;
    const Row = () => {}, Trophy = () => {}, press = () => {};
    f.modules.SupportActionRow = Row;
    f.modules.SkylineLeaderboardTrophy = Trophy;
    const gift = e(Row, {buttons: [{kind: 'gift'}], onOpenSubscribe: press});
    const trophy = e(Trophy, {});
    const tree = e('ThemeRegion', {style: {flexDirection: 'row', gap: 4}, children: [gift, trophy]});
    const render = f.adapt('SkylineBandActions', () => tree);
    assert.equal(render({}).props.children[1], trophy);
    f.preferences.vertical_header_hide_leaderboard = true;
    let result = render({});
    assert.equal(result.props.children.length, 1);
    assert.equal(result.props.children[0].props.onOpenSubscribe, press);
    f.preferences.vertical_header_hide_gift = true;
    assert.equal(render({}), null);
    f.preferences.vertical_header_hide_leaderboard = false;
    result = render({});
    assert.deepEqual(Array.from(result.props.children), [trophy]);
    assert.equal(result.props.style, tree.props.style);
    assert.equal(tree.props.children.length, 2);
    f.preferences.vertical_header_hide_gift = false;
    assert.equal(render({}).props.children.length, 2);
    f.preferences.vertical_support_hide_gift = true;
    assert.equal(render({}).props.children.length, 2, 'channel action preference does not affect the header');
    assert.equal(render({}).props.children[0].props.twitchPatchUiLayout, 'vertical_header');
    f.preferences.vertical_header_hide_leaderboard = true;
    const leaderboardOnly = e('View', {children: [e(Row, {buttons: []}), trophy]});
    assert.equal(f.adapt('SkylineBandActions', () => leaderboardOnly)({}), null);
});

test('header options retain Follow and Subscribe and do not affect other vertical actions', () => {
    const f = fixture(), e = f.React.createElement, Row = () => {}, Trophy = () => {};
    f.modules.SupportActionRow = Row;
    f.modules.SkylineLeaderboardTrophy = Trophy;
    const buttons = [{kind: 'follow'}, {kind: 'subscribe'}, {kind: 'gift'}];
    const tree = e('View', {children: [e(Row, {buttons}), e(Trophy, {})]});
    const header = f.adapt('SkylineBandActions', () => tree);
    const sheet = f.adapt('SkylineSheetActions', () => tree);
    f.preferences.vertical_header_hide_gift = true;
    f.preferences.vertical_header_hide_leaderboard = true;
    assert.deepEqual(Array.from(header({}).props.children[0].props.buttons, button => button.kind), ['follow', 'subscribe']);
    assert.equal(sheet({}).props.children[0].props.buttons, buttons);
    assert.equal(sheet({}).props.children[1], tree.props.children[1]);
    f.preferences.vertical_support_hide_subscribe = true;
    assert.deepEqual(Array.from(header({}).props.children[0].props.buttons, button => button.kind), ['follow', 'subscribe']);
    f.preferences.vertical_header_hide_subscribe = true;
    assert.deepEqual(Array.from(header({}).props.children[0].props.buttons, button => button.kind), ['follow']);
    let deep = tree;
    for (let i = 0; i < 40; i++) deep = e('View', {children: deep});
    assert.equal(f.adapt('SkylineBandActions', () => deep)({}), deep);
});

test('UI decorators coexist with the Reload adapter in either registration order', () => {
    for (const first of [true, false]) {
        const context = vm.createContext({console: {info() {}}, RN$registerCallableModule() {}});
        vm.runInContext(fs.readFileSync(path.join(root, 'bootstrap.js'), 'utf8').replace('__TWITCH_REACT_MODULE__', '7'), context);
        const runtime = context.__twitchPatchRuntime;
        const decorate = () => runtime.decorate(9, 'PlayerControlsOverlay', original => props => [...original(props), 'ui']);
        const reload = () => runtime.target(9, 'PlayerControlsOverlay', original => props => [...original(props), 'reload']);
        if (first) { decorate(); reload(); } else { reload(); decorate(); }
        assert.throws(reload, /Duplicate/);
        let factory;
        context.__d = value => { factory = value; };
        context.__d((global, require, a, b, module) => { module.exports.PlayerControlsOverlay = () => ['volume']; }, 9);
        const module = {exports: {}};
        factory(context, () => ({}), null, null, module, module.exports);
        assert.deepEqual(Array.from(module.exports.PlayerControlsOverlay({})), first ? ['volume', 'ui', 'reload'] : ['volume', 'reload', 'ui']);
    }
});
