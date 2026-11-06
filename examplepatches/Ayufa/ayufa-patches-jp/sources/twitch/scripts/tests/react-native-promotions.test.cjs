const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const root = path.resolve(__dirname, '../../patches/src/main/resources/reactnative');
const element = (props, type = 'fixture-view') => Object.freeze({
    $$typeof: Symbol.for('react.element'), type, key: 'fixture-key', ref: 'fixture-ref', props: Object.freeze(props)
});
function setup(adapters) {
    let policy;
    let factory;
    let hookCalls = 0;
    const logs = [];
    const React = {
        useSyncExternalStore(subscribe, snapshot) { hookCalls++; return snapshot(); },
        useMemo(compute) { return compute(); },
        isValidElement(node) { return !!node && node.$$typeof === Symbol.for('react.element'); },
        cloneElement(node, props) { return {...node, props: {...node.props, ...props}}; },
        memo(type, compare) { return {$$typeof: Symbol.for('react.memo'), type, compare}; }
    };
    const context = vm.createContext({console: {info(value) { logs.push(value); }},
        RN$registerCallableModule(name, create) { policy = create(); }});
    function source(name, target = '') {
        return fs.readFileSync(path.join(root, name), 'utf8')
            .replaceAll('__TWITCH_REACT_MODULE__', '7').replaceAll('__TWITCH_TARGET_MODULE__', '12')
            .replaceAll('__TWITCH_TARGET_EXPORT__', target).replaceAll('__TWITCH_POLICY_INDEX__', target === 'PromotionHighlightRenderer' ? '2' : '1')
            .replaceAll('__TWITCH_MEMO_EXPORT__', String(target === 'DropProgressCard'))
            .replaceAll('__TWITCH_TARGET_REGISTRATION__', target === 'DropsHighlightRenderer'
                ? "'dropsHighlightRegistration'" : target === 'PromotionHighlightRenderer'
                    ? "'promotionHighlightRegistration'" : 'undefined');
    }
    vm.runInContext(source('bootstrap.js'), context);
    vm.runInContext(source('promotion-elements.js'), context);
    for (const [name, target] of adapters) vm.runInContext(source(name, target), context);
    context.__d = function (wrapped) { factory = wrapped; };
    return {
        install(exports) {
            context.__d(function (global, require, a, b, module) { Object.assign(module.exports, exports); }, 12, []);
            const module = {exports: {}};
            factory(context, () => React, null, null, module, module.exports, []);
            return module.exports;
        },
        set(turbo, banners) { policy.set(false, turbo, banners, true, false, false); },
        rewrite(result, remove) { return context.__twitchPatchRuntime.promotionElements(React, result, remove); },
        hooks() { return hookCalls; }, logs, React, context
    };
}
{
    const state = setup([['drops-turbo.js', 'DropsHighlightRenderer']]);
    const claim = () => 'claimed';
    const progress = element({testID: 'highlight-drops-progress', children: '4/5'});
    const claimButton = element({testID: 'highlight-drops-claim', onPress: claim});
    const requirement = element({children: 'Turbo required for this reward'});
    const button = element({testID: 'highlight-drops-turbo', onPress() { throw new Error('must not invoke'); }});
    const card = element({children: [progress, element({children: [requirement, button]}), claimButton]});
    let renders = 0;
    const original = function () { renders++; return card; };
    const registration = Object.freeze({renderer: original, label: 'Drops', expandable: true});
    const exports = state.install({DropsHighlightRenderer: original, dropsHighlightRegistration: registration});
    const render = exports.DropsHighlightRenderer;
    assert.equal(exports.dropsHighlightRegistration.renderer, render, 'registration and export use the same adapted renderer');
    assert.equal(exports.dropsHighlightRegistration.label, 'Drops');
    assert.equal(registration.renderer, original, 'registration cache remains unchanged');
    state.set(false, true);
    assert.equal(render({}), card, 'discount setting cannot remove a Drops card');
    state.set(true, false);
    const filtered = render({});
    assert.equal(filtered.props.children[0], progress);
    assert.equal(filtered.props.children[1].props.children[0], requirement);
    assert.equal(filtered.props.children[1].props.children[1], null);
    assert.equal(filtered.props.children[2], claimButton);
    assert.equal(claimButton.props.onPress(), 'claimed');
    assert.equal(filtered.key, card.key);
    assert.equal(filtered.ref, card.ref);
    assert.equal(card.props.children[1].props.children[1], button, 'original cached element stays immutable');
    state.set(false, false);
    assert.equal(render({}), card, 'disabling restores the same original card');
    assert.equal(renders, 3);
    assert.equal(state.hooks(), 3, 'policy hook runs in both directions');
}
{
    const state = setup([['drops-turbo.js', 'DropProgressCard']]);
    const compare = () => true;
    const props = Object.freeze({testID: 'fixture-drop', tier: {required: 3}, hasTurbo: false});
    const turbo = element({testID: 'fixture-drop-turbo'});
    const other = element({testID: 'unrelated-turbo'});
    const subscription = element({testID: 'fixture-drop-subscribe'});
    const card = element({children: [turbo, other, subscription]});
    const wrapped = state.install({DropProgressCard: state.React.memo(input => {
        assert.equal(input, props, 'account and reward props retain their identity'); return card;
    }, compare)}).DropProgressCard;
    assert.equal(wrapped.compare, compare);
    state.set(true, false);
    const filtered = wrapped.type(props);
    assert.equal(filtered.props.children[0], null);
    assert.equal(filtered.props.children[1], other, 'suffix alone cannot remove arbitrary controls');
    assert.equal(filtered.props.children[2], subscription);
    state.set(false, true);
    assert.equal(wrapped.type(props), card);
}
{
    const state = setup([['subscription-label.js', 'SubscribeButtonWithPromo']]);
    const onPress = () => 'subscribe';
    const props = Object.freeze({suppressPromoLabel: false, onPress, isSubscribed: false});
    let received;
    const receiver = {};
    const render = state.install({SubscribeButtonWithPromo(input, extra) {
        assert.equal(this, receiver); assert.equal(extra, 'fixture-argument');
        received = input; return element({onPress: input.onPress});
    }}).SubscribeButtonWithPromo;
    state.set(true, false);
    render.call(receiver, props, 'fixture-argument'); assert.equal(received, props);
    state.set(false, true);
    const result = render.call(receiver, props, 'fixture-argument');
    assert.equal(received.suppressPromoLabel, true);
    assert.equal(received.isSubscribed, false);
    assert.equal(props.suppressPromoLabel, false);
    assert.equal(result.props.onPress(), 'subscribe');
    state.set(false, false);
    render.call(receiver, props, 'fixture-argument'); assert.equal(received, props);
}
{
    const state = setup([['commerce-promotion.js', 'FeedCommerceIndicatorTag'],
        ['commerce-promotion.js', 'ChannelCommerceIndicatorTag']]);
    let renders = 0;
    const exports = state.install({
        FeedCommerceIndicatorTag(props) { renders++; return element({indicator: props.indicator}); },
        ChannelCommerceIndicatorTag(props) { renders++; return element({indicator: props.resolved}); }
    });
    state.set(false, true);
    for (const name of Object.keys(exports)) {
        const input = kind => ({indicator: {kind}, resolved: {kind}});
        assert.equal(exports[name](input('creatorPromo')), null);
        assert.equal(exports[name](input('hypeTrain')).props.indicator.kind, 'hypeTrain');
        assert.equal(exports[name](input('future-indicator')).props.indicator.kind, 'future-indicator');
        assert.ok(exports[name]({indicator: null, resolved: null}), 'empty indicators preserve original output');
    }
    state.set(true, false);
    assert.ok(exports.FeedCommerceIndicatorTag({indicator: {kind: 'creatorPromo'}}));
    assert.equal(renders, 9, 'both exports install without skipping original render hooks');
    assert.equal(state.logs.filter(value => value.includes('installed ')).length, 2);
    assert.throws(() => vm.runInContext(
        "globalThis.__twitchPatchRuntime.target(12, 'FeedCommerceIndicatorTag', function () {});", state.context),
    /Duplicate Twitch patch export/);
}
{
    const state = setup([['commerce-promotion.js', 'FeedCommerceIndicatorTag'],
        ['commerce-promotion.js', 'ChannelCommerceIndicatorTag']]);
    const exports = state.install({FeedCommerceIndicatorTag: null,
        ChannelCommerceIndicatorTag: () => element({indicator: {kind: 'creatorPromo'}})});
    state.set(false, true);
    assert.equal(exports.ChannelCommerceIndicatorTag(), null, 'one changed export cannot disable sibling adapters');
    assert.ok(state.logs.some(value => value.includes('export contract failed FeedCommerceIndicatorTag')));
}
{
    const state = setup([]);
    const train = element({testID: 'highlight-hype-train-treasure-reached', children: 'Treasure Train Unlocked'});
    assert.equal(state.rewrite(train, props => props.testID === 'highlight-drops-turbo'), train);
    let deep = train;
    for (let index = 0; index < 40; index++) deep = element({children: deep});
    assert.equal(state.rewrite(deep, () => false), deep, 'unsupported trees preserve original output atomically');
    const huge = element({children: Array.from({length: 3000}, () => train)});
    assert.equal(state.rewrite(huge, () => false), huge);
    const unrelated = element({children: 'Get Turbo', testID: 'fixture-normal-content'});
    assert.equal(state.rewrite(unrelated, props => props.testID === 'highlight-drops-turbo'), unrelated,
        'localized text and normal content are never used as removal criteria');
}
{
    const state = setup([['hide-component.js', 'PromotionHighlightRenderer']]);
    const result = element({testID: 'highlight-promotion'});
    let calls = 0;
    const renderer = () => { calls++; return result; };
    const registration = Object.freeze({renderer, type: 'Promotion', expandable: true});
    const exports = state.install({PromotionHighlightRenderer: renderer, promotionHighlightRegistration: registration});
    state.set(false, true);
    assert.equal(exports.promotionHighlightRegistration.renderer(), null);
    state.set(false, false);
    assert.equal(exports.promotionHighlightRegistration.renderer(), result);
    assert.equal(calls, 2);
    assert.equal(exports.promotionHighlightRegistration.type, 'Promotion');
    assert.equal(registration.renderer, renderer);
}
{
    const state = setup([]);
    vm.runInContext("globalThis.__twitchPatchRuntime.target(12, 'FixtureImport', function (original, React, runtime, require) { return require(7); });", state.context);
    const exports = state.install({FixtureImport() {}});
    assert.equal(exports.FixtureImport, state.React, 'multiple-export callback preserves the factory require boundary');
}
console.log('Promotion adapters: precise Drops controls, subscription actions, train indicators, independent policies, registrations and shared exports passed.');
