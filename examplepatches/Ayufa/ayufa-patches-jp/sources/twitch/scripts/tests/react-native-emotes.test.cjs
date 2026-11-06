const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const root = path.resolve(__dirname, '../../patches/src/main/resources/reactnative');
const jobs = [], events = [], targets = new Map(), subscriptions = new Set();
let enabled = true, foreground = true, effects = [], policy;
const selection = [true, true, true];
const runtime = {
    target(id, name, adapter, memo) { targets.set(name, {adapter, memo}); },
    enabled(index) { return index >= 8 ? selection[index - 8] : index === 5 ? enabled : foreground; },
    policyHook() { return enabled; },
    subscribe(fn) { subscriptions.add(fn); return () => subscriptions.delete(fn); },
    log(value) { events.push(value); }
};
const context = vm.createContext({__twitchPatchRuntime: runtime, AbortController, setTimeout, clearTimeout,
    fetch(url, options) { return new Promise((resolve, reject) => {
        const job = {url, options, resolve(data, status = 200) {
            resolve({status, ok: status === 200, headers: {get() { return null; }}, text: async () => JSON.stringify(data)});
        }, reject}; jobs.push(job);
    }); }});
for (const file of ['emote-providers.js', 'emote-catalog.js', 'emote-details.js', 'emote-renderer.js']) {
    vm.runInContext(fs.readFileSync(path.join(root, file), 'utf8')
        .replace('__TWITCH_CHAT_ROW_MODULE__', '11').replace('__TWITCH_EMOTE_PART_MODULE__', '12')
        .replace('__TWITCH_EMOTE_CARD_MODULE__', '13').replace('__TWITCH_BOTTOM_SHEET_MODULE__', '14'), context);
}
function seven(name, id = 'fixture', ratio = 2, animated = false) {
    return {name, data: {animated, host: {url: '//cdn.7tv.app/emote/' + id,
        files: [{name: '2x.webp', static_name: '2x_static.webp', width: ratio * 64, height: 64},
            ...(animated ? [{name: '2x.gif', static_name: '2x_static.gif', width: ratio * 64, height: 64}] : [])]}}};
}
const providers = runtime.emoteProviders;
const catalog = providers.parse('7tv', {emote_set: {emotes: [seven('Wankge'), seven('Peepoclap')]}}, true);
assert.equal(catalog.size, 2);
const animated = providers.parse('7tv', {emotes: [seven('Animated', 'animated', 1, true)]}, false).get('Animated');
assert.equal(animated.url, 'https://cdn.7tv.app/emote/animated/2x.gif', 'uses the original native GIF decoder for animation');
assert.equal(animated.staticURL, 'https://cdn.7tv.app/emote/animated/2x_static.gif');
const missingGif = seven('MissingGif', 'static', 1, true);
missingGif.data.host.files.pop();
assert.equal(providers.parse('7tv', {emotes: [missingGif]}, false).get('MissingGif').url,
    'https://cdn.7tv.app/emote/static/2x_static.webp', 'unsupported animation formats keep a supported static image');
assert.equal(providers.parse('7tv', {emotes: [seven('unsafe', '../bad?token=secret')]}, false).size, 0);
assert.equal(providers.parse('bttv', {sharedEmotes: [{id: 'a', code: 'Shared'}], channelEmotes: [{id: 'b', code: 'Shared'}]}, true)
    .get('Shared').url, 'https://cdn.betterttv.net/emote/b/2x.webp');
assert.equal(providers.parse('bttv', [{id: 'animated', code: 'Animated', animated: true}], false)
    .get('Animated').url, 'https://cdn.betterttv.net/emote/animated/2x.gif');
const singleScale = seven('SingleScale', 'single', 1, true);
singleScale.data.host.files[1].name = '1x.gif';
assert.equal(providers.parse('7tv', {emotes: [singleScale]}, false).get('SingleScale').url,
    'https://cdn.7tv.app/emote/single/1x.gif');
