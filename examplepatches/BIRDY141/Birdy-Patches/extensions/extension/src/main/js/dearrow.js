// DeArrow: replaces clickbait YouTube titles and thumbnails with community-submitted
// alternatives from https://sponsor.ajay.app/api/branding and https://dearrow-thumb.ajay.app.
// Supports optional title/thumbnail DeArrow icons and automatic title cleanup.
(function () {
    if (!window.youtv || !youtv.request) return;

    var feature = youtv.feature({
        id: "dearrow",
        nameKey: "feature.dearrow.name",
        summaryKey: "feature.dearrow.summary",
        defaultEnabled: true,
        settings: [
            { key: "titles", titleKey: "dearrow.titles.title", summaryKey: "dearrow.titles.summary", default: true },
            { key: "thumbnails", titleKey: "dearrow.thumbnails.title", summaryKey: "dearrow.thumbnails.summary", default: true },
            { key: "show_title_icon", titleKey: "dearrow.show_title_icon.title", summaryKey: "dearrow.show_title_icon.summary", default: true },
            { key: "show_thumb_icon", titleKey: "dearrow.show_thumb_icon.title", summaryKey: "dearrow.show_thumb_icon.summary", default: true },
            { key: "cleanup_titles", titleKey: "dearrow.cleanup_titles.title", summaryKey: "dearrow.cleanup_titles.summary", default: false }
        ],
        onResponse: onApiResponse
    });
    if (!feature) return;

    // ---- Styles for DeArrow thumbnail badge ---------------------------------------------------
    try {
        if (typeof CSSStyleSheet !== "undefined" && document && document.adoptedStyleSheets) {
            var sheet = new CSSStyleSheet();
            sheet.replaceSync(
                ".birdy-da-thumb-badge {" +
                " position: absolute; top: 8px; left: 8px; z-index: 5; pointer-events: none;" +
                " display: flex; align-items: center; justify-content: center;" +
                " width: 22px; height: 22px; border-radius: 6px;" +
                " background: rgba(0, 0, 0, 0.78); border: 1px solid rgba(255, 255, 255, 0.25);" +
                " box-shadow: 0 2px 6px rgba(0, 0, 0, 0.5); }" +
                ".birdy-da-thumb-badge svg { width: 14px; height: 14px; }"
            );
            document.adoptedStyleSheets = document.adoptedStyleSheets.concat([sheet]);
        }
    } catch (e) {}

    // ---- Title Cleanup ------------------------------------------------------------------------
    var ACRONYMS = {
        TV: 1, HD: 1, FHD: 1, UHD: 1, "4K": 1, "8K": 1, PC: 1, PS4: 1, PS5: 1,
        AI: 1, VR: 1, AR: 1, USA: 1, UK: 1, EU: 1, FPS: 1, DLC: 1, RPG: 1,
        GTA: 1, NBA: 1, NFL: 1, UFC: 1, F1: 1, RTX: 1, CPU: 1, GPU: 1, RAM: 1,
        SSD: 1, USB: 1, DIY: 1, ASMR: 1, POV: 1, OST: 1, MV: 1, IOS: 1, OS: 1,
        LED: 1, OLED: 1, AMOLED: 1, HDR: 1, HDMI: 1, NASA: 1, FBI: 1, CIA: 1
    };

    var SMALL_WORDS = {
        a: 1, an: 1, and: 1, as: 1, at: 1, but: 1, by: 1, for: 1, from: 1,
        in: 1, into: 1, nor: 1, of: 1, on: 1, or: 1, over: 1, the: 1, to: 1,
        vs: 1, with: 1
    };

    function cleanUpTitle(raw) {
        if (!raw || typeof raw !== "string") return raw;
        var s = raw.replace(/\s+/g, " ").trim();
        // Collapse repeated ! or ? spam (e.g. "!!!" -> "!", "?!?" -> "?")
        s = s.replace(/!{2,}/g, "!").replace(/\?{2,}/g, "?").replace(/([!?])\1+/g, "$1");
        // Count uppercase vs lowercase letters
        var letters = s.match(/[A-Za-z]/g);
        if (!letters || letters.length < 4) return s;
        var upper = 0;
        for (var i = 0; i < letters.length; i++) {
            if (letters[i] >= "A" && letters[i] <= "Z") upper++;
        }
        var mostlyUpper = (upper / letters.length) > 0.55;
        var words = s.split(" ");
        var changed = false;
        for (var w = 0; w < words.length; w++) {
            var word = words[w];
            var bare = word.replace(/^[^A-Za-z0-9]+|[^A-Za-z0-9]+$/g, "");
            if (!bare) continue;
            if (ACRONYMS[bare.toUpperCase()]) continue;
            var isAllUpper = bare.length >= 2 && bare === bare.toUpperCase() && /[A-Z]/.test(bare);
            if (mostlyUpper || (isAllUpper && bare.length >= 4)) {
                changed = true;
                var lower = word.toLowerCase();
                if (w > 0 && w < words.length - 1 && SMALL_WORDS[bare.toLowerCase()]) {
                    words[w] = lower;
                } else {
                    words[w] = lower.replace(/[a-z]/, function (c) { return c.toUpperCase(); });
                }
            }
        }
        return changed ? words.join(" ") : s;
    }

    // ---- Branding Cache & Queue ---------------------------------------------------------------
    var CACHE_TTL = 10 * 60 * 1000;
    var MAX_CACHE = 200;
    var MAX_CONCURRENT = 5;

    var brandingCache = new Map(); // videoId -> { time, title, thumbUrl }
    var inFlight = new Map();      // videoId -> [callbacks]
    var thumbDataCache = new Map(); // thumbUrl -> { time, dataUrl }
    var thumbInFlight = new Map();  // thumbUrl -> [callbacks]
    var MAX_THUMB_CACHE = 80;
    var queue = [];
    var activeRequests = 0;

    var appliedThumbs = new Map(); // videoId -> thumbUrl
    var appliedTitles = new Map(); // videoId -> title

    function parseBranding(videoId, body) {
        var data;
        try { data = youtv.rawParse(body); } catch (e) { return null; }
        if (!data || typeof data !== "object") return null;

        var title = null;
        if (Array.isArray(data.titles) && data.titles.length > 0) {
            for (var i = 0; i < data.titles.length; i++) {
                var t = data.titles[i];
                if (t && !t.original && typeof t.title === "string" && t.title.trim()) {
                    if (typeof t.votes !== "number" || t.votes >= 0) {
                        title = t.title.trim();
                        break;
                    }
                }
            }
        }

        var thumbUrl = null;
        if (Array.isArray(data.thumbnails) && data.thumbnails.length > 0) {
            for (var j = 0; j < data.thumbnails.length; j++) {
                var th = data.thumbnails[j];
                if (th && !th.original && typeof th.timestamp === "number" && isFinite(th.timestamp)) {
                    if (typeof th.votes !== "number" || th.votes >= 0) {
                        thumbUrl = "https://dearrow-thumb.ajay.app/api/v1/getThumbnail?videoID=" +
                            videoId + "&time=" + th.timestamp;
                        break;
                    }
                }
            }
        }

        return { time: Date.now(), title: title, thumbUrl: thumbUrl };
    }

    function pumpQueue() {
        while (activeRequests < MAX_CONCURRENT && queue.length > 0) {
            var videoId = queue.shift();
            startFetch(videoId);
        }
    }

    function startFetch(videoId) {
        activeRequests++;
        var url = "https://sponsor.ajay.app/api/branding?videoID=" + videoId;
        youtv.request(url, function (status, body) {
            activeRequests = Math.max(0, activeRequests - 1);
            var entry = null;
            if (status === 200) {
                entry = parseBranding(videoId, body);
            } else if (status === 404) {
                entry = { time: Date.now(), title: null, thumbUrl: null };
            }
            if (entry) {
                if (!brandingCache.has(videoId) && brandingCache.size >= MAX_CACHE) {
                    brandingCache.delete(brandingCache.keys().next().value);
                }
                brandingCache.set(videoId, entry);
            }
            var cbs = inFlight.get(videoId) || [];
            inFlight.delete(videoId);
            for (var i = 0; i < cbs.length; i++) {
                try { cbs[i](entry); } catch (e) {}
            }
            pumpQueue();
        });
    }

    function fetchBranding(videoId, callback) {
        var cached = brandingCache.get(videoId);
        if (cached && (Date.now() - cached.time) < CACHE_TTL) {
            callback(cached);
            return;
        }
        if (cached) brandingCache.delete(videoId);

        if (inFlight.has(videoId)) {
            inFlight.get(videoId).push(callback);
            return;
        }
        inFlight.set(videoId, [callback]);
        queue.push(videoId);
        pumpQueue();
    }

    // ---- Applying Title / Thumbnail to JSON Renderers -----------------------------------------
    function setTitleText(titleObj, newText) {
        if (!titleObj || typeof titleObj !== "object" || !newText) return;
        if (typeof titleObj.simpleText === "string") {
            titleObj.simpleText = newText;
        }
        if (Array.isArray(titleObj.runs) && titleObj.runs.length > 0) {
            titleObj.runs[0].text = newText;
            if (titleObj.runs.length > 1) titleObj.runs.length = 1;
        }
    }

    function getTitleText(titleObj) {
        if (!titleObj || typeof titleObj !== "object") return "";
        if (typeof titleObj.simpleText === "string") return titleObj.simpleText;
        if (Array.isArray(titleObj.runs)) {
            var out = "";
            for (var i = 0; i < titleObj.runs.length; i++) {
                if (titleObj.runs[i] && typeof titleObj.runs[i].text === "string") {
                    out += titleObj.runs[i].text;
                }
            }
            return out;
        }
        return "";
    }

    function applyToTarget(target, entry) {
        var useTitles = feature.settings.get("titles") !== false;
        var useThumbs = feature.settings.get("thumbnails") !== false;
        var showTitleIcon = feature.settings.get("show_title_icon") !== false;
        var doCleanup = feature.settings.get("cleanup_titles") === true;

        if (useTitles && entry && entry.title) {
            var finalTitle = doCleanup ? cleanUpTitle(entry.title) : entry.title;
            var displayTitle = showTitleIcon ? ("\u25B8 " + finalTitle) : finalTitle;
            if (target.titleObj) setTitleText(target.titleObj, displayTitle);
            if (target.videoDetails && typeof target.videoDetails.title === "string") {
                target.videoDetails.title = displayTitle;
            }
            appliedTitles.set(target.videoId, displayTitle);
        } else if (doCleanup) {
            if (target.titleObj) {
                var orig = getTitleText(target.titleObj);
                var cleaned = cleanUpTitle(orig);
                if (cleaned && cleaned !== orig) setTitleText(target.titleObj, cleaned);
            }
            if (target.videoDetails && typeof target.videoDetails.title === "string") {
                target.videoDetails.title = cleanUpTitle(target.videoDetails.title);
            }
        }

        if (useThumbs && entry && entry.thumbUrl) {
            fetchThumbDataUrl(entry.thumbUrl, function (dataUrl) {
                if (!dataUrl) return;
                if (target.thumbObj && Array.isArray(target.thumbObj.thumbnails)) {
                    target.thumbObj.thumbnails = [
                        { url: dataUrl, width: 1280, height: 720 }
                    ];
                }
                appliedThumbs.set(target.videoId, dataUrl);
                syncDomThumbnails();
            });
        }
    }

    function fetchThumbDataUrl(thumbUrl, callback) {
        var cached = thumbDataCache.get(thumbUrl);
        if (cached && (Date.now() - cached.time) < CACHE_TTL) {
            callback(cached.dataUrl);
            return;
        }
        if (cached) thumbDataCache.delete(thumbUrl);

        if (thumbInFlight.has(thumbUrl)) {
            thumbInFlight.get(thumbUrl).push(callback);
            return;
        }
        thumbInFlight.set(thumbUrl, [callback]);
        youtv.request(thumbUrl, function (status, body) {
            var dataUrl = (status === 200 && typeof body === "string" && body.indexOf("data:image/") === 0) ? body : null;
            if (dataUrl) {
                if (!thumbDataCache.has(thumbUrl) && thumbDataCache.size >= MAX_THUMB_CACHE) {
                    thumbDataCache.delete(thumbDataCache.keys().next().value);
                }
                thumbDataCache.set(thumbUrl, { time: Date.now(), dataUrl: dataUrl });
            }
            var cbs = thumbInFlight.get(thumbUrl) || [];
            thumbInFlight.delete(thumbUrl);
            for (var i = 0; i < cbs.length; i++) {
                try { cbs[i](dataUrl); } catch (e) {}
            }
        });
    }

    function collectTargets(node, depth, out) {
        if (!node || typeof node !== "object" || depth > 25) return out;
        if (Array.isArray(node)) {
            for (var i = 0; i < node.length; i++) collectTargets(node[i], depth + 1, out);
            return out;
        }

        if (node.tileRenderer && typeof node.tileRenderer.contentId === "string") {
            var tr = node.tileRenderer;
            if (/^[A-Za-z0-9_-]{11}$/.test(tr.contentId)) {
                var meta = tr.metadata && tr.metadata.tileMetadataRenderer;
                var hdr = tr.header && tr.header.tileHeaderRenderer;
                out.push({
                    videoId: tr.contentId,
                    titleObj: meta && meta.title,
                    thumbObj: hdr && hdr.thumbnail
                });
            }
        }

        var keys = ["gridVideoRenderer", "videoRenderer", "compactVideoRenderer", "playlistVideoRenderer"];
        for (var k = 0; k < keys.length; k++) {
            var vr = node[keys[k]];
            if (vr && typeof vr.videoId === "string" && /^[A-Za-z0-9_-]{11}$/.test(vr.videoId)) {
                out.push({
                    videoId: vr.videoId,
                    titleObj: vr.title,
                    thumbObj: vr.thumbnail
                });
            }
        }

        if (node.videoDetails && typeof node.videoDetails.videoId === "string" && /^[A-Za-z0-9_-]{11}$/.test(node.videoDetails.videoId)) {
            out.push({
                videoId: node.videoDetails.videoId,
                videoDetails: node.videoDetails,
                thumbObj: node.videoDetails.thumbnail
            });
        }

        for (var prop in node) {
            if (Object.prototype.hasOwnProperty.call(node, prop)) {
                var val = node[prop];
                if (val && typeof val === "object") collectTargets(val, depth + 1, out);
            }
        }
        return out;
    }

    function onApiResponse(response, settings, text) {
        if (!feature.enabled()) return;
        if (!youtv.mentions(text, ["tileRenderer", "gridVideoRenderer", "videoRenderer", "compactVideoRenderer", "videoDetails"])) return;

        var targets = collectTargets(response, 0, []);
        if (!targets.length) return;

        var doCleanup = feature.settings.get("cleanup_titles") === true;
        var needBranding = feature.settings.get("titles") !== false || feature.settings.get("thumbnails") !== false;

        for (var i = 0; i < targets.length; i++) {
            (function (target) {
                if (doCleanup) applyToTarget(target, null);
                if (!needBranding) return;
                fetchBranding(target.videoId, function (entry) {
                    if (entry && (entry.title || entry.thumbUrl)) {
                        applyToTarget(target, entry);
                    }
                });
            })(targets[i]);
        }
    }

    // ---- DOM Sync for Thumbnail Replacement & DeArrow Thumbnail Badge -------------------------
    function createDeArrowBadge() {
        var badge = document.createElement("div");
        badge.className = "birdy-da-thumb-badge";
        if (typeof document.createElementNS === "function") {
            var svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
            svg.setAttribute("viewBox", "0 0 24 24");
            svg.setAttribute("fill", "none");
            svg.setAttribute("stroke", "#3ea6ff");
            svg.setAttribute("stroke-width", "2.4");
            svg.setAttribute("stroke-linecap", "round");
            svg.setAttribute("stroke-linejoin", "round");
            var p = document.createElementNS("http://www.w3.org/2000/svg", "path");
            p.setAttribute("d", "M5 12h14m-6-6 6 6-6 6");
            svg.appendChild(p);
            badge.appendChild(svg);
        }
        return badge;
    }

    function attachThumbBadge(container) {
        if (!container || container.querySelector(".birdy-da-thumb-badge")) return;
        try {
            if (container.style && (!container.style.position || container.style.position === "static")) {
                container.style.position = "relative";
            }
            container.appendChild(createDeArrowBadge());
        } catch (e) {}
    }

    function syncDomThumbnails() {
        if (!feature.enabled() || typeof document === "undefined" || !document.querySelectorAll) return;
        var useThumbs = feature.settings.get("thumbnails") !== false;
        var showThumbIcon = feature.settings.get("show_thumb_icon") !== false;
        if (!useThumbs || !appliedThumbs.size) return;

        var imgs = document.querySelectorAll("img[src*='/vi/'], img[data-birdy-da-vid]");
        for (var i = 0; i < imgs.length; i++) {
            var img = imgs[i];
            var vid = img.getAttribute("data-birdy-da-vid");
            if (!vid) {
                var src = img.getAttribute("src") || "";
                var m = /\/vi\/([A-Za-z0-9_-]{11})\//.exec(src);
                if (!m) continue;
                vid = m[1];
            }
            var dataUrl = appliedThumbs.get(vid);
            if (!dataUrl) continue;

            if (img.getAttribute("src") !== dataUrl) {
                img.setAttribute("src", dataUrl);
                img.setAttribute("data-birdy-da-vid", vid);
            }
            if (showThumbIcon && img.parentElement) attachThumbBadge(img.parentElement);
        }

        var bgEls = document.querySelectorAll("[style*='/vi/'], [data-birdy-da-bg-vid]");
        for (var j = 0; j < bgEls.length; j++) {
            var el = bgEls[j];
            var bgVid = el.getAttribute("data-birdy-da-bg-vid");
            if (!bgVid) {
                var bg = (el.style && el.style.backgroundImage) || el.getAttribute("style") || "";
                var bm = /\/vi\/([A-Za-z0-9_-]{11})\//.exec(bg);
                if (!bm) continue;
                bgVid = bm[1];
            }
            var bgDataUrl = appliedThumbs.get(bgVid);
            if (!bgDataUrl) continue;

            if (!el.getAttribute("data-birdy-da-bg-vid")) {
                el.style.backgroundImage = 'url("' + bgDataUrl + '")';
                el.setAttribute("data-birdy-da-bg-vid", bgVid);
            }
            if (showThumbIcon) attachThumbBadge(el);
        }
    }

    if (typeof setInterval === "function") {
        setInterval(syncDomThumbnails, 800);
    }
})();
