(function (runtime) {
    'use strict';
    runtime.target(__TWITCH_SKYLINE_BANNER_SLOT_MODULE__, 'useSkylineBannerSlot', function (original, React) {
        return function (options, width, insets, controller) {
            var blocked = runtime.policyHook(React, 4);
            var state = original.call(this, blocked ? Object.assign({}, options, {enabled: false}) : options,
                width, insets, controller);
            return blocked ? Object.assign({}, state, {available: false, banner: null, contentInsets: insets}) : state;
        };
    });
})(globalThis.__twitchPatchRuntime);
