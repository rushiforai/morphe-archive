(function (runtime) {
    'use strict';
    runtime.target(__TWITCH_STREAM_DISPLAY_MODULE__, 'StreamDisplayAdSurface', function (original, React) {
        return function (props) {
            var blocked = runtime.policyHook(React, 4);
            return React.createElement(original, blocked ? Object.assign({}, props, {enabled: false}) : props);
        };
    });
    runtime.target(__TWITCH_FEED_AD_ITEM_MODULE__, 'FeedAdItem', function (original, React) {
        return React.memo(function (props) {
            var blocked = runtime.policyHook(React, 4);
            return blocked ? null : React.createElement(original, props);
        }, original.compare);
    }, true);
})(globalThis.__twitchPatchRuntime);
