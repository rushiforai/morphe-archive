(function (runtime) {
    'use strict';
    var providers = ['bttv', '7tv', 'ffz'], names = ['BTTV', '7TV', 'FrankerFaceZ'];
    function sections(catalog, provider) {
        return catalog.filter(function (group) { return !provider || group.provider === provider; }).map(function (group) {
            return {id: 'twitchpatches-' + group.provider + (group.channel ? '-channel' : '-global'), category: 'global',
                title: names[providers.indexOf(group.provider)] + (group.channel ? ' Channel Emotes' : ' Global Emotes'),
                emotes: group.emotes.map(function (emote) {
                    return {id: 'twitchpatches:' + encodeURIComponent(JSON.stringify(emote)), token: emote.name,
                        setID: 'twitchpatches-' + group.provider, type: 'GLOBAL', context: 'global', modifierCodes: []};
                })};
        });
    }
    function arrange(native, catalog) {
        var channel = sections(catalog.filter(function (group) { return group.channel; }), null);
        var global = sections(catalog.filter(function (group) { return !group.channel; }), null);
        var insertion = 0;
        native.forEach(function (section, index) { if (section.category === 'current_channel') insertion = index + 1; });
        return native.slice(0, insertion).concat(channel, native.slice(insertion), global);
    }
    runtime.emotePicker = {sections: sections, arrange: arrange};
    runtime.target(__TWITCH_EMOTE_URL_MODULE__, 'makeEmoteURL', function (original) {
        return function makeEmoteURL(id, options) {
            var emote = runtime.emoteDetails.decode(id);
            return emote ? options && options.animated === false ? emote.staticURL : emote.url : original(id, options);
        };
    });
    runtime.target(__TWITCH_EMOTE_PREFETCH_MODULE__, 'useEmoteImagePrefetch', function (original, React) {
        return function useEmoteImagePrefetch(props) {
            var limited = React.useMemo(function () {
                var remaining = Math.max(0, 24 - (props.recents || []).slice(0, 12).length);
                var selected = (props.sections || []).slice().sort(function (first, second) {
                    return Number(second.category === 'current_channel') - Number(first.category === 'current_channel');
                }).map(function (section) {
                    var emotes = section.emotes.slice(0, remaining);
                    remaining -= emotes.length;
                    return Object.assign({}, section, {emotes: emotes});
                }).filter(function (section) { return section.emotes.length; });
                return Object.assign({}, props, {sections: selected, recents: (props.recents || []).slice(0, 12)});
            }, [props.sections, props.recents, props.theme, props.animated, props.resetKey]);
            return original(limited);
        };
    });
    runtime.target(__TWITCH_EMOTE_PICKER_MODULE__, 'EmotePickerTray', function (original, React, policy, require) {
        var CoreImage, logged = false;
        function ProviderTab(props) {
            var type = props.template.type, Component = typeof type === 'function' ? type : type.type;
            var category = {key: 'twitchpatches-' + props.provider, context: 'global', label: props.label};
            var element = Component(Object.assign({}, props.template.props, {category: category, active: props.active, onPress: props.onPress}));
            function icon(node, depth) {
                if (!React.isValidElement(node) || depth > 8) return node;
                if (node.props.testID === 'emote-nav-tab-glyph-' + category.key) {
                    return React.cloneElement(node, {}, React.createElement(CoreImage, {
                        src: 'https://cdn.betterttv.net/assets/logos/' + props.provider + '_logo.png',
                        style: {width: 24, height: 24}, accessibilityLabel: props.label}));
                }
                return node.props.children == null ? node : React.cloneElement(node, {}, React.Children.map(node.props.children,
                    function (child) { return icon(child, depth + 1); }));
            }
            return icon(element, 0);
        }
        return function EmotePickerTray(props) {
            if (!CoreImage) CoreImage = require(__TWITCH_CORE_IMAGE_MODULE__).CoreImage;
            var enabled = runtime.policyHook(React, 5);
            var mask = React.useSyncExternalStore(runtime.subscribe, function () {
                return providers.reduce(function (value, provider, index) { return value | (runtime.enabled(8 + index) ? 1 << index : 0); }, 0);
            });
            var selected = React.useState(null), provider = selected[0], select = selected[1];
            var catalog = React.useSyncExternalStore(runtime.emotes.subscribe,
                function () { return runtime.emotes.pickerSnapshot(props.channelID); });
            React.useEffect(function () { return runtime.emotes.retain(props.channelID); }, [props.channelID]);
            React.useEffect(function () { select(null); }, [props.channelID]);
            var active = enabled && provider && (mask & (1 << providers.indexOf(provider))) ? provider : null;
            var merged = React.useMemo(function () {
                if (!enabled) return props.sections || [];
                return active ? sections(catalog, active) : arrange(props.sections || [], catalog);
            }, [props.sections, catalog, enabled, active]);
            var tree = original(Object.assign({}, props, {sections: merged,
                isLoading: merged.length ? false : props.isLoading, isError: merged.length ? false : props.isError}));
            function footer(node, depth) {
                if (!React.isValidElement(node) || depth > 16) return node;
                if (node.props.testID === 'emote-nav-tablist') {
                    var tabs = React.Children.toArray(node.props.children), template = tabs[0];
                    if (!React.isValidElement(template)) return node;
                    var native = tabs.map(function (tab) {
                        if (!React.isValidElement(tab) || typeof tab.props.onPress !== 'function') return tab;
                        return React.cloneElement(tab, {active: active ? false : tab.props.active, onPress: function () {
                            select(null); tab.props.onPress.apply(null, arguments);
                        }});
                    });
                    if (enabled) providers.forEach(function (value, index) {
                        if (!(mask & (1 << index))) return;
                        native.push(React.createElement(ProviderTab, {key: 'twitchpatches-' + value, provider: value,
                            label: names[index] + ' emotes', template: template, active: active === value, onPress: function () { select(value); }}));
                    });
                    if (!logged && enabled) { logged = true; runtime.log('emotes picker footer bound'); }
                    return React.cloneElement(node, {}, native);
                }
                var changed = {};
                if (node.props.children != null) changed.children = React.Children.map(node.props.children,
                    function (child) { return footer(child, depth + 1); });
                if (node.props.footer != null) changed.footer = footer(node.props.footer, depth + 1);
                return React.cloneElement(node, changed);
            }
            return footer(tree, 0);
        };
    });
})(globalThis.__twitchPatchRuntime);
