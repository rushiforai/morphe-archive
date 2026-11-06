(function (runtime) {
    'use strict';
    runtime.target(__TWITCH_WELCOME_HOOK_MODULE__, 'useWelcomeBannerState', function (original, React, policy) {
        var hidden = Object.freeze({isShowing: false, isPreroll: false});
        var reported = false;
        return function () {
            var state = original.apply(this, arguments);
            var enabled = policy.policyHook(React, 6);
            if (!enabled) return state;
            if (!state || typeof state.isShowing !== 'boolean' || typeof state.isPreroll !== 'boolean') {
                policy.log('ad welcome state contract failed');
                return state;
            }
            if (state.isShowing && !reported) {
                reported = true; policy.log('stream ad support banner suppressed');
            }
            return hidden;
        };
    });
})(globalThis.__twitchPatchRuntime);
