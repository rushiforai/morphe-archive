// Branding: replaces the YouTube wordmark (top bar, sign-in screen) with the app's own (BirdyTV by
// default). Only active when the "Custom branding" patch set window.__youtvBranding to the app name.
// The wordmark is an element whose inline style sets a gstatic image as background; a constructed
// stylesheet (the page's CSP blocks <style> elements) overrides it with !important.
(function () {
    if (!window.youtv || !window.__youtvBranding || window.__youtvBrandingDone) return;
    window.__youtvBrandingDone = true;

    var name = String(window.__youtvBranding);
    // "BirdyTV" -> "Birdy" in white + "TV" in red.
    var main = name, accent = "";
    if (name.length > 2 && /TV$/.test(name)) {
        main = name.slice(0, -2);
        accent = "TV";
    }
    function esc(s) {
        return s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    }

    // The BirdyTV mark (branding/birdy-mark.svg), reduced.
    var MARK =
        '<defs><clipPath id="r"><rect width="512" height="512" rx="116"/></clipPath>' +
        '<linearGradient id="s" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="#12070A"/><stop offset="1" stop-color="#24080E"/></linearGradient>' +
        '<radialGradient id="g" cx="0.5" cy="0.5" r="0.5"><stop offset="0" stop-color="#FF1A35" stop-opacity="0.35"/><stop offset="1" stop-color="#FF1A35" stop-opacity="0"/></radialGradient>' +
        '<linearGradient id="t" x1="0" y1="1" x2="1" y2="0"><stop offset="0" stop-color="#8C0014"/><stop offset="1" stop-color="#C62328"/></linearGradient>' +
        '<linearGradient id="k" x1="0" y1="1" x2="1" y2="0"><stop offset="0" stop-color="#A50A19"/><stop offset="1" stop-color="#D7232D"/></linearGradient>' +
        '<linearGradient id="w" x1="0" y1="1" x2="1" y2="0"><stop offset="0" stop-color="#E10F23"/><stop offset="1" stop-color="#FF3741"/></linearGradient>' +
        '<linearGradient id="y" x1="0" y1="1" x2="1" y2="0"><stop offset="0" stop-color="#D70F1E"/><stop offset="1" stop-color="#FF1E2D"/></linearGradient>' +
        '<linearGradient id="b" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="#FFC107"/><stop offset="1" stop-color="#FF9800"/></linearGradient></defs>' +
        '<g clip-path="url(#r)"><rect width="512" height="512" fill="url(#s)"/>' +
        '<circle cx="256" cy="256" r="190" fill="url(#g)"/>' +
        '<polygon points="120,310 65,385 125,360 95,425 175,350 150,310" fill="url(#t)"/>' +
        '<polygon points="150,310 220,120 310,180 240,280" fill="url(#k)"/>' +
        '<polygon points="200,280 315,95 375,160 280,270" fill="url(#w)"/>' +
        '<polygon points="180,345 230,355 335,285 370,195 375,140 325,155 270,230 180,345" fill="url(#y)"/>' +
        '<polygon points="365,145 435,170 360,190" fill="url(#b)"/>' +
        '<circle cx="335" cy="160" r="5" fill="#FFFFFF"/>' +
        '<polygon points="248,198 338,259 248,320" fill="rgba(80,0,10,0.4)"/>' +
        '<polygon points="245,195 335,256 245,317" fill="#FFFFFF"/></g>';

    // The square app icon, for the card that replaces "Obtener YouTube Premium" (see runtime.js).
    var iconUrl = "data:image/svg+xml," + encodeURIComponent(
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">' + MARK + '</svg>');

    var width = 64 + Math.round(name.length * 24);
    var svg =
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ' + width + ' 56">' +
        '<svg x="0" y="2" width="52" height="52" viewBox="0 0 512 512">' + MARK + '</svg>' +
        '<text x="62" y="40" font-family="Roboto, Arial, sans-serif" font-weight="700" font-size="38" letter-spacing="-0.5">' +
        '<tspan fill="#FFFFFF">' + esc(main) + '</tspan>' +
        (accent ? '<tspan fill="#FF2028">' + accent + '</tspan>' : '') +
        '</text></svg>';
    var url = "data:image/svg+xml," + encodeURIComponent(svg);

    // ---- accent colour ------------------------------------------------------------------------
    // YouTube TV's red accent is maintained and unified into Birdy Red.
    var RED = /rgba?\(225, 0, 45(?:, [0-9.]+)?\)|rgb\(255, 0, 51\)|rgb\(255, 0, 0\)|rgb\(255, 39, 145\)|#ff0033\b|#f03\b|#ff0000\b|#f00\b|#ff2791\b/gi;
    function redAccent(value) {
        return value.replace(RED, function (m) {
            if (/39, 145|2791/i.test(m)) return "#FF3741";
            var alpha = /225, 0, 45, ([0-9.]+)/.exec(m);
            return alpha ? "rgba(255, 32, 40, " + alpha[1] + ")" : "#FF2028";
        });
    }
    var accent = new CSSStyleSheet();
    var seenRules = {};
    var accentRules = [];
    // Walk CSS in small scheduled slices instead of scanning all sheets in one task.
    var pendingRules = [];
    var scanning = false;
    var rescan = false;
    var lastSheetCount = -1;
    var metrics = window.__farotvDiagnostics ? { passes: 0, slices: 0, rules: 0, ms: 0, maxSliceMs: 0 } : null;
    if (metrics) window.__farotvBrandingPerformance = metrics;
    function now() {
        return window.performance && typeof performance.now === "function" ? performance.now() : Date.now();
    }
    function collectRule(rule) {
        if (!rule.style || !rule.selectorText) return;
        var css = rule.style.cssText;
        RED.lastIndex = 0;
        if (!RED.test(css) || seenRules[rule.selectorText + css]) return;
        seenRules[rule.selectorText + css] = true;
        var decls = [];
        for (var j = 0; j < rule.style.length; j++) {
            var prop = rule.style[j];
            var value = rule.style.getPropertyValue(prop);
            RED.lastIndex = 0;
            if (!RED.test(value)) continue;
            decls.push(prop + ": " + redAccent(value) + " !important");
        }
        if (decls.length) accentRules.push(rule.selectorText + " { " + decls.join("; ") + " }");
    }
    function scanSlice() {
        var started = now();
        var count = 0;
        while (pendingRules.length && count < 64 && (count === 0 || now() - started < 4)) {
            var frame = pendingRules[pendingRules.length - 1];
            try {
                if (frame.index >= frame.rules.length) { pendingRules.pop(); continue; }
                var rule = frame.rules[frame.index++];
                count++;
                if (rule.cssRules && !rule.selectorText) {
                    pendingRules.push({ rules: rule.cssRules, index: 0 });
                } else collectRule(rule);
            } catch (ignored) { pendingRules.pop(); }
        }
        function recordSlice() {
            if (!metrics) return;
            var elapsed = now() - started;
            metrics.slices++; metrics.rules += count; metrics.ms += elapsed;
            metrics.maxSliceMs = Math.max(metrics.maxSliceMs, elapsed);
        }
        if (pendingRules.length) { recordSlice(); setTimeout(scanSlice, 0); return; }
        if (accentRules.length !== rulesBeforeScan) {
            try {
                accent.replaceSync(accentRules.join("\n"));
                youtv.report("branding: " + accentRules.length + " red rule(s) recoloured");
            } catch (e) { youtv.report("branding: recolour failed: " + e); }
        }
        scanning = false;
        recordSlice();
        if (rescan) { rescan = false; recolor(); }
    }
    var rulesBeforeScan = 0;
    function recolor() {
        var sheets = document.styleSheets;
        if (sheets.length === lastSheetCount) return;
        if (scanning) { rescan = true; return; }
        lastSheetCount = sheets.length;
        rulesBeforeScan = accentRules.length;
        // Push backwards so rules retain their original cascade order.
        for (var i = sheets.length - 1; i >= 0; i--) {
            try { pendingRules.push({ rules: sheets[i].cssRules, index: 0 }); } catch (ignored) {}
        }
        scanning = true;
        if (metrics) metrics.passes++;
        setTimeout(scanSlice, 0);
    }
    try {
        document.adoptedStyleSheets = document.adoptedStyleSheets.concat([accent]);
    } catch (e) {}
    recolor();
    // YouTube loads more stylesheets as you move around; check again for a while.
    var checks = 0;
    var recolorTimer = setInterval(function () {
        recolor();
        if (++checks > 120) clearInterval(recolorTimer);
    }, 2000);

    try {
        var sheet = new CSSStyleSheet();
        // Top bar logo (right aligned), and any other YouTube wordmark image, such as the one on
        // the sign-in screen (left aligned). Both are ytlr-thumbnail-details with the wordmark
        // from gstatic .../livingroom/youtube/wordmark/... as inline background.
        var WORDMARK = 'ytlr-thumbnail-details[style*="livingroom/youtube/wordmark"]';
        var image =
            " background-image: url(\"" + url + "\") !important;" +
            " background-size: contain !important;" +
            " background-repeat: no-repeat !important;";
        sheet.replaceSync(
            // Sign-in / activation screen: 20% bigger, growing from its left edge.
            WORDMARK + " {" + image + " background-position: left center !important;" +
            " transform: scale(1.2); transform-origin: left center; }\n" +
            "ytlr-logo-entity ytlr-thumbnail-details, ytlr-logo-entity " + WORDMARK + " {" + image +
            " background-position: right center !important; transform: none; }\n" +
            // The Premium card keeps its gstatic thumbnail URL (a data: URL there is not drawn).
            '[style*="yt_logo_premium_landing_page"], [style*="farotv=brand"] { background-image: url("' + iconUrl + '") !important;' +
            " background-size: contain !important; background-repeat: no-repeat !important;" +
            " background-position: center !important; background-color: transparent !important; }");
        document.adoptedStyleSheets = document.adoptedStyleSheets.concat([sheet]);
        youtv.report("branding: " + name);
    } catch (e) {
        youtv.report("branding failed: " + e);
    }
})();
