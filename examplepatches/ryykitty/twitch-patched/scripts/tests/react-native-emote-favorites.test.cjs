const test = require('node:test');
const assert = require('node:assert/strict');
const {external, fixture, menu, sections, tokens, twitch} = require('./emote-favorites-fixture.cjs');

test('favorites keep the saved order and only list emotes available here', () => {
    const f = fixture({catalog: [{emotes: [external('catJAM')]}]});
    f.set(['t:3', 'c:7tv:catJAM', 't:missing', 't:1', 'c:7tv:gone']);
    f.render({channelID: '5', sections});
    const [favorites, ...rest] = f.received().sections;
    assert.equal(favorites.id, 'twitchpatches-favorites');
    assert.equal(favorites.category, 'current_channel');
    assert.equal(favorites.title, 'Favorites');
    assert.deepEqual(tokens(favorites), ['Three', 'catJAM', 'One']);
    assert.equal(rest.length, 2);
    assert.equal(rest[0], sections[0]);
    assert.equal(rest[1], sections[1]);
});

test('a channel emote stays out of a channel where it is not available', () => {
    const f = fixture({catalog: [{emotes: [external('Other')]}]});
    f.set(['c:7tv:catJAM']);
    const props = {channelID: '6', sections};
    f.render(props);
    assert.equal(f.received(), props);
});

test('another provider or emote with the same name does not match', () => {
    const f = fixture({catalog: [{emotes: [{id: 'twitchpatches:cdn.betterttv.net/different', token: 'catJAM'}]}]});
    f.set(['c:7tv:catJAM']);
    const props = {channelID: '6', sections};
    f.render(props);
    assert.equal(f.received(), props);
});

test('an empty list adds no section', () => {
    const f = fixture();
    const props = {channelID: '5', sections};
    f.render(props);
    assert.equal(f.received(), props);
});

test('a locked emote from this picker stays the original locked tile', () => {
    const f = fixture();
    f.set(['t:2']);
    f.render({channelID: '5', sections});
    assert.equal(f.received().sections[0].emotes[0], sections[0].emotes[1]);
});

test('an unlocked copy wins over a locked one', () => {
    const f = fixture();
    f.set(['t:7']);
    const unlocked = twitch('7', 'Seven');
    f.render({channelID: '5', sections: [
        {id: 'a', category: 'global', emotes: [twitch('7', 'Seven', {locked: true})]},
        {id: 'b', category: 'global', emotes: [unlocked]}
    ]});
    assert.equal(f.received().sections[0].emotes[0], unlocked);
});

test('a favorite from another channel shows as a locked tile', () => {
    const f = fixture();
    f.set(['t:99'], {'t:99': {token: 'aurumWave', channel: '123', kind: 'SUBSCRIPTIONS'}});
    f.render({channelID: '5', sections});
    const [emote] = f.received().sections[0].emotes;
    assert.equal(emote.id, '99');
    assert.equal(emote.token, 'aurumWave');
    assert.equal(emote.locked, true);
    assert.equal(emote.unlockKind, 'subscription');
    f.set(['t:98'], {'t:98': {token: 'x', channel: '123', kind: 'FOLLOWER'}});
    f.render({channelID: '5', sections});
    assert.equal(f.received().sections[0].emotes[0].unlockKind, 'follow');
});

test('a favorite with no details and no picker entry is left out', () => {
    const f = fixture();
    f.set(['t:99'], {'t:99': {token: '', channel: 'x', kind: 'MADE_UP'}});
    const props = {channelID: '5', sections};
    f.render(props);
    assert.equal(f.received(), props);
});

test('the setting removes the section and leaves the tree untouched', () => {
    const f = fixture();
    f.set(['t:1']);
    f.setEnabled(false);
    const props = {channelID: '5', sections};
    const tree = f.render(props);
    assert.equal(f.received(), props);
    assert.equal(menu(tree).length, 2);
    assert.equal(tree.props.footer.props.children[0].type, 'NavTab');
});

