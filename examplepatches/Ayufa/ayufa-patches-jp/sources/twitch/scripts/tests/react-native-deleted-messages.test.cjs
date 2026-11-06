const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const root = path.resolve(__dirname, '../../patches/src/main/resources/reactnative');

function fixture() {
    let adapter, enabled = true, seen;
    const runtime = {decorateType(id, name, value) { adapter = value; }, policyHook() { return enabled; }};
    vm.runInNewContext(fs.readFileSync(path.join(root, 'deleted-messages.js'), 'utf8')
        .replace('__TWITCH_DELETED_ROW_MODULE__', '11'), {globalThis: {__twitchPatchRuntime: runtime}});
    const render = adapter(props => { seen = props; return 'row'; }, {});
    return {render, setEnabled(value) { enabled = value; }, seen: () => seen};
}

test('deleted messages use Twitch moderator view without changing the original', () => {
    const f = fixture();
    const message = Object.freeze({id: 'one', deleted: true, hidden: false, body: 'Retained', emotes: Object.freeze([{id: 'native'}])});
    const props = Object.freeze({channelID: '123', message});
    assert.equal(f.render(props), 'row');
    assert.equal(f.seen().message.modActionType, 'delete');
    assert.equal(f.seen().message.deleted, true);
    assert.equal(f.seen().message.body, 'Retained');
    assert.equal(f.seen().message.emotes, message.emotes);
    assert.equal(f.seen().channelID, '123');
    assert.equal(props.message, message);
    assert.equal(message.modActionType, undefined);
});

test('a moderation action Twitch already knows is kept', () => {
    const f = fixture();
    for (const modActionType of ['ban', 'timeout', 'delete']) {
        const props = {channelID: '1', message: {id: 'a', deleted: true, body: 'kept', modActionType, modLogin: 'moderator'}};
        f.render(props);
        assert.equal(f.seen(), props);
    }
});

test('ordinary, blocked and empty messages keep Twitch behavior', () => {
    const f = fixture();
    for (const message of [
        undefined,
        {id: 'one', deleted: false, body: 'ordinary'},
        {id: 'two', deleted: true, hidden: true, body: 'blocked'},
        {id: 'three', deleted: true, body: ''},
        {id: 'four', deleted: true}
    ]) {
        const props = {channelID: '123', message};
        f.render(props);
        assert.equal(f.seen(), props);
    }
});

test('disabling the setting restores the stock placeholder in both directions', () => {
    const f = fixture();
    const props = {channelID: '123', message: {id: 'one', deleted: true, body: 'retained'}};
    for (let i = 0; i < 3; i++) {
        f.setEnabled(false);
        f.render(props);
        assert.equal(f.seen(), props);
        f.setEnabled(true);
        f.render(props);
        assert.equal(f.seen().message.modActionType, 'delete');
    }
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
