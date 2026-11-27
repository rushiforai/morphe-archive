// Optional aggregate diagnostics. No observers or periodic reports in normal builds.
(function () {
    if (!window.__farotvDiagnostics || !window.youtv || window.__farotvDiagnosticsStarted) return;
    window.__farotvDiagnosticsStarted = true;
    var resources = {};
    var longTasks = { count: 0, ms: 0, maxMs: 0 };
    var supported = { resource: false, longtask: false };
    var observers = [];

    function resource(entry) {
        var group = "other";
        try {
            var url = new URL(entry.name, location.href);
            if (url.hostname === "www.youtube.com" && url.pathname.indexOf("/youtubei/") === 0) {
                var method = url.pathname.split("/").pop();
                group = /^(player|browse|next|get_watch|search)$/.test(method) ? method : "other_api";
            } else if (/^(img|script|css|video|audio)$/.test(entry.initiatorType)) group = entry.initiatorType;
        } catch (ignored) {}
        var item = resources[group] || { count: 0, ms: 0, maxMs: 0, slow: 0, ttfbCount: 0, ttfbMs: 0 };
        var duration = Number(entry.duration) || 0;
        item.count++; item.ms += duration; item.maxMs = Math.max(item.maxMs, duration);
        if (duration >= 1000) item.slow++;
        if (entry.responseStart > entry.startTime) {
            item.ttfbCount++; item.ttfbMs += entry.responseStart - entry.startTime;
        }
        resources[group] = item;
    }

    function observe(type, consume) {
        if (typeof window.PerformanceObserver !== "function") return;
        var types = window.PerformanceObserver.supportedEntryTypes;
        if (types && types.indexOf(type) === -1) return;
        try {
            var observer = new PerformanceObserver(function (list) { list.getEntries().forEach(consume); });
            observer.observe({ entryTypes: [type] });
            observers.push(observer);
            supported[type] = true;
        } catch (ignored) {}
    }
    observe("resource", resource);
    observe("longtask", function (entry) {
        longTasks.count++; longTasks.ms += entry.duration;
        longTasks.maxMs = Math.max(longTasks.maxMs, entry.duration);
    });
    try {
        if (performance.getEntriesByType) performance.getEntriesByType("resource").forEach(resource);
    } catch (ignored) {}

    setInterval(function () {
        var snapshot = { supported: supported, runtime: youtv.performanceSnapshot(), resources: resources, longTasks: longTasks };
        try {
            var sheets = document.adoptedStyleSheets;
            var icons = 0;
            for (var i = 0; i < sheets.length; i++) {
                var rule = sheets[i].cssRules && sheets[i].cssRules[0];
                if (rule && rule.selectorText && rule.selectorText.indexOf("farotv=ads") !== -1) icons++;
            }
            snapshot.styles = { adopted: sheets.length, icons: icons };
        } catch (ignored) {}
        if (window.__farotvBrandingPerformance) {
            var branding = window.__farotvBrandingPerformance;
            snapshot.branding = { passes: branding.passes, slices: branding.slices,
                rules: branding.rules, ms: branding.ms, maxSliceMs: branding.maxSliceMs };
        }
        resources = {}; longTasks = { count: 0, ms: 0, maxMs: 0 };
        youtv.report("perf " + JSON.stringify(snapshot, function (key, value) {
            return typeof value === "number" ? Math.round(value * 100) / 100 : value;
        }));
    }, 15000);
})();
