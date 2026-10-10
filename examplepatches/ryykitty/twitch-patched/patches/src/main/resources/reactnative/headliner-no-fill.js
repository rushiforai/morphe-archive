(function (runtime) {
    'use strict';
    function noFill() { return {success: false, error: 'No ad available (204 no-fill)'}; }
    runtime.target(__TWITCH_HEADLINER_REQUEST_MODULE__, 'requestHeadlinerAd', function (original, React, policy) {
        return function () {
            if (policy.enabled(4)) return Promise.resolve(noFill());
            return original.apply(this, arguments).then(function (response) {
                return policy.enabled(4) ? noFill() : response;
            });
        };
    });
    runtime.target(__TWITCH_HEADLINER_STATE_MODULE__, 'useHeadlinerAd', function (original, React) {
        return function (props) {
            var blocked = runtime.policyHook(React, 4);
            var state = original(blocked ? Object.assign({}, props, {enabled: false}) : props);
            return blocked ? Object.assign({}, state, {ad: null, status: 'Unfilled', adSessionId: null}) : state;
        };
    });
})(globalThis.__twitchPatchRuntime);
