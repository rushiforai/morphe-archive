const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const runtime = {};
const context = vm.createContext({__twitchPatchRuntime: runtime});
const root = path.resolve(__dirname, '../../patches/src/main/resources/reactnative');
for (const file of ['emote-providers.js', 'emote-details.js']) {
    vm.runInContext(fs.readFileSync(path.join(root, file), 'utf8'), context);
}
const entry = name => ({name, width: 56, height: 28,
    urls: {'1': '//cdn.frankerfacez.com/emote/1/1', '2': '//cdn.frankerfacez.com/emote/1/2'}});
const animation = {...entry('Animated'), animated: {'2': '//cdn.frankerfacez.com/emote/2/animated/2'}};
const sets = {'1': {emoticons: [entry('Global')]}, '2': {emoticons: [animation]}, '3': {emoticons: [entry('Private')]}};
const global = runtime.emoteProviders.parse('ffz', {default_sets: [1], sets}, false);
assert.deepEqual(Array.from(global.keys()), ['Global']);
assert.equal(global.get('Global').format, 'png');
const channel = runtime.emoteProviders.parse('ffz', {room: {set: 2}, sets}, true);
assert.deepEqual(Array.from(channel.keys()), ['Animated']);
assert.equal(channel.get('Animated').url, 'https://cdn.frankerfacez.com/emote/2/animated/2.gif');
assert.equal(channel.get('Animated').staticURL, 'https://cdn.frankerfacez.com/emote/1/2');
assert.equal(channel.get('Animated').ratio, 2);
const smallAnimation = {...animation, animated: {'1': '//cdn.frankerfacez.com/emote/2/animated/1',
    '2': '//cdn.frankerfacez.com/emote/2/animated/2'}};
assert.equal(runtime.emoteProviders.parse('ffz', {room: {set: 1}, sets: {'1': {emoticons: [smallAnimation]}}}, true)
    .get('Animated').url, 'https://cdn.frankerfacez.com/emote/2/animated/1.gif');
const id = runtime.emoteProviders.augment('Animated', [], channel, new Set())[0].id;
assert.equal(runtime.emoteDetails.decode(id).provider, 'ffz');
assert.equal(runtime.emoteDetails.label(runtime.emoteDetails.decode(id)), 'FrankerFaceZ channel emote');
assert.equal(runtime.emoteProviders.parse('ffz', {}, true).size, 0);
const unsafe = {...entry('Invalid'), urls: {'2': 'https://cdn.frankerfacez.com.example/2'}};
assert.equal(runtime.emoteProviders.parse('ffz', {default_sets: [1], sets: {'1': {emoticons: [unsafe]}}}, false).size, 0);
assert.equal(runtime.emoteProviders.augment('Animated', [{id: 'native', start: 0, end: 7}], channel, new Set()).length, 1);
console.log('FrankerFaceZ: assigned sets, global privacy, animation URLs, previews and native precedence passed.');
