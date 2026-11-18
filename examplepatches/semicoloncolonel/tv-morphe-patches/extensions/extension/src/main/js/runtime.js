// Injection runtime: loaded first into https://www.youtube.com/tv/upg (the YouTube TV
// living-room web app), on every page load, by TvScripts via Cobalt's WebContents.
// Feature scripts (the other .js files) register themselves with youtv.feature().
//
// The injection technique and this runtime's JSON.parse response hook come from
// DylanDuff/utv-runtime (MIT) and ysamjo/morphe-patches (GPLv3), by way of
// jair1c/farotv-patches (GPLv3). See the NOTICE file. The settings UI, restart
// dialog, and cross-site network bridge of the original are removed here: every
// feature runs always-on, so there is no stored state and nothing to draw.
//
// youtv.feature({
//     id: "ads",                                 // [a-z0-9-]+, unique
//     onResponse: function (response) { ... }     // every parsed InnerTube response
// });
(function () {
    if (location.hostname !== "www.youtube.com" || window.youtv) return;

    var parse = JSON.parse;

    // Console output of injected code never reaches logcat. report() briefly sets
    // document.title to "tvp:<message>"; the patched navigation observer (titleWasSet)
    // logs it under the tag MSP-YTTV-SHELL.
    var reportQueue = [];
    var savedTitle = null;
    function report(message) {
        reportQueue.push(message);
        if (reportQueue.length === 1 && savedTitle === null) setTimeout(flushReports, 0);
    }
    function flushReports() {
        if (savedTitle === null) savedTitle = document.title;
        if (reportQueue.length === 0) {
            document.title = savedTitle;
            savedTitle = null;
            return;
        }
        document.title = "tvp:" + reportQueue.shift();
        setTimeout(flushReports, 0);
    }

    // ---- features ---------------------------------------------------------------------------
    var features = [];

    function defineFeature(definition) {
        var id = definition && definition.id;
        if (!/^[a-z0-9-]+$/.test(id || "")) return report("feature rejected: invalid id " + id);
        for (var i = 0; i < features.length; i++) {
            if (features[i].id === id) return;
        }
        features.push({ id: id, definition: definition });
    }

    // ---- response hook ----------------------------------------------------------------------
    // Every InnerTube response is parsed through JSON.parse; each feature gets a look before the
    // app reads it, so a feature can delete ad data in place.
    JSON.parse = function () {
        var result = parse.apply(this, arguments);
        if (!result || typeof result !== "object") return result;
        for (var i = 0; i < features.length; i++) {
            var feature = features[i];
            if (typeof feature.definition.onResponse !== "function") continue;
            try {
                feature.definition.onResponse(result);
            } catch (e) {
                report(feature.id + ": failed: " + e);
            }
        }
        return result;
    };

    window.youtv = {
        report: report,
        rawParse: parse,
        feature: defineFeature,
        status: function () {
            return features.map(function (f) { return f.id; });
        }
    };
    report("runtime loaded on " + location.href);
})();
