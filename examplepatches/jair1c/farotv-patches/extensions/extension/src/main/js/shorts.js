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

    youtv.feature({
        id: "shorts",
        nameKey: "feature.shorts.name",
        summaryKey: "feature.shorts.summary",
        defaultEnabled: true,
        restart: true,
        treeFilter: {
            markers: ["reelWatchEndpoint", "TVHTML5_SHELF_RENDERER_TYPE_SHORTS"],
            item: isShorts,
            report: function (removed) { youtv.report("shorts: removed " + removed + " item(s)"); }
        }
    });
})();