test('the menu offers to add, toggles through the link and closes', () => {
    let dismissed = 0;
    const f = fixture({preview: {previewEmote: twitch('3', 'Three'), dismissPreview() { dismissed++; }}});
    const tree = f.render({channelID: '5', sections});
    const item = menu(tree)[2];
    assert.equal(item.props.testID, 'emote-preview-favorite');
    assert.equal(item.props.children, 'Add to Favorites');
    assert.equal(item.props.figure.icon, 'IconStarHollow');
    item.props.onPress();
    assert.equal(dismissed, 1);
    assert.deepEqual(f.links, ['twitch-patches://favorites/toggle?key=t%3A3']);
    const next = f.render({channelID: '5', sections});
    assert.equal(f.received().sections[0].emotes[0].token, 'Three');
    assert.equal(menu(next)[2].props.children, 'Remove from Favorites');
    assert.equal(menu(next)[2].props.figure.icon, 'IconStar');
});

test('provider emotes toggle by provider and emote id', () => {
    const f = fixture({preview: {previewEmote: external('catJAM'), dismissPreview() {}}});
    menu(f.render({channelID: '5', sections}))[2].props.onPress();
    assert.deepEqual(f.links, ['twitch-patches://favorites/toggle?key=c%3A7tv%3AcatJAM']);
});

test('locked emotes can be favorited from the menu with their channel details', () => {
    const f = fixture({preview: {previewEmote: twitch('2', 'Two', {locked: true, unlockKind: 'follow'}), dismissPreview() {}}});
    const item = menu(f.render({channelID: '5', sections}))[2];
    assert.equal(item.props.children, 'Add to Favorites');
    item.props.onPress();
    assert.deepEqual(f.links, ['twitch-patches://favorites/toggle?key=t%3A2&token=Two&channel=5&kind=FOLLOWER']);
    f.setPreview(null);
    assert.equal(menu(f.render({channelID: '5', sections})).length, 2);
});

test('removing a favorite drops its details from the link', () => {
    const f = fixture({preview: {previewEmote: twitch('2', 'Two', {locked: true}), dismissPreview() {}}});
    f.set(['t:2'], {'t:2': {token: 'Two', channel: '5', kind: 'SUBSCRIPTIONS'}});
    menu(f.render({channelID: '5', sections}))[2].props.onPress();
    assert.deepEqual(f.links, ['twitch-patches://favorites/toggle?key=t%3A2']);
});

test('tapping a locked favorite from elsewhere opens its card, others keep Twitch behavior', () => {
    const f = fixture();
    f.set(['t:99'], {'t:99': {token: 'aurumWave', channel: '123', kind: 'SUBSCRIPTIONS'}});
    const list = f.render({channelID: '5', sections}).props.children;
    const elsewhere = {id: '99', token: 'aurumWave', locked: true, lockedElsewhere: true};
    const row = list.props.renderItem({section: {key: 'twitchpatches-favorites'}, item: {emotes: [elsewhere]}});
    row.props.onSelectEmote(twitch('1', 'One'));
    assert.deepEqual(f.selected(), ['One']);
    row.props.onSelectEmote(elsewhere);
    assert.deepEqual(f.selected(), ['One']);
    const tree = f.render({channelID: '5', sections});
    assert.equal(tree.type, 'Fragment');
    assert.equal(tree.props.children, undefined);
    assert.equal(list.props.renderItem({section: {key: 'channel'}}).props.onSelectEmote, f.rowSelect);
});

test('only the favorites tab is replaced with the star tab', () => {
    const f = fixture();
    const tabs = f.render({channelID: '5', sections}).props.footer.props.children;
    assert.equal(typeof tabs[0].type, 'function');
    assert.equal(tabs[1].type, 'NavTab');
});

test('invalid native data is ignored', () => {
    const f = fixture();
    f.set(['t:1']);
    f.setRaw({not: 'an array'});
    f.setRaw(['t:3']);
    f.render({channelID: '5', sections});
    assert.equal(f.received().sections[0].emotes[0].token, 'One');
    f.set(['bad key', 7, 't:3']);
    f.render({channelID: '5', sections});
    assert.deepEqual(tokens(f.received().sections[0]), ['Three']);
});
