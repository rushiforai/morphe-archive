(function (runtime) {
    'use strict';
    var claims = new Map();
    runtime.target(__TWITCH_TARGET_MODULE__, 'useClaimableBonus', function (original, React) {
        return function (props) {
            var result = original.apply(this, arguments);
            var enabled = runtime.policyHook(React, 0);
            var foreground = runtime.policyHook(React, 3);
            React.useEffect(function () {
                if (!enabled || !foreground || !props.hasChannel || !props.currentUserID ||
                    !props.channelId || !props.availableClaimID || !result ||
                    typeof result.claimBonus !== 'function') return;
                var key = props.channelId + ':' + props.availableClaimID;
                var entry = claims.get(key);
                if (!entry) {
                    if (claims.size >= 64) claims.delete(claims.keys().next().value);
                    entry = {attempts: 0, last: -Infinity};
                    claims.set(key, entry);
                }
                var cancelled = false;
                var timer;
                function attempt() {
                    if (cancelled || !runtime.enabled(0) || !runtime.enabled(3) || entry.attempts >= 3) return;
                    var wait = Math.max(0, 10000 - (performance.now() - entry.last));
                    if (wait > 0) { timer = setTimeout(attempt, wait); return; }
                    entry.attempts++;
                    entry.last = performance.now();
                    // The native claim callback returns undefined.
                    result.claimBonus();
                    runtime.log('bonus attempt');
                    if (entry.attempts < 3) timer = setTimeout(attempt, 10000);
                }
                attempt();
                return function () { cancelled = true; if (timer !== undefined) clearTimeout(timer); };
            }, [enabled, foreground, props.hasChannel, props.currentUserID, props.channelId,
                props.availableClaimID, result && result.claimBonus, result && result.claimError]);
            return result;
        };
    });
})(globalThis.__twitchPatchRuntime);
