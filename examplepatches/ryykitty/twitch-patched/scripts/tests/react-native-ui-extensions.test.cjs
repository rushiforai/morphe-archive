const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

function fixture(hasEntry) {
    const adapters = {};
    let hidden = false;
    const runtime = {
        ui: {useEnabled(React, key) { assert.equal(key, 'hide_channel_extensions'); return hidden; }},
        target() {}, decorate(id, name, adapter) { adapters[name] = adapter; }
    };
    const React = {createElement(type, props) { return {type, props}; }};
    const source = fs.readFileSync(path.resolve(__dirname, '../../patches/src/main/resources/reactnative/ui-controls.js'), 'utf8')
        .replace('__TWITCH_UI_SKYLINE_ROW_EXPORT__', 'SupportActionRow')
        .replace('__TWITCH_UI_EXTENSION_ENTRY_MODULE__', hasEntry ? '11' : 'null')
        .replace(/__TWITCH_UI_[A-Z_]+_MODULE__/g, '10');
    vm.runInNewContext(source, {globalThis: {__twitchPatchRuntime: runtime}});
    return {adapters, React, set(value) { hidden = value; },
        adapt(name, original) { return adapters[name](original, React); }};
}

test('channel extension controls follow the existing preference in both directions', () => {
    const f = fixture(true);
    for (const name of ['ClassicExtensionsIcon', 'ExtensionsEntryButton']) {
        const original = () => {}, props = {installations: [{id: 'fixture'}], onOpen() {}, onPress() {}};
        const render = f.adapt(name, original);
        f.set(false);
        assert.equal(render(props).type, original);
        assert.equal(render(props).props, props);
        for (let i = 0; i < 3; i++) {
            f.set(true);
            assert.equal(render(props), null);
            f.set(false);
            assert.equal(render(props).props, props);
        }
    }
});

test('older bundles retain the classic extension hook without registering an absent entry button', () => {
    const f = fixture(false);
    assert.equal(typeof f.adapters.ClassicExtensionsIcon, 'function');
    assert.equal(f.adapters.ExtensionsEntryButton, undefined);
});
