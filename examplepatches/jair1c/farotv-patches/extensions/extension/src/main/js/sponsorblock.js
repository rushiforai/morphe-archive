// SponsorBlock: skips sponsored parts, self-promotion, "subscribe" reminders and other segments
// marked by the SponsorBlock community (https://sponsor.ajay.app, data under CC BY-NC-SA 4.0).
// The video ID comes from the page address (#/watch?v=ID); the segments are fetched through the
// app (youtv.request) and the <video> element is moved past each segment.
(function () {
    if (!window.youtv || !youtv.request) return;

    var CATEGORIES = [
        { key: "sponsor", title: "Saltar patrocinios", label: "patrocinio", default: true },
        { key: "selfpromo", title: "Saltar autopromoción", label: "autopromoción", default: true },
        { key: "interaction", title: "Saltar recordatorios de suscripción", label: "recordatorio", default: true },
        { key: "intro", title: "Saltar intros", label: "intro", default: false },
        { key: "outro", title: "Saltar créditos finales", label: "créditos", default: false },
        { key: "preview", title: "Saltar avances y resúmenes", label: "avance", default: false },
        { key: "music_offtopic", title: "Saltar partes sin música en videos musicales", label: "parte sin música", default: false },
        { key: "filler", title: "Saltar relleno", label: "relleno", default: false }
    ];

    var feature = youtv.feature({
        id: "sponsorblock",
        name: "SponsorBlock",
        summary: "Salta automáticamente los patrocinios y otras partes marcadas por la comunidad de SponsorBlock",
        defaultEnabled: true,
        settings: CATEGORIES.map(function (c) {
            return { key: c.key, title: c.title, default: c.default };
        })
    });
    if (!feature) return;

    var videoId = null;
    var segments = [];      // { start, end, label, skipped }

    function currentVideoId() {
        var match = /[?&]v=([A-Za-z0-9_-]{11})/.exec(location.hash || "");
        return match ? match[1] : null;
    }

    function enabledCategories() {
        return CATEGORIES.filter(function (c) { return feature.settings.get(c.key); });
    }

    function load(id) {
        segments = [];
        var categories = enabledCategories();
        if (!categories.length) return;
        var url = "https://sponsor.ajay.app/api/skipSegments?videoID=" + id +
            "&categories=" + encodeURIComponent(JSON.stringify(categories.map(function (c) { return c.key; })));
        youtv.request(url, function (status, body) {
            if (id !== videoId) return;
            if (status !== 200) {
                if (status !== 404) youtv.report("sponsorblock: HTTP " + status + " for " + id);
                return;
            }
            var list;
            try { list = youtv.rawParse(body); } catch (e) { return; }
            if (!Array.isArray(list)) return;
            var labels = {};
            CATEGORIES.forEach(function (c) { labels[c.key] = c.label; });
            segments = list.filter(function (s) {
                return s && Array.isArray(s.segment) && (s.actionType || "skip") === "skip" && s.segment[1] > s.segment[0];
            }).map(function (s) {
                return { start: s.segment[0], end: s.segment[1], label: labels[s.category] || s.category, skipped: false };
            });
            youtv.report("sponsorblock: " + segments.length + " segment(s) for " + id);
        });
    }

    // ---- notice -------------------------------------------------------------------------------
    var sheet = new CSSStyleSheet();
    try {
        sheet.replaceSync(
            ".farotv-skip-notice { position: fixed; left: 4.5rem; bottom: 4rem; z-index: 2147483647;" +
            " padding: 0.9rem 1.6rem; border-radius: 1.5rem; background: rgba(15, 15, 15, 0.9);" +
            " color: #f1f1f1; font: 500 1.4rem Roboto, Arial, sans-serif; opacity: 0;" +
            " transition: opacity 250ms; pointer-events: none; }" +
            ".farotv-skip-notice.show { opacity: 1; }" +
            ".farotv-skip-notice b { color: #FFB43A; font-weight: 500; }");
        document.adoptedStyleSheets = document.adoptedStyleSheets.concat([sheet]);
    } catch (e) {}

    var notice = null;
    var noticeTimer = null;
    function showNotice(label) {
        if (!document.body) return;
        if (!notice) {
            notice = document.createElement("div");
            notice.className = "farotv-skip-notice";
        }
        if (!notice.parentNode) document.body.appendChild(notice);
        notice.textContent = "";
        notice.appendChild(document.createTextNode("Se omitió: "));
        var b = document.createElement("b");
        b.textContent = label;
        notice.appendChild(b);
        notice.className = "farotv-skip-notice show";
        clearTimeout(noticeTimer);
        noticeTimer = setTimeout(function () { notice.className = "farotv-skip-notice"; }, 2500);
    }

    // ---- skipping -----------------------------------------------------------------------------
    setInterval(function () {
        var id = feature.enabled() ? currentVideoId() : null;
        if (id !== videoId) {
            videoId = id;
            segments = [];
            if (id) load(id);
        }
        if (!segments.length) return;
        var video = document.querySelector("video");
        if (!video || video.paused || !isFinite(video.duration)) return;
        var t = video.currentTime;
        for (var i = 0; i < segments.length; i++) {
            var s = segments[i];
            if (t >= s.start && t < s.end - 0.5) {
                // Once per segment: if the user goes back into it, let it play.
                if (s.skipped) continue;
                s.skipped = true;
                video.currentTime = Math.min(s.end, video.duration - 0.1);
                showNotice(s.label);
                youtv.report("sponsorblock: skipped " + s.label + " " + s.start.toFixed(1) + "-" + s.end.toFixed(1));
                return;
            }
        }
    }, 400);
})();
