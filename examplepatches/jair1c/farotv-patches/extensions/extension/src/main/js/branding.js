// Branding: replaces the YouTube wordmark (top bar, sign-in screen) with the app's own (FaroTV by
// default). Only active when the "Custom branding" patch set window.__youtvBranding to the app name.
// The wordmark is an element whose inline style sets a gstatic image as background; a constructed
// stylesheet (the page's CSP blocks <style> elements) overrides it with !important.
(function () {
    if (!window.youtv || !window.__youtvBranding || window.__youtvBrandingDone) return;
    window.__youtvBrandingDone = true;

    var name = String(window.__youtvBranding);
    // "FaroTV" -> "Faro" in white + "TV" in amber.
    var main = name, accent = "";
    if (name.length > 2 && /TV$/.test(name)) {
        main = name.slice(0, -2);
        accent = "TV";
    }
    function esc(s) {
        return s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    }

    // The FaroTV mark (branding/farotv-mark.svg), reduced.
    var MARK =
        '<defs><clipPath id="r"><rect width="512" height="512" rx="116"/></clipPath>' +
        '<linearGradient id="s" x1="0" y1="0" x2="0" y2="1"><stop offset="0" stop-color="#0B1F3A"/><stop offset="1" stop-color="#0E6E7A"/></linearGradient>' +
        '<linearGradient id="c" x1="0" y1="0" x2="1" y2="0"><stop offset="0" stop-color="#FFD166" stop-opacity="0.75"/><stop offset="1" stop-color="#FFD166" stop-opacity="0"/></linearGradient>' +
        '<linearGradient id="b" x1="0" y1="0" x2="1" y2="0"><stop offset="0" stop-color="#FFE08A"/><stop offset="1" stop-color="#FF9F1C"/></linearGradient></defs>' +
        '<g clip-path="url(#r)"><rect width="512" height="512" fill="url(#s)"/>' +
        '<path d="M214 194 L512 92 L512 316 L214 214 Z" fill="url(#c)"/>' +
        '<path d="M272 152 L272 256 L388 204 Z" fill="url(#b)" stroke="url(#b)" stroke-width="20" stroke-linejoin="round"/>' +
        '<path d="M162 176 L230 176 L196 138 Z" fill="#FFF" stroke="#FFF" stroke-width="8" stroke-linejoin="round"/>' +
        '<rect x="173" y="178" width="46" height="50" rx="6" fill="#FFD166"/>' +
        '<rect x="158" y="226" width="76" height="14" rx="5" fill="#FFF"/>' +
        '<path d="M168 240 L224 240 L242 408 L150 408 Z" fill="#FFF"/>' +
        '<path d="M162 298 L230 298 L234 334 L158 334 Z" fill="#E4572E"/>' +
        '<path d="M0 404 C 60 384, 110 424, 170 404 S 280 384, 340 404 S 450 424, 512 404 L512 512 L0 512 Z" fill="#0A4D5C"/>' +
        '<path d="M0 440 C 70 420, 130 458, 200 440 S 330 420, 400 440 S 480 456, 512 444 L512 512 L0 512 Z" fill="#083A47"/></g>';

    // The square app icon, for the card that replaces "Obtener YouTube Premium" (see runtime.js).
    var iconUrl = "data:image/svg+xml," + encodeURIComponent(
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">' + MARK + '</svg>');

    var width = 64 + Math.round(name.length * 24);
    var svg =
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ' + width + ' 56">' +
        '<svg x="0" y="2" width="52" height="52" viewBox="0 0 512 512">' + MARK + '</svg>' +
        '<text x="62" y="40" font-family="Roboto, Arial, sans-serif" font-weight="700" font-size="38" letter-spacing="-0.5">' +
        '<tspan fill="#FFFFFF">' + esc(main) + '</tspan>' +
        (accent ? '<tspan fill="#FFB43A">' + accent + '</tspan>' : '') +
        '</text></svg>';
    var url = "data:image/svg+xml," + encodeURIComponent(svg);

    // ---- accent colour ------------------------------------------------------------------------
    // YouTube TV's red (#f03, and the #f03 -> #ff2791 gradient of progress bars) becomes FaroTV
    // amber. The class names are minified and change between versions, so the page's own style
    // rules are scanned and the red ones are repeated with the new colours in a later sheet.
    var RED = /rgba?\(225, 0, 45(?:, [0-9.]+)?\)|rgb\(255, 0, 51\)|rgb\(255, 0, 0\)|rgb\(255, 39, 145\)|#ff0033\b|#f03\b|#ff0000\b|#f00\b|#ff2791\b/gi;
    function amber(value) {
        return value.replace(RED, function (m) {
            if (/39, 145|2791/i.test(m)) return "#FF9F1C";
            var alpha = /225, 0, 45, ([0-9.]+)/.exec(m);
            return alpha ? "rgba(255, 180, 58, " + alpha[1] + ")" : "#FFB43A";
        });
    }
    var accent = new CSSStyleSheet();
    var seenRules = {};
    var accentRules = [];
    function collect(rules) {
        for (var i = 0; i < rules.length; i++) {
            var rule = rules[i];
            if (rule.cssRules && !rule.selectorText) {
                collect(rule.cssRules);
                continue;
            }
            if (!rule.style || !rule.selectorText) continue;
            var css = rule.style.cssText;
            RED.lastIndex = 0;
            if (!RED.test(css) || seenRules[rule.selectorText + css]) continue;
            seenRules[rule.selectorText + css] = true;
            var decls = [];
            for (var j = 0; j < rule.style.length; j++) {
                var prop = rule.style[j];
                var value = rule.style.getPropertyValue(prop);
                RED.lastIndex = 0;
                if (!RED.test(value)) continue;
                decls.push(prop + ": " + amber(value) + " !important");
            }
            if (decls.length) accentRules.push(rule.selectorText + " { " + decls.join("; ") + " }");
        }
    }
    var lastSheetCount = -1;
    function recolor() {
        var sheets = document.styleSheets;
        if (sheets.length === lastSheetCount) return;
        lastSheetCount = sheets.length;
        var before = accentRules.length;
        for (var i = 0; i < sheets.length; i++) {
            try { collect(sheets[i].cssRules); } catch (e) {}
        }
        if (accentRules.length !== before) {
            try {
                accent.replaceSync(accentRules.join("\n"));
                youtv.report("branding: " + accentRules.length + " red rule(s) recoloured");
            } catch (e) {
                youtv.report("branding: recolour failed: " + e);
            }
        }
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
