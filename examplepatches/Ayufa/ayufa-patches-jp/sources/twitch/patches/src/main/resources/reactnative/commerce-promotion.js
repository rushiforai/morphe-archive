(function (runtime) {
    'use strict';
    runtime.target(__TWITCH_TARGET_MODULE__, '__TWITCH_TARGET_EXPORT__', function (original, React) {
        return function () {
            var result = original.apply(this, arguments);
            var blocked = runtime.policyHook(React, 2);
            var indicator = React.isValidElement(result) && result.props.indicator;
            return blocked && indicator && indicator.kind === 'creatorPromo' ? null : result;
        };
    });
})(globalThis.__twitchPatchRuntime);
