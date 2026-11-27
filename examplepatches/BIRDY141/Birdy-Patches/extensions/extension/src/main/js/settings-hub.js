// BirdyTV Settings Hub: 2-column YouTube TV (Cobalt Leanback) Settings UI.
// Left column: categories with YouTube TV rounded pill focus & thin vertical divider.
// Right column: category settings list with explicit viewport height for reliable scrolling.
// TrustedHTML-safe DOM, direct scrollTop tracking, and low-CPU optimizations.
(function () {
    if (!window.youtv) return;

    var t = window.youtv.t;
    var STORAGE_PREFIX = "yt.leanback.default::";

    var CATEGORIES = [
        { key: "sponsor", titleKey: "sponsor.sponsor.title", color: "#00D400" },
        { key: "selfpromo", titleKey: "sponsor.selfpromo.title", color: "#FFD600" },
        { key: "interaction", titleKey: "sponsor.interaction.title", color: "#CC00FF" },
        { key: "intro", titleKey: "sponsor.intro.title", color: "#00E5FF" },
        { key: "outro", titleKey: "sponsor.outro.title", color: "#304FFE" },
        { key: "preview", titleKey: "sponsor.preview.title", color: "#00B0FF" },
        { key: "music_offtopic", titleKey: "sponsor.music_offtopic.title", color: "#FF6D00" },
        { key: "filler", titleKey: "sponsor.filler.title", color: "#9C27B0" }
    ];

    var PLAYER_BUTTONS = [
        { key: "channel", titleKey: "player.channel.title" },
        { key: "description", titleKey: "player.description.title" },
        { key: "subscribe", titleKey: "player.subscribe.title" },
        { key: "like", titleKey: "player.like.title" },
        { key: "comments", titleKey: "player.comments.title" },
        { key: "ask", titleKey: "player.ask.title" },
        { key: "save", titleKey: "player.save.title" },
        { key: "thanks", titleKey: "player.thanks.title" },
        { key: "report", titleKey: "player.report.title" },
        { key: "stats", titleKey: "player.stats.title" },
        { key: "related", titleKey: "player.related.title", summaryKey: "player.related.summary" }
    ];

    var TOPIC_TABS = [
        { key: "gaming", titleKey: "topics.gaming.title" },
        { key: "music", titleKey: "topics.music.title" },
        { key: "news", titleKey: "topics.news.title" },
        { key: "sports", titleKey: "topics.sports.title" },
        { key: "podcasts", titleKey: "topics.podcasts.title" },
        { key: "movies", titleKey: "topics.movies.title" }
    ];

    // ---- Storage helpers ----------------------------------------------------------------------
    function getBool(key, def) {
        try {
            var raw = localStorage.getItem(STORAGE_PREFIX + key);
            if (raw !== null) {
                var parsed = JSON.parse(raw);
                if (parsed && typeof parsed.data === "boolean") return parsed.data;
            }
        } catch (e) {}
        return def !== undefined ? def : true;
    }

    function setBool(key, val) {
        try {
            localStorage.setItem(STORAGE_PREFIX + key, JSON.stringify({ data: !!val }));
        } catch (e) {}
    }

    function getSponsorMode(key) {
        var upper = key.toUpperCase();
        try {
            var raw = localStorage.getItem(STORAGE_PREFIX + "YOUTV_SPONSORBLOCK_" + upper + "_MODE");
            if (raw) {
                var m = JSON.parse(raw);
                if (m === "skip" || m === "prompt" || m === "off") return m;
            }
        } catch (e) {}
        var isManual = getBool("YOUTV_SPONSORBLOCK_" + upper + "_PROMPT", false);
        var isAuto = getBool("YOUTV_SPONSORBLOCK_" + upper, key === "sponsor" || key === "selfpromo" || key === "interaction");
        var globalPrompt = getBool("YOUTV_SPONSORBLOCK_PROMPT_ALL", false);
        if (isManual || (isAuto && globalPrompt)) return "prompt";
        if (isAuto) return "skip";
        return "off";
    }

    function setSponsorMode(key, mode) {
        var upper = key.toUpperCase();
        try {
            localStorage.setItem(STORAGE_PREFIX + "YOUTV_SPONSORBLOCK_" + upper + "_MODE", JSON.stringify(mode));
            if (mode === "skip") {
                setBool("YOUTV_SPONSORBLOCK_" + upper, true);
                setBool("YOUTV_SPONSORBLOCK_" + upper + "_PROMPT", false);
            } else if (mode === "prompt") {
                setBool("YOUTV_SPONSORBLOCK_" + upper, true);
                setBool("YOUTV_SPONSORBLOCK_" + upper + "_PROMPT", true);
            } else {
                setBool("YOUTV_SPONSORBLOCK_" + upper, false);
                setBool("YOUTV_SPONSORBLOCK_" + upper + "_PROMPT", false);
            }
        } catch (e) {}
    }

    // ---- SVG Icons (created via createElementNS for TrustedHTML compatibility) ----------------
    var SVG_NS = "http://www.w3.org/2000/svg";
    var ICONS = {
        sponsorblock: [
            ["path", { d: "M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z" }],
            ["path", { d: "m9 12 2 2 4-4" }]
        ],
        seekbar: [
            ["circle", { cx: "13.5", cy: "6.5", r: "0.7", fill: "currentColor" }],
            ["circle", { cx: "17.5", cy: "10.5", r: "0.7", fill: "currentColor" }],
            ["circle", { cx: "8.5", cy: "7.5", r: "0.7", fill: "currentColor" }],
            ["circle", { cx: "6.5", cy: "12.5", r: "0.7", fill: "currentColor" }],
            ["path", { d: "M12 2C6.5 2 2 6.5 2 12s4.5 10 10 10c.926 0 1.648-.746 1.648-1.688 0-.437-.18-.835-.437-1.125-.29-.289-.438-.652-.438-1.125a1.64 1.64 0 0 1 1.668-1.668h1.996c3.051 0 5.555-2.503 5.555-5.554C21.965 6.012 17.461 2 12 2z" }]
        ],
        ads: [
            ["circle", { cx: "12", cy: "12", r: "10" }],
            ["path", { d: "m4.9 4.9 14.2 14.2" }]
        ],
        player: [
            ["rect", { x: "2", y: "4", width: "20", height: "16", rx: "3" }],
            ["polygon", { points: "10 9 16 12 10 15 10 9", fill: "currentColor", stroke: "none" }]
        ],
        shorts: [
            ["polygon", { points: "13 2 3 14 12 14 11 22 21 10 12 10 13 2" }]
        ],
        ui_tweaks: [
            ["line", { x1: "4", y1: "21", x2: "4", y2: "14" }],
            ["line", { x1: "4", y1: "10", x2: "4", y2: "3" }],
            ["line", { x1: "12", y1: "21", x2: "12", y2: "12" }],
            ["line", { x1: "12", y1: "8", x2: "12", y2: "3" }],
            ["line", { x1: "20", y1: "21", x2: "20", y2: "16" }],
            ["line", { x1: "20", y1: "12", x2: "20", y2: "3" }],
            ["line", { x1: "1", y1: "14", x2: "7", y2: "14" }],
            ["line", { x1: "9", y1: "8", x2: "15", y2: "8" }],
            ["line", { x1: "17", y1: "16", x2: "23", y2: "16" }]
        ],
        ryd: [
            ["path", { d: "M17 14V2" }],
            ["path", { d: "M9 18.12 10 14H4.17a2 2 0 0 1-1.92-2.56l2.33-8A2 2 0 0 1 6.5 2H20a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2h-2.76a2 2 0 0 0-1.79 1.11L12 22h0a3.13 3.13 0 0 1-3-3.88Z" }]
        ],
        dearrow: [
            ["path", { d: "M5 12h14" }],
            ["path", { d: "m13 6 6 6-6 6" }],
            ["circle", { cx: "5", cy: "12", r: "1.5", fill: "currentColor" }]
        ],
        about: [
            ["circle", { cx: "12", cy: "12", r: "10" }],
            ["line", { x1: "12", y1: "16", x2: "12", y2: "12" }],
            ["line", { x1: "12", y1: "8", x2: "12.01", y2: "8" }]
        ]
    };

    function createSvgIcon(shapes) {
        var svg = document.createElementNS(SVG_NS, "svg");
        svg.setAttribute("viewBox", "0 0 24 24");
        svg.setAttribute("fill", "none");
        svg.setAttribute("stroke", "currentColor");
        svg.setAttribute("stroke-width", "2");
        svg.setAttribute("stroke-linecap", "round");
        svg.setAttribute("stroke-linejoin", "round");
        for (var i = 0; i < shapes.length; i++) {
            var node = document.createElementNS(SVG_NS, shapes[i][0]);
            var attrs = shapes[i][1];
            for (var k in attrs) {
                if (Object.prototype.hasOwnProperty.call(attrs, k)) {
                    node.setAttribute(k, attrs[k]);
                }
            }
            svg.appendChild(node);
        }
        return svg;
    }

    // ---- Styles (YouTube TV Settings UI) ------------------------------------------------------
    var sheet = new CSSStyleSheet();
    try {
        sheet.replaceSync(
            ".birdy-yt-screen {" +
            " position: fixed; left: 0; top: 0; width: 100vw; height: 100vh; z-index: 2147483647;" +
            " background: #000000; color: #f5f5f5; display: none; flex-direction: column;" +
            " font-family: 'YouTube Sans', Roboto, Arial, sans-serif; box-sizing: border-box; }" +
            ".birdy-yt-screen.show { display: flex; }" +
            ".birdy-yt-topbar {" +
            " display: flex; align-items: center; justify-content: space-between; height: 92px; box-sizing: border-box;" +
            " padding: 2rem 3.5rem 1rem; border-bottom: 1px solid rgba(255, 255, 255, 0.08); flex-shrink: 0; }" +
            ".birdy-yt-page-title { font-size: 2.2rem; font-weight: 700; margin: 0; color: #ffffff; letter-spacing: -0.01em; }" +
            ".birdy-yt-hint { font-size: 0.96rem; color: rgba(255, 255, 255, 0.5); font-weight: 500; }" +
            ".birdy-yt-main {" +
            " display: flex; height: calc(100vh - 92px); box-sizing: border-box;" +
            " padding: 1.25rem 3.5rem 2rem; gap: 2.5rem; overflow: hidden; }" +
            ".birdy-yt-sidebar {" +
            " position: relative; width: 320px; height: 100%; box-sizing: border-box; flex-shrink: 0;" +
            " overflow: hidden; border-right: 1px solid rgba(255, 255, 255, 0.1);" +
            " padding: 0.25rem 1.5rem 2rem 0; }" +
            ".birdy-yt-sec {" +
            " font-size: 0.78rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase;" +
            " color: rgba(255, 255, 255, 0.45); padding: 0.35rem 1rem 0.55rem; flex-shrink: 0; }" +
            ".birdy-yt-cat {" +
            " display: flex; align-items: center; gap: 0.95rem; padding: 0.9rem 1.15rem; border-radius: 12px;" +
            " font-size: 1.12rem; font-weight: 500; color: #cccccc; border: 1px solid transparent; cursor: pointer; flex-shrink: 0; }" +
            ".birdy-yt-cat-icon { width: 22px; height: 22px; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }" +
            ".birdy-yt-cat-icon svg { width: 20px; height: 20px; }" +
            ".birdy-yt-cat.active { background: #0a0a0a; border-color: rgba(255, 255, 255, 0.22); color: #ffffff; font-weight: 600; }" +
            ".birdy-yt-cat.birdy-focus { background: #ffffff; border-color: #ffffff; color: #000000; font-weight: 700; box-shadow: 0 0 18px rgba(255, 255, 255, 0.18); }" +
            ".birdy-yt-content {" +
            " position: relative; flex: 1; height: 100%; box-sizing: border-box;" +
            " overflow: hidden; padding: 0.25rem 0.5rem 2rem 0; }" +
            ".birdy-yt-list-inner {" +
            " position: relative; display: flex; flex-direction: column; gap: 0.55rem;" +
            " transition: transform 140ms ease-out; }" +
            ".birdy-yt-cat-header {" +
            " font-size: 1.5rem; font-weight: 700; color: #ffffff; margin: 0 0 0.65rem; padding: 0 0.25rem; flex-shrink: 0; }" +
            ".birdy-yt-restart-banner {" +
            " margin: 0 0 0.6rem; padding: 0.85rem 1.25rem; border-radius: 12px;" +
            " background: #051322; border: 1px solid #3ea6ff;" +
            " color: #7cc4ff; font-size: 1rem; font-weight: 600; flex-shrink: 0; }" +
            ".birdy-yt-row {" +
            " display: flex; align-items: center; justify-content: space-between; gap: 1.5rem;" +
            " padding: 1.05rem 1.35rem; border-radius: 14px; background: #000000; border: 1px solid rgba(255, 255, 255, 0.1);" +
            " color: #f5f5f5; flex-shrink: 0; cursor: pointer; }" +
            ".birdy-yt-row.birdy-focus { background: #ffffff; color: #000000; border-color: #ffffff; box-shadow: 0 0 22px rgba(255, 255, 255, 0.18); }" +
            ".birdy-yt-row[data-type='3way'].birdy-focus { background: #050505; border: 1.5px solid rgba(255, 255, 255, 0.55); color: #ffffff; box-shadow: 0 0 18px rgba(255, 255, 255, 0.08); }" +
            ".birdy-yt-row-left { display: flex; flex-direction: column; gap: 0.22rem; flex: 1; min-width: 0; }" +
            ".birdy-yt-row-title-wrap { display: flex; align-items: center; gap: 0.7rem; }" +
            ".birdy-yt-dot { width: 10px; height: 10px; border-radius: 50%; flex-shrink: 0; }" +
            ".birdy-yt-row-title { font-size: 1.14rem; font-weight: 500; color: inherit; }" +
            ".birdy-yt-row.birdy-focus .birdy-yt-row-title { font-weight: 700; }" +
            ".birdy-yt-row-summary { font-size: 0.92rem; color: rgba(255, 255, 255, 0.55); line-height: 1.35; }" +
            ".birdy-yt-row.birdy-focus .birdy-yt-row-summary { color: #3a3a3a; }" +
            ".birdy-yt-row[data-type='3way'].birdy-focus .birdy-yt-row-summary { color: #bbbbbb; }" +
            ".birdy-yt-switch-wrap { display: flex; align-items: center; gap: 0.85rem; flex-shrink: 0; }" +
            ".birdy-yt-switch-state { font-size: 0.94rem; font-weight: 500; color: rgba(255, 255, 255, 0.55); min-width: 64px; text-align: right; }" +
            ".birdy-yt-switch-state.on { color: #3ea6ff; font-weight: 600; }" +
            ".birdy-yt-row.birdy-focus .birdy-yt-switch-state { color: #000000; font-weight: 700; }" +
            ".birdy-yt-switch {" +
            " position: relative; width: 48px; height: 28px; border-radius: 9999px; flex-shrink: 0;" +
            " background: #1c1c1c; border: 1px solid rgba(255, 255, 255, 0.22); padding: 0; cursor: pointer; outline: none; }" +
            ".birdy-yt-switch.on { background: #3ea6ff; border-color: #3ea6ff; }" +
            ".birdy-yt-row.birdy-focus .birdy-yt-switch { background: #9a9a9a; border-color: #9a9a9a; }" +
            ".birdy-yt-row.birdy-focus .birdy-yt-switch.on { background: #000000; border-color: #000000; }" +
            ".birdy-yt-switch::after {" +
            " content: ''; position: absolute; top: 3px; left: 3px; width: 20px; height: 20px;" +
            " border-radius: 50%; background: #f1f1f1; }" +
            ".birdy-yt-switch.on::after { transform: translateX(20px); background: #ffffff; }" +
            ".birdy-yt-pills { display: flex; align-items: center; gap: 0.55rem; flex-shrink: 0; }" +
            ".birdy-yt-pill {" +
            " padding: 0.55rem 1.15rem; border-radius: 9999px; font-size: 0.94rem; font-weight: 600;" +
            " background: #000000; color: #b8b8b8; border: 1.5px solid rgba(255, 255, 255, 0.18); cursor: pointer; outline: none; }" +
            ".birdy-yt-pill.selected { background: #3ea6ff; color: #000000; border-color: #3ea6ff; font-weight: 700; }" +
            ".birdy-yt-pill.birdy-focus { background: #ffffff; color: #000000; border-color: #ffffff; font-weight: 700; transform: scale(1.04); box-shadow: 0 0 14px rgba(255, 255, 255, 0.35); }" +
            ".birdy-yt-btn {" +
            " padding: 0.95rem 1.85rem; border-radius: 9999px; font-size: 1.06rem; font-weight: 600;" +
            " background: #000000; color: #f5f5f5; border: 1.5px solid rgba(255, 255, 255, 0.25); cursor: pointer;" +
            " outline: none; align-self: flex-start; margin: 0.75rem 0 0 0.25rem; flex-shrink: 0; }" +
            ".birdy-yt-btn.birdy-focus { background: #ffffff; color: #000000; border-color: #ffffff; font-weight: 700; box-shadow: 0 0 18px rgba(255, 255, 255, 0.25); }"
        );
        document.adoptedStyleSheets = document.adoptedStyleSheets.concat([sheet]);
    } catch (e) {}

    // ---- Modal DOM & Focus Controller ---------------------------------------------------------
    var screenEl = null;
    var sidebarEl = null;
    var sidebarInnerEl = null;
    var contentEl = null;
    var contentInnerEl = null;
    var sidebarTabs = [];
    var currentRows = [];
    var focusedNodes = [];
    var restartBannerInserted = false;

    var activeTabKey = "sponsorblock";
    var focusArea = "sidebar"; // "sidebar" or "content"
    var focusSidebarIndex = 0;
    var focusContentIndex = 0;
    var focusPillIndex = 0;
    var pendingRestart = false;

    var TABS = [
        { key: "sponsorblock", labelKey: "hub.tab.sponsorblock", icon: ICONS.sponsorblock },
        { key: "seekbar", labelKey: "hub.tab.seekbar", icon: ICONS.seekbar },
        { key: "ads", labelKey: "hub.tab.ads", icon: ICONS.ads },
        { key: "player", labelKey: "hub.tab.player", icon: ICONS.player },
        { key: "shorts", labelKey: "hub.tab.shorts", icon: ICONS.shorts },
        { key: "ui_tweaks", labelKey: "hub.tab.ui_tweaks", icon: ICONS.ui_tweaks },
        { key: "dearrow", labelKey: "hub.tab.dearrow", icon: ICONS.dearrow },
        { key: "ryd", labelKey: "hub.tab.ryd", icon: ICONS.ryd },
        { key: "about", labelKey: "hub.tab.about", icon: ICONS.about }
    ];

    function createScreen() {
        if (screenEl) return;
        screenEl = document.createElement("div");
        screenEl.className = "birdy-yt-screen";

        var topbar = document.createElement("div");
        topbar.className = "birdy-yt-topbar";

        var pageTitle = document.createElement("h1");
        pageTitle.className = "birdy-yt-page-title";
        pageTitle.textContent = t("hub.title");

        var hint = document.createElement("span");
        hint.className = "birdy-yt-hint";
        hint.textContent = t("hub.nav.hint");

        topbar.appendChild(pageTitle);
        topbar.appendChild(hint);

        var main = document.createElement("div");
        main.className = "birdy-yt-main";

        sidebarEl = document.createElement("div");
        sidebarEl.className = "birdy-yt-sidebar";
        sidebarInnerEl = document.createElement("div");
        sidebarInnerEl.className = "birdy-yt-list-inner";
        sidebarEl.appendChild(sidebarInnerEl);
        buildSidebarOnce();

        contentEl = document.createElement("div");
        contentEl.className = "birdy-yt-content";
        contentInnerEl = document.createElement("div");
        contentInnerEl.className = "birdy-yt-list-inner";
        contentEl.appendChild(contentInnerEl);

        main.appendChild(sidebarEl);
        main.appendChild(contentEl);
        screenEl.appendChild(topbar);
        screenEl.appendChild(main);
        document.body.appendChild(screenEl);
    }

    function buildSidebarOnce() {
        sidebarInnerEl.textContent = "";
        sidebarTabs = [];

        var sec = document.createElement("div");
        sec.className = "birdy-yt-sec";
        sec.textContent = t("section.title", { brand: window.__youtvBranding || "BirdyTV" });
        sidebarInnerEl.appendChild(sec);

        for (var i = 0; i < TABS.length; i++) {
            (function (tab, idx) {
                var el = document.createElement("div");
                el.className = "birdy-yt-cat" + (tab.key === activeTabKey ? " active" : "");
                el.setAttribute("data-key", tab.key);

                var iconWrap = document.createElement("span");
                iconWrap.className = "birdy-yt-cat-icon";
                iconWrap.appendChild(createSvgIcon(tab.icon));

                var label = document.createElement("span");
                label.textContent = t(tab.labelKey);

                el.appendChild(iconWrap);
                el.appendChild(label);
                el.onclick = function () {
                    selectTab(idx);
                    focusArea = "sidebar";
                    updateFocusUI();
                };
                sidebarInnerEl.appendChild(el);
                sidebarTabs.push(el);
            })(TABS[i], i);
        }
    }

    function updateSidebarActive() {
        for (var i = 0; i < sidebarTabs.length; i++) {
            sidebarTabs[i].classList.toggle("active", TABS[i].key === activeTabKey);
        }
    }

    function selectTab(idx) {
        if (idx < 0 || idx >= TABS.length) return;
        focusSidebarIndex = idx;
        var nextKey = TABS[idx].key;
        if (activeTabKey !== nextKey) {
            activeTabKey = nextKey;
            updateSidebarActive();
            renderContent();
        }
    }

    function addRestartBannerIfNeeded() {
        if (!pendingRestart || restartBannerInserted || !contentInnerEl) return;
        restartBannerInserted = true;
        var banner = document.createElement("div");
        banner.className = "birdy-yt-restart-banner";
        banner.textContent = t("restart.message");

        var head = contentInnerEl.querySelector(".birdy-yt-cat-header");
        if (head && head.nextSibling) {
            contentInnerEl.insertBefore(banner, head.nextSibling);
        } else {
            contentInnerEl.appendChild(banner);
        }

        if (activeTabKey !== "about") {
            var restartBtn = createRestartButton();
            contentInnerEl.appendChild(restartBtn);
            currentRows.push(restartBtn);
        }
    }

    function createRestartButton() {
        var restartBtn = document.createElement("button");
        restartBtn.className = "birdy-yt-btn";
        restartBtn.textContent = t("hub.restart_app");
        restartBtn.onclick = function () {
            location.reload();
        };
        return restartBtn;
    }

    function renderContent() {
        if (!contentInnerEl) return;
        contentInnerEl.textContent = "";
        contentInnerEl._scrollY = 0;
        contentInnerEl.style.transform = "translateY(0px)";
        currentRows = [];
        restartBannerInserted = false;

        var frag = document.createDocumentFragment();
        var currentTab = TABS[focusSidebarIndex];
        if (currentTab) {
            var head = document.createElement("h2");
            head.className = "birdy-yt-cat-header";
            head.textContent = t(currentTab.labelKey);
            frag.appendChild(head);
        }

        if (pendingRestart) {
            restartBannerInserted = true;
            var banner = document.createElement("div");
            banner.className = "birdy-yt-restart-banner";
            banner.textContent = t("restart.message");
            frag.appendChild(banner);
        }

        if (activeTabKey === "sponsorblock") {
            appendRow(frag, createToggleRow(
                t("feature.sponsorblock.name"),
                t("feature.sponsorblock.summary"),
                "YOUTV_SPONSORBLOCK",
                true
            ));
            appendRow(frag, createToggleRow(
                t("sponsor.prompt_all.title"),
                t("sponsor.prompt_all.summary"),
                "YOUTV_SPONSORBLOCK_PROMPT_ALL",
                false
            ));
            for (var i = 0; i < CATEGORIES.length; i++) {
                appendRow(frag, createThreeWayRow(CATEGORIES[i]));
            }
        } else if (activeTabKey === "seekbar") {
            appendRow(frag, createToggleRow(
                t("feature.sponsorblock_colors.name"),
                t("feature.sponsorblock_colors.summary"),
                "YOUTV_SPONSORBLOCK_COLORS",
                true
            ));
            for (var j = 0; j < CATEGORIES.length; j++) {
                var cat = CATEGORIES[j];
                var key = "YOUTV_SPONSORBLOCK_COLORS_" + cat.key.toUpperCase() + "_SEEKBAR";
                var def = cat.key === "sponsor" || cat.key === "selfpromo" || cat.key === "interaction";
                appendRow(frag, createToggleRow(
                    t(cat.titleKey),
                    t("sponsor." + cat.key + ".seekbar.summary"),
                    key,
                    def,
                    false,
                    cat.color
                ));
            }
        } else if (activeTabKey === "ads") {
            appendRow(frag, createToggleRow(
                t("feature.ads.name"),
                t("feature.ads.summary"),
                "YOUTV_ADS",
                true
            ));
            appendRow(frag, createToggleRow(
                t("feature.premium-promos.name"),
                t("feature.premium-promos.summary"),
                "YOUTV_PREMIUM_PROMOS",
                true
            ));
        } else if (activeTabKey === "player") {
            appendRow(frag, createToggleRow(
                t("feature.player.name"),
                t("feature.player.summary"),
                "YOUTV_PLAYER",
                true
            ));
            for (var k = 0; k < PLAYER_BUTTONS.length; k++) {
                var btn = PLAYER_BUTTONS[k];
                appendRow(frag, createToggleRow(
                    t(btn.titleKey),
                    btn.summaryKey ? t(btn.summaryKey) : "",
                    "YOUTV_PLAYER_" + btn.key.toUpperCase(),
                    false
                ));
            }
        } else if (activeTabKey === "shorts") {
            appendRow(frag, createToggleRow(
                t("feature.shorts.name"),
                t("feature.shorts.summary"),
                "YOUTV_SHORTS",
                true,
                true
            ));
        } else if (activeTabKey === "ui_tweaks") {
            appendRow(frag, createToggleRow(
                t("feature.topics.name"),
                t("feature.topics.summary"),
                "YOUTV_TOPICS",
                false,
                true
            ));
            for (var m = 0; m < TOPIC_TABS.length; m++) {
                (function (topic) {
                    var key = "YOUTV_TOPICS_HIDE_" + topic.key.toUpperCase();
                    var current = getBool(key, true) ? "remove" : "keep";
                    appendRow(frag, createPillRow(
                        t(topic.titleKey),
                        null,
                        [
                            { id: "keep", text: t("hub.action.keep") },
                            { id: "remove", text: t("hub.action.remove") }
                        ],
                        current,
                        function (id) {
                            setBool(key, id === "remove");
                            pendingRestart = true;
                            addRestartBannerIfNeeded();
                        }
                    ));
                })(TOPIC_TABS[m]);
            }
        } else if (activeTabKey === "dearrow") {
            appendRow(frag, createToggleRow(
                t("feature.dearrow.name"),
                t("feature.dearrow.summary"),
                "YOUTV_DEARROW",
                true
            ));
            appendRow(frag, createToggleRow(
                t("dearrow.titles.title"),
                t("dearrow.titles.summary"),
                "YOUTV_DEARROW_TITLES",
                true
            ));
            appendRow(frag, createToggleRow(
                t("dearrow.thumbnails.title"),
                t("dearrow.thumbnails.summary"),
                "YOUTV_DEARROW_THUMBNAILS",
                true
            ));
            appendRow(frag, createToggleRow(
                t("dearrow.show_title_icon.title"),
                t("dearrow.show_title_icon.summary"),
                "YOUTV_DEARROW_SHOW_TITLE_ICON",
                true
            ));
            appendRow(frag, createToggleRow(
                t("dearrow.show_thumb_icon.title"),
                t("dearrow.show_thumb_icon.summary"),
                "YOUTV_DEARROW_SHOW_THUMB_ICON",
                true
            ));
            appendRow(frag, createToggleRow(
                t("dearrow.cleanup_titles.title"),
                t("dearrow.cleanup_titles.summary"),
                "YOUTV_DEARROW_CLEANUP_TITLES",
                false
            ));
        } else if (activeTabKey === "ryd") {
            appendRow(frag, createToggleRow(
                t("feature.ryd.name"),
                t("feature.ryd.summary"),
                "YOUTV_RYD",
                true
            ));
        } else if (activeTabKey === "about") {
            var repoRow = document.createElement("div");
            repoRow.className = "birdy-yt-row";
            var ver = window.__farotvVersion ? "v" + window.__farotvVersion : "";
            var ytVer = window.__youtubeVersion ? "YouTube TV " + window.__youtubeVersion : "Android TV Cobalt";
            var repoLeft = document.createElement("div");
            repoLeft.className = "birdy-yt-row-left";
            var repoTitle = document.createElement("span");
            repoTitle.className = "birdy-yt-row-title";
            repoTitle.textContent = (window.__youtvBranding || "BirdyTV") + (ver ? " " + ver : "");
            var repoSummary = document.createElement("span");
            repoSummary.className = "birdy-yt-row-summary";
            repoSummary.textContent = "BIRDY141/Birdy-Patches • " + ytVer;
            repoLeft.appendChild(repoTitle);
            repoLeft.appendChild(repoSummary);
            repoRow.appendChild(repoLeft);
            frag.appendChild(repoRow);
        }

        if (pendingRestart || activeTabKey === "about") {
            appendRow(frag, createRestartButton());
        }

        contentInnerEl.appendChild(frag);
    }

    function appendRow(frag, row) {
        frag.appendChild(row);
        currentRows.push(row);
    }

    function createPillRow(titleText, dotColor, options, currentId, onSelect) {
        var row = document.createElement("div");
        row.className = "birdy-yt-row";
        row.setAttribute("data-type", "3way");

        var left = document.createElement("div");
        left.className = "birdy-yt-row-left";
        var titleWrap = document.createElement("div");
        titleWrap.className = "birdy-yt-row-title-wrap";
        if (dotColor) {
            var dot = document.createElement("span");
            dot.className = "birdy-yt-dot";
            dot.style.backgroundColor = dotColor;
            titleWrap.appendChild(dot);
        }
        var rowTitle = document.createElement("span");
        rowTitle.className = "birdy-yt-row-title";
        rowTitle.textContent = titleText;
        titleWrap.appendChild(rowTitle);
        left.appendChild(titleWrap);

        var pillGroup = document.createElement("div");
        pillGroup.className = "birdy-yt-pills";

        var pills = [];
        for (var i = 0; i < options.length; i++) {
            (function (opt, idx) {
                var pill = document.createElement("button");
                pill.className = "birdy-yt-pill" + (currentId === opt.id ? " selected" : "");
                pill.textContent = opt.text;
                pill.onclick = function () {
                    onSelect(opt.id);
                    for (var p = 0; p < pills.length; p++) {
                        pills[p].classList.toggle("selected", p === idx);
                    }
                    focusPillIndex = idx;
                    updateFocusUI();
                };
                pillGroup.appendChild(pill);
                pills.push(pill);
            })(options[i], i);
        }

        row._pills = pills;
        row.appendChild(left);
        row.appendChild(pillGroup);
        return row;
    }

    function createThreeWayRow(cat) {
        return createPillRow(
            t(cat.titleKey),
            cat.color,
            [
                { id: "skip", text: t("hub.action.skip") },
                { id: "prompt", text: t("hub.action.prompt") },
                { id: "off", text: t("hub.action.off") }
            ],
            getSponsorMode(cat.key),
            function (id) {
                setSponsorMode(cat.key, id);
            }
        );
    }

    function createToggleRow(titleText, summaryText, storageKey, defaultVal, needsRestart, dotColor) {
        var isEnabled = getBool(storageKey, defaultVal);
        var row = document.createElement("div");
        row.className = "birdy-yt-row";
        row.setAttribute("data-type", "toggle");

        var left = document.createElement("div");
        left.className = "birdy-yt-row-left";

        var titleWrap = document.createElement("div");
        titleWrap.className = "birdy-yt-row-title-wrap";
        if (dotColor) {
            var dot = document.createElement("span");
            dot.className = "birdy-yt-dot";
            dot.style.backgroundColor = dotColor;
            titleWrap.appendChild(dot);
        }
        var rowTitle = document.createElement("span");
        rowTitle.className = "birdy-yt-row-title";
        rowTitle.textContent = titleText;
        titleWrap.appendChild(rowTitle);
        left.appendChild(titleWrap);

        if (summaryText) {
            var rowSummary = document.createElement("span");
            rowSummary.className = "birdy-yt-row-summary";
            rowSummary.textContent = summaryText;
            left.appendChild(rowSummary);
        }

        var wrap = document.createElement("div");
        wrap.className = "birdy-yt-switch-wrap";

        var stateLabel = document.createElement("span");
        stateLabel.className = "birdy-yt-switch-state" + (isEnabled ? " on" : "");
        stateLabel.textContent = isEnabled ? t("hub.enabled") : t("hub.disabled");

        var switchBtn = document.createElement("button");
        switchBtn.className = "birdy-yt-switch" + (isEnabled ? " on" : "");
        switchBtn.setAttribute("aria-label", stateLabel.textContent);

        function applyToggle() {
            isEnabled = !isEnabled;
            setBool(storageKey, isEnabled);
            switchBtn.classList.toggle("on", isEnabled);
            stateLabel.classList.toggle("on", isEnabled);
            var txt = isEnabled ? t("hub.enabled") : t("hub.disabled");
            stateLabel.textContent = txt;
            switchBtn.setAttribute("aria-label", txt);
            if (needsRestart) {
                pendingRestart = true;
                addRestartBannerIfNeeded();
            }
        }

        row.onclick = function () {
            applyToggle();
        };
        row._toggle = applyToggle;

        wrap.appendChild(stateLabel);
        wrap.appendChild(switchBtn);
        row.appendChild(left);
        row.appendChild(wrap);
        return row;
    }

    function syncPillIndexToSelected(row) {
        if (!row || !row._pills) {
            focusPillIndex = 0;
            return;
        }
        for (var i = 0; i < row._pills.length; i++) {
            if (row._pills[i].classList.contains("selected")) {
                focusPillIndex = i;
                return;
            }
        }
        focusPillIndex = 0;
    }

    // ---- Scroll & Focus Controller ------------------------------------------------------------
    function ensureVisible(viewport, inner, el, isFirst) {
        if (!viewport || !inner || !el) return;
        if (isFirst) {
            inner._scrollY = 0;
            inner.style.transform = "translateY(0px)";
            return;
        }
        var viewH = viewport.clientHeight;
        if (!viewH) return;
        var elTop = el.offsetTop;
        var elBottom = elTop + el.offsetHeight;
        var curY = inner._scrollY || 0;
        var pad = 28;
        var nextY = curY;
        if (elTop - pad < curY) {
            nextY = Math.max(0, elTop - pad);
        } else if (elBottom + pad > curY + viewH) {
            nextY = elBottom + pad - viewH;
        }
        if (nextY !== curY) {
            inner._scrollY = nextY;
            inner.style.transform = "translateY(-" + nextY + "px)";
        }
    }

    function clearFocusedNodes() {
        for (var i = 0; i < focusedNodes.length; i++) {
            focusedNodes[i].classList.remove("birdy-focus");
        }
        focusedNodes.length = 0;
    }

    function addFocusedNode(el) {
        if (!el) return;
        el.classList.add("birdy-focus");
        focusedNodes.push(el);
    }

    function updateFocusUI() {
        if (!screenEl) return;
        clearFocusedNodes();

        if (focusArea === "sidebar") {
            var tab = sidebarTabs[focusSidebarIndex];
            if (tab) {
                addFocusedNode(tab);
                ensureVisible(sidebarEl, sidebarInnerEl, tab, focusSidebarIndex === 0);
            }
        } else {
            if (!currentRows.length) return;
            if (focusContentIndex >= currentRows.length) focusContentIndex = currentRows.length - 1;
            var targetRow = currentRows[focusContentIndex];
            if (!targetRow) return;

            addFocusedNode(targetRow);
            if (targetRow._pills && targetRow._pills[focusPillIndex]) {
                addFocusedNode(targetRow._pills[focusPillIndex]);
            }
            ensureVisible(contentEl, contentInnerEl, targetRow, focusContentIndex === 0);
        }
    }

    function stopEvent(e) {
        e.preventDefault();
        e.stopPropagation();
        if (e.stopImmediatePropagation) e.stopImmediatePropagation();
    }

    function onKeyDown(e) {
        if (!isHubOpen()) return;
        var code = e.keyCode || e.which;

        // BACK: 27 (Escape), 4 (Android Back), 10009 (Tizen Back)
        if (code === 27 || code === 4 || code === 10009 || e.key === "Escape" || e.key === "GoBack" || e.key === "BrowserBack") {
            stopEvent(e);
            if (focusArea === "content") {
                focusArea = "sidebar";
                updateFocusUI();
            } else {
                closeHub();
            }
            return;
        }

        if (focusArea === "sidebar") {
            if (code === 38) { // UP
                stopEvent(e);
                if (focusSidebarIndex > 0) {
                    selectTab(focusSidebarIndex - 1);
                    updateFocusUI();
                }
            } else if (code === 40) { // DOWN
                stopEvent(e);
                if (focusSidebarIndex < TABS.length - 1) {
                    selectTab(focusSidebarIndex + 1);
                    updateFocusUI();
                }
            } else if (code === 39 || code === 13 || code === 23) { // RIGHT or OK
                stopEvent(e);
                if (currentRows.length > 0) {
                    focusArea = "content";
                    focusContentIndex = 0;
                    syncPillIndexToSelected(currentRows[0]);
                    updateFocusUI();
                }
            }
        } else {
            var curRow = currentRows[focusContentIndex];

            if (code === 38) { // UP
                stopEvent(e);
                if (focusContentIndex > 0) {
                    focusContentIndex--;
                    syncPillIndexToSelected(currentRows[focusContentIndex]);
                    updateFocusUI();
                }
            } else if (code === 40) { // DOWN
                stopEvent(e);
                if (focusContentIndex < currentRows.length - 1) {
                    focusContentIndex++;
                    syncPillIndexToSelected(currentRows[focusContentIndex]);
                    updateFocusUI();
                }
            } else if (code === 37) { // LEFT
                stopEvent(e);
                if (curRow && curRow._pills && focusPillIndex > 0) {
                    focusPillIndex--;
                    updateFocusUI();
                } else {
                    focusArea = "sidebar";
                    updateFocusUI();
                }
            } else if (code === 39) { // RIGHT
                stopEvent(e);
                if (curRow && curRow._pills && focusPillIndex < curRow._pills.length - 1) {
                    focusPillIndex++;
                    updateFocusUI();
                }
            } else if (code === 13 || code === 23) { // OK / ENTER
                stopEvent(e);
                if (curRow && curRow._pills && curRow._pills[focusPillIndex]) {
                    curRow._pills[focusPillIndex].click();
                } else if (curRow && curRow._toggle) {
                    curRow._toggle();
                } else if (curRow) {
                    curRow.click();
                }
            }
        }
    }

    function isHubOpen() {
        return !!(screenEl && screenEl.classList.contains("show"));
    }

    function openHub(initialTab) {
        createScreen();
        if (initialTab) {
            for (var i = 0; i < TABS.length; i++) {
                if (TABS[i].key === initialTab) {
                    activeTabKey = initialTab;
                    focusSidebarIndex = i;
                    break;
                }
            }
        }
        screenEl.classList.add("show");
        updateSidebarActive();
        renderContent();
        focusArea = "sidebar";
        updateFocusUI();

        window.removeEventListener("keydown", onKeyDown, true);
        window.addEventListener("keydown", onKeyDown, true);
        window.removeEventListener("keyup", stopEvent, true);
        window.addEventListener("keyup", stopEvent, true);
        youtv.report("settings-hub: opened");
    }

    function closeHub() {
        if (!screenEl) return;
        screenEl.classList.remove("show");
        window.removeEventListener("keydown", onKeyDown, true);
        setTimeout(function () {
            window.removeEventListener("keyup", stopEvent, true);
        }, 250);
        youtv.report("settings-hub: closed");
    }

    window.birdyTvSettingsHub = {
        open: openHub,
        close: closeHub,
        isOpen: isHubOpen
    };

    window.addEventListener("keydown", function (e) {
        if (isHubOpen()) return;
        var code = e.keyCode || e.which;
        if (code === 113 /* F2 */) {
            stopEvent(e);
            openHub();
        }
    }, true);
})();
