(function (runtime) {
    'use strict';
    runtime.target(__TWITCH_TARGET_MODULE__, 'requestInFeedAd', function (original, React, policy) {
        var reported = false;
        function noFill() {
            if (!reported) { policy.log('feed no-fill completion'); reported = true; }
            return {success: false, error: 'No ad available (204 no-fill)'};
        }
        return function () {
            if (policy.enabled(4)) return Promise.resolve(noFill());
            var result = original.apply(this, arguments);
            return result.then(function (bid) { return policy.enabled(4) ? noFill() : bid; });
        };
    });
})(globalThis.__twitchPatchRuntime);
