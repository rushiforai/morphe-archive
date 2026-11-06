const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

test('Skyline banner blocking removes its reserved space and retains native hooks and safe-area insets', () => {
    let adapter, blocked = false;
    const runtime = {target(id, name, factory) { assert.equal(name, 'useSkylineBannerSlot'); adapter = factory; },
        policyHook(React, bit) { assert.equal(bit, 4); return blocked; }};
    const source = fs.readFileSync(path.resolve(__dirname, '../../patches/src/main/resources/reactnative/skyline-banner.js'), 'utf8')
        .replace('__TWITCH_SKYLINE_BANNER_SLOT_MODULE__', '5085');
    vm.runInNewContext(source, {globalThis: {__twitchPatchRuntime: runtime}});
    const context = {}, controller = {}, insets = {top: 24, left: 8, right: 0, bottom: 18};
    const options = {enabled: true, chromeActive: true, splitLayout: false};
    const state = {available: true, banner: {key: 'creative', height: 90}, contentInsets: {...insets, top: 114}};
    const calls = [];
    const render = adapter(function (...args) { assert.equal(this, context); calls.push(args); return state; }, {});
    for (let cycle = 0; cycle < 3; cycle++) {
        blocked = true;
        const hidden = render.call(context, options, 480, insets, controller);
        assert.equal(hidden.available, false);
        assert.equal(hidden.banner, null);
        assert.equal(hidden.contentInsets, insets);
        assert.equal(calls.at(-1)[0].enabled, false);
        assert.equal(calls.at(-1)[0].chromeActive, true);
        assert.deepEqual(calls.at(-1).slice(1), [480, insets, controller]);
        blocked = false;
        assert.equal(render.call(context, options, 480, insets, controller), state);
        assert.equal(calls.at(-1)[0], options);
    }
    assert.equal(calls.length, 6);
    assert.equal(state.banner.height, 90);
    assert.equal(state.contentInsets.top, 114);
    assert.equal(options.enabled, true);
});
