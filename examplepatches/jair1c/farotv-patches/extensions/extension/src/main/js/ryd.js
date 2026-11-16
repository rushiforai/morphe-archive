// Return YouTube Dislike: shows an estimated dislike count on the "No me gusta" button, with data
// from https://returnyoutubedislike.com (returnyoutubedislikeapi.com).
// The /next response (7.32.300) has the button as likeButtonRenderer (TRANSPORT_CONTROLS_BUTTON_TYPE_LIKE_BUTTON)
// with dislikeCountText / dislikeCountWithDislikeText / dislikeCountWithUndislikeText; the count is
// fetched through the app (youtv.request) and written into that same object, which the player reads
// when it draws its controls.
(function () {
    if (!window.youtv || !youtv.request) return;

    var cache = {};     // videoId -> dislikes

    function compact(n) {
        try {
            return new Intl.NumberFormat(youtv.locale(), { notation: "compact", maximumFractionDigits: 1 }).format(n);
        } catch (e) {}
        if (n >= 1e6) return (Math.round(n / 1e5) / 10) + " M";
        if (n >= 1e3) return (Math.round(n / 1e2) / 10) + " K";
        return String(n);
    }

    function text(value, label) {
        return { simpleText: value, accessibility: { accessibilityData: { label: label } } };
    }

    function apply(renderer, dislikes) {
        var label = youtv.t("ryd.count", { count: dislikes });
        renderer.dislikeCountText = text(compact(dislikes), label);
        renderer.dislikeCountWithUndislikeText = text(compact(dislikes), label);
        renderer.dislikeCountWithDislikeText = text(compact(dislikes + 1), youtv.t("ryd.count", { count: dislikes + 1 }));
    }

    function findLikeButtons(node, depth, out) {
        if (!node || typeof node !== "object" || depth > 30) return out;
        if (node.likeButtonRenderer && node.likeButtonRenderer.target && node.likeButtonRenderer.target.videoId) {
            out.push(node.likeButtonRenderer);
            return out;
        }
        for (var key in node) {
            if (Object.prototype.hasOwnProperty.call(node, key)) findLikeButtons(node[key], depth + 1, out);
        }
        return out;
    }

    youtv.feature({
        id: "ryd",
        nameKey: "feature.ryd.name",
        summaryKey: "feature.ryd.summary",
        defaultEnabled: true,
        onResponse: function (response, settings, text) {
            if (!response.transportControls && !response.contents && !response.frameworkUpdates) return;
            if (!youtv.mentions(text, ["likeButtonRenderer"])) return;
            // The like button is one of the player controls (/next); only other responses are walked.
            var controls = response.transportControls && response.transportControls.transportControlsRenderer;
            var buttons = controls
                ? findLikeButtons([controls.promotedActions, controls.engagementActions, controls.settingActions], 0, [])
                : findLikeButtons(response, 0, []);
            buttons.forEach(function (renderer) {
                if (renderer.hideDislikeButton) return;
                var id = renderer.target.videoId;
                if (!/^[A-Za-z0-9_-]{11}$/.test(id)) return;
                if (cache[id] !== undefined) {
                    apply(renderer, cache[id]);
                    return;
                }
                youtv.request("https://returnyoutubedislikeapi.com/votes?videoId=" + id, function (status, body) {
                    if (status !== 200) return;
                    var data;
                    try { data = youtv.rawParse(body); } catch (e) { return; }
                    if (!data || typeof data.dislikes !== "number") return;
                    cache[id] = data.dislikes;
                    apply(renderer, data.dislikes);
                    youtv.report("ryd: " + id + " " + data.dislikes + " dislikes");
                });
            });
        }
    });
})();