const native = [{id: 'native', start: 2, end: 7}];
const ranges = providers.augment('\u{1f600} Wankge Peepoclap', native, catalog, new Set());
assert.equal(ranges.length, 2, 'native ranges retain precedence over third-party names');
assert.equal(ranges[1].start, 9, 'positions use code points instead of UTF-16');
assert.equal(ranges[1].end, 17, 'end offsets are inclusive');
assert.equal(native.length, 1, 'does not mutate the original emote array');
assert.equal(providers.augment('Wankge!', [], catalog, new Set()).length, 0, 'matches complete tokens');
assert.equal(providers.augment('Wankge', [], catalog, new Set([catalog.get('Wankge').url])).length, 0);
const React = {
    createContext() { return {Provider: 'Provider'}; },
    useContext() { return {open() {}}; },
    useMemo(fn) { return fn(); },
    createElement(type, props) { return {type, props}; },
    memo(type, compare) { return {type, compare, $$typeof: Symbol.for('react.memo')}; },
    useSyncExternalStore(subscribe, snapshot) { return snapshot(); },
    useEffect(effect) { effects.push(effect); },
    useState(initial) { return [initial, () => {}]; },
    isValidElement(value) { return !!value && typeof value === 'object' && value.props; },
    cloneElement(element, props, children) { return {type: element.type,
        props: {...element.props, ...props, ...(arguments.length > 2 ? {children} : {})}}; },
    Children: {map(children, callback) { return Array.isArray(children) ? children.map(callback) : callback(children); }}
};
const original = React.memo(function OriginalRow() {}, null);
const wrappedRow = targets.get('ChatMessageRow').adapter(original, React).type;
const row = value => wrappedRow(value).props.children;
const props = {channelID: '123', message: {body: 'Wankge', emotes: [], sourceRoomID: '456'}, maskedRanges: []};
assert.equal(row(props).type, original, 'keeps the original memoized component');
effects.shift()();
const release = effects.shift()();
assert.equal(jobs.length, 6, 'deduplicated global and source-channel provider requests');
const sameRelease = runtime.emotes.retain('456');
assert.equal(jobs.length, 6, 'new rows share pending requests');
async function flush() { for (let count = 0; count < 10; count++) await Promise.resolve(); }
async function main() {
    jobs[0].resolve([{id: 'global', code: 'Wankge'}]);
    jobs[1].resolve({channelEmotes: []});
    jobs[2].resolve({emotes: []});
    jobs[3].resolve({emote_set: {emotes: [seven('Wankge')]}, ignoredPadding: 'x'.repeat(2500000)});
    jobs[4].resolve({}); jobs[5].resolve({room: {set: 1}, sets: {'1': {emoticons: [
        {name: 'Wankge', urls: {'2': 'https://cdn.frankerfacez.com/emote/1/2'}},
        {name: 'FFZChannel', urls: {'2': 'https://cdn.frankerfacez.com/emote/2/2'}}]}}});
    await flush();
    const rendered = row(props);
    assert.equal(rendered.props.message.emotes.length, 1);
    assert.match(decodeURIComponent(rendered.props.message.emotes[0].id), /cdn.7tv.app/,
        'channel emotes override a global name collision');
    assert.equal(props.message.emotes.length, 0);
    assert.equal(runtime.emotes.snapshot('456').get('FFZChannel').provider, 'ffz');
    const picker = runtime.emotes.pickerSnapshot('456');
    assert(picker.some(group => group.provider === 'bttv' && !group.channel && group.emotes.some(emote => emote.name === 'Wankge')));
    assert(picker.some(group => group.provider === '7tv' && group.channel && group.emotes.some(emote => emote.name === 'Wankge')),
        'picker retains provider and scope catalogs across duplicate names');
    selection[1] = false; subscriptions.forEach(fn => fn());
    assert(runtime.emotes.pickerSnapshot('456').every(group => group.provider !== '7tv'));
    assert.equal(runtime.emotes.snapshot('456').get('Wankge').provider, 'ffz', 'disabling 7TV exposes the enabled channel provider');
    selection[2] = false; subscriptions.forEach(fn => fn());
    assert.equal(runtime.emotes.snapshot('456').get('Wankge').provider, 'bttv');
    selection[0] = false; subscriptions.forEach(fn => fn());
    assert.equal(runtime.emotes.snapshot('456').size, 0, 'all providers disabled remove cached emotes');
    assert.equal(runtime.emotes.pickerSnapshot('456').length, 0);
    selection.fill(true); subscriptions.forEach(fn => fn());
    assert.equal(jobs.length, 6, 'reenabling fresh cached providers requires no requests');
    assert.equal(runtime.emotes.snapshot('456').get('Wankge').provider, '7tv');
    enabled = false;
    assert.equal(row(props).props, props, 'disabling restores untouched message props');
    enabled = true;
    let calls = 0;
    const part = targets.get('EmotePart').adapter(function (value) {
        calls++;
        assert.equal(typeof value.onPress, 'function', 'custom emotes use their own details action');
        return React.createElement('View', {testID: 'chat-emote-wrapper-' + value.emoteId, style: 9,
            children: React.createElement('CoreImage', {src: 'https://static-cdn.jtvnw.net/emoticons/v2/' + value.emoteId + '/default/dark/2.0', style: 10})});
    }, React);
    const image = part({emoteId: rendered.props.message.emotes[0].id, onPress() {}}).props.children;
    assert.equal(image.props.src, 'https://cdn.7tv.app/emote/fixture/2x.webp');
    assert.equal(image.props.style[1].width, 48);
    image.props.onLoad(); assert(events.includes('emotes image loaded provider=7tv format=webp'));
    image.props.onError();
    assert.equal(row(props).props.message.emotes.length, 0, 'image failures return to ordinary text');
    assert.equal(calls, 1);
    release(); sameRelease();
    const cancel = runtime.emotes.retain('789');
    const late = jobs.slice(6); cancel();
    assert(late.every(job => job.options.signal.aborted), 'unmount cancels channel requests');
    late.forEach(job => job.resolve({emote_set: {emotes: [seven('Late')]}})); await flush();
    assert.equal(runtime.emotes.snapshot('789').has('Late'), false, 'late responses do not publish into a departed channel');
    const releaseOversize = runtime.emotes.retain('888');
    jobs[jobs.length - 3].resolve({channelEmotes: [{id: 'oversize', code: 'Oversize'}], ignoredPadding: 'x'.repeat(9000000)});
    jobs[jobs.length - 2].resolve({emote_set: {emotes: [seven('OtherProvider')]}});
    jobs[jobs.length - 1].resolve({});
    await flush();
    assert.equal(runtime.emotes.snapshot('888').has('Oversize'), false, 'catalogs exceeding the upper bound are rejected');
    assert.equal(runtime.emotes.snapshot('888').has('OtherProvider'), true, 'one oversized provider does not erase another provider');
    releaseOversize();
    const releaseSelective = runtime.emotes.retain('999');
    const selective = jobs.slice(-3);
    selection[0] = false; subscriptions.forEach(fn => fn());
    assert.equal(selective[0].options.signal.aborted, true, 'disabled provider requests cancel');
    assert.equal(selective[1].options.signal.aborted, false, 'other providers remain active');
    selective[0].resolve({channelEmotes: [{id: 'late', code: 'DisabledLate'}]});
    selective[1].resolve({emote_set: {emotes: [seven('StillEnabled')]}}); selective[2].resolve({});
    await flush();
    assert.equal(runtime.emotes.snapshot('999').has('DisabledLate'), false);
    assert.equal(runtime.emotes.snapshot('999').has('StillEnabled'), true);
    releaseSelective(); selection.fill(true);
    const boot = vm.createContext({console: {info() {}}, RN$registerCallableModule(name, factory) { policy = factory(); }});
    vm.runInContext(fs.readFileSync(path.join(root, 'bootstrap.js'), 'utf8').replace('__TWITCH_REACT_MODULE__', '7'), boot);
    let factory;
    boot.__d = value => { factory = value; };
    boot.__twitchPatchRuntime.target(11, 'Row', value => value, true);
    boot.__d(function (g, require, a, b, module) { module.exports.Row = original; }, 11);
    const module = {exports: {}};
    factory(boot, () => React, null, null, module);
    assert.equal(module.exports.Row, original, 'bootstrap accepts only an explicitly declared memo export');
    policy.set(false, false, false, true, false, true, false, false, true, false, true);
    assert.equal(boot.__twitchPatchRuntime.enabled(5), true);
    assert.equal(boot.__twitchPatchRuntime.enabled(8), true);
    assert.equal(boot.__twitchPatchRuntime.enabled(9), false);
    assert.equal(boot.__twitchPatchRuntime.enabled(10), true);
    foreground = false; subscriptions.forEach(fn => fn());
    console.log('React Native emotes: provider parsing, Unicode ranges, memo export, channel ownership, rendering, failures and cancellation passed.');
}
main().catch(error => { console.error(error); process.exitCode = 1; });
