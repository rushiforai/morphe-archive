const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const root = path.resolve(__dirname, '../../patches/src/main/resources/reactnative');
let clock = 0, policies = [false, false, false, true, false, false, false, true];
const runtime = {enabled: index => policies[index], log() {}};
const context = vm.createContext({globalThis: {__twitchPatchRuntime: runtime}, performance: {now: () => clock}});
for (const file of ['reload-owner.js', 'reload-control.js']) vm.runInContext(fs.readFileSync(path.join(root, file), 'utf8'), context);
const timers = new Map();
let timerId = 0, hint = false, calls = 0;
const owner = runtime.reload.owner();
const unsubscribe = owner.bind('fixture-channel', () => calls++);
let expected = owner.snapshot();
const gesture = runtime.reload.gesture(() => owner.request(expected), value => { hint = value; },
    (callback, delay) => { const id = ++timerId; timers.set(id, {callback, time: clock + delay}); return id; },
    id => timers.delete(id), () => clock);
function tick(ms) {
    clock += ms;
    for (const [id, timer] of [...timers]) if (timer.time <= clock) { timers.delete(id); timer.callback(); }
}
gesture.press(); assert.equal(hint, true); assert.equal(calls, 0, 'single tap only explains the action');
tick(100); gesture.press(); assert.equal(hint, false); assert.equal(calls, 1);
gesture.press(); tick(100); gesture.press(); assert.equal(calls, 1, 'rapid extra taps are deduplicated');
tick(800); gesture.press(); tick(501); gesture.press(); assert.equal(calls, 1, 'two slow taps do not reload');
tick(2000); assert.equal(hint, false); assert.equal(timers.size, 0);
gesture.press(); gesture.reset(); tick(100); gesture.press(); assert.equal(calls, 1, 'hidden controls reset the pending tap');
gesture.reset(); unsubscribe(); tick(1000); gesture.activate(); assert.equal(calls, 1, 'unmounted channel cannot reload');
owner.bind('second-channel', () => calls++);
gesture.activate(); assert.equal(calls, 1, 'a captured old channel cannot reload the new one');
expected = owner.snapshot(); gesture.activate(); assert.equal(calls, 2, 'accessibility activation invokes the current owner');
tick(1000); policies[3] = false; gesture.activate(); assert.equal(calls, 2);
policies[3] = true; policies[7] = false; gesture.activate(); assert.equal(calls, 2);
policies[7] = true; gesture.activate(); assert.equal(calls, 3, 'repeated reload remains available');
const React = {
    isValidElement: node => Boolean(node && node.element),
    cloneElement: (node, props) => ({...node, props: {...node.props, ...props}})
};
const element = (type, props) => ({element: true, type, props});
const mute = element('IconButton', {testID: 'player-controls-mute', onPress() {}});
const tooltip = element('Tooltip', {testID: 'player-controls-mute-tooltip', children: mute});
const rotate = element('IconButton', {testID: 'player-controls-rotate'});
const original = element('View', {children: [tooltip, rotate]});
const reload = element('Reload', {testID: 'fixture-reload'});
const changed = runtime.reload.insert(React, original, () => reload);
assert.deepEqual(Array.from(changed.props.children), [tooltip, reload, rotate]);
assert.equal(changed.props.children[0], tooltip, 'original tooltip and volume action retain identity');
assert.equal(original.props.children.length, 2, 'original React compiler tree is immutable');
const ambiguous = element('View', {children: [tooltip, tooltip]});
assert.equal(runtime.reload.insert(React, ambiguous, () => reload), ambiguous);
const missing = element('View', {children: [rotate]});
assert.equal(runtime.reload.insert(React, missing, () => reload), missing);
let deep = tooltip;
for (let index = 0; index < 40; index++) deep = element('View', {children: deep});
assert.equal(runtime.reload.insert(React, deep, () => reload), deep);
console.log('Reload gesture, ownership and immutable control insertion passed.');

const effects = [], refs = [], toastCalls = [];
let refIndex = 0;
const renderReact = {...React,
    createElement: element,
    useRef(value) { const index = refIndex++; return refs[index] || (refs[index] = {current: value}); },
    useEffect(callback) { effects.push(callback); }
};
context.setTimeout = callback => { timers.set(++timerId, {callback, time: clock + 2000}); return timerId; };
context.clearTimeout = id => timers.delete(id);
const icon = element('VolumeIcon', {size: 24});
const template = element('Tooltip', {maxWidth: 32,
    children: element('IconButton', {icon, onPress() { throw new Error('Volume action leaked into reload'); }})});
const Control = runtime.reload.control(renderReact, 'RefreshIcon', {SHORT: 0,
    show(text, duration) { toastCalls.push({text, duration}); }});
const props = {template, owner, binding: owner.snapshot(), active: true, loading: false};
refIndex = 0;
const control = Control(props);
effects.forEach(callback => callback());
assert.equal(control.type, 'IconButton', 'hint has no overlay or narrow tooltip container');
assert.equal(control.props.icon.type, 'RefreshIcon');
assert.equal(control.props.icon.props.size, 24);
tick(1000); control.props.onPress();
assert.equal(toastCalls.length, 1); assert.equal(toastCalls[0].text, 'Double-tap to reload stream');
tick(100); control.props.onPress(); assert.equal(calls, 4, 'second tap remains available while toast is visible');
props.loading = true; refIndex = 0;
const loading = Control(props); assert.equal(loading.props.disabled, true);
loading.props.onPress(); assert.equal(toastCalls.length, 1, 'loading control does not explain an unavailable action');
console.log('Reload hint uses a non-interactive native toast and retains the original button styling.');
