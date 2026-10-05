(function (runtime) {
    'use strict';
    runtime.target(__TWITCH_TARGET_MODULE__, '__TWITCH_TARGET_EXPORT__', function (original, React) {
        var memo = original && original.$$typeof === Symbol.for('react.memo');
        var render = memo ? original.type : original;
        function filtered(props) {
            var result = render.apply(this, arguments);
            var blocked = runtime.policyHook(React, 1);
            if (!blocked) return result;
            var id = '__TWITCH_TARGET_EXPORT__' === 'DropProgressCard'
                ? String(props.testID) + '-turbo' : 'highlight-drops-turbo';
            return runtime.promotionElements(React, result, function (child) { return child.testID === id; });
        }
        return memo ? React.memo(filtered, original.compare) : filtered;
    }, __TWITCH_MEMO_EXPORT__, __TWITCH_TARGET_REGISTRATION__);
})(globalThis.__twitchPatchRuntime);
