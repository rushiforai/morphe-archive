const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const root = path.resolve(__dirname, '../../patches/src/main/resources/reactnative');
let policies, wrappedFactory;
const reports = [];
const context = vm.createContext({console: {info: message => reports.push(message)},
    RN$registerCallableModule(name, factory) { policies = factory(); }});
vm.runInContext(fs.readFileSync(path.join(root, 'bootstrap.js'), 'utf8')
    .replace('__TWITCH_REACT_MODULE__', '7'), context);
vm.runInContext(fs.readFileSync(path.join(root, 'stream-ad-welcome.js'), 'utf8')
    .replace('__TWITCH_WELCOME_HOOK_MODULE__', '12'), context);
context.__d = factory => { wrappedFactory = factory; };
const nativeListeners = new Set(), slots = [];
let cursor = 0, rendering = false, dirty = false, renders = 0, originalCalls = 0;
let nativeState = {playing: true, rollType: 'PREROLL'};
let previousState, previousResult;
const subscribeNative = listener => { nativeListeners.add(listener); return () => nativeListeners.delete(listener); };
const React = {useSyncExternalStore(subscribe, snapshot) {
    const index = cursor++;
    if (!slots[index]) slots[index] = {cleanup: subscribe(() => {
        dirty = true;
        if (!rendering) render();
    })};
    return snapshot();
}};
const receiver = {fixture: true}, props = Object.freeze({channelName: 'fixture'});
function original(input) {
    assert.equal(this, receiver); assert.equal(input, props);
    originalCalls++;
    const playing = React.useSyncExternalStore(subscribeNative, () => nativeState.playing);
    const preroll = React.useSyncExternalStore(subscribeNative, () => nativeState.rollType === 'PREROLL');
    if (previousState !== nativeState) {
        previousState = nativeState;
        previousResult = Object.freeze({isShowing: playing, isPreroll: preroll});
    }
    return previousResult;
}
context.__d(function (global, require, a, b, module, exports) { exports.useWelcomeBannerState = original; }, 12, []);
const moduleFixture = {exports: {}};
wrappedFactory(context, () => React, null, null, moduleFixture, moduleFixture.exports, []);
const hook = moduleFixture.exports.useWelcomeBannerState;
const train = {type: 'fixture-train'}, metadata = {type: 'fixture-channel-metadata'};
let state, layout;
function render() {
    if (rendering) return;
    do {
        rendering = true; dirty = false; cursor = 0; renders++;
        state = hook.call(receiver, props);
        layout = {strip: state.isShowing ? {height: 48} : null,
            inFlow: state.isShowing ? {height: 48} : null, train, metadata};
        assert.equal(cursor, 3, 'original native subscriptions and policy hook run in the same order');
        rendering = false;
    } while (dirty);
}
function setEnabled(enabled) { policies.set(false, false, false, true, false, false, enabled, false); }
render();
assert.equal(state, previousResult, 'default disabled policy preserves original result identity');
assert.equal(state.isShowing, true);
const initialRenders = renders;
setEnabled(true);
assert.ok(renders > initialRenders, 'policy subscription updates an already-mounted caller without new props');
assert.equal(state.isShowing, false); assert.equal(state.isPreroll, false);
assert.equal(layout.strip, null); assert.equal(layout.inFlow, null, 'no reserved banner height remains');
assert.equal(layout.train, train); assert.equal(layout.metadata, metadata);
const hidden = state;
for (const rollType of ['MIDROLL', 'PREROLL']) {
    nativeState = {playing: true, rollType, remaining: 0};
    nativeListeners.forEach(listener => listener());
    assert.equal(state, hidden, 'stale ad snapshots cannot resurrect the presentation');
    setEnabled(false);
    assert.equal(state, previousResult, 'disabling restores the latest native result');
    assert.equal(state.isPreroll, rollType === 'PREROLL');
    setEnabled(true); assert.equal(state, hidden);
}
nativeState = {playing: false, rollType: ''};
nativeListeners.forEach(listener => listener());
setEnabled(false); assert.equal(state.isShowing, false);
assert.equal(originalCalls, renders, 'native hooks are never skipped while blocking');
assert.equal(reports.filter(message => message.includes('stream ad support banner suppressed')).length, 1);
slots.forEach(slot => slot.cleanup());
assert.equal(nativeListeners.size, 0, 'native subscription cleanup remains owned by React');
const stoppedRenders = renders;
setEnabled(true); assert.equal(renders, stoppedRenders, 'policy subscription cleans up on unmount');
console.log('Ad welcome visibility, mounted policy updates, layout restoration and native lifecycle passed.');
