(function (runtime) {
    'use strict';
    runtime.target(__TWITCH_THEATRE_SCREEN_MODULE__, 'TheatreScreen', function (original, React) {
        var context = runtime.reload.context(React);
        return function TheatreScreen(props) {
            var owner = React.useRef(null);
            if (!owner.current) owner.current = runtime.reload.owner();
            return React.createElement(context.Provider, {value: owner.current}, React.createElement(original, props));
        };
    });
    runtime.target(__TWITCH_THEATRE_DATA_MODULE__, 'useTheatreData', function (original, React) {
        var context = runtime.reload.context(React);
        return function () {
            var result = original.apply(this, arguments);
            var owner = React.useContext(context);
            var live = result && result.isLive;
            var channel = result && result.channelID;
            var callback = result && result.refreshVideoToken;
            React.useEffect(function () {
                if (!owner || !live || !channel || typeof callback !== 'function') return;
                return owner.bind(channel, callback);
            }, [owner, live, channel, callback]);
            return result;
        };
    });
    runtime.target(__TWITCH_PLAYER_CONTROLS_MODULE__, 'PlayerControlsOverlay', function (original, React, policy, require) {
        var context = runtime.reload.context(React);
        var IconRefresh = require(__TWITCH_REFRESH_ICON_MODULE__).IconRefresh;
        var ToastAndroid = require(__TWITCH_TOAST_MODULE__).default;
        var Control = runtime.reload.control(React, IconRefresh, ToastAndroid);
        var emptySubscribe = function () { return function () {}; }, emptySnapshot = function () { return null; };
        return function (props) {
            var result = original.apply(this, arguments);
            var enabled = policy.policyHook(React, 7), foreground = policy.policyHook(React, 3);
            var owner = React.useContext(context);
            var binding = React.useSyncExternalStore(owner ? owner.subscribe : emptySubscribe,
                owner ? owner.snapshot : emptySnapshot, emptySnapshot);
            if (!enabled || !binding || !IconRefresh) return result;
            return runtime.reload.insert(React, result, function (template) {
                return React.createElement(Control, {key: 'twitch-patches-reload', template: template,
                    owner: owner, binding: binding, active: foreground && props.visible === true,
                    loading: props.playbackLoading === true || props.playbackErrored === true});
            });
        };
    });
})(globalThis.__twitchPatchRuntime);
