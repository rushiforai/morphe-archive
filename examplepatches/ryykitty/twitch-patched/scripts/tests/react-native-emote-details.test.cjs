const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const assets = path.resolve(__dirname, '../../patches/src/main/resources/reactnative');
const targets = new Map(), events = [];
let enabled = true, foreground = true, active, rowContext;
function host() { return {state: [], effects: [], cursor: 0, deps: []}; }
const React = {
    Fragment: 'Fragment',
    createContext() { return {Provider: 'Provider'}; },
    useContext() { return rowContext; },
    useMemo(fn) { return fn(); },
    useSyncExternalStore(subscribe, snapshot) { return snapshot(); },
    memo(type) { return {type}; },
    createElement(type, props) { return {type, props}; },
    isValidElement(value) { return !!value && typeof value === 'object' && !!value.props; },
    cloneElement(value, props, children) { return {type: value.type,
        props: {...value.props, ...props, ...(arguments.length > 2 ? {children} : {})}}; },
    Children: {map(children, fn) { return Array.isArray(children) ? children.map(fn) : fn(children); }},
    useState(initial) {
        const owner = active, index = owner.cursor++;
        if (!(index in owner.state)) owner.state[index] = initial;
        return [owner.state[index], value => { owner.state[index] = value; }];
    },
    useEffect(fn, deps) {
        const owner = active, index = owner.cursor++;
        if (!owner.deps[index] || deps.some((value, i) => value !== owner.deps[index][i])) {
            owner.deps[index] = deps; owner.effects.push(fn);
        }
    }
};
function render(owner, fn, props) { active = owner; owner.cursor = 0; return fn(props); }
function flush(owner) { owner.effects.splice(0).forEach(fn => fn()); }
const runtime = {
    target(id, name, adapter) { targets.set(name, adapter); },
    enabled(index) { return index === 5 ? enabled : foreground; },
    policyHook(react, index) { return this.enabled(index); },
    log(value) { events.push(value); },
    emotes: {loaded() {}, fail() {}, matched() {}, subscribe() {}, snapshot() { return new Map(); }, retain() { return () => {}; }, failed: new Set()}
};
const context = vm.createContext({__twitchPatchRuntime: runtime});
for (const file of ['emote-providers.js', 'emote-details.js', 'emote-renderer.js']) {
    vm.runInContext(fs.readFileSync(path.join(assets, file), 'utf8')
        .replace('__TWITCH_CHAT_ROW_MODULE__', '11').replace('__TWITCH_EMOTE_PART_MODULE__', '12')
        .replace('__TWITCH_EMOTE_CARD_MODULE__', '13').replace('__TWITCH_BOTTOM_SHEET_MODULE__', '14'), context);
}
const descriptors = runtime.emoteProviders.parse('bttv', [{code: 'Example', id: 'sample'}], false);
const descriptor = descriptors.get('Example');
const id = runtime.emoteProviders.augment('Example', [], descriptors, new Set())[0].id;
assert.equal(runtime.emoteDetails.label(descriptor), 'BTTV global emote');
assert.equal(runtime.emoteDetails.label({...descriptor, provider: '7tv', channel: true}), '7TV channel emote');
assert.equal(runtime.emoteDetails.decode('twitchpatches:%invalid'), null);
for (const change of [{provider: 'other'}, {name: 'bad name'}, {ratio: 50}, {url: 'https://other.test/a'}, {staticURL: ''}]) {
    assert.equal(runtime.emoteDetails.decode('twitchpatches:' + encodeURIComponent(JSON.stringify({...descriptor, ...change}))), null);
}
const requests = [], sheet = function Sheet() {};
function Card(props) {
    assert.deepEqual(Object.keys(props.emote), ['token'], 'does not supply a fake Twitch ID, owner or subscription type');
    assert.equal(props.onSubscribe, undefined);
    assert.equal(props.onReport, undefined);
    return React.createElement('View', {testID: props.testID, style: 'native-root', children:
        React.createElement('View', {style: 'native-card', children: [
            React.createElement('CoreImage', {src: props.imageURL}),
            React.createElement('CoreText', {testID: props.testID + '-code', children: props.emote.token}),
            React.createElement('CoreText', {testID: props.testID + '-type', style: 'native-caption', children: 'Unknown'})]})});
}
function requireModule(module) { requests.push(module); return module === 13 ? {EmoteCard: Card} : {BottomSheet: sheet}; }
let nativeCalls = 0, passed;
const part = targets.get('EmotePart')(function original(props) {
    nativeCalls++; passed = props;
    return React.createElement('Text', {onPress: props.onPress, children: React.createElement('CoreImage',
        {src: 'https://static-cdn.jtvnw.net/emoticons/v2/' + props.emoteId + '/default/dark/2.0'})});
}, React, runtime, requireModule);
const row = targets.get('ChatMessageRow')({type: function NativeRow() {}}, React, runtime, requireModule).type;
const owner = host(), partOwner = host(), rowProps = {channelID: '123', message: {body: 'Example', emotes: []}};
const props = {emoteId: id, onPress() { throw new Error('native purchase action invoked'); }};
let rowElement = render(owner, row, rowProps); flush(owner);
rowContext = rowElement.props.value;
let result = render(partOwner, part, props);
assert.equal(requests.length, 0, 'details modules are lazy until a sheet opens');
result.props.onPress(); rowElement = render(owner, row, rowProps);
assert.equal(rowElement.type, React.Fragment, 'sheet is mounted beside the row, outside inline Text');
const detailsElement = rowElement.props.children[1], detailsOwner = host();
let modal = render(detailsOwner, detailsElement.type, detailsElement.props); flush(detailsOwner);
assert.equal(modal.type, sheet, 'uses Twitch BottomSheet');
assert.equal(modal.props.visible, true);
assert.equal(modal.props.accessibilityLabel, 'Example, BTTV global emote');
const preview = render(host(), modal.props.children.type, modal.props.children.props);
assert.equal(preview.props.style, 'native-root');
assert.equal(preview.props.children.type, 'View', 'keeps the unknown-type early-return preview without an action-list panel');
assert.equal(preview.props.children.props.children[2].props.children, 'BTTV global emote');
assert.equal(preview.props.children.props.children[2].props.style, 'native-caption');
modal.props.onClose(); modal = render(detailsOwner, detailsElement.type, detailsElement.props);
assert.equal(modal.props.visible, false, 'close preserves sheet dismissal animation');
modal.props.onClosed(); assert.equal(render(owner, row, rowProps).type, 'Provider');
result.props.onPress();
enabled = false; rowElement = render(owner, row, rowProps);
const disabledOwner = host(), disabled = rowElement.props.children[1];
render(disabledOwner, disabled.type, disabled.props); flush(disabledOwner);
assert.equal(render(disabledOwner, disabled.type, disabled.props).props.visible, false, 'disable dismisses an open sheet');
enabled = true; foreground = false;
const before = owner.state[0]; passed.onPress(); assert.equal(owner.state[0], before, 'background cannot open another sheet');
const nativeProps = {emoteId: 'native', onPress() {}};
assert.equal(render(partOwner, part, nativeProps).props.onPress, nativeProps.onPress, 'native emote actions stay intact');
render(owner, row, {...rowProps, message: {body: 'Next message', emotes: []}});
flush(owner); assert.equal(owner.state[0], null, 'recycled message identity clears stale selection');
rowContext = null;
render(partOwner, part, props); assert.equal(passed.onPress, undefined, 'unowned inline attachments cannot launch a sheet');
assert(nativeCalls >= 3, 'original component and its hooks execute on every render');
console.log('Emote details: provider metadata, native card/sheet, untouched native actions, lazy loading, dismissal and policy passed.');
