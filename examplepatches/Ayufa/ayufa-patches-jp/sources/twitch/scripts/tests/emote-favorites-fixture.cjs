const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const source = fs.readFileSync(path.resolve(__dirname, '../../patches/src/main/resources/reactnative/emote-favorites.js'), 'utf8')
    .replace(/__TWITCH_[A-Z_]+_MODULE__/g, '1');
const state = {card: null};
const React = {
    useMemo(callback) { return callback(); },
    useState() { return [state.card, value => { state.card = value; }]; },
    Fragment: 'Fragment',
    useSyncExternalStore(subscribe, snapshot) { return snapshot(); },
    isValidElement(node) { return Boolean(node && node.props); },
    createElement(type, props) { return {type, key: props && props.key, props: props || {}}; },
    cloneElement(element, props, children) {
        return {...element, key: props && props.key || element.key, props: {...element.props, ...props, ...(arguments.length > 2 ? {children} : {})}};
    },
    Children: {
        toArray(children) { return children == null ? [] : Array.isArray(children) ? children : [children]; },
        map(children, callback) { return this.toArray(children).map(callback); }
    }
};
const twitch = (id, token, extra) => ({id, token, ...extra});
const external = (token, host = 'cdn.7tv.app') => ({id: 'twitchpatches:' + host + '/' + token, token});

function fixture(options = {}) {
    state.card = null;
    const adapters = {}, links = [];
    let favorites, enabled = true, received, preview = options.preview || null, card = options.card || {emoteType: 'global'};
    const runtime = {
        policyHook() { return enabled; },
        enabled() { return enabled; },
        log() {},
        decorate(id, name, adapter) { adapters[name] = adapter; },
        decorateOutermost(id, name, adapter) { adapters[name] = adapter; },
        emoteDetails: {decode(id) {
            const value = id.slice('twitchpatches:'.length), slash = value.indexOf('/');
            return {url: `https://${value.slice(0, slash)}/emote/${value.slice(slash + 1)}/2x.webp`};
        }},
        emotes: options.catalog && {subscribe() { return () => {}; }, pickerSnapshot() { return options.catalog; }},
        emotePicker: options.catalog && {sections: catalog => catalog}
    };
    vm.runInNewContext(source, {globalThis: {__twitchPatchRuntime: runtime, RN$registerCallableModule(name, factory) {
        assert.equal(name, 'TwitchPatchFavorites');
        favorites = factory();
    }}});
    const modules = () => ({
        IconStar: 'IconStar', IconStarHollow: 'IconStarHollow', fetchEmoteCardData: () => card, Pressable: 'Pressable', ChatCardHost: 'ChatCardHost',
        useTheme: () => ({colors: {textBase: 'text'}}),
        Linking: {openURL(url) { links.push(url); return Promise.resolve(); }}
    });
    const hook = adapters.useEmotePreview(() => preview);
    const chosen = [];
    const rowSelect = emote => chosen.push(emote.token);
    const insert = {type: 'MenuItem', props: {testID: 'emote-preview-insert', figure: {icon: 'IconArrowUp'}, children: 'Insert'}};
    const tree = props => {
        received = props;
        hook({});
        return {type: 'Tray', props: {
            children: {type: 'SectionList', props: {testID: 'emote-grid-list', renderItem: () => ({type: 'Row', props: {onSelectEmote: rowSelect}})}},
            footer: {type: 'ScrollView', props: {testID: 'emote-nav-tablist', children: [
                {type: 'NavTab', key: 'twitchpatches-favorites', props: {category: {key: 'twitchpatches-favorites'}}},
                {type: 'NavTab', key: 'global', props: {category: {key: 'global'}}}
            ]}},
            overlay: {type: 'Menu', props: {children: [{type: 'Heading', props: {}}, insert]}}
        }};
    };
    const cardTree = () => ({type: 'View', props: {children: [
        {type: 'View', props: {style: 'headerRow', children: [{type: 'Image', props: {testID: 'chat-emote-card-image'}}, {type: 'View', props: {style: 'headerText'}}]}},
        {type: 'List', props: {children: [{type: 'Row', props: {testID: 'chat-emote-card-follow'}}, {type: 'Row', props: {testID: 'chat-emote-card-report'}}]}}
    ]}});
    return {
        render: adapters.EmotePickerTray(tree, React, null, modules),
        renderCard: adapters.EmoteCard(cardTree, React, null, modules),
        links, received: () => received, api: runtime.emoteFavorites, selected: () => chosen, rowSelect,
        set: (keys, details = {}) => favorites.set(JSON.stringify({keys, details})), setRaw: value => favorites.set(JSON.stringify(value)),
        setEnabled(value) { enabled = value; }, setPreview(value) { preview = value; }, setCard(value) { card = value; }
    };
}
const sections = [
    {id: 'channel', category: 'current_channel', title: 'Channel', emotes: [twitch('1', 'One'), twitch('2', 'Two', {locked: true})]},
    {id: 'global', category: 'global', title: 'Global', emotes: [twitch('3', 'Three')]}
];
const menu = tree => tree.props.overlay.props.children;
const tokens = section => Array.from(section.emotes, emote => emote.token);
const cardHeader = tree => tree.props.children[0].props.children;

module.exports = {cardHeader, external, fixture, menu, sections, tokens, twitch};
