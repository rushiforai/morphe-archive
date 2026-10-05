const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const root = path.resolve(__dirname, '../../patches/src/main/resources/reactnative');
function setup(adapter, exportName, policyIndex) {
    let policy;
    let clock = 0;
    let effects = [];
    const timers = new Map();
    let nextTimer = 0;
    const context = vm.createContext({console: {info() {}}, performance: {now: () => clock},
        RN$registerCallableModule(name, factory) { policy = factory(); },
        setTimeout(callback, delay) { const id = ++nextTimer; timers.set(id, {callback, at: clock + delay}); return id; },
        clearTimeout(id) { timers.delete(id); }});
    const React = {useSyncExternalStore(subscribe, snapshot) { return snapshot(); },
        useEffect(effect) { effects.push(effect); }};
    vm.runInContext(fs.readFileSync(path.join(root, 'bootstrap.js'), 'utf8').replace('__TWITCH_REACT_MODULE__', '7'), context);
    vm.runInContext(fs.readFileSync(path.join(root, adapter), 'utf8').replace('__TWITCH_TARGET_MODULE__', '12')
        .replace('__TWITCH_TARGET_EXPORT__', exportName).replace('__TWITCH_POLICY_INDEX__', String(policyIndex))
        .replace('__TWITCH_TARGET_REGISTRATION__', 'undefined'), context);
    let wrappedFactory;
    context.__d = function (factory) { wrappedFactory = factory; };
    return {policy: (...args) => policy.set(...args),
        install(original) {
            context.__d(function (global, require, a, b, module, exports) { exports[exportName] = original; }, 12, []);
            const module = {exports: {}};
            wrappedFactory(context, () => React, null, null, module, module.exports, []);
            return module.exports[exportName];
        },
        effects() { const current = effects; effects = []; return current.map(effect => effect()).filter(Boolean); },
        tick(amount) {
            clock += amount;
            for (const [id, timer] of [...timers]) if (timer.at <= clock) { timers.delete(id); timer.callback(); }
        }, timers};
}
{
    const state = setup('auto-claim.js', 'useClaimableBonus');
    let calls = 0;
    const originalResult = {claimBonus() { calls++; }, claimError: false};
    const hook = state.install(() => originalResult);
    const props = {hasChannel: true, currentUserID: 'fixture-user', channelId: 'fixture-channel', availableClaimID: 'fixture-claim'};
    state.policy(true, true, true, true);
    assert.equal(hook(props), originalResult, 'preserves the original manual claim result');
    const cleanups = state.effects();
    assert.equal(calls, 1, 'claims an available chest on entering the channel');
    hook(props); state.effects();
    assert.equal(calls, 1, 'duplicate renders reserve the same claim');
    state.policy(false, true, true, true); state.tick(10000);
    assert.equal(calls, 1, 'disabling cancels queued automatic attempts');
    cleanups.forEach(cleanup => cleanup());
    state.policy(true, true, true, true);
    hook({...props, availableClaimID: null}); state.effects(); state.tick(60000);
    assert.equal(calls, 1, 'cache removal does not invent an available chest');
    hook({...props, availableClaimID: 'second-claim'});
    const second = state.effects(); assert.equal(calls, 2);
    second.forEach(cleanup => cleanup()); state.tick(60000);
    assert.equal(calls, 2, 'unmount cancels pending retries');
    state.policy(true, true, true, false);
    hook({...props, availableClaimID: 'background-claim'}); state.effects();
    assert.equal(calls, 2, 'background activity never claims');
}
{
    const state = setup('hide-component.js', 'FixturePromotion', 2);
    let originalRenders = 0;
    const visible = {type: 'fixture-promotion'};
    const render = state.install(() => { originalRenders++; return visible; });
    state.policy(false, false, true, true);
    assert.equal(render(), null);
    state.policy(false, false, false, true);
    assert.equal(render(), visible);
    assert.equal(originalRenders, 2, 'runs original hooks on both sides of the setting change');
}
console.log('React Native adapters: claim deduplication, cancellation, foreground and promotion toggles passed.');
async function testFeedNoFill() {
    const state = setup('feed-no-fill.js', 'requestInFeedAd');
    let requests = 0;
    let complete;
    const bid = {success: true, bid: {fixture: true}};
    const receiver = {fixture: 'receiver'};
    const args = {fixture: 'request'};
    const request = state.install(function (input) {
        requests++;
        assert.equal(this, receiver);
        assert.equal(input, args);
        return new Promise(resolve => { complete = resolve; });
    });
    state.policy(false, false, false, true, true);
    const blocked = await request.call(receiver, args);
    assert.equal(blocked.success, false);
    assert.equal(blocked.error, 'No ad available (204 no-fill)');
    assert.equal(requests, 0, 'blocked cards never start an ad fetch');
    state.policy(false, false, false, true, false);
    const original = request.call(receiver, args);
    complete(bid);
    assert.equal(await original, bid, 'disabled policy preserves the original successful result');
    const late = request.call(receiver, args);
    state.policy(false, false, false, true, true);
    complete(bid);
    assert.equal((await late).success, false, 'an in-flight creative cannot reappear after enabling');
    state.policy(false, false, false, true, false);
    const rejection = request.call(receiver, args);
    const noFill = {success: false, error: 'fixture refusal'};
    complete(noFill);
    assert.equal(await rejection, noFill, 'original refusal keeps its own completion shape');
    console.log('React Native feed: no-fill, delegation and late-result cancellation passed.');
}
testFeedNoFill().catch(error => { console.error(error); process.exitCode = 1; });
