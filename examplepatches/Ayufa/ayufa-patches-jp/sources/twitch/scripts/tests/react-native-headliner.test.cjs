const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

function fixture() {
    const targets = new Map();
    let blocked = true;
    const policy = {enabled(index) { assert.equal(index, 4); return blocked; }};
    const runtime = {target(id, name, adapter) { targets.set(name, adapter); },
        policyHook(React, index) { return policy.enabled(index); }};
    const source = fs.readFileSync(path.resolve(__dirname,
        '../../patches/src/main/resources/reactnative/headliner-no-fill.js'), 'utf8')
        .replace('__TWITCH_HEADLINER_REQUEST_MODULE__', '1').replace('__TWITCH_HEADLINER_STATE_MODULE__', '2');
    vm.runInNewContext(source, {__twitchPatchRuntime: runtime});
    return {targets, policy, setBlocked(value) { blocked = value; }};
}

test('headliner requests use native no-fill completion and discard a bid arriving after enabling', async () => {
    const f = fixture();
    let requests = 0;
    let finish;
    const original = () => { requests++; return new Promise(resolve => { finish = resolve; }); };
    const request = f.targets.get('requestHeadlinerAd')(original, {}, f.policy);
    assert.equal((await request()).success, false);
    assert.equal(requests, 0);
    f.setBlocked(false);
    const response = {success: true, bid: {id: 'fixture'}};
    const pending = request();
    f.setBlocked(true);
    finish(response);
    assert.equal((await pending).error, 'No ad available (204 no-fill)');
    f.setBlocked(false);
    const unblocked = request();
    finish(response);
    assert.equal(await unblocked, response);
});

test('headliner state clears a mounted creative and disables the native lifecycle without losing callbacks', () => {
    const f = fixture();
    const state = {ad: {id: 'fixture'}, status: 'Filled', adSessionId: 'fixture', markImpressionFired() {}};
    let received;
    const hook = f.targets.get('useHeadlinerAd')(props => { received = props; return state; }, {});
    const props = {enabled: true, visible: true, deps: {}, track() {}};
    const result = hook(props);
    assert.equal(received.enabled, false);
    assert.equal(received.track, props.track);
    assert.equal(result.ad, null);
    assert.equal(result.status, 'Unfilled');
    assert.equal(result.adSessionId, null);
    assert.equal(result.markImpressionFired, state.markImpressionFired);
    assert.equal(state.status, 'Filled');
    assert.equal(props.enabled, true);
    f.setBlocked(false);
    assert.equal(hook(props), state);
    assert.equal(received, props);
});
