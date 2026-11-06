(function (global) {
    'use strict';
    global.__twitchPatchRuntime.target(__TWITCH_APP_CORE_MODULE__, 'AppCore', function (original, React, runtime) {
        return function (props) {
            var light = runtime.policyHook(React, 11);
            var scheme = typeof light === 'boolean' ? (light ? 'light' : 'dark') : props.identity.colorScheme;
            var identity = React.useMemo(function () {
                return props.identity.colorScheme === scheme ? props.identity :
                    Object.assign({}, props.identity, {colorScheme: scheme});
            }, [props.identity, scheme]);
            return React.createElement(original, Object.assign({}, props, {identity: identity}));
        };
    });
})(globalThis);
