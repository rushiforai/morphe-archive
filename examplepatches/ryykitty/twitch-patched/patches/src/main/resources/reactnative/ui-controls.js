(function (runtime) {
    'use strict';
    function useOptions(React, prefix, parts) {
        var result = Object.create(null);
        parts.forEach(function (part) { result[part] = runtime.ui.useEnabled(React, prefix + '_hide_' + part); });
        return result;
    }
    function supportProps(props, hidden) {
        if (!Object.keys(hidden).some(function (key) { return hidden[key]; }) || !Array.isArray(props.buttons)) return props;
        var buttons = props.buttons.filter(function (button) {
            return !hidden[button.kind === 'upgrade' ? 'subscribe' : button.kind];
        });
        if (!buttons.length) return null;
        if (buttons.length === props.buttons.length) return props;
        return Object.assign({}, props, {buttons: buttons});
    }
    runtime.ui.filterControls = function (React, result, hidden, clipType) {
        if (!Object.keys(hidden).some(function (key) { return hidden[key]; })) return result;
        var count = 0, limit = {};
        function visit(node, depth) {
            if (++count > 2048 || depth > 32) throw limit;
            if (Array.isArray(node)) {
                var values = node.map(function (child) { return visit(child, depth + 1); });
                return values.every(function (child, i) { return child === node[i]; }) ? node : values.filter(function (child) { return child !== null; });
            }
            if (!React.isValidElement(node)) return node;
            var id = node.props.testID;
            var part = typeof id === 'string' && /-(clip|cast|share|subscribe|upgrade|gift|bits)$/.exec(id);
            part = node.type === clipType ? 'clip' : part && (part[1] === 'upgrade' ? 'subscribe' : part[1]);
            if (part && hidden[part]) return null;
            var children = node.props.children;
            if (children === undefined) return node;
            var next = visit(children, depth + 1);
            if (next === children) return node;
            if (next === null || Array.isArray(next) && next.length === 0) return null;
            return React.cloneElement(node, {children: next});
        }
        try { return visit(result, 0); }
        catch (error) { if (error !== limit) throw error; runtime.log('UI tree limit'); return result; }
    };
    function controls(module, name, layout) {
        runtime.decorate(module, name, function (original, React, policy, require) {
            var Clip = require(__TWITCH_UI_CLIP_MODULE__).TheatreClipButton;
            return function (props) {
                var hidden = useOptions(React, layout + '_controls', ['clip', 'cast', 'share']);
                return runtime.ui.filterControls(React, original.apply(this, arguments), hidden, Clip);
            };
        });
    }
    controls(__TWITCH_UI_CLASSIC_MODULE__, 'PlayerControlsOverlay', 'classic');
    controls(__TWITCH_UI_VERTICAL_MODULE__, 'SkylineControlsOverlay', 'vertical');

    var layoutContext;
    function layout(React) { return layoutContext || (layoutContext = React.createContext('classic')); }
    runtime.decorate(__TWITCH_UI_CHAT_BAND_MODULE__, 'SkylineChatBand', function (original, React) {
        return function (props) {
            return React.createElement(layout(React).Provider, {value: 'vertical'}, React.createElement(original, props));
        };
    });
    runtime.decorate(__TWITCH_UI_COMPOSER_MODULE__, 'ChatComposerBar', function (original, React) {
        return function (props) {
            var prefix = React.useContext(layout(React));
            var hidden = runtime.ui.useEnabled(React, prefix + '_support_hide_bits');
            return React.createElement(original, hidden ? Object.assign({}, props, {showBitsButton: false}) : props);
        };
    });

    function supportRow(module, name) { runtime.target(module, name, function (original, React) {
        return function (props) {
            var prefix = props.twitchPatchUiLayout === 'vertical_header' ? 'vertical_header' :
                (props.twitchPatchUiLayout === 'vertical' ? 'vertical' : 'classic') + '_support';
            var hidden = useOptions(React, prefix, ['subscribe', 'gift', 'bits']);
            var next = supportProps(props, hidden);
            return next === null ? null : React.createElement(original, next);
        };
    }); }
    supportRow(__TWITCH_UI_SUPPORT_ROW_MODULE__, 'SupportActionRow');
    runtime.decorate(__TWITCH_UI_METADATA_MODULE__, 'ChannelMetadata', function (original, React, policy, require) {
        var Row = require(__TWITCH_UI_SUPPORT_ROW_MODULE__).SupportActionRow;
        return function (props) {
            var hidden = useOptions(React, 'classic_support', ['subscribe', 'gift', 'bits']);
            var hideExtensions = runtime.ui.useEnabled(React, 'hide_channel_extensions');
            var actions = props.actions;
            if (React.isValidElement(actions) && actions.type === Row) {
                var next = supportProps(actions.props, hidden);
                if (next !== actions.props) actions = next === null ? null : React.cloneElement(actions, next);
            }
            var showExtensions = props.showExtensionsIcon && !hideExtensions;
            if (actions === props.actions && showExtensions === props.showExtensionsIcon) return React.createElement(original, props);
            return React.createElement(original, Object.assign({}, props, {actions: actions, showExtensionsIcon: showExtensions}));
        };
    });
    var skylineRowName = '__TWITCH_UI_SKYLINE_ROW_EXPORT__';
    if (skylineRowName !== 'SupportActionRow') supportRow(__TWITCH_UI_SKYLINE_ROW_MODULE__, skylineRowName);
    function supportHost(module, name, header) {
        runtime.target(module, name, function (original, React, policy, require) {
            var Row = require(__TWITCH_UI_SKYLINE_ROW_MODULE__)[skylineRowName];
            var Trophy = header && __TWITCH_UI_LEADERBOARD_MODULE__ !== null && require(__TWITCH_UI_LEADERBOARD_MODULE__).SkylineLeaderboardTrophy;
            return function (props) {
                var hidden = useOptions(React, header ? 'vertical_header' : 'vertical_support', ['subscribe', 'gift', 'bits', 'leaderboard']);
                var result = original.apply(this, arguments);
                var count = 0, limit = {};
                function visit(node, depth) {
                    if (++count > 2048 || depth > 32) throw limit;
                    if (Array.isArray(node)) {
                        var next = node.map(function (child) { return visit(child, depth + 1); });
                        return next.every(function (child, index) { return child === node[index]; }) ? node : next.filter(function (child) { return child !== null; });
                    }
                    if (!React.isValidElement(node)) return node;
                    if (header && hidden.leaderboard && node.type === Trophy) return null;
                    if (node.type === Row) {
                        var nextProps = supportProps(node.props, hidden);
                        return nextProps === null ? null : React.cloneElement(node,
                            Object.assign({}, nextProps, {twitchPatchUiLayout: header ? 'vertical_header' : 'vertical'}));
                    }
                    if (node.props.children === undefined) return node;
                    var children = visit(node.props.children, depth + 1);
                    if (children !== node.props.children && (children === null || Array.isArray(children) && !children.length)) return null;
                    return children === node.props.children ? node : React.cloneElement(node, {children: children});
                }
                try { return visit(result, 0); }
                catch (error) { if (error !== limit) throw error; runtime.log('UI support tree limit'); return result; }
            };
        });
    }
    supportHost(__TWITCH_UI_BAND_MODULE__, 'SkylineBandActions', true);
    supportHost(__TWITCH_UI_SHEET_ACTIONS_MODULE__, 'SkylineSheetActions');
    runtime.target(__TWITCH_UI_OVERLAY_ACTIONS_MODULE__, 'OverlayActionButtons', function (original, React) {
        return function (props) {
            var hidden = useOptions(React, 'classic_support', ['subscribe', 'gift', 'bits']);
            var result = original.apply(this, arguments);
            return runtime.ui.filterControls(React, result, hidden);
        };
    });
    function extensions(module, name) {
        if (module === null) return;
        runtime.decorate(module, name, function (original, React) {
            return function (props) {
                var hidden = runtime.ui.useEnabled(React, 'hide_channel_extensions');
                return hidden ? null : React.createElement(original, props);
            };
        });
    }
    extensions(__TWITCH_UI_EXTENSIONS_MODULE__, 'ClassicExtensionsIcon');
    extensions(__TWITCH_UI_EXTENSION_ENTRY_MODULE__, 'ExtensionsEntryButton');
})(globalThis.__twitchPatchRuntime);
