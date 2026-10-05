(function (runtime) {
    'use strict';
    runtime.target(__TWITCH_TARGET_MODULE__, '__TWITCH_TARGET_EXPORT__', function (original, React) {
        return function () {
            // Preserve hook order when the setting changes.
            var result = original.apply(this, arguments);
            var blocked = runtime.policyHook(React, __TWITCH_POLICY_INDEX__);
            return blocked ? null : result;
        };
    }, false, __TWITCH_TARGET_REGISTRATION__);
})(globalThis.__twitchPatchRuntime);
