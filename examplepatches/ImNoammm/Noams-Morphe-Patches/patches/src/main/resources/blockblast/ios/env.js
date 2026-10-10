// The iOS game's own realm inside the Android engine: every script evaluates inside `with (scope)`, whose
// proxy claims each identifier, keeps the iOS globals on its own object and lets only standard built-ins
// through. makeIosEnv({ read(path), base, storage, realGlobal }) -> the env runtime.js expects.
function makeIosEnv(opts) {
    var real = opts.realGlobal;
    var BUILTINS = ('Object Function Array Number parseFloat parseInt Infinity NaN undefined Boolean String Symbol Date ' +
        'Promise RegExp Error AggregateError EvalError RangeError ReferenceError SyntaxError TypeError URIError JSON Math ' +
        'Intl ArrayBuffer SharedArrayBuffer Atomics Uint8Array Int8Array Uint16Array Int16Array Uint32Array Int32Array ' +
        'Float32Array Float64Array Uint8ClampedArray BigUint64Array BigInt64Array DataView Map BigInt Set WeakMap WeakSet ' +
        'WeakRef FinalizationRegistry Proxy Reflect decodeURI decodeURIComponent encodeURI encodeURIComponent escape ' +
        'unescape eval isFinite isNaN console setTimeout clearTimeout setInterval clearInterval').split(' ');
    var builtin = {};
    BUILTINS.forEach(function (k) { builtin[k] = true; });

    var g = {};
    function get(t, k) {
        if (k === Symbol.unscopables) return undefined;
        if (k in t) return t[k];
        if (builtin[k]) return real[k];
        return undefined;
    }
    function set(t, k, v) { t[k] = v; return true; }
    function del(t, k) { delete t[k]; return true; }
    // `window` / `self` / `globalThis`: answers `key in window` honestly (the game checks before assigning)
    var win = new Proxy(g, { has: function (t, k) { return k in t || !!builtin[k]; }, get: get, set: set, deleteProperty: del });
    // the scope of every script: claims every free identifier, so nothing resolves to Android's global
    var scope = new Proxy(g, { has: function () { return true; }, get: get, set: set, deleteProperty: del });
    g.window = g.self = g.globalThis = win;
    // The Android game's setTimeout never fires when the delay is left out (browsers and Node use 0).
    g.setTimeout = function (f, ms) { return real.setTimeout.apply(real, [f, +ms || 0].concat(Array.prototype.slice.call(arguments, 2))); };
    g.setInterval = function (f, ms) { return real.setInterval.apply(real, [f, +ms || 0].concat(Array.prototype.slice.call(arguments, 2))); };
    // what a browser/Node realm would also provide (mirrors the web app's Node harness)
    g.performance = real.performance || { now: function () { return Date.now(); } };
    g.queueMicrotask = real.queueMicrotask || function (f) { Promise.resolve().then(f); };
    g.structuredClone = real.structuredClone || function (v) { return JSON.parse(JSON.stringify(v)); };
    g.requestAnimationFrame = function (f) { return setTimeout(function () { f(Date.now()); }, 16); };
    g.cancelAnimationFrame = function (id) { clearTimeout(id); };
    g.addEventListener = g.removeEventListener = g.dispatchEvent = g.alert = g.confirm = g.prompt = function () {};
    g.location = { href: '', search: '', hostname: 'localhost' };
    g.screen = { width: 1170, height: 2532 };
    g.devicePixelRatio = 3;
    g.innerWidth = 390;
    g.innerHeight = 844;

    var base = opts.base;
    var manifest = JSON.parse(opts.read(base + 'manifest.json'));
    var assets = JSON.parse(opts.read(base + 'assets.json'));
    var bundles = {};
    manifest.bundles.forEach(function (b) { bundles[b] = true; });
    function pathOf(n) {
        return n.indexOf('plugin:') === 0 ? base + 'plugins/' + n.slice(7) : base + 'bundles/' + n.slice(7) + '.js';
    }

    return {
        global: win,
        storage: opts.storage,
        onSound: null,
        prefetch: function () {},
        evaluate: function (src, name) {
            // eslint-disable-next-line no-new-func
            return new Function('__iosScope', 'with (__iosScope) {\n' + src + '\n}\n//# sourceURL=ios/' + name).call(win, scope);
        },
        script: function (n) { return Promise.resolve(opts.read(pathOf(n))); },
        scriptSync: function (n) { return opts.read(pathOf(n)); },
        hasBundle: function (n) { return !!bundles[n]; },
        asset: function (b, p) { return (assets[b] && assets[b][p]) || null; },
    };
}
