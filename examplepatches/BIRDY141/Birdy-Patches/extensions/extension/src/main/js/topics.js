// Hide topic tabs (Gaming, Podcasts, News, Music, Sports, Movies & TV) in the main menu.
// Based on utv-runtime's "navigation" patch (MIT License, Copyright (c) 2026 Dylan Duff).
// The guide response is items[].guideSectionRenderer.items[] of guideEntryRenderer; topic tabs
// browse to "FEtopics_<topic>" (Home is plain "FEtopics" and stays). Applies after a restart.
(function () {
    if (!window.youtv) return;

    var TOPIC_KEYS = ["gaming", "music", "news", "sports", "podcasts", "movies"];

    var topicSettings = TOPIC_KEYS.map(function (key) {
        return {
            key: "hide_" + key,
            titleKey: "topics." + key + ".title",
            default: true,
            restart: true
        };
    });

    var feature = youtv.feature({
        id: "topics",
        nameKey: "feature.topics.name",
        summaryKey: "feature.topics.summary",
        defaultEnabled: false,
        restart: true,
        settings: topicSettings,
        onResponse: function (response) {
            if (!Array.isArray(response.items)) return;
            var removed = 0;
            response.items.forEach(function (item) {
                var section = item && item.guideSectionRenderer;
                if (!section || !Array.isArray(section.items)) return;
                var kept = section.items.filter(function (entry) { return !shouldHideTopicTab(entry); });
                removed += section.items.length - kept.length;
                section.items = kept;
            });
            if (removed) youtv.report("topics: removed " + removed + " tab(s)");
        }
    });

    function shouldHideTopicTab(entry) {
        var renderer = entry && entry.guideEntryRenderer;
        var browse = renderer && renderer.navigationEndpoint && renderer.navigationEndpoint.browseEndpoint;
        var browseId = browse && browse.browseId;
        if (!browseId || !/^FEtopics_./.test(browseId)) return false;
        var suffix = browseId.slice("FEtopics_".length).toLowerCase();
        for (var i = 0; i < TOPIC_KEYS.length; i++) {
            var key = TOPIC_KEYS[i];
            if (suffix === key || suffix.indexOf(key) === 0) {
                return feature && feature.settings ? feature.settings.get("hide_" + key) !== false : true;
            }
        }
        return true;
    }
})();
