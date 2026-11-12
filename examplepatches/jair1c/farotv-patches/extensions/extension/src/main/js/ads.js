// Block ads:
// - video ads: remove the ad schedule from player responses before the player reads it;
// - sponsored tiles in feeds ("Patrocinado"): remove ad slot items from every list.
// Based on utv-runtime's "adblock" patch (MIT License, Copyright (c) 2026 Dylan Duff) and
// ysamjo/morphe-patches (GPLv3).
(function () {
    if (!window.youtv) return;

    var AD_KEYS = ["adPlacements", "adSlots", "playerAds", "adBreakHeartbeatParams"];

    // Feed items that are ads. Seen on Home (7.32.300): adSlotRenderer wrapping an
    // inFeedAdLayoutRenderer, as the first tile of the first shelf.
    var AD_ITEM_KEYS = ["adSlotRenderer", "inFeedAdLayoutRenderer", "promotedVideoRenderer",
        "compactPromotedVideoRenderer", "promotedSparklesWebRenderer"];

    function stripAds(value) {
        var hit = false;
        for (var i = 0; i < AD_KEYS.length; i++) {
            if (Object.prototype.hasOwnProperty.call(value, AD_KEYS[i])) {
                delete value[AD_KEYS[i]];
                hit = true;
            }
        }
        var nested = value.playerResponse;
        if (nested && typeof nested === "object") hit = stripAds(nested) || hit;
        return hit;
    }

    function isAdItem(item) {
        if (!item || typeof item !== "object" || Array.isArray(item)) return false;
        for (var i = 0; i < AD_ITEM_KEYS.length; i++) {
            if (Object.prototype.hasOwnProperty.call(item, AD_ITEM_KEYS[i])) return true;
        }
        return false;
    }

    function removeAdItems(node, depth) {
        if (!node || typeof node !== "object" || depth > 30) return 0;
        var removed = 0;
        if (Array.isArray(node)) {
            for (var i = node.length - 1; i >= 0; i--) {
                if (isAdItem(node[i])) {
                    node.splice(i, 1);
                    removed++;
                } else {
                    removed += removeAdItems(node[i], depth + 1);
                }
            }
            return removed;
        }
        for (var key in node) {
            if (Object.prototype.hasOwnProperty.call(node, key)) removed += removeAdItems(node[key], depth + 1);
        }
        return removed;
    }

    youtv.feature({
        id: "ads",
        name: "Bloquear anuncios",
        summary: "Quita los anuncios de video y los videos patrocinados de Inicio",
        defaultEnabled: true,
        onResponse: function (response) {
            if (stripAds(response)) youtv.report("ads: removed ad schedule");
            if (response.contents || response.onResponseReceivedActions || response.continuationContents) {
                var removed = removeAdItems(response, 0);
                if (removed) youtv.report("ads: removed " + removed + " sponsored item(s)");
            }
        }
    });
})();
