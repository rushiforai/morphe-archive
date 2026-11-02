(function (runtime) {
    'use strict';
    runtime.target(__TWITCH_STREAM_DISPLAY_MODULE__, 'StreamDisplayAdSurface', function (original, React) {
        return function (props) {
            var blocked = runtime.policyHook(React, 4);
            return React.createElement(original, blocked ? Object.assign({}, props, {enabled: false}) : props);
        };
    });
    runtime.target(__TWITCH_FEED_COORDINATOR_MODULE__, 'useFeedAdCoordinator', function (original, React) {
        var NO_EDGES = [];
        function isFeedAd(edge) { return !!edge && !!edge.node && edge.node.__typename === 'FeedAd'; }
        return function (options) {
            var blocked = runtime.policyHook(React, 4);
            var edges = options.edges, onAdRemoved = options.onAdRemoved;
            // Runs before paint so ad rows never reach the list's size measurements.
            React.useLayoutEffect(function () {
                if (!blocked || !Array.isArray(edges) || typeof onAdRemoved !== 'function') return;
                edges.filter(isFeedAd).forEach(function (edge) { onAdRemoved(edge.node.id); });
            }, [blocked, edges, onAdRemoved]);
            return original.call(this, blocked ? Object.assign({}, options, {edges: NO_EDGES}) : options);
        };
    });
    runtime.target(__TWITCH_FEED_AD_ITEM_MODULE__, 'FeedAdItem', function (original, React) {
        return React.memo(function (props) {
            var blocked = runtime.policyHook(React, 4);
            return blocked ? null : React.createElement(original, props);
        }, original.compare);
    }, true);
})(globalThis.__twitchPatchRuntime);
