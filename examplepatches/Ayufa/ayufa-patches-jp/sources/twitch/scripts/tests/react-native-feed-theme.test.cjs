const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

function adapters(light) {
    const targets = new Map();
    const theme = {colors: {backgroundBody: '#f7f7f8'}};
    const videoTheme = {colors: {backgroundBody: '#0e0e10'}};
    const ThemeProvider = () => {};
    const React = {
        createElement(type, props) { return {type, props}; },
        memo(render, compare) { return {type: render, compare}; },
        isValidElement(element) { return Boolean(element && element.type && element.props); },
        cloneElement(element, props) { return {...element, props: {...element.props, ...props}}; },
        Children: {map(children, transform) { return Array.isArray(children) ? children.map(transform) : transform(children); }}
    };
    const runtime = {
        target(id, name, adapter) { targets.set(name, adapter); },
        policyHook() { return light; }
    };
    const context = vm.createContext({__twitchPatchRuntime: runtime});
    const source = fs.readFileSync(path.resolve(__dirname,
        '../../patches/src/main/resources/reactnative/feed-theme.js'), 'utf8')
        .replaceAll('__TWITCH_THEME_MODULE__', '1').replace('__TWITCH_STREAM_ITEM_MODULE__', '2')
        .replace('__TWITCH_CLIPS_FEED_MODULE__', '3').replace('__TWITCH_FEED_SCRIM_MODULE__', '5')
        .replaceAll('__TWITCH_PALETTE_MODULE__', '4')
        .replace('__TWITCH_FEED_CHROME_MODULE__', '6');
    vm.runInContext(source, context);
    return {React, theme, ThemeProvider, wrap(name, original) {
        return targets.get(name)(original, React, runtime, () => ({ThemeProvider, useTheme: () => videoTheme, lightTheme: theme}));
    }};
}

test('Clips scopes the native dark palette to video content and preserves header props', () => {
    for (const light of [true, false]) {
        const state = adapters(light);
        const original = () => {};
        const props = {children: {video: 'fixture'}, topSlot: {header: 'fixture'}, warm: true, fullBleed: true, onScroll() {}};
        const result = state.wrap('ClipsFeedPage', original)(props);
        assert.equal(result.type, original);
        assert.equal(result.props.children.type, state.ThemeProvider);
        assert.equal(result.props.children.props.theme, undefined, 'uses the native dark default');
        assert.equal(result.props.children.props.children, props.children);
        assert.equal(result.props.topSlot, props.topSlot);
        assert.equal(result.props.onScroll, props.onScroll);
    }
});

test('Live card theme follows its actual scrolling layout and preserves actions', () => {
    const state = adapters(true);
    const original = {compare: () => false};
    const render = state.wrap('FeedStreamItem', original);
    for (const freeScroll of [true, false]) {
        const props = {node: {id: 'fixture'}, freeScroll, onPress() {}};
        const result = render.type(props);
        const item = freeScroll ? result : result.props.children;
        assert.equal(item.type, original);
        assert.equal(item.props.node, props.node);
        assert.equal(item.props.onPress, props.onPress);
        if (!freeScroll) assert.equal(result.type, state.ThemeProvider);
    }
    assert.equal(render.compare, original.compare);
});
test('light scrim changes gradient stops without changing geometry, opacity or animation', () => {
    const state = adapters(true);
    const style = {transform: [{translateY: {value: 12}}], height: 200};
    const stop = state.React.createElement('Stop', {stopColor: '#000000', offset: 0.4, stopOpacity: 0.2});
    const root = state.React.createElement('AnimatedView', {style, onLayout() {}, children: [stop, 'fixture']});
    let calls = 0;
    const render = state.wrap('FeedTopScrim', () => { calls++; return root; });
    const result = render({});
    assert.equal(result.props.style, style);
    assert.equal(result.props.style.backgroundColor, undefined);
    assert.equal(result.props.onLayout, root.props.onLayout);
    assert.equal(result.props.children[0].props.stopColor, state.theme.colors.backgroundBody);
    assert.equal(result.props.children[0].props.stopOpacity, 0.2);
    assert.equal(result.props.children[0].props.offset, 0.4);
    assert.equal(result.props.children[1], 'fixture');
    assert.equal(calls, 1);
});

test('dark and undispatched scrims preserve Twitch rendering', () => {
    for (const light of [false, undefined]) {
        const state = adapters(light);
        const original = state.React.createElement('View', {children: null});
        assert.equal(state.wrap('FeedTopScrim', () => original)({}), original);
    }
});

test('light header fade stops at measured tabs without altering scrolling or category layout', () => {
    for (const light of [true, false, undefined]) {
        const state = adapters(light);
        const scrim = state.React.createElement('Scrim', {testID: 'feed-top-scrim', translateY: {value: 13}});
        const tabs = state.React.createElement('Tabs', {onLayout() {}});
        const animation = {transform: [{translateY: 21}]};
        const chrome = state.React.createElement('AnimatedView', {testID: 'feed-top-chrome', style: animation,
            pointerEvents: 'box-none', children: tabs});
        const root = state.React.createElement('View', {style: {paddingTop: 24}, children: [scrim, chrome]});
        let received;
        const original = {type: props => { received = props; return root; }, compare: () => true};
        const wrapped = state.wrap('FeedTopChrome', original);
        const result = wrapped.type({tabsBarHeight: 64});
        assert.equal(received.feedTheme, light === true ? state.theme : undefined);
        assert.equal(result.props.style, root.props.style);
        assert.equal(result.props.children[0].props.translateY, scrim.props.translateY);
        const updatedChrome = result.props.children[1];
        assert.equal(updatedChrome.props.children, tabs);
        assert.equal(updatedChrome.props.pointerEvents, 'box-none');
        if (light === true) {
            assert.equal(updatedChrome.props.style[0], animation);
            assert.equal(updatedChrome.props.style[1].backgroundColor, state.theme.colors.backgroundBody);
            assert.deepEqual(Object.keys(updatedChrome.props.style[1]), ['backgroundColor']);
        } else assert.equal(updatedChrome, chrome);
        assert.equal(result.props.children[0].props.height, light === true ? 64 : undefined);
        assert.equal(wrapped.compare, original.compare);
        assert.equal(wrapped.type({tabsBarHeight: 0}), root);
    }
});
