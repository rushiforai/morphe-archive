const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

function createReact() {
    let hooks = [], index = 0;
    const React = {
        Fragment: Symbol('Fragment'),
        createElement(type, props, ...children) { return {type, props, children}; },
        useRef(initial) {
            const slot = index++;
            if (!hooks[slot]) hooks[slot] = {current: initial};
            return hooks[slot];
        },
        useState(initial) {
            const slot = index++;
            if (!hooks[slot]) hooks[slot] = {value: initial};
            const cell = hooks[slot];
            return [cell.value, function (update) {
                cell.value = typeof update === 'function' ? update(cell.value) : update;
            }];
        },
        useEffect(fn, deps) {
            const slot = index++;
            const prev = hooks[slot];
            if (!prev || !prev.deps || deps.some((dep, i) => dep !== prev.deps[i])) {
                if (prev && prev.cleanup) prev.cleanup();
                hooks[slot] = {deps, cleanup: fn()};
            }
        },
        render(component, props) { index = 0; return component(props); },
        reset() { hooks = []; index = 0; }
    };
    return React;
}

function loadAdapters(sandbox) {
    const adapters = {};
    const runtime = {target(id, name, factory) { adapters[name] = factory; }};
    const source = fs.readFileSync(path.resolve(__dirname,
        '../../patches/src/main/resources/reactnative/ui-fixes.js'), 'utf8')
        .replace('__TWITCH_THUMBNAIL_URL_MODULE__', '100')
        .replace('__TWITCH_CORE_IMAGE_MODULE__', '101')
        .replace('__TWITCH_FOLLOWING_THUMBNAIL_MODULE__', '103')
        .replace('__TWITCH_SKYLINE_BACKGROUND_MODULE__', '104')
        .replace('__TWITCH_CHAT_RECONNECTING_LINE_MODULE__', '105')
        .replace('__TWITCH_CHAT_DISCONNECTED_LINE_MODULE__', '106')
        .replace('__TWITCH_CHAT_CONNECTED_LINE_MODULE__', '107')
        .replace('__TWITCH_STATUS_LINE_MODULE__', '108')
        .replace('__TWITCH_CORE_TEXT_MODULE__', '109');
    vm.runInNewContext(source, Object.assign({globalThis: {__twitchPatchRuntime: runtime}}, sandbox));
    return adapters;
}

test('CoreImage refreshes only stream preview URLs on the CDN cadence', () => {
    let now = 300000 * 41 + 1000;
    const timers = new Map();
    let nextTimer = 1;
    const adapters = loadAdapters({
        Date: {now: () => now},
        setInterval(fn) { const id = nextTimer++; timers.set(id, fn); return id; },
        clearInterval(id) { timers.delete(id); }
    });
    const React = createReact();
    function CoreImage() {}
    const render = adapters.CoreImage(CoreImage, React);
    const style = {width: 10};

    const emote = {src: 'https://static-cdn.jtvnw.net/emoticons/v2/1/static/dark/2.0', style};
    const emoteElement = React.render(render, emote);
    assert.equal(emoteElement.type, CoreImage);
    assert.equal(emoteElement.props, emote, 'non-preview images pass through untouched');

    const local = {src: 42, style};
    assert.equal(React.render(render, local).props, local, 'local assets pass through untouched');

    const preview = {src: 'https://static-cdn.jtvnw.net/previews-ttv/live_user_x-440x248.jpg', style};
    const first = React.render(render, preview);
    assert.equal(first.props.src, preview.src + '?v=41');
    assert.equal(first.props.style, style);
    assert.notEqual(first.props, preview, 'preview props are copied, not mutated');
    assert.equal(preview.src.endsWith('?v=41'), false);

    const objectSrc = {src: {uri: preview.src, width: 440}, style};
    const objectElement = React.render(render, objectSrc);
    assert.equal(objectElement.props.src.uri, preview.src + '?v=41');
    assert.equal(objectElement.props.src.width, 440);
    assert.equal(objectSrc.src.uri, preview.src, 'source object is not mutated');

    assert.equal(timers.size, 1, 'a mounted preview polls for the next cadence boundary');
    now += 300000;
    for (const fn of [...timers.values()]) fn();
    const rolled = React.render(render, preview);
    assert.equal(rolled.props.src, preview.src + '?v=42', 'the URL rolls over with the bucket');
});

