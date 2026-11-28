// SponsorBlock: skips sponsored parts, self-promotion, "subscribe" reminders and other segments
// marked by the SponsorBlock community (https://sponsor.ajay.app, data under CC BY-NC-SA 4.0).
// Supports three modes per category: automatically skip, prompt to skip (with OK on TV remote), or off.
// Also supports custom seekbar segment colors for each category.
(function () {
    if (!window.youtv || !youtv.request) return;

    var CATEGORIES = [
        { key: "sponsor", titleKey: "sponsor.sponsor.title", promptTitleKey: "sponsor.sponsor.prompt.title", labelKey: "sponsor.sponsor.label", actionKey: "sponsor.sponsor.action", default: true },
        { key: "selfpromo", titleKey: "sponsor.selfpromo.title", promptTitleKey: "sponsor.selfpromo.prompt.title", labelKey: "sponsor.selfpromo.label", actionKey: "sponsor.selfpromo.action", default: true },
        { key: "interaction", titleKey: "sponsor.interaction.title", promptTitleKey: "sponsor.interaction.prompt.title", labelKey: "sponsor.interaction.label", actionKey: "sponsor.interaction.action", default: true },
        { key: "intro", titleKey: "sponsor.intro.title", promptTitleKey: "sponsor.intro.prompt.title", labelKey: "sponsor.intro.label", actionKey: "sponsor.intro.action", default: false },
        { key: "outro", titleKey: "sponsor.outro.title", promptTitleKey: "sponsor.outro.prompt.title", labelKey: "sponsor.outro.label", actionKey: "sponsor.outro.action", default: false },
        { key: "preview", titleKey: "sponsor.preview.title", promptTitleKey: "sponsor.preview.prompt.title", labelKey: "sponsor.preview.label", actionKey: "sponsor.preview.action", default: false },
        { key: "music_offtopic", titleKey: "sponsor.music_offtopic.title", promptTitleKey: "sponsor.music_offtopic.prompt.title", labelKey: "sponsor.music_offtopic.label", actionKey: "sponsor.music_offtopic.action", default: false },
        { key: "filler", titleKey: "sponsor.filler.title", promptTitleKey: "sponsor.filler.prompt.title", labelKey: "sponsor.filler.label", actionKey: "sponsor.filler.action", default: false }
    ];

    var CATEGORY_COLORS = {
        sponsor: "#00D400",       // Green
        selfpromo: "#FFD600",     // Yellow
        interaction: "#CC00FF",   // Magenta
        intro: "#00E5FF",         // Cyan
        outro: "#304FFE",         // Blue
        preview: "#00B0FF",       // Light Blue
        music_offtopic: "#FF6D00",// Orange
        filler: "#9C27B0"         // Purple
    };

    // 1. Feature: SponsorBlock skipping (1 setting per category in list, 3 options on its page: On, Prompt to skip, Off)
    var featureSettings = [
        { key: "prompt_all", titleKey: "sponsor.prompt_all.title", summaryKey: "sponsor.prompt_all.summary", default: false }
    ];
    CATEGORIES.forEach(function (c) {
        featureSettings.push({ key: c.key, titleKey: c.titleKey, default: c.default });
    });

    var feature = youtv.feature({
        id: "sponsorblock",
        nameKey: "feature.sponsorblock.name",
        summaryKey: "feature.sponsorblock.summary",
        defaultEnabled: true,
        settings: featureSettings
    });
    if (!feature) return;

    // 2. Feature: SponsorBlock seekbar colors (Dedicated setting entry with per-category toggles)
    var seekbarSettings = [];
    CATEGORIES.forEach(function (c) {
        seekbarSettings.push({
            key: c.key + "_seekbar",
            titleKey: "sponsor." + c.key + ".seekbar.title",
            summaryKey: "sponsor." + c.key + ".seekbar.summary",
            default: c.default
        });
    });

    var seekbarFeature = youtv.feature({
        id: "sponsorblock-colors",
        nameKey: "feature.sponsorblock_colors.name",
        summaryKey: "feature.sponsorblock_colors.summary",
        defaultEnabled: true,
        settings: seekbarSettings
    });

    var videoId = null;
    var segments = [];      // { start, end, category, label, actionKey, skipped, prompted }

    function currentVideoId() {
        var match = /[?&#]v=([A-Za-z0-9_-]{11})/.exec(location.hash || location.search || "");
        return match ? match[1] : null;
    }

    // 3 options per category: "skip" (automatic), "prompt" (manual overlay), "off" (disabled)
    function getCategoryMode(key) {
        if (!feature.enabled()) return "off";
        var globalPrompt = feature.settings.get("prompt_all");
        var rawMode = null;
        try {
            var raw = localStorage.getItem("yt.leanback.default::YOUTV_SPONSORBLOCK_" + key.toUpperCase() + "_MODE");
            if (raw) rawMode = JSON.parse(raw);
        } catch (e) {}
        if (rawMode === "off") return "off";
        if (rawMode === "prompt") return "prompt";
        if (rawMode === "skip") return globalPrompt ? "prompt" : "skip";
        var isManual = feature.settings.get(key + "_prompt");
        var isAuto = feature.settings.get(key);
        if (isManual || (isAuto && globalPrompt)) return "prompt";
        if (isAuto) return "skip";
        return "off";
    }

    function setCategoryMode(key, mode) {
        var upper = key.toUpperCase();
        try {
            localStorage.setItem("yt.leanback.default::YOUTV_SPONSORBLOCK_" + upper + "_MODE", JSON.stringify(mode));
            if (mode === "skip") {
                localStorage.setItem("yt.leanback.default::YOUTV_SPONSORBLOCK_" + upper, '{"data":true}');
                localStorage.setItem("yt.leanback.default::YOUTV_SPONSORBLOCK_" + upper + "_PROMPT", '{"data":false}');
            } else if (mode === "prompt") {
                localStorage.setItem("yt.leanback.default::YOUTV_SPONSORBLOCK_" + upper, '{"data":false}');
                localStorage.setItem("yt.leanback.default::YOUTV_SPONSORBLOCK_" + upper + "_PROMPT", '{"data":true}');
            } else {
                localStorage.setItem("yt.leanback.default::YOUTV_SPONSORBLOCK_" + upper, '{"data":false}');
                localStorage.setItem("yt.leanback.default::YOUTV_SPONSORBLOCK_" + upper + "_PROMPT", '{"data":false}');
            }
        } catch (e) {}
    }

    function enabledCategories() {
        return CATEGORIES.filter(function (c) {
            var skipMode = getCategoryMode(c.key);
            var seekbarOn = seekbarFeature && seekbarFeature.enabled() && seekbarFeature.settings.get(c.key + "_seekbar");
            return skipMode !== "off" || seekbarOn;
        });
    }

    // Short-lived, bounded cache, including 404s. Never share mutable skipped flags.
    var segmentCache = new Map();
    var CACHE_TTL = 5 * 60 * 1000;
    var MAX_CACHE = 50;
    function requestSegments(url, callback) {
        var cached = segmentCache.get(url);
        if (cached && Date.now() - cached.time < CACHE_TTL) {
            callback(cached.status, cached.body);
            return;
        }
        if (cached) segmentCache.delete(url);
        youtv.request(url, function (status, body) {
            if (status === 200 || status === 404) {
                if (!segmentCache.has(url) && segmentCache.size >= MAX_CACHE) {
                    segmentCache.delete(segmentCache.keys().next().value);
                }
                segmentCache.set(url, { time: Date.now(), status: status, body: body });
            }
            callback(status, body);
        });
    }

    function load(id) {
        segments = [];
        var categories = enabledCategories();
        if (!categories.length) return;
        var url = "https://sponsor.ajay.app/api/skipSegments?videoID=" + id +
            "&categories=" + encodeURIComponent(JSON.stringify(categories.map(function (c) { return c.key; })));
        requestSegments(url, function (status, body) {
            if (id !== videoId) return;
            if (status !== 200) {
                if (status !== 404) youtv.report("sponsorblock: HTTP " + status + " for " + id);
                return;
            }
            var list;
            try { list = youtv.rawParse(body); } catch (e) { return; }
            if (!Array.isArray(list)) return;
            var labels = {};
            var actions = {};
            CATEGORIES.forEach(function (c) {
                labels[c.key] = c.labelKey;
                actions[c.key] = c.actionKey;
            });
            segments = list.filter(function (s) {
                return s && Array.isArray(s.segment) && (s.actionType || "skip") === "skip" && s.segment[1] > s.segment[0];
            }).map(function (s) {
                return {
                    start: s.segment[0],
                    end: s.segment[1],
                    category: s.category,
                    label: labels[s.category] || s.category,
                    actionKey: actions[s.category] || "sponsor.prompt.action",
                    skipped: false,
                    prompted: false
                };
            });
            youtv.report("sponsorblock: " + segments.length + " segment(s) for " + id);
            updateSeekbarMarkers();
        });
    }

    // ---- notices, prompts and seekbar styles --------------------------------------------------
    var sheet = new CSSStyleSheet();
    try {
        sheet.replaceSync(
            ".birdy-skip-notice, .farotv-skip-notice," +
            ".birdy-skip-prompt, .farotv-skip-prompt {" +
            " position: fixed; right: 4.5rem; bottom: 5.5rem; z-index: 2147483647;" +
            " display: inline-flex; align-items: center; justify-content: center;" +
            " padding: 0.7rem 1.6rem; border-radius: 9999px;" +
            " background: rgba(18, 18, 18, 0.88); backdrop-filter: blur(8px); -webkit-backdrop-filter: blur(8px);" +
            " border: 1px solid rgba(255, 255, 255, 0.15); box-shadow: 0 4px 16px rgba(0, 0, 0, 0.6);" +
            " color: #ffffff; font: 500 1.4rem Roboto, 'YouTube Sans', Arial, sans-serif;" +
            " opacity: 0; transform: translateY(0.8rem); transition: opacity 250ms ease, transform 250ms ease;" +
            " pointer-events: none; cursor: pointer; }" +
            ".birdy-skip-notice.show, .farotv-skip-notice.show," +
            ".birdy-skip-prompt.show, .farotv-skip-prompt.show { opacity: 1; transform: translateY(0); pointer-events: auto; }" +
            "[dir='rtl'] .birdy-skip-notice, [dir='rtl'] .farotv-skip-notice," +
            "[dir='rtl'] .birdy-skip-prompt, [dir='rtl'] .farotv-skip-prompt { right: auto; left: 4.5rem; }" +
            ".birdy-skip-notice b, .farotv-skip-notice b { color: #ffffff; font-weight: 500; margin-left: 0.3rem; }" +
            ".birdy-skip-icon { width: 1.4rem; height: 1.4rem; fill: #ffffff; margin-left: 0.6rem; vertical-align: middle; flex-shrink: 0; }" +
            "[dir='rtl'] .birdy-skip-icon { margin-left: 0; margin-right: 0.6rem; transform: scaleX(-1); }" +
            ".birdy-sb-track-markers { position: fixed; left: 0; top: 0; width: 0; height: 4px; -webkit-transform: translateY(-50%); transform: translateY(-50%);" +
            " pointer-events: none; z-index: 2147483640; overflow: hidden; border-radius: 9999px; display: none;" +
            " transition: height 120ms ease, opacity 120ms ease; }" +
            ".birdy-sb-marker { position: absolute; top: 0; bottom: 0; height: 100%; border-radius: 0; opacity: 0.88;" +
            " box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.22); pointer-events: none; }" +
            ".birdy-setting-prompt-button { outline: none; cursor: pointer; }");
        document.adoptedStyleSheets = document.adoptedStyleSheets.concat([sheet]);
    } catch (e) {}

    function createSkipIcon() {
        if (!document) return null;
        if (typeof document.createElementNS === "function") {
            try {
                var svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
                if (svg && svg.setAttribute) {
                    svg.setAttribute("viewBox", "0 0 24 24");
                    svg.setAttribute("class", "birdy-skip-icon");
                }
                var path = document.createElementNS("http://www.w3.org/2000/svg", "path");
                if (path && path.setAttribute) {
                    path.setAttribute("d", "M5 4v16l12-8zm13 0v16h2V4z");
                }
                if (svg && svg.appendChild && path) svg.appendChild(path);
                return svg;
            } catch (e) {}
        }
        if (typeof document.createElement === "function") {
            try {
                var span = document.createElement("span");
                span.className = "birdy-skip-icon";
                return span;
            } catch (e) {}
        }
        return null;
    }

    // Feedback notice: identical sleek dark pill design
    var notice = null;
    var noticeTimer = null;
    function showNotice(label) {
        if (!document.body) return;
        if (!notice) {
            notice = document.createElement("div");
            notice.className = "birdy-skip-notice farotv-skip-notice";
        }
        if (!notice.parentNode) document.body.appendChild(notice);
        notice.dir = window.farotvI18n.direction();
        notice.textContent = "";

        var prefixSpan = document.createElement("span");
        prefixSpan.textContent = youtv.t("sponsor.skipped");
        notice.appendChild(prefixSpan);

        var labelSpan = document.createElement("b");
        labelSpan.textContent = youtv.t(label);
        notice.appendChild(labelSpan);

        var icon = createSkipIcon();
        if (icon && notice.appendChild) notice.appendChild(icon);

        notice.className = "birdy-skip-notice farotv-skip-notice show";
        clearTimeout(noticeTimer);
        noticeTimer = setTimeout(function () {
            notice.className = "birdy-skip-notice farotv-skip-notice";
        }, 2500);
    }

    // Manual Skip Prompt: sleek dark pill with "Skip sponsor |>" shown for the entire segment
    var prompt = null;
    var activePromptSegment = null;

    function isPromptShowing() {
        return prompt && prompt.className.indexOf("show") !== -1;
    }

    function hidePrompt() {
        if (!prompt) return;
        prompt.className = "birdy-skip-prompt farotv-skip-prompt";
        activePromptSegment = null;
        window.removeEventListener("keydown", onPromptKeyDown, true);
    }

    function isVideoPlayerFocused() {
        if (typeof document === "undefined") return true;
        try {
            var hub = document.getElementById("birdytv-settings-hub");
            if (hub && hub.style && hub.style.display !== "none") return false;
            var speedDrawer = document.getElementById("birdy-custom-speed-drawer");
            if (speedDrawer && speedDrawer.style && speedDrawer.style.display !== "none") return false;

            var active = document.activeElement;
            if (active && active !== document.body && active !== document.documentElement) {
                if (active.closest) {
                    if (active.closest("#birdytv-settings-hub, #birdy-custom-speed-drawer, ytlr-popup-container, [role='dialog'], [role='menu'], [role='menuitem'], ytlr-transport-controls-renderer, ytlr-progress-bar, .ytlr-progress-bar, ytlr-button-renderer, [role='button'], [role='slider'], button")) {
                        return false;
                    }
                }
                var tag = (active.tagName || "").toUpperCase();
                if (tag === "BUTTON" || tag === "INPUT" || tag === "A") return false;
            }

            var bar = findProgressBar();
            if (bar && getBarVisibilityAndOpacity(bar) > 0.15) return false;
        } catch (e) {}
        return true;
    }

    function onPromptKeyDown(e) {
        if (!isPromptShowing() || !activePromptSegment) return;
        if (!isVideoPlayerFocused()) return;
        var code = e.keyCode || e.which;
        if (code === 13 || code === 23 || e.key === "Enter" || e.key === "Select") {
            e.preventDefault();
            e.stopPropagation();
            if (e.stopImmediatePropagation) e.stopImmediatePropagation();
            var target = activePromptSegment;
            hidePrompt();
            var video = document.querySelector("video");
            if (video && isFinite(video.duration)) {
                target.skipped = true;
                video.currentTime = Math.min(target.end, video.duration - 0.1);
                showNotice(target.label);
                youtv.report("sponsorblock: prompt-skipped " + target.label + " " + target.start.toFixed(1) + "-" + target.end.toFixed(1));
            }
        }
    }

    function updatePromptView() {
        if (!prompt || !activePromptSegment) return;
        prompt.textContent = "";

        var actionText = youtv.t(activePromptSegment.actionKey);
        if (!actionText || actionText === activePromptSegment.actionKey) {
            actionText = youtv.t("sponsor.prompt.action") + youtv.t(activePromptSegment.label);
        }

        var textSpan = document.createElement("span");
        textSpan.textContent = actionText;
        prompt.appendChild(textSpan);

        var icon = createSkipIcon();
        if (icon && prompt.appendChild) prompt.appendChild(icon);
    }

    function syncPromptPosition() {
        if (!prompt || !isPromptShowing()) return;
        try {
            var focused = isVideoPlayerFocused();
            prompt.style.zIndex = focused ? "2147483647" : "1";

            var videoEl = document.querySelector ? document.querySelector("video") : null;
            if (videoEl && typeof videoEl.getBoundingClientRect === "function") {
                var vRect = videoEl.getBoundingClientRect();
                var winW = window.innerWidth || 1920;
                var winH = window.innerHeight || 1080;
                if (vRect && vRect.width > 100 && vRect.height > 100 && vRect.width < winW * 0.92) {
                    var padX = Math.max(16, Math.round(vRect.width * 0.03));
                    var padY = Math.max(20, Math.round(vRect.height * 0.06));
                    if (prompt.dir === "rtl") {
                        prompt.style.left = Math.max(16, Math.round(vRect.left + padX)) + "px";
                        prompt.style.right = "auto";
                    } else {
                        prompt.style.right = Math.max(16, Math.round(winW - vRect.right + padX)) + "px";
                        prompt.style.left = "auto";
                    }
                    prompt.style.bottom = Math.max(20, Math.round(winH - vRect.bottom + padY)) + "px";
                } else {
                    prompt.style.left = "";
                    prompt.style.right = "";
                    prompt.style.bottom = "";
                }
            }
        } catch (e) {}
    }

    function showPrompt(s) {
        if (!document.body) return;
        if (!prompt) {
            prompt = document.createElement("div");
            prompt.className = "birdy-skip-prompt farotv-skip-prompt";
            prompt.onclick = function () {
                if (!activePromptSegment) return;
                var target = activePromptSegment;
                hidePrompt();
                var video = document.querySelector("video");
                if (video && isFinite(video.duration)) {
                    target.skipped = true;
                    video.currentTime = Math.min(target.end, video.duration - 0.1);
                    showNotice(target.label);
                }
            };
        }
        if (!prompt.parentNode) document.body.appendChild(prompt);

        activePromptSegment = s;
        prompt.dir = window.farotvI18n.direction();

        updatePromptView();
        prompt.className = "birdy-skip-prompt farotv-skip-prompt show";
        syncPromptPosition();

        window.removeEventListener("keydown", onPromptKeyDown, true);
        window.addEventListener("keydown", onPromptKeyDown, true);
    }

    // ---- seekbar colored markers (Picture 3) --------------------------------------------------
    // Mounted on document.body (outside YouTube's Incremental DOM) so playhead updates never
    // reconcile/delete the marker nodes and cause flickering.
    var lastMarkersKey = "";
    var markersContainer = null;
    var hasMarkers = false;
    var lastBox = { left: -1, top: -1, width: -1, height: -1, opacity: -1, visible: false };
    var syncRafId = 0;
    var syncUntilMs = 0;

    function findProgressBar() {
        if (!document || typeof document.querySelector !== "function") return null;
        // 1. Prefer the inner visual bar track (avoids outer wrapper padding offset)
        var inner = document.querySelector(".ytlr-multi-markers-player-bar-renderer-bar") ||
                    document.querySelector(".progress-bar-line") ||
                    document.querySelector(".ytp-progress-bar");
        if (inner && inner.tagName !== "VIDEO" && typeof inner.querySelector === "function") return inner;

        var multi = document.querySelector("ytlr-multi-markers-player-bar-renderer") ||
                    document.querySelector("[idomkey='multi-markers-player-bar']") ||
                    document.querySelector("[idomkey='player-bar']") ||
                    document.querySelector(".ytp-progress-bar-container");
        if (multi && multi.tagName !== "VIDEO" && typeof multi.getBoundingClientRect === "function") {
            var mRect = multi.getBoundingClientRect();
            if (multi.children && mRect && mRect.width > 0) {
                for (var m = 0; m < multi.children.length; m++) {
                    var mc = multi.children[m];
                    if (!mc || typeof mc.getBoundingClientRect !== "function") continue;
                    var mcRect = mc.getBoundingClientRect();
                    if (mcRect && mcRect.width >= mRect.width * 0.85 && mcRect.height >= 2 && mcRect.height <= 14) {
                        return mc;
                    }
                }
            }
            return multi;
        }

        // 2. Look inside ytlr-progress-bar for the middle child (between current time and duration labels)
        var pb = document.querySelector("ytlr-progress-bar, .ytlr-progress-bar");
        if (pb && pb.children && pb.children.length >= 2) {
            for (var i = 0; i < pb.children.length; i++) {
                var child = pb.children[i];
                if (child.className && String(child.className).indexOf("birdy-sb") !== -1) continue;
                var text = (child.textContent || "").trim();
                // If it doesn't contain time separator ":", it is the slider bar track!
                if (text.indexOf(":") === -1) {
                    var track = child.querySelector ? (child.querySelector("[idomkey='progress-bar'], [idomkey='slider'], [class*='bar'], [class*='marker']") || child) : child;
                    if (track && track.tagName !== "VIDEO") return track;
                }
            }
        }

        // 3. Fallback to generic progress-bar element if not VIDEO
        var fallback = document.querySelector("[idomkey='progress-bar']");
        if (fallback && fallback.tagName !== "VIDEO" && typeof fallback.querySelector === "function") return fallback;
        return null;
    }

    function hideSeekbarContainer() {
        if (markersContainer && lastBox.visible) {
            markersContainer.style.display = "none";
            lastBox.visible = false;
        }
    }

    function clearSeekbarMarkers() {
        lastMarkersKey = "";
        hasMarkers = false;
        lastBox = { left: -1, top: -1, width: -1, height: -1, opacity: -1, visible: false };
        if (syncRafId && typeof cancelAnimationFrame === "function") {
            cancelAnimationFrame(syncRafId);
            syncRafId = 0;
        }
        if (markersContainer) {
            markersContainer.textContent = "";
            markersContainer.style.display = "none";
        }
        if (!document || typeof document.querySelectorAll !== "function") return;
        try {
            var existing = document.querySelectorAll(".birdy-sb-track-markers");
            for (var i = 0; i < existing.length; i++) {
                if (existing[i] === markersContainer) continue;
                if (typeof existing[i].remove === "function") {
                    existing[i].remove();
                } else if (existing[i].parentNode) {
                    existing[i].parentNode.removeChild(existing[i]);
                }
            }
        } catch (e) {}
    }

    function getBarVisibilityAndOpacity(bar) {
        if (!bar || (bar.isConnected === false)) return 0;
        var opacity = 1;
        var cur = bar;
        try {
            for (var i = 0; i < 8 && cur && cur !== document.body && cur !== document.documentElement; i++) {
                if (window.getComputedStyle) {
                    var cs = window.getComputedStyle(cur);
                    if (cs) {
                        if (cs.display === "none" || cs.visibility === "hidden") return 0;
                        var op = parseFloat(cs.opacity);
                        if (!isNaN(op)) {
                            opacity *= op;
                            if (opacity <= 0.02) return 0;
                        }
                    }
                }
                cur = cur.parentElement;
            }
        } catch (e) {}
        return opacity;
    }

    function syncSeekbarPosition(bar) {
        if (!markersContainer || !bar || typeof bar.getBoundingClientRect !== "function") {
            hideSeekbarContainer();
            return;
        }
        if (!seekbarFeature || !seekbarFeature.enabled() || !hasMarkers) {
            hideSeekbarContainer();
            return;
        }
        var rect = bar.getBoundingClientRect();
        var winH = window.innerHeight || 1080;
        if (!rect || rect.width <= 1 || rect.height <= 0 || rect.bottom <= 0 || rect.top >= winH) {
            hideSeekbarContainer();
            return;
        }
        var opacity = getBarVisibilityAndOpacity(bar);
        if (opacity <= 0.02) {
            hideSeekbarContainer();
            return;
        }

        var left = Math.round(rect.left * 10) / 10;
        var centerY = Math.round((rect.top + rect.height / 2) * 10) / 10;
        var width = Math.round(rect.width * 10) / 10;
        var isFocused = false;
        try {
            if (typeof bar.matches === "function" && bar.matches(":focus, :focus-within")) {
                isFocused = true;
            } else {
                var pb = bar.closest ? bar.closest("ytlr-progress-bar, .ytlr-progress-bar") : null;
                if (pb && typeof pb.matches === "function" && pb.matches(":focus, :focus-within")) isFocused = true;
            }
        } catch (e) {}
        var height = isFocused ? Math.max(8, Math.min(12, Math.round(rect.height * 10) / 10)) : 6;
        var roundedOpacity = Math.round(opacity * 100) / 100;

        if (!lastBox.visible) {
            markersContainer.style.display = "block";
            lastBox.visible = true;
        }
        if (lastBox.left !== left) {
            markersContainer.style.left = left + "px";
            lastBox.left = left;
        }
        if (lastBox.top !== centerY) {
            markersContainer.style.top = centerY + "px";
            lastBox.top = centerY;
        }
        if (lastBox.width !== width) {
            markersContainer.style.width = width + "px";
            lastBox.width = width;
        }
        if (lastBox.height !== height) {
            markersContainer.style.height = height + "px";
            lastBox.height = height;
        }
        if (lastBox.opacity !== roundedOpacity) {
            markersContainer.style.opacity = String(roundedOpacity);
            lastBox.opacity = roundedOpacity;
        }
    }

    function kickSeekbarPositionSync(durationMs) {
        if (typeof requestAnimationFrame !== "function") return;
        var targetEnd = Date.now() + (durationMs || 600);
        if (targetEnd > syncUntilMs) syncUntilMs = targetEnd;
        if (syncRafId) return;
        function step() {
            syncRafId = 0;
            if (!markersContainer || !hasMarkers) return;
            var bar = findProgressBar();
            syncSeekbarPosition(bar);
            if (Date.now() < syncUntilMs) {
                syncRafId = requestAnimationFrame(step);
            }
        }
        syncRafId = requestAnimationFrame(step);
    }

    if (typeof window !== "undefined" && typeof window.addEventListener === "function") {
        window.addEventListener("keydown", function () {
            if (segments && segments.length && seekbarFeature && seekbarFeature.enabled()) {
                kickSeekbarPositionSync(700);
            }
        }, true);
    }

    function updateSeekbarMarkers() {
        if (!seekbarFeature || !seekbarFeature.enabled()) {
            clearSeekbarMarkers();
            return;
        }
        var bar = findProgressBar();
        if (!bar) {
            hideSeekbarContainer();
            return;
        }
        var video = document.querySelector ? document.querySelector("video") : null;
        if (!video || !isFinite(video.duration) || video.duration <= 0 || !segments.length) {
            clearSeekbarMarkers();
            return;
        }
        var duration = video.duration;

        var activeSegs = [];
        for (var i = 0; i < segments.length; i++) {
            var s = segments[i];
            var isCategorySeekbar = seekbarFeature.settings.get(s.category + "_seekbar");
            if (isCategorySeekbar !== false && CATEGORY_COLORS[s.category]) {
                activeSegs.push(s);
            }
        }
        if (!activeSegs.length) {
            clearSeekbarMarkers();
            return;
        }

        var markersKey = (videoId || "") + ":" + Math.round(duration) + ":" + activeSegs.map(function (s) {
            return s.category + ":" + s.start.toFixed(1) + "-" + s.end.toFixed(1);
        }).join(",");

        var mountRoot = (document && (document.body || document.documentElement)) || null;
        if (!markersContainer && mountRoot && typeof document.createElement === "function") {
            markersContainer = document.createElement("div");
            markersContainer.className = "birdy-sb-track-markers";
            mountRoot.appendChild(markersContainer);
        } else if (markersContainer && mountRoot && markersContainer.parentNode !== mountRoot) {
            mountRoot.appendChild(markersContainer);
        }
        if (!markersContainer) return;

        if (!hasMarkers || markersKey !== lastMarkersKey) {
            var fragment = document.createDocumentFragment ? document.createDocumentFragment() : document.createElement("div");
            for (var j = 0; j < activeSegs.length; j++) {
                var seg = activeSegs[j];
                var color = CATEGORY_COLORS[seg.category];

                var startPct = Math.max(0, Math.min(100, (seg.start / duration) * 100));
                var endPct = Math.max(0, Math.min(100, (seg.end / duration) * 100));
                var widthPct = endPct - startPct;
                if (widthPct <= 0.05) continue;

                var marker = document.createElement("div");
                marker.className = "birdy-sb-marker";
                if (marker.style) {
                    marker.style.left = startPct.toFixed(2) + "%";
                    marker.style.width = widthPct.toFixed(2) + "%";
                    marker.style.backgroundColor = color;
                }
                if (typeof fragment.appendChild === "function") fragment.appendChild(marker);
            }

            markersContainer.textContent = "";
            if (typeof markersContainer.appendChild === "function") markersContainer.appendChild(fragment);
            lastMarkersKey = markersKey;
            hasMarkers = true;
        }

        syncSeekbarPosition(bar);
    }

    // ---- 3-choice settings page enhancer (On, Prompt to skip, Off) ----------------------------
    function updateButtonCheckmarks(pane, catKey) {
        if (!pane || typeof pane.querySelectorAll !== "function") return;
        var mode = getCategoryMode(catKey);
        var buttons = pane.querySelectorAll("[role='button'], button");
        if (buttons.length < 3) return;
        var onBtn = buttons[0];
        var promptBtn = buttons[1];
        var offBtn = buttons[2];

        function setCheck(btn, show) {
            var svg = btn.querySelector ? btn.querySelector("svg, [class*='check'], [idomkey*='check']") : null;
            if (svg) {
                svg.style.display = show ? "" : "none";
                svg.style.visibility = show ? "visible" : "hidden";
            }
            if (show) {
                btn.setAttribute("aria-checked", "true");
            } else {
                btn.setAttribute("aria-checked", "false");
            }
        }

        setCheck(onBtn, mode === "skip");
        setCheck(promptBtn, mode === "prompt");
        setCheck(offBtn, mode === "off");
    }

    function enhanceSettingsPane() {
        if (!document || !document.body || typeof document.querySelectorAll !== "function") return;
        var titles = document.querySelectorAll("h1, h2, h3, [class*='title'], [class*='heading']");
        var activeCat = null;
        var activeTitleEl = null;

        for (var i = 0; i < titles.length; i++) {
            var el = titles[i];
            var txt = (el.textContent || "").trim();
            if (!txt) continue;
            for (var c = 0; c < CATEGORIES.length; c++) {
                var cat = CATEGORIES[c];
                var expected = youtv.t(cat.titleKey);
                if (txt === expected || txt.indexOf(expected) !== -1 || expected.indexOf(txt) !== -1) {
                    var p = el.closest ? (el.closest("ytlr-setting-boolean-renderer, [class*='setting'], [class*='pane'], [class*='renderer']") || el.parentElement) : el.parentElement;
                    if (p && p.querySelectorAll) {
                        var btns = p.querySelectorAll("[role='button'], button");
                        if (btns.length >= 2) {
                            activeCat = cat;
                            activeTitleEl = el;
                            break;
                        }
                    }
                }
            }
            if (activeCat) break;
        }
        if (!activeCat || !activeTitleEl) return;

        var pane = activeTitleEl.closest ? (activeTitleEl.closest("ytlr-setting-boolean-renderer, [class*='setting'], [class*='pane'], [class*='renderer']") || activeTitleEl.parentElement) : activeTitleEl.parentElement;
        if (!pane || !pane.querySelectorAll) return;

        var buttons = pane.querySelectorAll("[role='button'], button");
        if (buttons.length < 2) return;

        var onBtn = buttons[0];
        var offBtn = buttons[buttons.length - 1];

        var promptBtn = pane.querySelector ? pane.querySelector(".birdy-setting-prompt-button") : null;
        if (!promptBtn && typeof onBtn.cloneNode === "function") {
            promptBtn = onBtn.cloneNode(true);
            promptBtn.className = (onBtn.className || "") + " birdy-setting-prompt-button";
            promptBtn.setAttribute("data-category", activeCat.key);

            // Replace text inside promptBtn with "Prompt to skip"
            if (typeof document.createTreeWalker === "function") {
                try {
                    var walk = document.createTreeWalker(promptBtn, NodeFilter.SHOW_TEXT, null, false);
                    var n;
                    while ((n = walk.nextNode())) {
                        if (n.nodeValue && n.nodeValue.trim()) {
                            n.nodeValue = youtv.t("sponsor.option.prompt");
                            break;
                        }
                    }
                } catch (e) {}
            } else {
                promptBtn.textContent = youtv.t("sponsor.option.prompt");
            }

            if (offBtn.parentNode && offBtn.parentNode.insertBefore) {
                offBtn.parentNode.insertBefore(promptBtn, offBtn);
            }

            var currentKey = activeCat.key;
            promptBtn.addEventListener("click", function (e) {
                if (e.preventDefault) e.preventDefault();
                if (e.stopPropagation) e.stopPropagation();
                setCategoryMode(currentKey, "prompt");
                updateButtonCheckmarks(pane, currentKey);
            }, true);

            promptBtn.addEventListener("keydown", function (e) {
                var code = e.keyCode || e.which;
                if (code === 13 || code === 23) {
                    if (e.preventDefault) e.preventDefault();
                    if (e.stopPropagation) e.stopPropagation();
                    setCategoryMode(currentKey, "prompt");
                    updateButtonCheckmarks(pane, currentKey);
                } else if (code === 38 && onBtn.focus) {
                    if (e.preventDefault) e.preventDefault();
                    if (e.stopPropagation) e.stopPropagation();
                    onBtn.focus();
                } else if (code === 40 && offBtn.focus) {
                    if (e.preventDefault) e.preventDefault();
                    if (e.stopPropagation) e.stopPropagation();
                    offBtn.focus();
                }
            }, true);

            onBtn.addEventListener("keydown", function (e) {
                var code = e.keyCode || e.which;
                if (code === 40 && promptBtn.focus) {
                    if (e.preventDefault) e.preventDefault();
                    if (e.stopPropagation) e.stopPropagation();
                    promptBtn.focus();
                }
            }, true);

            offBtn.addEventListener("keydown", function (e) {
                var code = e.keyCode || e.which;
                if (code === 38 && promptBtn.focus) {
                    if (e.preventDefault) e.preventDefault();
                    if (e.stopPropagation) e.stopPropagation();
                    promptBtn.focus();
                }
            }, true);

            onBtn.addEventListener("click", function () {
                setCategoryMode(currentKey, "skip");
                setTimeout(function () { updateButtonCheckmarks(pane, currentKey); }, 50);
            }, true);

            offBtn.addEventListener("click", function () {
                setCategoryMode(currentKey, "off");
                setTimeout(function () { updateButtonCheckmarks(pane, currentKey); }, 50);
            }, true);
        }

        updateButtonCheckmarks(pane, activeCat.key);
    }

    // ---- main playback tick -------------------------------------------------------------------
    setInterval(function () {
        if (typeof document !== "undefined" && document.hidden) return;
        var id = (feature.enabled() || (seekbarFeature && seekbarFeature.enabled())) ? currentVideoId() : null;
        if (id !== videoId) {
            videoId = id;
            segments = [];
            hidePrompt();
            clearSeekbarMarkers();
            if (id) load(id);
        }

        if (!videoId) return;
        updateSeekbarMarkers();
        if (isPromptShowing()) syncPromptPosition();

        if (!segments.length || !feature.enabled()) return;
        var video = document.querySelector("video");
        if (!video || video.paused || !isFinite(video.duration)) {
            if (isPromptShowing()) hidePrompt();
            return;
        }
        var t = video.currentTime;

        // Dismiss prompt if playback moves outside the active segment range
        if (activePromptSegment && (t < activePromptSegment.start || t >= activePromptSegment.end)) {
            hidePrompt();
        }

        for (var i = 0; i < segments.length; i++) {
            var s = segments[i];
            var mode = getCategoryMode(s.category);
            if (mode === "prompt" && s.skipped && (t < s.start - 0.5 || t >= s.end)) {
                s.skipped = false;
            }
            if (t >= s.start && t < s.end - 0.5) {
                if (mode === "off") continue;

                if (mode === "skip") {
                    if (s.skipped) continue;
                    s.skipped = true;
                    if (activePromptSegment === s) hidePrompt();
                    video.currentTime = Math.min(s.end, video.duration - 0.1);
                    showNotice(s.label);
                    youtv.report("sponsorblock: skipped " + s.label + " " + s.start.toFixed(1) + "-" + s.end.toFixed(1));
                    return;
                }

                if (mode === "prompt") {
                    if (s.skipped) continue;
                    if (activePromptSegment !== s || !isPromptShowing()) {
                        showPrompt(s);
                        if (!s.prompted) {
                            s.prompted = true;
                            youtv.report("sponsorblock: prompt shown for " + s.label + " " + s.start.toFixed(1) + "-" + s.end.toFixed(1));
                        }
                    }
                    return;
                }
            }
        }
    }, 400);
})();
