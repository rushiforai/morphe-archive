// Hide YouTube Premium promotions: "try Premium" banners and pop-ups in feeds, the player and the
// guide. Promotions are matched by renderer name (language independent):
// - list items whose renderer is a promo/upsell one (mealbarPromoRenderer, statementBannerRenderer,
//   upsellDialogRenderer, ...);
// - actions that open such a renderer as a pop-up (openPopupAction.popup.<promo renderer>).
// The "Obtener YouTube Premium" settings card is handled by runtime.js (Custom branding).
(function () {
    if (!window.youtv) return;

    var PROMO = /^(mealbarPromo|bannerPromo|statementBanner|backgroundPromo|primetimePromo|premiumUpsell|upsellDialog|tvUpsellDialog|upsellPromo|ypcPromo|promoHeader)\w*Renderer$|Upsell\w*Renderer$/;

    function promoKey(object) {
        if (!object || typeof object !== "object" || Array.isArray(object)) return null;
        for (var key in object) {
            if (Object.prototype.hasOwnProperty.call(object, key) && PROMO.test(key)) return key;
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
            for (var i = node.length - 1; i >= 0; i--) {
                if (isPromo(node[i])) {
                    node.splice(i, 1);
                    removed++;
                } else {
                    removed += removePromos(node[i], depth + 1);
                }
            }
            return removed;
        }
        for (var key in node) {
            if (!Object.prototype.hasOwnProperty.call(node, key)) continue;
            // A promo held directly in a field (for example messages.mealbarPromoRenderer).
            if (PROMO.test(key)) {
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
        name: "Ocultar promociones de Premium",
        summary: "Quita los avisos para probar o comprar YouTube Premium",
        defaultEnabled: true,
        onResponse: function (response) {
            var removed = removePromos(response, 0);
            if (removed) youtv.report("premium-promos: removed " + removed + " promotion(s)");
        }
    });
})();