test('getStreamThumbnailUrl cache-busts only preview URLs', () => {
    let now = 300000 * 41 + 1000;
    const adapters = loadAdapters({Date: {now: () => now}});
    const preview = 'https://static-cdn.jtvnw.net/previews-ttv/live_user_x-440x248.jpg';
    const original = function (stream, vertical) {
        return vertical ? preview.replace('440x248', '248x440') : preview;
    };
    const wrapped = adapters.getStreamThumbnailUrl(original);
    assert.equal(wrapped({}, false), preview + '?v=41');
    assert.equal(wrapped({}, true), preview.replace('440x248', '248x440') + '?v=41',
        'the vertical variant is busted too');
    now += 300000;
    assert.equal(wrapped({}, false), preview + '?v=42', 'the key rolls over with the bucket');

    const other = adapters.getStreamThumbnailUrl(() => 'https://static-cdn.jtvnw.net/ttv-boxart/123-285x380.jpg');
    assert.equal(other({}, false), 'https://static-cdn.jtvnw.net/ttv-boxart/123-285x380.jpg',
        'non-preview URLs pass through untouched');
    const empty = adapters.getStreamThumbnailUrl(() => undefined);
    assert.equal(empty({}, false), undefined, 'missing URLs pass through untouched');
});

test('preview prop components cache-bust previewImageURL props', () => {
    let now = 300000 * 41 + 1000;
    const timers = new Map();
    let nextTimer = 1;
    const adapters = loadAdapters({
        Date: {now: () => now},
        setInterval(fn) { const id = nextTimer++; timers.set(id, fn); return id; },
        clearInterval(id) { timers.delete(id); }
    });
    const React = createReact();
    function Thumb() {}
    const preview = 'https://static-cdn.jtvnw.net/previews-ttv/live_user_x-440x248.jpg';
    const vertical = 'https://static-cdn.jtvnw.net/previews-ttv/live_user_x-248x440.jpg';

    for (const name of ['FollowingRowThumbnail', 'SkylineThumbnailBackground']) {
        React.reset();
        timers.clear();
        const render = adapters[name](Thumb, React);
        const props = {previewImageURL: preview, verticalPreviewImageURL: vertical, width: 440};
        const first = React.render(render, props);
        assert.equal(first.type, Thumb);
        assert.equal(first.props.previewImageURL, preview + '?v=41', name);
        assert.equal(first.props.verticalPreviewImageURL, vertical + '?v=41', name);
        assert.equal(first.props.width, 440);
        assert.notEqual(first.props, props, 'props are copied, not mutated');
        assert.equal(props.previewImageURL, preview);
        assert.equal(timers.size, 1, 'a mounted preview polls for the next cadence boundary');
        now += 300000;
        for (const fn of [...timers.values()]) fn();
        const rolled = React.render(render, props);
        assert.equal(rolled.props.previewImageURL, preview + '?v=42', name + ' rolls over');
        now -= 300000;
    }

    React.reset();
    const render = adapters.FollowingRowThumbnail(Thumb, React);
    const boxArt = {previewImageURL: 'https://static-cdn.jtvnw.net/ttv-boxart/123-285x380.jpg'};
    assert.equal(React.render(render, boxArt).props, boxArt, 'non-preview props pass through by identity');
    const empty = {};
    assert.equal(React.render(render, empty).props, empty, 'missing URLs pass through by identity');
});

test('chat lines add a reconnected status line only after a reconnect episode', () => {
    const adapters = loadAdapters({});
    const React = createReact();
    function StatusLine() {}
    function CoreText() {}
    function ConnectedLine() {}
    function ReconnectingLine() {}
    function DisconnectedLine() {}
    const requireStub = (id) => {
        if (id === 108) return {StatusLine};
        if (id === 109) return {CoreText};
        throw new Error('unexpected require ' + id);
    };
    const connected = adapters.ChatConnectedLine(ConnectedLine, React, {}, requireStub);
    const reconnecting = adapters.ChatReconnectingLine(ReconnectingLine, React);
    const disconnected = adapters.ChatDisconnectedLine(DisconnectedLine, React);
    const props = {event: {channelLogin: 'fps_shaka'}};

    const firstJoin = React.render(connected, props);
    assert.equal(firstJoin.type, ConnectedLine, 'the first join renders the welcome line alone');
    assert.equal(firstJoin.props, props);

    const reconnectingElement = React.render(reconnecting, props);
    assert.equal(reconnectingElement.type, ReconnectingLine, 'the reconnecting line passes through');

    const recovered = React.render(connected, props);
    assert.equal(recovered.type, React.Fragment, 'recovery renders a notice plus the welcome line');
    assert.equal(recovered.children.length, 2);
    assert.equal(recovered.children[1].type, ConnectedLine, 'the welcome line comes after the notice');
    const notice = recovered.children[0];
    assert.equal(notice.type, StatusLine);
    assert.equal(notice.props.testID, 'chat-reconnected-line');
    assert.equal(notice.children.length, 1);
    assert.equal(notice.children[0].type, CoreText);
    assert.equal(notice.children[0].props.color, 'alt-2');
    assert.deepEqual([...notice.children[0].children], ['チャットに再接続しました']);

    const steady = React.render(connected, props);
    assert.equal(steady.type, ConnectedLine, 'the notice appears once per episode');

    React.render(disconnected, props);
    const recoveredAgain = React.render(connected, props);
    assert.equal(recoveredAgain.type, React.Fragment, 'a disconnected line also arms the notice');
    assert.equal(recoveredAgain.children[0].children[0].children[0], 'チャットに再接続しました');
});
