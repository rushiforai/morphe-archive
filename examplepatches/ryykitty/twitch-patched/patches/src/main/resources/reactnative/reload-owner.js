(function (runtime) {
    'use strict';
    var context;
    runtime.reload = {
        context: function (React) { return context || (context = React.createContext(null)); },
        owner: function () {
            var listeners = new Set();
            var binding = null;
            var lastReload = -Infinity;
            return {
                snapshot: function () { return binding; },
                subscribe: function (callback) {
                    listeners.add(callback);
                    return function () { listeners.delete(callback); };
                },
                bind: function (channel, callback) {
                    var next = {channel: channel, callback: callback};
                    binding = next;
                    listeners.forEach(function (listener) { listener(); });
                    return function () {
                        if (binding !== next) return;
                        binding = null;
                        listeners.forEach(function (listener) { listener(); });
                    };
                },
                request: function (expected) {
                    var now = performance.now();
                    if (!binding || binding !== expected || !runtime.enabled(7) || !runtime.enabled(3) || now - lastReload < 800)
                        return false;
                    lastReload = now;
                    binding.callback();
                    runtime.log('stream reload requested');
                    return true;
                }
            };
        },
        gesture: function (reload, hint, schedule, cancel, now) {
            var first = null, timer = null;
            function reset() {
                first = null;
                if (timer !== null) cancel(timer);
                timer = null; hint(false);
            }
            return {
                press: function () {
                    var current = now();
                    if (first !== null && current - first <= 500) { reset(); reload(); return; }
                    reset(); first = current; hint(true);
                    timer = schedule(reset, 2000);
                },
                activate: function () { reset(); reload(); },
                reset: reset
            };
        }
    };
})(globalThis.__twitchPatchRuntime);
