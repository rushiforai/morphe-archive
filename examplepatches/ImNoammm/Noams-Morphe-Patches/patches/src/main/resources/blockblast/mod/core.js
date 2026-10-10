// Runtime shared by every feature. main.js runs this after the engine loads and before the first game
// bundle, so hooks exist before any game module. Also holds the settings ui.js edits: values live in
// localStorage, looked up live as user choice > patch option > declared default.
(function () {
    var config = window.__bbmod || {};
    var fileUtils = jsb.fileUtils;
    var logPath = fileUtils.getWritablePath() + 'bbmod.log';
    var lines = [], flushTimer = 0;
    var features = {};
    var order = [];
    var defined = {}, waiting = {};
    var STORE = 'bbmodSettings';
    var stored = {};
    try { stored = JSON.parse(localStorage.getItem(STORE) || '{}') || {}; } catch (e) { stored = {}; }
    var subscribers = [];
    var eventFns = {}, frameFns = [], frameHooked = false;

    function declaredDefault(id, key) {
        var feature = features[id];
        var list = (feature && feature.settings) || [];
        for (var i = 0; i < list.length; i++) if (list[i].key === key) return list[i].def;
        return undefined;
    }

    var bb = window.bb = {
        config: config,
        features: features,
        order: order,

        // This build prints nothing from console.log, so the log goes to <files>/bbmod.log (last 300 lines).
        log: function () {
            lines.push(new Date().toISOString().slice(11, 23) + ' ' + Array.prototype.join.call(arguments, ' '));
            if (lines.length > 300) lines.splice(0, lines.length - 300);
            if (!flushTimer) flushTimer = setTimeout(function () {
                flushTimer = 0;
                fileUtils.writeStringToFile(lines.join('\n') + '\n', logPath);
            }, 500);
        },

        // Runs fn(exports) as soon as the game module `name` has been defined (or now, if it already was).
        on: function (name, fn) {
            if (defined.hasOwnProperty(name)) return run(name, fn, defined[name]);
            (waiting[name] = waiting[name] || []).push(fn);
        },

        // A module that is already loaded, or undefined.
        module: function (name) {
            return defined.hasOwnProperty(name) ? defined[name] : undefined;
        },

        // Replaces obj[key] with make(original); the original stays reachable for the replacement.
        wrap: function (obj, key, make) {
            var original = obj[key];
            obj[key] = make(original);
            return original;
        },

        // The current value of a feature's setting.
        get: function (id, key) {
            var mine = stored[id];
            if (mine && Object.prototype.hasOwnProperty.call(mine, key)) return mine[key];
            var opts = config[id];
            if (opts && Object.prototype.hasOwnProperty.call(opts, key)) return opts[key];
            return declaredDefault(id, key);
        },

        set: function (id, key, value) {
            (stored[id] = stored[id] || {})[key] = value;
            try { localStorage.setItem(STORE, JSON.stringify(stored)); } catch (e) { bb.log('settings save failed:', e); }
            for (var i = 0; i < subscribers.length; i++) {
                try { subscribers[i](id, key, value); } catch (e) { bb.log('settings subscriber failed:', e); }
            }
        },

        // fn(id, key, value) after every settings change.
        sub: function (fn) { subscribers.push(fn); },

        // Every stored choice dropped: each setting is back to its patch option / declared default.
        reset: function () {
            var old = stored;
            stored = {};
            try { localStorage.setItem(STORE, JSON.stringify(stored)); } catch (e) { bb.log('settings save failed:', e); }
            Object.keys(old).forEach(function (id) {
                Object.keys(old[id]).forEach(function (key) {
                    for (var i = 0; i < subscribers.length; i++) {
                        try { subscribers[i](id, key, bb.get(id, key)); } catch (e) { bb.log('settings subscriber failed:', e); }
                    }
                });
            });
        },

        // fn(event) after the game has dispatched a module event of the class named `name` (its module name,
        // e.g. 'E_BlocksProducer_TouchEnd'); event.state carries the payload.
        onEvent: function (name, fn) {
            (eventFns[name] = eventFns[name] || []).push(fn);
        },

        // fn(dt seconds) once a frame, after every component and action has updated and before the frame
        // is drawn. Returns a function that removes it.
        frame: function (fn) {
            frameFns.push(fn);
            if (!frameHooked) {
                frameHooked = true;
                cc.director.on(cc.Director.EVENT_AFTER_UPDATE, function () {
                    var dt = cc.director.getDeltaTime(), list = frameFns.slice();
                    for (var i = 0; i < list.length; i++) {
                        try { list[i](dt); } catch (e) { bb.log('frame callback failed:', e, e && e.stack); }
                    }
                });
            }
            return function () {
                var i = frameFns.indexOf(fn);
                if (i >= 0) frameFns.splice(i, 1);
            };
        },

        // Whether the game is in Classic mode (the mode every feature here is made for).
        isClassic: function () {
            var info = bb.module('GameInfo');
            return !!(info && info.gameInfo && info.gameInfo.gameMode === 'class');
        },

        // def: { title, settings: [{key, type: toggle|number|choice|info, label, def, ...}], start(options) }
        feature: function (id, def) {
            if (typeof def === 'function') def = { start: def };
            features[id] = def;
        },

        start: function () {
            Object.keys(config).forEach(function (id) {
                var def = features[id];
                if (!def) return bb.log('feature', id, 'has no script');
                order.push(id);
                try {
                    if (def.start) def.start(config[id] || {});
                } catch (e) {
                    bb.log('feature', id, 'failed:', e, e && e.stack);
                }
            });
            bb.log('started:', order.join(', '));
        },
    };

    function run(name, fn, exports) {
        try {
            fn(exports);
        } catch (e) {
            bb.log('hook', name, 'failed:', e, e && e.stack);
        }
    }

    // Module events (bb.onEvent): EventManager.dispatchModuleEvent hands each event to the game's proxies;
    // the listeners here run after them, matched by the event's class.
    bb.on('EventManager', function (exports) {
        bb.wrap(exports.EventManager, 'dispatchModuleEvent', function (original) {
            return function (event) {
                var result = original.apply(this, arguments);
                if (event && event.getClass) {
                    var cls = event.getClass();
                    for (var name in eventFns) {
                        var mod = defined[name], fns = eventFns[name];
                        if (!mod || mod[name] !== cls) continue;
                        for (var i = 0; i < fns.length; i++) {
                            try { fns[i](event); } catch (e) { bb.log('event', name, 'listener failed:', e, e && e.stack); }
                        }
                    }
                }
                return result;
            };
        });
    });

    // Every game script is wrapped in cc._RF.push(module, uuid, name) ... cc._RF.pop(); by the pop its
    // exports are complete and nothing has used them yet.
    var RF = cc._RF, push = RF.push, pop = RF.pop, stack = [];
    RF.push = function (module, uuid, name) {
        stack.push([module, name]);
        return push.apply(this, arguments);
    };
    RF.pop = function () {
        var result = pop.apply(this, arguments);
        var top = stack.pop();
        if (top && top[1]) {
            var name = top[1], exports = top[0] && top[0].exports;
            defined[name] = exports;
            var fns = waiting[name];
            if (fns) {
                delete waiting[name];
                fns.forEach(function (fn) { run(name, fn, exports); });
            }
        }
        return result;
    };
})();
