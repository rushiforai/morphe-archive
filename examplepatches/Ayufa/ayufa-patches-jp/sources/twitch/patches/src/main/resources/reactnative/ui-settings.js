(function (global) {
    'use strict';
    var runtime = global.__twitchPatchRuntime;
    var values = Object.freeze({});
    var listeners = new Set();
    runtime.ui = {
        enabled: function (key) { return values[key] === true; },
        subscribe: function (listener) {
            listeners.add(listener);
            return function () { listeners.delete(listener); };
        },
        useEnabled: function (React, key) {
            return React.useSyncExternalStore(runtime.ui.subscribe,
                function () { return runtime.ui.enabled(key); }, function () { return false; });
        }
    };
    global.RN$registerCallableModule('TwitchPatchUi', function () {
        return {set: function (serialized) {
            var incoming;
            try { incoming = JSON.parse(serialized); }
            catch (error) { runtime.log('UI preferences invalid'); return; }
            if (!incoming || Array.isArray(incoming) || typeof incoming !== 'object') return;
            var next = Object.create(null);
            Object.keys(incoming).forEach(function (key) {
                if (/^[a-z][a-z0-9_]{0,63}$/.test(key) && typeof incoming[key] === 'boolean') next[key] = incoming[key];
            });
            if (JSON.stringify(values) === JSON.stringify(next)) return;
            values = Object.freeze(next);
            listeners.forEach(function (listener) { listener(); });
        }};
    });
    function settings(module, name) {
        runtime.decorate(module, name, function (original, React, policy, require) {
            var Sheet = require(__TWITCH_UI_SHEET_MODULE__).BottomSheet;
            var Row = require(__TWITCH_UI_ROW_MODULE__).SettingsListItem;
            var Linking = require(__TWITCH_UI_NATIVE_MODULE__).Linking;
            return function (props) {
                var result = original.apply(this, arguments), count = 0, limit = {};
                function visit(node, depth) {
                    if (++count > 128 || depth > 16) throw limit;
                    if (Array.isArray(node)) {
                        var next = node.map(function (child) { return visit(child, depth + 1); });
                        return next.every(function (child, index) { return child === node[index]; }) ? node : next;
                    }
                    if (!React.isValidElement(node)) return node;
                    if (node.type === Sheet) {
                        var children = React.Children.toArray(node.props.children);
                        if (children.some(function (child) { return React.isValidElement(child) &&
                            child.props.testID === 'twitch-patches-ui-settings'; })) return node;
                        children.unshift(React.createElement(Row, {
                            key: 'twitch-patches-ui-settings', title: 'UI設定', onPress: function () {
                                if (typeof node.props.onClose === 'function') node.props.onClose();
                                Linking.openURL('twitch-patches://settings/ui').catch(function () { runtime.log('UI navigation failed'); });
                            }, accessibilityRole: 'button', accessibilityLabel: 'UI設定', testID: 'twitch-patches-ui-settings'
                        }));
                        return React.cloneElement(node, {children: children});
                    }
                    if (node.props.children === undefined) return node;
                    var children = visit(node.props.children, depth + 1);
                    return children === node.props.children ? node : React.cloneElement(node, {children: children});
                }
                try { return visit(result, 0); }
                catch (error) { if (error !== limit) throw error; runtime.log('UI settings tree limit'); return result; }
            };
        });
    }
    settings(__TWITCH_UI_PLAYBACK_MODULE__, 'PlaybackSettingsSheet');
    settings(__TWITCH_UI_CHAT_SETTINGS_MODULE__, 'ChatSettingsSheet');
})(globalThis);
