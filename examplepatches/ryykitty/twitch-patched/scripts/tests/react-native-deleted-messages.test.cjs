const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const root = path.resolve(__dirname, '../../patches/src/main/resources/reactnative');

function fixture() {
    let adapter, enabled = true, state = null, effects = [], seen;
    const originalPress = () => {};
    const runtime = {decorateType(id, name, value) { adapter = value; },
        policyHook() { return enabled; }, enabled() { return enabled; }};
    const React = {
        useState() { return [state, value => { state = value; }]; },
        useEffect(effect) { effects.push(effect); },
        isValidElement(node) { return !!node && typeof node === 'object' && !!node.props; },
        cloneElement(node, props) { return {...node, props: {...node.props, ...props}}; }
    };
    vm.runInNewContext(fs.readFileSync(path.join(root, 'deleted-messages.js'), 'utf8')
        .replace('__TWITCH_DELETED_ROW_MODULE__', '11'), {globalThis: {__twitchPatchRuntime: runtime}});
    const render = adapter(props => {
        seen = props;
        return {type: 'Pressable', props: {testID: 'chat-message-row', onPress: originalPress,
            onLongPress: originalPress, children: props.message.modActionType ? props.message.body : 'deleted'}};
    }, React);
    return {render(props) { const node = render(props); effects.splice(0).forEach(fn => fn()); return node; },
        setEnabled(value) { enabled = value; }, seen: () => seen, originalPress};
}

test('deleted React Native rows reveal retained text without modifying the message or moderation state', () => {
    const f = fixture();
    const message = Object.freeze({id: 'one', deleted: true, hidden: false, body: 'Retained text',
        modActionType: 'timeout', modLogin: 'moderator', emotes: Object.freeze([{id: 'native'}])});
    const props = Object.freeze({channelID: '123', message});
    for (let i = 0; i < 4; i++) {
        let row = f.render(props);
        assert.equal(row.props.children, 'deleted');
        assert.equal(row.props.accessibilityHint, 'Show deleted message');
        row.props.onPress();
        row = f.render(props);
        assert.equal(row.props.children, 'Retained text');
        assert.equal(f.seen().message.deleted, true);
        assert.equal(f.seen().message.modActionType, 'timeout');
        assert.equal(f.seen().message.emotes, message.emotes);
        assert.equal(row.props.onLongPress, f.originalPress);
        row.props.onPress();
    }
    assert.equal(message.modActionType, 'timeout');
    assert.equal(props.message, message);
});

test('disabled, blocked, ordinary and unavailable messages retain Twitch behavior', () => {
    const f = fixture();
    for (const message of [
        {id: 'one', deleted: false, body: 'ordinary'},
        {id: 'two', deleted: true, hidden: true, body: 'blocked'},
        {id: 'three', deleted: true, body: ''},
        {deleted: true, body: 'missing identity'}
    ]) {
        const props = {channelID: '123', message};
        assert.equal(f.render(props).props.onPress, f.originalPress);
        assert.equal(f.seen(), props);
    }
    const props = {channelID: '123', message: {id: 'one', deleted: true, body: 'retained'}};
    const stale = f.render(props).props.onPress;
    f.setEnabled(false);
    stale();
    assert.equal(f.render(props).props.onPress, f.originalPress);
    assert.equal(f.seen(), props);
    f.setEnabled(true);
    assert.equal(f.render(props).props.children, 'deleted');
});

test('recycled rows do not reveal a different message or channel', () => {
    const f = fixture();
    const props = {channelID: '123', message: {id: 'one', deleted: true, body: 'first'}};
    f.render(props).props.onPress();
    assert.equal(f.render(props).props.children, 'first');
    assert.equal(f.render({...props, channelID: '456'}).props.children, 'deleted');
    assert.equal(f.render({...props, message: {...props.message, id: 'two'}}).props.children, 'deleted');
    f.setEnabled(false); f.render(props);
    f.setEnabled(true);
    assert.equal(f.render(props).props.children, 'deleted');
});

test('deleted-message decoration stays inside the emote wrapper in either patch order', () => {
    for (const deletedFirst of [true, false]) {
        let wrapped;
        const context = vm.createContext({console: {info() {}}, RN$registerCallableModule() {}});
        vm.runInContext(fs.readFileSync(path.join(root, 'bootstrap.js'), 'utf8')
            .replace('__TWITCH_REACT_MODULE__', '7'), context);
        const runtime = context.__twitchPatchRuntime;
        const deleted = () => runtime.decorateType(11, 'ChatMessageRow', original => props => original({...props, revealed: true}));
        const emotes = () => runtime.target(11, 'ChatMessageRow', original => ({...original,
            type: props => original.type({...props, emotes: true})}), true);
        if (deletedFirst) { deleted(); emotes(); } else { emotes(); deleted(); }
        const compare = () => false;
        context.__d = factory => { wrapped = factory; };
        context.__d((global, require, a, b, module) => {
            module.exports.ChatMessageRow = {$$typeof: Symbol.for('react.memo'), type: props => props, compare};
        }, 11);
        const module = {exports: {}};
        wrapped(context, () => ({}), null, null, module, module.exports);
        const row = module.exports.ChatMessageRow;
        assert.equal(row.compare, compare);
        assert.deepEqual(row.type({id: 'fixture'}), {id: 'fixture', emotes: true, revealed: true});
    }
});
