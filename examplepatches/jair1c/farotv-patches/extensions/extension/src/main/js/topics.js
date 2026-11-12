// Hide topic tabs (Gaming, Podcasts, News, Music, Sports, Movies & TV) in the main menu.
// Based on utv-runtime's "navigation" patch (MIT License, Copyright (c) 2026 Dylan Duff).
// The guide response is items[].guideSectionRenderer.items[] of guideEntryRenderer; topic tabs
// browse to "FEtopics_<topic>" (Home is plain "FEtopics" and stays). Applies after a restart.
(function () {
    if (!window.youtv) return;

    function isTopicTab(entry) {
        var renderer = entry && entry.guideEntryRenderer;
        var browse = renderer && renderer.navigationEndpoint && renderer.navigationEndpoint.browseEndpoint;
        return !!browse && /^FEtopics_./.test(browse.browseId || "");
    }

    youtv.feature({
        id: "topics",
        name: "Ocultar pestañas temáticas",
        summary: "Quita Videojuegos, Pódcasts, Noticias, Música, Deportes y Películas del menú (al reiniciar la app)",
        defaultEnabled: false,
        restart: true,
        onResponse: function (response) {
            if (!Array.isArray(response.items)) return;
            var removed = 0;
            response.items.forEach(function (item) {
                var section = item && item.guideSectionRenderer;
                if (!section || !Array.isArray(section.items)) return;
                var kept = section.items.filter(function (entry) { return !isTopicTab(entry); });
                removed += section.items.length - kept.length;
                section.items = kept;
            });
            if (removed) youtv.report("topics: removed " + removed + " tab(s)");
        }
    });
})();
