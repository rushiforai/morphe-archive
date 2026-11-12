// Hide Shorts: the Shorts entry in the main menu and the Shorts shelves in feeds.
// Based on utv-runtime's "shorts" patch (MIT License, Copyright (c) 2026 Dylan Duff).
// Markers (language independent):
// - menu entry: guideEntryRenderer whose navigationEndpoint is a reelWatchEndpoint (after restart)
// - shelf: shelfRenderer.tvhtml5ShelfRendererType "TVHTML5_SHELF_RENDERER_TYPE_SHORTS"
(function () {
    if (!window.youtv) return;

    function isShorts(item) {
        if (!item || typeof item !== "object") return false;
        var entry = item.guideEntryRenderer;
        if (entry) return !!(entry.navigationEndpoint && entry.navigationEndpoint.reelWatchEndpoint);
        var shelf = item.shelfRenderer;
        return !!shelf && shelf.tvhtml5ShelfRendererType === "TVHTML5_SHELF_RENDERER_TYPE_SHORTS";
    }

    function removeShorts(node, depth) {
        if (!node || typeof node !== "object" || depth > 30) return 0;
        var removed = 0;
        if (Array.isArray(node)) {
            for (var i = node.length - 1; i >= 0; i--) {
                if (isShorts(node[i])) {
                    node.splice(i, 1);
                    removed++;
                } else {
                    removed += removeShorts(node[i], depth + 1);
                }
            }
            return removed;
        }
        for (var key in node) {
            if (Object.prototype.hasOwnProperty.call(node, key)) removed += removeShorts(node[key], depth + 1);
        }
        return removed;
    }

    youtv.feature({
        id: "shorts",
        name: "Ocultar Shorts",
        summary: "Quita las filas de Shorts y la entrada Shorts del menú (el menú cambia al reiniciar la app)",
        defaultEnabled: true,
        restart: true,
        onResponse: function (response) {
            var removed = removeShorts(response, 0);
            if (removed) youtv.report("shorts: removed " + removed + " item(s)");
        }
    });
})();
