(function (runtime) {
    'use strict';
    function hide(module, name, key) {
        runtime.decorate(module, name, function (original, React) {
            return function (props) {
                var hidden = runtime.ui.useEnabled(React, key);
                return hidden ? null : React.createElement(original, props);
            };
        });
    }
    hide(__TWITCH_UI_BOARDS_MODULE__, 'ChannelLeaderboardStripHost', 'hide_leaderboards');
    hide(__TWITCH_UI_TRAIN_PLAYER_MODULE__, 'TheatrePlayerHypeTrain', 'hide_hype_trains');
    hide(__TWITCH_UI_TRAIN_SKYLINE_MODULE__, 'SkylineHypeTrainHost', 'hide_hype_trains');

    var rawMaybeSelect;
    function carousel(highlights) { return highlights.filter(function (item) { return !item.hidden && !item.sticky; }); }
    function selector(name) {
        runtime.decorate(__TWITCH_UI_HIGHLIGHTS_MODULE__, name, function (original, React, policy, require) {
            if (name === 'useMaybeHighlightSelector') rawMaybeSelect = original;
            var cache = new WeakMap();
            function visible(state) {
                if (!state || !Array.isArray(state.highlights)) return state;
                if (cache.has(state)) return cache.get(state);
                var type = require(__TWITCH_UI_TRAIN_RENDERER_MODULE__).hypeTrainHighlightRegistration.type;
                var highlights = state.highlights.filter(function (item) { return item.event.type !== type; });
                if (highlights.length === state.highlights.length) { cache.set(state, state); return state; }
                var current = carousel(state.highlights)[state.currentIndex], visibleItems = carousel(highlights);
                var index = visibleItems.indexOf(current);
                if (index < 0) index = Math.max(0, Math.min(state.currentIndex, visibleItems.length - 1));
                var removed = new Set(state.highlights.filter(function (item) { return item.event.type === type; })
                    .map(function (item) { return item.id; }));
                var next = Object.assign({}, state, {highlights: highlights, currentIndex: index});
                if (Array.isArray(state.notifications)) next.notifications = state.notifications.filter(function (id) { return !removed.has(id); });
                cache.set(state, next);
                return next;
            }
            return function (select) {
                var hidden = runtime.ui.useEnabled(React, 'hide_hype_trains');
                var filtered = React.useMemo(function () {
                    return hidden ? function (state) { return select(visible(state)); } : select;
                }, [select, hidden]);
                return original.call(this, filtered);
            };
        });
    }
    selector('useHighlightSelector');
    selector('useMaybeHighlightSelector');
    function dispatchHook(name) {
        runtime.decorate(__TWITCH_UI_HIGHLIGHTS_MODULE__, name, function (original, React, policy, require) {
            return function () {
                var hidden = runtime.ui.useEnabled(React, 'hide_hype_trains');
                var dispatch = original.apply(this, arguments);
                var select = React.useMemo(function () { return hidden ? function (state) { return state; } : function () { return null; }; }, [hidden]);
                var state = rawMaybeSelect(select);
                return React.useMemo(function () {
                    if (!hidden || !state || typeof dispatch !== 'function') return dispatch;
                    var type = require(__TWITCH_UI_TRAIN_RENDERER_MODULE__).hypeTrainHighlightRegistration.type;
                    var source = carousel(state.highlights);
                    var visible = source.filter(function (item) { return item.event.type !== type; });
                    return function (action) {
                        if (!action || action.type !== 'set-current-index') return dispatch(action);
                        var item = visible[action.index];
                        if (item) return dispatch(Object.assign({}, action, {index: source.indexOf(item)}));
                    };
                }, [dispatch, state, hidden]);
            };
        });
    }
    dispatchHook('useHighlightDispatch');
    dispatchHook('useMaybeHighlightDispatch');
})(globalThis.__twitchPatchRuntime);
