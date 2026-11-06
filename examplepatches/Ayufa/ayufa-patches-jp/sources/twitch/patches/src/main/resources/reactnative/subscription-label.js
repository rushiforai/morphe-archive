(function (runtime) {
    'use strict';
    runtime.target(__TWITCH_TARGET_MODULE__, '__TWITCH_TARGET_EXPORT__', function (original, React) {
        return function (props) {
            var blocked = runtime.policyHook(React, 2);
            var filtered = React.useMemo(function () {
                return blocked && !props.suppressPromoLabel
                    ? Object.assign({}, props, {suppressPromoLabel: true}) : props;
            }, [props, blocked]);
            var args = Array.prototype.slice.call(arguments);
            args[0] = filtered;
            return original.apply(this, args);
        };
    });
})(globalThis.__twitchPatchRuntime);
