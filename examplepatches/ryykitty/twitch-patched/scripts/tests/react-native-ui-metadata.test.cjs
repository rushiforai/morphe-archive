const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

function fixture() {
    const adapters = {}, preferences = {};
    const runtime = {ui: {useEnabled(React, key) { return preferences[key] === true; }},
        target(id, name, adapter) { adapters[name] = adapter; }, decorate(id, name, adapter) { adapters[name] = adapter; }};
    const React = {
        createElement(type, props) { return {type, props}; },
        isValidElement(node) { return Boolean(node && node.type && node.props); },
        cloneElement(node, props) { return {type: node.type, props: {...node.props, ...props}}; }
    };
    const source = fs.readFileSync(path.resolve(__dirname, '../../patches/src/main/resources/reactnative/ui-controls.js'), 'utf8')
        .replace('__TWITCH_UI_SKYLINE_ROW_EXPORT__', 'SupportActionRow').replace(/__TWITCH_UI_[A-Z_]+_MODULE__/g, '10');
    vm.runInNewContext(source, {globalThis: {__twitchPatchRuntime: runtime}});
    const Row = () => {}, Metadata = () => {};
    return {preferences, React, Row, Metadata,
        render: adapters.ChannelMetadata(Metadata, React, runtime, () => ({SupportActionRow: Row}))};
}

test('metadata removes persistent-row padding when all of its actions are hidden and restores it live', () => {
    const f = fixture(), onOpenSubscribe = () => {}, onOpenExtensions = () => {};
    const actions = f.React.createElement(f.Row, {buttons: [{kind: 'subscribe'}, {kind: 'gift'}, {kind: 'bits'}],
        notificationSetting: 'always', onOpenSubscribe});
    for (const collapsed of [true, false]) {
        const props = {actions, showExtensionsIcon: true, collapsed, onOpenExtensions, contentLabelsSlot: {id: 'labels'}};
        assert.equal(f.render(props).props, props);
        for (let cycle = 0; cycle < 3; cycle++) {
            for (const part of ['subscribe', 'gift', 'bits']) f.preferences['classic_support_hide_' + part] = true;
            f.preferences.hide_channel_extensions = true;
            const hidden = f.render(props);
            assert.equal(hidden.type, f.Metadata);
            assert.equal(hidden.props.actions, null);
            assert.equal(hidden.props.showExtensionsIcon, false);
            assert.equal(hidden.props.collapsed, collapsed);
            assert.equal(hidden.props.contentLabelsSlot, props.contentLabelsSlot);
            assert.equal(hidden.props.onOpenExtensions, onOpenExtensions);
            f.preferences.classic_support_hide_gift = false;
            const gift = f.render(props).props.actions.props;
            assert.deepEqual(Array.from(gift.buttons, button => button.kind), ['gift']);
            assert.equal(gift.onOpenSubscribe, onOpenSubscribe);
            for (const key of Object.keys(f.preferences)) f.preferences[key] = false;
            assert.equal(f.render(props).props, props);
        }
        assert.equal(actions.props.buttons.length, 3);
    }
});

test('metadata preserves follow, notification controls and unknown action components', () => {
    const f = fixture();
    for (const part of ['subscribe', 'gift', 'bits']) f.preferences['classic_support_hide_' + part] = true;
    f.preferences.hide_channel_extensions = true;
    const onNotificationPress = () => {};
    const notification = f.React.createElement(f.Row, {buttons: [{kind: 'follow'}, {kind: 'upgrade'}], notificationSetting: 'always', onNotificationPress});
    const next = f.render({actions: notification, showExtensionsIcon: true}).props.actions;
    assert.deepEqual(Array.from(next.props.buttons, button => button.kind), ['follow']);
    assert.equal(next.props.notificationSetting, 'always');
    assert.equal(next.props.onNotificationPress, onNotificationPress);
    const follow = f.React.createElement(f.Row, {buttons: [{kind: 'follow'}, {kind: 'new-action'}, {kind: 'subscribe'}]});
    assert.deepEqual(Array.from(f.render({actions: follow}).props.actions.props.buttons, b => b.kind), ['follow', 'new-action']);
    const unknown = f.React.createElement(() => {}, {buttons: [{kind: 'subscribe'}]});
    assert.equal(f.render({actions: unknown}).props.actions, unknown);
    assert.equal(f.render({actions: null, showExtensionsIcon: false}).props.actions, null);
});
