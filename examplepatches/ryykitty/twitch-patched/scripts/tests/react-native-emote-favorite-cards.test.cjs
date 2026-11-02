const test = require('node:test');
const assert = require('node:assert/strict');
const {cardHeader, fixture, twitch} = require('./emote-favorites-fixture.cjs');

test('usable emotes get a header star beside the emote that toggles in place', () => {
    const f = fixture();
    const header = cardHeader(f.renderCard({emote: twitch('3', 'Three')}));
    assert.equal(header.length, 3);
    assert.equal(header[0].props.testID, 'chat-emote-card-image');
    const star = header[2];
    assert.equal(star.props.testID, 'emote-card-favorite');
    assert.equal(star.props.accessibilityLabel, 'Add to Favorites');
    assert.equal(star.props.children.type, 'IconStarHollow');
    assert.equal(star.props.children.props.fillColor, 'text');
    star.props.onPress();
    assert.deepEqual(f.links, ['twitch-patches://favorites/toggle?key=t%3A3']);
    const next = cardHeader(f.renderCard({emote: twitch('3', 'Three')}))[2];
    assert.equal(next.props.accessibilityLabel, 'Remove from Favorites');
    assert.equal(next.props.children.type, 'IconStar');
});

test('Twitch rows stay as they are', () => {
    const f = fixture();
    const list = f.renderCard({emote: twitch('3', 'Three')}).props.children[1].props.children;
    assert.deepEqual(Array.from(list, row => row.props.testID), ['chat-emote-card-follow', 'chat-emote-card-report']);
});

test('every Twitch emote gets a star and sends its details for a locked tile', () => {
    const f = fixture();
    const cases = [
        [{emoteType: 'subscription', emoteChannelID: '123', isUserSubscribedToTier: false}, '&token=Nine&channel=123&kind=SUBSCRIPTIONS'],
        [{emoteType: 'follower', emoteChannelID: '123'}, '&token=Nine&channel=123&kind=FOLLOWER'],
        [{emoteType: 'bitsTier', emoteChannelID: '123'}, '&token=Nine&channel=123&kind=BITS_BADGE_TIERS'],
        [{emoteType: 'global'}, '']
    ];
    for (const [card, query] of cases) {
        f.links.length = 0;
        f.set([]);
        f.setCard(card);
        cardHeader(f.renderCard({emote: twitch('9', 'Nine')}))[2].props.onPress();
        assert.deepEqual(f.links, ['twitch-patches://favorites/toggle?key=t%3A9' + query]);
    }
});

test('the card is untouched when disabled or when it has no emote id', () => {
    const f = fixture();
    assert.equal(cardHeader(f.renderCard({emote: {token: 'catJAM'}})).length, 2);
    f.setEnabled(false);
    assert.equal(cardHeader(f.renderCard({emote: twitch('3', 'Three')})).length, 2);
    assert.equal(cardHeader(f.renderCard({emote: {token: 'catJAM'}, favoriteKey: 'c:7tv:catJAM'})).length, 2);
});

test('provider cards get the same star from their provider key', () => {
    const f = fixture();
    assert.equal(f.api.providerKey('https://cdn.frankerfacez.com/emote/128054/animated/2.gif'), 'c:frankerfacez:128054');
    assert.equal(f.api.providerKey('https://cdn.betterttv.net/emote/abc/2x.webp'), 'c:betterttv:abc');
    assert.equal(f.api.providerKey('https://cdn.example.test/emote/1/2x.webp'), null);
    f.setCard({emoteType: 'unknown'});
    const star = cardHeader(f.renderCard({emote: {token: 'catJAM'}, favoriteKey: 'c:7tv:catJAM'}))[2];
    assert.equal(star.props.testID, 'emote-card-favorite');
    star.props.onPress();
    assert.deepEqual(f.links, ['twitch-patches://favorites/toggle?key=c%3A7tv%3AcatJAM']);
});
