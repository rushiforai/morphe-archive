const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

test('display-ad surfaces stop creatives and retain native behavior when blocking is off', () => {
    const targets = new Map();
    let blocked = true;
    const runtime = {target(id, name, adapter) { targets.set(name, adapter); }, policyHook(React, index) {
        assert.equal(index, 4);
        return blocked;
    }};
    const React = {createElement(type, props) { return {type, props}; },
        memo(type, compare) { return {type, compare}; }};
    const source = fs.readFileSync(path.resolve(__dirname,
        '../../patches/src/main/resources/reactnative/display-ad-surfaces.js'), 'utf8')
        .replace('__TWITCH_STREAM_DISPLAY_MODULE__', '1').replace('__TWITCH_FEED_AD_ITEM_MODULE__', '2');
    vm.runInNewContext(source, {__twitchPatchRuntime: runtime});
    const original = () => {};
    const stream = targets.get('StreamDisplayAdSurface')(original, React);
    const memo = {compare: () => false};
    const feed = targets.get('FeedAdItem')(memo, React);
    const props = {enabled: true, sdaState: {fixture: true}, onError() {}};
    const result = stream(props);
    assert.equal(result.type, original);
    assert.equal(result.props.enabled, false);
    assert.equal(result.props.sdaState, props.sdaState);
    assert.equal(result.props.onError, props.onError);
    assert.equal(props.enabled, true);
    assert.equal(feed.type(props), null);
    blocked = false;
    assert.equal(stream(props).props, props);
    assert.equal(feed.type(props).props, props);
    assert.equal(feed.compare, memo.compare);
});
