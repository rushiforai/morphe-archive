const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const {test} = require('node:test');

function fixture() {
    const external = (name, provider) => ({name, provider, url: `https://example.test/${provider}/${name}.webp`,
        staticURL: `https://example.test/${provider}/${name}.png`, ratio: 1, format: 'webp'});
    let enabled = true, inline = true;
    const catalogs = new Map([
        ['1', new Map([['KEK', external('KEK', '7tv')], ['FeelsGoodMan', external('FeelsGoodMan', 'bttv')],
            ['Channel', external('Channel', 'ffz')], ['Kappa', external('Kappa', 'ffz')]])],
        ['2', new Map([['Other', external('Other', '7tv')]])]
    ]);
    const targets = new Map(), retained = [], sent = [], changed = [];
    const runtime = {
        target(id, name, adapter) { targets.set(name, adapter); },
        enabled() { return enabled; }, policyHook(react, index) { return index === 14 ? inline : enabled; }, subscribe() {},
        emotes: {subscribe() {}, snapshot(channel) { return catalogs.get(channel) || new Map(); },
            retain(channel) { retained.push(channel); return () => retained.push(`release:${channel}`); }}
    };
    const effects = [];
    const React = {useMemo(callback) { return callback(); }, useCallback(callback) { return callback; },
        useEffect(callback) { effects.push(callback); }, useSyncExternalStore(subscribe, snapshot) { return snapshot(); }};
    vm.runInNewContext(fs.readFileSync(path.resolve(__dirname,
        '../../patches/src/main/resources/reactnative/emote-input.js'), 'utf8').replace(/__TWITCH_[A-Z_]+_MODULE__/g, '1'),
    {__twitchPatchRuntime: runtime});
    let received;
    const native = [{id: '25', token: 'Kappa'}], bits = {Cheer100: {url: 'https://example.test/bits.gif', imageCharCount: 5}};
    function original(props) {
        received = props;
        return {draft: ':KEK:', cheermoteTokenImages: bits, onSendTextChange(draft, sendText) { changed.push([draft, sendText]); },
            appendToken(emote) { changed.push(emote.token); }, sentinel: 'retained'};
    }
    const Composer = targets.get('useChatComposer')(original, React);
    function render(channel = '1') {
        return Composer({channelID: channel, emoteSuggestions: native,
            send() { sent.push({context: this, args: [...arguments]}); return 'sent'; }});
    }
    const Bar = targets.get('ChatComposerBar')(props => props, React);
    const createEmoteProvider = factory => targets.get('createEmoteProvider')(factory)();
    return {runtime, catalogs, retained, sent, changed, bits, native, effects, render, Bar, createEmoteProvider,
        get received() { return received; }, setEnabled(value) { enabled = value; }, setInline(value) { inline = value; }};
}

test('provider emotes use Twitch suggestion models and channel precedence without changing native entries', () => {
    const f = fixture(), result = f.render();
    assert.equal(f.received.emoteSuggestions.length, 4);
    assert.equal(f.received.emoteSuggestions[0], f.native[0]);
    const emote = f.received.emoteSuggestions.find(value => value.token === 'KEK');
    assert.equal(JSON.parse(decodeURIComponent(emote.id.slice(14))).provider, '7tv');
    assert.equal(emote.type, 'GLOBAL');
    assert.equal(result.sentinel, 'retained');
    result.appendToken(emote);
    assert.deepEqual(f.changed, ['KEK']);
    assert.equal(f.sent.length, 0, 'selecting an emote never sends a message');
    f.effects[0]()();
    assert.deepEqual(f.retained, ['1', 'release:1']);
});

test('input previews cover plain picker codes and complete colon wrappers while preserving native and Bits tokens', () => {
    const f = fixture(), result = f.render();
    assert.equal(result.cheermoteTokenImages.KEK.url, 'https://example.test/7tv/KEK.webp');
    assert.equal(result.cheermoteTokenImages[':KEK:'].url, result.cheermoteTokenImages.KEK.url);
    assert.equal(result.cheermoteTokenImages[':Channel:'].url, 'https://example.test/ffz/Channel.webp');
    assert.equal(result.cheermoteTokenImages.Cheer100, f.bits.Cheer100);
    assert.equal(result.cheermoteTokenImages.Kappa, undefined, 'Twitch emotes keep their native image mapping');
    assert.equal(f.bits.KEK, undefined, 'original token map is immutable');
    assert.equal(result.draft, ':KEK:', 'visual rendering does not rewrite a controlled draft');
});

