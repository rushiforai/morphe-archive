const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

function fixture() {
    const targets = new Map();
    const state = {blocked: true, effects: []};
    const runtime = {target(id, name, adapter) { targets.set(name, adapter); }, policyHook(React, index) {
        assert.equal(index, 4);
        return state.blocked;
    }};
    const React = {createElement(type, props) { return {type, props}; },
        memo(type, compare) { return {type, compare}; },
        useLayoutEffect(effect) { state.effects.push(effect); }};
    const source = fs.readFileSync(path.resolve(__dirname,
        '../../patches/src/main/resources/reactnative/display-ad-surfaces.js'), 'utf8')
        .replace('__TWITCH_STREAM_DISPLAY_MODULE__', '1')
        .replace('__TWITCH_FEED_COORDINATOR_MODULE__', '3')
        .replace('__TWITCH_FEED_AD_ITEM_MODULE__', '2');
    vm.runInNewContext(source, {__twitchPatchRuntime: runtime});
    return {targets, React, state, runEffects() { state.effects.splice(0).forEach(effect => effect()); }};
}

test('display-ad surfaces stop creatives and retain native behavior when blocking is off', () => {
    const f = fixture();
    const original = () => {};
    const stream = f.targets.get('StreamDisplayAdSurface')(original, f.React);
    const memo = {compare: () => false};
    const feed = f.targets.get('FeedAdItem')(memo, f.React);
    const props = {enabled: true, sdaState: {fixture: true}, onError() {}};
    const result = stream(props);
    assert.equal(result.type, original);
    assert.equal(result.props.enabled, false);
    assert.equal(result.props.sdaState, props.sdaState);
    assert.equal(result.props.onError, props.onError);
    assert.equal(props.enabled, true);
    assert.equal(feed.type(props), null);
    f.state.blocked = false;
    assert.equal(stream(props).props, props);
    assert.equal(feed.type(props).props, props);
    assert.equal(feed.compare, memo.compare);
});

test('blocked feeds remove ad edges before paint and never request them', () => {
    const f = fixture();
    const removed = [];
    let seen;
    const coordinator = f.targets.get('useFeedAdCoordinator')(options => { seen = options; return 'result'; }, f.React);
    const edges = [
        {node: {__typename: 'FeedStream', id: 'stream'}},
        {node: {__typename: 'FeedAd', id: 'ad-one'}},
        {node: {__typename: 'FeedClip', id: 'clip'}},
        {node: {__typename: 'FeedAd', id: 'ad-two'}},
        null
    ];
    const options = {edges, onAdRemoved: id => removed.push(id), feedSessionID: 'session'};
    assert.equal(coordinator(options), 'result');
    assert.equal(seen.edges.length, 0);
    assert.equal(seen.feedSessionID, 'session');
    assert.equal(options.edges, edges);
    f.runEffects();
    assert.deepEqual(removed, ['ad-one', 'ad-two']);
});

test('the coordinator keeps stock behavior when blocking is off', () => {
    const f = fixture();
    f.state.blocked = false;
    const removed = [];
    let seen;
    const coordinator = f.targets.get('useFeedAdCoordinator')(options => { seen = options; }, f.React);
    const options = {edges: [{node: {__typename: 'FeedAd', id: 'ad'}}], onAdRemoved: id => removed.push(id)};
    coordinator(options);
    assert.equal(seen, options);
    f.runEffects();
    assert.deepEqual(removed, []);
});

test('the blocked coordinator tolerates missing edges and callbacks', () => {
    const f = fixture();
    const coordinator = f.targets.get('useFeedAdCoordinator')(() => 'ok', f.React);
    assert.equal(coordinator({}), 'ok');
    f.runEffects();
    assert.equal(coordinator({edges: [{node: {__typename: 'FeedAd', id: 'ad'}}]}), 'ok');
    f.runEffects();
});
