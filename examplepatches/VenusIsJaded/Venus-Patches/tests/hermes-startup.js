/* Native services are mocked; the RN initializer itself comes from the user's real HBC98 asset. */
(function (g) {
    "use strict";
    let ready = false;
    g.RN$Bridgeless = true;
    g.RN$useAlwaysAvailableJSErrorHandling = true;
    g.RN$isRuntimeReady = function () { return ready; };
    g.RN$hasHandledFatalException = function () { return false; };
    g.RN$handleException = function (error) { throw error; };
    g.RN$registerCallableModule = function () {};
    g.nativePerformanceNow = function () { return 1; };
    g.nativeLoggingHook = function (text) { print(text); };
    g.__turboModuleProxy = function (name) {
        const constants = {
            isTesting: true, forceTouchAvailable: false, osVersion: "test",
            Version: 35, reactNativeVersion: {major: 0, minor: 82, patch: 0},
            Dimensions: {window: {width: 400, height: 800, scale: 1, fontScale: 1},
                screen: {width: 400, height: 800, scale: 1, fontScale: 1}}
        };
        return new Proxy({}, {get: function (_, key) {
            if (key === "getConstants") return function () { return constants; };
            if (key === "getEnforcing") return function () { return {}; };
            return function () { return false; };
        }});
    };
    // Original 348.10 global ends with __r(1), __r(2). Run only RN setup, not Discord's account/network code.
    let metro;
    let ran = false;
    Object.defineProperty(g, "__r", {configurable: true,
        set: function (value) { metro = value; },
        get: function () { return function () {
            if (!ran) {
                ran = true;
                const setup = metro(120);
                if (typeof setup.default !== "function") throw Error("Missing original RN initializer");
                setup.default();
                ready = true;
                if (!g.__venusPatches || g.__venusPatches.revision !== "1.4.4")
                    throw Error("Replacement prelude did not execute");
                print("HBC98_REAL_RN_ENVIRONMENT_PASS");
            }
            return {};
        }; }
    });
})(globalThis);
