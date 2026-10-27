const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

function fixture() {
    const adapters = {}, preferences = {};
    const runtime = {ui: {useEnabled(React, key) { return preferences[key] === true; }},
        decorate(id, name, adapter) { adapters[name] = adapter; }};
    const React = {createElement(type, props) { return {type, props}; }, useMemo(factory) { return factory(); }};
    const source = fs.readFileSync(path.resolve(__dirname, '../../patches/src/main/resources/reactnative/ui-chat-overlays.js'), 'utf8')
        .replace(/__TWITCH_UI_[A-Z_]+_MODULE__/g, '10');
    vm.runInNewContext(source, {globalThis: {__twitchPatchRuntime: runtime}});
    return {adapters, preferences, React};
}

test('overlay hosts remove the entire component and restore props across live toggles', () => {
    const f = fixture();
    for (const [name, key] of [['ChannelLeaderboardStripHost', 'hide_leaderboards'],
        ['TheatrePlayerHypeTrain', 'hide_hype_trains'],
        ['SkylineHypeTrainHost', 'hide_hype_trains']]) {
        const original = () => {}, props = {channel: 'fixture', onPress() {}};
        const render = f.adapters[name](original, f.React);
        for (let i = 0; i < 4; i++) {
            f.preferences[key] = true;
            assert.equal(render(props), null);
            f.preferences[key] = false;
            assert.equal(render(props).type, original);
            assert.equal(render(props).props, props);
        }
    }
});

test('highlight selectors preserve other events, selection, notifications and the unmodified store', () => {
    const f = fixture();
    const train = {id: 'train', event: {type: 'hype'}}, drops = {id: 'drops', event: {type: 'drops'}};
    const poll = {id: 'poll', event: {type: 'poll'}};
    const state = {highlights: [train, drops, poll], currentIndex: 2, notifications: ['train', 'poll'],
        hide: false, trackedHighlightIDs: new Set(['train']), uuid: 'fixture'};
    Object.freeze(state.highlights); Object.freeze(state.notifications); Object.freeze(state);
    for (const name of ['useHighlightSelector', 'useMaybeHighlightSelector']) {
        let current = state;
        const select = f.adapters[name](fn => fn(current), f.React, null,
            () => ({hypeTrainHighlightRegistration: {type: 'hype'}}));
        for (let i = 0; i < 4; i++) {
            f.preferences.hide_hype_trains = true;
            const filtered = select(s => s);
            assert.deepEqual(Array.from(filtered.highlights), [drops, poll]);
            assert.equal(filtered.currentIndex, 1);
            assert.deepEqual(Array.from(filtered.notifications), ['poll']);
            assert.equal(filtered.trackedHighlightIDs, state.trackedHighlightIDs);
            assert.equal(select(s => s), filtered, 'snapshot identity must remain stable');
            f.preferences.hide_hype_trains = false;
            assert.equal(select(s => s), state);
        }
        f.preferences.hide_hype_trains = true;
        current = {...state, highlights: [train], currentIndex: 0};
        assert.equal(select(s => s.highlights.length), 0);
        assert.equal(select(s => s.currentIndex), 0);
        current = {...state, highlights: [drops, poll], currentIndex: 1};
        assert.equal(select(s => s), current);
    }
});

test('carousel dispatch maps visible indices without changing ID-based actions or the source state', () => {
    const f = fixture();
    const entry = (id, extra = {}) => ({id, event: {type: id === 'train' ? 'hype' : 'other'}, ...extra});
    const entries = [entry('hidden', {hidden: true}), entry('train'), entry('sticky', {sticky: true}), entry('drops'), entry('poll')];
    const state = Object.freeze({highlights: Object.freeze(entries), currentIndex: 2});
    let current = state;
    const requireModule = () => ({hypeTrainHighlightRegistration: {type: 'hype'}});
    f.adapters.useMaybeHighlightSelector(select => current && select(current), f.React, null, requireModule);
    const select = f.adapters.useHighlightSelector(fn => fn(current), f.React, null, requireModule);
    for (const name of ['useHighlightDispatch', 'useMaybeHighlightDispatch']) {
        const calls = [], dispatch = action => calls.push(action);
        let original = dispatch;
        const useDispatch = f.adapters[name](() => original, f.React, null, requireModule);
        for (let i = 0; i < 4; i++) {
            f.preferences.hide_hype_trains = true;
            assert.equal(select(s => s.currentIndex), 1);
            const action = Object.freeze({type: 'set-current-index', index: 0});
            useDispatch()(action);
            assert.equal(calls.at(-1).index, 1);
            assert.equal(action.index, 0);
            useDispatch()({type: 'set-current-index', index: 1});
            assert.equal(calls.at(-1).index, 2);
            const before = calls.length;
            useDispatch()({type: 'set-current-index', index: 2});
            assert.equal(calls.length, before);
            const move = {type: 'move-to-highlight', id: 'poll'};
            useDispatch()(move);
            assert.equal(calls.at(-1), move);
            f.preferences.hide_hype_trains = false;
            assert.equal(useDispatch(), dispatch);
        }
        f.preferences.hide_hype_trains = true;
        current = null;
        assert.equal(useDispatch(), dispatch);
        original = null;
        assert.equal(useDispatch(), null);
        current = state;
        assert.equal(useDispatch(), null);
    }
    assert.equal(state.highlights, entries);
    assert.equal(state.currentIndex, 2);
});
