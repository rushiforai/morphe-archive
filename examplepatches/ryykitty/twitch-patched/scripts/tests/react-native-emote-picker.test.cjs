const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const targets = new Map(), selected = [], effects = [];
let provider = null, enabled = true, mask = 7;
const runtime = {
    target(id, name, adapter) { targets.set(name, adapter); },
    enabled(index) { return index === 5 ? enabled : Boolean(mask & (1 << (index - 8))); },
    policyHook() { return enabled; },
    subscribe() { return () => {}; },
    log() {},
    emoteDetails: {decode(id) { return id.startsWith('twitchpatches:') ? JSON.parse(decodeURIComponent(id.slice(14))) : null; }},
    emotes: {subscribe() { return () => {}; }, pickerSnapshot() { return catalog; }, retain() { return () => {}; }}
};
const external = (name, provider, channel) => ({name, provider, channel, ratio: 1, format: 'gif',
    url: `https://cdn.example.test/${provider}/${name}.gif`, staticURL: `https://cdn.example.test/${provider}/${name}.png`});
const catalog = [
    {provider: 'bttv', channel: true, emotes: [external('Shared', 'bttv', true)]},
    {provider: 'bttv', channel: false, emotes: [external('Global', 'bttv', false)]},
    {provider: '7tv', channel: true, emotes: [external('Shared', '7tv', true)]},
    {provider: 'ffz', channel: false, emotes: [external('FFZ', 'ffz', false)]}
];
const React = {
    useMemo(callback) { return callback(); },
    useState() { return [provider, value => { provider = value; }]; },
    useEffect(callback) { effects.push(callback); },
    useSyncExternalStore(subscribe, snapshot) { return snapshot(); },
    isValidElement(node) { return Boolean(node && node.props); },
    createElement(type, props) { return {type, props}; },
    cloneElement(element, props, children) { return {type: element.type,
        props: {...element.props, ...props, ...(arguments.length > 2 ? {children} : {})}}; },
    Children: {
        toArray(children) { return children == null ? [] : Array.isArray(children) ? children : [children]; },
        map(children, callback) { return this.toArray(children).map(callback); }
    }
};
const source = fs.readFileSync(path.resolve(__dirname, '../../patches/src/main/resources/reactnative/emote-picker.js'), 'utf8');
vm.runInNewContext(source.replace(/__TWITCH_[A-Z_]+_MODULE__/g, '1'), {__twitchPatchRuntime: runtime});
function NavTab(props) {
    return React.createElement('Pressable', {onPress: props.onPress, accessibilityState: {selected: props.active},
        children: React.createElement('View', {testID: 'emote-nav-tab-glyph-' + props.category.key, children: 'native-icon'})});
}
const originalSections = [
    {id: 'channel', title: 'Current channel', category: 'current_channel', emotes: [{id: 'channel', token: 'Channel'}]},
    {id: 'native', title: 'Twitch', category: 'global', emotes: [{id: 'native', token: 'Kappa'}]}
];
let received;
function Original(props) {
    received = props;
    return React.createElement('Hydration', {children: React.createElement('Tray', {
        footer: React.createElement('View', {children: React.createElement('ScrollView', {
            testID: 'emote-nav-tablist', children: [React.createElement({type: NavTab}, {category: {key: 'global'},
                active: true, onPress: () => selected.push('native')})]})})})});
}
const Picker = targets.get('EmotePickerTray')(Original, React, null, () => ({CoreImage: 'CoreImage'}));
const props = {channelID: '123', sections: originalSections, isLoading: false, isError: false,
    onSelectEmote(emote) { selected.push(emote.token); }};
function tabs(tree) { return tree.props.children[0].props.footer.props.children[0].props.children; }
let tree = Picker(props);
assert.equal(received.sections.length, 6, 'native, channel and global sections are expanded initially');
assert.equal(received.sections[0], originalSections[0], 'native section identity remains intact');
assert.equal(received.sections[1].title, 'BTTV Channel Emotes');
assert.equal(received.sections[2].title, '7TV Channel Emotes');
assert.equal(received.sections[3], originalSections[1], 'other Twitch catalogs follow channel providers');
assert.equal(received.sections[4].title, 'BTTV Global Emotes');
assert.equal(received.sections[5].title, 'FrankerFaceZ Global Emotes', 'global-only providers stay at the bottom');
const first = received.sections[1].emotes[0];
assert.equal(runtime.emoteDetails.decode(first.id).provider, 'bttv', 'duplicate names keep separate provider image IDs');
received.onSelectEmote(first);
assert.deepEqual(selected, ['Shared'], 'selection uses the original draft callback');
assert.equal(originalSections.length, 2, 'does not modify Twitch data');
let buttons = tabs(tree);
assert.equal(buttons.length, 4, 'adds three provider buttons to the native footer');
const logo = buttons[1].type(buttons[1].props);
assert.equal(logo.props.children[0].props.children.props.src, 'https://cdn.betterttv.net/assets/logos/bttv_logo.png');
buttons[2].props.onPress();
tree = Picker(props);
assert.equal(received.sections.length, 1);
assert.equal(received.sections[0].title, '7TV Channel Emotes', 'provider navigation filters its complete catalog');
tabs(tree)[0].props.onPress();
Picker(props);
assert.equal(provider, null, 'native navigation restores all sections');
assert.equal(selected.at(-1), 'native');
mask = 5;
provider = '7tv';
tree = Picker(props);
assert.equal(tabs(tree).length, 3, 'a disabled provider has no footer button');
enabled = false;
tree = Picker(props);
assert.equal(tabs(tree).length, 1, 'disabling emotes restores the native footer');
assert.equal(received.sections.length, 2);
const URL = targets.get('makeEmoteURL')((id, options) => id + '/' + options.scale);
assert.equal(URL(first.id, {animated: true}), catalog[0].emotes[0].url);
assert.equal(URL(first.id, {animated: false}), catalog[0].emotes[0].staticURL);
assert.equal(URL('native', {scale: 3}), 'native/3', 'native URLs retain their options');
let warm;
const Prefetch = targets.get('useEmoteImagePrefetch')(props => { warm = props; }, React);
const emotes = Array.from({length: 200}, (_, index) => ({id: String(index)}));
Prefetch({sections: [{category: 'global', emotes}, {category: 'current_channel', emotes}], recents: emotes,
    theme: 'light', animated: true, resetKey: '123'});
assert.equal(warm.recents.length, 12);
assert.equal(warm.sections[0].category, 'current_channel');
assert.equal(warm.sections.reduce((total, section) => total + section.emotes.length, warm.recents.length), 24);
assert.equal(warm.resetKey, '123');
console.log('Emote picker sections, navigation, draft insertion and bounded prefetch passed.');
