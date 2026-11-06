const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

function fixture() {
    const targets = new Map();
    let blocked = false;
    const policy = {enabled(index) { assert.equal(index, 4); return blocked; }};
    const runtime = {target(id, name, factory) { targets.set(name, factory); },
        policyHook(React, index) { return policy.enabled(index); }};
    const source = fs.readFileSync(path.resolve(__dirname,
        '../../patches/src/main/resources/reactnative/channel-skins.js'), 'utf8')
        .replace('__TWITCH_CHANNEL_SKINS_RIBBON_MODULE__', '1')
        .replace('__TWITCH_CHANNEL_SKINS_CAMPAIGN_MODULE__', '3');
    vm.runInNewContext(source, {globalThis: {__twitchPatchRuntime: runtime}});
    return {policy, setBlocked(value) { blocked = value; },
        wrap(name, original) { return targets.get(name)(original, {}, policy); }};
}

test('channel skins skip queries and remove cached ribbons in both toggle directions', () => {
    const f = fixture();
    const receiver = {}, playerRef = {};
    const model = {ctaURL: 'https://advertiser.example', logoURL: 'fixture-logo'};
    const cached = {model, onPressCTA() {}};
    const received = [];
    const hook = f.wrap('useChannelSkinsRibbon', function (...args) {
        assert.equal(this, receiver);
        received.push(args);
        return cached;
    });
    for (let cycle = 0; cycle < 3; cycle++) {
        f.setBlocked(true);
        const hidden = hook.call(receiver, 'channel-id', false, playerRef);
        assert.equal(hidden.model, null);
        assert.equal(hidden.onPressCTA, cached.onPressCTA);
        assert.deepEqual(received.at(-1), [null, true, playerRef]);
        assert.equal(cached.model, model);
        f.setBlocked(false);
        assert.equal(hook.call(receiver, 'channel-id', false, playerRef), cached);
        assert.deepEqual(received.at(-1), ['channel-id', false, playerRef]);
    }
    assert.equal(received.length, 6, 'native hooks run on every render');
});

test('retained query data restores its memoized ribbon without an update and suppresses hidden impressions', () => {
    const f = fixture();
    const queryData = {}, model = {}, state = {model};
    let memoData, memoResult, selections = 0, impressions = 0;
    const hook = f.wrap('useChannelSkinsRibbon', function (channelID, suppressed) {
        if (memoData !== queryData) {
            memoData = queryData;
            memoResult = state;
            selections++;
        }
        if (memoResult.model && !suppressed) impressions++;
        return memoResult;
    });
    f.setBlocked(true);
    assert.equal(hook('channel-id', false, {}).model, null);
    assert.equal(impressions, 0);
    f.setBlocked(false);
    assert.equal(hook('channel-id', false, {}), state);
    assert.equal(impressions, 1);
    assert.equal(selections, 1, 'the original selection remains valid with unchanged query data');
    assert.equal(hook('channel-id', true, {}), state);
    assert.equal(impressions, 1, 'native suppression remains effective when blocking is disabled');
});

test('campaign state settles inactive without dropping native hooks or changing unblocked behavior', () => {
    const f = fixture();
    const receiver = {}, native = {active: true, resolved: false};
    const received = [];
    const hook = f.wrap('useChannelSkinCampaignActive', function (...args) {
        assert.equal(this, receiver);
        received.push(args);
        return native;
    });
    f.setBlocked(true);
    const hidden = hook.call(receiver, 'channel-id', true);
    assert.equal(hidden.active, false);
    assert.equal(hidden.resolved, true);
    assert.deepEqual(received.at(-1), [null, false]);
    assert.equal(native.active, true);
    f.setBlocked(false);
    assert.equal(hook.call(receiver, 'channel-id', false), native);
    assert.deepEqual(received.at(-1), ['channel-id', false]);
});
