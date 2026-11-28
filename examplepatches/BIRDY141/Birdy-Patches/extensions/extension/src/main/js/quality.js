// Quality & Playback Tweaks: forces playback resolution, default caption language,
// expanded auto-translate languages, original titles, and original audio (no auto-dub)
// independently for regular videos and YouTube Shorts.
(function () {
    if (!window.youtv) return;

    var STORAGE_PREFIX = "yt.leanback.default::";
    var VIDEO_QUALITY_KEY = "YOUTV_QUALITY_VIDEO";
    var SHORTS_QUALITY_KEY = "YOUTV_QUALITY_SHORTS";
    var VIDEO_CAPTION_KEY = "YOUTV_VIDEO_CAPTION_LANG";
    var SHORTS_CAPTION_KEY = "YOUTV_SHORTS_CAPTION_LANG";
    var VIDEO_MORE_TRANS_KEY = "YOUTV_VIDEO_MORE_AUTO_TRANSLATE";
    var SHORTS_MORE_TRANS_KEY = "YOUTV_SHORTS_MORE_AUTO_TRANSLATE";
    var VIDEO_ORIG_TITLE_KEY = "YOUTV_VIDEO_ORIGINAL_TITLE";
    var SHORTS_ORIG_TITLE_KEY = "YOUTV_SHORTS_ORIGINAL_TITLE";
    var VIDEO_ORIG_AUDIO_KEY = "YOUTV_VIDEO_ORIGINAL_AUDIO";
    var SHORTS_ORIG_AUDIO_KEY = "YOUTV_SHORTS_ORIGINAL_AUDIO";
    var VIDEO_SPEED_KEY = "YOUTV_VIDEO_SPEED";
    var SHORTS_SPEED_KEY = "YOUTV_SHORTS_SPEED";
    var VIDEO_CUSTOM_SPEED_KEY = "YOUTV_VIDEO_CUSTOM_SPEED";
    var SHORTS_CUSTOM_SPEED_KEY = "YOUTV_SHORTS_CUSTOM_SPEED";
    var VIDEO_PIP_KEY = "YOUTV_VIDEO_PIP";

    var SPEED_RATES = [0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 3, 3.5, 4];

    var QUALITY_ORDER = ["highres", "hd2160", "hd1440", "hd1080", "hd720", "large", "medium", "small", "tiny"];

    var TRANSLATION_LANGUAGES = [
        { code: "en", name: "English" },
        { code: "ar", name: "Arabic" },
        { code: "es", name: "Spanish" },
        { code: "fr", name: "French" },
        { code: "de", name: "German" },
        { code: "it", name: "Italian" },
        { code: "pt", name: "Portuguese" },
        { code: "ru", name: "Russian" },
        { code: "ja", name: "Japanese" },
        { code: "ko", name: "Korean" },
        { code: "zh-Hans", name: "Chinese (Simplified)" },
        { code: "zh-Hant", name: "Chinese (Traditional)" },
        { code: "hi", name: "Hindi" },
        { code: "tr", name: "Turkish" },
        { code: "nl", name: "Dutch" },
        { code: "pl", name: "Polish" },
        { code: "sv", name: "Swedish" },
        { code: "id", name: "Indonesian" },
        { code: "vi", name: "Vietnamese" },
        { code: "th", name: "Thai" },
        { code: "uk", name: "Ukrainian" },
        { code: "he", name: "Hebrew" },
        { code: "fa", name: "Persian" },
        { code: "ur", name: "Urdu" },
        { code: "bn", name: "Bengali" }
    ];

    var shortsVideoIds = new Set();
    var MAX_SHORTS_IDS = 200;

    function rememberShortId(id) {
        if (!id || typeof id !== "string" || !/^[A-Za-z0-9_-]{11}$/.test(id)) return;
        if (!shortsVideoIds.has(id) && shortsVideoIds.size >= MAX_SHORTS_IDS) {
            shortsVideoIds.delete(shortsVideoIds.values().next().value);
        }
        shortsVideoIds.add(id);
    }

    function collectShortsIds(node, depth) {
        if (!node || typeof node !== "object" || depth > 18) return;
        if (Array.isArray(node)) {
            for (var i = 0; i < node.length; i++) collectShortsIds(node[i], depth + 1);
            return;
        }
        if (node.reelWatchEndpoint && typeof node.reelWatchEndpoint.videoId === "string") {
            rememberShortId(node.reelWatchEndpoint.videoId);
        }
        if (node.videoDetails && node.videoDetails.isShortsEligible && typeof node.videoDetails.videoId === "string") {
            rememberShortId(node.videoDetails.videoId);
        }
        for (var k in node) {
            if (Object.prototype.hasOwnProperty.call(node, k)) {
                var v = node[k];
                if (v && typeof v === "object") collectShortsIds(v, depth + 1);
            }
        }
    }

    var decodedCache = Object.create(null);

    function getDecodedSetting(key) {
        try {
            var raw = localStorage.getItem(STORAGE_PREFIX + key);
            var entry = decodedCache[key];
            if (!entry || entry.raw !== raw) {
                var val;
                if (raw !== null) {
                    try { val = youtv.rawParse(raw); } catch (e) {}
                }
                entry = decodedCache[key] = { raw: raw, val: val };
            }
            return entry.val;
        } catch (e) {}
        return undefined;
    }

    function getStringSetting(key, def) {
        var parsed = getDecodedSetting(key);
        if (typeof parsed === "string") return parsed;
        if (parsed && typeof parsed.data === "string") return parsed.data;
        return def;
    }

    function getBoolSetting(key, def) {
        var parsed = getDecodedSetting(key);
        if (parsed && typeof parsed.data === "boolean") return parsed.data;
        return !!def;
    }

    // ---- Original Audio (anti auto-dub) in InnerTube /player ----------------------------------
    function isOriginalAudioTrackObj(at) {
        if (!at || typeof at !== "object") return false;
        if (typeof at.id === "string" && /\.4$/.test(at.id)) return true;
        if (typeof at.displayName === "string" && /original|الأصل|orig/i.test(at.displayName)) return true;
        return false;
    }

    function applyOriginalAudioToResponse(response) {
        var sd = response && response.streamingData;
        if (!sd || !Array.isArray(sd.adaptiveFormats)) return;
        var origIds = {};
        var hasOrig = false;
        for (var i = 0; i < sd.adaptiveFormats.length; i++) {
            var fmt = sd.adaptiveFormats[i];
            if (fmt && fmt.audioTrack && isOriginalAudioTrackObj(fmt.audioTrack)) {
                if (fmt.audioTrack.id) origIds[fmt.audioTrack.id] = true;
                hasOrig = true;
            }
        }
        if (!hasOrig) return;

        var filtered = [];
        for (var j = 0; j < sd.adaptiveFormats.length; j++) {
            var f = sd.adaptiveFormats[j];
            if (f && f.audioTrack) {
                if (origIds[f.audioTrack.id] || isOriginalAudioTrackObj(f.audioTrack)) {
                    f.audioTrack.audioIsDefault = true;
                    filtered.push(f);
                }
                // Drop auto-dubbed tracks when original audio track is present
            } else {
                filtered.push(f);
            }
        }
        if (filtered.length > 0) {
            sd.adaptiveFormats = filtered;
            youtv.report("quality: forced original audio track in player response");
        }
    }

    // ---- Captions & Auto-Translate in InnerTube /player ---------------------------------------
    function langMatches(trackLang, targetLang) {
        if (!trackLang || !targetLang) return false;
        var a = trackLang.toLowerCase();
        var b = targetLang.toLowerCase();
        return a === b || a.indexOf(b + "-") === 0 || b.indexOf(a + "-") === 0;
    }

    function findLangName(code) {
        for (var i = 0; i < TRANSLATION_LANGUAGES.length; i++) {
            if (TRANSLATION_LANGUAGES[i].code === code) return TRANSLATION_LANGUAGES[i].name;
        }
        return code;
    }

    function applyCaptionsToResponse(response, captionLang, moreAutoTranslate) {
        var cap = response && response.captions && response.captions.playerCaptionsTracklistRenderer;
        if (!cap || !Array.isArray(cap.captionTracks) || !cap.captionTracks.length) return;

        if (moreAutoTranslate) {
            for (var i = 0; i < cap.captionTracks.length; i++) {
                if (cap.captionTracks[i]) cap.captionTracks[i].isTranslatable = true;
            }
            var existing = Array.isArray(cap.translationLanguages) ? cap.translationLanguages : [];
            var seen = {};
            for (var e = 0; e < existing.length; e++) {
                if (existing[e] && existing[e].languageCode) seen[existing[e].languageCode] = true;
            }
            for (var l = 0; l < TRANSLATION_LANGUAGES.length; l++) {
                var tl = TRANSLATION_LANGUAGES[l];
                if (!seen[tl.code]) {
                    existing.push({
                        languageCode: tl.code,
                        languageName: { runs: [{ text: tl.name }] }
                    });
                    seen[tl.code] = true;
                }
            }
            cap.translationLanguages = existing;
        }

        if (!captionLang || captionLang === "auto") return;

        var chosenIdx = -1;
        if (captionLang === "video") {
            // Prefer non-ASR track, else first track
            for (var v = 0; v < cap.captionTracks.length; v++) {
                if (cap.captionTracks[v] && cap.captionTracks[v].kind !== "asr") {
                    chosenIdx = v;
                    break;
                }
            }
            if (chosenIdx === -1) chosenIdx = 0;
        } else {
            // Exact native track (prefer non-ASR)
            for (var n = 0; n < cap.captionTracks.length; n++) {
                var tr = cap.captionTracks[n];
                if (tr && langMatches(tr.languageCode, captionLang)) {
                    if (chosenIdx === -1 || tr.kind !== "asr") chosenIdx = n;
                    if (tr.kind !== "asr") break;
                }
            }
            // If no native track exists, synthesize an auto-translated track via &tlang=
            if (chosenIdx === -1) {
                var base = cap.captionTracks[0];
                if (base && base.baseUrl) {
                    var sep = base.baseUrl.indexOf("?") !== -1 ? "&" : "?";
                    var transTrack = {
                        baseUrl: base.baseUrl + sep + "tlang=" + encodeURIComponent(captionLang),
                        name: { runs: [{ text: findLangName(captionLang) + " (Auto)" }] },
                        vssId: "." + captionLang + ".tlang",
                        languageCode: captionLang,
                        isTranslatable: false
                    };
                    cap.captionTracks.push(transTrack);
                    chosenIdx = cap.captionTracks.length - 1;
                }
            }
        }

        if (chosenIdx >= 0 && Array.isArray(cap.audioTracks)) {
            for (var a = 0; a < cap.audioTracks.length; a++) {
                var at = cap.audioTracks[a];
                if (at) {
                    if (Array.isArray(at.captionTrackIndices) && at.captionTrackIndices.indexOf(chosenIdx) === -1) {
                        at.captionTrackIndices.push(chosenIdx);
                    }
                    at.defaultCaptionTrackIndex = chosenIdx;
                    at.captionsInitialState = "CAPTIONS_INITIAL_STATE_ON_REQUIRED";
                    at.visibility = "ON";
                }
            }
            youtv.report("captions: response forced lang=" + captionLang + " idx=" + chosenIdx);
        }
    }

    // ---- Original Video Titles (via same-origin /oembed) --------------------------------------
    var oembedCache = new Map();
    var oembedInFlight = new Map();
    var oembedQueue = [];
    var oembedActive = 0;
    var MAX_OEMBED_CACHE = 200;
    var MAX_OEMBED_CONCURRENT = 4;

    function pumpOembed() {
        while (oembedActive < MAX_OEMBED_CONCURRENT && oembedQueue.length > 0) {
            var vid = oembedQueue.shift();
            startOembedFetch(vid);
        }
    }

    function startOembedFetch(vid) {
        oembedActive++;
        var url = "https://www.youtube.com/oembed?url=" + encodeURIComponent("https://www.youtube.com/watch?v=" + vid) + "&format=json";
        if (typeof fetch !== "function") {
            oembedActive = Math.max(0, oembedActive - 1);
            oembedInFlight.delete(vid);
            return;
        }
        fetch(url, { credentials: "omit" })
            .then(function (res) { return res && res.ok ? res.json() : null; })
            .then(function (data) {
                var title = data && typeof data.title === "string" ? data.title : null;
                if (title) {
                    if (!oembedCache.has(vid) && oembedCache.size >= MAX_OEMBED_CACHE) {
                        oembedCache.delete(oembedCache.keys().next().value);
                    }
                    oembedCache.set(vid, title);
                }
                finishOembed(vid, title);
            })
            .catch(function () { finishOembed(vid, null); });
    }

    function finishOembed(vid, title) {
        oembedActive = Math.max(0, oembedActive - 1);
        var cbs = oembedInFlight.get(vid) || [];
        oembedInFlight.delete(vid);
        for (var i = 0; i < cbs.length; i++) {
            try { cbs[i](title); } catch (e) {}
        }
        pumpOembed();
    }

    function fetchOriginalTitle(vid, cb) {
        if (oembedCache.has(vid)) {
            cb(oembedCache.get(vid));
            return;
        }
        if (oembedInFlight.has(vid)) {
            oembedInFlight.get(vid).push(cb);
            return;
        }
        oembedInFlight.set(vid, [cb]);
        oembedQueue.push(vid);
        pumpOembed();
    }

    function setTitleObj(titleObj, newText) {
        if (!titleObj || typeof titleObj !== "object" || !newText) return;
        if (typeof titleObj.simpleText === "string") titleObj.simpleText = newText;
        if (Array.isArray(titleObj.runs) && titleObj.runs.length > 0) {
            titleObj.runs[0].text = newText;
            if (titleObj.runs.length > 1) titleObj.runs.length = 1;
        }
    }

    function collectTitleTargets(node, depth, inShortsContext, out) {
        if (!node || typeof node !== "object" || depth > 22) return out;
        if (Array.isArray(node)) {
            for (var i = 0; i < node.length; i++) collectTitleTargets(node[i], depth + 1, inShortsContext, out);
            return out;
        }

        var nextShorts = inShortsContext ||
            !!(node.shelfRenderer && node.shelfRenderer.tvhtml5ShelfRendererType === "TVHTML5_SHELF_RENDERER_TYPE_SHORTS") ||
            !!node.reelWatchEndpoint ||
            !!node.reelPlayerOverlayRenderer ||
            !!node.shortsLockupViewModel;

        if (node.tileRenderer && typeof node.tileRenderer.contentId === "string" && /^[A-Za-z0-9_-]{11}$/.test(node.tileRenderer.contentId)) {
            var meta = node.tileRenderer.metadata && node.tileRenderer.metadata.tileMetadataRenderer;
            var isShortTile = nextShorts || !!(node.tileRenderer.onSelectCommand && node.tileRenderer.onSelectCommand.reelWatchEndpoint);
            if (meta && meta.title) {
                out.push({ videoId: node.tileRenderer.contentId, titleObj: meta.title, isShort: isShortTile });
            }
        }

        var keys = ["gridVideoRenderer", "videoRenderer", "compactVideoRenderer", "playlistVideoRenderer"];
        for (var k = 0; k < keys.length; k++) {
            var vr = node[keys[k]];
            if (vr && typeof vr.videoId === "string" && /^[A-Za-z0-9_-]{11}$/.test(vr.videoId) && vr.title) {
                out.push({ videoId: vr.videoId, titleObj: vr.title, isShort: nextShorts });
            }
        }

        if (node.videoDetails && typeof node.videoDetails.videoId === "string" && /^[A-Za-z0-9_-]{11}$/.test(node.videoDetails.videoId)) {
            out.push({
                videoId: node.videoDetails.videoId,
                videoDetails: node.videoDetails,
                isShort: nextShorts || !!node.videoDetails.isShortsEligible
            });
        }

        for (var prop in node) {
            if (Object.prototype.hasOwnProperty.call(node, prop)) {
                var val = node[prop];
                if (val && typeof val === "object") collectTitleTargets(val, depth + 1, nextShorts, out);
            }
        }
        return out;
    }

    var inOnApiResponse = false;

    function onApiResponse(response, settings, text) {
        if (inOnApiResponse) return;
        inOnApiResponse = true;
        try {
            if (youtv.mentions(text, ["reelWatchEndpoint", "isShortsEligible", "reelPlayerOverlayRenderer"])) {
                collectShortsIds(response, 0);
            }

            var isShortResp = !!(
                (response.videoDetails && response.videoDetails.isShortsEligible) ||
                (response.videoDetails && shortsVideoIds.has(response.videoDetails.videoId)) ||
                (response.microformat && response.microformat.playerMicroformatRenderer &&
                    typeof response.microformat.playerMicroformatRenderer.canonicalUrl === "string" &&
                    response.microformat.playerMicroformatRenderer.canonicalUrl.indexOf("/shorts/") !== -1)
            );

            // 1. Original Audio in /player
            var origAudio = getBoolSetting(isShortResp ? SHORTS_ORIG_AUDIO_KEY : VIDEO_ORIG_AUDIO_KEY, false);
            if (origAudio && response.streamingData) {
                applyOriginalAudioToResponse(response);
            }

            // 1b. Unlock playback speed in playerConfig if restricted
            if (response.playerConfig) {
                if (!response.playerConfig.playbackSpeedConfig) {
                    response.playerConfig.playbackSpeedConfig = {};
                }
                response.playerConfig.playbackSpeedConfig.enabled = true;
                response.playerConfig.playbackSpeedConfig.availableRates = SPEED_RATES.slice();
            }

            // 2. Captions & More Auto-Translate in /player
            var captionLang = getStringSetting(isShortResp ? SHORTS_CAPTION_KEY : VIDEO_CAPTION_KEY, "auto");
            var moreTrans = getBoolSetting(isShortResp ? SHORTS_MORE_TRANS_KEY : VIDEO_MORE_TRANS_KEY, false);
            if ((captionLang !== "auto" || moreTrans) && response.captions) {
                applyCaptionsToResponse(response, captionLang, moreTrans);
            }

            // 3. Original Titles
            var wantVideoOrigTitle = getBoolSetting(VIDEO_ORIG_TITLE_KEY, false);
            var wantShortsOrigTitle = getBoolSetting(SHORTS_ORIG_TITLE_KEY, false);
            if ((wantVideoOrigTitle || wantShortsOrigTitle) &&
                youtv.mentions(text, ["tileRenderer", "gridVideoRenderer", "videoRenderer", "compactVideoRenderer", "videoDetails"])) {
                var targets = collectTitleTargets(response, 0, false, []);
                for (var i = 0; i < targets.length; i++) {
                    (function (target) {
                        var shouldRestore = target.isShort ? wantShortsOrigTitle : wantVideoOrigTitle;
                        if (!shouldRestore) return;
                        fetchOriginalTitle(target.videoId, function (origTitle) {
                            if (!origTitle) return;
                            if (target.titleObj) setTitleObj(target.titleObj, origTitle);
                            if (target.videoDetails && typeof target.videoDetails.title === "string") {
                                target.videoDetails.title = origTitle;
                            }
                        });
                    })(targets[i]);
                }
            }
        } finally {
            inOnApiResponse = false;
        }
    }

    var feature = youtv.feature({
        id: "quality",
        nameKey: "hub.tab.video",
        summaryKey: "video.quality.summary",
        defaultEnabled: true,
        onResponse: onApiResponse
    });
    if (!feature) return;

    // ---- Player Runtime Enforcement (Quality, Captions, Audio) --------------------------------
    function findPlayer() {
        var byId = document.getElementById("movie_player");
        if (byId && (typeof byId.setPlaybackQualityRange === "function" || typeof byId.setPlaybackQuality === "function")) {
            return byId;
        }
        var byClass = document.querySelector(".html5-video-player");
        if (byClass && (typeof byClass.setPlaybackQualityRange === "function" || typeof byClass.setPlaybackQuality === "function")) {
            return byClass;
        }
        var video = document.querySelector("video");
        var node = video;
        while (node && node !== document.documentElement) {
            if (typeof node.setPlaybackQualityRange === "function" || typeof node.setPlaybackQuality === "function") {
                return node;
            }
            node = node.parentElement;
        }
        return null;
    }

    function getVideoId(player) {
        try {
            if (player && typeof player.getVideoData === "function") {
                var data = player.getVideoData();
                if (data && data.video_id) return data.video_id;
            }
        } catch (e) {}
        var match = /[?&#]v=([A-Za-z0-9_-]{11})/.exec(location.hash || location.search || "");
        return match ? match[1] : null;
    }

    function isCurrentShort(player) {
        var href = (location.href || "") + " " + (location.hash || "");
        if (/\/shorts\/|reelWatchEndpoint|isShorts/i.test(href)) return true;
        if (document.querySelector("ytlr-shorts-page, ytlr-reel-player-overlay-renderer, ytlr-reel-video-renderer, ytlr-shorts-player")) {
            return true;
        }
        try {
            if (player && typeof player.getPlayerResponse === "function") {
                var pr = player.getPlayerResponse();
                if (pr && pr.videoDetails && pr.videoDetails.isShortsEligible) return true;
            }
        } catch (e) {}
        var vid = getVideoId(player);
        return !!(vid && shortsVideoIds.has(vid));
    }

    function pickBestQuality(desired, available) {
        if (!desired || desired === "auto") return null;
        if (!Array.isArray(available) || !available.length) return desired;
        var levels = available.filter(function (q) { return q && q !== "auto"; });
        if (!levels.length) return desired;
        if (levels.indexOf(desired) !== -1) return desired;

        var desiredIdx = QUALITY_ORDER.indexOf(desired);
        if (desiredIdx === -1) return levels[0];
        for (var i = desiredIdx; i < QUALITY_ORDER.length; i++) {
            if (levels.indexOf(QUALITY_ORDER[i]) !== -1) return QUALITY_ORDER[i];
        }
        for (var j = QUALITY_ORDER.length - 1; j >= 0; j--) {
            if (levels.indexOf(QUALITY_ORDER[j]) !== -1) return QUALITY_ORDER[j];
        }
        return levels[0];
    }

    var lastAppliedVid = null;
    var lastAppliedTarget = null;
    var lastCaptionVid = null;
    var lastCaptionLang = null;
    var lastAudioVid = null;

    function enforceQuality(player, isShort, vid, forceNow) {
        var desired = getStringSetting(isShort ? SHORTS_QUALITY_KEY : VIDEO_QUALITY_KEY, "auto");
        if (!desired || desired === "auto") {
            if (lastAppliedTarget !== null || forceNow) {
                try {
                    if (typeof player.setPlaybackQualityRange === "function") {
                        player.setPlaybackQualityRange("tiny", "highres");
                    }
                    if (typeof player.setPlaybackQuality === "function") {
                        player.setPlaybackQuality("auto");
                    }
                    localStorage.removeItem("yt-player-quality");
                } catch (e) {}
                lastAppliedTarget = null;
                lastAppliedVid = vid;
            }
            return;
        }

        var avail = typeof player.getAvailableQualityLevels === "function"
            ? player.getAvailableQualityLevels()
            : [];
        var target = pickBestQuality(desired, avail);
        if (!target) return;

        var current = typeof player.getPlaybackQuality === "function"
            ? player.getPlaybackQuality()
            : null;

        if (!forceNow && current === target && lastAppliedVid === vid && lastAppliedTarget === target) {
            return;
        }

        try {
            if (typeof player.setPlaybackQualityRange === "function") {
                player.setPlaybackQualityRange(target, target);
            }
            if (typeof player.setPlaybackQuality === "function") {
                player.setPlaybackQuality(target);
            }
            localStorage.setItem("yt-player-quality", JSON.stringify({
                data: JSON.stringify({ quality: target, previousQuality: target }),
                expiration: Date.now() + 30 * 24 * 60 * 60 * 1000,
                creation: Date.now()
            }));
            if (lastAppliedVid !== vid || lastAppliedTarget !== target) {
                youtv.report("quality: locked " + (isShort ? "shorts" : "video") + " to " + target);
            }
            lastAppliedVid = vid;
            lastAppliedTarget = target;
        } catch (e) {}
    }

    function enforceCaptions(player, isShort, vid, forceNow) {
        var desiredLang = getStringSetting(isShort ? SHORTS_CAPTION_KEY : VIDEO_CAPTION_KEY, "auto");
        if (!desiredLang || desiredLang === "auto") {
            lastCaptionLang = "auto";
            return;
        }
        if (!forceNow && lastCaptionVid === vid && lastCaptionLang === desiredLang) return;

        try {
            if (typeof player.loadModule === "function") player.loadModule("captions");
            var tracklist = (typeof player.getOption === "function") ? player.getOption("captions", "tracklist") : null;
            if (!Array.isArray(tracklist) || !tracklist.length) {
                var pr = (typeof player.getPlayerResponse === "function") ? player.getPlayerResponse() : null;
                var cap = pr && pr.captions && pr.captions.playerCaptionsTracklistRenderer;
                if (cap && Array.isArray(cap.captionTracks)) tracklist = cap.captionTracks;
            }
            if (!Array.isArray(tracklist) || !tracklist.length) return;

            var chosen = null;
            if (desiredLang === "video") {
                var prCap = (typeof player.getPlayerResponse === "function") ? player.getPlayerResponse() : null;
                var capR = prCap && prCap.captions && prCap.captions.playerCaptionsTracklistRenderer;
                if (capR && Array.isArray(capR.audioTracks) && capR.audioTracks.length && Array.isArray(capR.captionTracks)) {
                    var daIdx = typeof capR.defaultAudioTrackIndex === "number" ? capR.defaultAudioTrackIndex : 0;
                    var daTrack = capR.audioTracks[daIdx] || capR.audioTracks[0];
                    if (daTrack && typeof daTrack.defaultCaptionTrackIndex === "number") {
                        var defCap = capR.captionTracks[daTrack.defaultCaptionTrackIndex];
                        if (defCap) chosen = defCap;
                    }
                }
                if (!chosen) {
                    for (var i = 0; i < tracklist.length; i++) {
                        if (tracklist[i] && tracklist[i].kind !== "asr") {
                            chosen = tracklist[i];
                            break;
                        }
                    }
                }
                if (!chosen) chosen = tracklist[0];
            } else {
                for (var j = 0; j < tracklist.length; j++) {
                    var tr = tracklist[j];
                    if (tr && langMatches(tr.languageCode, desiredLang)) {
                        if (!chosen || tr.kind !== "asr") chosen = tr;
                        if (tr.kind !== "asr") break;
                    }
                }
                if (!chosen) {
                    var base = tracklist[0];
                    chosen = {
                        languageCode: base.languageCode,
                        vssId: base.vssId,
                        translationLanguage: {
                            languageCode: desiredLang,
                            languageName: findLangName(desiredLang)
                        }
                    };
                }
            }

            if (chosen) {
                var trackObj = {
                    languageCode: chosen.languageCode
                };
                if (chosen.vssId) trackObj.vssId = chosen.vssId;
                if (chosen.translationLanguage) trackObj.translationLanguage = chosen.translationLanguage;

                if (typeof player.setOption === "function") {
                    player.setOption("captions", "track", trackObj);
                }
                if (typeof player.toggleSubtitlesOn === "function") {
                    try { player.toggleSubtitlesOn(); } catch (e) {}
                }
                if (typeof player.setOption === "function") {
                    player.setOption("captions", "track", trackObj);
                }

                var activeTrack = (typeof player.getOption === "function") ? player.getOption("captions", "track") : null;
                var activeLang = activeTrack && ((activeTrack.translationLanguage && activeTrack.translationLanguage.languageCode) || activeTrack.languageCode);
                if (desiredLang === "video" || (activeLang && langMatches(activeLang, desiredLang)) || lastCaptionVid === vid) {
                    lastCaptionVid = vid;
                    lastCaptionLang = desiredLang;
                }
                youtv.report("captions: set " + (isShort ? "shorts" : "video") + " to " + desiredLang);
            }
        } catch (e) {}
    }

    function enforceOriginalAudio(player, isShort, vid, forceNow) {
        var wantOrig = getBoolSetting(isShort ? SHORTS_ORIG_AUDIO_KEY : VIDEO_ORIG_AUDIO_KEY, false);
        if (!wantOrig) return;
        if (!forceNow && lastAudioVid === vid) return;

        try {
            if (typeof player.getAvailableAudioTracks !== "function" || typeof player.setAudioTrack !== "function") return;
            var tracks = player.getAvailableAudioTracks();
            if (!Array.isArray(tracks) || tracks.length <= 1) return;

            var orig = null;
            for (var i = 0; i < tracks.length; i++) {
                var t = tracks[i];
                var id = (t && t.id) || "";
                var name = (t && (t.name || t.displayName)) || "";
                if (/\.4$/.test(id) || /original|الأصل|orig/i.test(name)) {
                    orig = t;
                    break;
                }
            }
            if (orig) {
                var cur = typeof player.getAudioTrack === "function" ? player.getAudioTrack() : null;
                if (!cur || cur.id !== orig.id) {
                    player.setAudioTrack(orig);
                    youtv.report("audio: forced original track");
                }
                lastAudioVid = vid;
            }
        } catch (e) {}
    }

    function unlockSpeedOnEnvironment(player) {
        if (!window._birdyYtcfgSpeedUnlocked) {
            try {
                var setFlags = function (flags) {
                    if (!flags || typeof flags !== "object") return;
                    flags.html5_disable_playback_rate_on_tv = false;
                    flags.web_player_disable_playback_speed = false;
                    flags.tv_enable_playback_rate = true;
                    flags.enable_playback_rate_on_tv = true;
                    flags.enable_playback_speed_for_tv = true;
                    flags.cobalt_enable_playback_rate = true;
                    flags.web_player_playback_speed_available_rates = SPEED_RATES.slice();
                    flags.kevlar_playback_speed_rates = SPEED_RATES.slice();
                };
                if (window.ytcfg) {
                    if (typeof window.ytcfg.get === "function") {
                        setFlags(window.ytcfg.get("EXPERIMENT_FLAGS"));
                        setFlags(window.ytcfg.get("WEB_PLAYER_CONTEXT_CONFIGS"));
                    }
                    if (window.ytcfg.data_) {
                        setFlags(window.ytcfg.data_.EXPERIMENT_FLAGS);
                    }
                }
                if (window.yt && window.yt.config_) {
                    setFlags(window.yt.config_.EXPERIMENT_FLAGS);
                }
                window._birdyYtcfgSpeedUnlocked = true;
            } catch (e) {}
        }
        if (player && !player._birdySpeedPatched) {
            player._birdySpeedPatched = true;
            try {
                player.getAvailablePlaybackRates = function () {
                    return SPEED_RATES.slice();
                };
            } catch (e) {}
        }
    }
    unlockSpeedOnEnvironment(null);

    var lastSpeedVid = null;
    var lastSpeedRate = 1;
    var currentVideoOverrideRate = null;
    var lastLoadedSpeedVid = null;

    function enforceSpeed(player, isShort, vid, forceNow) {
        unlockSpeedOnEnvironment(player);
        if (vid && vid !== lastLoadedSpeedVid) {
            lastLoadedSpeedVid = vid;
            currentVideoOverrideRate = null; // New video resets to user's default playback speed
        }

        var defaultRaw = getStringSetting(isShort ? SHORTS_SPEED_KEY : VIDEO_SPEED_KEY, "1");
        var defaultRate = parseFloat(defaultRaw);
        if (!isFinite(defaultRate) || defaultRate <= 0) defaultRate = 1;

        var rate = currentVideoOverrideRate !== null ? currentVideoOverrideRate : defaultRate;

        var video = typeof document !== "undefined" ? document.querySelector("video") : null;
        if (rate === 1 && !forceNow && lastSpeedRate === 1) return;

        try {
            if (player && typeof player.setPlaybackRate === "function") {
                var curPlayerRate = typeof player.getPlaybackRate === "function" ? player.getPlaybackRate() : 1;
                if (forceNow || Math.abs(curPlayerRate - rate) > 0.01) {
                    player.setPlaybackRate(rate);
                }
            }
            if (video && (forceNow || Math.abs(video.playbackRate - rate) > 0.01)) {
                video.defaultPlaybackRate = rate;
                video.playbackRate = rate;
            }
            if (lastSpeedVid !== vid || Math.abs(lastSpeedRate - rate) > 0.01 || forceNow) {
                if (rate !== 1 || forceNow) {
                    youtv.report("speed: set " + (isShort ? "shorts" : "video") + " to " + rate + "x (actual=" + (video ? video.playbackRate : "none") + ")");
                }
                lastSpeedVid = vid;
                lastSpeedRate = rate;
            }
        } catch (e) {}
    }

    function applyAllTweaks(forceNow) {
        if (typeof document === "undefined") return;
        var player = findPlayer();
        unlockSpeedOnEnvironment(player);
        if (!player) return;
        var isShort = isCurrentShort(player);
        var vid = getVideoId(player);
        enforceQuality(player, isShort, vid, forceNow);
        enforceSpeed(player, isShort, vid, forceNow);
        enforceCaptions(player, isShort, vid, forceNow);
        enforceOriginalAudio(player, isShort, vid, forceNow);
    }

    function bindVideoListeners() {
        if (typeof document === "undefined") return;
        var video = document.querySelector("video");
        if (video && !video._birdyQualityBound) {
            video._birdyQualityBound = true;
            var onEvt = function () { applyAllTweaks(false); };
            video.addEventListener("loadedmetadata", onEvt);
            video.addEventListener("playing", onEvt);
            video.addEventListener("durationchange", onEvt);
            video.addEventListener("ratechange", onEvt);
        }
        var player = findPlayer();
        if (player && !player._birdyQualityBound && typeof player.addEventListener === "function") {
            player._birdyQualityBound = true;
            try {
                player.addEventListener("onStateChange", function (state) {
                    if (state === 1 || state === 3) applyAllTweaks(false);
                });
            } catch (e) {}
        }
    }

    window.birdyApplyQuality = function () {
        applyAllTweaks(true);
    };

    // ---- 1-to-1 Native-Look Custom Speed Drawer --------------------------------------------
    var speedSheet = null;
    function ensureSpeedStyles() {
        if (speedSheet || typeof document === "undefined") return;
        try {
            speedSheet = new CSSStyleSheet();
            speedSheet.replaceSync(
                "@keyframes birdyDrawerSlideIn {\n" +
                "  from { transform: translateX(100%); opacity: 0.8; }\n" +
                "  to { transform: translateX(0); opacity: 1; }\n" +
                "}\n" +
                "@keyframes birdyDrawerSlideOut {\n" +
                "  from { transform: translateX(0); opacity: 1; }\n" +
                "  to { transform: translateX(100%); opacity: 0.8; }\n" +
                "}\n" +
                "@keyframes birdyBackdropFadeIn {\n" +
                "  from { opacity: 0; }\n" +
                "  to { opacity: 1; }\n" +
                "}\n" +
                "@keyframes birdyBackdropFadeOut {\n" +
                "  from { opacity: 1; }\n" +
                "  to { opacity: 0; }\n" +
                "}\n" +
                ".birdy-speed-drawer {\n" +
                "  animation: birdyDrawerSlideIn 0.35s cubic-bezier(0.16, 1, 0.3, 1) forwards !important;\n" +
                "}\n" +
                ".birdy-speed-drawer.closing {\n" +
                "  animation: birdyDrawerSlideOut 0.22s cubic-bezier(0.4, 0, 1, 1) forwards !important;\n" +
                "}\n" +
                ".birdy-speed-backdrop {\n" +
                "  animation: birdyBackdropFadeIn 0.3s ease-out forwards !important;\n" +
                "}\n" +
                ".birdy-speed-backdrop.closing {\n" +
                "  animation: birdyBackdropFadeOut 0.22s ease-in forwards !important;\n" +
                "}\n" +
                ".birdy-speed-item {\n" +
                "  display: flex !important;\n" +
                "  align-items: center !important;\n" +
                "  justify-content: space-between !important;\n" +
                "  min-height: 98px !important;\n" +
                "  height: 98px !important;\n" +
                "  border-radius: 22px !important;\n" +
                "  padding: 0 36px !important;\n" +
                "  font-size: 28px !important;\n" +
                "  font-weight: 500 !important;\n" +
                "  font-family: Roboto, 'YouTube Sans', sans-serif !important;\n" +
                "  background: rgba(255, 255, 255, 0.08) !important;\n" +
                "  color: #f1f1f1 !important;\n" +
                "  cursor: pointer !important;\n" +
                "  outline: none !important;\n" +
                "  box-sizing: border-box !important;\n" +
                "  transition: background 0.12s, color 0.12s, transform 0.12s !important;\n" +
                "}\n" +
                ".birdy-speed-item:focus, .birdy-speed-item.focused {\n" +
                "  background: #ffffff !important;\n" +
                "  color: #0f0f0f !important;\n" +
                "  transform: none !important;\n" +
                "  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.4) !important;\n" +
                "}\n" +
                ".birdy-speed-item:focus *, .birdy-speed-item.focused * {\n" +
                "  color: #0f0f0f !important;\n" +
                "  fill: #0f0f0f !important;\n" +
                "}\n" +
                "#birdy-speed-list::-webkit-scrollbar { display: none !important; width: 0 !important; }\n"
            );
            document.adoptedStyleSheets = document.adoptedStyleSheets.concat([speedSheet]);
        } catch (e) {}
    }

    function isSettingsHubActive() {
        if (typeof document === "undefined") return false;
        try {
            if (window.birdyTvSettingsHub && typeof window.birdyTvSettingsHub.isOpen === "function" && window.birdyTvSettingsHub.isOpen()) {
                return true;
            }
        } catch (e) {}
        return !!document.querySelector(".birdy-yt-screen.show, #birdytv-settings-hub, .farotv-hub-screen");
    }

    function isSpeedMenuItem(el) {
        if (!el || isSettingsHubActive()) return false;
        if (el.closest && el.closest(".birdy-yt-screen, #birdytv-settings-hub, .farotv-hub-screen, [class*='hub']")) return false;
        var t = (el.textContent || "").trim();
        if (/Video speed/i.test(t)) return false;
        return (/Speed|سرعة التشغيل|Velocidad/i.test(t) && /Normal|\d+(\.\d+)?x/i.test(t)) ||
               /^(Speed|Playback speed|سرعة التشغيل|Velocidad)$/i.test(t);
    }

    function findSpeedHeading() {
        if (typeof document === "undefined" || isSettingsHubActive()) return null;
        var headers = document.querySelectorAll("h1, h2, h3, h4, div, span, ytlr-dialog-title");
        for (var h = 0; h < headers.length; h++) {
            var head = headers[h];
            if (head.closest && head.closest("#birdy-custom-speed-drawer, .birdy-speed-drawer, .birdy-speed-backdrop, .birdy-yt-screen, #birdytv-settings-hub, .farotv-hub-screen, [class*='hub']")) continue;
            if (head.children && head.children.length > 2) continue;
            var ht = (head.textContent || "").trim();
            // Strictly match dialog title "Video speed", NEVER "Playback speed"
            if (/^(Video speed|سرعة التشغيل|Velocidad de reproducción)$/i.test(ht)) {
                var r = head.getBoundingClientRect();
                if (r && r.height > 0) return head;
            }
        }
        return null;
    }

    function createCheckSvg(visible) {
        var svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
        svg.setAttribute("viewBox", "0 0 24 24");
        svg.style.width = "36px";
        svg.style.height = "36px";
        svg.style.fill = "currentColor";
        svg.style.flexShrink = "0";
        svg.style.visibility = visible ? "visible" : "hidden";
        var path = document.createElementNS("http://www.w3.org/2000/svg", "path");
        path.setAttribute("d", "M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4L9 16.2z");
        svg.appendChild(path);
        return svg;
    }

    function closeCustomSpeedDrawer() {
        var drawer = document.getElementById("birdy-custom-speed-drawer");
        var backdrop = document.getElementById("birdy-speed-backdrop");
        if (!drawer && !backdrop) return;

        if (drawer) drawer.classList.add("closing");
        if (backdrop) backdrop.classList.add("closing");

        // Restore visibility of any native dialogs
        var nativeDialogs = document.querySelectorAll("ytlr-dialog-renderer, [role='dialog']:not([data-birdy-drawer]), .ytlr-dialog-renderer");
        for (var nd = 0; nd < nativeDialogs.length; nd++) {
            if (nativeDialogs[nd] !== drawer) {
                nativeDialogs[nd].style.removeProperty("opacity");
                nativeDialogs[nd].style.removeProperty("pointer-events");
            }
        }

        setTimeout(function () {
            if (drawer && drawer.parentNode) drawer.parentNode.removeChild(drawer);
            if (backdrop && backdrop.parentNode) backdrop.parentNode.removeChild(backdrop);
        }, 230);

        var old = document.getElementById("birdy-speed-container");
        if (old && old.parentNode) old.parentNode.removeChild(old);
    }

    function updateSettingsMenuSubtitle(rate) {
        if (typeof document === "undefined") return;
        var r = (rate !== undefined && rate !== null) ? rate : (currentVideoOverrideRate !== null ? currentVideoOverrideRate : (parseFloat(getStringSetting(VIDEO_SPEED_KEY, "1")) || 1));
        var label = (Math.abs(r - 1) < 0.01 ? "Normal" : (r + "x"));
        var items = document.querySelectorAll("ytlr-menu-item-renderer, [role='menuitem'], [role='button'], .ytlr-menu-item-renderer");
        for (var i = 0; i < items.length; i++) {
            var it = items[i];
            if (it.closest && it.closest("#birdy-custom-speed-drawer, .birdy-speed-drawer, #birdytv-settings-hub")) continue;
            var text = (it.textContent || "").trim();
            if (/Speed|سرعة|Velocidad/i.test(text) && !/Video speed/i.test(text)) {
                var subs = it.querySelectorAll("ytlr-formatted-string, span, div, p");
                var subFound = false;
                for (var s = 0; s < subs.length; s++) {
                    var el = subs[s];
                    if (el.children && el.children.length > 0) continue;
                    var st = (el.textContent || "").trim();
                    if (/^(Normal|عادي|\d+(\.\d+)?x)$/i.test(st) || /^[\•\·\s]*(Normal|عادي|\d+(\.\d+)?x)$/i.test(st)) {
                        el.textContent = label;
                        subFound = true;
                    }
                }
            }
        }
    }

    function openCustomSpeedDrawer() {
        if (typeof document === "undefined") return;
        if (isSettingsHubActive()) return;

        var player = findPlayer();
        var isShort = isCurrentShort(player);
        if (!getBoolSetting(isShort ? SHORTS_CUSTOM_SPEED_KEY : VIDEO_CUSTOM_SPEED_KEY, true)) return;

        // Hide any default YouTube TV speed dialog or settings panel underneath (NEVER hide our own drawer)
        var nativeDialogs = document.querySelectorAll("ytlr-dialog-renderer, [role='dialog']:not([data-birdy-drawer]), .ytlr-dialog-renderer");
        for (var nd = 0; nd < nativeDialogs.length; nd++) {
            if (nativeDialogs[nd].id === "birdy-custom-speed-drawer" || nativeDialogs[nd].classList.contains("birdy-speed-drawer")) continue;
            nativeDialogs[nd].style.setProperty("opacity", "0", "important");
            nativeDialogs[nd].style.setProperty("pointer-events", "none", "important");
        }

        ensureSpeedStyles();

        var speedKey = isShort ? SHORTS_SPEED_KEY : VIDEO_SPEED_KEY;
        var defaultRate = parseFloat(getStringSetting(speedKey, "1")) || 1;
        var currentRate = currentVideoOverrideRate !== null ? currentVideoOverrideRate : defaultRate;

        var existing = document.getElementById("birdy-custom-speed-drawer");
        if (existing) {
            existing.classList.remove("closing");
            var existingItems = existing.querySelectorAll(".birdy-speed-item");
            for (var ei = 0; ei < existingItems.length; ei++) {
                var eRate = parseFloat(existingItems[ei].getAttribute("data-rate"));
                var isSel = Math.abs(eRate - currentRate) < 0.01;
                var eSvg = existingItems[ei].querySelector("svg");
                if (eSvg) eSvg.style.visibility = isSel ? "visible" : "hidden";
                existingItems[ei].setAttribute("aria-checked", isSel ? "true" : "false");
            }
            return;
        }

        // 1. Semi-transparent backdrop
        var backdrop = document.createElement("div");
        backdrop.id = "birdy-speed-backdrop";
        backdrop.className = "birdy-speed-backdrop";
        backdrop.style.cssText =
            "position: fixed !important; " +
            "top: 0 !important; " +
            "left: 0 !important; " +
            "width: 100vw !important; " +
            "height: 100vh !important; " +
            "background: rgba(0, 0, 0, 0.45) !important; " +
            "z-index: 2147483640 !important;";
        backdrop.onclick = function () {
            closeCustomSpeedDrawer();
        };
        (document.body || document.documentElement).appendChild(backdrop);

        // 2. Custom Speed Drawer (740px wide, 1-to-1 match of YouTube TV right sheet)
        var drawer = document.createElement("div");
        drawer.id = "birdy-custom-speed-drawer";
        drawer.className = "birdy-speed-drawer";
        drawer.setAttribute("data-birdy-drawer", "true");
        drawer.setAttribute("role", "dialog");
        drawer.setAttribute("aria-modal", "true");
        drawer.setAttribute("aria-label", "Video speed");
        drawer.setAttribute("tabindex", "-1");
        drawer.style.cssText =
            "position: fixed !important; " +
            "top: 0 !important; " +
            "right: 0 !important; " +
            "width: 680px !important; " +
            "height: 100vh !important; " +
            "background: #0f0f0f !important; " +
            "box-shadow: -16px 0 60px rgba(0, 0, 0, 0.95) !important; " +
            "z-index: 2147483645 !important; " +
            "padding: 44px 38px 32px 38px !important; " +
            "box-sizing: border-box !important; " +
            "display: flex !important; " +
            "flex-direction: column !important; " +
            "outline: none !important;";

        // 3. Header title: "Video speed" matching Pic 1
        var title = document.createElement("div");
        title.className = "birdy-speed-drawer-title";
        var isArabic = document.documentElement && document.documentElement.lang && document.documentElement.lang.indexOf("ar") === 0;
        var isSpanish = document.documentElement && document.documentElement.lang && document.documentElement.lang.indexOf("es") === 0;
        title.textContent = isArabic ? "سرعة التشغيل" : (isSpanish ? "Velocidad de reproducción" : "Video speed");
        title.style.cssText =
            "font-size: 38px !important; " +
            "font-weight: 700 !important; " +
            "color: #ffffff !important; " +
            "margin-bottom: 26px !important; " +
            "padding-left: 4px !important; " +
            "font-family: Roboto, 'YouTube Sans', sans-serif !important;";
        drawer.appendChild(title);

        // 4. Scrollable list container
        var list = document.createElement("div");
        list.id = "birdy-speed-list";
        list.setAttribute("role", "menu");
        list.style.cssText =
            "display: flex !important; " +
            "flex-direction: column !important; " +
            "gap: 12px !important; " +
            "max-height: calc(100vh - 140px) !important; " +
            "overflow-y: auto !important; " +
            "overflow-x: hidden !important; " +
            "scrollbar-width: none !important; " +
            "outline: none !important; " +
            "padding-bottom: 24px !important;";
        drawer.appendChild(list);

        function onSelectRate(rate) {
            currentVideoOverrideRate = rate;
            lastSpeedRate = rate;
            if (player && typeof player.setPlaybackRate === "function") player.setPlaybackRate(rate);
            var vidEl = typeof document !== "undefined" ? document.querySelector("video") : null;
            if (vidEl) {
                vidEl.defaultPlaybackRate = rate;
                vidEl.playbackRate = rate;
            }
            updateSettingsMenuSubtitle(rate);
            youtv.report("speed: applied " + rate + "x for current video");

            closeCustomSpeedDrawer();

            // Dismiss native settings menu as well
            [27, 4].forEach(function (code) {
                try {
                    var evt = new KeyboardEvent("keydown", { bubbles: true, cancelable: true, keyCode: code, which: code });
                    (document.activeElement || document.body || window).dispatchEvent(evt);
                } catch (e) {}
            });

            setTimeout(function () { applyAllTweaks(true); }, 100);
            setTimeout(function () { applyAllTweaks(true); }, 300);
        }

        var itemsList = [];
        var activeItem = null;

        for (var i = 0; i < SPEED_RATES.length; i++) {
            (function (idx) {
                var rate = SPEED_RATES[idx];
                var isSelected = Math.abs(rate - currentRate) < 0.01;

                var item = document.createElement("div");
                item.className = "birdy-speed-item";
                item.setAttribute("role", "menuitemradio");
                item.setAttribute("aria-checked", isSelected ? "true" : "false");
                item.setAttribute("tabindex", "0");
                item.setAttribute("data-rate", String(rate));

                var labelSpan = document.createElement("span");
                labelSpan.textContent = (rate === 1 ? "Normal" : (rate + "x"));

                var checkSvg = createCheckSvg(isSelected);

                item.appendChild(labelSpan);
                item.appendChild(checkSvg);

                item.onfocus = function () {
                    item.classList.add("focused");
                    try { item.scrollIntoView({ block: "nearest" }); } catch (e) {}
                };
                item.onblur = function () {
                    item.classList.remove("focused");
                };

                item.onclick = function (e) {
                    if (e && e.stopPropagation) e.stopPropagation();
                    onSelectRate(rate);
                };

                list.appendChild(item);
                itemsList.push(item);
                if (isSelected) activeItem = item;
            })(i);
        }

        // Wire D-pad navigation
        for (var k = 0; k < itemsList.length; k++) {
            (function (idx) {
                var el = itemsList[idx];
                el.onkeydown = function (ev) {
                    var code = ev.keyCode || ev.which;
                    if (code === 40 || code === 20) { // Down
                        if (idx < itemsList.length - 1) {
                            if (ev && ev.preventDefault) ev.preventDefault();
                            if (ev && ev.stopPropagation) ev.stopPropagation();
                            var nextItem = itemsList[idx + 1];
                            nextItem.focus();
                            try {
                                var top = nextItem.offsetTop;
                                var h = nextItem.offsetHeight;
                                var listH = list.clientHeight;
                                if (top + h > list.scrollTop + listH) {
                                    list.scrollTop = top + h - listH + 28;
                                }
                            } catch (e) {}
                            try { nextItem.scrollIntoView({ block: "nearest" }); } catch (e2) {}
                        }
                    } else if (code === 38 || code === 19) { // Up
                        if (idx > 0) {
                            if (ev && ev.preventDefault) ev.preventDefault();
                            if (ev && ev.stopPropagation) ev.stopPropagation();
                            var prevItem = itemsList[idx - 1];
                            prevItem.focus();
                            try {
                                var top2 = prevItem.offsetTop;
                                if (top2 < list.scrollTop) {
                                    list.scrollTop = Math.max(0, top2 - 28);
                                }
                            } catch (e) {}
                            try { prevItem.scrollIntoView({ block: "nearest" }); } catch (e2) {}
                        }
                    } else if (code === 13 || code === 23 || code === 66) { // Enter / OK
                        if (ev && ev.preventDefault) ev.preventDefault();
                        if (ev && ev.stopPropagation) ev.stopPropagation();
                        var r = parseFloat(el.getAttribute("data-rate"));
                        onSelectRate(r);
                    } else if (code === 4 || code === 27 || code === 37) { // Back / Escape / Left
                        if (ev && ev.preventDefault) ev.preventDefault();
                        if (ev && ev.stopPropagation) ev.stopPropagation();
                        closeCustomSpeedDrawer();
                    }
                };
            })(k);
        }

        (document.body || document.documentElement).appendChild(drawer);

        // Initial focus on active rate
        var targetToFocus = activeItem || itemsList[0];
        if (targetToFocus && typeof targetToFocus.focus === "function") {
            setTimeout(function () {
                try {
                    targetToFocus.focus();
                    if (typeof targetToFocus.scrollIntoView === "function") {
                        targetToFocus.scrollIntoView({ block: "center", behavior: "instant" });
                    }
                } catch (e) {}
            }, 50);
        }

        youtv.report("speed: custom drawer opened with " + SPEED_RATES.length + " rates");
    }

    function checkSpeedMenuState() {
        if (typeof document === "undefined") return;

        // If settings hub is open, make sure speed drawer is completely absent
        if (isSettingsHubActive()) {
            closeCustomSpeedDrawer();
            return;
        }

        updateSettingsMenuSubtitle();

        var player = findPlayer();
        var isShort = isCurrentShort(player);
        if (!getBoolSetting(isShort ? SHORTS_CUSTOM_SPEED_KEY : VIDEO_CUSTOM_SPEED_KEY, true)) return;

        // Check if YouTube TV opened its native speed dialog
        var head = findSpeedHeading();
        if (head) {
            // Hide the default speed dialog completely (NEVER our own drawer)
            var nativeDialog = head.closest("ytlr-dialog-renderer, [role='dialog']:not([data-birdy-drawer]), .ytlr-dialog-renderer") || head.parentElement;
            if (nativeDialog && nativeDialog.id !== "birdy-custom-speed-drawer" && !nativeDialog.classList.contains("birdy-speed-drawer")) {
                nativeDialog.style.setProperty("display", "none", "important");
            }
            // Open our custom speed drawer in its place
            openCustomSpeedDrawer();
        }
    }

    // Intercept clicks and Enter keys on the "Speed" item in the settings menu
    if (typeof window !== "undefined" && typeof window.addEventListener === "function") {
        window.addEventListener("keydown", function (e) {
            if (isSettingsHubActive()) return;
            var code = e.keyCode || e.which;
            if (code === 13 || code === 23 || code === 66) {
                var active = document.activeElement;
                var focused = document.querySelector(".focused, [focused]");
                if (isSpeedMenuItem(active) || isSpeedMenuItem(focused)) {
                    var player = findPlayer();
                    var isShort = isCurrentShort(player);
                    if (getBoolSetting(isShort ? SHORTS_CUSTOM_SPEED_KEY : VIDEO_CUSTOM_SPEED_KEY, true)) {
                        if (e.preventDefault) e.preventDefault();
                        if (e.stopPropagation) e.stopPropagation();
                        openCustomSpeedDrawer();
                        return;
                    }
                }
            }
            checkSpeedMenuState();
        }, true);

        window.addEventListener("click", function (e) {
            if (isSettingsHubActive()) return;
            var target = e.target;
            while (target && target !== document.body) {
                if (isSpeedMenuItem(target)) {
                    var player = findPlayer();
                    var isShort = isCurrentShort(player);
                    if (getBoolSetting(isShort ? SHORTS_CUSTOM_SPEED_KEY : VIDEO_CUSTOM_SPEED_KEY, true)) {
                        if (e.preventDefault) e.preventDefault();
                        if (e.stopPropagation) e.stopPropagation();
                        openCustomSpeedDrawer();
                        return;
                    }
                }
                target = target.parentElement;
            }
        }, true);
    }

    // Observe DOM mutations
    if (typeof window !== "undefined" && typeof MutationObserver !== "undefined") {
        try {
            var speedObserver = new MutationObserver(function () {
                checkSpeedMenuState();
            });
            var targetRoot = document.body || document.documentElement;
            if (targetRoot) {
                speedObserver.observe(targetRoot, { childList: true, subtree: true });
            }
        } catch (e) {}
    }

    if (typeof setInterval === "function") {
        setInterval(function () {
            if (typeof document !== "undefined" && document.hidden) return;
            bindVideoListeners();
            applyAllTweaks(false);
            checkSpeedMenuState();
        }, 400);
    }
})();
