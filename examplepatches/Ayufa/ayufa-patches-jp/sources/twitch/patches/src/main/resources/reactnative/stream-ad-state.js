(function (runtime) {
    'use strict';
    runtime.target(__TWITCH_CONTROLLER_HOOK_MODULE__, 'useControllerState', function (original, React, policy, require) {
        var idle = Object.freeze({playing: false});
        var reported = false;
        return function (controller, getSnapshot, equal) {
            var enabled = policy.policyHook(React, 6);
            var isAd = controller === require(__TWITCH_AD_CONTROLLER_MODULE__).adState;
            var snapshot = React.useMemo(function () {
                if (!enabled || !isAd) return getSnapshot;
                return function () {
                    var state = getSnapshot();
                    if (state && state.playing && !reported) {
                        reported = true; policy.log('stream ad presentation suppressed');
                    }
                    return idle;
                };
            }, [controller, getSnapshot, enabled, isAd]);
            return original.call(this, controller, snapshot, equal);
        };
    });
})(globalThis.__twitchPatchRuntime);
