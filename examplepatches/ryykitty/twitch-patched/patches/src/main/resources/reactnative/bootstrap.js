(function (global) {
    'use strict';
    if (global.__twitchPatchRuntime) return;
    var policies = Array(11).fill(false);
    var listeners = new Set();
    var targets = Object.create(null);
    var define;
    var runtime = {
        target: function (id, name, adapter, memo, registration) {
            var entries = targets[id] || (targets[id] = []);
            if (entries.some(function (entry) { return entry.name === name; }))
                throw new Error('Duplicate Twitch patch export');
            entries.push({name: name, adapter: adapter, memo: memo === true, registration: registration});
        },
        enabled: function (index) { return policies[index] === true; },
        subscribe: function (listener) {
            listeners.add(listener);
            return function () { listeners.delete(listener); };
        },
        policyHook: function (React, index) {
            return React.useSyncExternalStore(runtime.subscribe,
                function () { return policies[index]; }, function () { return false; });
        },
        log: function (category) { console.info('TwitchPatchesRN ' + category); }
    };
    global.__twitchPatchRuntime = runtime;
    if (typeof global.RN$registerCallableModule !== 'function') {
        runtime.log('callable-module unavailable');
        return;
    }
    global.RN$registerCallableModule('TwitchPatchPolicy', function () {
        return {set: function (claim, turbo, banners, foreground, display, emotes, streamAds, reload, bttv, sevenTV, ffz, lightTheme) {
            policies = [claim === true, turbo === true, banners === true, foreground === true, display === true,
                emotes === true, streamAds === true, reload === true, bttv === true, sevenTV === true, ffz === true,
                typeof lightTheme === 'boolean' ? lightTheme : undefined];
            listeners.forEach(function (listener) { listener(); });
        }};
    });
    Object.defineProperty(global, '__d', {
        configurable: true,
        get: function () { return define; },
        set: function (originalDefine) {
            if (typeof originalDefine !== 'function') { define = originalDefine; return; }
            define = function (factory, id) {
                var entries = targets[id];
                if (!entries) return originalDefine.apply(this, arguments);
                var args = Array.prototype.slice.call(arguments);
                args[0] = function () {
                    var result = factory.apply(this, arguments);
                    var exports = arguments[4].exports;
                    var require = arguments[1];
                    var React = require(__TWITCH_REACT_MODULE__);
                    entries.forEach(function (target) {
                        var original = exports && exports[target.name];
                        if (target.memo ? !original || original.$$typeof !== Symbol.for('react.memo') ||
                            typeof original.type !== 'function' : typeof original !== 'function') {
                            runtime.log('export contract failed ' + target.name);
                            return;
                        }
                        var registration = target.registration && exports[target.registration];
                        if (target.registration && (!registration || registration.renderer !== original)) {
                            runtime.log('registration contract failed ' + target.name);
                            return;
                        }
                        var adapted = target.adapter(original, React, runtime, require);
                        exports[target.name] = adapted;
                        if (target.registration)
                            exports[target.registration] = Object.assign({}, registration, {renderer: adapted});
                        runtime.log('installed ' + target.name);
                    });
                    return result;
                };
                return originalDefine.apply(this, args);
            };
        }
    });
})(globalThis);