test('only known complete tokens are normalized for sending; commands, case and message arguments survive', () => {
    const f = fixture(), result = f.render(), normalize = f.runtime.emoteInput.normalize;
    const catalog = f.catalogs.get('1');
    assert.equal(normalize('hello :KEK: :Channel: :Missing: :kek: :KE', catalog), 'hello KEK Channel :Missing: :kek: :KE');
    assert.equal(normalize('/me :KEK:', catalog), '/me :KEK:');
    assert.equal(normalize('https://host/:KEK: foo:KEK:', catalog), 'https://host/:KEK: foo:KEK:');
    result.onSendTextChange(':KEK: :FeelsGoodMan:', ':KEK: :FeelsGoodMan:');
    assert.deepEqual(f.changed, [['KEK FeelsGoodMan', 'KEK FeelsGoodMan']]);
    const receiver = {};
    assert.equal(f.received.send.call(receiver, ':KEK:', {reply: '42'}), 'sent');
    assert.equal(f.sent[0].context, receiver);
    assert.deepEqual(f.sent[0].args, ['KEK', {reply: '42'}]);
});

test('channel changes and provider changes update both autocomplete and previews without a restart', () => {
    const f = fixture();
    f.render();
    const other = f.render('2');
    assert.equal(f.received.emoteSuggestions.find(value => value.token === 'KEK'), undefined);
    assert.equal(other.cheermoteTokenImages.KEK, undefined);
    assert.ok(other.cheermoteTokenImages.Other);
    f.catalogs.set('2', new Map());
    assert.equal(f.render('2').cheermoteTokenImages.Other, undefined);
    f.setEnabled(false);
    const disabled = f.render();
    assert.equal(f.received.emoteSuggestions, f.native);
    assert.equal(disabled.cheermoteTokenImages, f.bits);
    disabled.onSendTextChange(':KEK:', ':KEK:');
    assert.deepEqual(f.changed, [[':KEK:', ':KEK:']]);
});

test('turning inline emotes off shows names for every emote and keeps Bits images and autocomplete', () => {
    const f = fixture(), props = {emoteMap: {Kappa: '25'}, cheermoteTokenImages: f.bits};
    assert.equal(f.Bar(props), props);
    f.setInline(false);
    const rendered = f.Bar(props);
    assert.equal(Object.keys(rendered.emoteMap).length, 0, 'Twitch emotes stay as their names');
    assert.equal(rendered.emoteMap, f.Bar(props).emoteMap, 'a stable map avoids rebuilding the input spans');
    assert.equal(rendered.cheermoteTokenImages, f.bits);
    const result = f.render();
    assert.equal(result.cheermoteTokenImages, f.bits);
    assert.ok(f.received.emoteSuggestions.some(value => value.token === 'KEK'));
    f.setInline(true);
    assert.ok(f.render().cheermoteTokenImages.KEK);
});

test('suggestions list names starting with the query first, then alphabetically', () => {
    const f = fixture(), matches = ['CoolCat', 'catJAM', 'mcaT', 'CatBag'].map(replacement => ({replacement: replacement + ' '}));
    const provider = f.createEmoteProvider(() => ({autocompleteType: 'emote', getMatches: () => matches}));
    assert.equal(provider.autocompleteType, 'emote');
    assert.deepEqual(Array.from(provider.getMatches(':cat'), match => match.replacement.trim()), ['CatBag', 'catJAM', 'CoolCat', 'mcaT']);
    assert.equal(matches[0].replacement, 'CoolCat ', 'the original list is not reordered');
    const plainText = f.createEmoteProvider(() => ({getMatches: () => null}));
    assert.equal(plainText.getMatches('hello'), null, 'text that is not an emote query stays without suggestions');
});

test('every keystroke keeps both the draft and the send text, with the setting on or off', () => {
    const f = fixture();
    f.render().onSendTextChange('shown', 'sent');
    f.setEnabled(false);
    f.render().onSendTextChange('shown', 'sent');
    assert.deepEqual(f.changed, [['shown', 'sent'], ['shown', 'sent']]);
});
