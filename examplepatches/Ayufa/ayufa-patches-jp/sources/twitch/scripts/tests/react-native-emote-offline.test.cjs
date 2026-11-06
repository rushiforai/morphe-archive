const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

test('chat without a channel loads globals without requesting an unrelated channel', async () => {
    const requests = [], subscribers = [];
    let foreground = true, enabled = true;
    const runtime = {enabled(index) { return index === 3 ? foreground : enabled; },
        subscribe(fn) { subscribers.push(fn); }, log() {},
        emoteProviders: {parse(provider) { return new Map([[provider, {name: provider}]]); }}};
    const context = vm.createContext({__twitchPatchRuntime: runtime, AbortController, setTimeout, clearTimeout,
        fetch(url, options) {
            requests.push({url, options});
            return Promise.resolve({status: 200, ok: true, headers: {get() { return null; }}, text: async () => '{}'});
        }});
    vm.runInContext(fs.readFileSync(path.resolve(__dirname, '../../patches/src/main/resources/reactnative/emote-catalog.js'), 'utf8'), context);
    const release = runtime.emotes.retain(undefined);
    await new Promise(resolve => setImmediate(resolve));
    assert.equal(requests.length, 3);
    assert(requests.every(item => item.url.endsWith('/global')));
    assert.equal(runtime.emotes.snapshot(null).size, 3);
    assert.equal(runtime.emotes.snapshot(undefined), runtime.emotes.snapshot(null));
    enabled = false; subscribers.forEach(fn => fn());
    assert.equal(runtime.emotes.snapshot(null).size, 0);
    enabled = true; foreground = false; subscribers.forEach(fn => fn());
    assert.equal(requests.length, 3);
    foreground = true; subscribers.forEach(fn => fn());
    assert.equal(runtime.emotes.snapshot(null).size, 3);
    const channels = Array.from({length: 8}, (_, index) => runtime.emotes.retain(String(index + 1)));
    assert.equal(requests.length, 27, 'global chat does not reduce the eight-channel catalog limit');
    runtime.emotes.retain('9')();
    assert.equal(requests.length, 27, 'active channel catalogs remain bounded');
    channels.forEach(close => close());
    release();
});
