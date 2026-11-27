// Hide YouTube Premium promotions: "try Premium" banners and pop-ups in feeds, the player and the
// guide. Promotions are matched by renderer name (language independent):
// - list items whose renderer is a promo/upsell one (mealbarPromoRenderer, statementBannerRenderer,
//   upsellDialogRenderer, ...);
// - actions that open such a renderer as a pop-up (openPopupAction.popup.<promo renderer>).
// The "Obtener YouTube Premium" settings card is handled by runtime.js (Custom branding).
(function () {
    if (!window.youtv) return;

    var PREFIXES = ["mealbarPromo", "bannerPromo", "statementBanner", "backgroundPromo", "primetimePromo",
        "premiumUpsell", "upsellDialog", "tvUpsellDialog", "upsellPromo", "ypcPromo", "promoHeader"];
    var PROMO = new RegExp("^(" + PREFIXES.join("|") + ")\\w*Renderer$|Upsell\\w*Renderer$");
    // Every name PROMO matches contains one of these (checked on the raw text first: cheap).
    var MARKERS = PREFIXES.concat(["Upsell"]);

    // Most response fields cannot be renderers. Cache repeated renderer names only,
    // bounded so server-provided field names cannot accumulate indefinitely.
    var rendererMatches = Object.create(null);
    var rendererMatchCount = 0;
    function isPromoKey(key) {
        if (key.indexOf("Renderer") === -1) return false;
        var cached = rendererMatches[key];
        if (cached !== undefined) return cached;
        if (rendererMatchCount >= 256) {
            rendererMatches = Object.create(null);
            rendererMatchCount = 0;
        }
        rendererMatchCount++;
        return rendererMatches[key] = PROMO.test(key);
    }

    function promoKey(object) {
        if (!object || typeof object !== "object" || Array.isArray(object)) return null;
        for (var key in object) {
            if (Object.prototype.hasOwnProperty.call(object, key) && isPromoKey(key)) return key;
        }
        return null;
    }

    function isPromo(item) {
        if (!item || typeof item !== "object" || Array.isArray(item)) return false;
        if (promoKey(item)) return true;
        var popup = item.openPopupAction && item.openPopupAction.popup;
        return !!promoKey(popup);
    }

    function removePromos(node, depth) {
        if (!node || typeof node !== "object" || depth > 30) return 0;
        var removed = 0;
        if (Array.isArray(node)) {
            // Compact once in original order instead of shifting the tail for every promo.
            var write = 0;
            for (var i = 0; i < node.length; i++) {
                var item = node[i];
                if (isPromo(item)) {
                    removed++;
                } else {
                    removed += removePromos(item, depth + 1);
                    if (write !== i) {
                        if (i in node) node[write] = item;
                        else delete node[write];
                    }
                    write++;
                }
            }
            if (write !== node.length) node.length = write;
            return removed;
        }
        for (var key in node) {
            if (!Object.prototype.hasOwnProperty.call(node, key)) continue;
            // A promo held directly in a field (for example messages.mealbarPromoRenderer).
            if (isPromoKey(key)) {
                delete node[key];
                removed++;
                continue;
            }
            removed += removePromos(node[key], depth + 1);
        }
        return removed;
    }

    youtv.feature({
        id: "premium-promos",
        nameKey: "feature.premium-promos.name",
        summaryKey: "feature.premium-promos.summary",
        defaultEnabled: true,
        onResponse: function (response, settings, text) {
            if (!youtv.mentions(text, MARKERS)) return;
            var removed = removePromos(response, 0);
            if (removed) youtv.report("premium-promos: removed " + removed + " promotion(s)");
        }
    });
})();

