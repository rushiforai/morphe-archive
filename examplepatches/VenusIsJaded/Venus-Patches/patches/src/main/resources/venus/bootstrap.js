/* Venus Patches: bundled, offline runtime. No remote code or full client mod required. */
(function (global) {
    "use strict";
    if (global.__venusPatches) return;
    const features = /*__FEATURES__*/;
    // Inspected Metro IDs for the SHA-256-pinned 350.8 bundle; never scan or eagerly require modules.
    // Metro IDs Venus wraps, as a dense table: decorateDefine checks it for all ~17.7k modules at startup, and an
    // indexed read is ~3x cheaper than Set.has on Hermes. 120 is RN's initializer.
    // IDs past the end read as undefined, so a module added in a later bundle is simply left alone.
    const targetModules = new Uint8Array(32768);
    function selectModules(ids) { for (let i = 0; i < ids.length; i++) targetModules[ids[i]] = 1; }
    selectModules([17, 19, 120, 1162, 2129, 10664, 14839, 14971]);
    if (features.picker) targetModules[414] = 1;
    if (features.voice) selectModules([1295, 7752, 7755]);
    if (features.copyBios) targetModules[10615] = 1;
    if (features.dashless) selectModules([2065, 5421, 5412, 7365]);
    if (features.favouriteAnything) selectModules([13066, 9732, 9735]);
    if (features.freeNitro) selectModules([1390, 2065, 5987, 6030, 4769, 14299, 7047, 7174]);
    if (features.noTyping) targetModules[11668] = 1;
    if (features.quickDelete) selectModules([5300, 1126]);
    if (features.noDelete) selectModules([584, 5432, 5434, 1390, 2065, 7174, 7742]);
    if (features.jumpToTop) selectModules([11968, 11969, 11970, 9379, 7174, 5432]);
    if (features.hiddenChannels) selectModules([1085, 1096, 1112, 2065, 2116, 4748, 7246, 4750, 5421, 7174, 584, 1390, 16671, 8218]);
    if (features.pastelize) selectModules([7742, 1264, 2125]);
    if (features.platformIndicators) selectModules([5108, 5112, 1390, 2065, 10533, 10229, 12862, 16475, 8792, 14419, 13156]);
    if (features.reviewDB) selectModules([13181, 14213, 14281, 10725, 6265, 6896, 1390, 584]);
    if (features.readAll) targetModules[16754] = 1;
    if (features.quests) selectModules([584, 7386, 9699, 13933, 13968]);
    if (features.badges) selectModules([584, 1390, 5759, 8312, 9699, 13933, 13968]);
    if (features.hideGift) selectModules([11935, 12146]);
    if (features.hideQuestDock) selectModules([15371, 15465]);
    if (features.hideButtons) selectModules([9115, 10028]);
    if (features.systemEmoji) targetModules[6820] = 1;
    if (features.gestures) selectModules([7982, 9434, 12837, 11990, 1390, 10694]);
    if (features.hideCall) targetModules[13425] = 1;
    if (features.validUser) selectModules([584, 1390]);
    if (features.youBarSettings) targetModules[16858] = 1;
    if (features.splitMessages) selectModules([1085, 1390, 2065, 7174, 9255]);
    if (features.translate) selectModules([584, 1390, 5432, 7742, 9675, 10368]);
    if (features.userNotif) selectModules([584, 1390, 2065, 2087, 4760, 5108, 9699, 13933, 13968]);
    if (features.accountSwitcher) selectModules([1390, 5938, 6623, 12129, 12130, 12131, 16387, 16840, 16858]);
    if (features.appIcons) selectModules([1390, 4769, 9464, 14299, 15831, 15832, 17697, 18051]);
    if (features.nitroThemes) selectModules([584, 1390, 2046, 4769, 4937, 14299, 15566]);
    if (features.customThemes) selectModules([589, 590, 591, 1205, 4831, 11191, 10368]);
    if (features.iconPacks) selectModules([81, 84, 328, 1205, 4817, 4831, 11191]);
    if (features.messageHighlight) selectModules([584, 1390, 5432, 7742]);
    if (features.serverInfo) selectModules([1390, 16748]);
    if (features.fixEmbeds) selectModules([1390, 7174]);
    if (features.tenorGifs) selectModules([1295, 9733]);
    const revision = "1.18.0";
    // The Discord build these patches are pinned to (DiscordPatches.kt compatibleWith); shown on the About page.
    const DISCORD_VERSION = "350.8";
    // Module 120 owns setUpDefaltReactNativeEnvironment in this exact asset.
    // Defer every feature hook until that initializer returns successfully.
    let environmentReady = false;
    const deferred = new Map();
    // Every feature starts off: nothing changes in Discord until you turn it on. Options inside a feature keep
    // their own defaults, so turning a feature on does what it says straight away.
    const settings = { picker: false, voice: false, copyBios: false, dashless: false, favouriteAnything: false, freeNitro: false, emojis: true, stickers: true, hyperlinks: true,
        noTyping: false, quickDelete: false, noDelete: false, noDeleteSave: false, noDeleteLimit: 512, noDeleteEdits: true, noDeleteColor: "default", noDeleteBrightness: 50,
        jumpToTop: false, hiddenChannels: false, hiddenChannelsMenu: true, pastelize:false, pastelAll:false, pastelContent:false, platformIndicators:false, piDmHeader:true, piUserList:true, piProfile:true, piHideMobile:true, reviewDB:false, reviewWarning:true, readAll:false, readAllMode:"guilds",
        quests:false, questsVideo:true, questsPlay:true, questsActivity:true, questsEnroll:true,
        badges:false, badgesGameTime:true, badgesUniqueGames:true, badgesCycleMinutes:15, badgesGamesAtOnce:2, systemFont:false,
        hideGift:false, hideQuestDock:false, hideButtons:false, hideButtonsQuests:true, hideButtonsShop:true, hideButtonsNitro:true, hideButtonsApps:true, hideButtonsPolls:false, hideButtonsPhotos:false, systemEmoji:false, gestures:false, gestureOwn:"edit", gestureTripleDelete:true, hideCall:false,
        validUser:false, youBarSettings:false, splitMessages:false,
        translate:false, translateTarget:"discord", translateLanguage:"en", translateMode:"auto", translateAsk:"both", translateNote:true, translateOriginal:false,
        userNotif:false, userNotifFriends:true, userNotifStatus:true, userNotifMessages:true, userNotifTyping:true, userNotifPush:false,
        accountSwitcher:false, accountSwitcherYouBar:true, appIcons:false, nitroThemes:false, customThemes:false, customThemesBackground:true,
        iconPacks:false, iconPacksTheme:true,
        messageHighlight:false, messageHighlightThickness:2, messageHighlightBrightness:50, messageHighlightPingColor:"default", serverInfo:false, serverInfoFriends:true,
        fixEmbeds:false, fixEmbedsSites:"", fixEmbedsClean:true, tenorGifs:false, tenorGifsSource:"both", language:"auto" };
    // The settings every feature starts from, for Reset to defaults on the Backup page.
    let DEFAULT_SETTINGS = null;
    function defaultSettings() {
        return DEFAULT_SETTINGS || (DEFAULT_SETTINGS = Object.freeze({
            picker: false, voice: false, copyBios: false, dashless: false, favouriteAnything: false, freeNitro: false, emojis: true, stickers: true, hyperlinks: true,
            noTyping: false, quickDelete: false, noDelete: false, noDeleteSave: false, noDeleteLimit: 512, noDeleteEdits: true, noDeleteColor: "default", noDeleteBrightness: 50,
            jumpToTop: false, hiddenChannels: false, hiddenChannelsMenu: true, pastelize: false, pastelAll: false, pastelContent: false, platformIndicators: false, piDmHeader: true, piUserList: true, piProfile: true, piHideMobile: true, reviewDB: false, reviewWarning: true, readAll: false, readAllMode: "guilds",
            quests: false, questsVideo: true, questsPlay: true, questsActivity: true, questsEnroll: true,
            badges: false, badgesGameTime: true, badgesUniqueGames: true, badgesCycleMinutes: 15, badgesGamesAtOnce: 2, systemFont: false,
            hideGift: false, hideQuestDock: false, hideButtons: false, hideButtonsQuests: true, hideButtonsShop: true, hideButtonsNitro: true, hideButtonsApps: true, hideButtonsPolls: false, hideButtonsPhotos: false, systemEmoji: false, gestures: false, gestureOwn: "edit", gestureTripleDelete: true, hideCall: false,
            validUser: false, youBarSettings: false, splitMessages: false,
            translate: false, translateTarget: "discord", translateLanguage: "en", translateMode: "auto", translateAsk: "both", translateNote: true, translateOriginal: false,
            userNotif: false, userNotifFriends: true, userNotifStatus: true, userNotifMessages: true, userNotifTyping: true, userNotifPush: false,
            accountSwitcher: false, accountSwitcherYouBar: true, appIcons: false, nitroThemes: false, customThemes: false, customThemesBackground: true,
            iconPacks: false, iconPacksTheme: true,
            messageHighlight: false, messageHighlightThickness: 2, messageHighlightBrightness: 50, messageHighlightPingColor: "default", serverInfo: false, serverInfoFriends: true,
            fixEmbeds: false, fixEmbedsSites: "", fixEmbedsClean: true, tenorGifs: false, tenorGifsSource: "both", language: "auto"
        }));
    }
    // Backup and restore (#68): when you last saved a backup, and whether a restore is being applied right now.
    const backup = {last:0, busy:"", restoring:false};
    // First-run setup on the Features list: done once any feature has been on, or after Not now. justOn is this session's
    // one-tap result (the keys it switched on), so Undo can put exactly those back.
    const starter = {done:false, justOn:null};
    // What you typed in the Features list's search bar (#68).
    const featureSearch = {query:"", rows:[], listeners:new Set(), cache:null};
    const status = { picker: false, attachment: false, request: false, menu: false, conversion: false, audioError: "", storage: "waiting" };
    const listeners = new Set();
    const dirty = new Set();
    const sizeCache = new Map();
    const sizeQueue = [];
    const pendingVoice = new Map();
    const markedPayloads = new WeakMap();
    const wrapped = new WeakMap();
    // React Native installs Promise during its polyfill phase; no Promise use in this prelude.
    let React, RN, files, activeReads = 0, writePending = false, nextSave;
    const conversions = new WeakMap();
    const readyUploads = new WeakMap();
    const activeJobs = new Map();
    let jobCounter = 0;
    const PREFS = "venus-patches.json";
    const MAX_DELETED = 5000, ARCHIVE_BYTES = 32 * 1024 * 1024;
    // What the Read all button clears: servers, DMs, or both.
    const READ_ALL_MODES = ["guilds", "dms", "both"];
    // What double-tapping your own message does: edit it, or reply like anyone else's.
    const GESTURE_OWN_MODES = ["edit", "reply"];
    // Which language Translate messages translates into: Discord's own language, the phone's, or one you pick (#79).
    const TRANSLATE_TARGETS = ["discord", "phone", "custom"];
    // The languages you can pick for "Another language", as Google Translate codes (#79). Chinese comes in both scripts.
    const TRANSLATE_LANGUAGES = ["af", "ar", "bg", "bn", "ca", "cs", "cy", "da", "de", "el", "en", "eo", "es", "et", "fa", "fi", "fil", "fr",
        "ga", "gl", "gu", "he", "hi", "hr", "hu", "hy", "id", "is", "it", "ja", "jv", "ka", "kk", "km", "ko", "la", "lt", "lv", "mk", "ml", "mn",
        "mr", "ms", "my", "ne", "nl", "no", "pa", "pl", "pt", "ro", "ru", "sk", "sl", "sq", "sr", "sv", "sw", "ta", "te", "th", "tr", "uk", "ur",
        "uz", "vi", "zh-CN", "zh-TW"];
    // Each language in its own words, like the Language page lists Venus's languages (#82): you find yours whatever
    // language Venus is shown in. The name in Venus's language goes under it.
    const TRANSLATE_NATIVE = {
        af:"Afrikaans", ar:"\u0627\u0644\u0639\u0631\u0628\u064a\u0629", bg:"\u0411\u044a\u043b\u0433\u0430\u0440\u0441\u043a\u0438",
        bn:"\u09ac\u09be\u0982\u09b2\u09be", ca:"Catal\u00e0", cs:"\u010ce\u0161tina", cy:"Cymraeg", da:"Dansk", de:"Deutsch",
        el:"\u0395\u03bb\u03bb\u03b7\u03bd\u03b9\u03ba\u03ac", en:"English", eo:"Esperanto", es:"Espa\u00f1ol", et:"Eesti",
        fa:"\u0641\u0627\u0631\u0633\u06cc", fi:"Suomi", fil:"Filipino", fr:"Fran\u00e7ais", ga:"Gaeilge", gl:"Galego",
        gu:"\u0a97\u0ac1\u0a9c\u0ab0\u0abe\u0aa4\u0ac0", he:"\u05e2\u05d1\u05e8\u05d9\u05ea", hi:"\u0939\u093f\u0928\u094d\u0926\u0940",
        hr:"Hrvatski", hu:"Magyar", hy:"\u0540\u0561\u0575\u0565\u0580\u0565\u0576", id:"Bahasa Indonesia", is:"\u00cdslenska",
        it:"Italiano", ja:"\u65e5\u672c\u8a9e", jv:"Basa Jawa", ka:"\u10e5\u10d0\u10e0\u10d7\u10e3\u10da\u10d8",
        kk:"\u049a\u0430\u0437\u0430\u049b \u0442\u0456\u043b\u0456", km:"\u1781\u17d2\u1798\u17c2\u179a", ko:"\ud55c\uad6d\uc5b4",
        la:"Latina", lt:"Lietuvi\u0173", lv:"Latvie\u0161u", mk:"\u041c\u0430\u043a\u0435\u0434\u043e\u043d\u0441\u043a\u0438",
        ml:"\u0d2e\u0d32\u0d2f\u0d3e\u0d33\u0d02", mn:"\u041c\u043e\u043d\u0433\u043e\u043b", mr:"\u092e\u0930\u093e\u0920\u0940",
        ms:"Bahasa Melayu", my:"\u1019\u103c\u1014\u103a\u1019\u102c", ne:"\u0928\u0947\u092a\u093e\u0932\u0940", nl:"Nederlands",
        no:"Norsk", pa:"\u0a2a\u0a70\u0a1c\u0a3e\u0a2c\u0a40", pl:"Polski", pt:"Portugu\u00eas", ro:"Rom\u00e2n\u0103",
        ru:"\u0420\u0443\u0441\u0441\u043a\u0438\u0439", sk:"Sloven\u010dina", sl:"Sloven\u0161\u010dina", sq:"Shqip",
        sr:"\u0421\u0440\u043f\u0441\u043a\u0438", sv:"Svenska", sw:"Kiswahili", ta:"\u0ba4\u0bae\u0bbf\u0bb4\u0bcd",
        te:"\u0c24\u0c46\u0c32\u0c41\u0c17\u0c41", th:"\u0e44\u0e17\u0e22", tr:"T\u00fcrk\u00e7e",
        uk:"\u0423\u043a\u0440\u0430\u0457\u043d\u0441\u044c\u043a\u0430", ur:"\u0627\u0631\u062f\u0648", uz:"O\u02bbzbekcha",
        vi:"Ti\u1ebfng Vi\u1ec7t", "zh-CN":"\u7b80\u4f53\u4e2d\u6587", "zh-TW":"\u7e41\u9ad4\u4e2d\u6587"};
    // When Translate messages translates: everything on screen, or only messages you pick from the hold menu.
    const TRANSLATE_MODES = ["auto", "manual"];
    // How you ask in "Only when you ask" (#82): the bar at the top of a chat, Translate in a message's menu, or both.
    // One choice instead of two switches, so there's always a way to translate.
    const TRANSLATE_ASKS = ["both", "bar", "menu"];
    // Where the GIF picker's GIFs come from with Bring back Tenor GIFs on: Tenor first with Discord's own mixed in, or only Tenor.
    const TENOR_SOURCES = ["both", "tenor"];
    // Left bar thickness multiplier (1x = 2dp default, 2x = 4dp, 3x = 6dp, 4x = 8dp) and highlight color presets (#60).
    const HIGHLIGHT_THICKNESSES = [1, 2, 3, 4];
    // How strongly a highlighted row is tinted behind its text, 0 to 100 %. 50 is Discord's own tint (alpha 1a, about
    // 10%); 0 leaves only the bar and 100 is about 40%, still light enough to read on. The pills are these steps.
    const BRIGHTNESS_STEPS = [0, 25, 50, 75, 100];
    const BADGE_CYCLE_MIN = 5, BADGE_CYCLE_MAX = 240, BADGE_CYCLE_PRESETS = [10, 15, 30];
    // Running games counted at the same time for Game time; 1 is one game, like before.
    const BADGE_AT_ONCE = [1, 2, 3];
    function badgeAtOnce(value) { const n = Math.floor(Number(value)); return BADGE_AT_ONCE.includes(n) ? n : 2; }
    function badgeCycleMinutes(value) { const n = Math.floor(Number(value)); return Number.isFinite(n) ? Math.max(BADGE_CYCLE_MIN, Math.min(BADGE_CYCLE_MAX, n)) : 30; }
    function brightness(value) { const n = Math.round(Number(value)); return Number.isFinite(n) ? Math.max(0, Math.min(100, n)) : 50; }
    function highlightAlpha(level) {
        const n = brightness(level), a = n <= 50 ? Math.round(n * 26 / 50) : Math.round(26 + (n - 50) * 76 / 50);
        return (a < 16 ? "0" : "") + a.toString(16);
    }
    const HIGHLIGHT_COLOR_MAP = {default:"", yellow:"#f0b232", blurple:"#5865f2", green:"#23a55a", cyan:"#00a8fc", pink:"#eb459e", purple:"#9b59b6", orange:"#e67e22", red:"#f23f43"};
    function isHighlightColor(value) {
        return typeof value === "string" && (owns(HIGHLIGHT_COLOR_MAP, value) || /^#[0-9a-fA-F]{6}$/.test(value.trim()));
    }
    function normalizeHighlightColor(value) {
        if (typeof value !== "string") return "default";
        const trimmed = value.trim().toLowerCase();
        return owns(HIGHLIGHT_COLOR_MAP, trimmed) || /^#[0-9a-f]{6}$/.test(trimmed) ? trimmed : "default";
    }
    // The language of Venus settings. English is built in; every other one is a file in the patched APK
    // (assets/venus/i18n), read once when it's first needed, so none of them slows down Discord's start.
    const UI_LANGUAGES = [["en","English","English"],["bg","\u0411\u044a\u043b\u0433\u0430\u0440\u0441\u043a\u0438","Bulgarian"],["cs","\u010ce\u0161tina","Czech"],
        ["da","Dansk","Danish"],["de","Deutsch","German"],["el","\u0395\u03bb\u03bb\u03b7\u03bd\u03b9\u03ba\u03ac","Greek"],["es","Espa\u00f1ol","Spanish"],
        ["fi","Suomi","Finnish"],["fr","Fran\u00e7ais","French"],["hi","\u0939\u093f\u0928\u094d\u0926\u0940","Hindi"],["hr","Hrvatski","Croatian"],
        ["hu","Magyar","Hungarian"],["id","Bahasa Indonesia","Indonesian"],["it","Italiano","Italian"],["ja","\u65e5\u672c\u8a9e","Japanese"],
        ["ko","\ud55c\uad6d\uc5b4","Korean"],["lt","Lietuvi\u0173","Lithuanian"],["nl","Nederlands","Dutch"],["no","Norsk","Norwegian"],
        ["pl","Polski","Polish"],["pt-BR","Portugu\u00eas do Brasil","Portuguese (Brazil)"],["ro","Rom\u00e2n\u0103","Romanian"],
        ["ru","\u0420\u0443\u0441\u0441\u043a\u0438\u0439","Russian"],["sv","Svenska","Swedish"],["th","\u0e44\u0e17\u0e22","Thai"],
        ["tr","T\u00fcrk\u00e7e","Turkish"],["uk","\u0423\u043a\u0440\u0430\u0457\u043d\u0441\u044c\u043a\u0430","Ukrainian"],
        ["vi","Ti\u1ebfng Vi\u1ec7t","Vietnamese"],["zh-CN","\u7b80\u4f53\u4e2d\u6587","Chinese (Simplified)"],["zh-TW","\u7e41\u9ad4\u4e2d\u6587","Chinese (Traditional)"]];
    const UI_CODES = new Set(UI_LANGUAGES.map(entry => entry[0]));
    const isLanguage = value => value === "auto" || UI_CODES.has(value);
    const I18N_PREFIX = "venus-i18n-v1:";
    const i18n = {packs:new Map(), loading:new Set(), version:0, shownIn:null};
    // A language file that couldn't be read: English is shown instead.
    const EMPTY_PACK = Object.freeze({});
    let localeStore = null, cachedLocale = undefined, cachedLocaleCode = "en";
    // Discord's language as one of Venus's: "pt-BR" and "pt-PT" both read Portuguese, "es-419" Spanish.
    function languageFor(locale) {
        if (typeof locale !== "string") return "en";
        const parts = locale.replace("_", "-").split("-"), base = parts[0].toLowerCase(), region = (parts[1] || "").toUpperCase();
        if (base === "zh") return /^(TW|HK|MO|HANT)$/.test(region) ? "zh-TW" : "zh-CN";
        if (base === "pt") return "pt-BR";
        if (base === "nb" || base === "nn") return "no";
        return UI_CODES.has(base) ? base : "en";
    }
    function uiLanguage() {
        const lang = settings.language;
        if (lang !== "auto") return UI_CODES.has(lang) ? lang : "en";
        let locale = null;
        try { locale = localeStore && localeStore.locale; } catch (_) {}
        if (locale === cachedLocale) return cachedLocaleCode;
        cachedLocale = locale;
        return cachedLocaleCode = languageFor(locale);
    }
    // Every Venus text goes through here: the chosen language's wording, or the English one until it has loaded
    // (or when it has no wording for it). {name} parts are filled in afterwards, so numbers are never translated.
    function tr(text, vars) {
        let out = text;
        const code = uiLanguage();
        if (code !== "en") {
            const pack = i18n.packs.get(code);
            if (pack) { const found = pack[text]; if (typeof found === "string" && found) out = found; }
            else loadLanguage(code);
        }
        return vars ? out.replace(/\{(\w+)\}/g, (match, name) => vars[name] != null ? String(vars[name]) : match) : out;
    }
    // Which plural form a whole number takes in each Venus language (CLDR's rules). Discord's Hermes has no
    // Intl.PluralRules, so these are built in: Russian needs "21 перевод" and "22 перевода", French "0 traduction".
    function pluralKind(code, n) {
        n = Math.abs(Math.floor(n));
        const d = n % 10, h = n % 100, teen = h >= 11 && h <= 19, few = d >= 2 && d <= 4 && !(h >= 12 && h <= 14);
        switch (code) {
            case "ja": case "ko": case "zh-CN": case "zh-TW": case "th": case "vi": case "id": return "other";
            case "fr": case "pt-BR": case "hi": return n <= 1 ? "one" : "other";
            case "ru": case "uk": return d === 1 && h !== 11 ? "one" : few ? "few" : "many";
            case "hr": return d === 1 && h !== 11 ? "one" : few ? "few" : "other";
            case "pl": return n === 1 ? "one" : few ? "few" : "many";
            case "cs": return n === 1 ? "one" : n >= 2 && n <= 4 ? "few" : "other";
            case "lt": return d === 1 && !teen ? "one" : d >= 2 && !teen ? "few" : "other";
            case "ro": return n === 1 ? "one" : n === 0 || h >= 1 && h <= 19 ? "few" : "other";
            default: return n === 1 ? "one" : "other";
        }
    }
    // "1 translation" / "3 translations". A language file can give every plural form its language has,
    // as {"one":..., "few":..., "many":..., "other":...}.
    function pl(n, one, other, vars) {
        const code = uiLanguage(), pack = code !== "en" && i18n.packs.get(code), forms = pack && pack[other];
        const kind = pack ? pluralKind(code, n) : n === 1 ? "one" : "other";
        let text;
        if (forms && typeof forms === "object") text = typeof forms[kind] === "string" ? forms[kind] : typeof forms.other === "string" ? forms.other : tr(kind === "one" ? one : other);
        else text = tr(kind === "one" ? one : other);
        const out = text.replace(/\{n\}/g, String(n));
        return vars ? out.replace(/\{(\w+)\}/g, (match, name) => vars[name] != null ? String(vars[name]) : match) : out;
    }
    function loadLanguage(code) {
        if (code === "en" || i18n.packs.has(code) || i18n.loading.has(code) || !files || typeof files.readAsset !== "function") return;
        i18n.loading.add(code);
        Promise.resolve().then(() => files.readAsset(I18N_PREFIX + code, "utf8")).then(text => {
            const pack = JSON.parse(text), strings = pack && pack.strings;
            if (!strings || typeof strings !== "object" || Array.isArray(strings)) throw new Error("Invalid language file");
            i18n.packs.set(code, strings);
        }).catch(() => { i18n.packs.set(code, EMPTY_PACK); }).then(() => { i18n.loading.delete(code); languageChanged(); });
    }
    function languageChanged() {
        i18n.version++; i18n.shownIn = uiLanguage();
        notify("*");
        // Only the "Translated from ..." line under a translation is in Venus's language: redraw just those rows,
        // not every message on screen, and nothing while the feature is off or that line isn't shown.
        if (features.translate && enabled("translate") && (settings.translateNote || settings.translateOriginal)) translateRelabel();
    }
    // A sub-option (piProfile, reviewWarning, pastelAll...) must also wake components that
    // subscribed to its plugin: those pages and badges read several of its settings at once.
    // Counts every notify, so a component that rendered before it subscribed can tell it missed one (useSettings).
    let notifyCount = 0;
    const notify = key => {
        notifyCount++;
        const owner = key && key !== "*" ? featureFor(key) : null;
        listeners.forEach(entry => {
            if (!entry.key || key === "*" || entry.key === key || owner && entry.key === owner) entry.fn();
        });
    };
    const data = (obj, key) => {
        const descriptor = obj && Object.getOwnPropertyDescriptor(obj, key);
        return descriptor && "value" in descriptor ? descriptor.value : undefined;
    };
    const owns = (obj, key) => obj != null && Object.prototype.hasOwnProperty.call(obj, key);
    // enabled() runs inside nearly every hook: resolve setting -> feature once, not per call.
    // Off settings (most of them) return before any lookup, and a plain object beats Map.get on Hermes
    // (1.23x on Hermes).
    const featureTable = Object.create(null);
    const enabled = key => {
        if (!settings[key]) return false;
        const feature = featureTable[key] || featureFor(key);
        // An option only counts while its main switch is on too. Only FreeNitro checked that, so
        // "Removing link previews" kept skipping the question after QuickDelete itself was turned off.
        return feature === key ? !!features[key] : !!(features[feature] && settings[feature]);
    };

    // The font Discord started with; the native side reads the same saved setting at launch.
    let fontInUse = false;
    // Emojis are the same: the native side reads the saved setting once at launch, and so does this.
    let emojiInUse = false;
    function settingsSnapshot() {
        const extra = {};
        if (features.reviewDB && reviewToken && reviewAccount) extra.reviewAuth = {account:reviewAccount, token:reviewToken};
        if (features.userNotif && userNotif.ids.size) extra.userNotifIds = Array.from(userNotif.ids);
        if (features.badges && badges.played.size) extra.badgesPlayedIds = Array.from(badges.played);
        if (features.badges && Object.keys(badges.grants).length) extra.badgesGrants = badges.grants;
        // Kept until someone signs in to take it over, so a save before that doesn't lose it.
        else if (features.badges && badges.legacyGrant) extra.badgesGrant = badges.legacyGrant;
        if (backup.last) extra.lastBackup = backup.last;
        if (starter.done) extra.setupDone = true;
        if (features.nitroThemes && nitroTheme.preset != null) extra.nitroTheme = {preset:nitroTheme.preset, theme:nitroTheme.theme};
        return JSON.stringify(Object.keys(extra).length ? Object.assign({}, settings, extra) : settings);
    }
    function save() {
        if (!files || status.storage === "loading") return;
        // Keep only the newest waiting snapshot, not one Promise/string per toggle.
        nextSave = settingsSnapshot();
        if (writePending) return;
        writePending = true;
        function persist() {
            const snapshot = nextSave;
            nextSave = undefined;
            return Promise.resolve().then(() => files.writeFile("documents", PREFS, snapshot, "utf8")).then(() => {
                status.storage = "saved";
            }, () => { status.storage = "save failed (session only)"; }).then(() => {
                notify();
                if (nextSave !== undefined && nextSave !== snapshot) return persist();
                nextSave = undefined;
                writePending = false;
            });
        }
        Promise.resolve().then(persist);
    }
    // Typing 0 in the maximum box used to jump it to 512; anything below 1 now means the lowest, 1.
    function deleteLimit(value) { const n = Math.floor(Number(value)); return Number.isFinite(n) ? Math.max(1, Math.min(MAX_DELETED, n)) : 512; }
    // 1.18.0 moved the deleted messages color from Message highlights to Keep deleted messages: a settings file or
    // backup from before keeps the color you picked.
    function migrateSettings(raw) {
        if (raw && typeof raw === "object" && raw.noDeleteColor === undefined && typeof raw.messageHighlightDeletedColor === "string")
            raw.noDeleteColor = raw.messageHighlightDeletedColor;
        return raw;
    }
    // A saved or imported value for one setting, cleaned up, or undefined when it can't be used. Shared by the settings
    // file and by restoring a backup, so a hand-edited backup can never put a setting in a state the pages can't show.
    function acceptedSetting(key, value) {
        if (!owns(settings, key) || typeof value !== typeof settings[key]) return undefined;
        if (key === "readAllMode" && !READ_ALL_MODES.includes(value) || key === "gestureOwn" && !GESTURE_OWN_MODES.includes(value) ||
            key === "translateTarget" && !TRANSLATE_TARGETS.includes(value) || key === "translateLanguage" && !TRANSLATE_LANGUAGES.includes(value) || key === "translateMode" && !TRANSLATE_MODES.includes(value) || key === "translateAsk" && !TRANSLATE_ASKS.includes(value) || key === "tenorGifsSource" && !TENOR_SOURCES.includes(value) ||
            key === "messageHighlightThickness" && !HIGHLIGHT_THICKNESSES.includes(value) || key === "language" && !isLanguage(value)) return undefined;
        if (key === "messageHighlightPingColor" || key === "noDeleteColor") return isHighlightColor(value) ? normalizeHighlightColor(value) : undefined;
        if (key === "messageHighlightBrightness" || key === "noDeleteBrightness") return brightness(value);
        if (key === "noDeleteLimit") return deleteLimit(value);
        if (key === "badgesCycleMinutes") return badgeCycleMinutes(value);
        if (key === "badgesGamesAtOnce") return badgeAtOnce(value);
        if (key === "fixEmbedsSites") return fixSitesText(value);
        return typeof value === "number" && !Number.isFinite(value) ? undefined : value;
    }
    function setSetting(key, value) {
        // The settings language isn't a feature: it's always there.
        if (key === "language") {
            if (!isLanguage(value)) return false;
            if (settings.language === value && status.storage !== "loading" && status.storage !== "waiting") return true;
            settings.language = value; dirty.add(key); save(); loadLanguage(uiLanguage()); languageChanged(); return true;
        }
        if (!owns(settings, key) || !features[featureFor(key)]) return false;
        if (key === "readAllMode") {
            if (!READ_ALL_MODES.includes(value)) return false;
            if (settings.readAllMode === value && status.storage !== "loading" && status.storage !== "waiting") return true;
            settings.readAllMode = value; dirty.add(key); save(); notify(key); return true;
        }
        if (key === "gestureOwn") {
            if (!GESTURE_OWN_MODES.includes(value)) return false;
            if (settings.gestureOwn === value && status.storage !== "loading" && status.storage !== "waiting") return true;
            settings.gestureOwn = value; dirty.add(key); save(); notify(key); return true;
        }
        if (key === "translateTarget" || key === "translateMode" || key === "translateLanguage" || key === "translateAsk") {
            if (!(key === "translateMode" ? TRANSLATE_MODES : key === "translateLanguage" ? TRANSLATE_LANGUAGES : key === "translateAsk" ? TRANSLATE_ASKS : TRANSLATE_TARGETS).includes(value)) return false;
            if (settings[key] === value && status.storage !== "loading" && status.storage !== "waiting") return true;
            settings[key] = value; dirty.add(key); save(); notify(key); translateChanged(); return true;
        }
        if (key === "tenorGifsSource") {
            if (!TENOR_SOURCES.includes(value)) return false;
            if (settings.tenorGifsSource === value && status.storage !== "loading" && status.storage !== "waiting") return true;
            settings.tenorGifsSource = value; dirty.add(key); save(); notify(key); return true;
        }
        if (key === "fixEmbedsSites") {
            const clean = fixSitesText(value);
            if (clean === undefined) return false;
            if (settings.fixEmbedsSites === clean && status.storage !== "loading" && status.storage !== "waiting") return true;
            settings.fixEmbedsSites = clean; dirty.add(key); save(); notify(key); return true;
        }
        if (key === "noDeleteLimit") {
            const limit = deleteLimit(value);
            // Leaving the box without changing it no longer rewrites your settings.
            if (limit === settings.noDeleteLimit && status.storage !== "loading" && status.storage !== "waiting") return true;
            settings.noDeleteLimit = limit; dirty.add(key); trimDeleted(); save(); notify(key); return true;
        }
        if (key === "badgesCycleMinutes") {
            const mins = badgeCycleMinutes(value);
            if (mins === settings.badgesCycleMinutes && status.storage !== "loading" && status.storage !== "waiting") return true;
            settings.badgesCycleMinutes = mins; dirty.add(key); save();
            if (features.badges) badgesSettingChanged(key, mins);
            notify(key); return true;
        }
        if (key === "badgesGamesAtOnce") {
            const n = badgeAtOnce(value);
            if (n === settings.badgesGamesAtOnce && status.storage !== "loading" && status.storage !== "waiting") return true;
            settings.badgesGamesAtOnce = n; dirty.add(key); save();
            if (features.badges) badgesSettingChanged(key, n);
            notify(key); return true;
        }
        if (key === "messageHighlightThickness") {
            const mult = Number(value);
            if (!HIGHLIGHT_THICKNESSES.includes(mult)) return false;
            if (settings.messageHighlightThickness === mult && status.storage !== "loading" && status.storage !== "waiting") return true;
            settings.messageHighlightThickness = mult; dirty.add(key); save(); notify(key); later(messageHighlightRedraw, 0); return true;
        }
        if (key === "messageHighlightBrightness" || key === "noDeleteBrightness") {
            if (typeof value !== "number" || !Number.isFinite(value)) return false;
            const level = brightness(value);
            if (settings[key] === level && status.storage !== "loading" && status.storage !== "waiting") return true;
            settings[key] = level; dirty.add(key); save(); notify(key); later(key === "noDeleteBrightness" ? deletedRedraw : messageHighlightRedraw, 0); return true;
        }
        if (key === "noDeleteColor") {
            if (!isHighlightColor(value)) return false;
            const clean = normalizeHighlightColor(value);
            if (settings.noDeleteColor === clean && status.storage !== "loading" && status.storage !== "waiting") return true;
            settings.noDeleteColor = clean; dirty.add(key); save(); notify(key); later(deletedRedraw, 0); return true;
        }
        if (key === "messageHighlightPingColor") {
            if (!isHighlightColor(value)) return false;
            const clean = normalizeHighlightColor(value);
            if (settings[key] === clean && status.storage !== "loading" && status.storage !== "waiting") return true;
            settings[key] = clean; dirty.add(key); save(); notify(key); later(messageHighlightRedraw, 0); return true;
        }
        if (settings[key] === !!value && status.storage !== "loading" && status.storage !== "waiting") return true;
        value = !!value;
        if (key === "reviewDB" && !value) { reviewAuthAttempt++; reviewCache.clear(); }
        if (key === "voice" && !value) activeJobs.forEach(job => {
            job.cancelled = true;
            nativeVoice("cancel", job.id).catch(() => {});
        });
        // Switching NoDelete off hides kept messages but must not erase the saved archive:
        // it used to write an empty file, so turning it back on lost every saved message.
        if (key === "noDelete" && !value) { clearDeleted(true, settings.noDeleteSave); archiveRestored = false; }
        if (key === "hiddenChannels") {hiddenViews.clear();}
        if ((key === "dashless" || key === "hiddenChannels") && channelStore && typeof channelStore.emitChange === "function")
            try { channelStore.emitChange(); } catch (_) {}
        if (key === "gestures" && !value && features.gestures) gestureCancel();
        if (key === "splitMessages" && !value && features.splitMessages) split.generation++;
        if ((key === "noDeleteEdits" || key === "noDelete") && !value && edits.size) { edits.clear(); persistDeleted(); }
        settings[key] = value;
        if (value && !starter.done && owns(FEATURE_ICONS, key)) starter.done = true;
        if (key === "noDeleteSave") { if (value) restoreDeleted(); else archiveRestored = false; persistDeleted(); }
        if (key === "noDelete" && value) restoreDeleted();
        dirty.add(key);
        if (key === "picker" && !value) {
            clearSizes();
        }
        if (features.quests && featureFor(key) === "quests") questsSettingChanged(key, value);
        if (features.badges && featureFor(key) === "badges") badgesSettingChanged(key, value);
        if (key === "systemFont" && features.systemFont && !backup.restoring && status.storage !== "loading" && status.storage !== "waiting" && value !== fontInUse) later(() => askRestart("font"), 0);
        if (key === "systemEmoji" && features.systemEmoji && !backup.restoring && status.storage !== "loading" && status.storage !== "waiting" && value !== emojiInUse) later(() => askRestart("emoji"), 0);
        save();
        notify(key);
        if (features.translate && key === "translate" && value) translateRestore();
        if (features.translate && featureFor(key) === "translate") later(translateChanged, 0);
        if (features.userNotif && key === "userNotifPush" && value && status.storage !== "loading" && status.storage !== "waiting") later(() => userNotifRequestPermissions(false), 0);
        if (features.userNotif && featureFor(key) === "userNotif") userNotifSync();
        if (features.accountSwitcher && featureFor(key) === "accountSwitcher") accountSwitcherSync();
        if (features.customThemes && key === "customThemes") { if (value) customThemesRestore(); customThemesApply(); if (features.iconPacks) iconPacksApply(); }
        if (features.customThemes && key === "customThemesBackground") customThemesApply();
        if (features.nitroThemes && key === "nitroThemes" && !value) nitroThemeTurnedOff();
        if (features.iconPacks && key === "iconPacks") { if (value) iconPacksRestore(); iconPacksApply(); }
        if (features.iconPacks && key === "iconPacksTheme") iconPacksApply();
        if (features.messageHighlight && key === "messageHighlight") later(messageHighlightRedraw, 0);
        if (features.quests || features.badges || features.userNotif) backgroundSync();
        return true;
    }
    function initFiles(module) {
        if (files) return;
        files = module;
        status.storage = "loading";
        // Size metadata does not depend on the preferences directory being available.
        drainSizes();
        let constants;
        try { constants = typeof files.getConstants === "function" ? files.getConstants() : files; }
        catch (_) { constants = {}; }
        const directory = constants && constants.DocumentsDirPath;
        if (typeof directory !== "string") { status.storage = "unavailable (session only)"; notify(); return; }
        const path = directory.replace(/\/$/, "") + "/" + PREFS;
        Promise.resolve().then(() => files.fileExists(path)).then(exists =>
            exists ? files.readFile(path, "utf8") : null
        ).then(text => {
            if (text) {
                const loaded = JSON.parse(text);
                if (!loaded || typeof loaded !== "object" || Array.isArray(loaded)) throw new Error("Invalid preferences");
                migrateSettings(loaded);
                for (const key of Object.keys(settings)) {
                    const value = dirty.has(key) ? undefined : acceptedSetting(key, loaded[key]);
                    if (value !== undefined) settings[key] = value;
                }
                if (typeof loaded.lastBackup === "number" && Number.isFinite(loaded.lastBackup) && !backup.last) backup.last = loaded.lastBackup;
                if (loaded.setupDone === true) starter.done = true;
                const savedTheme = loaded.nitroTheme;
                if (features.nitroThemes && nitroTheme.preset == null && savedTheme && typeof savedTheme === "object" && typeof savedTheme.preset === "number" &&
                    Number.isInteger(savedTheme.preset) && savedTheme.preset >= 0 && savedTheme.preset < 1000) {
                    nitroTheme.preset = savedTheme.preset;
                    nitroTheme.theme = typeof savedTheme.theme === "number" && Number.isInteger(savedTheme.theme) ? savedTheme.theme : null;
                }
                const auth = loaded.reviewAuth;
                // Restore a saved ReviewDB sign-in (a ReviewDB token, never the Discord token).
                if (features.reviewDB && !reviewToken && auth && typeof auth.token === "string" && auth.token.length <= 8192 &&
                    typeof auth.account === "string" && /^\d{17,20}$/.test(auth.account)) { reviewToken = auth.token; reviewAccount = auth.account; }
                if (features.userNotif && !userNotif.dirty && Array.isArray(loaded.userNotifIds)) {
                    userNotif.ids.clear();
                    loaded.userNotifIds.slice(0, USER_NOTIF_MAX_IDS).forEach(id => { if (typeof id === "string" && /^\d{17,20}$/.test(id)) userNotif.ids.add(id); });
                }
                if (features.badges) {
                    if (Array.isArray(loaded.badgesPlayedIds))
                        loaded.badgesPlayedIds.slice(0, BADGES_MAX_PLAYED).forEach(id => { if (typeof id === "string" && /^\d{17,20}$/.test(id)) badges.played.add(id); });
                    badges.grants = badgeGrantsLoad(loaded.badgesGrants);
                    // The first test build kept one grant for every account: {at, hours}. It's given to whoever is signed in.
                    const legacy = loaded.badgesGrant;
                    badges.legacyGrant = !loaded.badgesGrants && legacy && Number.isFinite(legacy.at) && Number.isFinite(legacy.hours) && legacy.hours >= 1 ?
                        {at:Math.min(legacy.at, Date.now()), hours:Math.max(0, Math.min(BADGE_TIME_TOP, Math.floor(legacy.hours)))} : null;
                }
            }
            status.storage = "ready";
            if (features.nitroThemes && nitroTheme.preset != null) later(nitroThemeReapply, 0);
            if (!starter.done && Object.keys(FEATURE_ICONS).some(key => features[key] && settings[key])) starter.done = true;
            fontInUse = settings.systemFont;
            emojiInUse = settings.systemEmoji;
            if (!enabled("picker")) clearSizes();
            // Persist edits made while the asynchronous restore was in flight.
            if (dirty.size || features.userNotif && userNotif.dirty) save();
            restoreDeleted();
            if (features.quests) { if (!enabled("quests")) questsStop(); else questsLoaded(); }
            if (features.badges) { if (!enabled("badges")) badgesStop(); else badgesLoaded(); }
            if (features.userNotif) {
                userNotifSync();
                if (enabled("userNotif") && settings.userNotifPush) userNotifCheckPermissions();
            }
            if (features.accountSwitcher) accountSwitcherSync();
            if (features.customThemes && enabled("customThemes")) customThemesRestore();
            if (features.iconPacks && enabled("iconPacks")) iconPacksRestore();
            if (features.quests || features.badges || features.userNotif) backgroundSync();
            // Saved translations are read as soon as Discord starts, so the first chat you open already has them.
            if (enabled("translate")) translateRestore();
            i18n.shownIn = uiLanguage(); loadLanguage(i18n.shownIn);
            notify("*");
        }).catch(() => {
            // The native side reads the same file at launch and falls back to Discord's font and emojis when it
            // can't. Assuming the phone's emojis here drew React Native emojis one way and chat the other.
            status.storage = "read failed (defaults)"; fontInUse = false; emojiInUse = false;
            if (dirty.size) save(); notify("*");
        });
    }

    function formatSize(bytes) {
        if (!Number.isFinite(bytes) || bytes < 0) return "";
        if (bytes === 0) return "0 B";
        // Binary units, labelled the way Android and Discord show them. Promote a value that
        // would round to "1024 KB" (log rounding just below a boundary) to "1 MB".
        const units = ["B", "KB", "MB", "GB", "TB"];
        let unit = Math.max(0, Math.min(Math.floor(Math.log(bytes) / Math.log(1024)), units.length - 1));
        let value = Number((bytes / Math.pow(1024, unit)).toFixed(unit ? 2 : 0));
        if (value >= 1024 && unit < units.length - 1) { unit++; value = Number((bytes / Math.pow(1024, unit)).toFixed(2)); }
        return value + " " + units[unit];
    }
    // Hermes's native eval configuration can lower loop-local const/let to var.
    // Give asynchronous callbacks an invocation scope, not a loop capture.
    function readSize(entry) {
        activeReads++;
        Promise.resolve().then(() => files.getSize(entry.uri)).then(value => {
            const bytes = typeof value === "number" || typeof value === "string" && value.trim() ? Number(value) : NaN;
            entry.value = Number.isSafeInteger(bytes) && bytes >= 0 ? bytes : null;
        }, () => { entry.value = null; }).then(() => {
            entry.expires = Date.now() + (entry.value === null ? 30000 : 300000);
            entry.done = true;
            entry.resolve(entry.value);
            activeReads--;
            drainSizes();
        });
    }
    function clearSizes() {
        sizeCache.clear();
        sizeQueue.splice(0).forEach(entry => entry.resolve(null));
    }
    function drainSizes() {
        if (!files || !enabled("picker")) return;
        while (activeReads < 4 && sizeQueue.length) readSize(sizeQueue.shift());
    }
    function getSize(uri) {
        if (!enabled("picker") || typeof uri !== "string" || !/^(content|file):\/\//.test(uri))
            return Promise.resolve(null);
        const existing = sizeCache.get(uri);
        if (existing && (!existing.done || existing.expires > Date.now())) {
            if (existing.done) { sizeCache.delete(uri); sizeCache.set(uri, existing); }
            return existing.promise;
        }
        if (existing) sizeCache.delete(uri);
        if (sizeCache.size >= 256) {
            let removable;
            for (const [key, cached] of sizeCache) if (cached.done) { removable = key; break; }
            if (removable === undefined) return Promise.resolve(null);
            sizeCache.delete(removable);
        }
        const entry = { uri, done: false };
        entry.promise = new Promise(resolve => { entry.resolve = resolve; });
        sizeCache.set(uri, entry);
        sizeQueue.push(entry);
        drainSizes();
        return entry.promise;
    }
    function el() { return React.createElement.apply(React,arguments); }
    // React subscribes only after the first commit, so a change between rendering and subscribing was lost. On a cold
    // start Discord reopens the last chat while the saved theme is still being read, and its "loaded" notify landed in
    // that gap: chat stayed without the theme background until something else redrew it (#84).
    function useSettings(key) {
        const [, update] = React.useState(0);
        const seen = notifyCount;
        React.useEffect(() => {
            const entry = {key, fn: () => update(n => n + 1)};
            listeners.add(entry);
            if (notifyCount !== seen) entry.fn();
            return () => listeners.delete(entry);
        }, [key]);
    }
    // A size already read and still fresh, without starting a read.
    function knownSize(uri) {
        const entry = typeof uri === "string" && sizeCache.get(uri);
        return entry && entry.done && entry.expires > Date.now() ? entry.value : null;
    }
    // One style object for every badge, not two per photo tile per render.
    const BADGE_STYLE = { position: "absolute", top: 3, left: 3, borderRadius: 4, backgroundColor: "#17181ccc", paddingHorizontal: 4, paddingVertical: 2 };
    const BADGE_TEXT = { color: "white", fontSize: 10, fontWeight: "700", includeFontPadding: false };
    const PICKER_WRAP = { position: "relative" };
    function SizeBadge(props) {
        useSettings("picker");
        // The picker recycles tiles while scrolling: a size it already knows shows straight away, with no blank first frame.
        const [state, update] = React.useState(() => ({uri:props.uri, bytes:knownSize(props.uri)}));
        const bytes = state && state.uri === props.uri ? state.bytes : knownSize(props.uri);
        React.useEffect(() => {
            let live = true;
            const uri = props.uri;
            if (enabled("picker")) getSize(uri).then(value => { if (live) update(old => old && old.uri === uri && old.bytes === value ? old : {uri, bytes:value}); });
            return () => { live = false; };
        }, [props.uri, settings.picker]);
        if (!enabled("picker") || bytes === null || !RN) return null;
        return el(RN.View, { pointerEvents: "none", style: BADGE_STYLE }, el(RN.Text, { style: BADGE_TEXT }, formatSize(bytes)));
    }
    function pickerProps(props) {
        if (!enabled("picker") || !React || !RN || !props) return props;
        const first = Array.isArray(props.children) ? props.children[0] : props.children;
        const uri = first && first.props && first.props.localImageSource && first.props.localImageSource.uri;
        if (typeof uri !== "string") return props;
        return Object.assign({}, props, { children: el(RN.View, {
            style: PICKER_WRAP, pointerEvents: "box-none"
        }, props.children, el(SizeBadge, { uri })) });
    }
    function pickerComponent(component) {
        if (!component || wrapped.has(component)) return wrapped.get(component) || component;
        if (typeof component === "function" && (component.displayName || component.name) === "Pressable") {
            const orig = component;
            const result = function (props, second) {
                const next = pickerProps(props), n = arguments.length;
                if (n <= 1) return orig.call(this, next);
                if (n === 2) return orig.call(this, next, second);
                const args = Array.from(arguments);
                args[0] = next;
                return orig.apply(this, args);
            };
            result.displayName = "Pressable";
            wrapped.set(component, result);
            status.picker = true;
            return result;
        }
        if (typeof component === "object") {
            for (const key of ["type", "render"]) {
                const orig = data(component, key);
                if (!orig) continue;
                const patched = pickerComponent(orig);
                if (patched !== orig) {
                    const result = cloneWith(component, key, patched);
                    wrapped.set(component, result);
                    return result;
                }
            }
        }
        return component;
    }

    function nativeVoice(action, id, uri) {
        if (!files) return Promise.reject(new Error("Discord file bridge has not loaded"));
        return files.getSize("venus-voice-v1:" + JSON.stringify({ action, id, uri }));
    }
    // Decoded byte count of a validated base64 string; Discord accepts at most 256 waveform levels.
    function waveformLength(text) { return text.length / 4 * 3 - (text.endsWith("==") ? 2 : text.endsWith("=") ? 1 : 0); }
    const audioName = /\.(mp3|mp2|mpga|m4a|m4b|aac|wav|wave|flac|ogg|oga|opus|amr|awb|3ga|3gp|3gpp|aif|aiff|aifc|wma|ac3|eac3|caf|weba|alac)$/i;
    // Audio-only extensions: some providers label these voice notes video/mp4, video/3gpp or video/webm.
    const audioOnlyName = /\.(mp3|m4a|m4b|aac|wav|flac|oga|opus|amr|awb|3ga|weba|aif|aiff|aifc|caf)$/i;
    const AUDIO_APPLICATION_TYPES = new Set(["application/ogg","application/x-ogg","application/x-flac","application/x-wav","application/x-opus"]);
    function isAudio(upload) {
        if (!upload || upload.spoiler) return false;
        const item = upload.item || {};
        const mime = String(upload.mimeType || item.mimeType || "").toLowerCase().split(";")[0].trim();
        const name = String(upload.filename || item.filename || "");
        if (mime.startsWith("audio/") || AUDIO_APPLICATION_TYPES.has(mime)) return true;
        if (mime.startsWith("video/")) return audioOnlyName.test(name);
        if (mime && mime !== "application/octet-stream" && mime !== "binary/octet-stream") return false;
        return audioName.test(name);
    }
    function prepareUpload(orig, upload, args) {
        if (!enabled("voice") || !isAudio(upload)) return orig.apply(upload, args);
        const old = conversions.get(upload);
        if (old) return old.promise;
        const item = upload.item || {};
        const uri = item.uri || upload.uri;
        if (typeof uri !== "string" || !/^(content|file):\/\//.test(uri)) return orig.apply(upload, args);
        const job = { id: Date.now().toString(36) + "-" + (++jobCounter), cancelled: false };
        activeJobs.set(upload, job);
        const promise = Promise.resolve().then(() => {
            if (job.cancelled || !enabled("voice") || typeof upload.isCancelled === "function" && upload.isCancelled())
                throw new Error("Audio upload cancelled before conversion");
            return nativeVoice("prepare", job.id, uri);
        }).then(text => {
            const result = JSON.parse(text);
            if (!result || typeof result.uri !== "string" || !result.uri.startsWith("file://") ||
                result.mimeType !== "audio/ogg" || !Number.isFinite(result.durationSecs) || !(result.durationSecs > 0) || result.durationSecs > 1200 ||
                !Number.isSafeInteger(result.size) || !(result.size > 0) || typeof result.waveform !== "string" || !/^(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?$/.test(result.waveform) || !result.waveform || waveformLength(result.waveform) > 256)
                throw new Error("Native audio conversion returned invalid metadata");
            if (job.cancelled || !enabled("voice") || (typeof upload.isCancelled === "function" && upload.isCancelled())) {
                nativeVoice("release", job.id).catch(() => {});
                if (typeof upload.isCancelled === "function" && upload.isCancelled()) throw new Error("Audio upload cancelled");
                return orig.apply(upload, args);
            }
            // This async pre-upload boundary is awaited by CloudUpload.upload in the inspected build.
            // Both native upload paths consume item.uri; no Blob/base64 full-file buffering in JS.
            upload.item = Object.assign({}, item, result);
            upload.uri = result.uri;
            upload.mimeType = result.mimeType;
            upload.filename = result.filename;
            upload.currentSize = result.size;
            upload.postCompressionSize = result.size;
            if (upload.uploadAnalytics && typeof upload.uploadAnalytics === "object")
                upload.uploadAnalytics.convertedMimeType = result.mimeType;
            upload.durationSecs = result.durationSecs;
            upload.waveform = result.waveform;
            upload.reactNativeFilePrepped = true;
            readyUploads.set(upload, result);
            status.audioError = "";
            notify();
            return upload;
        }).catch(error => {
            if (typeof upload.isCancelled === "function" && upload.isCancelled()) throw error;
            // Unsupported codecs/devices remain ordinary orig attachments, never spoofed voice files.
            status.audioError = String(error && error.message || error);
            notify();
            if (!job.cancelled) showProblem("Couldn't make a voice message", status.audioError + "\n\n" + tr("It will be sent as a normal file instead."));
            return orig.apply(upload, args);
        }).finally(() => { activeJobs.delete(upload); });
        job.promise = promise;
        conversions.set(upload, job);
        return promise;
    }
    function releaseJob(upload, cancelInflight) {
        const job = conversions.get(upload);
        if (!job) return;
        if (cancelInflight && !job.cancelled) {
            job.cancelled = true;
            nativeVoice("cancel", job.id).catch(() => {});
        }
        if (readyUploads.has(upload) && !job.released) {
            job.released = true;
            nativeVoice("release", job.id).catch(() => {});
        }
    }
    function instrumentCloudUpload(CloudUpload) {
        if (!features.voice || typeof CloudUpload !== "function" || !CloudUpload.prototype) return;
        const prototype = CloudUpload.prototype;
        const orig = prototype.reactNativeCompressAndExtractData;
        if (typeof orig !== "function" || wrapped.has(orig)) return;
        const patched = function () { return prepareUpload(orig, this, arguments); };
        prototype.reactNativeCompressAndExtractData = patched;
        wrapped.set(orig, patched);
        wrapped.set(patched, patched);
        // One function scope per method: Hermes's native eval can lower loop-local const to var (see readSize),
        // and then both wrappers called the last method, so cancelling an upload deleted it instead.
        function stopFirst(key, cancelInflight) {
            const method = prototype[key];
            if (typeof method !== "function") return;
            prototype[key] = function () {
                releaseJob(this, cancelInflight);
                return method.apply(this, arguments);
            };
        }
        stopFirst("_cancel", true); stopFirst("cancel", true); stopFirst("removeFromMsgDraft", true);
        stopFirst("delete", true); stopFirst("handleComplete", false); stopFirst("handleError", false);
        status.conversion = true;
    }
    function attachmentPayload(orig, self, args) {
        const result = orig.apply(self, args);
        const metadata = readyUploads.get(args[0]);
        if (!metadata || !result || typeof result !== "object") return result;
        if (!enabled("voice")) {
            if (!("duration_secs" in result) && !("waveform" in result)) return result;
            const clean = Object.assign({}, result);
            delete clean.duration_secs;
            delete clean.waveform;
            return clean;
        }
        const payload = Object.assign({}, result, { duration_secs: metadata.durationSecs, waveform: metadata.waveform });
        // These fields are real, but still belong only to custom voice conversion when the flag is off.
        const marker = { duration: true, waveform: true };
        markedPayloads.set(payload, marker);
        if (typeof payload.uploaded_filename === "string") {
            if (pendingVoice.size >= 128) pendingVoice.delete(pendingVoice.keys().next().value);
            pendingVoice.set(payload.uploaded_filename, marker);
        }
        return payload;
    }
    function postRequest(orig, self, args) {
        const request = args[0];
        // Fast path for all other API traffic; no fetch/XMLHttpRequest interception.
        if (!request || typeof request.url !== "string" ||
            !/^(?:\/channels\/\d+\/messages(?:\/announcement)?|\/users\/@me\/scheduled-messages)$/.test(request.url))
            return orig.apply(self, args);
        const body = request.body;
        if (!body || !Array.isArray(body.attachments) || ((Number(body.flags) || 0) & 8192))
            return orig.apply(self, args);
        const markers = body.attachments.map(attachment => attachment &&
            (markedPayloads.get(attachment) || pendingVoice.get(attachment.uploaded_filename)));
        if (!markers.some(Boolean)) return orig.apply(self, args);
        const eligible = enabled("voice") && body.attachments.length === 1 && markers[0] &&
            !body.content && !(body.sticker_ids && body.sticker_ids.length) &&
            !(body.embeds && body.embeds.length) && !(body.components && body.components.length) &&
            !body.poll && !body.activity && !body.shared_client_theme && !body.content_inventory_entry &&
            !(body.message_reference && body.message_reference.type === 1);
        const nextBody = Object.assign({}, body);
        if (eligible) nextBody.flags = ((Number(body.flags) || 0) | 8192) >>> 0;
        else nextBody.attachments = body.attachments.map((attachment, index) => {
            if (!markers[index]) return attachment;
            const clean = Object.assign({}, attachment);
            if (markers[index].duration) delete clean.duration_secs;
            if (markers[index].waveform) delete clean.waveform;
            return clean;
        });
        const nextArgs = Array.from(args);
        nextArgs[0] = Object.assign({}, request, { body: nextBody });
        return orig.apply(self, nextArgs);
    }

    // Native setting nodes use Discord's own themed rows, navigation and back stack.
    let SettingsList;
    const featureFor = key => {
        const cached = featureTable[key];
        if (cached !== undefined) return cached;
        return featureTable[key] = key === "reviewWarning" ? "reviewDB" : key === "emojis" || key === "stickers" || key === "hyperlinks" ? "freeNitro" : key === "noDeleteSave" || key === "noDeleteLimit" || key === "noDeleteEdits" || key === "noDeleteColor" || key === "noDeleteBrightness" ? "noDelete" : /^pi[A-Z]/.test(key) ? "platformIndicators" : key === "pastelAll" || key === "pastelContent" ? "pastelize" : key === "readAllMode" ? "readAll" : /^quests[A-Z]/.test(key) ? "quests" : /^badges[A-Z]/.test(key) ? "badges" : /^gesture[A-Z]/.test(key) ? "gestures" : /^translate[A-Z]/.test(key) ? "translate" : /^userNotif[A-Z]/.test(key) ? "userNotif" : /^accountSwitcher[A-Z]/.test(key) ? "accountSwitcher" : /^hiddenChannels[A-Z]/.test(key) ? "hiddenChannels" : /^customThemes[A-Z]/.test(key) ? "customThemes" : /^iconPacks[A-Z]/.test(key) ? "iconPacks" : /^messageHighlight[A-Z]/.test(key) ? "messageHighlight" : /^serverInfo[A-Z]/.test(key) ? "serverInfo" : /^fixEmbeds[A-Z]/.test(key) ? "fixEmbeds" : /^tenorGifs[A-Z]/.test(key) ? "tenorGifs" : /^hideButtons[A-Z]/.test(key) ? "hideButtons" : key;
    };
    // Section titles are read whenever Discord draws the list, so they follow the language too. "Venus" is a name.
    function section(label, keys) {
        const entry = { settings: keys };
        Object.defineProperty(entry, "label", { enumerable: true, configurable: true, get: () => label === "Venus" ? label : tr(label) });
        return entry;
    }
    // Rows Discord draws from a hook (useTitle, useDescription) redraw when the language changes. Called outside
    // a render (search, tests) the hook throws before registering anything, so it's simply skipped there.
    function useLanguage() { try { if (React) useSettings("language"); } catch (_) {} }
    // Plain-language status for General -> About; the raw values stay in status for diagnostics.
    function aboutText() {
        const storage = status.storage;
        const lines = [tr(storage === "ready" || storage === "saved" ? "Your settings are saved on this phone." :
            storage === "waiting" || storage === "loading" ? "Loading your settings…" :
            /^read failed/.test(storage) ? "Your saved settings couldn't be read, so the defaults are in use." :
            "Your settings can't be saved right now. Changes last until Discord restarts.")];
        // Settings and kept messages both saved: one line, not the same sentence twice.
        if (status.archive === "saved locally" && (storage === "ready" || storage === "saved")) lines[0] = tr("Your settings and kept deleted messages are saved on this phone.");
        const archive = {"save failed":"Kept deleted messages couldn't be saved.", "restore failed":"Saved deleted messages couldn't be loaded."}[status.archive];
        if (archive) lines.push(tr(archive));
        if (status.audioError) lines.push(tr("Last problem: {problem}", {problem:status.audioError}));
        return lines.join("\n");
    }
    // Discord's own icon for each feature row, from its design system. Resolved when a row first draws, never
    // while Discord builds its settings, and the Account icon stands in if one ever goes missing.
    const FEATURE_ICONS = {noDelete:[5049, "TrashIcon"], translate:[15723, "LanguageIcon"], gestures:[8956, "ReactionIcon"],
        quickDelete:[6296, "CircleXIcon"], jumpToTop:[10473, "ArrowLargeUpIcon"], favouriteAnything:[9549, "StarIcon"],
        freeNitro:[9031, "NitroWheelIcon"], voice:[12595, "WaveformIcon"], splitMessages:[9337, "PaperIcon"], noTyping:[12822, "KeyboardIcon"],
        picker:[10024, "AttachmentIcon"], pastelize:[15560, "PaintPaletteIcon"], platformIndicators:[15232, "LaptopPhoneIcon"],
        validUser:[8213, "AtIcon"], copyBios:[5042, "CopyIcon"], reviewDB:[9354, "ThumbsUpIcon"], readAll:[15928, "DoubleCheckmarkIcon"],
        hiddenChannels:[8218, "LockIcon"], dashless:[15892, "HashmarkIcon"], systemFont:[15974, "LettersIcon"], systemEmoji:[12901, "ChatSmileIcon"],
        hideGift:[11540, "GiftIcon"], hideCall:[9317, "PhoneCallIcon"], youBarSettings:[7092, "SettingsIcon"], quests:[13012, "QuestsIcon"],
        badges:[8921, "TrophyIcon"], hideQuestDock:[6650, "EyeSlashIcon"], userNotif:[8768, "BellIcon"], accountSwitcher:[8212, "GroupIcon"], appIcons:[8229, "AppsIcon"],
        customThemes:[15652, "EyeDropperIcon"], iconPacks:[11063, "ImageSparkleIcon"], messageHighlight:[16947, "PaintbrushThinIcon"], serverInfo:[5046, "CircleInformationIcon"], fixEmbeds:[12910, "EmbedIcon"], tenorGifs:[9748, "GifIcon"], hideButtons:[15612, "CircleMinusIcon"], nitroThemes:[17143, "SparklesIcon"]};
    const venusIcons = new Map();
    function venusIcon(id, name, fallback) {
        const slot = id + ":" + name;
        if (venusIcons.has(slot)) return venusIcons.get(slot);
        let found;
        function VenusIcon(props) {
            const Icon = found || (found = inspectedExport(id, name)) || fallback;
            return Icon ? el(Icon, props) : null;
        }
        venusIcons.set(slot, VenusIcon);
        return VenusIcon;
    }
    const REPO = "https://github.com/VenusIsJaded/Venus-Patches";
    function openLink(url) {
        try { if (RN && RN.Linking && typeof RN.Linking.openURL === "function") RN.Linking.openURL(url).catch(() => {}); } catch (_) {}
    }
    // "5 of 26 features on": main switches only, and only the features that were patched in.
    function featureSummary() {
        const keys = Object.keys(FEATURE_ICONS).filter(key => features[key]);
        const on = keys.filter(key => settings[key]).length;
        return keys.length ? tr("{on} of {total} features on. Turn them on or off in Features.", {on, total:keys.length}) : tr("No features were patched in.");
    }
    function settingsPage(sections) {
        const node = { type: "list", sections };
        return function VenusSettingsPage() {
            const List = SettingsList || (SettingsList = inspectedExport(14971, "SettingsList"));
            return React && List ? el(List, { node }) : null;
        };
    }
    // Features list search (#68): every row is found by its title, its description, its page's title, its group and the
    // names of the options on its page, in the language Venus is shown in and in English, ignoring case and accents.
    const FEATURE_KEYWORDS = {hideButtons:["Quests", "Shop", "Nitro", "Apps", "Polls", "Photos"], noDelete:["Show edit history", "Keep after restarting", "Color", "Brightness", "Keep up to"], translate:["Show the original language", "Show the original text", "Another language", "How you ask", "Top bar", "Message menu"],
        freeNitro:["Emojis", "Stickers", "Short links"], pastelize:["Replace role colors", "Color message text"],
        platformIndicators:["In DMs", "In lists", "On profiles", "Hide the phone badge"], reviewDB:["Show the be-respectful note"],
        userNotif:["Change status", "Start typing", "Send a message", "Phone notifications"], accountSwitcher:["Button on the profile bar", "Create a new account"],
        hiddenChannels:["Show its details"], serverInfo:["Look up friends in the server", "Boosts", "Owner", "Server ID"], customThemes:["Show theme background image", "Browse Revenge themes"],
        messageHighlight:["Brightness", "Left bar width"], iconPacks:["Rosiecord", "Plumpy", "Iconsax", "Material", "MD3", "Solar", "Deco", "Themes+", "Follow theme's icon pack"],
        fixEmbeds:["Remove tracking from links", "Sites", "X (Twitter)", "Twitter", "Instagram", "TikTok", "Reddit", "Bluesky", "Threads", "Facebook", "pixiv", "Bilibili", "FxTwitter", "vxTwitter", "embed"], tenorGifs:["Tenor", "GIF", "GIFs", "Klipy", "GIFs from", "Only Tenor"],
        badges:["Game time", "Unique games", "Switch games every", "Games at once", "Add hours now", "Advanced", "Hours Played", "Unique Games Played", "Years Active", "Personalization"]};
    function searchFold(text) {
        let out = String(text || "").toLowerCase();
        // Hermes has normalize only with Intl; without it, accents simply have to match.
        try { if (typeof out.normalize === "function") out = out.normalize("NFD").replace(/[\u0300-\u036f]/g, ""); } catch (_) {}
        return out;
    }
    function featureMatches(query) {
        const key = query + "\u0000" + uiLanguage() + "\u0000" + i18n.version, cached = featureSearch.cache;
        if (cached && cached.key === key) return cached.ids;
        const words = searchFold(query).split(/\s+/).filter(Boolean), ids = new Set();
        featureSearch.rows.forEach(row => {
            const texts = [row.title, row.hint, row.page, row.group].concat(FEATURE_KEYWORDS[row.key] || []).filter(Boolean);
            const haystack = searchFold(texts.map(text => tr(text) + " " + text).join(" "));
            if (words.every(word => haystack.indexOf(word) >= 0)) ids.add(row.id);
        });
        featureSearch.cache = {key, ids};
        return ids;
    }
    function setFeatureSearch(text) {
        const next = String(text == null ? "" : text);
        if (next === featureSearch.query) return;
        featureSearch.query = next;
        featureSearch.listeners.forEach(fn => fn());
    }
    // Typing only redraws the Features page and its search bar, never the rest of Discord's settings.
    function useFeatureSearch() {
        const [, update] = React.useState(0);
        React.useEffect(() => {
            const fn = () => update(n => n + 1);
            featureSearch.listeners.add(fn);
            return () => featureSearch.listeners.delete(fn);
        }, []);
    }
    const SEARCH_EMPTY_DARK = {badge:{width:56, height:56, borderRadius:28, alignItems:"center", justifyContent:"center", backgroundColor:"#4e50584d"}};
    // Discord's own search field (SearchField 6739, the one its settings and friends lists use) above the Features list.
    // It is one stable element in the list's header, so the keyboard stays up while the rows below it filter.
    function FeatureSearchBar() {
        useFeatureSearch(); useSettings();
        if (!React || !RN) return null;
        const ui = reviewUI(), SearchField = inspectedExport(6739, "SearchField"), Text = inspectedExport(5088, "Text");
        const s = useThemed("featureSearch", c => ({badge:Object.assign({}, SEARCH_EMPTY_DARK.badge, {backgroundColor:c.BACKGROUND_MOD_SUBTLE})}), SEARCH_EMPTY_DARK);
        const query = featureSearch.query, label = tr("Search features");
        const props = {placeholder:label, accessibilityLabel:label, value:query, onChange:setFeatureSearch, autoCorrect:false, autoCapitalize:"none", returnKeyType:"search"};
        const field = SearchField ? el(SearchField, props) : ui.TextInput ? el(ui.TextInput, props) :
            el(RN.TextInput, Object.assign({}, props, {onChangeText:setFeatureSearch, style:{fontSize:16, padding:12}}));
        const none = !!query.trim() && !featureMatches(query).size;
        const text = (value, variant, color, fallback) => Text ? el(Text, {variant, color, style:{textAlign:"center"}}, value) : el(RN.Text, {style:[fallback, {textAlign:"center"}]}, value);
        // Called directly (not as its own component), so the header keeps the same hooks whether the card shows or not.
        const setup = starterCard();
        return el(RN.View, {style:{paddingTop:12, paddingBottom:4}},
            query.trim() ? null : setup,
            field,
            none ? el(RN.View, {key:"none", style:{alignItems:"center", gap:6, paddingTop:40, paddingBottom:24}, accessibilityLiveRegion:"polite"},
                popIn("none", el(RN.View, {style:[s.badge, {marginBottom:6}]}, el(venusIcon(6740, "MagnifyingGlassIcon"), {size:"md"}))),
                text(tr("No features found"), "text-md/semibold", "text-strong", {color:"#f2f3f5", fontSize:16, fontWeight:"600"}),
                text(tr("Try a different word."), "text-sm/medium", "text-muted", {color:"#949ba4", fontSize:14})) : null);
    }
    // First-run setup. Every feature starts off, so a fresh install opens on a long list of switches. Until you've turned
    // anything on, the top of the list offers a short, safe set in one tap: nothing to sign in to, no outside service,
    // no restart. Undo switches back exactly what it turned on; Not now (or turning on anything yourself) hides it for good.
    const STARTER_FEATURES = ["noDelete", "freeNitro", "platformIndicators", "readAll", "jumpToTop", "validUser", "copyBios", "picker"];
    function starterKeys() { return STARTER_FEATURES.filter(key => features[key]); }
    function starterVisible() {
        if (starter.justOn) return true;
        if (starter.done || status.storage === "waiting" || status.storage === "loading") return false;
        return starterKeys().length >= 3 && !Object.keys(FEATURE_ICONS).some(key => features[key] && settings[key]);
    }
    function starterTurnOn() {
        const keys = starterKeys().filter(key => !settings[key]);
        if (!keys.length) return;
        animateLayout();
        keys.forEach(key => setSetting(key, true));
        starter.done = true; starter.justOn = keys; save(); notify("*");
    }
    function starterUndo() {
        const keys = starter.justOn || [];
        animateLayout();
        starter.justOn = null; starter.done = false;
        keys.forEach(key => setSetting(key, false));
        save(); notify("*");
    }
    function starterClose() { animateLayout(); starter.done = true; starter.justOn = null; save(); notify("*"); }
    const STARTER_DARK = {card:{backgroundColor:"#2b2d31", borderRadius:16, padding:16, gap:14, marginBottom:12},
        badge:{width:40, height:40, borderRadius:20, alignItems:"center", justifyContent:"center", backgroundColor:"#5865f2"},
        done:{width:40, height:40, borderRadius:20, alignItems:"center", justifyContent:"center", backgroundColor:"#23a55a"},
        chip:{width:34, height:34, borderRadius:17, alignItems:"center", justifyContent:"center", backgroundColor:"#4e50584d"},
        button:{flex:1, height:40, borderRadius:20, alignItems:"center", justifyContent:"center"}};
    function starterCard() {
        const s = useThemed("starter", c => ({card:Object.assign({}, STARTER_DARK.card, {backgroundColor:c.CARD_BACKGROUND_DEFAULT}),
            badge:Object.assign({}, STARTER_DARK.badge, {backgroundColor:c.BACKGROUND_BRAND || "#5865f2"}),
            done:Object.assign({}, STARTER_DARK.done, {backgroundColor:c.STATUS_POSITIVE || c.TEXT_POSITIVE || "#23a55a"}),
            chip:Object.assign({}, STARTER_DARK.chip, {backgroundColor:c.BACKGROUND_MOD_SUBTLE}), button:STARTER_DARK.button}), STARTER_DARK);
        if (!starterVisible()) return null;
        const Text = inspectedExport(5088, "Text"), Button = inspectedExport(5379, "Button"), Press = RN.Pressable || RN.View;
        const line = (value, variant, color, fallback, extra) => Text ? el(Text, Object.assign({variant, color}, extra), value) : el(RN.Text, Object.assign({style:fallback}, extra), value);
        const done = !!starter.justOn, keys = done ? starter.justOn : starterKeys();
        const title = done ? pl(keys.length, "{n} feature turned on", "{n} features turned on") : tr("Start with the essentials");
        const titleOf = key => { const row = featureSearch.rows.find(entry => entry.key === key); return row ? tr(row.title) : key; };
        const starterAction = (key, label, variant, onPress) => Button ? el(RN.View, {key, style:{flex:1}}, el(Button, {text:label, size:"md", variant, grow:true, onPress})) :
            el(Press, {key, onPress, accessibilityRole:"button", accessibilityLabel:label,
                style:[s.button, {backgroundColor:variant === "primary" ? "#5865f2" : "#4e505899"}]},
                el(RN.Text, {style:{color:"#ffffff", fontWeight:"600", fontSize:14}}, label));
        return el(RN.View, {key:"starter", style:s.card},
            el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:14}},
                // The badge pops when the card turns into its done state.
                popIn(done ? "starter:done" : "starter:offer", el(RN.View, {style:done ? s.done : s.badge},
                    el(done ? venusIcon(6823, "CheckmarkSmallIcon") : venusIcon(17143, "SparklesIcon"), {size:"md", color:"#ffffff"}))),
                el(RN.View, {style:{flex:1, gap:2}},
                    line(title, "text-md/semibold", "text-strong", {color:"#f2f3f5", fontSize:16, fontWeight:"600"}, {accessibilityRole:"header"}),
                    line(tr(done ? "They're switched on below. Open any of them to fine-tune it." :
                        "Popular features that work on their own: nothing to sign in to, no outside services and no restart. Change any of them later."),
                        "text-sm/medium", "text-muted", {color:"#949ba4", fontSize:14}))),
            // What you get, shown as the features' own icons rather than a list of names.
            el(RN.View, {style:{flexDirection:"row", flexWrap:"wrap", gap:8}, accessible:true, accessibilityLabel:joinAnd(keys.map(titleOf))},
                keys.map(key => { const found = FEATURE_ICONS[key]; return el(RN.View, {key, style:s.chip}, found ? el(venusIcon(found[0], found[1]), {size:"sm"}) : null); })),
            el(RN.View, {style:{flexDirection:"row", gap:10}},
                done ? [starterAction("undo", tr("Undo"), "secondary", starterUndo), starterAction("ok", tr("Done"), "primary", starterClose)] :
                    [starterAction("later", tr("Not now"), "secondary", starterClose), starterAction("on", tr("Turn them on"), "primary", starterTurnOn)]));
    }
    // The Features list: Discord's own settings list, with the search bar as its header. While you search it only keeps
    // the rows that match, still under their group titles, and the search clears when you leave the page.
    function featuresPage(groups) {
        const full = {type:"list", sections:groups.map(([label, ids]) => section(label, ids)).filter(entry => entry.settings.length)};
        let header = null, filtered = null;
        return function VenusFeaturesPage() {
            useFeatureSearch();
            React.useEffect(() => () => { featureSearch.query = ""; featureSearch.cache = null; }, []);
            const List = SettingsList || (SettingsList = inspectedExport(14971, "SettingsList"));
            if (!React || !List) return null;
            if (!header) full.ListHeaderComponent = header = el(FeatureSearchBar, {key:"venus-search"});
            const query = featureSearch.query.trim();
            if (!query) return el(List, {node:full});
            const ids = featureMatches(query);
            if (!filtered || filtered.ids !== ids)
                filtered = {ids, node:{type:"list", ListHeaderComponent:header,
                    sections:groups.map(([label, list]) => section(label, list.filter(id => ids.has(id)))).filter(entry => entry.settings.length)}};
            return el(List, {node:filtered.node});
        };
    }
    function settingNode(key, title, description, parent) {
        const node = { type: "toggle", parent, useTitle: () => { useLanguage(); return tr(title); },
            useValue: function () { useSettings(key); return settings[key]; },
            onValueChange: value => turnOnAsking(key, value) };
        // No description, no empty second line under the title.
        if (description) node.useDescription = () => tr(description);
        return node;
    }
    // Force system font applies from the next start: React Native measures text once but re-reads the
    // font on every draw, so switching mid-session would draw the new font in space sized for the old one.
    // Force system emojis is the same: Discord's native chat draws each emoji once and keeps it.
    // Each one reopens Discord through its own native method, so no method carries two Venus guards.
    function askRestart(kind) {
        const font = kind === "font";
        if (!features[font ? "systemFont" : "systemEmoji"] || !RN) return;
        const on = settings[font ? "systemFont" : "systemEmoji"];
        const title = tr(font ? (on ? "Use your phone's font" : "Use Discord's font") : (on ? "Use your phone's emojis" : "Use Discord's emojis"));
        const body = tr(font ? "Discord needs to reopen to change the font everywhere." : "Discord needs to reopen to change the emojis everywhere.");
        const reopen = () => {
            // Write the setting first, so the reopened Discord starts with it. If it can't be saved, Discord used to
            // reopen anyway with the old setting; now it stays open and says so.
            if (!files) return;
            Promise.resolve().then(() => files.writeFile("documents", PREFS, settingsSnapshot(), "utf8")).then(
                () => Promise.resolve(font ? files.fileExists("venus-font-v1:restart") : files.getVideoDimensions("venus-emoji-v1:restart")).catch(() => {}),
                () => { status.storage = "save failed (session only)"; notify();
                    showProblem("Couldn't save the setting", tr("Discord didn't reopen, so nothing changed. Try again in a moment.")); });
        };
        // Discord's own dialog, like every other Venus question; Android's plain alert only if it isn't there.
        const ui = reviewUI();
        if (ui.alerts && typeof ui.alerts.show === "function") try {
            ui.alerts.show({title, body, confirmText:tr("Reopen now"), cancelText:tr("Later"), onConfirm:reopen}); return;
        } catch (_) {}
        if (RN.Alert) RN.Alert.alert(title, body, [{text:tr("Later"), style:"cancel"}, {text:tr("Reopen now"), onPress:reopen}]);
    }
    // A main-list row with its own switch and a small arrow to its page. Tapping anywhere else on the row opens the page too,
    // so the arrow only has to say "there's more": no divider and no filled circle, which used to take a third of the row
    // and squeeze the title and description into a narrow column.
    // Features that can get an account in trouble (#81): their Features row says so with red Risky and Experimental chips
    // under the title, and switching one on asks first in Discord's own dialog. Switching off, restoring a backup and
    // Reset never ask. The switch is controlled, so it stays off until you confirm.
    const RISKY_FEATURES = {badges:() => tr("This is experimental. It tells Discord you're playing games you aren't, which breaks Discord's Terms of Service and could get your account suspended or banned.")};
    // Cancelling remounts the switch (riskCancels is in its key), so a native switch that already slid on slides back.
    let riskCancels = 0;
    function turnOnAsking(key, value) {
        if (!value || !RISKY_FEATURES[key] || settings[key]) { setSetting(key, value); return; }
        const cancel = () => { riskCancels++; notify(key); };
        const title = tr("Are you sure?"), body = RISKY_FEATURES[key](), yes = tr("Turn on"), ui = reviewUI();
        const confirm = () => { animateLayout(); setSetting(key, true); };
        if (ui.alerts && typeof ui.alerts.show === "function") try {
            ui.alerts.show({title, body, confirmText:yes, cancelText:tr("Cancel"), confirmColor:(inspectedExport(1203, "ButtonColors") || {}).RED, onConfirm:confirm, onCancel:cancel}); return;
        } catch (_) {}
        if (RN && RN.Alert) RN.Alert.alert(title, body, [{text:tr("Cancel"), style:"cancel", onPress:cancel}, {text:yes, style:"destructive", onPress:confirm}],
            {cancelable:true, onDismiss:cancel});
        else cancel();
    }
    const RISK_CHIP_DARK = {row:{flexDirection:"row", flexWrap:"wrap", gap:6, marginTop:4, marginBottom:2},
        chip:{flexDirection:"row", alignItems:"center", gap:4, height:20, paddingLeft:6, paddingRight:8, borderRadius:10, borderWidth:1,
            borderColor:"#f23f43", backgroundColor:"#f23f431f"}, text:{color:"#f57376", fontSize:11, fontWeight:"700", letterSpacing:0.3}};
    // The row's description with the chips above it: [⚠ Risky] [⚗ Experimental], outlined in Discord's danger red.
    function RiskyDescription(props) {
        useLanguage();
        const s = useRiskChips();
        const Text = inspectedExport(5088, "Text");
        return el(RN.View, {accessible:true, accessibilityLabel:tr("Risky") + ", " + tr("Experimental") + ". " + tr(props.hint)},
            riskChips(s),
            Text ? el(Text, {variant:"text-xs/medium", color:"text-subtle"}, tr(props.hint)) : el(RN.Text, {style:{color:"#949ba4", fontSize:12}}, tr(props.hint)));
    }
    function riskChips(s, flush) {
        const chip = (key, Icon, label) => el(RN.View, {key, style:s.chip},
            el(Icon, {size:"xxs", color:s.text.color}),
            el(RN.Text, {numberOfLines:1, style:s.text}, tr(label).toLocaleUpperCase()));
        return el(RN.View, {style:flush ? [s.row, {marginTop:0, marginBottom:0}] : s.row}, chip("risky", venusIcon(7567, "WarningIcon"), "Risky"), chip("experimental", venusIcon(15894, "BeakerIcon"), "Experimental"));
    }
    function useRiskChips() {
        return useThemed("riskChips", c => ({row:RISK_CHIP_DARK.row,
            chip:Object.assign({}, RISK_CHIP_DARK.chip, {borderColor:c.BORDER_FEEDBACK_CRITICAL || c.TEXT_FEEDBACK_CRITICAL, backgroundColor:c.BACKGROUND_FEEDBACK_CRITICAL}),
            text:Object.assign({}, RISK_CHIP_DARK.text, {color:c.TEXT_FEEDBACK_CRITICAL})}), RISK_CHIP_DARK);
    }
    // The top of a risky feature's page: a card outlined in red with the same chips and what the risk is.
    const RISK_CARD_DARK = {card:{borderRadius:16, borderWidth:1.5, borderColor:"#f23f43", backgroundColor:"#f23f4314", paddingHorizontal:16, paddingVertical:14, gap:8,
        flexDirection:"row", alignItems:"flex-start"}, badge:{width:36, height:36, borderRadius:18, alignItems:"center", justifyContent:"center", backgroundColor:"#f23f4329"}};
    function riskCard(key, body) {
        const s = useRiskChips(), c = useThemed("riskCard", t => ({card:Object.assign({}, RISK_CARD_DARK.card, {borderColor:t.BORDER_FEEDBACK_CRITICAL || t.TEXT_FEEDBACK_CRITICAL,
            backgroundColor:t.BACKGROUND_FEEDBACK_CRITICAL}), badge:RISK_CARD_DARK.badge}), RISK_CARD_DARK);
        const Warn = venusIcon(7567, "WarningIcon");
        return el(RN.View, {key, style:[c.card, {gap:12}], accessible:true, accessibilityLabel:tr("Risky") + ", " + tr("Experimental") + ". " + tr(body)},
            el(RN.View, {style:c.badge}, el(Warn, {size:"sm", color:s.text.color})),
            el(RN.View, {style:{flex:1, gap:6}},
                riskChips(s, true),
                badgeText(tr(body), "text-sm/medium", "text-default", {color:"#dbdee1", fontSize:14})));
    }
    let stackNavigation, trailingSwitch, trailingChevron;
    function SubpageTrailing(props) {
        useSettings(props.setting);
        // Kept once found; a missing one is looked up again next render, in case its module loads later.
        const FormSwitch = trailingSwitch || (trailingSwitch = inspectedExport(6897, "FormSwitch"));
        const Chevron = trailingChevron || (trailingChevron = inspectedExport(6906, "ChevronSmallRightIcon"));
        const Press = RN.Pressable || RN.TouchableOpacity || RN.View;
        const on = !!settings[props.setting];
        return el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:2}},
            FormSwitch ? el(FormSwitch, {key:"switch:" + riskCancels, value:on, accessibilityLabel:props.label, onValueChange:value => turnOnAsking(props.setting, value)}) : null,
            // A 24 dp arrow with a full 44 dp touch target, the same arrow Discord puts on rows that open a page.
            el(Press, {style:{width:24, height:24, alignItems:"center", justifyContent:"center", marginRight:-4}, onPress:props.open,
                accessibilityRole:"button", accessibilityLabel:tr("More options"), hitSlop:{top:10, bottom:10, left:8, right:10}},
                Chevron ? el(Chevron, {size:"sm"}) : el(RN.Text, {style:{fontSize:18, color:"#b5bac1"}}, "\u203A")));
    }
    function nativeRegistry(registry) {
        if (!registry || !registry.ACCOUNT || registry.VENUS_GENERAL) return registry;
        const next = Object.assign({}, registry);
        const icon = registry.ACCOUNT.IconComponent;
        function route(key, title, sections, parent, IconComponent) {
            const page = settingsPage(sections);
            next[key] = { type: "route", parent, useTitle: () => { useLanguage(); return tr(title); }, IconComponent: IconComponent || icon,
                screen: { route: key, getComponent: () => page } };
        }
        // About: the version and how many features are on, whether settings are saved, and where to get help.
        next.VENUS_VERSION = { type: "static", parent: "VENUS_GENERAL", IconComponent: venusIcon(9071, "TagIcon", icon),
            useTitle: () => "Venus Patches " + revision, useDescription: function () { useSettings(); return featureSummary(); } };
        next.VENUS_STATUS = { type: "static", parent: "VENUS_GENERAL", IconComponent: venusIcon(5046, "CircleInformationIcon", icon),
            useTitle: () => { useLanguage(); return tr("Status"); }, useDescription: function () { useSettings(); return aboutText(); } };
        const links = [];
        function link(id, title, hint, url, iconId, iconName) {
            links.push(id);
            next[id] = { type: "pressable", parent: "VENUS_GENERAL", unsearchable: true, withArrow: true, useTitle: () => { useLanguage(); return tr(title); },
                useDescription: () => tr(hint), onPress: () => openLink(url), IconComponent: venusIcon(iconId, iconName, icon) };
        }
        link("VENUS_LINK_CHANGES", "What's new", "Changes in each release.", REPO + "/blob/main/CHANGELOG.md", 17143, "SparklesIcon");
        link("VENUS_LINK_ISSUES", "Report a problem", "Opens a new issue on GitHub.", REPO + "/issues/new/choose", 16121, "BugIcon");
        link("VENUS_LINK_SOURCE", "Source code", "Venus Patches on GitHub. Free and open source (GPL-3.0).", REPO, 7701, "LinkExternalSmallIcon");
        route("VENUS_GENERAL", "About", [section("Venus Patches", ["VENUS_VERSION", "VENUS_STATUS"]), section("Links", links)], undefined,
            venusIcon(5046, "CircleInformationIcon", icon));
        // The nodes above stay for Discord's settings search; the page itself is the designed About page.
        next.VENUS_GENERAL.screen.getComponent = () => AboutSettings;
        // The features list: each row says what it does, grouped by where you'll notice it.
        const P = "VENUS_PLUGINS";
        const groups = {messages:[], sending:[], people:[], servers:[], appearance:[], quests:[]};
        const iconFor = key => { const found = FEATURE_ICONS[key]; return found ? venusIcon(found[0], found[1], icon) : icon; };
        featureGroups = groups.keys = {messages:[], sending:[], people:[], servers:[], appearance:[], quests:[]};
        featureSearch.rows = []; featureSearch.cache = null;
        const groupLabel = group => (FEATURE_GROUPS.find(entry => entry[0] === group) || [])[1];
        function toggle(group, key, title, hint) {
            if (!features[key]) return;
            groups.keys[group].push(key);
            const id = "VENUS_" + key.toUpperCase(); groups[group].push(id);
            featureSearch.rows.push({id, key, title, hint, group:groupLabel(group)});
            next[id] = settingNode(key, title, hint, P);
            next[id].IconComponent = iconFor(key);
        }
        // A switch plus a button to its own page. Tapping the row opens the page too; the page keeps
        // a short title in Discord's header, read from its route node like any Discord settings page.
        const navigators = new Map();
        function withOptions(group, key, id, title, hint, pageTitle, page) {
            if (!features[key]) return;
            groups.keys[group].push(key);
            // Option pages are built only for patched settings, so unpatched ones leave no nodes behind.
            if (typeof page === "function" && !page.prototype) page = page();
            if (page && page.sections && page.page) { route(id, pageTitle, page.sections, P, iconFor(key)); const Page = page.page; next[id].screen.getComponent = () => Page; }
            else if (Array.isArray(page)) route(id, pageTitle, page, P, iconFor(key));
            else { route(id, pageTitle, [], P, iconFor(key)); next[id].screen.getComponent = () => page; }
            const screen = next[id].screen, rowId = id + "_ROW";
            const open = () => {
                const navigation = navigators.get(rowId);
                if (!navigation) return;
                try { global.__r(14974).onRouteSettingOnPress({navigation, screen}); }
                catch (_) { try { navigation.navigate(screen.route); } catch (__) {} }
            };
            groups[group].push(rowId);
            featureSearch.rows.push({id:rowId, key, title, hint, page:pageTitle, group:groupLabel(group)});
            next[rowId] = { type: "pressable", parent: P, unsearchable: true, useTitle: () => { useLanguage(); return tr(title); }, onPress: open, IconComponent: iconFor(key),
                useTrailing: function () {
                    // Called as a hook by Discord's row, so it can read the settings stack it's in.
                    // Resolved once, so the row always calls the same number of hooks.
                    if (stackNavigation === undefined) stackNavigation = inspectedExport(1503, "useStackNavigation") || null;
                    navigators.set(rowId, stackNavigation ? stackNavigation() : null);
                    return el(SubpageTrailing, {setting:key, label:tr(title), open});
                } };
            if (hint) next[rowId].useDescription = RISKY_FEATURES[key] ? () => el(RiskyDescription, {hint}) : () => tr(hint);
        }
        // Option IDs are the ones earlier releases used, so nothing that points at them moves.
        const OPTION_IDS = {emojis:"VENUS_EMOJIS", stickers:"VENUS_STICKERS", hyperlinks:"VENUS_HYPERLINKS", pastelAll:"VENUS_PASTELALL", pastelContent:"VENUS_PASTELCONTENT", piDmHeader:"VENUS_PI_DM", piUserList:"VENUS_PI_LIST", piProfile:"VENUS_PI_PROFILE", piHideMobile:"VENUS_PI_MOBILE"};
        const option = (key, title, hint, parent) => {
            const id = OPTION_IDS[key], owner = featureFor(key), node = settingNode(key, title, hint, parent);
            // Greyed out while the main switch on the features list is off.
            node.useIsDisabled = function () { useSettings(owner); return !settings[owner]; };
            next[id] = node; return id;
        };
        // Messages
        withOptions("messages", "noDelete", "VENUS_NODELETE", "Keep deleted messages", "Deleted messages stay in chat, and edits keep their history.", "Deleted messages", NoDeleteSettings);
        withOptions("messages", "messageHighlight", "VENUS_MESSAGEHIGHLIGHT", "Message highlights", "Pick bar width and colors for replies, mentions and deleted messages.", "Message highlights", MessageHighlightSettings);
        withOptions("messages", "translate", "VENUS_TRANSLATE", "Translate messages", "Shows messages in your language, using Google Translate.", "Translate messages", TranslateSettings);
        withOptions("messages", "gestures", "VENUS_GESTURES", "Double-tap to reply", "Double-tap to reply, or to edit your own message.", "Tap gestures", GestureSettings);
        toggle("messages", "quickDelete", "Skip delete confirmation", "Deletes messages without asking first. Can't be undone.");
        toggle("messages", "jumpToTop", "Jump to first message", "A button to jump to the start of any chat.");
        toggle("messages", "favouriteAnything", "Favourite any image or video", "Star any image or video to keep it in your GIF favourites.");
        // Sending
        withOptions("sending", "freeNitro", "VENUS_FREENITRO", "Send Nitro stickers and emojis as links", "Sends Nitro emojis and stickers as links that show as the image.", "Nitro stickers and emojis",
            () => ({page:FreeNitroSettings, sections:[section("Send as links", [option("emojis", "Emojis", "Emojis from other servers, and animated emojis.", "VENUS_FREENITRO"),
                option("stickers", "Stickers", "Stickers from other servers. Animated ones may not move.", "VENUS_FREENITRO")]),
             section("Link style", [option("hyperlinks", "Short links", "In chat it looks the same either way. Short links only change what's copied or quoted.", "VENUS_FREENITRO")])]}));
        withOptions("sending", "tenorGifs", "VENUS_TENORGIFS", "Bring back Tenor GIFs", "Tenor GIFs show in Discord's GIF picker again.", "Tenor GIFs", TenorSettings);
        withOptions("sending", "fixEmbeds", "VENUS_FIXEMBEDS", "Fix link previews", "Links to X, Instagram, TikTok, Reddit and more show the post.", "Link previews", FixEmbedsSettings);
        toggle("sending", "voice", "Send audio as voice messages", "Audio files are sent as voice messages. Android 10 or newer.");
        toggle("sending", "splitMessages", "Send long messages", "Type past the limit. Long messages are sent in parts.");
        toggle("sending", "noTyping", "Hide typing indicator", "Others won't see when you're typing.");
        toggle("sending", "picker", "Show file sizes when attaching", "Photos and videos in the picker show their size.");
        // People
        withOptions("people", "pastelize", "VENUS_PASTELIZE", "Pastel name colors", "Names without a role color get a soft pastel one.", "Pastel names",
            () => ({page:PastelSettings, sections:[section("Colors", [option("pastelAll", "Replace role colors", "Every name uses its pastel color, even with a role color.", "VENUS_PASTELIZE"),
                option("pastelContent", "Color message text", "What people write is colored too, in a lighter shade of their name.", "VENUS_PASTELIZE")])]}));
        withOptions("people", "platformIndicators", "VENUS_PLATFORMINDICATORS", "Show device indicators", "Shows which devices people are on, next to their names.", "Device indicators",
            () => ({page:PlatformSettings, sections:[section("Show icons", [option("piDmHeader", "In DMs", "Next to the name at the top of a DM.", "VENUS_PLATFORMINDICATORS"),
                option("piUserList", "In lists", "Member list, friends, DM list and voice channels.", "VENUS_PLATFORMINDICATORS"),
                option("piProfile", "On profiles", "Next to the name on a profile.", "VENUS_PLATFORMINDICATORS")]),
             section("Avatars", [option("piHideMobile", "Hide the phone badge", "Avatars show a plain status dot, since the icons already show mobile.", "VENUS_PLATFORMINDICATORS")])]}));
        toggle("people", "validUser", "Fix unknown mentions", "Shows names instead of @unknown-user.");
        toggle("people", "copyBios", "Copy profile bios", "Hold a bio to select and copy it.");
        withOptions("people", "reviewDB", "VENUS_REVIEWDB", "User and server reviews", "Read and write ReviewDB reviews on profiles and servers.", "Reviews", ReviewSettings);
        withOptions("people", "userNotif", "VENUS_USERNOTIF", "User activity notifications", "Get notified when chosen people change status, type or message.", "Activity notifications", UserNotifSettings);
        withOptions("people", "accountSwitcher", "VENUS_ACCOUNTSWITCHER", "Account switcher", "Switch between Discord accounts in one tap.", "Account switcher", AccountSwitcherSettings);
        // Servers
        withOptions("servers", "readAll", "VENUS_READALL", "Read all button", "A button that marks servers and DMs as read.", "Read all", ReadAllSettings);
        withOptions("servers", "hiddenChannels", "VENUS_HIDDENCHANNELS", "Show hidden channels", "Channels you can't open show with a lock. Messages stay hidden.", "Hidden channels", HiddenChannelsSettings);
        withOptions("servers", "serverInfo", "VENUS_SERVERINFO", "Server info", "Hold a server's icon to see its details, boosts and friends there.", "Server info", ServerInfoSettings);
        toggle("servers", "dashless", "Spaces in channel names", "Shows \"general chat\" instead of \"general-chat\".");
        // Appearance
        toggle("appearance", "systemFont", "Use your phone's font", "Replaces Discord's font everywhere. Android 9 or newer.");
        toggle("appearance", "systemEmoji", "Use your phone's emojis", "In chat, reactions and the emoji picker.");
        toggle("appearance", "hideGift", "Hide the gift button", "Removes the gift button from the message bar.");
        toggle("appearance", "hideCall", "Hide the call button", "Removes Call from people's profiles.");
        withOptions("appearance", "hideButtons", "VENUS_HIDEBUTTONS", "Hide extra buttons", "Removes the Quests, Shop, Nitro and Apps buttons you don't use.", "Extra buttons", HideButtonsSettings);
        toggle("appearance", "youBarSettings", "Venus button on profile bar", "A shortcut to Venus next to the notifications bell.");
        toggle("appearance", "appIcons", "Unlock app icons", "Use any Discord app icon without Nitro.");
        toggle("appearance", "nitroThemes", "Unlock Nitro themes", "Use Discord's gradient themes without Nitro, on this phone.");
        withOptions("appearance", "customThemes", "VENUS_CUSTOMTHEMES", "Custom themes", "Install Revenge and Vendetta color themes from a link.", "Custom themes", CustomThemesSettings);
        withOptions("appearance", "iconPacks", "VENUS_ICONPACKS", "Icon packs", "Replace Discord's icons with community icon packs or a custom pack.", "Icon packs", IconPacksSettings);
        // Quests
        withOptions("quests", "quests", "VENUS_QUESTS", "Complete Quests automatically", "Finishes video, Play and Activity Quests in the background.", "Quests", QuestSettings);
        toggle("quests", "hideQuestDock", "Hide the Quests banner", "Removes the Quest promotion above your profile bar.");
        withOptions("quests", "badges", "VENUS_BADGES", "Complete badges automatically", "Plays real PC games in the background for game time and unique games.", "Badges", BadgeSettings);
        const listed = [["Messages", groups.messages], ["Sending", groups.sending], ["People", groups.people],
            ["Servers", groups.servers], ["Appearance", groups.appearance], ["Quests", groups.quests]];
        const sections = listed.map(([label, ids]) => section(label, ids)).filter(entry => entry.settings.length);
        route(P, "Features", sections, undefined, venusIcon(15241, "PuzzlePieceIcon", icon));
        // The nodes above stay for Discord's settings search; the page itself adds the Features search bar.
        const FeaturesPage = featuresPage(listed);
        next[P].screen.getComponent = () => FeaturesPage;
        // "5 of 26 on", right on the entry, so you see at a glance what Venus is doing before opening it.
        next[P].useDescription = function () {
            useSettings();
            const keys = Object.keys(FEATURE_ICONS).filter(key => features[key]);
            return tr("{on} of {total} turned on", {on:keys.filter(key => settings[key]).length, total:keys.length});
        };
        // Language: the language Venus settings are shown in, Discord's own by default.
        route("VENUS_LANGUAGE", "Language", [], undefined, venusIcon(15723, "LanguageIcon", icon));
        next.VENUS_LANGUAGE.screen.getComponent = () => LanguageSettings;
        next.VENUS_LANGUAGE.useDescription = function () { useLanguage(); return languageLabel(settings.language); };
        // Backup and restore (#68): save every Venus setting to a file or the clipboard and bring it back after patching again.
        route("VENUS_BACKUP", "Backup and restore", [], undefined, venusIcon(11841, "ArrowsUpDownIcon", icon));
        next.VENUS_BACKUP.screen.getComponent = () => BackupSettings;
        next.VENUS_BACKUP.useDescription = function () { useSettings(); return backup.last ? backupAgo() : tr("Save your settings or bring them back."); };
        status.menu = true;
        return next;
    }
    // Which patched features sit in which group of the Features list, for the About page.
    let featureGroups = null;
    const FEATURE_GROUPS = [["messages", "Messages", 8194, "ChatIcon"], ["sending", "Sending", 5040, "SendMessageIcon"], ["people", "People", 4815, "FriendsIcon"],
        ["servers", "Servers", 9239, "ServerIcon"], ["appearance", "Appearance", 15560, "PaintPaletteIcon"], ["quests", "Quests", 13012, "QuestsIcon"]];
    // Is Venus working? One word and a colored dot, the way Discord shows a status.
    function aboutHealth() {
        const storage = status.storage;
        if (storage === "ready" || storage === "saved") return status.archive === "save failed" || status.archive === "restore failed" || status.audioError ? "idle" : "online";
        if (storage === "waiting" || storage === "loading") return "idle";
        return "dnd";
    }
    const ABOUT_DARK = {hero:{backgroundColor:"#2b2d31", borderRadius:16, padding:20, alignItems:"center", gap:6},
        logo:{width:64, height:64, borderRadius:32, alignItems:"center", justifyContent:"center", backgroundColor:"#5865f2", marginBottom:6},
        chip:{flexDirection:"row", alignItems:"center", gap:6, paddingHorizontal:10, paddingVertical:6, borderRadius:14, backgroundColor:"#4e50584d"},
        card:{backgroundColor:"#2b2d31", borderRadius:16, paddingHorizontal:16, paddingVertical:14, gap:10}};
    // About: who you're running, how much of it is on, whether it's healthy, and where to go next.
    function AboutSettings() {
        useSettings();
        const ui = reviewUI();
        if (!React || !RN) return null;
        const s = useThemed("about", c => ({hero:Object.assign({}, ABOUT_DARK.hero, {backgroundColor:c.CARD_BACKGROUND_DEFAULT}),
            logo:Object.assign({}, ABOUT_DARK.logo, {backgroundColor:c.BACKGROUND_BRAND || "#5865f2"}),
            chip:Object.assign({}, ABOUT_DARK.chip, {backgroundColor:c.BACKGROUND_MOD_SUBTLE}),
            card:Object.assign({}, ABOUT_DARK.card, {backgroundColor:c.CARD_BACKGROUND_DEFAULT})}), ABOUT_DARK);
        const Text = inspectedExport(5088, "Text"), Group = ui.TableRowGroup || RN.View, Row = ui.TableRow;
        const text = (value, variant, color, fallback) => Text ? el(Text, {variant, color}, value) : el(RN.Text, {style:fallback}, value);
        const keys = Object.keys(FEATURE_ICONS).filter(key => features[key]), on = keys.filter(key => settings[key]).length;
        const health = aboutHealth(), Sparkles = venusIcon(17143, "SparklesIcon");
        const chips = FEATURE_GROUPS.map(([group, label, id, name]) => {
            const list = featureGroups && featureGroups[group] || [];
            if (!list.length) return null;
            const count = list.filter(key => settings[key]).length;
            return el(RN.View, {key:group, style:[s.chip, {opacity:count ? 1 : 0.6}], accessible:true, accessibilityLabel:tr(label) + ": " + count + "/" + list.length},
                el(venusIcon(id, name), {size:"xs"}), text(tr(label) + " " + count + "/" + list.length, "text-xs/semibold", count ? "text-strong" : "text-muted", {color:"#dbdee1", fontSize:12}));
        });
        const linkRow = (key, label, sub, url, id, name) => Row ? el(Row, {key, label:tr(label), subLabel:tr(sub), icon:rowIcon(id, name), arrow:true, onPress:() => openLink(url)}) : null;
        const groups = [
            el(RN.View, {key:"hero", style:s.hero, accessible:true},
                popIn("logo", el(RN.View, {style:s.logo}, el(Sparkles, {size:"lg", color:"#ffffff"}))),
                text("Venus Patches " + revision, "heading-lg/bold", "text-strong", {color:"#f2f3f5", fontSize:20, fontWeight:"700"}),
                text(tr("For Discord {version}", {version:DISCORD_VERSION}), "text-sm/medium", "text-muted", {color:"#949ba4", fontSize:14})),
            el(RN.View, {key:"features", style:s.card},
                text(keys.length ? tr("{on} of {total} turned on", {on, total:keys.length}) : tr("No features were patched in."), "text-md/semibold", "text-strong", {color:"#f2f3f5", fontSize:16, fontWeight:"600"}),
                keys.length ? el(VenusProgress, {key:"bar", value:on / keys.length}) : null,
                el(RN.View, {style:{flexDirection:"row", flexWrap:"wrap", gap:8, marginTop:4}}, chips)),
            el(RN.View, {key:"status", style:[s.card, {flexDirection:"row", alignItems:"center", gap:14}]},
                el(RN.View, {style:{width:12, height:12, borderRadius:6, backgroundColor:STATUS_HEX[health]}}),
                el(RN.View, {style:{flex:1, gap:2}},
                    text(tr(health === "online" ? "Everything's working" : health === "idle" ? (status.storage === "waiting" || status.storage === "loading" ? "Loading your settings" : "Working, with a note below") : "Something went wrong"),
                        "text-md/semibold", "text-strong", {color:"#f2f3f5", fontSize:16, fontWeight:"600"}),
                    text(aboutText(), "text-sm/medium", "text-muted", {color:"#949ba4", fontSize:14}))),
            el(Group, {key:"links", title:tr("Links")},
                linkRow("changes", "What's new", "Changes in each release.", REPO + "/blob/main/CHANGELOG.md", 17143, "SparklesIcon"),
                linkRow("issues", "Report a problem", "Opens a new issue on GitHub.", REPO + "/issues/new/choose", 16121, "BugIcon"),
                linkRow("source", "Source code", "Venus Patches on GitHub. Free and open source (GPL-3.0).", REPO, 7701, "LinkExternalSmallIcon")),
            footnote("note", "Nothing is tracked, and everything works offline except the features that say they use a service.")];
        return settingsBody(ui, groups);
    }
    function languageLabel(code) {
        if (code === "auto") { const shown = UI_LANGUAGES.find(entry => entry[0] === uiLanguage()); return tr("Same as Discord ({language})", {language:shown ? shown[1] : "English"}); }
        const found = UI_LANGUAGES.find(entry => entry[0] === code);
        return found ? found[1] : code;
    }
    // Each language is listed in its own words, with its English name under it, so you can find yours in any language.
    function LanguageSettings() {
        useSettings("language");
        const ui = reviewUI();
        if (!React || !RN) return null;
        const choices = [["auto", tr("Same as Discord"), tr("Follows Discord's Language setting.")]].concat(UI_LANGUAGES.map(([code, name, english]) => [code, name, english]));
        const groups = [
            radioGroup(ui, "language", "Show Venus settings in", "language", true, choices, true),
            footnote("note", i18n.loading.has(uiLanguage()) ? "Loading the language…" : "Only Venus's own settings and messages change. Discord's language is set in Discord's Language settings.")];
        return settingsBody(ui, groups);
    }
    // Backup and restore (#68): every Venus setting in one small JSON file, so patching again or a new phone doesn't
    // mean setting everything up again. Never includes the ReviewDB sign-in, saved accounts or kept deleted messages.
    const BACKUP_APP = "Venus Patches", BACKUP_FORMAT = 1, BACKUP_MAX_BYTES = 1024 * 1024;
    function backupDate(ms) {
        const d = new Date(ms), pad = n => (n < 10 ? "0" : "") + n;
        return d.getFullYear() + "-" + pad(d.getMonth() + 1) + "-" + pad(d.getDate());
    }
    // "Last backup 3 days ago", from the plural forms every language already has.
    function backupAgo() {
        const diff = Math.max(0, Date.now() - backup.last), minute = 60000, hour = 60 * minute, day = 24 * hour;
        const time = diff < minute ? tr("just now") : tr("{time} ago", {time:diff < hour ? pl(Math.floor(diff / minute), "{n} minute", "{n} minutes") :
            diff < day ? pl(Math.floor(diff / hour), "{n} hour", "{n} hours") : pl(Math.floor(diff / day), "{n} day", "{n} days")});
        return tr("Last backup {time}", {time});
    }
    // What a backup holds right now, for the page's summary: features on, options changed, people watched, themes, icon packs.
    function backupContents() {
        const defaults = defaultSettings();
        const keys = Object.keys(FEATURE_ICONS).filter(key => features[key]);
        const changed = Object.keys(defaults).filter(key => key !== "language" && !owns(FEATURE_ICONS, key) && features[featureFor(key)] &&
            settings[key] !== defaults[key]).length;
        return {on:keys.filter(key => settings[key]).length, total:keys.length, changed, people:features.userNotif ? userNotif.ids.size : 0,
            themes:features.customThemes ? customThemes.list.length : 0,
            iconPacks:features.iconPacks ? (iconPacks.active ? 1 : 0) + iconPacks.custom.length : 0,
            language:settings.language !== "auto"};
    }
    function backupIsDefault() {
        const defaults = defaultSettings();
        return Object.keys(defaults).every(key => !features[featureFor(key)] && key !== "language" || settings[key] === defaults[key]);
    }
    function backupText() {
        const out = {app:BACKUP_APP, format:BACKUP_FORMAT, version:revision, created:new Date().toISOString(), settings:Object.assign({}, settings)};
        if (features.userNotif && userNotif.ids.size) out.people = Array.from(userNotif.ids);
        if (features.customThemes && customThemes.list.length) out.themes = {active:customThemes.active || "", list:customThemes.list.slice(0, THEMES_MAX)};
        if (features.iconPacks && (iconPacks.active || iconPacks.custom.length))
            out.iconPacks = {active:iconPacks.active || "", custom:iconPacks.custom.slice(0, ICONPACKS_MAX_CUSTOM)};
        return JSON.stringify(out, null, 1);
    }
    // A backup, or a plain venus-patches.json settings file, read back. Throws a message you can show when it isn't one.
    function backupParse(text) {
        if (typeof text !== "string" || !text.trim()) throw new Error(tr("That isn't a Venus backup."));
        if (text.length > BACKUP_MAX_BYTES) throw new Error(tr("That backup is too large."));
        let data;
        try { data = JSON.parse(text.trim()); } catch (_) { throw new Error(tr("That isn't a Venus backup.")); }
        if (!data || typeof data !== "object" || Array.isArray(data)) throw new Error(tr("That isn't a Venus backup."));
        const wrapped = data.app === BACKUP_APP && data.settings && typeof data.settings === "object" && !Array.isArray(data.settings);
        if (wrapped && typeof data.format === "number" && data.format > BACKUP_FORMAT) throw new Error(tr("This backup is from a newer Venus. Update Venus to restore it."));
        const raw = migrateSettings(Object.assign({}, wrapped ? data.settings : data)), values = {}, defaults = defaultSettings();
        Object.keys(defaults).forEach(key => { const value = acceptedSetting(key, raw[key]); if (value !== undefined) values[key] = value; });
        if (!Object.keys(values).length) throw new Error(tr("That isn't a Venus backup."));
        const people = Array.isArray(wrapped ? data.people : data.userNotifIds) ? (wrapped ? data.people : data.userNotifIds)
            .filter(id => typeof id === "string" && /^\d{17,20}$/.test(id)).slice(0, USER_NOTIF_MAX_IDS) : null;
        let themes = null;
        if (wrapped && data.themes && Array.isArray(data.themes.list)) {
            const list = [];
            data.themes.list.slice(0, THEMES_MAX).forEach(item => {
                try {
                    const clean = sanitizeThemeSpec(item, item && typeof item.url === "string" ? item.url : item && typeof item.id === "string" ? item.id : "");
                    if (item && typeof item.id === "string" && item.id) clean.id = item.id;
                    if (!list.some(x => x.id === clean.id)) list.push(clean);
                } catch (_) {}
            });
            themes = {list, active:typeof data.themes.active === "string" && list.some(t => t.id === data.themes.active) ? data.themes.active : ""};
        }
        let packs = null;
        if (wrapped && data.iconPacks && typeof data.iconPacks === "object" && !Array.isArray(data.iconPacks)) {
            const custom = [];
            if (Array.isArray(data.iconPacks.custom)) {
                data.iconPacks.custom.slice(0, ICONPACKS_MAX_CUSTOM).forEach(item => {
                    const clean = sanitizeCustomIconPack(item);
                    if (clean && !custom.some(x => x.id === clean.id)) custom.push(clean);
                });
            }
            const act = typeof data.iconPacks.active === "string" ? normalizeIconPackId(data.iconPacks.active) : "";
            packs = {custom, active:act};
        }
        const created = wrapped && typeof data.created === "string" ? Date.parse(data.created) : NaN;
        return {values, people, themes, iconPacks:packs, version:wrapped && typeof data.version === "string" ? data.version.slice(0, 24) : "", created:Number.isFinite(created) ? created : 0};
    }
    // Puts a backup in place: every setting it has, the rest back to how Venus starts. Switches go through setSetting,
    // so everything they start or stop (Quests, themes, kept messages) happens as if you'd flipped them yourself.
    function backupApply(parsed, reset) {
        const fontWas = fontInUse, emojiWas = emojiInUse, defaults = defaultSettings();
        backup.restoring = true;
        try {
            animateLayout();
            Object.keys(defaults).forEach(key => {
                if (key !== "language" && !features[featureFor(key)]) return;
                setSetting(key, owns(parsed.values, key) ? parsed.values[key] : defaults[key]);
            });
            if (features.userNotif && parsed.people) {
                userNotif.ids.clear(); parsed.people.forEach(id => userNotif.ids.add(id));
                userNotif.dirty = true; save(); userNotifSync(); notify("userNotif");
            }
            if (features.customThemes && parsed.themes) {
                customThemes.loaded = true; customThemes.list = parsed.themes.list; customThemes.active = parsed.themes.active; customThemes.error = "";
                customThemesPersist(); customThemesApply(); notify("customThemes");
            }
            if (features.iconPacks && parsed.iconPacks) {
                iconPacks.loaded = true; iconPacks.custom = parsed.iconPacks.custom; iconPacks.active = parsed.iconPacks.active; iconPacks.error = "";
                iconPacksPersist(); iconPacksApply(); notify("iconPacks");
            }
        } finally { backup.restoring = false; }
        notify("*");
        reviewToast(reviewUI(), reset ? "Settings reset to defaults" : "Settings restored", venusIcon(6868, "CircleCheckIcon"));
        // One question to reopen, only when the font or emojis actually changed.
        if (features.systemFont && settings.systemFont !== fontWas) later(() => askRestart("font"), 0);
        else if (features.systemEmoji && settings.systemEmoji !== emojiWas) later(() => askRestart("emoji"), 0);
    }
    function backupConfirm(text) {
        let parsed;
        try { parsed = backupParse(text); }
        catch (error) { showProblem("Couldn't restore", String(error && error.message || error)); return; }
        const on = Object.keys(FEATURE_ICONS).filter(key => features[key] && parsed.values[key] === true).length;
        const from = parsed.created ? (parsed.version ? tr("Made with Venus {version} on {date}.", {version:parsed.version, date:backupDate(parsed.created)}) :
            tr("Made on {date}.", {date:backupDate(parsed.created)})) + " " : "";
        confirmAction("Restore this backup?", from + pl(on, "{n} feature will be on.", "{n} features will be on.") + " " + tr("Your current Venus settings will be replaced."),
            "Restore", () => backupApply(parsed));
    }
    // A short alert that something didn't work, with the reason.
    function showProblem(title, body) {
        const ui = reviewUI();
        if (ui.alerts && typeof ui.alerts.show === "function") try { ui.alerts.show({title:tr(title), body, confirmText:tr("OK")}); return; } catch (_) {}
        try { RN.Alert.alert(tr(title), body); } catch (_) {}
    }
    function backupBusy(kind) { backup.busy = kind; notify("*"); }
    function backupSaved() {
        backup.last = Date.now(); save(); backupBusy("");
    }
    const pickerCancelled = error => {
        const codes = inspectedExport(12803, "errorCodes"), is = inspectedExport(12803, "isErrorWithCode");
        try { if (codes && typeof is === "function" && is(error) && error.code === codes.OPERATION_CANCELED) return true; } catch (_) {}
        return /cancel/i.test(String(error && (error.code || error.message) || ""));
    };
    function cacheDir() {
        let constants = null;
        try { constants = files && (typeof files.getConstants === "function" ? files.getConstants() : files); } catch (_) {}
        const dir = constants && constants.CacheDirPath;
        return typeof dir === "string" ? dir.replace(/\/$/, "") : null;
    }
    // Save to a file: written to Discord's cache first, then Android's own "Save to" screen (Discord's document picker
    // 12803, saveDocuments) copies it wherever you choose: Downloads, Drive, a USB stick.
    function backupToFile() {
        const saveDocuments = inspectedExport(12803, "saveDocuments"), dir = cacheDir();
        if (!files || typeof saveDocuments !== "function" || !dir) { backupToClipboard(); return; }
        const name = "venus-backup-" + backupDate(Date.now()) + ".json";
        backupBusy("save");
        Promise.resolve().then(() => files.writeFile("cache", name, backupText(), "utf8"))
            .then(() => saveDocuments({sourceUris:["file://" + dir + "/" + name], fileName:name, mimeType:"application/json"}))
            .then(result => {
                const first = Array.isArray(result) ? result[0] : result;
                if (first && first.error) throw new Error(String(first.error));
                backupSaved();
                reviewToast(reviewUI(), "Backup saved", venusIcon(6868, "CircleCheckIcon"));
            }).catch(error => {
                backupBusy("");
                if (!pickerCancelled(error)) showProblem("Couldn't save the backup", tr("Try Copy to clipboard instead."));
            });
    }
    function backupToClipboard() {
        const clip = reviewUI().clipboard || RN && RN.Clipboard;
        try { clip.setString(backupText()); } catch (_) { showProblem("Couldn't save the backup", tr("Try again in a moment.")); return; }
        backupSaved();
        reviewToast(reviewUI(), "Backup copied", venusIcon(5042, "CopyIcon"));
    }
    // Restore from a file: Android's file picker, then a local copy Discord can read (keepLocalCopy), then the backup.
    function backupFromFile() {
        const pick = inspectedExport(12803, "pick"), keep = inspectedExport(12803, "keepLocalCopy"), types = inspectedExport(12803, "types");
        if (!files || typeof pick !== "function" || typeof keep !== "function") { backupFromClipboard(); return; }
        backupBusy("restore");
        Promise.resolve().then(() => pick({type:[types && types.allFiles || "*/*"], allowMultiSelection:false, mode:"import"})).then(picked => {
            const file = Array.isArray(picked) ? picked[0] : picked;
            if (!file || typeof file.uri !== "string") throw new Error("cancel");
            if (typeof file.size === "number" && file.size > BACKUP_MAX_BYTES) throw new Error(tr("That backup is too large."));
            return Promise.resolve(keep({files:[{uri:file.uri, fileName:"venus-restore.json"}], destination:"cachesDirectory"})).then(copies => {
                const copy = Array.isArray(copies) ? copies[0] : copies;
                if (!copy || copy.status !== "success" || typeof copy.localUri !== "string") throw new Error(tr("That file couldn't be opened."));
                return files.readFile(decodeURIComponent(copy.localUri.replace(/^file:\/\//, "")), "utf8");
            });
        }).then(text => { backupBusy(""); backupConfirm(text); }).catch(error => {
            backupBusy("");
            if (!pickerCancelled(error)) showProblem("Couldn't restore", String(error && error.message && !/^[A-Z_]+$/.test(error.message) ? error.message : tr("That file couldn't be opened.")));
        });
    }
    function backupFromClipboard() {
        const clip = reviewUI().clipboard || RN && RN.Clipboard;
        if (!clip || typeof clip.getString !== "function") return;
        Promise.resolve().then(() => clip.getString()).then(text => {
            if (typeof text !== "string" || !text.trim()) showProblem("Couldn't restore", tr("Your clipboard is empty. Copy a Venus backup first."));
            else backupConfirm(text);
        }).catch(() => showProblem("Couldn't restore", tr("Your clipboard is empty. Copy a Venus backup first.")));
    }
    function backupReset() {
        confirmAction("Reset to defaults?", "Every feature turns off and every option goes back to how Venus starts. Your themes and people stay.", "Reset",
            () => backupApply({values:Object.assign({}, defaultSettings(), {language:settings.language}), people:null, themes:null}, true));
    }
    const BACKUP_DARK = {chip:{flexDirection:"row", alignItems:"center", gap:6, paddingHorizontal:10, paddingVertical:6, borderRadius:14, backgroundColor:"#4e50584d"}};
    // Backup and restore: what a backup holds right now, two ways to save it, two ways to bring one back.
    function BackupSettings() {
        useSettings(); useLanguage();
        const ui = reviewUI();
        if (!React || !RN) return null;
        const s = useThemed("backup", c => ({chip:Object.assign({}, BACKUP_DARK.chip, {backgroundColor:c.BACKGROUND_MOD_SUBTLE})}), BACKUP_DARK);
        const Group = ui.TableRowGroup || RN.View, Row = ui.TableRow, Text = inspectedExport(5088, "Text");
        const what = backupContents(), busy = backup.busy, canFile = !!inspectedExport(12803, "saveDocuments") && !!cacheDir();
        const chip = (key, id, name, label) => el(RN.View, {key, style:s.chip, accessible:true, accessibilityLabel:label},
            el(venusIcon(id, name), {size:"xs"}), Text ? el(Text, {variant:"text-xs/semibold", color:"text-strong"}, label) : el(RN.Text, {style:{color:"#dbdee1", fontSize:12}}, label));
        const chips = [chip("features", 15241, "PuzzlePieceIcon", tr("{on} of {total} turned on", {on:what.on, total:what.total})),
            what.changed ? chip("options", 7092, "SettingsIcon", pl(what.changed, "{n} option changed", "{n} options changed")) : null,
            what.people ? chip("people", 4815, "FriendsIcon", pl(what.people, "{n} person watched", "{n} people watched")) : null,
            what.themes ? chip("themes", 15652, "EyeDropperIcon", pl(what.themes, "{n} theme", "{n} themes")) : null,
            what.iconPacks ? chip("iconPacks", 11063, "ImageSparkleIcon", pl(what.iconPacks, "{n} icon pack", "{n} icon packs")) : null,
            what.language ? chip("language", 15723, "LanguageIcon", languageLabel(settings.language)) : null];
        const backupRow = (key, label, sub, id, name, onPress, disabled) => Row ? el(Row, {key, label:tr(label), subLabel:tr(sub), icon:rowIcon(id, name), arrow:true,
            onPress, disabled:!!busy || !!disabled}) : null;
        const groups = [
            statusCard("status", backup.last ? "Everything below goes into a backup." : "Save one now, so patching again or a new phone takes one tap to set up.",
                {title:backup.last ? backupAgo() : tr("No backup yet"), IconComponent:venusIcon(11841, "ArrowsUpDownIcon"),
                 footer:el(RN.View, {style:{flexDirection:"row", flexWrap:"wrap", gap:8, marginTop:10}}, chips)}),
            el(Group, {key:"save", title:tr("Back up")},
                canFile ? backupRow("file", busy === "save" ? "Saving…" : "Save to a file", "Choose where to keep it, like Downloads or Drive.", 5044, "DownloadIcon", backupToFile) : null,
                backupRow("copy", "Copy to clipboard", "Paste it into a note or a message to yourself.", 5042, "CopyIcon", backupToClipboard)),
            el(Group, {key:"restore", title:tr("Restore")},
                canFile ? backupRow("open", busy === "restore" ? "Opening…" : "Restore from a file", "Pick a Venus backup you saved before.", 9401, "UploadIcon", backupFromFile) : null,
                backupRow("paste", "Paste from clipboard", "Restore a backup you copied.", 6114, "ClipboardListIcon", backupFromClipboard)),
            backupIsDefault() ? null : el(Group, {key:"manage", title:tr("Manage")},
                actionRow(ui, "reset", "Reset to defaults", "Turns every feature off and puts every option back.", backupReset, !!busy, true)),
            footnote("note", "Restoring replaces your Venus settings. Your ReviewDB sign-in, saved accounts and kept deleted messages are never included.")];
        return settingsBody(ui, groups);
    }
    function settingsSections(orig, self, args) {
        const config = args[0];
        if (!status.menu || !config || !Array.isArray(config.sections)) return orig.apply(self, args);
        const index = config.sections.findIndex(s => s && Array.isArray(s.settings) && s.settings.includes("ACCOUNT"));
        if (index < 0 || config.sections.some(s => s && s.label === "Venus")) return orig.apply(self, args);
        const sections = config.sections.slice();
        sections.splice(index + 1, 0, section("Venus", ["VENUS_PLUGINS", "VENUS_LANGUAGE", "VENUS_BACKUP", "VENUS_GENERAL"]));
        const next = Array.from(args); next[0] = Object.assign({}, config, { sections });
        return orig.apply(self, next);
    }

    function cloneTree(node, change, depth, isDone) {
        if (!node || typeof node !== "object" || depth > 24 || isDone && isDone()) return node;
        if (Array.isArray(node)) {
            let children = node;
            for (let i = 0; i < node.length; i++) {
                if (isDone && isDone()) break;
                const item = node[i];
                if (!item || typeof item !== "object") continue;
                const child = cloneTree(item, change, depth + 1, isDone);
                if (child !== item) {
                    if (children === node) children = node.slice();
                    children[i] = child;
                }
            }
            return children;
        }
        const nodeProps = node.props;
        if (!nodeProps) return node;
        const rawChildren = nodeProps.children;
        const children = rawChildren && typeof rawChildren === "object" ? cloneTree(rawChildren, change, depth + 1, isDone) : rawChildren;
        let props = children !== rawChildren ? Object.assign({}, nodeProps, { children }) : nodeProps;
        if (isDone && isDone()) return props === nodeProps ? node : React.cloneElement(node, props);
        props = change(node, props);
        return props === nodeProps ? node : React.cloneElement(node, props);
    }
    function copyBio(orig, self, args) {
        const result = orig.apply(self, args);
        if (!enabled("copyBios") || !React || !RN) return result;
        return cloneTree(result, function (node, props) {
            // Preserve clickable links and handlers, never mutate React's frozen elements.
            if (node !== result && node.type !== RN.Text && typeof props.children !== "string") return props;
            return props.selectable === true ? props : Object.assign({}, props, { selectable: true });
        }, 0);
    }
    // All guild channel types formatted as lowercase hyphenated slugs in computeChannelName (5421 fn 35098):
    // GUILD_TEXT (0), GUILD_ANNOUNCEMENT (5), GUILD_STORE (6), GUILD_DIRECTORY (14), GUILD_FORUM (15), GUILD_MEDIA (16), GUILD_APP (21).
    const DASHLESS_TYPES = new Set([0, 5, 6, 14, 15, 16, 21]);
    const FALSE_FN = () => false;
    const dashlessNames = new Map();
    function dashlessFormat(channel, name) {
        if (!enabled("dashless") || !channel || !DASHLESS_TYPES.has(channel.type) || typeof name !== "string" || name.indexOf("-") < 0) return name;
        const cached = dashlessNames.get(name);
        if (cached !== undefined) return cached;
        const formatted = name.replace(/-/g, " ");
        if (dashlessNames.size >= 512) dashlessNames.delete(dashlessNames.keys().next().value);
        dashlessNames.set(name, formatted);
        return formatted;
    }
    function channelLabel(orig, self, args) {
        const channel=args[0];
        let next=args;
        if (hiddenMetadata(channel)) {
            // Formatter-only facade avoids Discord's OBFUSCATED label branch while
            // preserving its escaping, category casing and the real model/flags.
            next=Array.from(args);
            next[0]=Object.create(channel, {
                name:{value:hiddenName(channel), writable:true, configurable:true, enumerable:true},
                isObfuscated:{value:FALSE_FN, writable:true, configurable:true, enumerable:false}
            });
        }
        return dashlessFormat(channel, orig.apply(self, next));
    }
    channelLabel.call1 = (orig, self, channel) =>
        hiddenMetadata(channel) ? channelLabel(orig, self, [channel]) : dashlessFormat(channel, orig.call(self, channel));
    channelLabel.call2 = (orig, self, channel, b) =>
        hiddenMetadata(channel) ? channelLabel(orig, self, [channel, b]) : dashlessFormat(channel, orig.call(self, channel, b));
    function useChannelLabel(orig, self, args) {
        if (React) {
            if (features.dashless) useSettings("dashless");
            if (features.hiddenChannels) useSettings("hiddenChannels");
        }
        return channelLabel(orig, self, args);
    }
    useChannelLabel.call1 = (orig, self, channel) => {
        if (React) {
            if (features.dashless) useSettings("dashless");
            if (features.hiddenChannels) useSettings("hiddenChannels");
        }
        return channelLabel.call1(orig, self, channel);
    };
    useChannelLabel.call2 = (orig, self, channel, b) => {
        if (React) {
            if (features.dashless) useSettings("dashless");
            if (features.hiddenChannels) useSettings("hiddenChannels");
        }
        return channelLabel.call2(orig, self, channel, b);
    };
    const mentionChannelCache = new WeakMap();
    function mentionChannelFormat(result) {
        if (!result || typeof result.name !== "string") return result;
        const formatted = dashlessFormat(result, result.name);
        if (formatted === result.name) return result;
        const cached = mentionChannelCache.get(result);
        if (cached && cached.name === formatted) return cached.value;
        const value = Object.assign({}, result, {name:formatted});
        mentionChannelCache.set(result, {name:formatted, value});
        return value;
    }
    function mentionChannelInfo(orig, self, args) {
        return mentionChannelFormat(orig.apply(self, args));
    }
    mentionChannelInfo.call1 = (orig, self, id) => mentionChannelFormat(orig.call(self, id));
    function parserStateChannels(orig, self, args) {
        const state = orig.apply(self, args);
        if (!enabled("dashless") || !state || !Array.isArray(state.channels) || !channelStore || typeof channelStore.getChannel !== "function") return state;
        let extras = null;
        for (let i = 0; i < state.channels.length; i++) {
            const entry = state.channels[i];
            if (!entry || typeof entry.text !== "string" || !entry.text.includes(" ")) continue;
            const ch = channelStore.getChannel(entry.id);
            if (ch && DASHLESS_TYPES.has(ch.type) && typeof ch.name === "string" && ch.name !== entry.text) {
                if (!extras) extras = state.channels.slice();
                extras.push({id:entry.id, text:ch.name});
            }
        }
        return extras ? Object.assign({}, state, {channels:extras}) : state;
    }
    const videoPattern = /\.(mp4|webm|mov|avi|mkv|flv|wmv|m4v|gifv)(?:[?#]|$)/i;
    const video = uri => typeof uri === "string" && videoPattern.test(uri);
    function thumbnail(uri) {
        if (typeof uri !== "string" || !/^https:\/\/(?:cdn\.discordapp\.com|media\.discordapp\.net|images-ext-\d+\.discordapp\.net)\//i.test(uri)) return uri;
        let result = uri.replace(/^https:\/\/cdn\.discordapp\.com\//i, "https://media.discordapp.net/");
        const hash = result.indexOf("#"), suffix = hash < 0 ? "" : result.slice(hash);
        if (hash >= 0) result = result.slice(0, hash);
        result = /[?&]format=/.test(result) ? result.replace(/([?&])format=[^&]*/g, "$1format=jpeg") : result + (result.includes("?") ? "&" : "?") + "format=jpeg";
        return result + suffix;
    }
    function favouriteButton(orig, self, args) {
        const props = args[0], source = props && props.source;
        if (!enabled("favouriteAnything") || !source || source.isGIFV || typeof source.uri !== "string" || !/^https?:\/\//i.test(source.uri)) return orig.apply(self, args);
        const next = Array.from(args);
        next[0] = Object.assign({}, props, { source: Object.assign({}, source, { isGIFV: true,
            embedURI: source.embedURI || source.sourceURI || source.uri, videoURI: source.videoURI || source.uri,
            embedProviderName: source.embedProviderName || "" }) });
        return orig.apply(self, next);
    }
    function favouriteAdd(orig, self, args) {
        const item = args[0];
        if (!enabled("favouriteAnything") || !item || typeof item !== "object") return orig.apply(self, args);
        const isVideo = video(item.url) || video(item.gifSrc);
        const isImage = typeof item.url === "string" && /\.(png|jpe?g|gif|webp|avif|heic|heif)(?:[?#]|$)/i.test(item.url);
        // Preserve native formats for opaque provider URLs instead of misclassifying videos as images.
        if (!isVideo && !isImage) return orig.apply(self, args);
        const format = isVideo ? 2 : 1;
        if (item.format === format) return orig.apply(self, args);
        const next = Array.from(args); next[0] = Object.assign({}, item, { format });
        return orig.apply(self, next);
    }
    const favouriteViews = new WeakMap();
    function favouriteList(orig, self, args) {
        const result = orig.apply(self, args);
        if (!enabled("favouriteAnything") || !result || !Array.isArray(result.favorites)) return result;
        let favorites = favouriteViews.get(result.favorites);
        if (!favorites) {
            let changed = false;
            favorites = result.favorites.map(item => {
                if (!item || !video(item.url) && !video(item.gifSrc)) return item;
                const src = thumbnail(item.src || item.url);
                if (src === item.src) return item;
                changed = true; return Object.assign({}, item, { src });
            });
            if (!changed) favorites = result.favorites;
            favouriteViews.set(result.favorites, favorites);
        }
        if (favorites === result.favorites) return result;
        const category = result.favoritesCategory && favorites[0] ? Object.assign({}, result.favoritesCategory, { src: favorites[0].src }) : result.favoritesCategory;
        return Object.assign({}, result, { favorites, favoritesCategory: category });
    }

    let userStore, channelStore, emojiStore, stickerStore, stickerRules, emojiCatalog;
    const premiumOriginal = {};
    function currentUser() { return userStore && userStore.getCurrentUser(); }
    let nativeCapabilities = 0;
    function capability(key, user) {
        // The orig capability delegates to canUserUse. Conversion must see real
        // eligibility, not the picker override, or a non-Nitro send stays an invalid token.
        nativeCapabilities++;
        try { return typeof premiumOriginal[key] === "function" && premiumOriginal[key](user); }
        finally { nativeCapabilities--; }
    }
    function catalogEligibility(orig, self, args) {
        const user = currentUser(), feature = args[0];
        if (!nativeCapabilities && user && args[1] && args[1].id === user.id && emojiCatalog) {
            if (enabled("emojis") && (feature === emojiCatalog.EMOJIS_EVERYWHERE || feature === emojiCatalog.ANIMATED_EMOJIS)) return true;
            if (enabled("appIcons") && feature === emojiCatalog.APP_ICONS) return true;
            if (enabled("nitroThemes") && feature === emojiCatalog.CLIENT_THEMES) return true;
        }
        return orig.apply(self, args);
    }
    function premiumOverride(key, setting) {
        return function (orig, self, args) {
            const user = currentUser();
            return enabled(setting) && user && args[0] && args[0].id === user.id ? true : orig.apply(self, args);
        };
    }
    function shareLink(name, uri) {
        // Escape Markdown without permitting forged mentions or link syntax in sticker names.
        // ~ | # too: a sticker called ||surprise|| or ~~old~~ turned the link text into a spoiler or strikethrough.
        return settings.hyperlinks && name ? "[" + String(name).replace(/([\\\[\]()*_`<>@~|#])/g, "\\$1").replace(/[\r\n]/g, " ") + "](" + uri + ")" : uri;
    }
    function emojiMessage(message, channelId) {
        if (!enabled("emojis") || !message || typeof message.content !== "string" || !message.content.includes("<") || !emojiStore || !channelStore) return message;
        const user = currentUser(), channel = channelStore.getChannel(channelId);
        if (!user || !channel) return message;
        const everywhere = capability("canUseEmojisEverywhere", user), animated = capability("canUseAnimatedEmojis", user);
        const converted = new Set();
        // Do not rewrite code blocks, inline code, escaped tokens or Markdown link targets.
        const content = message.content.replace(/```[\s\S]*?(?:```|$)|``[^\n]*?(?:``|$)|`[^`\n]*(?:`|$)|\\[\s\S]|\]\([^\n)]*\)|<(a?):([\w]+):(\d+)>/g, function (match, animation, name, id) {
            if (!id) return match;
            const emoji = emojiStore.getCustomEmojiById(id);
            if (!emoji || emoji.available === false || !emoji.guildId) return match;
            if ((everywhere || emoji.guildId === channel.guild_id) && (!(animation || emoji.animated) || animated)) return match;
            converted.add(id);
            const uri = "https://cdn.discordapp.com/emojis/" + id + (animation || emoji.animated ? ".gif" : ".webp") + "?size=48&quality=lossless";
            return shareLink(name, uri);
        });
        if (!converted.size || content.length > (user.premiumType === 2 ? 4000 : 2000)) return message;
        const next = Object.assign({}, message, { content });
        // Keep unrelated invalid emoji diagnostics intact.
        for (const key of ["invalidEmojis", "validNonShortcutEmojis"]) if (Array.isArray(message[key]))
            next[key] = message[key].filter(item => !converted.has(typeof item === "string" ? item : item && item.id));
        return next;
    }
    function sendMessage(orig, self, args) {
        const message = emojiMessage(args[1], args[0]);
        if (message === args[1]) return orig.apply(self, args);
        const next = Array.from(args); next[1] = message;
        return orig.apply(self, next);
    }
    function stickerLink(sticker) {
        if (!sticker || sticker.available === false || !/^\d+$/.test(sticker.id)) return null;
        if (![1, 2, 4].includes(sticker.format_type)) return null; // No broken Lottie URLs or third-party conversion service.
        return shareLink(sticker.name, "https://media.discordapp.net/stickers/" + sticker.id + (sticker.format_type === 4 ? ".gif" : ".png") + "?size=160");
    }
    function nativeSticker(sticker, channel, user) {
        return sticker && sticker.available !== false &&
            (!sticker.guild_id || sticker.guild_id === channel.guild_id || capability("canUseCustomStickersEverywhere", user));
    }
    function sendStickers(orig, self, args) {
        if (!enabled("stickers") || !Array.isArray(args[1]) || !args[1].length || !stickerStore || !channelStore) return orig.apply(self, args);
        const user = currentUser(), channel = channelStore.getChannel(args[0]);
        if (!user || !channel) return orig.apply(self, args);
        const keep = [], links = [];
        for (const id of args[1]) {
            const sticker = stickerStore.getStickerById(id);
            if (!sticker) return orig.apply(self, args);
            if (nativeSticker(sticker, channel, user)) { keep.push(id); continue; }
            const link = stickerLink(sticker);
            // Fail closed as a whole: never drop an unknown/unsupported sticker from a mixed send.
            if (!link) return orig.apply(self, args);
            links.push(link);
        }
        if (!links.length) return orig.apply(self, args);
        const message = args[2], content = typeof message === "string" ? message : message && message.content || "";
        const combined = (content ? content + "\n" : "") + links.join("\n");
        if (combined.length > (user.premiumType === 2 ? 4000 : 2000)) return orig.apply(self, args);
        const next = Array.from(args); next[1] = keep;
        next[2] = emojiMessage(Object.assign({}, typeof message === "object" ? message : null, { content: combined }), args[0]);
        // Original sendStickers preserves replies, TTS, nonce, permissions and native stickers in one message.
        return orig.apply(self, next);
    }
    function sendability(orig, self, args) {
        const result = orig.apply(self, args), sticker = args[0];
        return enabled("stickers") && stickerRules && result === stickerRules.StickerSendability.SENDABLE_WITH_PREMIUM && stickerLink(sticker) ? stickerRules.StickerSendability.SENDABLE : result;
    }
    function sendableSticker(orig, self, args) {
        const result = orig.apply(self, args);
        if (result || !enabled("stickers") || !stickerRules) return result;
        const code = stickerRules.getStickerSendability.apply(stickerRules, args);
        return code === stickerRules.StickerSendability.SENDABLE;
    }
    let msgStore, msgActions, permissions, viewPermission, locale, dispatcher, messageRecords, chatHeight, jumpPill, jumpIcon;
    let permissionsCanOrig = null;
    let deletedRevision = 0, archiveRestored = false, archiveLoading = false, archiveWriting = false, archivePending;
    const deletedViews = new Map();
    const ARCHIVE = "venus-deleted-messages.json";
    const deleted = new Map(), deletedByChannel = new Map();
    // Edit history: "channel:id" -> {channelId, id, versions:[{content, at}]}, oldest version first.
    const edits = new Map();
    const MAX_EDITED = 2000, MAX_VERSIONS = 10, MAX_VERSION_TEXT = 4000;
    let archiveTimer;
    const hiddenViews = new Map(), hiddenNames = new Map(), hiddenScans = new Map();
    let hiddenAccount;
    const HIDDEN_CHANNEL = "Hidden channel (name unavailable)", HIDDEN_CATEGORY = "Hidden category (name unavailable)";
    function receivedName(channel) {
        if (!channel || typeof channel.name !== "string") return null;
        const trimmed = channel.name.trim();
        if (!trimmed) return null;
        // Server redactions: "hidden", "__hidden__", "_hidden" and underscore variants (HBC string 25605).
        // Strip surrounding underscores and compare case-insensitively so redacted stubs never pollute the cache.
        if (trimmed.replace(/^_+|_+$/g, "").toLowerCase() === "hidden") return null;
        // Never cache our own unavailable facades as if they were real names.
        if (trimmed === HIDDEN_CHANNEL || trimmed === HIDDEN_CATEGORY || trimmed === tr(HIDDEN_CHANNEL) || trimmed === tr(HIDDEN_CATEGORY)) return null;
        return channel.name;
    }
    // guildId: for gateway channel lists, whose entries don't carry their server. It used to copy every channel
    // of every server on READY just to add guild_id.
    function rememberChannelName(channel, accountId, knownName, guildId) {
        // Directory scans pass the account once; don't ask UserStore again for every channel.
        let owner = accountId;
        if (typeof owner !== "string") { const current = userStore && userStore.getCurrentUser(); owner = current && current.id; }
        if (hiddenAccount !== owner) {hiddenNames.clear();hiddenAccount = owner;}
        if (!channel) return;
        const guild = guildId || channel.guild_id;
        const name = knownName || receivedName(channel);
        if (!guild || !channel.id || !name) return;
        const known = hiddenNames.get(channel.id);
        // READY replays thousands of unchanged names: don't churn the cache for them.
        if (known && known.guild === guild && known.name === name) return;
        if (hiddenNames.size >= 4096 && !known) hiddenNames.delete(hiddenNames.keys().next().value);
        hiddenNames.set(channel.id,{guild,name});
    }
    function hiddenName(channel) {
        // Basic records can retain names absent from full/obfuscated records. Never
        // fetch an inaccessible channel, guess a name, or change its permissions/flags.
        const current = userStore && userStore.getCurrentUser();
        if (hiddenAccount !== (current && current.id)) {hiddenNames.clear();hiddenAccount = current && current.id;}
        const basic = channelStore && typeof channelStore.getBasicChannel === "function" && channelStore.getBasicChannel(channel.id);
        const full = channelStore && typeof channelStore.getChannel === "function" && channelStore.getChannel(channel.id);
        const name = receivedName(channel) || (basic && basic.guild_id === channel.guild_id && receivedName(basic)) ||
            (full && full.guild_id === channel.guild_id && receivedName(full));
        if (name) {rememberChannelName(channel,hiddenAccount,name);return name;}
        const cached = hiddenNames.get(channel.id);
        return cached && cached.guild === channel.guild_id ? cached.name : tr(channel.type === 4 ? HIDDEN_CATEGORY : HIDDEN_CHANNEL);
    }
    const CHANNEL_EVENTS = new Set(["CHANNEL_CREATE","CHANNEL_UPDATE"]), GUILD_EVENTS = new Set(["GUILD_CREATE","GUILD_UPDATE"]);
    const READY_EVENTS = new Set(["CONNECTION_OPEN","CONNECTION_OPEN_SUPPLEMENTAL"]), BATCH_EVENTS = new Set(["CHANNEL_UPDATES","THREAD_LIST_SYNC"]);
    const MESSAGE_EVENTS = new Set(["MESSAGE_CREATE","MESSAGE_UPDATE"]), RESTORE_EVENTS = new Set(["CONNECTION_OPEN","CACHE_LOADED"]);
    // Every Flux event passes through here: leave typing, presence, voice and the rest alone.
    const HIDDEN_EVENTS = new Set(["LOGOUT","CHANNEL_DELETE","GUILD_DELETE",...CHANNEL_EVENTS,...GUILD_EVENTS,...READY_EVENTS,...BATCH_EVENTS,...MESSAGE_EVENTS]);
    // Every type dispatchEvent or channelMetadataEvent acts on. Anything else (presence, typing, voice, acks: most of the
    // traffic) goes straight to Discord. Add a type here when a new branch reads it.
    const DISPATCH_EVENTS = new Set([...HIDDEN_EVENTS, ...RESTORE_EVENTS, "MESSAGE_DELETE", "MESSAGE_DELETE_BULK"]);
    function channelMetadataEvent(event) {
        if (!HIDDEN_EVENTS.has(event.type)) return;
        // Most messages mention no channels; skip the account lookup for them.
        if (MESSAGE_EVENTS.has(event.type)) {
            const msg = event.message || event;
            if (!msg || !Array.isArray(msg.mention_channels) || !msg.mention_channels.length) return;
        }
        const current = userStore && userStore.getCurrentUser();
        // This hook runs BEFORE UserStore handles READY. Scope its metadata to
        // the incoming user, otherwise the first post-READY lookup erases it.
        const owner = event.type === "CONNECTION_OPEN" && event.user && event.user.id || current && current.id;
        if (event.type === "LOGOUT" || hiddenAccount !== owner) {
            hiddenNames.clear();hiddenViews.clear();hiddenScans.clear();hiddenAccount = owner;
            try { hiddenConfirmed.clear(); hiddenPrompts.clear(); } catch (_) {}
        }
        if (event.type === "CHANNEL_DELETE") hiddenNames.delete(event.channel && event.channel.id || event.channelId || event.id);
        if (event.type === "GUILD_DELETE") {
            const guild = event.guild && event.guild.id || event.guildId;
            for (const [id,entry] of hiddenNames) if (entry.guild === guild) hiddenNames.delete(id);
        }
        if (!features.hiddenChannels) return;
        // Cache even while the toggle is off so enabling later still has READY names.
        if (CHANNEL_EVENTS.has(event.type)) rememberChannelName(event.channel,owner);
        function rememberGuild(guild) {
            if (!guild || !guild.id) return;
            for (const key of ["channels","threads"]) if (Array.isArray(guild[key]))
                guild[key].forEach(channel => rememberChannelName(channel,owner,undefined,channel && channel.guild_id || guild.id));
        }
        if (GUILD_EVENTS.has(event.type)) rememberGuild(event.guild);
        if (READY_EVENTS.has(event.type) && Array.isArray(event.guilds)) event.guilds.forEach(rememberGuild);
        if (BATCH_EVENTS.has(event.type)) {
            for (const key of ["channels","threads"]) if (Array.isArray(event[key]))
                event[key].forEach(channel => rememberChannelName(channel,owner,undefined,channel && channel.guild_id || event.guildId));
        }
        // Real unobfuscated names arrive inside message mention_channels (fn34524/fn35281):
        // harvest them so mentioned hidden channels resolve even when stores are redacted.
        if (MESSAGE_EVENTS.has(event.type)) {
            const msg = event.message || event;
            const mentions = msg && Array.isArray(msg.mention_channels) && msg.mention_channels;
            if (mentions) mentions.forEach(channel => rememberChannelName(channel, owner));
        }
    }
    function typing(orig, self, args) {
        return enabled("noTyping") ? undefined : orig.apply(self, args);
    }
    function quickConfirm(orig, self, args) {
        const popup = args[0];
        if (!popup || typeof popup.onConfirm !== "function" || !locale || !locale.intl || !locale.t)
            return orig.apply(self, args);
        const title = popup.children && popup.children.props && popup.children.props.title;
        const texts = [title, popup.body].filter(text => typeof text === "string");
        // Localized, exact confirmation strings. No generic 'delete' matching, and
        // no interception of leave-server, ban, channel or account confirmations.
        function matches(key) {
            const token = locale.t[key];
            const label = token && locale.intl.string(token);
            return typeof label === "string" && label.length > 3 && texts.some(text => text === label);
        }
        if (enabled("quickDelete") && (matches("AMvpS4") || matches("vXZ+Fo")))
            return popup.onConfirm();
        return orig.apply(self, args);
    }
    function deletedKey(channelId, id) { return channelId + ":" + id; }
    function invalidateDeleted() { deletedRevision++; deletedViews.clear(); }
    function keepDeleted(key, entry) {
        deleted.set(key, entry);
        let bucket = deletedByChannel.get(entry.channelId);
        if (!bucket) deletedByChannel.set(entry.channelId, bucket = new Map());
        bucket.set(key, entry);
    }
    function dropDeleted(key) {
        const entry = deleted.get(key);
        if (!entry) return null;
        deleted.delete(key);
        const bucket = deletedByChannel.get(entry.channelId);
        if (bucket) { bucket.delete(key); if (!bucket.size) deletedByChannel.delete(entry.channelId); }
        return entry;
    }
    function retainable(message, event) {
        // Only messages someone else removed from the server. Your own deletions, unsent or
        // failed local messages and dismissed ephemeral ("Only you can see this") messages
        // must disappear exactly like stock Discord.
        // Your own sent messages are kept too (red outline), as intended: every deletion is kept.
        if (!message) return false;
        if (message.state != null && message.state !== "SENT") return false;
        return !((Number(message.flags) || 0) & 64);
    }
    function persistDeleted() {
        // Coalesce bursts (raids, purges) into one archive write instead of one full
        // serialization per deleted message.
        // Once the archive is erased there is nothing on disk to update: don't rewrite the
        // same empty file for every later deletion while saving is off.
        if (!files || status.storage === "loading" ||
            !(settings.noDeleteSave || archiveRestored || status.archive && status.archive !== "erased")) return;
        if (archiveTimer !== undefined) return;
        archiveTimer = later(() => { archiveTimer = undefined; writeArchive(); }, 750);
    }
    function writeArchive() {
        if (!files || status.storage === "loading") return;
        const user = userStore && userStore.getCurrentUser && userStore.getCurrentUser();
        if (settings.noDeleteSave && (!user || !archiveRestored)) return;
        try {
            // Each kept message is turned into text once and reused, so a new deletion no longer re-serializes
            // up to 5000 others. The same text as JSON.stringify of the whole archive.
            const parts = [];
            if (settings.noDeleteSave) deleted.forEach(entry => { const text = archiveText(entry); if (text) parts.push(text); });
            // Edit history rides in the same file. Older releases ignore the extra key, so nothing breaks either way.
            const history = [];
            if (settings.noDeleteSave && settings.noDeleteEdits) edits.forEach(entry => { const text = editText(entry); if (text) history.push(text); });
            const text = "{\"version\":1,\"accountId\":" + JSON.stringify(settings.noDeleteSave && user ? user.id : null) +
                ",\"messages\":[" + parts.join(",") + "]" + (history.length ? ",\"edits\":[" + history.join(",") + "]" : "") + "}";
            // A file this big can never be read back. It used to stay queued, so a write already in progress
            // saved it anyway right after, and kept up to 32 MB of text in memory until the next deletion.
            if (text.length > ARCHIVE_BYTES) throw new Error("Deleted message archive exceeds 32 MB");
            archivePending = text;
        } catch (_) { status.archive = "save failed"; notify(); return; }
        if (archiveWriting) return;
        archiveWriting = true;
        function write() {
            const snapshot = archivePending; archivePending = undefined;
            return Promise.resolve().then(() => files.writeFile("documents", ARCHIVE, snapshot, "utf8"))
                .then(() => {status.archive = settings.noDeleteSave ? "saved locally" : "erased";}, () => {status.archive = "save failed";})
                .then(() => {notify(); if (archivePending !== undefined) return write(); archiveWriting = false;});
        }
        Promise.resolve().then(write);
    }
    function restoreDeleted() {
        if (!enabled("noDelete") || !enabled("noDeleteSave") || !files || !messageRecords || archiveRestored || archiveLoading || status.storage === "loading") return;
        const user = userStore && userStore.getCurrentUser && userStore.getCurrentUser();
        const constants = files.getConstants && files.getConstants();
        if (!user || !constants || typeof constants.DocumentsDirPath !== "string") return;
        const accountId = user.id, path = constants.DocumentsDirPath.replace(/\/$/, "") + "/" + ARCHIVE;
        archiveLoading = true;
        let readable = false;
        Promise.resolve().then(() => files.fileExists(path)).then(exists => exists ? files.readFile(path,"utf8") : null).then(text => {
            readable = true;
            const current = userStore.getCurrentUser();
            if (!enabled("noDelete") || !enabled("noDeleteSave") || !current || current.id !== accountId) return;
            // Messages kept before the archive loaded, or saved ones that didn't all fit, mean the file needs updating.
            // Otherwise it already says exactly this, and opening Discord no longer rewrites it every time.
            // Edits made before the archive loaded are newer than what's saved, so the file needs updating too.
            let restored = 0, changed = deleted.size > 0 || edits.size > 0 || !text, saved = null;
            if (text) {
                if (text.length > ARCHIVE_BYTES) throw new Error("Archive too large");
                saved = JSON.parse(text);
                if (saved.version !== 1 || !Array.isArray(saved.messages) || saved.messages.length > MAX_DELETED) throw new Error("Invalid archive");
                if (saved.accountId !== accountId) changed = true;
                else saved.messages.forEach(entry => {
                    if (!entry || typeof entry.id !== "string" || typeof entry.channelId !== "string" || !entry.message || entry.message.id !== entry.id || entry.message.channel_id !== entry.channelId || !entry.message.author) { changed = true; return; }
                    const key = deletedKey(entry.channelId,entry.id);
                    if (deleted.size < settings.noDeleteLimit && !deleted.has(key)) {
                        try { entry.message = Object.assign({},entry.message); keepDeleted(key,{type:"MESSAGE_DELETE",channelId:entry.channelId,id:entry.id,raw:entry.message,message:markDeleted(messageRecords.createMessageRecord(entry.message))}); restored++; }
                        catch (_) { changed = true; /* Invalid individual records do not poison the archive. */ }
                    } else changed = true;
                });
            }
            // Another account's file was already marked changed above and is never read from.
            if (saved && saved.accountId === accountId && settings.noDeleteEdits && Array.isArray(saved.edits)) saved.edits.slice(-MAX_EDITED).forEach(entry => {
                if (!entry || typeof entry.id !== "string" || typeof entry.channelId !== "string" || !Array.isArray(entry.versions)) { changed = true; return; }
                const versions = entry.versions.filter(v => v && typeof v.content === "string").slice(-MAX_VERSIONS)
                    .map(v => ({content:v.content.slice(0, MAX_VERSION_TEXT + 1), at:typeof v.at === "string" ? v.at : null}));
                const key = deletedKey(entry.channelId, entry.id);
                if (!versions.length || edits.has(key)) { changed = true; return; }
                edits.set(key, {channelId:entry.channelId, id:entry.id, versions}); restored++;
            });
            archiveRestored = true; invalidateDeleted();
            if (changed) persistDeleted(); else status.archive = "saved locally";
            if (!restored && !changed) return;
            if (msgStore && typeof msgStore.emitChange === "function") msgStore.emitChange();
        }).catch(() => {
            status.archive = "restore failed";
            // A file that was read but is damaged can never load. It used to stop saving until Discord restarted,
            // and was read again on every reconnect. Messages kept from now on replace it. A file that couldn't be
            // read at all is left alone and tried again later, so a passing error never erases it.
            const current = userStore.getCurrentUser();
            if (readable && enabled("noDelete") && enabled("noDeleteSave") && current && current.id === accountId) {
                archiveRestored = true;
                if (deleted.size) persistDeleted();
            }
            notify();
        }).finally(() => {archiveLoading = false;});
    }
    function markDeleted(message) {
        // Identity refresh only. Deletion styling belongs to row presentation, never
        // content: copying, replies, mentions, links and archives retain the original.
        const copy = Object.create(Object.getPrototypeOf(message),Object.getOwnPropertyDescriptors(message));
        // ChatManager.determineChangeType (HBC fn54452) deep-compares old and new records with
        // objEquiv (enumerable keys) and returns NOOP for equal ones, so an identical copy never
        // re-rendered the row until the chat was reopened. One enumerable marker key makes the
        // retained record differ and the red outline appear immediately; content is untouched.
        try { Object.defineProperty(copy,"venusDeleted",{value:true,enumerable:true,configurable:true}); } catch (_) {}
        return copy;
    }
    // Built on first save, not on every deletion: most people never turn saving on.
    function archiveEntry(entry) {
        if (entry.raw === undefined) { try { entry.raw = rawDeleted(entry.message, entry); } catch (_) { entry.raw = null; } }
        return entry.raw ? {channelId:entry.channelId,id:entry.id,message:entry.raw} : null;
    }
    function editText(entry) {
        if (entry.text === undefined) { try { entry.text = JSON.stringify({channelId:entry.channelId, id:entry.id, versions:entry.versions}); } catch (_) { entry.text = null; } }
        return entry.text;
    }
    // A kept message never changes, so its saved form is worked out once.
    function archiveText(entry) {
        if (entry.text === undefined) { const saved = archiveEntry(entry); try { entry.text = saved ? JSON.stringify(saved) : null; } catch (_) { entry.text = null; } }
        return entry.text;
    }
    function rawDeleted(message, event) {
        // Retain content/metadata only; no tokens, downloaded attachments or remote fetches.
        const raw = {id:event.id,channel_id:event.channelId,content:message.content || "",author:message.author,
            timestamp:message.timestamp && typeof message.timestamp.toISOString === "function" ? message.timestamp.toISOString() : message.timestamp,
            type:message.type || 0,flags:message.flags || 0,attachments:message.attachments || [],embeds:message.embeds || [],
            mentions:message.mentions || [],mention_roles:message.mentionRoles || [],referenced_message:null};
        return JSON.parse(JSON.stringify(raw));
    }
    // A new color or brightness for kept messages reaches chat at once: Discord redraws a row when its message
    // updates, so the newest 200 kept messages get the same no-op MESSAGE_UPDATE NoDelete sends when it keeps one.
    function deletedRedraw() {
        if (!dispatcher || !deleted.size || !enabled("noDelete")) return;
        Array.from(deleted.values()).slice(-200).forEach(entry => {
            const message = entry.message;
            try { dispatcher({type:"MESSAGE_UPDATE", message:{id:entry.id, channel_id:entry.channelId, content:message && message.content || ""}}); } catch (_) {}
        });
    }
    // One Flux removal per channel instead of one dispatch (and store emit) per message.
    function dispatchRemovals(entries) {
        if (!dispatcher || !entries.length) return;
        const byChannel = new Map();
        entries.forEach(entry => { const ids = byChannel.get(entry.channelId); if (ids) ids.push(entry.id); else byChannel.set(entry.channelId, [entry.id]); });
        byChannel.forEach((ids, channelId) => dispatcher(ids.length === 1 ? {type:"MESSAGE_DELETE",channelId,id:ids[0]} : {type:"MESSAGE_DELETE_BULK",channelId,ids}));
    }
    function trimDeleted() {
        // Lowering the maximum from 5000 to 1 used to send up to 4999 separate deletes.
        const removed = [];
        while (deleted.size > settings.noDeleteLimit) {
            const pending = dropDeleted(deleted.keys().next().value);
            if (!pending) break;
            removed.push(pending);
        }
        if (!removed.length) return;
        invalidateDeleted(); persistDeleted(); dispatchRemovals(removed);
    }
    function clearDeleted(remove, keepArchive) {
        const events = Array.from(deleted.values());
        deleted.clear(); deletedByChannel.clear(); invalidateDeleted();
        if (remove) dispatchRemovals(events);
        if (remove && !keepArchive) persistDeleted();
    }
    function retainedMessage(orig, self, args) {
        // Hot path (every row render): skip the key build while nothing is kept in this channel.
        const bucket = deleted.size && enabled("noDelete") && deletedByChannel.get(args[0]);
        const entry = bucket && bucket.get(deletedKey(args[0],args[1]));
        return entry ? entry.message : orig.apply(self,args);
    }
    // getMessage(channelId, messageId), the usual call: same logic without the arguments object.
    retainedMessage.call2 = (orig, self, channelId, messageId) => {
        const bucket = deleted.size && enabled("noDelete") && deletedByChannel.get(channelId);
        const entry = bucket && bucket.get(deletedKey(channelId, messageId));
        return entry ? entry.message : orig.call(self, channelId, messageId);
    };
    function retainedMessages(orig, self, args) {
        const result = orig.apply(self,args), channelId = args[0];
        if (!deletedByChannel.size || !enabled("noDelete") || !result) return result;
        const bucket = deletedByChannel.get(channelId);
        if (!bucket || typeof result.merge !== "function") return result;
        const cached = deletedViews.get(channelId);
        if (cached && cached.orig === result && cached.revision === deletedRevision) return cached.value;
        const array = Array.isArray(result._array) ? result._array : null;
        const first = array && array.length ? String(array[0].id) : null, last = array && array.length ? String(array[array.length - 1].id) : null;
        const older = (a, b) => a.length - b.length || (a === b ? 0 : a < b ? -1 : 1);
        // Whether this window has numeric bounds is the same for every kept message: check it once.
        const bounded = first !== null && /^\d+$/.test(first);
        // Never paste a retained message into a window that doesn't contain its position;
        // that produced out-of-place rows above unloaded history or below an older jump.
        const records = [];
        bucket.forEach(entry => {
            const id = String(entry.id);
            if (bounded && /^\d+$/.test(id)) {
                if (older(id, first) < 0 && result.hasMoreBefore === true) return;
                if (older(id, last) > 0 && result.hasMoreAfter === true) return;
            }
            records.push(entry.message);
        });
        if (!records.length) { deletedViews.set(channelId,{orig:result,revision:deletedRevision,value:result}); return result; }
        // Discord's ChannelMessages has immutable merge()/mutate(), NOT clone().
        // clone() exists only on its internal before/after caches. Never mutate the store.
        let value = typeof result.clone === "function" ? result.clone().merge(records) : result.merge(records);
        // Native merge appends cache-missing records without sorting. Re-sort only
        // our private view's array, via native immutable mutate, never the live store.
        if (typeof value.mutate === "function" && Array.isArray(value._array)) value = value.mutate(copy => {
            // Check each id once instead of running two regexes per comparison.
            const ids = new Map();
            const idOf = message => {
                let id = ids.get(message);
                if (id === undefined) { const text = String(message.id); id = /^\d+$/.test(text) ? text : null; ids.set(message, id); }
                return id;
            };
            copy._array.sort((a,b) => {
                const left = idOf(a), right = idOf(b);
                if (left === null || right === null) return 0;
                return left.length - right.length || (left === right ? 0 : left < right ? -1 : 1);
            });
        },true);
        if (deletedViews.size >= 16) deletedViews.delete(deletedViews.keys().next().value);
        deletedViews.set(channelId,{orig:result,revision:deletedRevision,value});
        return value;
    }
    // getMessages(channelId), called on every chat render and store check: skip arguments allocation.
    retainedMessages.call1 = (orig, self, channelId) => {
        if (!deletedByChannel.size || !enabled("noDelete") || !deletedByChannel.has(channelId)) return orig.call(self, channelId);
        return retainedMessages(orig, self, [channelId]);
    };
    function rememberDeleted(event, orig, self) {
        const key = deletedKey(event.channelId, event.id);
        if (deleted.has(key)) return true;
        const message = msgStore && msgStore.getMessage(event.channelId,event.id);
        if (!retainable(message, event)) return false;
        while (deleted.size >= settings.noDeleteLimit) {
            const pending = dropDeleted(deleted.keys().next().value);
            if (!pending) break;
            orig.call(self,{type:"MESSAGE_DELETE",channelId:pending.channelId,id:pending.id});
        }
        keepDeleted(key,{type:"MESSAGE_DELETE",channelId:event.channelId,id:event.id,message:markDeleted(message),raw:undefined});
        invalidateDeleted(); persistDeleted();
        // Update the underlying collection too: native row diffing compares record identity.
        // The retained view supplies a new record; do not corrupt content to force a diff.
        // The store's own MESSAGE_UPDATE change re-renders; never emitChange mid-dispatch.
        return orig.call(self,{type:"MESSAGE_UPDATE",message:{id:event.id,channel_id:event.channelId,content:message.content || ""}}) || true;
    }
    // Kept messages and edit history of channels that are gone for good.
    function forgetChannels(ids) {
        let dropped = false;
        ids.forEach(id => {
            const bucket = deletedByChannel.get(id);
            if (bucket) { Array.from(bucket.keys()).forEach(dropDeleted); dropped = true; }
        });
        if (dropped) invalidateDeleted();
        for (const [key, entry] of edits) if (ids.has(entry.channelId)) { edits.delete(key); dropped = true; }
        if (dropped) persistDeleted();
    }
    // dispatch(event) for an event no branch below reads (most of the traffic): straight through, no arguments object.
    // Everything else takes the full path with the real arguments.
    const dispatchEventFull = (orig, self, event) => dispatchEvent(orig, self, [event]);
    function dispatchEvent(orig, self, args) {
        const event = args[0];
        if (!event || !DISPATCH_EVENTS.has(event.type)) return orig.apply(self, args);
        if (features.hiddenChannels) channelMetadataEvent(event);
        if (event.type === "LOGOUT") { clearDeleted(false); edits.clear(); archiveRestored = false; clearReviewAuth(); }
        if (!features.noDelete) return orig.apply(self, args);
        if (RESTORE_EVENTS.has(event.type)) Promise.resolve().then(restoreDeleted);
        // Views are keyed by the store's own ChannelMessages identity, so unrelated events
        // (typing, presence, reactions) no longer force a re-merge and re-sort of every chat.
        if (event.type === "CHANNEL_DELETE" && (deleted.size || edits.size)) forgetChannels(new Set([event.channel && event.channel.id || event.channelId || event.id]));
        // Leaving a server (not an outage, which says unavailable) used to keep its kept messages and edit history
        // in memory and in the saved file for good, where nothing could ever show or remove them.
        if (event.type === "GUILD_DELETE" && event.guild && event.guild.id && !event.guild.unavailable && (deleted.size || edits.size)) {
            const ids = new Set(), guild = event.guild.id;
            const inGuild = channelId => { const channel = receivedChannel(channelId); return !!(channel && channel.guild_id === guild); };
            deletedByChannel.forEach((bucket, channelId) => { if (inGuild(channelId)) ids.add(channelId); });
            edits.forEach(entry => { if (!ids.has(entry.channelId) && inGuild(entry.channelId)) ids.add(entry.channelId); });
            if (ids.size) forgetChannels(ids);
        }
        if (!enabled("noDelete")) return orig.apply(self, args);
        if (event.type === "MESSAGE_UPDATE" && settings.noDeleteEdits) rememberEdit(event.message);
        if (event.type === "MESSAGE_DELETE" && event.channelId && event.id) {
            // Your own deletion of a message we were already showing: remove it for real.
            const kept = rememberDeleted(event, orig, self);
            // Discord's deleteMessage chains .then() on dispatch(); always hand back a thenable.
            if (kept) return kept === true ? Promise.resolve() : kept;
        }
        if (event.type === "MESSAGE_DELETE_BULK" && event.channelId && Array.isArray(event.ids)) {
            const remaining = event.ids.filter(id => !rememberDeleted({channelId:event.channelId,id}, orig, self));
            if (!remaining.length) return Promise.resolve();
            const next = Array.from(args); next[0] = Object.assign({}, event, {ids:remaining});
            return orig.apply(self, next);
        }
        return orig.apply(self, args);
    }
    dispatchEvent.call1 = (orig, self, event) => !event || !DISPATCH_EVENTS.has(event.type) ? orig.call(self, event) :
        dispatchEventFull(orig, self, event);
    // Only a real edit counts: Discord's own update carries edited_timestamp and new text. Link previews,
    // reactions, pins and the update NoDelete sends for a kept message have no edit time or keep the text.
    function rememberEdit(update) {
        if (!update || typeof update.content !== "string" || !update.edited_timestamp || !update.id || !update.channel_id || !msgStore) return;
        let current;
        try { current = msgStore.getMessage(update.channel_id, update.id); } catch (_) { return; }
        const before = current && current.content;
        if (typeof before !== "string" || before === update.content) return;
        const key = deletedKey(update.channel_id, update.id);
        let entry = edits.get(key);
        if (entry) edits.delete(key);
        else {
            if (edits.size >= MAX_EDITED) edits.delete(edits.keys().next().value);
            entry = {channelId:update.channel_id, id:update.id, versions:[]};
        }
        const at = current.editedTimestamp || current.timestamp;
        entry.versions.push({content:before.length > MAX_VERSION_TEXT ? before.slice(0, MAX_VERSION_TEXT) + "\u2026" : before,
            at:at && typeof at.toISOString === "function" ? at.toISOString() : typeof at === "string" ? at : null});
        if (entry.versions.length > MAX_VERSIONS) entry.versions.splice(0, entry.versions.length - MAX_VERSIONS);
        entry.text = undefined; entry.view = undefined; entry.joined = undefined;
        edits.set(key, entry);
        persistDeleted();
    }
    // Earlier versions sit above the message in one quote bar, each as small grey struck-through text: Discord's
    // own native block quote, subtext and strikethrough nodes, so it follows the theme and font like any message.
    // Plain text only, so an old version can never ping anyone or open a link.
    function editHistoryNodes(entry) {
        if (entry.view) return entry.view;
        const lines = [];
        entry.versions.forEach((version, index) => {
            if (index) lines.push({type:"br"});
            lines.push({type:"subtext", content:[{type:"s", content:[{type:"text", content:version.content || "(empty)"}]}]});
        });
        entry.view = {type:"blockQuote", content:lines};
        return entry.view;
    }
    function withEditHistory(message, channelId, id) {
        if (!edits.size || !settings.noDeleteEdits || !message || !Array.isArray(message.content)) return message;
        const entry = edits.get(deletedKey(channelId, id));
        if (!entry || !entry.versions.length) return message;
        // Rows are generated again for every change in the chat; reuse the joined content while neither side changed.
        const view = editHistoryNodes(entry), joined = entry.joined;
        const content = joined && joined.view === view && joined.source === message.content ? joined.value :
            (entry.joined = {view, source:message.content, value:[view].concat(message.content)}).value;
        return Object.assign({}, message, {content});
    }
    function deleteMessage(orig, self, args) {
        const key = deletedKey(args[0], args[1]), event = deleted.get(key);
        if (event && dispatcher) {
            dropDeleted(key); invalidateDeleted(); persistDeleted(); dispatcher({type:"MESSAGE_DELETE",channelId:event.channelId,id:event.id});
            return Promise.resolve(); // Dismiss locally; never DELETE an already-deleted message on the server.
        }
        // Your own deletions are kept like anyone else's, so there is nothing to track here.
        return orig.apply(self, args);
    }
    const JUMP_GROUP_STYLE = {gap:8}, JUMP_FLIP_STYLE = {transform:[{scaleY:-1}]};
    function jumpButton(orig, self, args) {
        if (React) useSettings("jumpToTop");
        const props = args[0], screenIndex = props && props.screenIndex;
        // Same native hooks as JumpToPresent; respects composer resizing and suggestion bars.
        const inputHeight = chatHeight && chatHeight.useChatInputContainerHeight(screenIndex);
        const suggestionHeight = chatHeight && chatHeight.useSmallSuggestionBarHeight(screenIndex);
        const result = orig.apply(self, args);
        if (!enabled("jumpToTop") || !React || !RN || !props || !props.channelId || !msgActions) return result;
        const channelId = props.channelId;
        if (hiddenChannel(channelId)) return result;
        let returnMessageId;
        if (msgStore && typeof msgStore.getMessages === "function") {
            const msgs = msgStore.getMessages(channelId);
            if (msgs) {
                if (msgs.ready && !msgs.hasMoreBefore && msgs.length <= 1) return result;
                const last = typeof msgs.last === "function" ? msgs.last() : null;
                if (last && last.id) returnMessageId = last.id;
            }
        }
        const onPress = () => msgActions.jumpToMessage({channelId, messageId:channelId, flash:true, jumpType:"ANIMATED", returnMessageId});
        const child = result && result.props && result.props.children;
        if (child && child.props && typeof child.props.onPress === "function") {
            const top = React.cloneElement(child, {key:"venus-jump-top", onPress, accessibilityLabel:tr("Jump to top")});
            return React.cloneElement(result, {children:el(RN.View, {style:JUMP_GROUP_STYLE},
                el(RN.View, {style:JUMP_FLIP_STYLE}, top), child)});
        }
        if (result || !jumpPill || !jumpIcon) return result;
        // Never render bare black text over chat/media. Use Discord's themed native pill.
        const bottom = Math.max(0,Number.isFinite(inputHeight) ? inputHeight : 64) + Math.max(0,Number(suggestionHeight) || 0) + 12;
        return el(RN.View, {pointerEvents:"box-none", style:{position:"absolute",bottom,right:16}},
            el(RN.View,{style:JUMP_FLIP_STYLE},
                el(jumpPill,{icon:jumpIcon,onPress,accessibilityLabel:tr("Jump to top")})));
    }
    function hiddenCan(orig, self, args) {
        // One real permission check per call. The old path ran it twice for every visible
        // channel, and re-checked canBasicChannel with the full can(), which reads a
        // different record shape (350.8 PermissionStore: basicPermissions).
        const real = orig.apply(self, args);
        if (real || !enabled("hiddenChannels")) return real;
        const bit = args[0], channel = args[1];
        // Escape hatch: a channel with realCheck asks for the true permission result.
        // Loose equality: VIEW_CHANNEL can be BigInt/object across module copies.
        return !!(channel && !channel.realCheck && viewPermission != null && bit == viewPermission &&
            channel.guild_id && channel.type !== 1 && channel.type !== 3) || real;
    }
    // can(permission, channel), the usual call (once per channel per list render): no arguments object.
    hiddenCan.call2 = (orig, self, bit, channel) => {
        const real = orig.call(self, bit, channel);
        if (real || !enabled("hiddenChannels")) return real;
        return !!(channel && !channel.realCheck && viewPermission != null && bit == viewPermission &&
            channel.guild_id && channel.type !== 1 && channel.type !== 3) || real;
    };
    // The mobile list has a second VIEW_CHANNEL filter. Give ONLY that factory a
    // metadata-list facade; the real permission store and all other callers stay stock.
    function listImport(importer) {
        if (typeof importer !== "function") return importer;
        return function () {
            const result = importer.apply(this,arguments);
            if (!result || arguments[0] !== 2065 && arguments[0] !== 4750) return result;
            const real = result.default || result;
            if (arguments[0] === 2065) {
                const methods=new Map();
                const facade=new Proxy(real,{get(target,key) {
                    const value=Reflect.get(target,key,target);
                    if (typeof value!=="function") return value;
                    const old=methods.get(key);
                    if (old && old.original===value) return old.bound;
                    const lookup=["getChannel","getBasicChannel"].includes(key);
                    const bound=function () {
                        const channel=value.apply(real,arguments);
                        return lookup && channel && enabled("hiddenChannels") ? displayChannel(channel) : channel;
                    };
                    methods.set(key,{original:value,bound});return bound;
                }});
                return result.default ? cloneWith(result,"default",facade) : facade;
            }
            if (typeof real.can !== "function") return result;
            const facade = Object.create(real);
            facade.can = function (bit, channel) {
                // Loose equality like hiddenCan: VIEW_CHANNEL can be a BigInt or number across module copies.
                if (viewPermission != null && bit == viewPermission && hiddenMetadata(channel)) return true;
                return real.can.apply(real,arguments);
            };
            return result.default ? cloneWith(result,"default",facade) : facade;
        };
    }
    function receivedChannel(id) {
        if (!channelStore || !id) return null;
        return channelStore.getChannel(id) || typeof channelStore.getBasicChannel === "function" && channelStore.getBasicChannel(id);
    }
    function realCan(bit, channel) {
        // Real permission result, bypassing our own global facade.
        // Honours the realCheck escape hatch.
        if (channel && channel.realCheck) { channel = Object.assign({}, channel); delete channel.realCheck; }
        // permissionsCanOrig is always set before permissions, so no second path is needed.
        try { return !!permissionsCanOrig && permissionsCanOrig(bit, channel); } catch (_) { return false; }
    }
    function hiddenMetadata(value) {
        if (!enabled("hiddenChannels")) return false;
        const channel = typeof value === "string" ? receivedChannel(value) : value;
        return !!(channel && channel.guild_id && channel.type !== 1 && channel.type !== 3 &&
            permissions && viewPermission != null && !realCan(viewPermission, channel));
    }
    function hiddenChannel(value) {
        const channel = typeof value === "string" ? receivedChannel(value) : value;
        return !!(channel && channel.type !== 4 && hiddenMetadata(channel));
    }
    // Channel records are immutable and replaced on change, so one renamed copy per record and name is reused.
    // A new copy on every lookup gave the channel list a different object each render, and copied every property.
    const renamedChannels = new WeakMap();
    function renamedChannel(channel, name) {
        if (name === channel.name) return channel;
        const known = renamedChannels.get(channel);
        if (known && known.name === name) return known.value;
        const value = cloneWith(channel,"name",name);
        renamedChannels.set(channel, {name, value});
        return value;
    }
    function displayChannel(channel) {
        if (!hiddenMetadata(channel)) return channel;
        return renamedChannel(channel, hiddenName(channel));
    }
    const HIDDEN_BUCKET_TYPES = [0, 2, 4, 5, 10, 11, 12, 13, 15, 16];
    function hiddenDirectory(orig, self, args) {
        const result = orig.apply(self, args), guild = args[0];
        // Always cache names from the current store even while the toggle is off,
        // so enabling later still resolves. This read-only scan never changes permissions.
        // One read of both caches per lookup; the remembered names are reused below.
        let full, basic, source;
        // Resolve the account once per lookup, not once per channel, and walk basic then full
        // records: the same final cache as walking the merged map, without visiting basic twice.
        function remember() {
            const current = userStore && userStore.getCurrentUser(), owner = current && current.id;
            // Skip rescanning channel names while the server's channel tables are the exact same objects.
            const last = hiddenScans.get(guild);
            if (last && last.full === full && last.basic === basic && last.owner === owner && last.source) {
                source = last.source;
                return;
            }
            if (!source) source = basic ? Object.assign({},basic,full) : full;
            if (hiddenScans.size >= 64 && !last) hiddenScans.delete(hiddenScans.keys().next().value);
            hiddenScans.set(guild, {full, basic, owner, source});
            if (basic) for (const k in basic) if (Object.prototype.hasOwnProperty.call(basic, k)) rememberChannelName(basic[k], owner, undefined, guild);
            for (const k in full) if (Object.prototype.hasOwnProperty.call(full, k)) rememberChannelName(full[k], owner, undefined, guild);
        }
        function read() {
            full = channelStore.getMutableGuildChannelsForGuild(guild);
            if (!full) return;
            basic = typeof channelStore.getMutableBasicGuildChannelsForGuild === "function" && channelStore.getMutableBasicGuildChannelsForGuild(guild);
            // Native lazy caching keeps basic metadata for channels with no full record.
            // Merge by ID, with full records retaining their richer native prototype.
            remember();
        }
        const readable = guild && channelStore && typeof channelStore.getMutableGuildChannelsForGuild === "function";
        try { if (readable) read(); } catch (_) { source = undefined; }
        if (!enabled("hiddenChannels") || !result || !readable || !permissions) return result;
        // The read above threw part-way: retry once, letting a real error surface as before.
        if (!source) { read(); if (!source) return result; }
        const extra = [];
        for (const k in source) {
            if (Object.prototype.hasOwnProperty.call(source, k) && hiddenMetadata(source[k])) extra.push(source[k]);
        }
        // Recheck permissions and metadata on each directory lookup; retain stable
        // array identity for unchanged inputs and bound the cache to 16 guilds.
        const names = new Map();
        let signature = "";
        const references = extra.slice();
        for (let i = 0; i < extra.length; i++) {
            const c = extra[i], name = hiddenName(c);
            names.set(c, name);
            if (i) signature += "|";
            signature += c.id + ":" + c.position + ":" + c.type + ":" + c.parent_id + ":" + name;
            const parent = source[c.parent_id];
            if (parent) references.push(parent);
        }
        const cached = hiddenViews.get(guild);
        if (cached && cached.orig === result && cached.source === full && cached.basic === basic && cached.signature === signature &&
            references.length === cached.references.length) {
            let sameRefs = true;
            for (let i = 0; i < references.length; i++) if (references[i] !== cached.references[i]) { sameRefs = false; break; }
            if (sameRefs) return cached.value;
        }
        let next = result;
        function append(key, channels) {
            if (!Array.isArray(next[key])) return;
            const original = next[key];
            let existing = original, renamed = false;
            for (let i = 0; i < original.length; i++) {
                const entry = original[i];
                if (!entry.channel) continue;
                const channel = displayChannel(entry.channel);
                if (channel !== entry.channel) {
                    if (!renamed) { existing = original.slice(); renamed = true; }
                    existing[i] = Object.assign({}, entry, {channel});
                }
            }
            if (!channels.length && !renamed) return;
            const ids = new Set();
            for (let i = 0; i < existing.length; i++) {
                const ch = existing[i] && existing[i].channel;
                if (ch) ids.add(ch.id);
            }
            const added = [];
            for (let i = 0; i < channels.length; i++) {
                const channel = channels[i];
                if (ids.has(channel.id)) continue;
                ids.add(channel.id);
                const name = names.get(channel);
                // Hidden names were resolved for the signature above; reuse them instead of asking again.
                const shown = name === undefined ? displayChannel(channel) : renamedChannel(channel, name);
                added.push({channel:shown,comparator:channel.position || 0});
            }
            if (!added.length && !renamed) return;
            if (next === result) next = Object.assign({}, result);
            next[key] = existing.concat(added).sort((a,b) => a.comparator - b.comparator);
        }
        const byType = new Map(), selectable = [], vocal = [], parents = [];
        for (let i = 0; i < extra.length; i++) {
            const c = extra[i], t = c.type;
            let bucket = byType.get(t);
            if (!bucket) byType.set(t, bucket = []);
            bucket.push(c);
            if (t !== 2 && t !== 4 && t !== 13) selectable.push(c);
            if (t === 2 || t === 13) vocal.push(c);
            const p = source[c.parent_id];
            if (p && p.type === 4) parents.push(p);
        }
        const empty = [];
        for (let i = 0; i < HIDDEN_BUCKET_TYPES.length; i++) {
            const type = HIDDEN_BUCKET_TYPES[i];
            append(type, byType.get(type) || empty);
        }
        append("SELECTABLE", selectable);
        append("VOCAL", vocal);
        append(4, parents);
        if (hiddenViews.size >= 16 && !hiddenViews.has(guild)) hiddenViews.delete(hiddenViews.keys().next().value);
        hiddenViews.set(guild, {orig:result,source:full,basic,signature,references,value:next});
        return next;
    }
    const hiddenConfirmed = new Set();
    // Message fetches are never a tap. A channel row preloads its messages on press-in (ChannelActionCreators.preload
    // 7015 -> CHANNEL_PRELOAD -> MessageManager 9312 -> fetchMessages isPreload), which fires as soon as a finger
    // touches the row, even when it then scrolls. Discord also fetches the restored channel on its own at startup.
    // Asking here showed the locked-channel details while scrolling or opening the app (#62). Taps go through
    // navigation (hiddenNavigation), which asks; this guard only keeps locked channels from loading, silently.
    function hiddenFetch(orig, self, args) {
        const channelId = typeof args[0] === "string" ? args[0] : args[0] && args[0].channelId;
        if (!hiddenChannel(channelId) || hiddenConfirmed.has(channelId)) return orig.apply(self, args);
        return Promise.resolve();
    }
    // Locked channels are listed among the selectable ones, and the facade says they can be viewed, so Discord's
    // "first channel you can see" (GuildChannelStore 4748 getDefaultChannel/getSFWDefaultChannel -> getFirstChannel)
    // picked a locked channel placed above the real ones. A locked channel never wins over a real one.
    function hiddenFirstChannel(orig, self, args) {
        if (!enabled("hiddenChannels") || typeof args[1] !== "function") return orig.apply(self, args);
        const predicate = args[1], next = Array.from(args);
        next[1] = function (entry) { return !(entry && hiddenChannel(entry.channel)) && predicate.apply(this, arguments); };
        return orig.apply(self, next);
    }
    // The channel a server opens on (SelectedChannelStore 2116 getChannelId(guildId), used when you tap a server, by
    // getChannelIdForGuildTransition 6921 and when Discord restores the last server at startup) is the last one
    // picked there; with no server given it is the current channel, which Discord restores when the app opens.
    // Opening a server or the app never lands on a locked channel: a remembered locked channel gives way to the
    // server's first real channel. Only a locked channel you opened yourself with View Anyway is kept.
    function hiddenSelectedChannel(orig, self, args) {
        const id = orig.apply(self, args);
        if (!enabled("hiddenChannels") || typeof id !== "string" || hiddenConfirmed.has(id) || !hiddenChannel(id)) return id;
        const channel = receivedChannel(id), guild = args[0] != null ? args[0] : channel && channel.guild_id;
        let real = null;
        try { real = guildChannels && guild ? guildChannels.getDefaultChannel(guild) : null; } catch (_) { real = null; }
        return real && real.id && !hiddenChannel(real) ? real.id : null;
    }
    // "A, B and C" in Venus's language. Japanese and Chinese join with "、" and no spaces (「8 日、7 時間と7 分」),
    // Thai with plain spaces, as it has no commas.
    function joinAnd(parts) {
        if (parts.length < 2) return parts[0] || "";
        const code = uiLanguage(), tight = code === "ja" || code === "zh-CN" || code === "zh-TW";
        const head = parts.slice(0, -1).join(tight ? "、" : code === "th" ? " " : ", "), last = parts[parts.length - 1];
        return tight ? head + tr("and") + last : head + " " + tr("and") + " " + last;
    }
    function preciseAgo(ms) {
        // Precise relative durations:
        // "8 days, 7 hours and 7 minutes ago". Three largest nonzero units.
        if (!Number.isFinite(ms)) return null;
        let diff = Date.now() - ms;
        if (diff < 0) diff = 0;
        const minute = 60000, hour = 60 * minute, day = 24 * hour, month = 30 * day, year = 365 * day;
        const parts = [];
        function take(unit, singular, plural) {
            const value = Math.floor(diff / unit);
            if (value > 0) { parts.push(pl(value, singular, plural)); diff -= value * unit; }
        }
        if (diff < 45 * 1000) {
            const secs = Math.floor(diff / 1000);
            return secs <= 5 ? tr("just now") : pl(secs, "{n} second ago", "{n} seconds ago");
        }
        take(year, "{n} year", "{n} years"); take(month, "{n} month", "{n} months"); take(day, "{n} day", "{n} days");
        take(hour, "{n} hour", "{n} hours"); take(minute, "{n} minute", "{n} minutes");
        const shown = parts.slice(0, 3);
        if (!shown.length) return tr("just now");
        return tr("{time} ago", {time: joinAnd(shown)});
    }
    function snowflakeMs(id) {
        if (typeof id !== "string" || !/^\d{17,20}$/.test(id)) return NaN;
        try { return Number(BigInt(id) >> BigInt(22)) + 1420070400000; }
        catch (_) { return NaN; }
    }
    function hiddenStamp(value, fallback) {
        // {relative, absolute} for a snowflake, Date or ISO timestamp.
        let ms = NaN;
        if (typeof value === "string" && /^\d{17,20}$/.test(value)) ms = snowflakeMs(value);
        else if (value instanceof Date) ms = value.getTime();
        else if (value != null && value !== "") {
            const parsed = new Date(value);
            if (Number.isFinite(parsed.getTime())) ms = parsed.getTime();
        }
        const relative = preciseAgo(ms);
        if (relative === null) return {relative:fallback, absolute:null};
        let absolute = null;
        try { absolute = new Date(ms).toLocaleString(); } catch (_) {}
        return {relative, absolute};
    }
    function hiddenDetails(channel) {
        const pin = channel.lastPinTimestamp || channel.last_pin_timestamp;
        const last = channel.lastMessageId || channel.last_message_id;
        return [
            [tr("Created"), hiddenStamp(channel.id, tr("Unavailable"))],
            [tr("Last message"), last ? hiddenStamp(last, tr("No messages yet")) : {relative:tr("No messages yet"), absolute:null}],
            [tr("Last pin"), pin ? hiddenStamp(pin, tr("No pins yet")) : {relative:tr("No pins yet"), absolute:null}]
        ];
    }
    function HiddenDetails(props) {
        // Rendered inside Discord's own AlertModal (HBC98 module 5305) as extraContent:
        // native Text tokens follow the active theme; no hardcoded colors or backdrop.
        const Text = props.Text;
        return el(RN.View, {style:{gap:14}}, props.rows.map(([label, stamp]) =>
            el(RN.View, {key:label, style:{gap:2}},
                el(Text, {variant:"text-xs/semibold", color:"text-muted"}, label.toUpperCase()),
                el(Text, {variant:"text-md/medium", color:"text-default", selectable:true}, stamp.relative),
                stamp.absolute ? el(Text, {variant:"text-sm/medium", color:"text-muted", selectable:true}, stamp.absolute) : null)));
    }
    // One prompt per channel at a time: a navigation guard and a fetch guard can
    // fire for the same tap, which used to stack duplicate dialogs. Native
    // backdrop dismissal calls onCancel (HBC98 closure #80886), so every close
    // path releases the guard; 30 s is only a safety net.
    const hiddenPrompts = new Map();
    function showHidden(channel, onViewAnyway) {
        if (!channel || !RN) return;
        const now = Date.now(), open = hiddenPrompts.get(channel.id);
        if (open && now - open.at < 30000) return;
        const prompt = {at:now};
        hiddenPrompts.set(channel.id, prompt);
        const settle = () => { if (hiddenPrompts.get(channel.id) === prompt) hiddenPrompts.delete(channel.id); };
        const confirm = () => { settle(); if (typeof onViewAnyway === "function") onViewAnyway(); };
        const rows = hiddenDetails(channel);
        const title = tr(channel.type === 2 || channel.type === 13 ? "Locked voice channel" : "Locked channel");
        const body = tr("You don't have permission to view this channel. These details come from what Discord already sent your client.");
        // Discord's native alert (the "Delete Message" dialog): blurred backdrop,
        // themed card, Discord buttons. String title/body/confirmText + children
        // selects the modern AlertModal path in AlertActionCreators.show (module 5300).
        // Demand-loaded at tap time: no extra Metro factories are wrapped at startup.
        const alerts = inspectedExport(5300, "default");
        const Text = inspectedExport(5088, "Text");
        if (React && alerts && typeof alerts.show === "function" && Text) {
            try {
                alerts.show({title, body, children:el(HiddenDetails, {rows, Text}),
                    confirmText:tr("View Anyway"), cancelText:tr("Cancel"), onConfirm:confirm, onCancel:settle});
                return;
            } catch (_) { /* fall through to the platform alert */ }
        }
        if (!RN.Alert) {settle();return;}
        const message = rows.map(([label, stamp]) => label + ": " + stamp.relative + (stamp.absolute ? " (" + stamp.absolute + ")" : "")).join("\n");
        try {
            RN.Alert.alert(title, message, [
                {text:tr("Cancel"), style:"cancel", onPress:settle},
                {text:tr("View Anyway"), onPress:confirm}
            ], {cancelable:true, onDismiss:settle});
        } catch (_) { settle(); }
    }
    function hiddenNavigation(orig, self, args) {
        const route = args[0];
        const match = typeof route === "string" && /^\/channels\/(?:@me|[^/]+)\/([^/?#]+)(?:[/?#]|$)/.exec(route);
        if (!match || !hiddenChannel(match[1]) || hiddenConfirmed.has(match[1])) return orig.apply(self, args);
        const id = match[1];
        // With the details menu turned off, tapping a locked channel simply does nothing.
        if (enabled("hiddenChannelsMenu")) showHidden(receivedChannel(id), () => { hiddenConfirmed.add(id); return orig.apply(self, args); });
        return; // Wait for user choice; View Anyway then navigates.
    }
    function hiddenGuildNavigation(orig, self, args) {
        // Opening a server by itself (with a locked channel Discord remembered) goes to the server's first real
        // channel without asking: the locked channel may have been the last one tapped, but you opened the server.
        if (!hiddenChannel(args[1]) || hiddenConfirmed.has(args[1])) return orig.apply(self, args);
        const next = Array.from(args);
        let real = null;
        try { real = guildChannels && args[0] ? guildChannels.getDefaultChannel(args[0]) : null; } catch (_) { real = null; }
        next[1] = real && real.id && !hiddenChannel(real) ? real.id : undefined;
        return orig.apply(self, next);
    }
    let guildChannels = null;
    let pastelHash, guildMembers, presenceStore, sessionsStore, displayNameType, nativeRowGroup, nativeSwitchRow, oauthModal;
    // The original PlatformIndicators plugin's themable PNG glyphs, tinted by status.
    const platformPngs = {"desktop": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAVFBMVEUAAACvv7+3u7+5u7+2ub+4u726vL65u765vL65vMG5u723ub23v7+3t7+6vL+4ur+6u765u764vL+4ur23t7+7vb+3ur25ur64ur+7u766ur6vr7/+1nXbAAAAHHRSTlMAEEB/UHDv/99fgIAgQJ+f7++fnyB/YN9vTz8QSaZf3QAAAI1JREFUeAHt1tUBwkAURNEXHZzg1n+d2Fc8u4OTOQXcyKqJ3ARh5C22qiQFYTC0khFIYyuYgDYthGagzQuhDLRFIYS7yBPuakLmSaF2CimkkEIKKfT8I5un0MdCT7v6LUFbFUIhaGsr2IAUWcl2B0K2t6pDVKttGR5P3BJvpxCnfdTMHVo9NaRQ1MpKRC5jHSw3VFQzIwAAAABJRU5ErkJggg==", "web": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAQAAAD/5HvMAAADgklEQVR42u3a32vVdRzH8VdOv2NzGzM7bkp0E9F9RQSbOmK6groQpeugOzXJfnCW3YwgC4IyHCldrBmFELtQRxfK2MHp1sjVZRfBMSJFYu6cMUnOOZPz9Gb45uyc79fv5/tDvDiPv+DJh/fn8+HL56umpqbHFZsZ4hjjzJOnQJkyBfLMM87H7GWzHh16OcoVKgQpM8N79Cht7GaSVcJa5QK7lBZe5SpRzDCgpLGdH6gS3SRPKzm8xTJxFTmgJNDKtyRllFbFQxfTRLVCvSk6FR3b+J3onuRTlllvgUzk1YmVsyJJdPMN1bqkzmizM00cc1rDIP9SawpPrjhFPAf1AN1cotZJ940ezwKb1q33BLX2Kzx2sBwzZ7vWoYXvAVOkV2FxlqjuMMtBNqkBNpIDzI/h7ywnTsfIP5gquxUGV3EiB7zMPcxlPRwDOJITTgNmpx6GyZSDnqKAOa9g9LKKIzniA0yFbQrC+5B6UDf/Y44oCFdwdUPOGMfkgr8kyrg6Lmf0YUq0yw9DuLnBcTw5YwNFzB754RhmkYaUCH7BDMsPZzDDZFMM+gQzJj/8inlTYiS1oNcws/LD35jnJUtKPOgFzHX5YQmzdmCRTSXoGcyi/FDGtEqWlHhQG6YULsjTA4zg5iZf4CkAXrig25gtUowk+FwB2IpZDDfUz8pEWiUF4DnM9XDbfkiKl6QAvB5u248H38KMJBZ0FDMW7uo4qwbIJhQ0gcnKD3sxN3lCirNKgZfrf5hB+aGdEuYVNUQ2dtAuTIk2+WMG87V8MBIzaBQzrdDDVqBDPuIE0cUy5rCC0MMq5lAqQR9hKmRcPoNu0ZF0EN0sYs7JBAyc+UwNsUJYd7nGO2zUGr4CTL9MqMGu8KIaYB43C2yVJPq4h8kpDAaoYv6kS3U4jKvfaGELeUyVfoXDT4C5wAatg8cfuHqbS4A54/K8UgTMd/WnNjuckyqAKdCj8DhArdO0NFilQ8xxhyiq7JMbRqk1GXAEuDshV3hMUesvXkoo6CKe3NHJArUqfEln7KBrdCgaMnVJcIsPa6OcczKKjk6mqFfkFH20RAi6SIfiweMkjS0xwTBvEFaVE3hKAvspEleBfUoOvTGfOH+mJ40X6ctEkaNfaWEn56kQVoVz9CltZDhCjhJBSuR4l4weHdrZwzBjzJFniTJlbpNnljGyDNLW/BmlqelxdR++AoGbDB4jjAAAAABJRU5ErkJggg==", "mobile": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAMAAADVRocKAAAAXVBMVEUAAAAwMDgwMDUwMDUuMDYwMDYvMTcvMTYvMTYwMDYwMDUvMTYwMjUvMTUvMjYvMTUuMDUuMDQvMDUtMTUwMDgvMDUwMDAtMDYuMDYwMDAtMDUvMDYuMDUtMDcpMTo5aAq8AAAAH3RSTlMAIGBvf1C//89fMN9g75+/j3+fP0C/IFBfMGDPb08fcZ9WCgAAAMNJREFUeAHt2YWNxQAMg2EX/fiVud1/zBuhSaRjfwv8UsQx5J9L0iw/VySIyUoaXa7wu93pcE/g9KDTFS4F+amF5Em3ZwK7FwPeMEsYcoNVxZAaViX5uTd6MuQJKwY5A01u9goFWph1fyKggAIKKKCAAgoooIACCiiggAIKKKCAAgoooIACn/l9d/t3gU/fcEqG9LDKGVLB6saQAZ97owZ2w5NuzwEOKd1G4FMLE5wG36Y/w29ZadRviBn2/Nw2HfjTPgD3/UVA1TCAGgAAAABJRU5ErkJggg==", "embedded": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAk1BMVEUAAAC3u7+4ur+5vL+5u765u7+6vL+2ub+3v7+6u7+5vL66v7+6vL65u761ur+4u765vL+3t7+6u765u7+9vb23t7+7vb+6u766ur+5ur6/v7+vv7+9vcW1tb+5u727u763ur25vL+6vL+3ub24ur+5u7+4vL+5ur66ur64ur25vL+6u764ur24u722uby5u76vr7/eehxsAAAAMXRSTlMAQJ/f/8+fUCC/3zDv7zC/UEDvfx8gf88w3xAQHzCAT2Bfb4Bvj5/PP6+vv59wUM8QEONx+AAAAWZJREFUeAHt1dWa6zAMBOA5PSqzs2Vmhvd/uWWcVFHqr5f+r+3JRqtJ8UhBEAT/Mv8lpWwuD02hKHcpFXBTuSJ3qtZwQ0HPUVULiCuJhzpiGuKlCZaTL3gnxEVPaLWdkAxYJznIdfGmy0k9MEkOivChLQSkbwS18KElZEBBLSMIX4QMuRxaEJ0vCBndCkJMbEZjIRO6MTWCqjWlRjO6MTeCpLoooDWuCFvSjcgK0pYzohsrM0hZzhXdWJtBynJyR4rGv19dzrp3EC3nhoJKZpCynNxalzqIlrPKU7WDlOXUym8H0XIOufy+htxZX9tHBU24/L5mXH5fSy6/r4jL/8sOidYJv2x7fu0k84SgIn/Qmb50dT2oB6YXk+tf4hElWuuPdeaIlCFx/fkLeM+Q1Ferw3RQZ9SmP8jQlR9H/NZ3tKmG08+sW/SMnrxzZ6Qy/TrfBWkdL+Lq0RUptaYHJyU+HwRB4O0FjTMnvIkvoBQAAAAASUVORK5CYII=", "vr": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAANlBMVEVMaXHv7/Hv7/Hv7/Hv7/Hv7/Hv7/Hv7/Hv7/Hs7PTu7vHv7/Hv7/Hv7/Hv7/Hv7/Hv7/Hv7/EEUZf/AAAAEXRSTlMAzGV4UNr78OcJFDufKb6ri3Gd0SEAAAHQSURBVFjD7VbHdsQgDDRNiOby/z+bjY0N2LRk95C8xxwNHo0KkqZpYGBg4PMwbBa4ZYFiZqaPRVGxNSCoavPwJs0ujLbk2K0TtipKz1s3Zl3RE/PILGKmsqbLL8JcwZ5y9LJmi3E+k8Ib1UH8xcI95Utnaeb2TAnmbzLP01NsnilfBEcBCW9FVXWpwzvxrGYiE785ASC1p2DO3M5xlWty5ZREyrEmKlQK0Tedweu1npUdNPxDVBrlHe5bIHQQue1m/YVIEKjIGKmGG7ZbPKYpqnsMnsGqqxUQNSzpP8WdJoSaNUop7nwFInZF600ijT0F3kE06dXS6RNEXfh7ROI/EMG7RPAM2++I8D48wqefZe0cJy74Bo+HaixBJPbRLXX0k5ueDenWgtzVYojLz670edNL55y2wSgPQPOtFhPbirPlKYlDPOyBPwUtjD8auzr6GwYXDKRrA4RAucMFmR0PvuXjeZ3K+wIiT++MD8Wa32n8KSxc67ArSOYcOzln6rTmi5eKhWbMIbMGyV2gkZkjKE4ZVr6cM1Lp6qxslN6ZoDodeLoVi6igTbqlYmOJ0muIBrIku4oFK7Ix9I7atAQ2SWym1F5HEjB3NDAwMPAuvgCPRUw2yKsaYwAAAABJRU5ErkJggg=="};
    function PlatformPng(props) {
        const uri = platformPngs[props.platform];
        if (!uri) return el(RN.View,{style:{width:16,height:16,borderRadius:8,backgroundColor:props.color}});
        return el(RN.Image,{source:{uri,width:16,height:16},style:{width:16,height:16,tintColor:props.color}});
    }
    let reviewToken = "", reviewAccount = null, reviewAuthAttempt = 0, reviewAuthState = "idle", reviewAuthError = "";
    const reviewCache = new Map(), platformWrappers = new WeakMap();
    const REVIEW_API = "https://manti.vendicated.dev/api/reviewdb";
    // One cache per tone (saturation, lightness), keyed by the seed: building "0.75:0.6:<id>" on every lookup cost
    // 5.9x more than the lookup itself on Hermes (number-to-string).
    const pastelCache = new Map();
    let pastelCacheColor, pastelCacheHash;
    function pastelColor(seed, saturation, lightness) {
        if (!pastelHash || !RN || typeof RN.processColor !== "function") return null;
        // Rows re-render constantly; the color only depends on these inputs and the active helpers.
        if (pastelCacheColor !== RN.processColor || pastelCacheHash !== pastelHash) {
            pastelCache.clear(); pastelCacheColor = RN.processColor; pastelCacheHash = pastelHash;
        }
        const tone = saturation === 0.75 && lightness === 0.6 ? "name" : saturation === 0.85 && lightness === 0.75 ? "mention" :
            saturation + ":" + lightness;
        let table = pastelCache.get(tone);
        if (!table) pastelCache.set(tone, table = new Map());
        const known = table.get(seed);
        if (known) return known;
        const color = computePastel(seed, saturation, lightness);
        if (table.size >= 1024) table.delete(table.keys().next().value);
        table.set(seed, color);
        return color;
    }
    function computePastel(seed, saturation, lightness) {
        const hue = ((pastelHash(String(seed)) >>> 0) % 360) / 360;
        const a = saturation * Math.min(lightness, 1 - lightness), h12 = hue * 12;
        function component(offset) {
            const k = (offset + h12) % 12;
            return Math.round(255 * (lightness - a * Math.max(-1, Math.min(k - 3, 9 - k, 1))));
        }
        const rgb = (component(0) << 16) | (component(8) << 8) | component(4);
        const hex = "#" + (0x1000000 | rgb).toString(16).slice(1);
        return {hex, value:RN.processColor(hex)};
    }
    // Every chat row runs this: the content array is only copied once a node actually changes.
    function pastelMentions(content, guildId) {
        if (!Array.isArray(content) || !content.length) return content;
        let next = null;
        for (let i = 0; i < content.length; i++) {
            const node = content[i];
            if (!node || typeof node !== "object") continue;
            let result = node;
            if (node.type === "mention" && node.userId && (!node.colorString || settings.pastelAll) &&
                (!guildId || guildMembers && guildMembers.getMember(guildId,node.userId))) {
                const color = pastelColor(node.userId,0.85,0.75);
                if (color) result = Object.assign({},node,{roleColor:color.value,color:color.value,colorString:color.hex});
            }
            const sub = node.content;
            if (typeof sub === "object" && Array.isArray(sub) && sub.length) {
                const children = pastelMentions(sub,guildId);
                if (children !== sub) result = Object.assign({},result,{content:children});
            }
            if (result !== node) { if (!next) next = content.slice(); next[i] = result; }
        }
        return next || content;
    }
    function pastelMessage(message, source) {
        if (!message || !message.authorId) return message;
        if (message.guildId && (!guildMembers || !guildMembers.getMember(message.guildId,message.authorId)) && !(source && source.webhookId)) return message;
        let seed;
        if (source && source.webhookId) seed = message.username || source.webhookId;
        else if (!(source && source.colorString != null ? source.colorString : message.roleColor) || settings.pastelAll) seed = message.authorId;
        const color = seed && pastelColor(seed,0.75,0.6);
        const content = pastelMentions(message.content,message.guildId);
        // If neither the author's name color nor any mention changed and shouldShowRoleOnName is already true,
        // return the original message without cloning it on every scroll frame.
        if (!color && content === message.content && message.shouldShowRoleOnName === true) return message;
        // One copy of the row's message, with every change set directly on it instead of building an intermediate object.
        const copy = Object.assign({},message);
        copy.shouldShowRoleOnName = true;
        if (color) {
            copy.roleColor = color.value;
            copy.usernameColor = color.value;
            copy.colorString = color.value;
            // Native MessageView applies Message.textColor via TextView.setTextColor (350.8 bridge field).
            // Never wrap content in a link node: that made the text blue, tappable and show "usernameOnClick".
            if (settings.pastelContent) {
                const text = pastelColor(seed,0.85,0.75);
                if (text) copy.textColor = text.value;
            }
        }
        if (content !== message.content) copy.content = content;
        return copy;
    }
    // The replied-to message above a reply. Discord's reply preview never read textColor, so "Color message text"
    // didn't reach replies (#45); the Pastelize patch now has it paint the reply text with it. Discord gives every
    // message a textColor, so the reply's own is dropped unless Pastelize colored it: otherwise the preview keeps
    // Discord's usual reply color, exactly as before, also while Pastelize is switched off.
    function pastelReply(reply) {
        const shown = enabled("pastelize") ? pastelMessage(reply,null) : reply;
        if (enabled("pastelContent") && shown !== reply && shown.textColor != null && shown.textColor !== reply.textColor) return shown;
        if (shown.textColor == null) return shown;
        const plain = Object.assign({},shown);
        delete plain.textColor;
        return plain;
    }
    // Read All: a ReadAllNotificationsButton port for the mobile server bar (GuildsBar 16745,
    // useGuildsBarProps 16754). The button lives in the SEPARATOR row, below the DM button and
    // unread DMs and above the line, so the native FastList's sections, anchors and recycler
    // keys stay stock. Only that row's height grows, through the list's own itemSize.
    const READ_ALL_HEIGHT = 36;
    const readAllViews = new WeakMap(), readAllData = new WeakMap();
    const readAllCache = {api:null};
    // ReadStateActionCreators (6800) exports ack/bulkAck by name, with no default object.
    function readActionsExport() {
        if (typeof global.__r !== "function") return null;
        try { const m=global.__r(6800); return m && typeof m.bulkAck==="function" ? m : m && m.default; } catch (_) { return null; }
    }
    function readAllExports() {
        const c=readAllCache.api;
        if (c && c.sorted && c.guildStore && c.lurking && c.guildReads && c.markGuilds && c.privateReads && c.privateSort && c.requestUtils && c.reads && c.readActions && c.renderSections) return c;
        const x=(id,key) => inspectedExport(id,key);
        const api={sorted:x(5963,"default"), guildStore:x(2087,"default"), lurking:x(4751,"default"),
            guildReads:x(6078,"default"), markGuilds:x(14193,"default"), sections:x(1085,"AnalyticsSections"),
            privateReads:x(14048,"default"), privateSort:x(6923,"default"), requestUtils:x(6076,"filterOutMessageRequestsAndSpamById"),
            reads:x(6035,"default"), readActions:readActionsExport(), readTypes:x(5967,"ReadStateTypes"),
            renderSections:x(16744,"FastListRenderSections")};
        if (api.sorted && api.guildStore && api.lurking && api.guildReads && api.markGuilds && api.privateReads && api.privateSort && api.requestUtils && api.reads && api.readActions && api.renderSections) readAllCache.api=api;
        return api;
    }
    function unreadGuildIds(api) {
        if (!api.guildReads) return [];
        const candidates=[], seen=new Set();
        const add=list => {
            if (!list) return;
            for (const id of list) if (typeof id==="string" && !seen.has(id)) { seen.add(id); candidates.push(id); }
        };
        if (api.sorted && typeof api.sorted.getFlattenedGuildIds==="function") try { add(api.sorted.getFlattenedGuildIds()); } catch (_) {}
        if (api.lurking && typeof api.lurking.lurkingGuildIds==="function") try { add(api.lurking.lurkingGuildIds()); } catch (_) {}
        if (api.guildStore && typeof api.guildStore.getGuildIds==="function") try { add(api.guildStore.getGuildIds()); } catch (_) {}
        if (!candidates.length && typeof api.guildReads.getMutableUnreadGuilds==="function") try { add(api.guildReads.getMutableUnreadGuilds()); } catch (_) {}
        const eventType=api.readTypes && api.readTypes.GUILD_EVENT != null ? api.readTypes.GUILD_EVENT : 1;
        const checkEvent=api.reads && typeof api.reads.hasUnread==="function";
        return candidates.filter(id => api.guildReads.hasUnread(id) || api.guildReads.getMentionCount(id) > 0 ||
            (checkEvent && api.reads.hasUnread(id, eventType)));
    }
    function unreadDmIds(api) {
        const candidates=[], seen=new Set();
        const add=list => {
            if (!list) return;
            for (const id of list) if (typeof id==="string" && !seen.has(id)) { seen.add(id); candidates.push(id); }
        };
        if (api.privateReads && typeof api.privateReads.getUnreadPrivateChannelIds==="function") try { add(api.privateReads.getUnreadPrivateChannelIds()); } catch (_) {}
        // PrivateChannelReadStateStore (14048) truncates getUnreadPrivateChannelIds() to 20 items (`r7.length = 20`);
        // PrivateChannelSortStore (6923) holds the full list of non-request DMs when >20 DMs have unreads or mentions.
        if (api.privateSort && typeof api.privateSort.getPrivateChannelIds==="function") try { add(api.privateSort.getPrivateChannelIds()); } catch (_) {}
        const checkUnread=api.reads && (typeof api.reads.hasUnreadOrMentions==="function" || typeof api.reads.getMentionCount==="function");
        const unread=checkUnread ? candidates.filter(id => typeof api.reads.hasUnreadOrMentions==="function"
            ? api.reads.hasUnreadOrMentions(id) : api.reads.getMentionCount(id) > 0) : candidates;
        if (typeof api.requestUtils==="function") try { return api.requestUtils(unread); } catch (_) {}
        return unread;
    }
    // Same native paths as Discord: the server menu's markGuildsAsRead (14193) with the
    // GUILD_LIST source, and a single BULK_ACK for DMs at each channel's last message.
    function readAll(mode) {
        if (!enabled("readAll") || !READ_ALL_MODES.includes(mode)) return;
        const api=readAllExports(), ui=reviewUI();
        let guilds=0, dms=0;
        // Unread servers or DMs with no way to clear them used to say "Nothing unread".
        const unavailable=() => { throw new Error(tr("Discord's read states haven't loaded yet. Try again in a moment.")); };
        try {
            if (mode!=="dms") {
                if (!api.guildReads || !(api.sorted || api.guildStore)) unavailable();
                const ids=unreadGuildIds(api);
                if (ids.length && typeof api.markGuilds!=="function") unavailable();
                if (ids.length) { api.markGuilds(ids, api.sections && api.sections.GUILD_LIST); guilds=ids.length; }
            }
            if (mode!=="guilds") {
                if (!api.privateReads && !api.privateSort) unavailable();
                const ids=unreadDmIds(api);
                if (ids.length && !(api.readActions && typeof api.readActions.bulkAck==="function" && api.reads)) unavailable();
                if (ids.length) {
                    const type=api.readTypes && api.readTypes.CHANNEL != null ? api.readTypes.CHANNEL : 0;
                    // A DM without a known last message can't be acknowledged; sending it anyway
                    // made the whole request fail. Discord's own /read-states/ack-bulk takes 100 at a time.
                    const acks=[];
                    for (let i=0;i<ids.length;i++) {
                        const channelId=ids[i], messageId=api.reads.lastMessageId(channelId);
                        if (messageId) acks.push({channelId, readStateType:type, messageId});
                    }
                    for (let i=0;i<acks.length;i+=100) api.readActions.bulkAck(acks.slice(i,i+100));
                    dms=acks.length;
                }
            }
        } catch (error) {
            // What was already cleared stays cleared; say so instead of only the error.
            const done=guilds ? " ("+pl(guilds,"{n} server was marked as read","{n} servers were marked as read")+")" : "";
            reviewToast(ui,tr("Couldn't mark as read: {problem}",{problem:String(error && error.message || error)})+done,venusIcon(6296,"CircleXIcon")); return;
        }
        if (guilds || dms) readAllDone();
        const parts=[];
        if (guilds) parts.push(pl(guilds,"{n} server","{n} servers"));
        if (dms) parts.push(pl(dms,"{n} DM","{n} DMs"));
        reviewToast(ui, parts.length ? tr("Marked {what} as read",{what:joinAnd(parts)}) : "Nothing unread",venusIcon(15928,"DoubleCheckmarkIcon"));
    }
    // Holding the button: Discord's own action sheet with the three one-time choices.
    function readAllChooser() {
        const ui=reviewUI();
        const options=[["guilds",tr("Mark servers as read")],["dms",tr("Mark DMs as read")],["both",tr("Mark servers and DMs as read")]]
            .map(([mode,label]) => ({label, onPress:() => readAll(mode)}));
        if (typeof ui.simpleSheet==="function") try { ui.simpleSheet({key:"VenusReadAll",header:{title:tr("Read all")},options}); return; } catch (_) {}
        if (RN && RN.Alert) RN.Alert.alert(tr("Read all"),undefined,options.map(option => ({text:option.label,onPress:option.onPress})).concat([{text:tr("Cancel"),style:"cancel"}]));
    }
    let readAllStyleHook, readAllStylesTried=false;
    const READ_ALL_WRAP_STYLE = {width:"100%"}, READ_ALL_OUTER_STYLE = {height:READ_ALL_HEIGHT,alignItems:"center",justifyContent:"center"};
    const READ_ALL_PILL_BASE = {height:26,minWidth:48,paddingHorizontal:8,borderRadius:13,alignItems:"center",justifyContent:"center"};
    const READ_ALL_PRESSED_SCALE = {transform:[{scale:0.96}]}, READ_ALL_TEXT_BASE = {fontSize:11,fontWeight:"700",includeFontPadding:false};
    const READ_ALL_FALLBACK_STYLES = {pill:{backgroundColor:"#4e505899"},pressed:{backgroundColor:"#4e5058"},text:{color:"#dbdee1"}};
    function readAllPress() { readAll(settings.readAllMode); }
    // For a moment after it clears something, the pill shows a check instead of its label, then goes back.
    let readAllDoneUntil=0, readAllDoneTimer;
    function readAllDone() {
        readAllDoneUntil=Date.now()+1400; notify("readAll");
        if (readAllDoneTimer!==undefined && global.clearTimeout) global.clearTimeout(readAllDoneTimer);
        readAllDoneTimer=later(() => { readAllDoneTimer=undefined; readAllDoneUntil=0; notify("readAll"); },1450,false);
    }
    function ReadAllButton() {
        useSettings("readAll");
        const ui=reviewUI(), done=readAllDoneUntil>Date.now();
        // Discord's semantic tokens, so the pill follows light, dark and custom themes.
        if (!readAllStylesTried) {
            const c=ui.colors;
            if (typeof ui.createStyles==="function" && c) {
                readAllStylesTried=true;
                try {
                    readAllStyleHook=ui.createStyles({pill:{backgroundColor:c.BACKGROUND_MOD_NORMAL},pressed:{backgroundColor:c.BACKGROUND_MOD_STRONG},text:{color:c.TEXT_DEFAULT}});
                } catch (_) { readAllStyleHook=null; }
            }
        }
        let styles=null;
        if (readAllStyleHook) try { styles=readAllStyleHook(); } catch (_) {}
        styles=styles || READ_ALL_FALLBACK_STYLES;
        return el(RN.View,{style:READ_ALL_OUTER_STYLE},
            el(RN.Pressable,{accessibilityRole:"button",accessibilityLabel:tr("Read all"),accessibilityHint:tr("Hold to choose"),
                hitSlop:6,onPress:readAllPress,onLongPress:readAllChooser,delayLongPress:350,
                style:({pressed}) => [READ_ALL_PILL_BASE,styles.pill,
                    pressed ? styles.pressed : null,pressed ? READ_ALL_PRESSED_SCALE : null]},
                done ? popIn("done",el(venusIcon(6823,"CheckmarkSmallIcon"),{size:"xs",color:styles.text && styles.text.color})) :
                    el(RN.Text,{numberOfLines:1,allowFontScaling:false,style:[READ_ALL_TEXT_BASE,styles.text]},tr("Read all"))));
    }
    function readAllBarProps(orig, self, args) {
        const result=orig.apply(self,args);
        if (React) useSettings("readAll");
        const data=result && result.listDataProps;
        if (!enabled("readAll") || !React || !RN || !data || typeof data.itemSize!=="function" || typeof data.renderItem!=="function") return result;
        // The wrapped list data is shared per native listDataProps, but the returned props are per result:
        // keying the whole view on listDataProps handed back an older result's listProps.
        const known=readAllViews.get(result);
        if (known) return known;
        let listDataProps=readAllData.get(data);
        if (!listDataProps) {
            const enums=readAllExports().renderSections, separator=enums && typeof enums.SEPARATOR==="number" ? enums.SEPARATOR : 6;
            const itemSize=data.itemSize, renderItem=data.renderItem;
            listDataProps=Object.assign({},data,{
                itemSize:function (section) { const size=itemSize.apply(this,arguments); return section===separator && enabled("readAll") ? size+READ_ALL_HEIGHT : size; },
                renderItem:function (section) {
                    const node=renderItem.apply(this,arguments);
                    return section===separator && enabled("readAll") ? el(RN.View,{key:"venus-read-all",style:READ_ALL_WRAP_STYLE},el(ReadAllButton,null),node) : node;
                }});
            readAllData.set(data, listDataProps);
        }
        const view=Object.assign({},result,{listDataProps});
        readAllViews.set(result, view);
        return view;
    }
    // Message tap gestures (a port of Geastures+ by kmmiio99o): double-tap replies, or edits your own
    // message; tapping a third time deletes your own message. It takes over Discord's double-tap handler
    // (DoubleTapToReactUtils 7982, which every double-tap reaches), so Discord's own "double-tap to
    // react" setting needs nothing changed. Reply and edit go through the same actions as swiping:
    // replyToMessage (10782) and LongPressMessageActionSheetUtils.handleEdit (9685).
    // The third tap is not a second double-tap. Discord's native tap tracker (NestedScrollOnTouchTracker)
    // starts over once a double-tap fires, so the next touch is reported as a single tap
    // (MessagesHandlers.handleTapMessage, 10694), and only after Android's double-tap timeout (300 ms)
    // passes with no fourth tap. Waiting 260 ms for another double-tap meant the editor always opened
    // first. Edit now waits long enough for that single tap: a quick third tap lands 400-550 ms after
    // the double-tap. A second double-tap (tap four) still counts too.
    const GESTURE_TRIPLE_MS = 650, GESTURE_PAIR_MS = 1500, GESTURE_DELETED_MS = 3000;
    const gesture = {timer:undefined, pending:null, channel:null, chatInputRef:null, pendingAt:0, deleted:null, deletedAt:0, handlers:null,
        replyFn:null, editFn:null, canEditFn:null, canReplyFn:null};
    function gestureCancel() { if (gesture.timer !== undefined && global.clearTimeout) global.clearTimeout(gesture.timer); gesture.timer = undefined; gesture.pending = null; gesture.channel = null; gesture.chatInputRef = null; }
    function gestureOwn(message) {
        const user = userStore && userStore.getCurrentUser();
        return !!(user && message && message.author && message.author.id === user.id);
    }
    function gestureChatInputRef(channel) {
        try {
            const params = gesture.handlers && gesture.handlers.params;
            if (!params || typeof params !== "object") return null;
            if (channel && params.selectedChannelId && String(params.selectedChannelId) !== String(channel.id)) return null;
            return params.chatInputRef || null;
        } catch (_) { return null; }
    }
    // Tactile feedback through Discord's own haptics (HapticUtils 5057 / HapticFeedbackTypes 5058). Switches already buzz on their
    // own (Discord's FormSwitch does it); this covers the controls that don't: tap gestures (IMPACT_LIGHT), Venus's segmented
    // control (IMPACT_MEDIUM, like Discord's own), radio rows and color swatches (SELECTION).
    const haptics = {trigger:null, types:null};
    function haptic(kind) {
        try {
            const trigger = haptics.trigger || (haptics.trigger = inspectedExport(5057, "triggerHapticFeedback"));
            if (typeof trigger !== "function") return;
            const types = haptics.types || (haptics.types = inspectedExport(5058, "default") || inspectedExport(5057, "HapticFeedbackTypes"));
            const type = types && types[kind || "IMPACT_LIGHT"];
            if (type !== undefined) trigger(type);
            else if (!kind || kind === "IMPACT_LIGHT") trigger(0);
        } catch (_) {}
    }
    function gestureHaptic() { haptic("IMPACT_LIGHT"); }
    function gestureCanReply(channel, message) {
        const canReply = gesture.canReplyFn || (gesture.canReplyFn = inspectedExport(7989, "canReplyToMessage"));
        if (typeof canReply !== "function") return true;
        try { return !!canReply(channel, message); } catch (_) { return true; }
    }
    function gestureReply(message, channel, chatInputRef) {
        if (!gestureCanReply(channel, message)) return false;
        const reply = gesture.replyFn || (gesture.replyFn = inspectedExport(10782, "default"));
        if (typeof reply !== "function") return false;
        const ref = chatInputRef !== undefined ? chatInputRef : gestureChatInputRef(channel);
        try { gestureHaptic(); reply({message, channel, chatInputRef:ref, actionSource:"message_swipe", invertible:true}); return true; } catch (_) { return false; }
    }
    function gestureEdit(message, channel, chatInputRef) {
        // Only what Discord itself would let you edit (sent, yours, not a system message); otherwise reply.
        const canEdit = gesture.canEditFn || (gesture.canEditFn = inspectedExport(10783, "default")), user = userStore && userStore.getCurrentUser();
        try { if (typeof canEdit === "function" && !canEdit(message, user && user.id)) return false; } catch (_) { return false; }
        const edit = gesture.editFn || (gesture.editFn = inspectedExport(9685, "handleEdit"));
        if (typeof edit !== "function") return false;
        const ref = chatInputRef !== undefined ? chatInputRef : gestureChatInputRef(channel);
        try { gestureHaptic(); edit(message, channel, ref, "message_swipe", true); return true; } catch (_) { return false; }
    }
    function gestureDelete(message, channel) {
        if (message && message.state && message.state !== "SENT") return false;
        const actions = msgActions || inspectedExport(7174, "default");
        if (!actions || typeof actions.deleteMessage !== "function") return false;
        // Discord's own delete, with QuickDelete and NoDelete still applying to it.
        try { gestureHaptic(); const result = actions.deleteMessage(channel && channel.id || message.channel_id, message.id, false);
            if (result && typeof result.catch === "function") result.catch(() => {}); return true; } catch (_) { return false; }
    }
    function gestureDeletePending(now) {
        const message = gesture.pending, channel = gesture.channel;
        gestureCancel();
        gesture.deleted = message.id; gesture.deletedAt = now;
        gestureDelete(message, channel);
    }
    // A single tap on the message that was just double-tapped is the third tap.
    function gestureTap(event) {
        if (!enabled("gestures") || !settings.gestureTripleDelete || !gesture.pending) return false;
        const data = event && event.nativeEvent, id = data && data.messageId, now = Date.now();
        if (id == null || String(id) !== String(gesture.pending.id) || now - gesture.pendingAt >= GESTURE_PAIR_MS) return false;
        gestureDeletePending(now);
        return true;
    }
    // MessagesHandlers defines handleTapMessage and handleDoubleTapMessage on each instance in its constructor.
    function hookTapHandlers(exports) {
        const Handlers = exports && exports.MessagesHandlers;
        if (typeof Handlers !== "function" || typeof Reflect === "undefined" || typeof Reflect.construct !== "function") return exports;
        function MessagesHandlers() {
            const handlers = Reflect.construct(Handlers, arguments);
            gesture.handlers = handlers;
            const tap = handlers && handlers.handleTapMessage;
            if (typeof tap === "function") handlers.handleTapMessage = function (event) {
                gesture.handlers = handlers;
                try { if (gestureTap(event)) return undefined; } catch (_) {}
                return tap.apply(this, arguments);
            };
            const dbl = handlers && handlers.handleDoubleTapMessage;
            if (typeof dbl === "function") handlers.handleDoubleTapMessage = function () {
                gesture.handlers = handlers;
                return dbl.apply(this, arguments);
            };
            return handlers;
        }
        MessagesHandlers.prototype = Handlers.prototype;
        try { Object.setPrototypeOf(MessagesHandlers, Handlers); } catch (_) {}
        return replaceValue(exports, "MessagesHandlers", MessagesHandlers);
    }
    function gestureAct(message, channel, chatInputRef) {
        if (!message || !channel) return;
        const own = gestureOwn(message);
        if (own && settings.gestureOwn === "edit" && gestureEdit(message, channel, chatInputRef)) return;
        gestureReply(message, channel, chatInputRef);
    }
    function doubleTapMessage(orig, self, args) {
        if (!enabled("gestures")) return orig.apply(self, args);
        const message = args[0], channel = args[1], id = message && message.id;
        if (!id) return orig.apply(self, args);
        const now = Date.now(), ref = gestureChatInputRef(channel);
        // The taps that just deleted a message can land once more before it disappears: ignore them.
        if (gesture.deleted === id && now - gesture.deletedAt < GESTURE_DELETED_MS) { gestureCancel(); return; }
        if (gesture.pending && gesture.pending.id === id && now - gesture.pendingAt < GESTURE_PAIR_MS) {
            if (settings.gestureTripleDelete && gestureOwn(message) && (!message.state || message.state === "SENT")) { gesture.channel = channel; gestureDeletePending(now); return; }
            gestureCancel(); gestureAct(message, channel, ref);
            return;
        }
        gestureCancel();
        // Nothing waits for a third tap when it couldn't delete anything (including unsent messages).
        if (!settings.gestureTripleDelete || !gestureOwn(message) || message.state && message.state !== "SENT") { gestureAct(message, channel, ref); return; }
        gesture.pending = message; gesture.channel = channel; gesture.chatInputRef = ref; gesture.pendingAt = now;
        gesture.timer = later(() => { gesture.timer = undefined; const waiting = gesture.pending, waitingChannel = gesture.channel, waitingRef = gesture.chatInputRef; gesture.pending = null; gesture.channel = null; gesture.chatInputRef = null;
            // Switching gestures off while it waited used to still open the editor (or reply) a moment later.
            if (waiting === message && enabled("gestures")) gestureAct(message, waitingChannel, waitingRef); }, GESTURE_TRIPLE_MS);
    }
    function hideWhenGestures(orig, self, args) {
        if (React) useSettings("gestures");
        return enabled("gestures") ? null : orig.apply(self, args);
    }
    // While on, it plays: Sam asks, you double-tap to reply and say you're in, Sam says it's at 6 AM, you regret it and
    // triple-tap your message away. It follows your choices below.
    function GesturePreview(props) {
        useSettings("gestures");
        const s = useChatPreviewStyles(), k = usePreviewChrome();
        const blank = {mode:null, target:null, gone:false, mine:true, late:false, draft:"", pulse:null};
        const [state, setState] = React.useState(blank);
        const on = props.on, own = settings.gestureOwn === "edit", triple = settings.gestureTripleDelete, watching = on;
        const update = change => setState(st => Object.assign({}, st, typeof change === "function" ? change(st) : change));
        const pulse = who => update(st => ({pulse:{who, id:(st.pulse ? st.pulse.n + 1 : 1) + ":" + who, n:st.pulse ? st.pulse.n + 1 : 1}}));
        // The story, built from your settings: what a double-tap on your own message does, and whether triple-tap deletes.
        const story = useStory(watching, () => {
            const steps = [[0, () => setState(Object.assign({}, blank, {mine:false})), tr("Sam asks if anyone wants to play")],
                [1200, () => pulse("theirs"), tr("You double-tap Sam's message")], [200, () => pulse("theirs")],
                [500, () => { animateLayout(); gestureHaptic(); update({mode:"reply", target:"theirs"}); }, tr("A reply to Sam opens, ready to type")]];
            typeSteps(tr("I'm in!"), text => update({draft:text}), 110).forEach(step => steps.push(step));
            steps.push([600, () => { animateLayout(); update({mode:null, target:null, draft:"", mine:true}); }, tr("You send it")],
                [1200, () => { animateLayout(); update({late:true}); }, tr("Then Sam says it starts at 6 AM")]);
            if (triple) steps.push([1000, () => pulse("mine"), tr("You change your mind and tap your message three times")],
                [220, () => pulse("mine")], [220, () => pulse("mine")],
                [500, () => { animateLayout(); gestureHaptic(); update({mode:"deleted", target:"mine", gone:true}); }, tr("It's deleted at once, with no question")],
                [1500, () => {}]);
            else steps.push([1000, () => pulse("mine"), tr("You double-tap your own message")], [200, () => pulse("mine")],
                [500, () => { animateLayout(); update({mode:own ? "edit" : "reply", target:"mine", draft:own ? tr("I'm in!") : ""}); },
                    tr(own ? "It opens for editing, so you can fix it" : "A reply to your own message opens")], [1500, () => {}]);
            return steps;
        }, [own, triple]);
        const Trash = venusIcon(5049, "TrashIcon"), Spine = {borderColor:k.iconMuted.color};
        const picked = who => state.target === who && state.mode !== "deleted";
        const replyLine = who => who !== "mine" ? null : el(RN.View, {style:{flexDirection:"row", alignItems:"center", paddingHorizontal:12, paddingTop:4, marginBottom:-2}},
            el(RN.View, {style:[{width:28, height:10, marginLeft:19, marginRight:4, marginTop:6, borderLeftWidth:2, borderTopWidth:2, borderTopLeftRadius:6}, Spine]}),
            el(RN.View, {style:{width:16, height:16, borderRadius:8, backgroundColor:"#eb459e", alignItems:"center", justifyContent:"center", marginRight:4}},
                el(RN.Text, {style:{color:"#ffffff", fontSize:9, fontWeight:"700"}}, "S")),
            el(RN.Text, {style:[s.muted, {fontWeight:"600", marginRight:4}], numberOfLines:1}, "Sam"),
            el(RN.Text, {style:[s.muted, {flex:1}], numberOfLines:1}, tr("Anyone up for a game later?")));
        const message = (who, name, color, time, text) => el(RN.View, {key:who},
            el(RN.View, {style:picked(who) ? {backgroundColor:"#5865f21f"} : null},
                picked(who) ? el(RN.View, {style:{position:"absolute", left:0, top:0, bottom:0, width:2, backgroundColor:"#5865f2"}}) : null,
                replyLine(who),
                previewMessage(s, who, name, color, time, el(RN.Text, {style:s.text}, text)), tapRipple(state.pulse, who)));
        const showMine = watching ? state.mine && !state.gone : !state.gone;
        const bar = state.mode === "deleted" ? previewBar(k, s, Trash, tr("Message deleted"), null) :
            state.mode === "edit" ? previewBar(k, s, null, tr("Editing message"), null) :
            state.mode === "reply" ? previewBar(k, s, null, tr("Replying to {name}", {name:state.target === "mine" ? tr("You") : "Sam"}), null, "bar", true) : null;
        return el(RN.View, {key:"preview"},
            previewScreen(s, "chat", "Tap gestures preview", [
                message("theirs", "Sam", "#eb459e", tr("Today at 4:01 PM"), tr("Anyone up for a game later?")),
                showMine ? message("mine", tr("You"), "#5865f2", tr("Today at 4:02 PM"), tr("I'm in!")) : null,
                watching && state.late ? el(RN.View, {key:"late"}, popIn("late", previewMessage(s, "late", "Sam", "#eb459e", tr("Today at 4:03 PM"),
                    el(RN.Text, {style:s.text}, tr("Great, it starts at 6 AM!"))))) : null],
                {header:previewHeader(k, {title:"general"}),
                 footer:el(RN.View, {key:"foot"}, previewInput(k, s, {bar, text:state.draft, placeholder:tr("Message {channel}", {channel:"#general"})}),
                    watching ? storyStrip(k, s, story) : null)}));
    }
    function GestureSettings() {
        useSettings("gestures");
        const ui = reviewUI();
        if (!RN) return null;
        const on = enabled("gestures");
        const groups = [
            on ? null : offCard("status", venusIcon(8956, "ReactionIcon"), "gestures"),
            el(GesturePreview, {key:"preview", on}),
            radioGroup(ui, "own", "Double-tap your own message", "gestureOwn", on, [
                ["edit", "Edit it", "Opens it for editing, when Discord lets you.", rowIcon(9720, "PencilIcon")],
                ["reply", "Reply to it", "Same as someone else's message.", rowIcon(12838, "ArrowAngleLeftUpIcon")]]),
            el(ui.TableRowGroup || RN.View, {key:"triple", title:tr("Triple-tap")},
                switchRow(ui.TableSwitchRow, "gestureTripleDelete", "Triple-tap to delete", "Tap your own message three times to delete it, with no confirmation. Never affects other people's messages.",
                    rowIcon(5049, "TrashIcon"))),
            footnote("note", "Double-tapping no longer adds a reaction. Hold a message to react instead.")];
        return settingsBody(ui, groups);
    }
    // Quest Completer: finds unfinished Quests and completes them in the background, with no screen.
    // Based on the community quest scripts (aamiaa's gist, CompleteDiscordQuest, Questify), rebuilt on
    // 350.8's own modules: QuestStore (7386), fetchCurrentQuests (9167), questUserStatusFromServer (7394)
    // and the HTTP client (1295). Video, Play and Activity tasks are run; stream tasks need a real Go Live.
    const QUEST_VIDEO_TASKS = ["WATCH_VIDEO_ON_MOBILE", "WATCH_VIDEO"], QUEST_ACTIVITY_TASK = "PLAY_ACTIVITY", QUEST_PLAY_TASK = "PLAY_ON_DESKTOP";
    // QuestContent.QUEST_HOME_MOBILE: where Discord's own app says a quest was accepted from.
    const QUEST_HOME_MOBILE = 12;
    // Video progress may run at most ~10 s ahead of the time since accepting; report about every 7 s like the player.
    // Play and Activity heartbeats follow Discord's desktop QuestProgressManager: one a minute, and when less
    // than a minute is left it waits exactly what's left plus one second.
    const QUEST_VIDEO_LEEWAY = 10, QUEST_VIDEO_POLL_MS = 5000, QUEST_HEARTBEAT_MS = 60000, QUEST_HEARTBEAT_TAIL_MS = 1000;
    // QuestVariants.MOBILE_ACTIVITY_QUEST: an Activity Quest that Discord's phone app reports itself.
    const QUEST_MOBILE_ACTIVITY = 36;
    // Discord answers 401 when a phone reports play time, so Play and Activity heartbeats are sent as Discord
    // Stable for Windows: host 1.0.9261, web build 634304, updater metadata 93252, Electron 42.11.10.
    const QUEST_DESKTOP = {version:"1.0.9261", build:634304, native:93252, electron:"42.11.10", chrome:"148.0.7778.280",
        osVersion:"10.0.26100", osSdk:"26100"};
    const QUEST_DESKTOP_UA = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) discord/" +
        QUEST_DESKTOP.version + " Chrome/" + QUEST_DESKTOP.chrome + " Electron/" + QUEST_DESKTOP.electron + " Safari/537.36";
    // Bits desktop's launch signature keeps clear when it detects no client mod (docs.discord.food, Launch Signature).
    const QUEST_SIGNATURE_BITS = [119, 108, 100, 91, 84, 75, 61, 55, 48, 38, 24, 11];
    const QUEST_HEARTBEAT_SESSION_MS = 30 * 60 * 1000;
    const QUEST_REFETCH_MS = 30 * 60 * 1000, QUEST_RETRY_MS = 30 * 60 * 1000, QUEST_REFUSED_MS = 6 * 60 * 60 * 1000, QUEST_OFFLINE_MS = 5 * 60 * 1000;
    // Heartbeats in a row that Discord answers without counting any more time before Quest Completer gives up for now.
    const QUEST_STALLED_BEATS = 5;
    const quest = {store:null, dispatcher:null, generation:0, running:null, enrolling:false, skip:new Map(), enrollBlockedUntil:0,
        scanTimer:undefined, refetchTimer:undefined, user:null, completed:0, last:"", error:"", desktop:null, executables:new Map(),
        videoAt:new Map()};
    function questSleep(ms) { return new Promise(resolve => { later(resolve, ms); }); }
    function questStore() {
        if (quest.store) return quest.store;
        const store = inspectedExport(7386, "default");
        if (!store || typeof store.getQuest !== "function") return null;
        questAttach(store);
        return store;
    }
    function questAttach(store) {
        if (quest.store || !store || typeof store.getQuest !== "function") return;
        quest.store = store;
        if (typeof store.addChangeListener === "function") store.addChangeListener(questsChanged);
    }
    // Store updates arrive in bursts (fetch, enroll, progress). One scan per burst is enough.
    function questsChanged() { if (enabled("quests")) questsSchedule(1500); }
    function questsSchedule(ms) {
        if (quest.scanTimer !== undefined || typeof global.setTimeout !== "function") return;
        quest.scanTimer = global.setTimeout(questsScan, ms);
    }
    // Kept as the English text and its parts, and put in the settings language when shown.
    function questStatus(text, error, vars) {
        const status = {text, vars};
        if (error) quest.error = status; else { quest.last = status; quest.error = ""; }
        notify("quests");
    }
    // Discord's HTTP client (its auth and headers), with this request's own interceptResponse. Discord asks
    // it before its global handler (captcha, MFA, restricted-hours screens), so taking every failed response
    // here means a challenge just fails the request quietly instead of opening a screen.
    function questIntercept(response, retry, cancel) {
        if (!response || response.ok || typeof cancel !== "function") return false;
        const error = new Error("HTTP " + response.status);
        error.status = response.status; error.body = response.body;
        cancel(error);
        return true;
    }
    // desktop: send this request as the Windows desktop app. Only Play and Activity heartbeats (and the game
    // lookup that names their executable) do; enrolling and video progress stay the phone, which Discord accepts.
    function questRequest(url, body, desktop, method, active) {
        const http = inspectedExport(1295, "HTTP"), send = http && http[method || "post"];
        if (typeof send !== "function") return Promise.reject(new Error("Discord's network client isn't ready"));
        const request = {url, interceptResponse:questIntercept};
        if (body !== undefined) request.body = body;
        if (desktop) request.onRequestCreated = questDesktopRequest;
        // Check at the send boundary too: a queued microtask must not send for an account we just left.
        return Promise.resolve().then(() => active && !active() ? null : send.call(http, request));
    }
    function questHex(count) { let hex = ""; for (let i = 0; i < count; i++) hex += Math.floor(Math.random() * 16).toString(16); return hex; }
    function questUuidText(hex) { return hex.slice(0, 8) + "-" + hex.slice(8, 12) + "-" + hex.slice(12, 16) + "-" + hex.slice(16, 20) + "-" + hex.slice(20, 32); }
    // RFC 4122 version 4, like crypto.randomUUID().
    function questUuid() { const hex = questHex(32); return hex.slice(0, 12) + "4" + hex.slice(13, 16) + "89ab"[Math.floor(Math.random() * 4)] + hex.slice(17); }
    // A random UUID with every client-mod bit cleared, the way desktop makes one when it detects no mods.
    function questLaunchSignature() {
        const digits = questUuid().split("").map(c => parseInt(c, 16));
        for (const bit of QUEST_SIGNATURE_BITS) { const i = 31 - Math.floor(bit / 4); digits[i] &= ~(1 << bit % 4); }
        return questUuidText(digits.map(d => d.toString(16)).join(""));
    }
    function questBase64(text) {
        const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", bytes = [];
        for (const c of unescape(encodeURIComponent(text))) bytes.push(c.charCodeAt(0));
        let out = "";
        for (let i = 0; i < bytes.length; i += 3) {
            const n = bytes[i] << 16 | (bytes[i + 1] || 0) << 8 | (bytes[i + 2] || 0);
            out += chars[n >> 18 & 63] + chars[n >> 12 & 63] + (i + 1 < bytes.length ? chars[n >> 6 & 63] : "=") + (i + 2 < bytes.length ? chars[n & 63] : "=");
        }
        return out;
    }
    function questLocale() {
        try {
            const read = inspectedExport(1360, "getSuperProperties"), own = typeof read === "function" ? read() : null;
            const locale = own && own.system_locale;
            if (typeof locale === "string" && /^[A-Za-z]{2,3}(-[A-Za-z0-9]{2,8})*$/.test(locale)) return locale;
        } catch (_) {}
        return "en-US";
    }
    // One desktop launch per Discord launch: its launch id and signature stay the same, and the analytics
    // heartbeat session id rolls over every 30 minutes like desktop's. The locale is the phone's own.
    function questDesktopProperties() {
        const now = Date.now();
        const identity = quest.desktop || (quest.desktop = {launch:questUuidText(questUuid()), signature:questLaunchSignature(),
            locale:questLocale(), session:"", sessionAt:0});
        if (!identity.session || now - identity.sessionAt >= QUEST_HEARTBEAT_SESSION_MS) { identity.session = questUuidText(questUuid()); identity.sessionAt = now; }
        // Same keys, in the same order, as desktop's getSuperProperties.
        const properties = {os:"Windows", browser:"Discord Client", release_channel:"stable", client_version:QUEST_DESKTOP.version,
            os_version:QUEST_DESKTOP.osVersion, os_arch:"x64", app_arch:"x64", system_locale:identity.locale, has_client_mods:false,
            client_launch_id:identity.launch, browser_user_agent:QUEST_DESKTOP_UA, browser_version:QUEST_DESKTOP.electron,
            os_sdk_version:QUEST_DESKTOP.osSdk, client_build_number:QUEST_DESKTOP.build, native_build_number:QUEST_DESKTOP.native,
            client_event_source:null, launch_signature:identity.signature, client_heartbeat_session_id:identity.session,
            client_app_state:"unfocused"};
        try {
            const encode = inspectedExport(1295, "encodeProperties"), encoded = typeof encode === "function" ? encode(properties) : null;
            if (typeof encoded === "string" && encoded) return encoded;
        } catch (_) {}
        return questBase64(JSON.stringify(properties));
    }
    // Discord's HTTP client hands over the request before its prepareRequest adds the phone's X-Super-Properties,
    // so those headers are swapped as they're set. The native User-Agent interceptor leaves this Windows agent
    // alone (see questCompleter in DiscordPatches.kt); every other request still says Discord-Android.
    function questDesktopRequest(request) {
        if (!request || typeof request.set !== "function") return;
        const properties = questDesktopProperties(), set = request.set;
        const value = (name, original) => {
            const key = String(name).toLowerCase();
            return key === "x-super-properties" ? properties : key === "user-agent" ? QUEST_DESKTOP_UA : original;
        };
        request.set = function (name, original) {
            if (name && typeof name === "object") {
                const copy = {};
                for (const key of Object.keys(name)) copy[key] = value(key, name[key]);
                return set.call(this, copy);
            }
            return set.call(this, name, value(name, original));
        };
        request.set("User-Agent", QUEST_DESKTOP_UA);
        request.set("X-Super-Properties", properties);
    }
    // QuestStore exposes these as getters in 350.8; accept a method too.
    function questFlag(store, key) {
        try { const value = store[key]; return typeof value === "function" ? value.call(store) : value; } catch (_) { return undefined; }
    }
    function questDispatch(action) {
        const dispatcher = quest.dispatcher || inspectedExport(584, "default");
        try {
            if (!dispatcher || typeof dispatcher.dispatch !== "function") return false;
            const result = dispatcher.dispatch(action);
            if (result && typeof result.catch === "function") result.catch(() => {});
            return true;
        } catch (_) { return false; }
    }
    function questUserStatus(body) {
        const convert = inspectedExport(7394, "questUserStatusFromServer");
        try { return body && typeof convert === "function" ? convert(body) : null; } catch (_) { return null; }
    }
    function questRetryAfter(error) {
        const body = error && error.body, value = body && (body.retry_after != null ? body.retry_after : body.retryAfter);
        const seconds = Number(value != null ? value : error && error.retryAfter);
        return Number.isFinite(seconds) && seconds > 0 ? Math.min(seconds, 86400) * 1000 : error && error.status === 429 ? 60000 : 0;
    }
    function questTime(value) {
        if (value == null || value === "") return NaN;
        const time = value instanceof Date ? value.getTime() : typeof value === "number" ? value : Date.parse(String(value));
        return Number.isFinite(time) ? time : NaN;
    }
    function questName(item) {
        const messages = item && item.config && item.config.messages;
        return messages && typeof messages.questName === "string" && messages.questName ? messages.questName : "a Quest";
    }
    // The game a Play or Activity task counts time for. Since mid-2026 it lives on the task
    // (taskConfigV2.tasks.<TYPE>.applications[0].id); older quests carry it on config.application.
    function questApplication(item, task) {
        const apps = task && task.applications;
        let id = null;
        if (Array.isArray(apps)) {
            for (let i = 0; i < apps.length; i++) {
                if (apps[i] && apps[i].id) { id = apps[i].id; break; }
            }
        }
        if (!id) id = item && item.config && item.config.application && item.config.application.id;
        if (id == null) return null;
        const str = typeof id === "string" ? id : String(id);
        return /^\d{5,25}$/.test(str) ? str : null;
    }
    // The first task this phone can do, in the order the settings allow.
    function questTask(item) {
        const config = item && item.config, tasks = config && (config.taskConfigV2 || config.taskConfig);
        const all = tasks && tasks.tasks;
        if (!all || typeof all !== "object") return null;
        if (settings.questsVideo) for (let i = 0; i < QUEST_VIDEO_TASKS.length; i++) {
            const type = QUEST_VIDEO_TASKS[i], entry = all[type], target = entry && Number(entry.target);
            if (target > 0) return {type, target, kind:"video"};
        }
        // "Play <game> for 15 minutes": the same heartbeat Discord's desktop app sends while the game runs.
        if (settings.questsPlay) {
            const play = all[QUEST_PLAY_TASK], playTarget = play && Number(play.target);
            if (playTarget > 0) {
                const playApp = questApplication(item, play);
                if (playApp) return {type:QUEST_PLAY_TASK, target:playTarget, kind:"play", applicationId:playApp};
            }
        }
        if (settings.questsActivity) {
            const activity = all[QUEST_ACTIVITY_TASK], target = activity && Number(activity.target);
            if (target > 0) {
                const activityApp = questApplication(item, activity);
                if (activityApp) {
                    const features = config.features, mobile = Array.isArray(features) && features.includes(QUEST_MOBILE_ACTIVITY);
                    return {type:QUEST_ACTIVITY_TASK, target, kind:"activity", applicationId:activityApp, mobile};
                }
            }
        }
        return null;
    }
    function questProgress(item, type) {
        const progress = item && item.userStatus && item.userStatus.progress, value = Number(progress && progress[type] && progress[type].value);
        return Number.isFinite(value) && value > 0 ? value : 0;
    }
    function questOpen(item, now) {
        if (!item || typeof item.id !== "string" || !item.config) return false;
        if (item.userStatus && item.userStatus.completedAt) return false;
        const expires = questTime(item.config.expiresAt);
        return !(expires <= now + 60000) && !((quest.skip.get(item.id) || 0) > now);
    }
    function questsScan() {
        quest.scanTimer = undefined;
        if (!enabled("quests")) return;
        const store = questStore();
        if (!store) return;
        if (questFlag(store, "isQuestAccessSuspended") === true) { if (!quest.error) questStatus("Discord has paused Quests on this account.", true); return; }
        let all;
        try { all = store.quests; } catch (_) { return; }
        if (!all || typeof all.values !== "function") return;
        const now = Date.now(), ready = [], waiting = [], expMap = new Map(), onScreen = isAppActive();
        for (const item of all.values()) {
            if (!item || typeof item.id !== "string" || !item.config) continue;
            if (item.userStatus && item.userStatus.completedAt) continue;
            const expires = questTime(item.config.expiresAt);
            if (expires <= now + 60000 || (quest.skip.get(item.id) || 0) > now) continue;
            const task = questTask(item);
            if (!task) continue;
            expMap.set(item, Number.isFinite(expires) ? expires : Infinity);
            // A video Quest only plays on screen (questVideo), so in the background it must not hold the one running
            // slot: Play and Activity Quests, which desktop reports while unfocused, go ahead of it instead.
            if (item.userStatus && item.userStatus.enrolledAt) { if (onScreen || task.kind !== "video") ready.push(item); }
            else if (settings.questsEnroll) waiting.push(item);
        }
        // Soonest-expiring first, so nothing runs out while another quest is going.
        const soonest = (a, b) => expMap.get(a) - expMap.get(b);
        if (ready.length > 1) ready.sort(soonest);
        if (waiting.length > 1) waiting.sort(soonest);
        const blocked = quest.enrollBlockedUntil > now || questTime(questFlag(store, "questEnrollmentBlockedUntil")) > now;
        // An accept says it came from the Quests screen (QUEST_HOME_MOBILE), which you can only tap with Discord open.
        // Sent from the background it carried client_app_state "background", which no real tap can. Wait for Discord.
        if (waiting.length && !quest.enrolling && !blocked && onScreen) questEnroll(waiting[0]);
        if (!quest.running && ready.length) questRun(ready[0]);
    }
    // Accepting one at a time, a few seconds apart. Includes Discord's own QuestDataUtils (7382) ad decision and
    // sealed metadata fields (matching _enrollInQuest in 9167) so the enrollment body is identical to a manual tap.
    function questEnrollBody(id) {
        const body = {location:QUEST_HOME_MOBILE};
        const data = global.__r && global.__r(7382);
        try {
            const decision = data && typeof data.getAdDecisionData === "function" ? data.getAdDecisionData(id, QUEST_HOME_MOBILE) : null;
            if (decision && typeof decision === "object") Object.assign(body, decision);
        } catch (_) {}
        let meta = null, traffic = null;
        // The optional second argument is a decision ID, not the Quest ID. Like _enrollInQuest, omit it.
        try { if (data && typeof data.getAdMetadataSealed === "function") meta = data.getAdMetadataSealed(QUEST_HOME_MOBILE); } catch (_) {}
        try { if (data && typeof data.getAdTrafficMetadataSealed === "function") traffic = data.getAdTrafficMetadataSealed(QUEST_HOME_MOBILE, id); } catch (_) {}
        body.metadata_sealed = meta != null ? meta : null;
        body.traffic_metadata_sealed = traffic != null ? traffic : null;
        return body;
    }
    function questEnroll(item) {
        const generation = quest.generation, id = item.id;
        quest.enrolling = true;
        backgroundSync();
        questRequest("/quests/" + id + "/enroll", questEnrollBody(id), undefined, undefined,
            () => generation === quest.generation && enabled("quests") && settings.questsEnroll && isAppActive() && !!questTask(item) && questOpen(item, Date.now())).then(response => {
            if (!response || generation !== quest.generation) return;
            const status = questUserStatus(response && response.body);
            if (!status || !questDispatch({type:"QUESTS_ENROLL_SUCCESS", enrolledQuestUserStatus:status})) questsFetch(true);
        }, error => {
            if (generation !== quest.generation) return;
            const wait = questRetryAfter(error);
            if (wait) quest.enrollBlockedUntil = Date.now() + wait;
            // Only a real answer from Discord (refused, captcha) leaves the Quest alone for hours. No connection
            // means Discord never saw the request, so it's tried again sooner.
            const refused = error && Number.isFinite(error.status) && error.status > 0;
            quest.skip.set(id, Date.now() + Math.max(wait, refused ? QUEST_REFUSED_MS : QUEST_OFFLINE_MS));
        }).then(() => {
            if (generation !== quest.generation) return;
            quest.enrolling = false;
            backgroundSync();
            questsSchedule(3000 + Math.floor(Math.random() * 2000));
        });
    }
    function questActive(entry) { return quest.running === entry && entry.generation === quest.generation && enabled("quests"); }
    function questRun(item) {
        const task = questTask(item), entry = {id:item.id, task, generation:quest.generation, name:questName(item)};
        quest.running = entry;
        backgroundSync();
        notify("quests");
        const work = task.kind === "video" ? questVideo(entry, item) : task.kind === "play" ? questPlay(entry) : questActivity(entry);
        work.then(done => {
            if (!done || entry.generation !== quest.generation) return;
            quest.completed++;
            // The store's own update follows; don't pick the same quest again in the meantime.
            quest.skip.set(entry.id, Date.now() + 10 * 60 * 1000);
            questStatus("Completed {name}.", false, {name:entry.name});
        }, error => {
            if (entry.generation !== quest.generation) return;
            const wait = questRetryAfter(error);
            quest.skip.set(entry.id, Date.now() + Math.max(wait, QUEST_RETRY_MS));
            questStatus("Couldn't finish {name}: {problem}", true, {name:entry.name, problem:String(error && error.message || error)});
        }).then(() => {
            if (quest.running === entry) { quest.running = null; backgroundSync(); notify("quests"); }
            if (entry.generation === quest.generation) questsSchedule(2000 + Math.floor(Math.random() * 2000));
        });
    }
    // Mirrors the server's answer into QuestStore, so Discord's own Quest screens stay right.
    // How far the running Quest is, for the progress bar on the Quests page. Only that page listens.
    function questProgressed(entry, value) {
        const n = Number(value);
        if (!Number.isFinite(n) || quest.running !== entry) return;
        entry.progress = Math.max(0, Math.min(entry.task.target, n));
        notify("quests");
    }
    function questVideoStatus(response) {
        const body = response && response.body;
        if (body && body.quest_id) questDispatch({type:"QUESTS_USER_STATUS_UPDATE", user_status:body});
        return !!(body && body.completed_at);
    }
    function questOptimisticProgress(id, taskType, progress) {
        const update = inspectedExport(9167, "updateOptimisticProgress");
        try { if (typeof update === "function") update(id, taskType, progress); } catch (_) {}
    }
    async function questVideo(entry, item) {
        const enrolled = questTime(item.userStatus && item.userStatus.enrolledAt), target = entry.task.target;
        if (!Number.isFinite(enrolled)) throw new Error("no accepted time");
        let done = questProgress(item, entry.task.type), completed = false;
        questProgressed(entry, done);
        // Like VideoQuestPlayer (15417): playback resumes where Discord last saved it and runs at 1x from now, and a
        // report goes out once currentTime passes the last one by 6-8 s, carrying currentTime itself. Time since
        // accepting alone let a Quest accepted long ago report 6-8 s of video every ~1.3 s, about five times 1x.
        // The player only runs while Discord is on screen, and every phone request carries client_app_state, so
        // the clock stops while Discord is in the background: a real video report never says "background".
        // Leaving Discord pauses it and frees the slot for a Play or Activity Quest; it resumes from the last report.
        done = Math.max(done, quest.videoAt.get(entry.id) || 0);
        questProgressed(entry, done);
        let played = 0, tick = Date.now();
        const from = done;
        while (questActive(entry) && done < target) {
            const next = Math.min(target, done + 6 + Math.random() * 2), now = Date.now();
            if (!isAppActive()) { entry.paused = true; return false; }
            played += now - tick;
            tick = now;
            const playing = Math.min((now - enrolled) / 1000 + QUEST_VIDEO_LEEWAY, from + played / 1000);
            if (playing < next) { await questSleep(Math.min(QUEST_VIDEO_POLL_MS, Math.max(250, Math.ceil((next - playing) * 1000)))); continue; }
            const timestamp = Math.min(target, playing);
            questOptimisticProgress(entry.id, entry.task.type, timestamp);
            const response = await questRequest("/quests/" + entry.id + "/video-progress", {timestamp});
            if (!questActive(entry)) return false;
            completed = questVideoStatus(response);
            done = timestamp;
            if (quest.videoAt.size >= 64) quest.videoAt.delete(quest.videoAt.keys().next().value);
            quest.videoAt.set(entry.id, done);
            questProgressed(entry, done);
            if (completed) break;
        }
        if (!questActive(entry)) return false;
        if (!completed) {
            if (!isAppActive()) { entry.paused = true; return false; }
            questOptimisticProgress(entry.id, entry.task.type, target);
            completed = questVideoStatus(await questRequest("/quests/" + entry.id + "/video-progress", {timestamp:target}));
        }
        return completed;
    }
    // The executable_path desktop reports for a running game: the last two parts of its lowercase path, the way
    // its QuestProgressManager trims exePath (973522 Ic). Discord's own list of the game's Windows executables
    // is read once per game, and a test build, launcher or helper is never the one picked.
    function questExecutableName(app) {
        const all = app && Array.isArray(app.executables) ? app.executables : [];
        const rank = name => (/(^|[\/_.-])(test|launcher|crash|helper|setup|update|install|unins)/i.test(name) ? 2 : 0) + (name.includes("/") ? 1 : 0);
        const names = all.filter(e => e && e.os === "win32" && !e.is_launcher && typeof e.name === "string" && /\.exe$/i.test(e.name))
            .map(e => e.name.replace(/^>/, "").replace(/\\/g, "/").toLowerCase()).filter(name => !/(^|\/)\.\.(\/|$)/.test(name));
        names.sort((a, b) => rank(a) - rank(b) || (a < b ? -1 : a > b ? 1 : 0));
        return names[0] || null;
    }
    function questExecutablePath(app, exe) {
        const parts = exe.split("/").filter(Boolean);
        if (parts.length >= 2) return parts.slice(-2).join("/");
        const folder = String(app && app.name || "").toLowerCase().replace(/[<>:"\/\\|?*]/g, "").trim();
        return folder ? folder + "/" + parts[0] : null;
    }
    async function questExecutable(applicationId) {
        if (quest.executables.has(applicationId)) return quest.executables.get(applicationId);
        let path = null;
        try {
            const response = await questRequest("/applications/public?application_ids=" + applicationId, undefined, true, "get");
            const list = response && response.body, app = Array.isArray(list) ? list.find(a => a && String(a.id) === applicationId) : null;
            const exe = questExecutableName(app);
            if (exe) path = questExecutablePath(app, exe);
            // Only Discord's answer is remembered. A dropped connection used to leave the game unnamed until Discord restarted.
            if (quest.executables.size >= 64) quest.executables.delete(quest.executables.keys().next().value);
            quest.executables.set(applicationId, path);
        } catch (_) {}
        // Unknown is fine: desktop sends no path for a game it can't place either.
        return path;
    }
    // Same body as Discord's own sendHeartbeat (9167): application_id names the game or Activity, and a game
    // also says which executable is running. Play and Activity heartbeats go out as Discord for Windows.
    function questHeartbeatItem(entry) {
        if (!questActive(entry)) return null;
        try {
            const store = questStore();
            if (!store || questFlag(store, "isQuestAccessSuspended") === true) return null;
            const item = store.getQuest(entry.id);
            if (!item || !item.userStatus || !item.userStatus.enrolledAt || questTime(item.config && item.config.expiresAt) <= Date.now()) return null;
            return item;
        } catch (_) { return null; }
    }
    async function questHeartbeat(entry, desktop) {
        const body = {application_id:entry.task.applicationId, terminal:false};
        if (entry.executablePath) body.executable_path = entry.executablePath;
        const response = await questRequest("/quests/" + entry.id + "/heartbeat", body, desktop, undefined, () => {
            const item = questHeartbeatItem(entry);
            return !!(item && !item.userStatus.completedAt);
        });
        // The HTTP response can arrive after stopping or switching accounts. Never write the old account's
        // status into Discord's current QuestStore (questBeat's check after this call was too late).
        if (!questActive(entry)) return {value:0, completed:false};
        const reply = response && response.body, status = questUserStatus(reply), type = entry.task.type;
        if (status) questDispatch({type:"QUESTS_SEND_HEARTBEAT_SUCCESS", questId:entry.id, userStatus:status});
        const value = Number(reply && reply.progress && reply.progress[type] && reply.progress[type].value);
        return {value:Number.isFinite(value) ? value : 0, completed:!!(reply && reply.completed_at)};
    }
    // Desktop's pace: a beat right away, then one a minute. With under a minute left it waits what's left plus a
    // second, and stops once Discord says the Quest is done. A finished Quest gets no terminal beat on desktop.
    async function questBeat(entry, desktop) {
        const target = entry.task.target;
        let best = -1, stalled = 0;
        while (questActive(entry)) {
            // Eligibility can change while sleeping: Discord's own manager rechecks it before every beat.
            const item = questHeartbeatItem(entry);
            if (!item) return false;
            if (item.userStatus.completedAt) return true;
            const beat = await questHeartbeat(entry, desktop);
            if (!questActive(entry)) return false;
            questProgressed(entry, beat.value);
            // Reaching the time target is not completion: Discord can confirm completed_at on a later beat.
            // Stopping here used to report success locally while the reward was still unavailable.
            if (beat.completed) return true;
            // A Quest Discord stops counting used to get a heartbeat every minute for as long as Discord stayed open.
            if (beat.value > best) { best = beat.value; stalled = 0; }
            else if (++stalled >= QUEST_STALLED_BEATS) throw new Error("Discord stopped counting time");
            // Exactly QuestProgressManager.calculateHeartbeatDurationMs (18718): max(0, left) plus a second when a
            // minute or less is left, so a beat at the target that Discord hasn't confirmed yet is followed one
            // second later, like Discord's own app. A 60 s wait there was a pattern no Discord client sends.
            const left = Math.max(0, (target - beat.value) * 1000);
            await questSleep(left <= QUEST_HEARTBEAT_MS ? left + QUEST_HEARTBEAT_TAIL_MS : QUEST_HEARTBEAT_MS);
        }
        return false;
    }
    // Activity Quests: Discord counts time in the Activity without it being started. A mobile Activity Quest is
    // one the phone app reports itself, so only the others are sent as desktop.
    function questActivity(entry) { return questBeat(entry, !entry.task.mobile); }
    // Play Quests: Discord counts time for the quest's game without it being installed or started.
    async function questPlay(entry) {
        entry.executablePath = await questExecutable(entry.task.applicationId);
        if (!questActive(entry)) return false;
        return questBeat(entry, true);
    }
    // Mobile only loads Quests when you open them; ask for them once in a while, through Discord's own fetch.
    function questsFetch(force) {
        const store = questStore(), fetch = inspectedExport(9167, "fetchCurrentQuests");
        if (!store || typeof fetch !== "function") return;
        try {
            if (questFlag(store, "isFetchingCurrentQuests") === true) return;
            const last = questTime(questFlag(store, "lastFetchedCurrentQuests")) || 0;
            if (!force && last && Date.now() - last < QUEST_REFETCH_MS) return;
            const result = fetch();
            if (result && typeof result.catch === "function") result.catch(() => {});
        } catch (_) {}
    }
    function questsRefetchLoop() {
        quest.refetchTimer = undefined;
        if (!enabled("quests") || typeof global.setTimeout !== "function") return;
        questsFetch(false); questsSchedule(1000);
        quest.refetchTimer = global.setTimeout(questsRefetchLoop, QUEST_REFETCH_MS);
    }
    function questsStart(delay) {
        if (!enabled("quests") || typeof global.setTimeout !== "function") return;
        if (quest.refetchTimer !== undefined && global.clearTimeout) global.clearTimeout(quest.refetchTimer);
        quest.refetchTimer = global.setTimeout(questsRefetchLoop, delay);
    }
    // Stops everything in flight: switching it off, logging out, or another account signing in.
    function questsStop() {
        quest.generation++;
        quest.running = null; quest.enrolling = false; quest.enrollBlockedUntil = 0; quest.skip.clear();
        if (global.clearTimeout) {
            if (quest.scanTimer !== undefined) global.clearTimeout(quest.scanTimer);
            if (quest.refetchTimer !== undefined) global.clearTimeout(quest.refetchTimer);
        }
        quest.scanTimer = undefined; quest.refetchTimer = undefined;
        backgroundSync();
    }
    function questsReset() { questsStop(); quest.videoAt.clear(); quest.completed = 0; quest.last = ""; quest.error = ""; notify("quests"); }
    function questsConnected(event) {
        const id = event && event.user && event.user.id;
        if (id && quest.user && id !== quest.user) questsReset();
        if (id) quest.user = id;
        // A reconnect keeps the quest that's running; a first connect waits for Discord to settle.
        questsStart(8000);
    }
    function questsInit(dispatcher) {
        if (quest.dispatcher || !dispatcher || typeof dispatcher.subscribe !== "function") return;
        quest.dispatcher = dispatcher;
        dispatcher.subscribe("CONNECTION_OPEN", questsConnected);
        dispatcher.subscribe("LOGOUT", () => { questsReset(); quest.user = null; });
        // AppStateStore (1999): coming back to Discord lets a waiting accept or a paused video go on.
        dispatcher.subscribe("APP_STATE_UPDATE", event => {
            if (event && event.state === "active" && quest.user && enabled("quests")) questsSchedule(2000 + Math.floor(Math.random() * 3000));
        });
    }
    // Discord can connect before the saved settings finish loading. Quest Completer was still off at that
    // moment, so it never started until the next reconnect. Start it now if Discord is already connected.
    function questsLoaded() {
        if (quest.user && quest.refetchTimer === undefined && !quest.running) questsStart(8000);
    }
    function questsSettingChanged(key, value) {
        if (key === "quests" && !value) { questsStop(); return; }
        if (!enabled("quests")) return;
        if (key === "quests") { questsStart(1000); return; }
        // Turning a quest type off stops that kind if it's the one running.
        const running = quest.running && quest.running.task;
        if (!value && running && (key === "questsVideo" && running.kind === "video" || key === "questsActivity" && running.kind === "activity" ||
            key === "questsPlay" && running.kind === "play")) {
            quest.generation++; quest.running = null; quest.enrolling = false;
            if (quest.scanTimer !== undefined && global.clearTimeout) global.clearTimeout(quest.scanTimer);
            quest.scanTimer = undefined;
            backgroundSync();
        }
        questsSchedule(1000);
    }
    function questStatusText() {
        if (!enabled("quests")) return "Turned off. Switch it on in Features to start.";
        // The card's title already says what's happening, so the first line adds to it instead of repeating it.
        const lines = [];
        if (quest.running) {
            const share = questShare(), left = share != null ? Math.ceil((quest.running.task.target - quest.running.progress) / 60) : 0;
            lines.push(tr("Now: {name}.", {name:quest.running.name}) + (share != null && left > 0 ? " " + pl(left, "About {n} minute left.", "About {n} minutes left.") : ""));
        } else if (!questTypesOn()) lines.push(tr("Turn on at least one Quest type below."));
        else if (!quest.completed) lines.push(tr(settings.questsEnroll ? "Starts the next Quest by itself as soon as one is available." : "Starts as soon as you accept a Quest."));
        if (quest.completed) lines.push(pl(quest.completed, "Completed {n} Quest since Discord opened.", "Completed {n} Quests since Discord opened."));
        if (quest.last) lines.push(tr("Last: {name}", {name:tr(quest.last.text, quest.last.vars)}));
        if (quest.error) lines.push(tr(quest.error.text, quest.error.vars));
        return lines.join("\n");
    }
    // The running Quest's progress, 0 to 1, or null before its first report.
    function questShare() {
        const entry = quest.running, target = entry && entry.task && entry.task.target;
        return entry && target > 0 && typeof entry.progress === "number" ? entry.progress / target : null;
    }
    function questTypesOn() { return !!(settings.questsVideo || settings.questsPlay || settings.questsActivity); }
    function questStatusTitle() {
        if (quest.error) return tr("Something went wrong");
        if (quest.running) return tr("Completing a Quest");
        if (!questTypesOn()) return tr("Nothing to complete");
        return quest.completed ? pl(quest.completed, "{n} Quest done", "{n} Quests done") : tr("Watching for Quests");
    }
    // Settings page: the Quest types, a status card and what to know.
    function QuestSettings() {
        // Every status change (start, finish, error) already notifies "quests"; no 5-second redraw timer.
        useSettings("quests");
        const ui = reviewUI();
        if (!RN) return null;
        const Group = ui.TableRowGroup || RN.View, Switch = ui.TableSwitchRow, on = enabled("quests");
        const toggle = (key, label, subLabel, icon) => switchRow(Switch, key, label, subLabel, icon);
        const groups = [
            on ? statusCard("status", questStatusText(), {title:questStatusTitle(), IconComponent:venusIcon(quest.error ? 12178 : quest.running ? 10764 : 13012,
                quest.error ? "ChatWarningIcon" : quest.running ? "TimerIcon" : "QuestsIcon"),
                footer:questShare() != null ? el(VenusProgress, {key:"progress:" + quest.running.id, value:questShare()}) : null}) : offCard("status", venusIcon(13012, "QuestsIcon"), "quests"),
            el(Group, {key:"types", title:tr("Quests to complete")},
                toggle("questsVideo", "Video Quests", "Reported as watched at normal speed, without playing the video.", rowIcon(10771, "VideoIcon")),
                toggle("questsPlay", "Play Quests", "Play time counts without installing or opening the game.", rowIcon(9207, "GameControllerIcon")),
                toggle("questsActivity", "Activity Quests", "Activity time counts without starting the Activity.", rowIcon(12605, "MagicWandIcon"))),
            el(Group, {key:"enroll", title:tr("New Quests")},
                toggle("questsEnroll", "Accept new Quests", "Accepts Quests you haven't started, one at a time. Off: only Quests you accept yourself.", rowIcon(6868, "CircleCheckIcon"))),
            footnote("note", "You still claim rewards yourself. Stream Quests need a real stream, so they're skipped. Discord may pause Quests on accounts that complete them automatically.")];
        return settingsBody(ui, groups);
    }
    // Badge Completer (#81): Game Time (hours played), Game Variety (unique games played) and Account Age (years active).
    // Discord counts Game Time and Game Variety only from what its desktop app reports about detected games, so this
    // plays one real, detectable game at a time the way Discord for Windows does when it sees the game running:
    // - the running game goes into RunningGameStore's RUNNING_GAMES_CHANGE and LocalActivityStore (10649), so your
    //   profile shows the real game with its own art (the application ID is Discord's, from the detectable list);
    // - the analytics Discord's badge progress is built from: launch_game when it starts, and running_game_heartbeat
    //   (initial, every 5 minutes like desktop's RunningGameHeartbeatManager, and a final one when it stops), sent to
    //   /science with your analytics token and desktop's super properties;
    // - POST /activities (ActivityTrackingStore 14038 -> 10668) with desktop's exact body, which adds the play time to
    //   your game stats. Play time is only counted while "Use data to personalize my Discord experience" is on.
    // Account Age only depends on when the account was made, so there's nothing to report for it; it's shown as progress.
    const BADGE_HEARTBEAT_MS = 5 * 60 * 1000, BADGE_ACTIVITY_MS = 30 * 60 * 1000, BADGE_MAX_DURATION_MS = 35 * 60 * 1000;
    const BADGE_PID = 9480, BADGES_MAX_PLAYED = 2000, BADGE_CATALOG_TTL_MS = 12 * 3600 * 1000;
    // Discord's top tiers: 100 unique games and 5,000 hours. Add hours now sends at most BADGE_GRANT_MAX hours a day.
    const BADGE_VARIETY_TOP = 100, BADGE_TIME_TOP = 5000, BADGE_GRANT_MAX = 500, BADGE_GRANT_BATCH = 8, BADGE_GRANT_COOLDOWN_MS = 24 * 3600 * 1000;
    // Verified detectable PC games from Discord's own list (/games/detectable): application ID, name, the Windows
    // executable desktop reports (last two parts, lowercase), the store it comes from and Discord's icon hash. Used
    // until the full list loads, and if it can't.
    const BADGE_FALLBACK_GAMES = [
        ["1402418491272986635","Minecraft","content/minecraft.exe","microsoft","166fbad351ecdd02d11a3b464748f66b"],
        ["1158877933042143272","Counter-Strike 2","win64/cs2.exe","steam","558f5a26ecb3b17c3dea3d15c1df537a"],
        ["1402418696126992445","League of Legends","lolth/lolex.exe","epic","7c99428541032ac02ec6981d88b78fb7"],
        ["700136079562375258","VALORANT","win64/valorant-win64-shipping.exe","epic","11f81959f4fdd76ca6c39c59eac256c1"],
        ["363445589247131668","ROBLOX","roblox.exe","","f2b60e350a2097289b3b0b877495e55f"],
        ["1402418703554842694","Fortnite","fortniteclient-win64-shipping.exe","epic","c1864b38910c209afd5bf6423b672022"],
        ["542075586886107149","Apex Legends","apex legends/r5apex.exe","steam","91fac0600c5b6527c1aea95a93c6a8e0"],
        ["1402418344912752671","Terraria","terraria/terraria.exe","steam","4c3c185abc0dfb4cb1ec5612de4d7366"],
        ["359509387670192128","Stardew Valley","stardew valley/stardew valley.exe","steam","1e84012079d438b46bbb3c3bf2a409bb"],
        ["1402418436809953330","ELDEN RING","game/eldenring.exe","steam","28c674e1de18e7a100a44559d64a55b8"],
        ["356875988589740042","Dota 2","dota2.exe","steam","6b4b3fa4c83555d3008de69d33a60588"],
        ["356877880938070016","Rocket League","rocketleague.exe","steam","a74899a5190c48a3e6ce9f8d2eaff348"],
        ["356875221078245376","Overwatch","overwatch.exe","battlenet","a60bb76ba4d4acafbd4cb9aad6e61739"],
        ["1402418594532298837","Rust","rust/rustclient.exe","steam","9ab7e18473429b016307b867e6c924a4"],
        ["356879032584896512","Garry's Mod","bin/gmad.exe","steam","ade1008d735a1a134693b15ce02d79a8"],
        ["356888577310851072","Team Fortress 2","hl2.exe","steam","f903d1168b9f975761f53b91e1a20b26"],
        ["1402418586244612216","Warframe","warframe.exe","steam","c78e17a5f91ac21d0c807b0c5f7d00a7"],
        ["356954277803065354","Left 4 Dead 2","bin/l4d2_workshop_manager.exe","steam","0a542ebb0544c5427f24deb3c67fcc99"],
        ["363431029484027904","Hollow Knight","hollow_knight.exe","steam","b7f2b032a4f5f84e9520dff2f3fe27bb"],
        ["1402418342127472751","Hades","hades.exe","epic","88f408a5a858b71d27091722deedb256"],
        ["1402416901551816837","Celeste","celeste.exe","steam","59b1eb2e473f6ab7a68d3f593565b190"],
        ["787443973538971748","Cyberpunk 2077","x64/cyberpunk2077.exe","epic","023b9ec72cd60e31e25bca878c77984a"],
        ["356888453796986880","Path of Exile","path of exile taiwan/pathofexile.exe","epic","1f162572c3123655e42c615b18074ff3"],
        ["357607133254254632","Dead by Daylight","deadbydaylight-egs-shipping.exe","epic","10e00dd3d2a7677eed99edb506d21c15"],
        ["358422126602223616","Factorio","factorio.exe","steam","7624a1d91d9828ed2f2dc3510bbe09e6"],
        ["1402418337052622949","Subnautica","subnautica.exe","epic","a6af0d56d783dbb61028759bdcaf3886"],
        ["363413465584500737","RimWorld","rimworld914win.exe","epic","861d3eae85e0c0536588aeef94d9d5b8"],
        ["1402418440685486130","Among Us","among us - copy/among us.exe","epic","e6cf30ebdaf6e657f636f391b29f06f8"],
        ["1402418103702524046","Phasmophobia","phasmophobia/phasmophobia.exe","steam","5264f0edf1f23be2f7e85b213e24a60e"],
        ["1167674267748540516","Lethal Company","lethal company/lethal company.exe","steam","4f1ee29121b9a0f4dfcc4ce6bb9bd5af"],
        ["1124358970618953818","Valheim","valheim/valheim.exe","steam","93ac3b8489a031b721995a99102c73f1"],
        ["1197827812623650866","Palworld","win64/palworld-win64-shipping.exe","steam","f2039761488809de552d44ebc6739ffe"],
        ["428054228511227914","Deep Rock Galactic","fsd-win64-shipping.exe","steam","f2eb28103bedcfe67bb4d2da6ff663b9"],
        ["1402418087793528862","Risk of Rain 2","risk of rain 2/risk of rain 2.exe","epic","b838c4c744b9cb9f8dd4c8afb82b085f"],
        ["363409849859571722","UNDERTALE","undertale.exe","steam","99ec17659fe44ba31ab007b85fd2454c"],
        ["359508941782122496","Portal 2","portal2.exe","steam","80c416fd6e0d3104e5eab72f9077d72d"],
        ["1402416959819350078","Satisfactory","win64/factorygame-win64-shipping.exe","epic","7d9c387b1cb5fb7d7efd6d6e4243924c"],
        ["443159611479031808","No Man's Sky","nms.exe","steam","a13ad44b102c5bb9ec91a72ec9c93099"],
        ["1402418082366095493","Sea of Thieves","content/seaofthieves.exe","","1a71e40399e3d8b311b9455dd8ca28d9"],
        ["372438022647578634","Destiny 2","destiny2.exe","epic","876323877dd2f3e3fdfc1637a30eb356"],
        ["1402418648332898466","Red Dead Redemption 2","red dead redemption 2/rdr2.exe","steam","86479a5f873535f5b432c738a0bb400c"],
        ["359509759642042378","Fallout 4","fallout4.exe","steam","6c903026d4fc97559ba48ecf9cc4dc04"],
        ["359510249486417920","The Witcher 3: Wild Hunt","witcher3.exe","steam","e62d3b1c9f547792347121cac397fd9c"],
        ["1402418075726254102","Euro Truck Simulator 2","win_x64/eurotrucks2.exe","steam","46bfdfc58e4eacbfde29b2461e118e78"],
        ["356875762940379136","World of Warcraft","_beta_/wow-64.exe","battlenet","fc92f820c44e72085dc6205e5e746850"],
        ["356875890958925834","Hearthstone","hearthstone.exe","battlenet","584d496943e719a759906563442d2a87"],
        ["762434991303950386","Genshin Impact","genshinimpact.exe","epic","0a7cc00267310bf4afdd78b175a7aeea"],
        ["1314395942253756416","Marvel Rivals","win64/marvel-win64-shipping.exe","epic","2dd7882b887306ab5afad03452869ad8"],
        ["406637848297472017","Escape from Tarkov","escapefromtarkov.exe","steam","5157d17951501b45c4bbca41571a19fe"],
        ["385538724592746496","DayZ","dayz/dayzuninstaller.exe","steam","cff0c274f3a4cf2c1280dab58268ce9d"],
        ["359508004078616586","Don't Starve Together","bin/dontstarve.exe","steam","b509a5d03676eace70e0a91a8a4dca89"],
        ["426526722322726912","Project Zomboid","projectzomboid32.exe","steam","834930e051a22db2e9f565f92cf0ce1f"],
        ["1402418606364688549","Slay the Spire","slaythespire.exe","steam","5c9cdfe6a46f49ee5f2a3c134d62902b"],
        ["1334673895453884566","Vampire Survivors","content/vampiresurvivors.exe","steam","abd37dfb36efe6534260d1eb454291e6"],
        ["1402418233633669170","Dead Cells","deadcells.exe","steam","409bdf22e789337764b144046d887bbb"],
        ["363430002181668864","Cuphead","cuphead.exe","steam","e473174ecd2bf29d56541591ed2d8c31"],
        ["1080277149623271444","Hogwarts Legacy","win64/hogwartslegacy.exe","epic","f7e821321b9601fd3594d88fb8dd91c9"],
        ["356944273133928458","Brawlhalla","brawlhalla/brawlhalla.exe","epic","635721ef4940b790623761863e13afb0"],
        ["1402416946796036258","Halo Infinite","game/haloinfinite.exe","steam","9067fddddf79467cf39b659ae34b73cb"],
        ["363411468441354240","Titanfall 2","titanfall2.exe","steam","a2b5108bc074543b2f76d1def74e5399"],
        ["421150698168909834","Borderlands 2","borderlands2.exe","epic","75aafe852575a5c988e346fadec162f0"],
        ["357607478105604096","War Thunder","aces.exe","steam","b23dfa191e3f3aa8142572110a99723f"],
        ["905961880789590076","Forza Horizon 5","forzahorizon5/forzahorizon5.exe","steam","24b4df1622ea714f28adc2f31d7f28ff"],
        ["363413743335374859","BeamNG.drive","beamng.drive.exe","epic","7cdf03d0914abf557c372f81182b4039"],
        ["1124351704880660691","Teardown","teardown/teardown.exe","steam","92f59a749490e51cdf13345c1385f8c3"],
        ["363429406376722442","Kerbal Space Program","ksp.exe","steam","740c9d93b022699c2cf55af48a076734"],
        ["363408909962182683","Stellaris","stellaris.exe","steam","a7b347a29279465267bf10fb0f6b5b1b"],
        ["358421669603311616","Hearts of Iron IV","hearts of iron iv/hoi4.exe","steam","92bb13b24ca75bc279906d80b82e755d"],
        ["876570707306381342","Disco Elysium","disco elysium/disco.exe","steam","30831af3ba88252db9c924de9825c375"],
        ["1161772927566495865","It Takes Two","win64/ittakestwo.exe","epic","8dc5271ca97760e0b2dd39c5e053b85c"],
        ["479169486583496704","Overcooked! 2","overcooked! 2/overcooked2.exe","steam","28fbee56b0c9d001f863772236f9753a"],
        ["1224418065295478955","Content Warning","content warning/content warning.exe","steam","70ba8e85259eb8a64e66cb4cedf27b0b"],
        ["1209665818464358430","Balatro","balatro/balatro.exe","steam","4078e9124dd31d6310ed609289c55a25"],
        ["1199745463918788740","Enshrouded","enshrouded/enshrouded.exe","steam","d22cfd53e493ad403c7276c476285de7"],
        ["1129504121708355634","V Rising","vrising/vrising.exe","steam","4565af6ac3cf99719dc9408fdad4baa8"],
        ["359511228445491200","Guild Wars 2","gw2-64.exe","steam","27b99b7f1ca93180827f6246e506773a"],
        ["1180205756998488064","Old School RuneScape","client/osclient.exe","steam","0cbdb362c84776acbc5116e9e5a93d26"],
        ["1402418239342120960","osu!","osu!.exe","","ea86f6c52576847a7cb81f1c1faa18a3"],
        ["356942674672091136","Geometry Dash","geometry dash/geometrydash.exe","steam","67f35d9429ee338d6f2824163c1b773d"],
        ["398632010442211348","VRChat","vrchat/start_protected_game.exe","steam","5881acfa9405ee69158591ec1a791c74"],
        ["363408834095742976","Tabletop Simulator","tabletop simulator.exe","steam","8f6d26ef7c9aa8de296db5858d85223c"],
        ["1402418571715543120","Bloons TD 6","bloonstd6/bloonstd6.exe","epic","a0a565c547795c027b82f58c4a391c43"],
        ["359509007423242240","The Sims 4","ts4.exe","epic","06273f5ee526b4ee9bd35ec60d707582"],
        ["363430471322828800","Oxygen Not Included","oxygennotincluded.exe","epic","1037d19e54f972bed70089c065ff4664"],
        ["1402418379041804348","Frostpunk","frostpunk.exe","epic","0565b37e6c4cca654543e4b11bc01c89"],
        ["1124351726158352456","Inscryption","inscryption/inscryption.exe","epic","de76a09d6036a197651fa432c21883ef"],
        ["1124351860376096858","Outer Wilds","outer wilds/outerwilds.exe","steam","f37dd58f6155799f3d8c9b38d9c5f90b"],
        ["363427839137153024","Dying Light","dyinglightgame.exe","steam","16ff36b6b1c89bda00f15655ac7e87f9"],
        ["1124352162890264686","Metro Exodus","meenhancededition/metroexodus.exe","steam","1de6a995de00fc964280c1100db7ad7e"],
        ["1402417032258916553","Control","control/control_dx11.exe","steam","6ce4ec16083fc0b2a5c778dece82b3fc"],
        ["1124351719950798848","Noita","noita/noita.exe","steam","9f093e77bc3f4f44aff95122eeec7d11"],
        ["1124352063548174466","Spelunky 2","spelunky 2/spel2.exe","steam","536d32ed2466da37dfcc40f70f674684"],
        ["363413202090065920","Enter the Gungeon","enter the gungeon/etg.exe","epic","18599bc8cb90200d35ab13d1cea8d870"],
        ["1124351730323308675","Cult of the Lamb","cult of the lamb/cult of the lamb.exe","steam","33c7ac43fd84d89ea4a020f33a76541f"],
        ["376180518749995028","Darkest Dungeon","_windows/darkest.exe","steam","5cc0dece8f3a151b90a9feb5b95613fa"],
        ["1402416803866738808","Unturned","unturned/unturned.exe","steam","c868fc1f2cb2fcfaa11631db7125e3e7"],
        ["1124351751164801115","PowerWash Simulator","powerwash simulator/powerwashsimulator.exe","steam","31408f75fa2c8a7858003deda221791a"],
        ["1402416810229497917","Starbound","starbound.exe","steam","3d4cd654db31681e44a5c8fbbb40713f"],
        ["449806905901056012","Raft","raft.exe","steam","aa3b7a0ded0341cfbfd463d349e06add"],
        ["738856512868450314","Grounded","win64/maine-win64-shipping.exe","steam","a4f0d5a22ce60594b13b5c6c8506885b"],
        ["1080279445153263686","Sons of the Forest","sons of the forest/sonsoftheforest.exe","steam","48269894766fd44d9a144f8f7541cce0"],
        ["363409179668512788","The Forest","the forest/theforestvr.exe","steam","d757f03369c68943d76d6252f47a4813"],
        ["363409643973771264","7 Days to Die","7daystodie.exe","steam","bbda03dd7c05264447674d691713b344"],
        ["1124351818437242910","Brotato","brotato/brotato.exe","steam","5049b9e12bad6ff0427800eaadb19bee"],
        ["1276737795012165766","Deadlock","win64/deadlock.exe","steam","08e679bae42c738a66c1b2e0e546ecc0"],
        ["1402418520662479019","Paladins","paladins.exe","epic","6b237187eda7dd2284134ed8315eac92"],
        ["358422012990849024","SMITE","smite.exe","steam","d47e191eb893a1d6377264e11f1e901b"],
        ["742897755160313986","Fall Guys","fallguys_client.exe","epic","87695409002d97fbd5ce7cba1796f2e8"],
        ["385538103831429120","Human: Fall Flat","human.exe","steam","48823134f097206949116832d82dfb28"],
        ["363409129643180032","Gang Beasts","gang beasts.exe","steam","25f58de774770f6d83e64e839cd69a0d"],
        ["1124351985051775036","Dyson Sphere Program","dyson sphere program/dspgame.exe","steam","aeef155a17414fd86a81f2c0940e0a22"],
        ["474081029490081792","Kenshi","kenshi/kenshi_x64.exe","steam","9f159050ec5ee7d5893624645a36298e"],
        ["1163956401874403438","Mount & Blade II: Bannerlord","win64_shipping_client/bannerlord.exe","steam","70ff1999ed550805108084d81553e0f7"],
        ["1124351943247155330","Chivalry 2","win64/chivalry2-win64-shipping.exe","steam","b5815c8c67a8f5a1bc15c37e7cea0e35"],
        ["425438403819995145","For Honor","for honor/forhonor.exe","steam","02e63008d18580c53a2882ae38d71609"],
        ["1124351854831222945","ULTRAKILL","ultrakill/ultrakill.exe","steam","2eeaba2eca9e5c844b5de4334e511da5"],
        ["1129504770533634149","TUNIC","tunic/tunic.exe","epic","959801fcc1a6bc81b2e84496a8662118"],
        ["1124351702972256328","Stray","win64/stray-win64-shipping.exe","epic","6ebd57686f1800d7d77dd9352a6ac910"],
        ["356954111901433856","Cities: Skylines","cities.exe","epic","3b5eed7a9364591c629fcf47bd4a18f7"],
        ["1402418309189603418","Age of Empires II: Definitive Edition","age of empires ii definitive edition/aoe2de_s.exe","steam","18b1d3bea8e201decfb923798300e0ad"],
        ["1113966530531704943","Diablo IV","diablo iv/diablo iv.exe","steam","ced913ddd2b497545cd3e2931b1310ab"],
        ["940810636273795162","Lost Ark","win64/lostark.exe","steam","2f35f5396609d5cee274b05cb95c06f9"],
        ["1402418374851432561","Black Desert","blackdesert32.exe","steam","112e60c67a42d9d8f6c9e1f3c60e843b"]
    ].map(([id, name, exePath, distributor, icon]) => ({id, name, exePath, distributor:distributor || null, icon:icon || null}));
    const badges = {generation:0, user:null, catalog:null, catalogAt:0, catalogLoading:null, current:null, heartbeatTimer:undefined,
        activityTimer:undefined, cycleTimer:undefined, startTimer:undefined, tickTimer:undefined, played:new Set(), cycled:0,
        secondsSession:0, last:null, error:"", extra:[], grants:{}, legacyGrant:null, granting:null, roomCache:null, directoryAt:0, badgeStore:null, attached:false, patchedRunning:false, analytics:null};
    function badgeNeedsGame() { return !!(enabled("badges") && (settings.badgesGameTime || settings.badgesUniqueGames)); }
    function badgeCycleOn() { return !!(enabled("badges") && settings.badgesUniqueGames); }
    function badgeClear(name) { if (badges[name] !== undefined && global.clearTimeout) global.clearTimeout(badges[name]); badges[name] = undefined; }
    function badgeStopTimers() { ["heartbeatTimer", "activityTimer", "cycleTimer", "startTimer", "tickTimer"].forEach(badgeClear); }
    // Discord only counts play time toward these badges with "Use data to personalize my Discord experience" on.
    function badgeConsented() {
        try {
            const store = inspectedExport(5932, "default");
            if (!store || typeof store.hasConsented !== "function") return null;
            return !!store.hasConsented("personalization");
        } catch (_) { return null; }
    }
    function badgeTurnOnPersonalization() {
        const set = inspectedExport(15139, "setConsents");
        if (typeof set !== "function") return;
        try {
            const res = set(["personalization"], []);
            if (res && typeof res.then === "function") res.then(() => { questDispatch({type:"UPDATE_CONSENTS", consents:{personalization:{consented:true}}}); notify("badges"); }, () => {});
        } catch (_) {}
    }
    function badgeIconUrl(game, size) {
        return game && game.icon && /^[0-9a-f]{32}$/.test(game.icon) ? "https://cdn.discordapp.com/app-icons/" + game.id + "/" + game.icon + ".png?size=" + (size || 128) : null;
    }
    // The Windows executable desktop names for a detected game, like questExecutableName with the two-part trim.
    function badgeExecutable(game) {
        const list = game && Array.isArray(game.executables) ? game.executables : [];
        const rank = name => (/(^|[\/_.-])(test|launcher|crash|helper|setup|update|install|unins|benchmark|server|editor|dedicated)/i.test(name) ? 2 : 0) + (name.includes("/") ? 0 : 1);
        const names = [];
        for (const e of list) {
            if (!e || e.os !== "win32" || e.is_launcher || typeof e.name !== "string" || !/\.exe$/i.test(e.name)) continue;
            const clean = e.name.replace(/^>/, "").replace(/\\/g, "/").toLowerCase().replace(/^\/+|\/+$/g, "");
            if (clean && !/(^|\/)\.\.(\/|$)/.test(clean)) names.push(clean);
        }
        names.sort((a, b) => rank(a) - rank(b) || (a < b ? -1 : a > b ? 1 : 0));
        return names.length ? names[0].split("/").slice(-2).join("/") : null;
    }
    const BADGE_DISTRIBUTORS = ["steam", "epic", "battlenet", "riot", "gog", "origin", "uplay", "discord", "microsoft"];
    function badgeGameFromServer(raw) {
        if (!raw || typeof raw.id !== "string" || !/^\d{17,20}$/.test(raw.id) || typeof raw.name !== "string" || !raw.name.trim()) return null;
        // Only real games Discord can detect on Windows, with art to show on your profile.
        if (raw.type != null && raw.type !== 0 && raw.type !== 5) return null;
        const exePath = badgeExecutable(raw), icon = raw.icon_hash || raw.icon || null;
        if (!exePath || !icon) return null;
        const skus = Array.isArray(raw.third_party_skus) ? raw.third_party_skus : Array.isArray(raw.thirdPartySkus) ? raw.thirdPartySkus : [];
        const sku = skus.find(s => s && BADGE_DISTRIBUTORS.includes(s.distributor));
        return {id:raw.id, name:raw.name.trim(), exePath, distributor:sku ? sku.distributor : null, icon:String(icon), sku:sku && typeof sku.id === "string" ? sku.id : null};
    }
    // Discord's full detectable list: the one DetectableGameStore already has, or /games/detectable (public, cached).
    function badgeCatalog() {
        if (badges.catalog && Date.now() - badges.catalogAt < BADGE_CATALOG_TTL_MS) return Promise.resolve(badges.catalog);
        if (badges.catalogLoading) return badges.catalogLoading;
        const generation = badges.generation;
        const build = list => {
            const out = [], seen = new Set();
            for (const raw of list) { const g = badgeGameFromServer(raw); if (g && !seen.has(g.id)) { seen.add(g.id); out.push(g); } }
            return out;
        };
        badges.catalogLoading = (async () => {
            let list = null;
            try {
                const res = await questRequest("/games/detectable", undefined, false, "get", () => generation === badges.generation && badgeNeedsGame());
                const body = res && res.body;
                if (Array.isArray(body) && body.length > 100) list = build(body);
            } catch (_) {}
            if (list && list.length > 100) { badges.catalog = list; badges.catalogAt = Date.now(); }
            badges.catalogLoading = null;
            return badges.catalog || BADGE_FALLBACK_GAMES;
        })();
        return badges.catalogLoading;
    }
    // The next game: one you haven't played with Badge Completer yet, picked at random; the well-known ones first.
    // avoid: a game ID or a Set of IDs already playing. Extra games for Game time may repeat played ones; the rotating one won't.
    function badgePickGame(catalog, avoid) {
        const skip = id => avoid instanceof Set ? avoid.has(id) : id === avoid;
        const pool = g => g && !skip(g.id) && !badges.played.has(g.id);
        const fresh = BADGE_FALLBACK_GAMES.filter(pool);
        if (fresh.length) return fresh[Math.floor(Math.random() * fresh.length)];
        const rest = (catalog || []).filter(pool);
        if (rest.length) return rest[Math.floor(Math.random() * rest.length)];
        const any = (catalog && catalog.length ? catalog : BADGE_FALLBACK_GAMES).filter(g => !skip(g.id));
        return any[Math.floor(Math.random() * any.length)] || BADGE_FALLBACK_GAMES[0];
    }
    function badgeMarkPlayed(id) {
        if (badges.played.has(id)) return;
        if (badges.played.size >= BADGES_MAX_PLAYED) badges.played.delete(badges.played.keys().next().value);
        badges.played.add(id);
        save();
    }
    // Your analytics token, which /science needs; AuthenticationStore has it after login, /users/@me otherwise.
    async function badgeAnalyticsToken() {
        try {
            const auth = inspectedExport(502, "default"), token = auth && typeof auth.getAnalyticsToken === "function" ? auth.getAnalyticsToken() : null;
            if (typeof token === "string" && token) return token;
        } catch (_) {}
        if (badges.analytics && badges.analytics.user === badges.user) return badges.analytics.token;
        const res = await questRequest("/users/@me?with_analytics_token=true", undefined, false, "get");
        const token = res && res.body && res.body.analytics_token;
        if (typeof token !== "string" || !token) throw new Error("no analytics token");
        badges.analytics = {user:badges.user, token};
        return token;
    }
    let badgeSequence = 0;
    // The same events, with the same properties, as Discord for Windows' launch_game and running_game_heartbeat.
    function badgeEvent(type, properties) {
        questDesktopProperties();
        const identity = quest.desktop || {}, now = Date.now();
        return {type, properties:Object.assign({client_track_timestamp:now, client_heartbeat_session_id:identity.session || null,
            event_sequence_number:++badgeSequence}, properties, {launch_signature:identity.signature || null, client_app_state:"unfocused", client_send_timestamp:now})};
    }
    function badgeHeartbeat(entry, initial, final) {
        // After the phone slept or Discord was frozen, never report more than two heartbeats' worth at once.
        const now = Date.now(), tracked = initial ? 0 : Math.max(0, Math.min(2 * BADGE_HEARTBEAT_MS, Math.round(now - entry.heartbeatAt)));
        entry.heartbeatAt = now;
        const g = entry.game;
        return badgeEvent("running_game_heartbeat", {game_id:g.id, game_name:g.name, game_distributor:g.distributor, game_distributor_game_id:g.sku || null,
            game_metadata:null, game_executable:g.exePath, game_detection_enabled:true, initial_heartbeat:!!initial, final_heartbeat:!!final,
            game_session_id:entry.session, duration_tracked_ms:tracked, rtc_connection_id:null, media_session_id:null, discord_window_state:"hidden"});
    }
    function badgeLaunch(entry) {
        const g = entry.game;
        return badgeEvent("launch_game", {game:g.name, game_id:g.id, verified:true, elevated:false, is_launcher:false, game_platform:"desktop",
            detection_method:"verified_game", distributor:g.distributor, is_overlay_enabled:false, is_overlay_game_enabled:false,
            is_overlay_game_source:"OOP_DEFAULT_DATABASE", fullscreen_type:"UNKNOWN", hardware_display_count:1, overlay_method:"Disabled",
            activity_status_enabled:true, activity_status_shared_guilds:[], current_user_status:"online", game_detection_enabled:true,
            executable_path:g.exePath, voice_channel_id:null, voice_channel_type:null, voice_channel_bitrate:null, voice_channel_guild_id:null,
            distributor_game_id:g.sku || null, hidden_by_distributor:false, game_metadata:null});
    }
    async function badgeScience(events) {
        const token = await badgeAnalyticsToken();
        await questRequest("/science", {token, events}, true, "post");
    }
    // A report that didn't go through is said once, quietly, and tried again with the next heartbeat.
    function badgeProblem(error) {
        const status = error && error.status;
        badges.error = status || "offline";
        notify("badges");
    }
    // Play time on your game stats, the same POST /activities body as ActivityTrackingStore.updateActivity.
    async function badgeActivity(entry, closed) {
        const now = Date.now(), elapsed = entry.activityAt != null ? now - entry.activityAt : 0;
        const duration = elapsed > 0 && elapsed <= BADGE_MAX_DURATION_MS ? Math.floor(elapsed / 1000) : 0;
        entry.activityAt = now;
        const ids = {sessionId:null, mediaSessionId:null, voiceChannelId:null};
        try { const auth = inspectedExport(502, "default"); ids.sessionId = auth && auth.getSessionId() || null; } catch (_) {}
        try {
            const res = await questRequest("/activities", {application_id:entry.game.id, distributor:entry.game.distributor || "steam", share_activity:true,
                token:entry.token || null, duration, closed:!!closed, exePath:entry.game.exePath, voice_channel_id:ids.voiceChannelId,
                session_id:ids.sessionId, media_session_id:ids.mediaSessionId}, true, "post",
                () => closed || entry.generation === badges.generation && badgeEntries().includes(entry));
            const token = res && res.body && res.body.token;
            if (typeof token === "string" && token) entry.token = token;
            badges.secondsSession += duration;
            return true;
        } catch (_) {
            // Discord answers 404 for games it no longer tracks play time for; the analytics above still count.
            entry.token = null;
            return false;
        }
    }
    // Your profile shows the games, with Discord's own art for each, like games detected on your computer.
    function badgePresence(entry, slot) {
        questDispatch({type:"LOCAL_ACTIVITY_UPDATE", socketId:"venus-badges" + (slot ? "-" + slot : ""), pid:BADGE_PID + (slot || 0),
            activity:entry ? {name:entry.game.name, application_id:entry.game.id, type:0, timestamps:{start:entry.startedAt}, flags:0} : null});
        if (entry) try { const fetch = inspectedExport(6853, "fetchApplication"); if (typeof fetch === "function") { const r = fetch(entry.game.id); if (r && r.catch) r.catch(() => {}); } } catch (_) {}
    }
    // Every game playing right now: the one that rotates for Unique games, then the ones kept running for Game time.
    function badgeEntries() { return [badges.current].concat(badges.extra).filter(Boolean); }
    function badgeGamesAtOnce() { return settings.badgesGameTime ? badgeAtOnce(settings.badgesGamesAtOnce) : 1; }
    // Discord's top Unique Games Played tier is 100 games; past that, switching would only add noise.
    function badgeVarietyDone() {
        const info = badgeInfo("GAME_VARIETY");
        return badges.played.size >= BADGE_VARIETY_TOP || !!(info && info.current != null && info.current >= BADGE_VARIETY_TOP);
    }
    function badgeEntry(game) {
        const now = Date.now();
        return {game, generation:badges.generation, startedAt:now, heartbeatAt:now, activityAt:null, token:null, session:questUuidText(questUuid())};
    }
    // Like desktop's RunningGameHeartbeatManager: one heartbeat for every running game every 5 minutes, in one batch.
    // One timer for every game: a game that starts or switches joins the next batch, so a switch never pushes back the
    // heartbeats of the games that keep running.
    function badgeScheduleHeartbeat() {
        if (!badgeEntries().length || badges.heartbeatTimer !== undefined) return;
        badges.heartbeatTimer = later(() => {
            badges.heartbeatTimer = undefined;
            const all = badgeEntries();
            if (!all.length) return;
            badgeScience(all.map(entry => badgeHeartbeat(entry, false, false))).then(() => { badgeMarkLiveDay(); if (badges.error) { badges.error = ""; notify("badges"); } }, badgeProblem);
            badgeScheduleHeartbeat();
        }, BADGE_HEARTBEAT_MS, false);
        if (badges.activityTimer !== undefined) return;
        badges.activityTimer = later(function again() {
            badges.activityTimer = undefined;
            const all = badgeEntries();
            if (!all.length) return;
            all.forEach(entry => badgeActivity(entry, false));
            badges.activityTimer = later(again, BADGE_ACTIVITY_MS, false);
        }, BADGE_ACTIVITY_MS, false);
    }
    function badgeScheduleCycle(entry) {
        badgeClear("cycleTimer");
        if (!entry || entry !== badges.current || !badgeCycleOn() || badgeVarietyDone()) return;
        const left = Math.max(5000, badgeCycleMinutes(settings.badgesCycleMinutes) * 60000 - (Date.now() - entry.startedAt));
        badges.cycleTimer = later(() => { badges.cycleTimer = undefined; if (entry === badges.current && badgeCycleOn()) badgeNextGame(); }, left, false);
    }
    // Keeps the page's countdown and progress bar moving while it's open.
    function badgeTick() {
        badgeClear("tickTimer");
        if (!badges.current) return;
        badges.tickTimer = later(() => { badges.tickTimer = undefined; notify("badges"); badgeTick(); }, 30000, false);
    }
    async function badgeStopGame(entry, slot) {
        if (!entry) return;
        badgePresence(null, slot);
        const final = badgeHeartbeat(entry, false, true);
        await Promise.all([badgeScience([final]).catch(() => {}), badgeActivity(entry, true)]);
    }
    // Opens a game the way desktop does when it detects one: initial heartbeat and launch_game, then /activities.
    async function badgeOpen(entry, slot) {
        badgePresence(entry, slot);
        try {
            await badgeScience([badgeHeartbeat(entry, true, false), badgeLaunch(entry)]);
            if (entry.generation === badges.generation) { badges.error = ""; badgeMarkPlayed(entry.game.id); badgeMarkLiveDay(); }
        } catch (error) { if (entry.generation === badges.generation) badgeProblem(error); }
        badgeActivity(entry, false);
    }
    // Keeps as many extra games running as "Games at once" asks for (Game time only). They stay put; only one rotates.
    async function badgeSyncExtras(catalog) {
        const want = badgeNeedsGame() && badges.current ? badgeGamesAtOnce() - 1 : 0;
        while (badges.extra.length > want) { const slot = badges.extra.length, entry = badges.extra.pop(); badgeStopGame(entry, slot); }
        while (badges.extra.length < want && badges.current) {
            const taken = new Set(badgeEntries().map(e => e.game.id)), slot = badges.extra.length + 1;
            const entry = badgeEntry(badgePickGame(catalog, taken));
            badges.extra.push(entry);
            await badgeOpen(entry, slot);
        }
    }
    async function badgeStartGame(avoidId) {
        const generation = ++badges.generation;
        badges.extra.forEach(entry => { entry.generation = generation; });
        if (!badgeNeedsGame() || !badges.user) return;
        const catalog = await badgeCatalog();
        if (generation !== badges.generation || !badgeNeedsGame() || !badges.user || badges.current) return;
        const taken = new Set(badges.extra.map(e => e.game.id)); if (avoidId) taken.add(avoidId);
        const entry = badgeEntry(badgePickGame(catalog, taken));
        badges.current = entry; badges.last = entry.game;
        backgroundSync(); notify("badges");
        await badgeOpen(entry, 0);
        if (entry !== badges.current) return;
        await badgeSyncExtras(catalog);
        badgeScheduleHeartbeat(); badgeScheduleCycle(entry); badgeTick();
        notify("badges");
    }
    async function badgeNextGame() {
        const prev = badges.current;
        badges.current = null;
        badgeClear("cycleTimer");
        if (prev) { await badgeStopGame(prev, 0); badges.cycled++; }
        if (badgeNeedsGame() && badges.user) await badgeStartGame(prev ? prev.game.id : null);
        else { backgroundSync(); notify("badges"); }
    }
    function badgeRefreshDirectory(force) {
        const fetch = inspectedExport(8317, "fetchBadgeDirectory"), uid = badges.user || currentId();
        if (typeof fetch !== "function" || !uid || !force && Date.now() - badges.directoryAt < 10 * 60 * 1000) return;
        badges.directoryAt = Date.now();
        try { const res = fetch(uid, force ? {force:true} : undefined); if (res && typeof res.catch === "function") res.catch(() => {}); } catch (_) {}
    }
    function badgesStart(delay) {
        badgeClear("startTimer");
        if (!enabled("badges")) return;
        badges.startTimer = later(() => {
            badges.startTimer = undefined;
            if (!badges.user) badges.user = currentId() || null;
            if (!enabled("badges") || !badges.user) return;
            badgeRefreshDirectory(false);
            if (badgeNeedsGame() && !badges.current) badgeStartGame(null);
        }, delay, false);
    }
    function badgesStop() {
        badges.generation++;
        const prev = badges.current, extras = badges.extra;
        badges.current = null; badges.extra = [];
        badgeStopTimers();
        if (badges.user) { if (prev) badgeStopGame(prev, 0); extras.forEach((entry, i) => badgeStopGame(entry, i + 1)); }
        if (!prev) badgePresence(null, 0);
        backgroundSync(); notify("badges");
    }
    function badgesConnected(event) {
        const id = event && event.user && event.user.id || currentId();
        if (id && badges.user && id !== badges.user) { badgesStop(); badges.cycled = 0; badges.secondsSession = 0; badges.played.clear(); badges.analytics = null; }
        if (id) badges.user = id;
        badgeAdoptLegacyGrant();
        if (!enabled("badges")) return;
        if (badges.current) badgeEntries().forEach((entry, i) => badgePresence(entry, i)); else badgesStart(6000);
    }
    function badgesAttachStore(store) {
        if (badges.badgeStore || !store || typeof store.getBadgeById !== "function") return;
        badges.badgeStore = store;
        if (typeof store.addChangeListener === "function") store.addChangeListener(() => { if (enabled("badges")) notify("badges"); });
    }
    function badgesInit(dispatcher) {
        if (badges.attached || !dispatcher || typeof dispatcher.subscribe !== "function") return;
        badges.attached = true;
        dispatcher.subscribe("CONNECTION_OPEN", badgesConnected);
        dispatcher.subscribe("LOGOUT", () => { badgesStop(); badges.user = null; badges.analytics = null; });
        dispatcher.subscribe("UPDATE_CONSENTS", () => { if (enabled("badges")) notify("badges"); });
    }
    function badgesLoaded() {
        badges.user = badges.user || currentId() || null;
        badgeAdoptLegacyGrant();
        if (badges.user && !badges.current) badgesStart(4000);
    }
    function badgesSettingChanged(key, value) {
        if (key === "badges" && !value) { badgesStop(); return; }
        if (!enabled("badges")) return;
        if (key === "badges") { badges.user = badges.user || currentId() || null; badgesStart(300); return; }
        if (key === "badgesGameTime" || key === "badgesUniqueGames" || key === "badgesGamesAtOnce") {
            if (!badgeNeedsGame()) badgesStop();
            else if (!badges.current) badgesStart(300);
            else { badgeCatalog().then(catalog => badgeSyncExtras(catalog)).then(() => { badgeScheduleHeartbeat(); notify("badges"); }); badgeScheduleCycle(badges.current); }
        }
        if (key === "badgesCycleMinutes" && badges.current) badgeScheduleCycle(badges.current);
        backgroundSync(); notify("badges");
    }
    // While games are playing they stay on your profile, even if Discord's own "Share my activity" setting hides games.
    function hookSelfPresenceStore(exports) {
        const store = exports && exports.default;
        if (!store || badges.patchedRunning || typeof store.getActivities !== "function") return exports;
        badges.patchedRunning = true;
        const inject = list => {
            const arr = Array.isArray(list) ? list : [];
            if (!badgeNeedsGame()) return arr;
            const missing = badgeEntries().filter(entry => !arr.some(a => a && a.application_id === entry.game.id));
            return missing.length ? arr.concat(missing.map(entry => ({name:entry.game.name, application_id:entry.game.id, type:0, timestamps:{start:entry.startedAt}, flags:0}))) : arr;
        };
        let patched = hookExport(store, "getActivities", (orig, self, args) => inject(orig.apply(self, args)));
        if (typeof store.getUnfilteredActivities === "function")
            patched = hookExport(patched, "getUnfilteredActivities", (orig, self, args) => inject(orig.apply(self, args)));
        return replaceValue(exports, "default", patched);
    }
    // Add hours now (advanced, behind its warning). Discord only sees play sessions, so each one is sent the way the
    // desktop app reports a session that ended (initial heartbeat at its start, launch_game, a final heartbeat with its
    // length), dated into a play history that looks like a person's:
    // - every past day since Game Time started counting (December 8, 2025, and never before the account existed) has
    //   its own schedule, worked out from the account and the date, so it's the same every time it's looked at: days
    //   off, longer weekends, afternoon and evening play in the phone's time zone, breaks between games, at most 2
    //   games at once and never the same game twice at once;
    // - each grant continues where the last one stopped, newest days first, so a day is never filled twice or stacked;
    // - today, and days Venus already played on in the background, are left alone;
    // - the badge's total never goes past what those days could hold, or the 5,000 hour top tier.
    const BADGE_GAME_TIME_START = new Date(2025, 11, 8).getTime(), BADGE_GRANT_PENDING_MS = 72 * 3600 * 1000, BADGE_DAY_MS = 86400000;
    function badgeDayKey(ms) { const d = new Date(ms); return String(d.getFullYear() * 10000 + (d.getMonth() + 1) * 100 + d.getDate()); }
    function badgeDayBefore(dayStart) { const d = new Date(dayStart); return new Date(d.getFullYear(), d.getMonth(), d.getDate() - 1).getTime(); }
    // A small seeded generator: the same text always gives the same numbers.
    function badgeRandom(text) {
        let h = 2166136261;
        for (let i = 0; i < text.length; i++) { h ^= text.charCodeAt(i); h = Math.imul(h, 16777619); }
        return () => {
            h = h + 0x6D2B79F5 | 0;
            let t = Math.imul(h ^ h >>> 15, 1 | h);
            t = t + Math.imul(t ^ t >>> 7, 61 | t) ^ t;
            return ((t ^ t >>> 14) >>> 0) / 4294967296;
        };
    }
    // One day of believable play, [{start, ms}] sorted by start. Same account and date, same day.
    function badgeDaySchedule(user, dayStart) {
        const rand = badgeRandom(user + ":" + badgeDayKey(dayStart)), weekday = new Date(dayStart).getDay(), hour = 3600000, minute = 60000;
        if (rand() < 0.14) return [];
        const weekend = weekday === 0 || weekday === 6;
        let budget = (weekend ? 4 + rand() * 8 : weekday === 5 ? 3 + rand() * 6 : 2 + rand() * 6) * hour;
        if (rand() < 0.15) budget += (3 + rand() * 4) * hour;
        // Whole milliseconds, so the hours sent always add up exactly.
        budget = Math.round(Math.min(budget, 16 * hour));
        const out = [], end = dayStart + 26 * hour;
        // One game after another from late morning on weekends, the afternoon otherwise, with breaks between them.
        let t = dayStart + ((weekend ? 10 : 15) * 60 + Math.floor(rand() * (weekend ? 240 : 300))) * minute + Math.floor(rand() * minute);
        while (budget > 20 * minute && t < end - 30 * minute) {
            const ms = Math.min(budget, end - t, Math.round((0.4 + Math.pow(rand(), 1.6) * 4.6) * hour + rand() * 59000));
            if (ms < 15 * minute) break;
            out.push({start:t, ms});
            budget -= ms; t += ms + Math.round((10 + rand() * 110) * minute);
        }
        // What's left runs next to it, like a second game left open the same evening.
        if (budget > 30 * minute && out.length) {
            const first = out[0].start, last = out[out.length - 1].start + out[out.length - 1].ms;
            const start = first + Math.round(rand() * Math.max(0, last - first - budget)), ms = Math.min(budget, last - start, 5 * hour);
            if (ms > 30 * minute) out.push({start, ms});
        }
        return out.sort((x, y) => x.start - y.start);
    }
    // Past days that can hold play, newest first: yesterday back to when Game Time started or the account was made.
    function badgeGrantDays(user) {
        const created = snowflakeMs(user), first = Math.max(BADGE_GAME_TIME_START, Number.isFinite(created) ? created + BADGE_DAY_MS : 0);
        const now = new Date(), out = [];
        for (let day = badgeDayBefore(new Date(now.getFullYear(), now.getMonth(), now.getDate()).getTime()); day >= first && out.length < 1000; day = badgeDayBefore(day)) out.push(day);
        return out;
    }
    // Kept per account: {at, hours, recent:[[at, hours]], days:{YYYYMMDD: sessions of that day sent, or -1 played live}}.
    function badgeGrantsLoad(raw) {
        const out = {};
        if (!raw || typeof raw !== "object") return out;
        for (const id of Object.keys(raw).slice(0, 20)) {
            const g = raw[id];
            if (!/^\d{17,20}$/.test(id) || !g || !Number.isFinite(g.at) || !Number.isFinite(g.hours)) continue;
            const now = Date.now(), recent = Array.isArray(g.recent) ? g.recent.filter(r => Array.isArray(r) && Number.isFinite(r[0]) && Number.isFinite(r[1]) && r[0] <= now).slice(-10) : [];
            const record = {at:Math.min(g.at, now), hours:Math.max(0, Math.min(BADGE_TIME_TOP, Math.floor(g.hours))),
                recent:recent.map(r => Number.isFinite(r[2]) ? [r[0], Math.max(0, Math.floor(r[1])), Math.max(0, Math.floor(r[2]))] : [r[0], Math.max(0, Math.floor(r[1]))]), days:{}};
            if (g.days && typeof g.days === "object") {
                for (const key of Object.keys(g.days).sort().slice(-800)) {
                    const v = g.days[key];
                    if (/^\d{8}$/.test(key) && Number.isInteger(v) && v >= -1 && v <= 50) record.days[key] = v;
                }
            } else if (record.hours > 0) {
                // Hours added before days were kept went back from the newest days, so those count as full.
                let left = record.hours * 3600000;
                for (const day of badgeGrantDays(id)) {
                    if (left <= 0) break;
                    const plan = badgeDaySchedule(id, day);
                    record.days[badgeDayKey(day)] = plan.length; left -= plan.reduce((sum, x) => sum + x.ms, 0);
                }
            }
            out[id] = record;
        }
        return out;
    }
    // That first build sent every session ending the moment it was added, so the day it was added and the day before
    // count as played and are never filled again.
    function badgeAdoptLegacyGrant() {
        const legacy = badges.legacyGrant, user = badges.user;
        if (!legacy || !user) return;
        badges.legacyGrant = null;
        if (badges.grants[user]) return;
        const day = new Date(legacy.at), start = new Date(day.getFullYear(), day.getMonth(), day.getDate()).getTime(), days = {};
        days[badgeDayKey(start)] = -1; days[badgeDayKey(badgeDayBefore(start))] = -1;
        badges.grants[user] = {at:legacy.at, hours:legacy.hours, recent:[[legacy.at, legacy.hours]], days};
        save();
    }
    function badgeGrantRecord() { badgeAdoptLegacyGrant(); return badges.user && badges.grants[badges.user] || {at:0, hours:0, recent:[], days:{}}; }
    // A day Venus played on in the background already has real-time play, so nothing is added to it later.
    function badgeMarkLiveDay() {
        const user = badges.user;
        if (!user) return;
        const key = badgeDayKey(Date.now()), record = badges.grants[user] || (badges.grants[user] = {at:0, hours:0, recent:[], days:{}});
        if (record.days[key] === -1) return;
        record.days[key] = -1;
        const keys = Object.keys(record.days).sort();
        if (keys.length > 800) keys.slice(0, keys.length - 800).forEach(k => { delete record.days[k]; });
        save();
    }
    // Hours left that still fit the play history, and everything those days could hold.
    function badgeGrantRoom() {
        const user = badges.user;
        if (!user) return {free:0, total:0};
        const record = badgeGrantRecord(), key = user + ":" + Math.floor(Date.now() / 3600000) + ":" + record.at + ":" + Object.keys(record.days).length;
        if (badges.roomCache && badges.roomCache.key === key) return badges.roomCache;
        let free = 0, total = 0;
        for (const day of badgeGrantDays(user)) {
            const done = record.days[badgeDayKey(day)] || 0;
            badgeDaySchedule(user, day).forEach((x, i) => { total += x.ms; if (done >= 0 && i >= done && badgeSessionFits(record, day, x)) free += x.ms; });
        }
        badges.roomCache = {key, free:Math.floor(free / 3600000), total:Math.floor(total / 3600000)};
        return badges.roomCache;
    }
    // A session from a past day can be sent only once it's over (with an hour to spare), and only if it doesn't run on
    // into a day Venus played live: late sessions of yesterday can reach past midnight.
    function badgeSessionFits(record, day, x) {
        const end = x.start + x.ms;
        if (end > Date.now() - 3600000) return false;
        return end <= day + BADGE_DAY_MS || record.days[badgeDayKey(end)] !== -1;
    }
    // Recent grants Discord may not show on the badge yet.
    function badgeGrantRecent() { const since = Date.now() - BADGE_GRANT_PENDING_MS; return badgeGrantRecord().recent.filter(r => r[0] > since); }
    // Hours the badge will show once Discord catches up: what it shows now, or what it showed when hours were last added
    // plus those hours, whichever is more, so hours that already show aren't counted twice. Test builds didn't save that
    // reading; their grants count from zero, which is where the badge stood before Venus had this feature.
    // null while Discord hasn't loaded the badge.
    function badgeGrantHave() {
        const info = badgeInfo("GAME_TIME");
        if (!info || info.current == null) return null;
        const recent = badgeGrantRecent();
        let have = info.current, after = 0;
        for (let i = recent.length - 1; i >= 0; i--) { after += recent[i][1]; have = Math.max(have, (recent[i][2] != null ? recent[i][2] : 0) + after); }
        return have;
    }
    function badgeGrantTopReached() { const have = badgeGrantHave(); return have != null && have >= BADGE_TIME_TOP || badgeGrantRecord().hours >= BADGE_TIME_TOP; }
    // Nothing can be added until Discord has loaded the badge: without its count, the 5,000 cap can't be checked.
    function badgeGrantLimit() {
        const have = badgeGrantHave(), room = badgeGrantRoom();
        if (have == null) return 0;
        return badgeGrantLimitFor(have, room);
    }
    function badgeGrantLimitFor(have, room) {
        return Math.max(0, Math.min(BADGE_GRANT_MAX, room.free, room.total - have, BADGE_TIME_TOP - have, BADGE_TIME_TOP - badgeGrantRecord().hours));
    }
    function badgeGrantWait() { return Math.max(0, badgeGrantRecord().at + BADGE_GRANT_COOLDOWN_MS - Date.now()); }
    // When nothing fits only because hours added in the last 72 hours may not show yet: how long until they stop counting
    // on top of the badge. 0 when waiting wouldn't help.
    function badgeGrantPendingWait() {
        const recent = badgeGrantRecent(), info = badgeInfo("GAME_TIME");
        if (!recent.length || !info || info.current == null || badgeGrantLimitFor(info.current, badgeGrantRoom()) < 1) return 0;
        return Math.max(0, recent[recent.length - 1][0] + BADGE_GRANT_PENDING_MS - Date.now());
    }
    function badgeSessionEvents(game, start, ms) {
        const entry = {game, session:questUuidText(questUuid()), heartbeatAt:start};
        const first = badgeHeartbeat(entry, true, false), launch = badgeLaunch(entry);
        first.properties.client_track_timestamp = start; launch.properties.client_track_timestamp = start + 2000 + Math.floor(Math.random() * 8000);
        const last = badgeHeartbeat(entry, false, true);
        last.properties.duration_tracked_ms = ms; last.properties.client_track_timestamp = start + ms;
        return [first, launch, last];
    }
    // The next sessions to send, newest days first, until `hours` is reached, each with the game it's on. A few
    // favourite games get most of the time, the same ones every grant, like a real player's library.
    function badgeGrantPlan(user, hours, games, record) {
        const want = hours * 3600000, sessions = [];
        let sum = 0;
        for (const day of badgeGrantDays(user)) {
            if (sum >= want) break;
            const key = badgeDayKey(day), done = record.days[key] || 0;
            if (done < 0) continue;
            const plan = badgeDaySchedule(user, day);
            for (let i = done; i < plan.length && sum < want; i++) {
                const ms = Math.min(plan[i].ms, want - sum);
                // The last piece may be short, so a grant always adds exactly what was asked for.
                if (ms <= 0 || !badgeSessionFits(record, day, plan[i])) break;
                sessions.push({start:plan[i].start, ms, key, index:i}); sum += ms;
            }
        }
        const rank = id => badgeRandom(user + ":" + id)();
        const library = games.slice().sort((x, y) => rank(x.id) - rank(y.id)), weights = library.map((_, i) => 1 / Math.pow(i + 1, 1.1));
        const totalWeight = weights.reduce((a, b) => a + b, 0);
        sessions.sort((x, y) => x.start - y.start);
        for (const x of sessions) {
            const busy = new Set(sessions.filter(y => y !== x && y.game && y.start < x.start + x.ms && y.start + y.ms > x.start).map(y => y.game.id));
            let roll = badgeRandom(user + ":" + x.start)() * totalWeight, pick = 0;
            while (pick < library.length - 1 && roll > weights[pick]) { roll -= weights[pick]; pick++; }
            for (let i = 0; i < library.length; i++) {
                const game = library[(pick + i) % library.length], made = snowflakeMs(game.id);
                if (!busy.has(game.id) && !(made > x.start)) { x.game = game; break; }
            }
        }
        return sessions.filter(x => x.game);
    }
    async function badgeGrantHours(hours) {
        if (badges.granting || !badges.user) return false;
        hours = Math.floor(Math.min(Number(hours) || 0, badgeGrantLimit()));
        if (hours < 1 || badgeGrantWait() > 0) return false;
        const user = badges.user, info = badgeInfo("GAME_TIME"), shown = info && info.current != null ? Math.floor(info.current) : null;
        if (shown == null) return false;
        badges.granting = {done:0, total:hours}; badges.error = ""; backgroundSync(); notify("badges");
        const catalog = await badgeCatalog();
        const pool = BADGE_FALLBACK_GAMES.concat(catalog || []).filter((g, i, all) => badges.played.has(g.id) && all.findIndex(x => x.id === g.id) === i);
        const games = pool.length >= 3 ? pool : BADGE_FALLBACK_GAMES.slice(0, 12);
        const record = badgeGrantRecord(), sessions = badgeGrantPlan(user, hours, games, record), reached = {};
        let sent = 0, ok = sessions.length > 0;
        // Oldest first, like a desktop app sending what it saved while it was offline.
        for (let i = 0; i < sessions.length && ok && badges.user === user; i += BADGE_GRANT_BATCH) {
            const batch = sessions.slice(i, i + BADGE_GRANT_BATCH);
            try {
                await badgeScience([].concat.apply([], batch.map(x => badgeSessionEvents(x.game, x.start, x.ms))));
                batch.forEach(x => { sent += x.ms; reached[x.key] = Math.max(reached[x.key] || 0, x.index + 1); });
                badges.granting.done = Math.floor(sent / 3600000); notify("badges");
            } catch (error) { ok = false; badgeProblem(error); }
            if (ok && i + BADGE_GRANT_BATCH < sessions.length) await questSleep(3000 + Math.floor(Math.random() * 4000));
        }
        const added = Math.floor(Math.round(sent) / 3600000);
        if (sent > 0) {
            // Days marked as played live while this grant was sending are kept.
            const now = Date.now(), days = Object.assign({}, record.days, (badges.grants[user] || {}).days);
            Object.keys(reached).forEach(key => { if (days[key] !== -1) days[key] = Math.max(days[key] || 0, reached[key]); });
            badges.grants[user] = {at:now, hours:record.hours + added, days,
                recent:record.recent.filter(r => r[0] > now - BADGE_GRANT_PENDING_MS).concat([[now, added, shown]]).slice(-10)};
            save();
        }
        badges.granting = null; backgroundSync(); notify("badges");
        return ok && added >= hours;
    }
    // A badge's progress from Discord's Badge Directory: tier name, how far along and what the next tier needs.
    function badgeInfo(key) {
        const store = badges.badgeStore || inspectedExport(8312, "default"), uid = badges.user || currentId();
        if (!store || typeof store.getBadgeById !== "function" || !uid) return null;
        const ids = inspectedExport(8304, "BadgeId"), id = ids && ids[key] != null ? ids[key] : key.toLowerCase();
        try {
            const badge = store.getBadgeById(id, uid);
            if (!badge) return null;
            const progress = typeof store.getSingleRequirementProgress === "function" ? store.getSingleRequirementProgress(id, uid) : null;
            const tier = typeof store.getCurrentTier === "function" ? store.getCurrentTier(id, uid) : null;
            const next = typeof store.getNextTier === "function" ? store.getNextTier(id, uid) : null;
            const current = progress && Number.isFinite(Number(progress.current)) ? Number(progress.current) : null;
            const goal = progress && Number(progress.threshold) > 0 ? Number(progress.threshold) : null;
            return {current, goal, tier:tier && tier.name || "", next:next && next.name || "", owned:!!badge.owned};
        } catch (_) { return null; }
    }
    function badgeShare() {
        const entry = badges.current;
        if (!entry || !badgeCycleOn()) return null;
        return Math.min(1, Math.max(0, (Date.now() - entry.startedAt) / (badgeCycleMinutes(settings.badgesCycleMinutes) * 60000)));
    }
    const BADGE_ROWS = [["GAME_TIME", 5051, "ClockIcon"], ["GAME_VARIETY", 9207, "GameControllerIcon"], ["ACCOUNT_AGE", 8675, "CalendarIcon"]];
    function badgeRowText(key, info) {
        const title = key === "GAME_TIME" ? tr("Hours Played") : key === "GAME_VARIETY" ? tr("Unique Games Played") : tr("Years Active");
        const vars = info ? {current:info.current, goal:info.goal} : null;
        const amount = !vars || vars.current == null || vars.goal == null ? null : key === "GAME_TIME" ? tr("{current} of {goal} hours", vars) :
            key === "GAME_VARIETY" ? tr("{current} of {goal} games", vars) : tr("{current} of {goal} days", vars);
        return {title, amount};
    }
    const BADGE_CARD_DARK = {card:{backgroundColor:"#2b2d31", borderRadius:16, paddingHorizontal:16, paddingVertical:14, gap:12},
        row:{flexDirection:"row", alignItems:"center", gap:12}, icon:{width:36, height:36, borderRadius:18, alignItems:"center", justifyContent:"center", backgroundColor:"#4e50584d"},
        art:{width:40, height:40, borderRadius:10, backgroundColor:"#4e50584d"}, divider:{height:1, backgroundColor:"#ffffff0f"}};
    function badgeCardStyles() {
        return useThemed("badgeCards", c => ({card:Object.assign({}, BADGE_CARD_DARK.card, {backgroundColor:c.CARD_BACKGROUND_DEFAULT}),
            row:BADGE_CARD_DARK.row, icon:Object.assign({}, BADGE_CARD_DARK.icon, {backgroundColor:c.BACKGROUND_MOD_SUBTLE}),
            art:Object.assign({}, BADGE_CARD_DARK.art, {backgroundColor:c.BACKGROUND_MOD_SUBTLE}), divider:Object.assign({}, BADGE_CARD_DARK.divider, {backgroundColor:c.BORDER_SUBTLE})}), BADGE_CARD_DARK);
    }
    function badgeText(text, variant, color, fallback) {
        const Text = inspectedExport(5088, "Text");
        return Text ? el(Text, {variant, color}, text) : el(RN.Text, {style:fallback}, text);
    }
    // One card with every badge: its icon, name and tier, how far along it is and a bar to the next tier.
    function badgeProgressCard(s, on) {
        const rows = BADGE_ROWS.map(([key, icon, iconName]) => {
            const info = badgeInfo(key), Icon = venusIcon(icon, iconName), text = badgeRowText(key, info);
            const counting = key === "GAME_TIME" ? on && settings.badgesGameTime : key === "GAME_VARIETY" ? on && settings.badgesUniqueGames : true;
            const detail = !info ? "" : text.amount || (info.tier ? tr("Top tier") : "");
            const tier = !info ? tr("Loading progress") : info.tier ? info.tier : tr("No tier yet");
            return el(RN.View, {key, style:{gap:2}},
                el(RN.View, {style:s.row},
                    el(RN.View, {style:s.icon}, el(Icon, {size:"sm"})),
                    el(RN.View, {style:{flex:1}},
                        badgeText(text.title, "text-md/semibold", "text-strong", {color:"#f2f3f5", fontSize:16, fontWeight:"600"}),
                        badgeText(tier + (info && info.next ? "  \u2192  " + info.next : ""), "text-sm/medium", "text-muted", {color:"#949ba4", fontSize:13})),
                    counting && !detail ? null : badgeText(counting ? detail : tr("Not counted"), "text-xs/semibold", "text-muted", {color:"#949ba4", fontSize:12, fontWeight:"600"})),
                info && info.current != null && info.goal != null ? el(VenusProgress, {key:"bar:" + key, value:info.current / info.goal}) : null);
        });
        const out = [];
        rows.forEach((row, i) => { if (i) out.push(el(RN.View, {key:"d" + i, style:s.divider})); out.push(row); });
        return el(RN.View, {key:"progress", style:{gap:10}}, groupTitle("progressTitle", "Your badges"), el(RN.View, {style:s.card}, out));
    }
    // The card at the top: the game playing right now with its real art, when the next one starts and how many so far.
    function badgeNowCard(s) {
        const entries = badgeEntries(), entry = badges.current, game = entry && entry.game, url = badgeIconUrl(game, 128);
        const lines = [];
        if (entries.length > 1) lines.push(tr("Also playing {names}.", {names:entries.slice(1).map(e => e.game.name).join(", ")}));
        if (entry && badgeCycleOn() && !badgeVarietyDone()) {
            const left = Math.max(1, Math.ceil((badgeCycleMinutes(settings.badgesCycleMinutes) * 60000 - (Date.now() - entry.startedAt)) / 60000));
            lines.push(pl(left, "Next game in about {n} minute.", "Next game in about {n} minutes."));
        } else if (entry && badgeCycleOn()) lines.push(tr("All 100 games for the top tier are played, so games stay put now."));
        else if (entry) lines.push(tr("Counting play time on this game."));
        else if (!badgeNeedsGame()) lines.push(tr("Turn on Game time or Unique games below."));
        else lines.push(tr("Starts a game as soon as Discord is connected."));
        if (badges.played.size) lines.push(pl(badges.played.size, "{n} game played so far.", "{n} games played so far."));
        if (badges.granting) lines.push(tr("Adding {done} of {total} hours.", {done:badges.granting.done, total:badges.granting.total}));
        if (badges.error) lines.push(tr("Couldn't report to Discord. Trying again soon."));
        const leading = url && RN.Image ? el(RN.Image, {source:{uri:url, width:40, height:40}, style:s.art, accessibilityIgnoresInvertColors:true}) : null;
        const share = badgeVarietyDone() ? null : badgeShare();
        return statusCard("status", lines.join("\n"), {title:entry ? tr("Playing {name}", {name:game.name}) : badgeNeedsGame() ? tr("Getting a game ready") : tr("No games playing"),
            leading, IconComponent:leading ? null : venusIcon(badges.error ? 12178 : 9207, badges.error ? "ChatWarningIcon" : "GameControllerIcon"),
            footer:share != null ? el(VenusProgress, {key:"cycle:" + game.id, value:share}) : null});
    }
    // The three questions everyone asks first: when a game counts, how fast hours add up, and why the badge lags behind.
    function badgeHowCard(s) {
        const rate = badgeGamesAtOnce();
        const rows = [
            [9207, "GameControllerIcon", tr("When a game counts"), tr("As soon as it starts. Each game stays on a while anyway, because switching every few seconds is something no real player does.")],
            [5051, "ClockIcon", tr("How fast hours add up"), settings.badgesGameTime ?
                pl(rate, "{n} hour of game time for every hour Discord is open, even in the background.", "{n} hours of game time for every hour Discord is open, even in the background.") :
                tr("Turn on Game time to count hours.")],
            [8675, "CalendarIcon", tr("When you'll see it"), tr("Discord updates badges about once a day, so new games and hours show 12 to 72 hours later.")]];
        const out = [];
        rows.forEach(([icon, name, title, body], i) => {
            if (i) out.push(el(RN.View, {key:"d" + i, style:s.divider}));
            out.push(el(RN.View, {key:"r" + i, style:s.row},
                el(RN.View, {style:s.icon}, el(venusIcon(icon, name), {size:"sm"})),
                el(RN.View, {style:{flex:1, gap:2}},
                    badgeText(title, "text-md/semibold", "text-strong", {color:"#f2f3f5", fontSize:16, fontWeight:"600"}),
                    badgeText(body, "text-sm/medium", "text-muted", {color:"#949ba4", fontSize:13}))));
        });
        return el(RN.View, {key:"how", style:{gap:10}}, groupTitle("howTitle", "How it works"), el(RN.View, {style:s.card}, out));
    }
    // Add hours now: steps you can't rush through. Tick three statements, type a word, pick an amount, then confirm once
    // more in Discord's own dialog. Nothing is sent before that last confirm.
    const BADGE_GRANT_PRESETS = [25, 100, 250, 500];
    const BADGE_DANGER_DARK = {box:{borderRadius:16, padding:16, gap:12, borderWidth:1, borderColor:"#f23f43", backgroundColor:"#f23f431a"}};
    function BadgeGrantPanel(props) {
        const [step, setStep] = React.useState(0), [word, setWord] = React.useState(""), [hours, setHours] = React.useState(100), [checks, setChecks] = React.useState([false, false, false]);
        useSettings("badges");
        const ui = reviewUI(), s = props.s, Button = inspectedExport(5379, "Button"), Press = RN.Pressable || RN.View;
        const limit = badgeGrantLimit(), granting = badges.granting, keyword = tr("RISK");
        const danger = useThemed("badgeDanger", c => ({box:Object.assign({}, BADGE_DANGER_DARK.box, {borderColor:c.BORDER_FEEDBACK_CRITICAL || "#f23f43",
            backgroundColor:c.BACKGROUND_FEEDBACK_CRITICAL || "#f23f431a"})}), BADGE_DANGER_DARK);
        const button = (key, text, onPress, disabled, variant) => Button ? el(Button, {key, text, size:"md", variant:variant || "primary", disabled:!!disabled,
                onPress:() => { haptic("SELECTION"); animateLayout(); onPress(); }}) :
            el(Press, {key, onPress:disabled ? undefined : onPress, accessibilityRole:"button", accessibilityLabel:text, style:{padding:12, borderRadius:20, alignItems:"center", backgroundColor:variant === "secondary" ? "#4e5058" : "#da373c", opacity:disabled ? 0.5 : 1}},
                el(RN.Text, {style:{color:"#ffffff", fontWeight:"600"}}, text));
        const title = text => badgeText(text, "text-md/bold", "text-feedback-critical", {color:"#f23f43", fontSize:16, fontWeight:"700"});
        const heading = text => badgeText(text, "text-md/semibold", "text-strong", {color:"#f2f3f5", fontSize:16, fontWeight:"600"});
        const body = text => badgeText(text, "text-sm/medium", "text-default", {color:"#dbdee1", fontSize:14});
        const check = (i, text) => el(Press, {key:"c" + i, accessibilityRole:"checkbox", accessibilityLabel:text, accessibilityState:{checked:checks[i]},
                style:{flexDirection:"row", gap:12, alignItems:"center", paddingVertical:4},
                onPress:() => { haptic("SELECTION"); const next = checks.slice(); next[i] = !next[i]; setChecks(next); }},
            el(RN.View, {style:{width:22, height:22, borderRadius:6, borderWidth:2, borderColor:checks[i] ? "#da373c" : "#80848e", backgroundColor:checks[i] ? "#da373c" : "transparent",
                alignItems:"center", justifyContent:"center"}}, checks[i] ? el(RN.Text, {style:{color:"#ffffff", fontSize:13, fontWeight:"800", lineHeight:15}}, "\u2713") : null),
            el(RN.View, {style:{flex:1}}, body(text)));
        if (granting) return el(RN.View, {style:[s.card, {gap:8}]},
            heading(tr("Adding hours")),
            body(tr("{done} of {total} hours sent. Keep Discord open.", {done:granting.done, total:granting.total})),
            el(VenusProgress, {key:"grant", value:granting.total ? granting.done / granting.total : 0}));
        if (badgeGrantHave() == null) return el(RN.View, {style:[s.card, {gap:8}]},
            heading(tr("Loading progress")),
            button("close", tr("Close"), props.onClose, false, "secondary"));
        // Nothing left only when waiting won't help; otherwise say when hours can be added again.
        const wait = Math.max(badgeGrantWait(), limit < 1 && !badgeGrantTopReached() ? badgeGrantPendingWait() : 0);
        if (wait > 0 || limit < 1) return el(RN.View, {style:[s.card, {gap:8}]},
            heading(wait <= 0 ? tr("Nothing left to add") : tr("Come back tomorrow")),
            body(wait <= 0 ? (badgeGrantTopReached() ? tr("You're at the 5,000 hour top tier already.") : tr("Your past days are as full as real play gets. More room opens up every day.")) :
                pl(Math.ceil(wait / 3600000), "You can add more in {n} hour. Hours you added show within 72 hours.", "You can add more in {n} hours. Hours you added show within 72 hours.")),
            button("close", tr("Close"), props.onClose, false, "secondary"));
        if (step === 0) return el(RN.View, {style:danger.box},
            title(tr("Your account could be suspended or banned")),
            body(tr("Adding hours tells Discord you played games you never played. That breaks Discord's Terms of Service. People have reported accounts suspended for tools that do this, and hours added this way can't be taken back.")),
            body(tr("Nobody outside Discord knows how likely that is. It could happen right away, weeks later or never. Leaving this off and letting Venus play games in the background is much safer.")),
            check(0, tr("I understand this breaks Discord's rules.")),
            check(1, tr("I understand my account could be suspended or banned.")),
            check(2, tr("I understand added hours can't be removed.")),
            button("next", tr("Continue"), () => setStep(1), !checks.every(Boolean), "destructive"),
            button("cancel", tr("Cancel"), props.onClose, false, "secondary"));
        if (step === 1) {
            // Turkish İ/ı and typing in lower case both still match the word.
            const fold = text => String(text || "").trim().toUpperCase().replace(/[İı]/g, "I");
            const typed = fold(word) === fold(keyword);
            return el(RN.View, {style:danger.box},
                title(tr("Type {word} to continue", {word:keyword})),
                body(tr("This makes sure you read the warning.")),
                ui.TextInput ? el(ui.TextInput, {value:word, onChange:text => setWord(String(text || "")), autoCapitalize:"characters", autoCorrect:false, placeholder:keyword, maxLength:20}) :
                    el(RN.TextInput, {value:word, onChangeText:setWord, autoCapitalize:"characters", autoCorrect:false, placeholder:keyword, maxLength:20, style:{fontSize:16, padding:12, color:"#f2f3f5"}}),
                button("next", tr("Continue"), () => setStep(2), !typed, "destructive"),
                button("cancel", tr("Cancel"), props.onClose, false, "secondary"));
        }
        const amounts = BADGE_GRANT_PRESETS.filter(n => n <= limit), items = amounts.length ? amounts : [limit];
        const chosen = items.includes(hours) ? hours : items[Math.min(1, items.length - 1)];
        return el(RN.View, {style:danger.box},
            heading(tr("How many hours?")),
            body(tr("Smaller amounts look more like real play. You can add up to {max} hours once a day.", {max:limit})),
            body(tr("Room left that still looks like real play: {n} h. It grows every day.", {n:Math.max(0, Math.min(badgeGrantRoom().free, badgeGrantRoom().total - (badgeGrantHave() || 0)))})),
            venusSegmented({key:"grantHours", value:chosen, onChange:setHours, items:items.map(n => ({value:n, label:tr("{n} h", {n})}))}),
            body(tr("They're dated like real play: spread over your past days at afternoon, evening and weekend hours, with days off and never more than 2 games at once. Each time picks up on older days, so no day is filled twice. They show on your badge within 72 hours.")),
            button("grant", tr("Add {n} hours", {n:chosen}), () => confirmAction("Add hours now?",
                "Last chance. This can get your account suspended or banned, and it can't be undone.", "Add hours", () => { badgeGrantHours(chosen); }), chosen < 1, "destructive"),
            button("cancel", tr("Cancel"), props.onClose, false, "secondary"));
    }
    function BadgeSettings() {
        useSettings("badges");
        React.useEffect(() => { if (enabled("badges")) badgeRefreshDirectory(false); }, []);
        const [advanced, setAdvanced] = React.useState(false), [granting, setGranting] = React.useState(false);
        const ui = reviewUI(), s = badgeCardStyles();
        if (!RN) return null;
        const Group = ui.TableRowGroup || RN.View, Switch = ui.TableSwitchRow, on = enabled("badges"), Button = inspectedExport(5379, "Button");
        const consent = on ? badgeConsented() : null;
        const groups = [
            riskCard("risk", "Discord doesn't allow reporting games you aren't playing, so this could get your account suspended or banned. Use it at your own risk."),
            on ? badgeNowCard(s) : offCard("status", venusIcon(8921, "TrophyIcon"), "badges"),
            consent === false ? statusCard("consent", "Discord only counts games toward these badges while \"Use data to personalize my Discord experience\" is on.",
                {title:tr("Personalization is off"), IconComponent:venusIcon(12178, "ChatWarningIcon"),
                 trailing:Button ? el(Button, {text:tr("Turn on"), size:"sm", variant:"primary", onPress:() => { haptic("SELECTION"); badgeTurnOnPersonalization(); }}) : null}) : null,
            badgeProgressCard(s, on),
            on ? badgeHowCard(s) : null,
            el(Group, {key:"types", title:tr("What to count")},
                switchRow(Switch, "badgesGameTime", "Game time", "Plays games in the background, toward Hours Played.", rowIcon(5051, "ClockIcon")),
                switchRow(Switch, "badgesUniqueGames", "Unique games", "Switches to a game you haven't played yet, toward Unique Games Played.", rowIcon(9207, "GameControllerIcon"))),
            settings.badgesGameTime ? el(RN.View, {key:"atOnce", style:{gap:10}},
                groupTitle("atOnceTitle", "Games at once"),
                venusSegmented({key:"atOnceSeg", value:badgeAtOnce(settings.badgesGamesAtOnce), disabled:!on, onChange:value => setSetting("badgesGamesAtOnce", value),
                    items:BADGE_AT_ONCE.map(n => ({value:n, label:pl(n, "{n} game", "{n} games")}))}),
                footnote("atOnceHint", "Discord adds up the time of every game that's running, so 3 games count 3 hours each hour. More than 3 at once isn't something real players do.")) : null,
            settings.badgesUniqueGames ? el(PresetOrCustom, {key:"cycle", title:"Switch games every", value:settings.badgesCycleMinutes, disabled:!on,
                min:BADGE_CYCLE_MIN, max:BADGE_CYCLE_MAX, placeholder:15,
                inputLabel:tr("Minutes, {min} to {max}", {min:BADGE_CYCLE_MIN, max:BADGE_CYCLE_MAX}),
                format:n => tr("{n} min", {n}),
                onChange:value => setSetting("badgesCycleMinutes", value),
                presets:BADGE_CYCLE_PRESETS.map(n => ({value:n, label:tr("{n} min", {n})})),
                hint:"Every 15 minutes reaches all 100 games for the top tier in about a day. After that, games stop switching."}) : null,
            on ? el(Group, {key:"actions", title:tr("Manage")},
                badges.current && badgeCycleOn() && !badgeVarietyDone() ? actionRow(ui, "next", "Switch to the next game now", null, () => { haptic("SELECTION"); badgeNextGame(); }) : null,
                actionRow(ui, "refresh", "Refresh badge progress", "Discord can take a day or two to add new play time.", () => { haptic("SELECTION"); badgeRefreshDirectory(true); }),
                actionRow(ui, "advanced", advanced ? "Hide advanced" : "Advanced", advanced ? null : "Add hours now. Risky.", () => { haptic("SELECTION"); animateLayout(); setAdvanced(!advanced); setGranting(false); })) : null,
            on && advanced ? el(RN.View, {key:"advancedBox", style:{gap:10}},
                groupTitle("advancedTitle", "Add hours now"),
                granting || badges.granting ? el(BadgeGrantPanel, {key:"panel", s, onClose:() => { animateLayout(); setGranting(false); }}) :
                    el(RN.View, {style:[s.card, {gap:10}]},
                        badgeText(tr("Get game time right away instead of waiting for it."), "text-md/semibold", "text-strong", {color:"#f2f3f5", fontSize:16, fontWeight:"600"}),
                        badgeText(badgeGrantRecent().length ? tr("Last time you added {n} hours. They show on your badge within 72 hours.", {n:badgeGrantRecent().slice(-1)[0][1]}) :
                            tr("This is the risky way, so it asks you to confirm three times."), "text-sm/medium", "text-muted", {color:"#949ba4", fontSize:13}),
                        Button ? el(Button, {text:tr("Add hours now"), size:"md", variant:"destructive", onPress:() => { haptic("SELECTION"); animateLayout(); setGranting(true); }}) : null)) : null,
            footnote("note", "Games are reported as Discord for Windows sees them, without installing or opening anything. Years Active grows with your account's age, so there's nothing to report for it.")];
        return settingsBody(ui, groups);
    }
    // Motion, from React Native's own Animated and LayoutAnimation. Opacity, position and scale run on the native
    // driver, so nothing extra runs in JS while a page animates. Without them, or with Android's "Remove animations"
    // on, everything simply shows at once.
    let reduceMotion = false, reduceMotionAsked = false;
    function motion() {
        const A = RN && RN.Animated;
        if (!A || typeof A.timing !== "function" || typeof A.Value !== "function") return null;
        if (!reduceMotionAsked) {
            reduceMotionAsked = true;
            const info = RN.AccessibilityInfo;
            try { if (info && typeof info.isReduceMotionEnabled === "function") Promise.resolve(info.isReduceMotionEnabled()).then(on => { reduceMotion = !!on; }, () => {}); } catch (_) {}
            try { if (info && typeof info.addEventListener === "function") info.addEventListener("reduceMotionChanged", on => { reduceMotion = !!on; }); } catch (_) {}
        }
        return A;
    }
    // The next layout change on screen eases into place instead of jumping: rows that appear, a bar that widens.
    function animateLayout() {
        const animate = RN && RN.LayoutAnimation;
        if (reduceMotion || !animate || typeof animate.configureNext !== "function") return;
        try { animate.configureNext(typeof animate.create === "function" ? animate.create(200, "easeInEaseOut", "opacity") : animate.Presets.easeInEaseOut); } catch (_) {}
    }
    function easeOut() { const E = RN && RN.Easing; try { return E && E.out && E.cubic ? E.out(E.cubic) : undefined; } catch (_) { return undefined; } }
    // An option page's groups rise into place one after another when the page opens, and a row group that
    // appears later (Manage, a hex box) fades in the same way.
    function VenusReveal(props) {
        const A = motion(), ref = React.useRef(null);
        if (!ref.current && A) {
            const value = new A.Value(reduceMotion ? 1 : 0);
            ref.current = {value, style:{opacity:value, transform:[{translateY:value.interpolate({inputRange:[0, 1], outputRange:[14, 0]})}]}};
        }
        React.useEffect(() => {
            const state = ref.current;
            if (!state || reduceMotion) return undefined;
            const run = A.timing(state.value, {toValue:1, duration:280, delay:Math.min(props.index || 0, 6) * 45, easing:easeOut(), useNativeDriver:true});
            run.start();
            return () => { run.stop(); state.value.setValue(1); };
        }, []);
        return ref.current ? el(A.View, {style:ref.current.style}, props.children) : props.children;
    }
    // A check mark or choice that pops in with a small spring when it's picked.
    function PopIn(props) {
        const A = motion(), ref = React.useRef(null);
        if (!ref.current && A) {
            const value = new A.Value(reduceMotion ? 1 : 0);
            ref.current = {value, style:{opacity:value.interpolate({inputRange:[0, 1], outputRange:[0, 1], extrapolate:"clamp"}),
                transform:[{scale:value.interpolate({inputRange:[0, 1], outputRange:[0.4, 1]})}]}};
        }
        React.useEffect(() => {
            const state = ref.current;
            if (!state || reduceMotion || typeof A.spring !== "function") { if (state) state.value.setValue(1); return undefined; }
            const run = A.spring(state.value, {toValue:1, speed:20, bounciness:12, useNativeDriver:true});
            run.start();
            return () => run.stop();
        }, []);
        return ref.current ? el(A.View, {style:ref.current.style, pointerEvents:"none"}, props.children) : props.children;
    }
    function popIn(key, child) { return child ? el(PopIn, {key}, child) : child; }
    // Steps that type text into a preview's message box one letter at a time.
    function typeSteps(text, set, ms) { return Array.from(text).map((_, i) => [ms || 70, () => set(text.slice(0, i + 1))]); }
    // Where the demo's finger taps: a soft circle that grows and fades once each time it mounts (key it on the tap).
    function TapRipple(props) {
        const A = motion(), ref = React.useRef(null);
        if (!ref.current && A) ref.current = new A.Value(0);
        React.useEffect(() => {
            const value = ref.current;
            if (!value || reduceMotion) return undefined;
            const run = A.timing(value, {toValue:1, duration:420, easing:easeOut(), useNativeDriver:true});
            run.start();
            return () => run.stop();
        }, []);
        const base = Object.assign({position:"absolute", width:34, height:34, borderRadius:17, backgroundColor:"#ffffff"}, props.at || {right:22, top:14});
        if (!ref.current) return el(RN.View, {pointerEvents:"none", style:[base, {opacity:0.25}]});
        return el(A.View, {pointerEvents:"none", style:[base, {opacity:ref.current.interpolate({inputRange:[0, 1], outputRange:[0.45, 0]}),
            transform:[{scale:ref.current.interpolate({inputRange:[0, 1], outputRange:[0.5, 1.7]})}]}]});
    }
    function tapRipple(pulse, who, at) { return pulse && pulse.who === who ? el(TapRipple, {key:"tap:" + pulse.id, at}) : null; }
    // A preview that plays (Watch) is a short video: a story is a list of [wait ms, step, caption?]. Each caption stays up long enough
    // to read (storyPlan stretches the wait before the next one), the clock ticks once a second, and a bar under the
    // preview shows where it is, how long it is, and lets you pause or start over. It loops, and starts over when the
    // options below change. Its timers end when the feature is turned off or you leave the page.
    function readMs(text) { return Math.max(2400, Math.min(5000, 1500 + 55 * String(text || "").length)); }
    function storyPlan(list) {
        const out = list.filter(Boolean).map(step => step.slice());
        let last = null, since = 0;
        out.forEach(step => {
            if (step[2] && last !== null && since + step[0] < readMs(last)) step[0] += readMs(last) - since - step[0];
            if (step[2]) { last = step[2]; since = 0; } else since += step[0];
        });
        if (last !== null && since < readMs(last)) out.push([readMs(last) - since, () => {}]);
        return out;
    }
    function useStory(active, build, deps) {
        const [view, setView] = React.useState({t:0, total:0, caption:"", chapter:0, chapters:[], playing:true, segment:null});
        const control = React.useRef({});
        React.useEffect(() => {
            if (!active) return undefined;
            const plan = storyPlan(build()), at = [];
            let sum = 0;
            plan.forEach(step => { sum += step[0]; at.push(sum); });
            const total = sum, chapters = plan.map((step, i) => step[2] ? at[i] : null).filter(x => x !== null);
            const st = {i:0, t:0, timer:undefined, cancelled:false, paused:false, caption:"", chapter:0, seg:0};
            const syncZero = () => {
                while (st.i < plan.length && at[st.i] <= st.t) {
                    const step = plan[st.i++];
                    if (step[2]) { st.caption = step[2]; st.chapter++; }
                    try { step[1](); } catch (_) {}
                }
            };
            const show = segment => setView({t:st.t, total, caption:st.caption, chapter:st.chapter, chapters, playing:!st.paused, segment});
            const stop = () => { if (st.timer !== undefined && global.clearTimeout) global.clearTimeout(st.timer); st.timer = undefined; };
            const schedule = () => {
                if (st.cancelled || st.paused) return;
                syncZero();
                const due = st.i < at.length ? at[st.i] : total, target = Math.min(due, Math.floor(st.t / 1000) * 1000 + 1000);
                const wait = Math.max(0, target - st.t);
                show({from:st.t, to:target, ms:wait, id:++st.seg});
                st.timer = later(() => {
                    st.timer = undefined;
                    if (st.cancelled) return;
                    st.t = target;
                    syncZero();
                    if (st.i >= plan.length) { st.i = 0; st.t = 0; st.caption = ""; st.chapter = 0; syncZero(); }
                    schedule();
                }, wait, false);
            };
            control.current = {
                pause() { if (st.paused) return; st.paused = true; stop(); show(null); },
                play() { if (!st.paused) return; st.paused = false; schedule(); },
                replay() { stop(); st.i = 0; st.t = 0; st.caption = ""; st.chapter = 0; st.paused = false; schedule(); }
            };
            schedule();
            return () => { st.cancelled = true; stop(); control.current = {}; };
        }, [active].concat(deps || []));
        return Object.assign({}, view, {pause:() => control.current.pause && control.current.pause(),
            play:() => control.current.play && control.current.play(), replay:() => control.current.replay && control.current.replay()});
    }
    function clockText(ms) { const sec = Math.round(ms / 1000); return Math.floor(sec / 60) + ":" + String(sec % 60).padStart(2, "0"); }
    const PREVIEW_CHROME_DARK = {
        header:{flexDirection:"row", alignItems:"center", gap:8, paddingHorizontal:8, height:48, borderBottomWidth:1, borderBottomColor:"#ffffff0f"},
        headerPill:{width:32, height:32, borderRadius:16, alignItems:"center", justifyContent:"center", backgroundColor:"#2b2d31"},
        title:{color:"#f2f3f5", fontSize:16, fontWeight:"700"}, sub:{color:"#949ba4", fontSize:12}, icon:{color:"#b5bac1"}, iconMuted:{color:"#80848e"},
        inputRow:{flexDirection:"row", alignItems:"center", gap:8, paddingHorizontal:8, paddingTop:8, paddingBottom:8},
        round:{width:40, height:40, borderRadius:20, alignItems:"center", justifyContent:"center", backgroundColor:"#2b2d31"},
        emojiBtn:{width:44, height:44, borderRadius:22, alignItems:"center", justifyContent:"center", backgroundColor:"#2b2d31"},
        pill:{flex:1, minHeight:40, borderRadius:20, paddingHorizontal:14, flexDirection:"row", alignItems:"center", gap:10, backgroundColor:"#2b2d31"},
        send:{width:40, height:40, borderRadius:20, alignItems:"center", justifyContent:"center", backgroundColor:"#5865f2"},
        bar:{flexDirection:"row", alignItems:"center", gap:8, paddingHorizontal:16, paddingVertical:8, backgroundColor:"#232428", borderTopWidth:1, borderTopColor:"#ffffff0f", borderBottomWidth:1, borderBottomColor:"#ffffff0f"},
        barDivider:{width:1, height:16, backgroundColor:"#ffffff14"},
        brand:{backgroundColor:"#5865f2"}, brandText:{color:"#ffffff"}, brandFg:{color:"#5865f2"},
        secondary:{backgroundColor:"#4e505899"}, secondaryText:{color:"#f2f3f5"},
        segTrack:{backgroundColor:"#1e1f22"}, segIndicator:{backgroundColor:"#4e5058"},
        searchField:{backgroundColor:"#111214"}, pickerCatBar:{backgroundColor:"#2b2d31", borderTopColor:"#ffffff0f"},
        sheet:{backgroundColor:"#232428", borderTopLeftRadius:16, borderTopRightRadius:16, paddingTop:8, paddingBottom:4},
        sheetRow:{backgroundColor:"#2b2d31", borderColor:"#ffffff0f"}, modal:{backgroundColor:"#313338", borderRadius:16, padding:16, gap:12}, scrim:{backgroundColor:"#000000a6"},
        strip:{backgroundColor:"#4e50581a", borderTopWidth:1, borderTopColor:"#ffffff0f"}, track:{backgroundColor:"#4e505899"}, fill:{backgroundColor:"#5865f2"},
        mention:{backgroundColor:"#5865f23d", color:"#c9cdfb"}, category:{color:"#949ba4", fontSize:13, fontWeight:"600"},
        channel:{color:"#949ba4"}, selected:{backgroundColor:"#4e505866"}, card:{backgroundColor:"#2b2d31", borderColor:"#ffffff14"}};
    function usePreviewChrome() {
        return useThemed("previewChrome", c => ({
            header:Object.assign({}, PREVIEW_CHROME_DARK.header, {borderBottomColor:c.MOBILE_HEADER_BORDER || c.BORDER_SUBTLE}),
            headerPill:Object.assign({}, PREVIEW_CHROME_DARK.headerPill, {backgroundColor:c.REDESIGN_BUTTON_TERTIARY_BACKGROUND || c.BACKGROUND_BASE_LOW || c.BACKGROUND_MOD_SUBTLE}),
            title:Object.assign({}, PREVIEW_CHROME_DARK.title, {color:c.MOBILE_TEXT_HEADING_PRIMARY || c.TEXT_STRONG}),
            sub:Object.assign({}, PREVIEW_CHROME_DARK.sub, {color:c.TEXT_MUTED}),
            icon:{color:c.MOBILE_HEADER_ICON_DEFAULT || c.INTERACTIVE_ICON_DEFAULT}, iconMuted:{color:c.ICON_MUTED || c.TEXT_SUBTLE},
            inputRow:PREVIEW_CHROME_DARK.inputRow,
            round:Object.assign({}, PREVIEW_CHROME_DARK.round, {backgroundColor:c.CHAT_INPUT_ACTION_BUTTON_BACKGROUND || c.BACKGROUND_MOD_SUBTLE}),
            emojiBtn:Object.assign({}, PREVIEW_CHROME_DARK.emojiBtn, {backgroundColor:c.MOBILE_EMOJI_BUTTON_BACKGROUND || c.CARD_BACKGROUND_DEFAULT || c.BACKGROUND_MOD_SUBTLE}),
            pill:Object.assign({}, PREVIEW_CHROME_DARK.pill, {backgroundColor:c.REDESIGN_CHAT_INPUT_BACKGROUND || c.CHAT_INPUT_BACKGROUND}),
            send:Object.assign({}, PREVIEW_CHROME_DARK.send, {backgroundColor:c.CHAT_INPUT_SEND_BUTTON_ACTIVE_BACKGROUND || c.BACKGROUND_BRAND}),
            bar:Object.assign({}, PREVIEW_CHROME_DARK.bar, {backgroundColor:c.MOBILE_FLOATING_ACCESSORY_BACKGROUND || c.BACKGROUND_MOD_SUBTLE, borderTopColor:c.BORDER_MUTED || c.BORDER_SUBTLE, borderBottomColor:c.BORDER_MUTED || c.BORDER_SUBTLE}),
            barDivider:Object.assign({}, PREVIEW_CHROME_DARK.barDivider, {backgroundColor:c.BORDER_SUBTLE}),
            brand:{backgroundColor:c.BACKGROUND_BRAND}, brandText:{color:c.CONTROL_BRAND_FOREGROUND_NEW || c.WHITE || "#ffffff"},
            brandFg:{color:c.CONTROL_BRAND_FOREGROUND || c.TEXT_BRAND || c.BACKGROUND_BRAND || "#5865f2"},
            secondary:{backgroundColor:c.CONTROL_SECONDARY_BACKGROUND_DEFAULT}, secondaryText:{color:c.CONTROL_SECONDARY_TEXT_DEFAULT},
            segTrack:{backgroundColor:c.MOBILE_SEGMENTED_CONTROL_BACKGROUND || c.BACKGROUND_BASE_LOWEST},
            segIndicator:{backgroundColor:c.MOBILE_SEGMENTED_CONTROL_INDICATOR_BACKGROUND || c.BACKGROUND_MOD_STRONG},
            searchField:{backgroundColor:c.INPUT_BACKGROUND_DEFAULT || c.BACKGROUND_BASE_LOWEST},
            pickerCatBar:{backgroundColor:c.BACKGROUND_SURFACE_HIGH || c.CARD_BACKGROUND_DEFAULT, borderTopColor:c.BORDER_SUBTLE},
            sheet:Object.assign({}, PREVIEW_CHROME_DARK.sheet, {backgroundColor:c.MOBILE_ACTIONSHEET_BACKGROUND || c.BACKGROUND_BASE_LOW}),
            sheetRow:{backgroundColor:c.CARD_BACKGROUND_DEFAULT, borderColor:c.BORDER_SUBTLE}, modal:Object.assign({}, PREVIEW_CHROME_DARK.modal, {backgroundColor:c.MODAL_BACKGROUND}),
            scrim:{backgroundColor:c.BACKGROUND_SCRIM}, strip:Object.assign({}, PREVIEW_CHROME_DARK.strip, {backgroundColor:c.BACKGROUND_MOD_SUBTLE, borderTopColor:c.BORDER_SUBTLE}),
            track:{backgroundColor:c.PROGRESSBAR_TRACK_BACKGROUND || c.BACKGROUND_MOD_STRONG}, fill:{backgroundColor:c.PROGRESSBAR_INDICATOR_BACKGROUND || c.BACKGROUND_BRAND},
            mention:{backgroundColor:c.MENTION_BACKGROUND, color:c.MENTION_FOREGROUND},
            category:Object.assign({}, PREVIEW_CHROME_DARK.category, {color:c.TEXT_SUBTLE || c.TEXT_MUTED}), channel:{color:c.CHANNELS_DEFAULT || c.TEXT_MUTED},
            selected:{backgroundColor:c.MOBILE_CHANNEL_ITEM_BACKGROUND_SELECTED || c.BACKGROUND_MOD_NORMAL}, card:{backgroundColor:c.CARD_BACKGROUND_DEFAULT, borderColor:c.BORDER_MUTED || c.BORDER_SUBTLE}}),
            PREVIEW_CHROME_DARK);
    }
    // Discord's channel header: back arrow, the channel (or person) with its small right chevron, and circular 32px action buttons on the right.
    function previewHeader(k, props) {
        const Back = venusIcon(6205, "ArrowLargeLeftIcon"), Hash = venusIcon(15892, "HashmarkIcon"), Chevron = venusIcon(6906, "ChevronSmallRightIcon");
        return el(RN.View, {key:"header", style:k.header},
            el(RN.View, {style:{width:32, height:32, alignItems:"center", justifyContent:"center"}}, el(Back, {size:"md", color:k.icon.color})),
            el(RN.View, {style:{flex:1, flexDirection:"row", alignItems:"center", gap:8}},
                props.leading || el(Hash, {size:"sm", color:k.iconMuted.color}),
                el(RN.View, {style:{flex:1, flexDirection:"row", alignItems:"center", gap:4}},
                    el(RN.Text, {style:k.title, numberOfLines:1}, props.title),
                    props.badges || null,
                    el(Chevron, {size:"xxs", color:k.iconMuted.color}))),
            el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:8}},
                (props.icons || [[8196, "ThreadIcon"], [6740, "MagnifyingGlassIcon"]]).map(([id, name]) =>
                    el(RN.View, {key:name, style:k.headerPill}, el(venusIcon(id, name), {size:"sm", color:k.icon.color})))));
    }
    // Discord's message bar: the + button, the text pill with its gift and emoji/keyboard buttons, then the mic, or Send once there's text.
    function previewInput(k, s, props) {
        const Plus = venusIcon(10310, "PlusLargeIcon"), Gift = venusIcon(11540, "GiftIcon"),
            Expr = props.pickerOpen ? venusIcon(12822, "KeyboardIcon") : venusIcon(8956, "ReactionIcon"),
            Mic = venusIcon(11106, "MicrophoneIcon"), Send = venusIcon(5040, "SendMessageIcon"), Press = RN.Pressable || RN.View, text = props.text || "";
        const showGift = !text && !(features.hideGift && enabled("hideGift"));
        const exprIcon = el(RN.View, {style:{justifyContent:"center", alignItems:"center"}},
            el(Expr, {size:"sm", color:props.pickerOpen ? s.name.color : k.icon.color}), props.smileRipple || null);
        return el(RN.View, {key:"input"}, props.bar || null, props.above || null,
            el(RN.View, {style:k.inputRow},
                el(RN.View, {style:k.round}, el(Plus, {size:"sm", color:k.icon.color})),
                el(RN.View, {style:k.pill}, el(RN.Text, {style:[text ? s.text : s.muted, {flex:1, fontSize:15}], numberOfLines:1}, text || props.placeholder),
                    showGift ? el(Gift, {size:"sm", color:k.icon.color}) : null,
                    props.onSmile ? el(Press, {onPress:props.onSmile, accessibilityRole:"button",
                        accessibilityLabel:tr(props.pickerOpen ? "Close expression picker" : "Open expression picker"),
                        hitSlop:{top:8, bottom:8, left:8, right:8}}, exprIcon) : exprIcon),
                text ? popIn("send", el(RN.View, {style:k.send}, el(Send, {size:"sm", color:k.brandText.color}))) :
                    el(RN.View, {style:k.round}, el(Mic, {size:"sm", color:k.icon.color}))));
    }
    // The bar above the message box while replying or editing (ChatInputContextBar 12137): what it is, the @ ON toggle + vertical divider on replies, and the close X.
    function previewBar(k, s, Icon, text, onClose, key, mention) {
        const X = venusIcon(6208, "XSmallIcon"), At = venusIcon(8213, "AtIcon"), Press = RN.Pressable || RN.View;
        return el(RN.View, {key:key || "bar", style:k.bar},
            Icon ? popIn("icon:" + text, el(Icon, {size:"xs", color:k.icon.color})) : null,
            el(RN.Text, {style:[s.muted, {flex:1, fontSize:14, fontWeight:"500"}], numberOfLines:1}, text),
            mention ? el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:3}},
                el(At, {size:"xxs", color:k.brandFg.color}),
                el(RN.Text, {style:[k.brandFg, {fontSize:12, fontWeight:"700"}]}, "ON")) : null,
            mention && onClose ? el(RN.View, {style:[k.barDivider, {marginHorizontal:8}]}) : null,
            onClose ? el(Press, {onPress:onClose, accessibilityRole:"button", accessibilityLabel:tr("Cancel"), hitSlop:{top:8, bottom:8, left:8, right:8}},
                el(X, {size:"xs", color:k.icon.color})) : null);
    }
    // A preview's surface: Discord's chat colors, its header on top, and Watch's player strip at the bottom.
    function previewScreen(s, key, label, children, extra) {
        return el(RN.View, {key, style:[s.chat, {paddingVertical:0}], accessible:false, accessibilityLabel:tr(label)},
            extra && extra.header || null, el(RN.View, {style:{paddingVertical:4}}, children), extra && extra.footer || null);
    }
    // The progress bar of the player: glides from one tick to the next, stops where it is while paused.
    function StoryTrack(props) {
        const A = motion(), ref = React.useRef(null), story = props.story, k = props.k, total = story.total || 1;
        if (!ref.current && A) ref.current = new A.Value(0);
        const seg = story.segment;
        React.useEffect(() => {
            const value = ref.current;
            if (!value || !seg) return undefined;
            value.setValue(seg.from / total);
            if (reduceMotion || typeof A.timing !== "function") { value.setValue(seg.to / total); return undefined; }
            const run = A.timing(value, {toValue:seg.to / total, duration:seg.ms, useNativeDriver:false});
            run.start();
            return () => run.stop();
        }, [seg && seg.id]);
        const width = ref.current ? ref.current.interpolate({inputRange:[0, 1], outputRange:["0%", "100%"]}) : Math.round(story.t / total * 100) + "%";
        return el(RN.View, {style:[k.track, {flex:1, height:4, borderRadius:2, overflow:"hidden"}], accessible:true, accessibilityRole:"progressbar",
            accessibilityValue:{min:0, max:Math.round(total / 1000), now:Math.round(story.t / 1000)}},
            el(ref.current ? A.View : RN.View, {style:[k.fill, {position:"absolute", left:0, top:0, bottom:0, width}]}),
            story.chapters.map((at, i) => i ? el(RN.View, {key:"c" + i, style:{position:"absolute", top:0, bottom:0, width:2,
                left:(at / total * 100) + "%", backgroundColor:"#00000059"}}) : null));
    }
    // What Watch is showing (step 2 of 5), and the player: pause or play, the bar, the time, start over.
    function storyStrip(k, s, story) {
        const Press = RN.Pressable || RN.View, Play = venusIcon(8396, "PlayIcon"), Pause = venusIcon(8398, "PauseIcon"), Again = venusIcon(12627, "RetryIcon");
        const button = (key, Icon, label, onPress) => el(Press, {key, onPress, accessibilityRole:"button", accessibilityLabel:tr(label),
            hitSlop:{top:10, bottom:10, left:10, right:10}, style:{width:28, height:28, borderRadius:14, alignItems:"center", justifyContent:"center"}},
            el(Icon, {size:"xs", color:k.icon.color}));
        const steps = story.chapters.length;
        return el(RN.View, {key:"strip", style:[k.strip, {paddingHorizontal:12, paddingTop:10, paddingBottom:8, gap:8}]},
            el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:8, height:40}},
                steps ? el(RN.View, {style:[k.secondary, {borderRadius:8, paddingHorizontal:6, paddingVertical:2}]},
                    el(RN.Text, {style:[k.secondaryText, {fontSize:12, fontWeight:"700"}]}, Math.max(1, story.chapter) + "/" + steps)) : null,
                el(RN.View, {style:{flex:1, height:40, justifyContent:"center"}}, story.caption ? popIn("cap:" + story.caption,
                    el(RN.Text, {numberOfLines:2, style:[s.text, {fontSize:14, lineHeight:20}]}, story.caption)) : null)),
            el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:6}},
                story.playing ? button("pause", Pause, "Pause", story.pause) : button("play", Play, "Play", story.play),
                el(StoryTrack, {story, k}),
                el(RN.Text, {style:[s.muted, {fontSize:12, minWidth:72, textAlign:"right"}]}, clockText(story.t) + " / " + clockText(story.total)),
                button("again", Again, "Start over", story.replay)));
    }
    // A muted line under a preview.
    function previewCaption(s, text) {
        return text ? el(RN.View, {key:"hint", style:{paddingHorizontal:16, paddingTop:2}}, popIn("cap:" + text, el(RN.Text, {style:s.muted}, text))) : null;
    }
    // Shared by every option page: Discord's spacing and scrolling, with each group revealed in turn.
    function settingsBody(ui,groups,scroll) {
        const shown=groups.filter(Boolean).map((group,i) => typeof group==="object" ?
            el(VenusReveal,{key:group.key != null ? group.key : group.props && group.props.key != null ? group.props.key : "group"+i,index:i},group) : group);
        const body=ui.Stack ? el(ui.Stack,{style:{paddingVertical:24,paddingHorizontal:12},spacing:24},shown) :
            el(RN.View,{style:{paddingVertical:24,paddingHorizontal:12,gap:24}},shown);
        return RN.ScrollView ? el(RN.ScrollView,scroll || null,body) : body;
    }
    // Greyed out while the main switch is off, like the options on the Settings list.
    function switchRow(Switch,key,label,subLabel,icon) {
        const owner=featureFor(key);
        return Switch ? el(Switch,{key,label:tr(label),subLabel:subLabel && tr(subLabel),icon,value:settings[key],disabled:owner!==key && !settings[owner],
            onValueChange:value => { animateLayout(); setSetting(key,value); }}) : null;
    }
    // One choice from a few: Discord's radio list (TableRadioGroup 6263 / TableRadioRow 6262), or check-marked rows.
    // Each choice may carry a fourth item, its row icon (rowIcon), like Discord's own radio lists.
    function radioGroup(ui,key,title,setting,on,choices,raw) {
        title=tr(title); if (!raw) choices=choices.map(([value,label,subLabel,icon]) => [value,tr(label),subLabel && tr(subLabel),icon]);
        const RadioGroup=inspectedExport(6263,"TableRadioGroup"), RadioRow=inspectedExport(6262,"TableRadioRow");
        if (RadioGroup && RadioRow) return el(RadioGroup,{key,title,value:settings[setting],onChange:value => { if (value!==settings[setting]) haptic("SELECTION"); setSetting(setting,value); }},
            choices.map(([value,label,subLabel,icon]) => el(RadioRow,{key:value,value,label,subLabel,icon,disabled:!on})));
        return el(ui.TableRowGroup || RN.View,{key,title},choices.map(([value,label,subLabel,icon]) => ui.TableRow &&
            el(ui.TableRow,{key:value,label:(settings[setting]===value ? "\u2713 " : "")+label,subLabel,icon,disabled:!on,onPress:() => setSetting(setting,value)})));
    }
    // Small muted text under a page's groups: what else to know, without a row of its own.
    function footnote(key,text) {
        text=tr(text);
        const Text=inspectedExport(5088,"Text");
        return el(RN.View,{key,style:{paddingHorizontal:16}},
            Text ? el(Text,{variant:"text-xs/medium",color:"text-muted"},text) : el(RN.Text,{style:{color:"#949ba4",fontSize:12}},text));
    }
    // Discord's color tokens (587 colors) are objects that only createStyles turns into real colors for the current
    // theme. Each style set is made once, so a mounted page always calls the same hooks; the fallback is the dark theme.
    const themedHooks = new Map();
    function useThemed(name, make, fallback) {
        if (!themedHooks.has(name)) {
            const ui = reviewUI(), c = ui.colors;
            let hook = null;
            if (typeof ui.createStyles === "function" && c) try { hook = ui.createStyles(make(c)); } catch (_) { hook = null; }
            themedHooks.set(name, hook);
        }
        const hook = themedHooks.get(name);
        let styles = null;
        if (hook) try { styles = hook(); } catch (_) { styles = null; }
        return styles || fallback;
    }
    const STATUS_CARD_DARK = {card:{backgroundColor:"#2b2d31", borderRadius:16, paddingHorizontal:16, paddingVertical:14, flexDirection:"row", alignItems:"center", gap:14},
        badge:{width:40, height:40, borderRadius:20, alignItems:"center", justifyContent:"center", backgroundColor:"#4e50584d"}};
    // The card at the top of an option page: an optional icon or avatars, a bold title line and the details under it.
    function VenusStatusCard(props) {
        // Called straight from a page render (not as its own component), so its texts stay part of the page.
        const s = useThemed("statusCard", c => ({card:Object.assign({}, STATUS_CARD_DARK.card, {backgroundColor:c.CARD_BACKGROUND_DEFAULT}),
            badge:Object.assign({}, STATUS_CARD_DARK.badge, {backgroundColor:c.BACKGROUND_MOD_SUBTLE})}), STATUS_CARD_DARK);
        const Text = inspectedExport(5088, "Text"), Icon = props.IconComponent, title = props.title, body = props.body;
        const line = (value, variant, color, fallback) => Text ? el(Text, {variant, color}, value) : el(RN.Text, {style:fallback}, value);
        return el(RN.View, {key:props.key, style:s.card, accessible:true},
            // The badge pops in when the page opens, and again whenever the card's state (its title) changes.
            popIn("badge:" + (title || ""), props.leading || (Icon ? el(RN.View, {style:s.badge}, el(Icon, {size:"md"})) : null)),
            el(RN.View, {style:{flex:1, gap:2}},
                title ? line(title, "text-md/semibold", "text-strong", {color:"#f2f3f5", fontSize:16, fontWeight:"600"}) : null,
                body ? line(body, "text-sm/medium", title ? "text-muted" : "text-default", {color:title ? "#949ba4" : "#dbdee1", fontSize:14}) : null,
                props.footer || null),
            props.trailing || null);
    }
    // A thin rounded progress bar in the theme's brand color that glides to each new value.
    function VenusProgress(props) {
        const s = useThemed("progress", c => ({track:{height:6, borderRadius:3, overflow:"hidden", backgroundColor:c.BACKGROUND_MOD_STRONG || c.BACKGROUND_MOD_NORMAL},
            fill:{height:6, borderRadius:3, backgroundColor:c.BACKGROUND_BRAND || c.TEXT_BRAND}}),
            {track:{height:6, borderRadius:3, overflow:"hidden", backgroundColor:"#4e505899"}, fill:{height:6, borderRadius:3, backgroundColor:"#5865f2"}});
        const A = motion(), ref = React.useRef(null), share = Math.max(0, Math.min(1, Number(props.value) || 0));
        if (!ref.current && A) ref.current = new A.Value(reduceMotion ? share : 0);
        React.useEffect(() => {
            const value = ref.current;
            if (!value) return undefined;
            if (reduceMotion) { value.setValue(share); return undefined; }
            // Width can't run on the native driver; it's one small view, animated once per Quest update.
            const run = A.timing(value, {toValue:share, duration:600, easing:easeOut(), useNativeDriver:false});
            run.start();
            return () => run.stop();
        }, [share]);
        const width = ref.current ? ref.current.interpolate({inputRange:[0, 1], outputRange:["0%", "100%"]}) : Math.round(share * 100) + "%";
        return el(RN.View, {key:props.key, style:[s.track, {marginTop:8}], accessible:true, accessibilityRole:"progressbar",
            accessibilityValue:{min:0, max:100, now:Math.round(share * 100)}},
            el(ref.current ? A.View : RN.View, {style:[s.fill, {width}]}));
    }
    // A rounded card with live status, in the theme's card colors. extra: {title, IconComponent, leading}.
    function statusCard(key,text,extra) {
        return VenusStatusCard(Object.assign({key,body:tr(text)},extra));
    }
    // Pages share one look for "off": a muted title and the hint to switch it on.
    // With the feature's key, the card carries Discord's own switch, so you can turn it on right here instead of going back to
    // Features. The page fills in below as it turns on (animateLayout), and the switch gives Discord's own haptic tick.
    function offCard(key,IconComponent,feature) {
        const FormSwitch=feature && features[feature] ? inspectedExport(6897,"FormSwitch") : null;
        const title=tr("Turned off");
        return VenusStatusCard({key,title,IconComponent,body:tr(FormSwitch ? "Turn it on here to start." : "Switch it on in Features to start."),
            trailing:FormSwitch ? el(FormSwitch,{key:"switch:"+riskCancels,value:false,accessibilityLabel:title,onValueChange:value => { if (!value) return; if (RISKY_FEATURES[feature]) { turnOnAsking(feature,true); return; } animateLayout(); setSetting(feature,true); }}) : null});
    }
    // A small chat surface for page previews, in the theme's chat colors (same tokens as the Message highlights one).
    const CHAT_PREVIEW_DARK = {chat:{borderRadius:16, overflow:"hidden", backgroundColor:"#1a1a1e", borderWidth:1, borderColor:"#ffffff14", paddingVertical:8},
        name:{color:"#f2f3f5", fontSize:15, fontWeight:"600"}, text:{color:"#dbdee1", fontSize:15, lineHeight:20}, muted:{color:"#949ba4", fontSize:12},
        faded:{color:"#949ba4", fontSize:14, textDecorationLine:"line-through"}, quote:{borderLeftWidth:4, borderColor:"#4e5058", paddingLeft:8, marginTop:4}};
    function useChatPreviewStyles() {
        return useThemed("chatPreview", c => ({chat:Object.assign({}, CHAT_PREVIEW_DARK.chat, {backgroundColor:c.CHANNEL_BACKGROUND_DEFAULT || c.BACKGROUND_BASE_LOWER, borderColor:c.BORDER_SUBTLE}),
            name:Object.assign({}, CHAT_PREVIEW_DARK.name, {color:c.TEXT_STRONG}), text:Object.assign({}, CHAT_PREVIEW_DARK.text, {color:c.TEXT_DEFAULT}),
            muted:Object.assign({}, CHAT_PREVIEW_DARK.muted, {color:c.TEXT_MUTED}), faded:Object.assign({}, CHAT_PREVIEW_DARK.faded, {color:c.TEXT_MUTED}),
            quote:Object.assign({}, CHAT_PREVIEW_DARK.quote, {borderColor:c.BORDER_STRONG})}), CHAT_PREVIEW_DARK);
    }
    // One message in a preview: a 40px round letter avatar at 12px margin (64px start guideline), the name, timestamp (+8px) and body.
    function previewMessage(s, key, who, color, time, body, extra) {
        return el(RN.View, Object.assign({key, style:{paddingHorizontal:12, paddingVertical:6, flexDirection:"row", gap:12}}, extra),
            el(RN.View, {style:{width:40, height:40, borderRadius:20, backgroundColor:color, alignItems:"center", justifyContent:"center"}},
                el(RN.Text, {style:{color:"#ffffff", fontSize:16, fontWeight:"700"}}, who.slice(0, 1).toUpperCase())),
            el(RN.View, {style:{flex:1}},
                el(RN.View, {style:{flexDirection:"row", alignItems:"baseline", marginBottom:2}},
                    el(RN.Text, {style:extra && extra.nameColor ? [s.name, {color:extra.nameColor}] : s.name, numberOfLines:1}, who),
                    extra && extra.badges ? el(RN.View, {style:{marginLeft:4}}, extra.badges) : null,
                    el(RN.Text, {style:[s.muted, {marginLeft:8}]}, time)),
                body));
    }
    // Discord's own icon in a settings row (TableRowIcon 6188), the way its own settings pages show them.
    function rowIcon(id,name) {
        const RowIcon=inspectedExport(6188,"TableRowIcon");
        return RowIcon ? el(RowIcon,{IconComponent:venusIcon(id,name)}) : undefined;
    }
    // A group title on its own, above something that isn't a list of rows (TableRowGroupTitle 6265).
    function groupTitle(key,title) {
        const Title=inspectedExport(6265,"TableRowGroupTitle"), Text=inspectedExport(5088,"Text");
        return Title ? el(Title,{key,title:tr(title)}) : el(RN.View,{key,style:{paddingHorizontal:16}},
            Text ? el(Text,{variant:"text-sm/semibold",color:"text-muted"},tr(title)) : el(RN.Text,{style:{color:"#949ba4",fontSize:13,fontWeight:"600"}},tr(title)));
    }
    // The chosen pill of a segmented control, as one view that slides between choices with a soft spring.
    // It measures the track once; until then the pills draw their own background, so nothing ever flickers.
    const segmentMeasured = new Map();
    function SegmentedSlider(props) {
        const A = motion(), [width, setWidth] = React.useState(segmentMeasured.get(props.slot) || 0), ref = React.useRef(null);
        const pill = width ? (width - 4 * (props.count - 1)) / props.count : 0, target = props.index * (pill + 4);
        if (!ref.current) ref.current = {x:new A.Value(target), placed:!!pill};
        const state = ref.current;
        if (!state.placed && pill) { state.placed = true; state.x.setValue(target); }
        React.useEffect(() => {
            if (!pill) return undefined;
            if (!state.placed || reduceMotion || typeof A.spring !== "function") { state.placed = true; state.x.setValue(target); return undefined; }
            const run = A.spring(state.x, {toValue:target, speed:18, bounciness:6, useNativeDriver:true});
            run.start();
            return () => run.stop();
        }, [target, pill]);
        return el(RN.View, {pointerEvents:"none", style:{position:"absolute", left:4, right:4, top:4, bottom:4},
            onLayout:event => { const w = event && event.nativeEvent && event.nativeEvent.layout && event.nativeEvent.layout.width;
                if (w && Math.abs(w - width) > 0.5) { segmentMeasured.set(props.slot, w); setWidth(w); } }},
            pill ? el(A.View, {style:{position:"absolute", top:0, bottom:0, left:0, width:pill, borderRadius:20, backgroundColor:props.color,
                transform:[{translateX:state.x}]}}) : null);
    }
    // A choice of two to four, drawn like Discord's segmented control (its MOBILE_SEGMENTED_CONTROL tokens).
    function venusSegmented(props) {
        // -1 when the value isn't one of the pills (a custom number): no pill is shown as chosen.
        const index=props.items.findIndex(item => item.value===props.value);
        // Once its slider has measured the track, the chosen pill slides to the new choice instead of jumping.
        const slot=String(props.key)+":"+props.items.length, sliding=!!motion() && segmentMeasured.has(slot);
        const pick=i => { const item=props.items[i]; if (item && !props.disabled && item.value!==props.value) { haptic("IMPACT_MEDIUM"); if (!sliding) animateLayout(); props.onChange(item.value); } };
        const pill={flex:1,minWidth:0,paddingVertical:9,paddingHorizontal:8,borderRadius:20,alignItems:"center",justifyContent:"center"};
        const s=useThemed("segmented",c => ({wrap:{flexDirection:"row",padding:4,gap:4,borderRadius:24,backgroundColor:c.MOBILE_SEGMENTED_CONTROL_BACKGROUND},
            on:Object.assign({},pill,{backgroundColor:c.MOBILE_SEGMENTED_CONTROL_INDICATOR_BACKGROUND}),off:pill}),
            {wrap:{flexDirection:"row",padding:4,gap:4,borderRadius:24,backgroundColor:"#1e1f22"},on:Object.assign({},pill,{backgroundColor:"#4e5058"}),off:pill});
        const Text=inspectedExport(5088,"Text"), Press=RN.Pressable || RN.View;
        const indicator=s.on && s.on.backgroundColor;
        return el(RN.View,{key:props.key,style:[s.wrap,{opacity:props.disabled ? 0.5 : 1}],accessibilityRole:"tablist"},
            motion() && index>=0 ? el(SegmentedSlider,{key:"slider",slot,index,count:props.items.length,color:indicator}) : null,
            props.items.map((item,i) => el(Press,{key:String(item.value),style:i===index && !sliding ? s.on : s.off,accessibilityRole:"tab",accessibilityLabel:item.label,
                accessibilityState:{selected:i===index,disabled:!!props.disabled},disabled:!!props.disabled,onPress:() => pick(i)},
                Text ? el(Text,{variant:"text-sm/semibold",color:i===index ? "interactive-text-active" : "text-muted",lineClamp:1,style:{textAlign:"center"}},item.label) :
                    el(RN.Text,{numberOfLines:1,style:{color:i===index ? "#ffffff" : "#949ba4",fontWeight:"600",textAlign:"center"}},item.label))));
    }
    // Presets as Discord's segmented pills, and under them one Custom row that says what's in use: tap it for an inline
    // number box with Use. A custom value leaves every pill unselected, so they never claim a choice you didn't make.
    function PresetOrCustom(props) {
        const [editing, setEditing] = React.useState(false), [draft, setDraft] = React.useState("");
        const s = useThemed("presetCustom", c => ({row:{flexDirection:"row", alignItems:"center", gap:12, paddingHorizontal:16, paddingVertical:12,
            borderRadius:16, backgroundColor:c.CARD_BACKGROUND_DEFAULT}, chip:{paddingHorizontal:12, paddingVertical:5, borderRadius:12,
            backgroundColor:c.BACKGROUND_MOD_SUBTLE}, active:{backgroundColor:c.BACKGROUND_BRAND || "#5865f2"}}),
            {row:{flexDirection:"row", alignItems:"center", gap:12, paddingHorizontal:16, paddingVertical:12, borderRadius:16, backgroundColor:"#2b2d31"},
             chip:{paddingHorizontal:12, paddingVertical:5, borderRadius:12, backgroundColor:"#4e50584d"}, active:{backgroundColor:"#5865f2"}});
        const ui = reviewUI(), Text = inspectedExport(5088, "Text"), Press = RN.Pressable || RN.View, Pencil = venusIcon(9720, "PencilIcon");
        const value = props.value, preset = props.presets.some(item => item.value === value), on = !props.disabled;
        const label = (text, variant, color) => Text ? el(Text, {variant, color}, text) :
            el(RN.Text, {style:{color:color === "text-strong" ? "#f2f3f5" : color === "always-white" ? "#ffffff" : "#949ba4", fontSize:variant.indexOf("text-md") === 0 ? 16 : 13, fontWeight:"600"}}, text);
        const number = Number(draft), valid = draft !== "" && Number.isFinite(number) && number >= props.min && number <= props.max;
        const apply = () => { if (!on || !valid) return; haptic("SELECTION"); animateLayout(); props.onChange(number); setEditing(false); setDraft(""); };
        const open = () => { if (!on) return; animateLayout(); setDraft(String(value)); setEditing(true); };
        return el(RN.View, {key:props.key, style:{gap:10}},
            groupTitle("title", props.title),
            venusSegmented({key:props.key + ":pills", value:preset ? value : undefined, disabled:!on, onChange:next => { setEditing(false); props.onChange(next); }, items:props.presets}),
            el(Press, {accessibilityRole:"button", accessibilityLabel:tr("Custom"), disabled:!on || editing, onPress:open, style:[s.row, {opacity:on ? 1 : 0.5}]},
                el(Pencil, {size:"sm"}),
                el(RN.View, {style:{flex:1}}, label(tr("Custom"), "text-md/semibold", "text-strong"),
                    label(tr("{min} to {max}", {min:props.format(props.min), max:props.format(props.max)}), "text-sm/medium", "text-muted")),
                popIn("custom:" + (preset ? "off" : value), el(RN.View, {style:[s.chip, preset ? null : s.active]},
                    label(preset ? tr("Edit") : props.format(value), "text-sm/semibold", preset ? "text-muted" : "always-white")))),
            editing ? inputWithButton(ui, "input", {value:draft, label:props.inputLabel, keyboardType:"number-pad", maxLength:String(props.max).length,
                autoFocus:true, returnKeyType:"done", onSubmitEditing:apply, placeholder:String(props.placeholder), editable:on, isDisabled:!on},
                text => setDraft(String(text || "").replace(/[^0-9]/g, "")), "Use", apply, !valid) : null,
            props.hint ? footnote("hint", props.hint) : null);
    }
    // A text box with Discord's button (Button 5379) beside it, like its own "add" fields.
    function inputWithButton(ui,key,inputProps,onChange,buttonText,onPress,disabled) {
        const Button=inspectedExport(5379,"Button");
        const input=ui.TextInput ? el(ui.TextInput,Object.assign({onChange},inputProps)) :
            el(RN.TextInput,Object.assign({onChangeText:onChange,style:{fontSize:16,padding:12}},inputProps));
        const button=Button ? el(Button,{text:tr(buttonText),size:"md",variant:"primary",disabled:!!disabled,onPress}) :
            el(RN.Pressable || RN.View,{onPress:disabled ? undefined : onPress,accessibilityRole:"button",accessibilityLabel:tr(buttonText),disabled:!!disabled,
                style:{paddingHorizontal:16,height:40,borderRadius:20,justifyContent:"center",backgroundColor:"#5865f2",opacity:disabled ? 0.5 : 1}},
                el(RN.Text,{style:{color:"#ffffff",fontWeight:"600"}},tr(buttonText)));
        return el(RN.View,{key,style:{flexDirection:"row",alignItems:"flex-end",gap:8}},el(RN.View,{style:{flex:1}},input),button);
    }
    function hexInt(hex) { const m=/^#?([0-9a-f]{6})$/i.exec(String(hex || "").trim()); return m ? parseInt(m[1],16) : null; }
    function intHex(n) { return typeof n==="number" && isFinite(n) ? "#"+(n & 0xffffff).toString(16).padStart(6,"0") : null; }
    function isLightHex(hex) {
        const n=hexInt(hex); if (n==null) return false;
        return ((n >> 16 & 255) * 299 + (n >> 8 & 255) * 587 + (n & 255) * 114) / 1000 > 170;
    }
    // The colors Discord draws its own status dots in.
    const STATUS_HEX = {online:"#23a55a", idle:"#f0b232", dnd:"#f23f43", offline:"#80848e", invisible:"#80848e"};
    // A full-width row that does something once, like clearing what a feature saved.
    function actionRow(ui,key,label,subLabel,onPress,disabled,danger) {
        return ui.TableRow ? el(ui.TableRow,{key,label:tr(label),subLabel:subLabel && tr(subLabel),onPress,disabled:!!disabled,variant:danger ? "danger" : undefined}) : null;
    }
    function confirmAction(title,body,confirmText,onConfirm) {
        title=tr(title); body=tr(body); confirmText=tr(confirmText);
        const ui=reviewUI();
        if (ui.alerts && typeof ui.alerts.show==="function") try { ui.alerts.show({title,body,confirmText,cancelText:tr("Cancel"),onConfirm}); return; } catch (_) {}
        if (RN && RN.Alert) RN.Alert.alert(title,body,[{text:tr("Cancel"),style:"cancel"},{text:confirmText,style:"destructive",onPress:onConfirm}]);
    }
    function count(n,word) { return pl(n,"{n} "+word,"{n} "+word+"s"); }
    // Settings page: Discord's own radio list (TableRadioGroup 6263 / TableRadioRow 6262).
    // Hidden channels: one choice, whether tapping a locked channel shows its details or does nothing.
    // The locked channel in the preview: it gives a small shake when tapping does nothing (each time props.shake goes up).
    function HiddenPreviewRow(props) {
        const A = motion(), ref = React.useRef(null);
        if (!ref.current && A) ref.current = new A.Value(0);
        React.useEffect(() => {
            const value = ref.current;
            if (!props.shake || !value || reduceMotion || typeof A.sequence !== "function") return undefined;
            value.setValue(0);
            const run = A.sequence([1, -1, 1, 0].map(to => A.timing(value, {toValue:to, duration:60, useNativeDriver:true})));
            run.start();
            return () => run.stop();
        }, [props.shake]);
        const row = {flexDirection:"row", alignItems:"center", gap:8, paddingHorizontal:8, paddingVertical:7, marginHorizontal:8, borderRadius:8};
        const style = ref.current ? [row, {transform:[{translateX:ref.current.interpolate({inputRange:[-1, 1], outputRange:[-6, 6]})}]}] : row;
        return el(RN.View, {accessibilityLabel:props.label + ", " + tr("locked")},
            el(ref.current ? A.View : RN.View, {style}, props.children), props.ripple || null);
    }
    // A server's channel list the way Discord draws it: the server name, a category and its channels, the locked one with
    // Discord's own # and lock icon. While on, it plays: scrolling past it opens nothing, then a tap opens its details in
    // Discord's dialog (or nothing at all, when details are off).
    const HIDDEN_SAMPLE = {id:"1180000000000000000", guild_id:"1", type:0, name:"staff-only", lastMessageId:"1290000000000000000"};
    function HiddenChannelsPreview(props) {
        useSettings("hiddenChannels");
        const s = useChatPreviewStyles(), k = usePreviewChrome(), on = props.on, menu = settings.hiddenChannelsMenu;
        const Hash = venusIcon(15892, "HashmarkIcon"), TextLock = venusIcon(8201, "TextLockIcon"), Down = venusIcon(10534, "ChevronSmallDownIcon");
        const blank = {shake:0, pulse:null, card:false, scroll:0};
        const [state, setState] = React.useState(blank), watching = on;
        const update = change => setState(st => Object.assign({}, st, typeof change === "function" ? change(st) : change));
        const shake = () => update(st => ({shake:st.shake + 1}));
        const story = useStory(watching, () => [[0, () => setState(blank), tr("Locked channels show in the list with a lock, like staff-only here")],
            [1200, () => { animateLayout(); update({scroll:1}); }, tr("Scrolling past it, or opening the server, opens nothing")],
            [1400, () => { animateLayout(); update({scroll:0}); }],
            [1000, () => update(st => ({pulse:{who:"locked", id:"tap" + st.shake}})), tr(menu ? "Only a tap on it opens its details" : "You tap it")],
            [400, () => { if (menu) { animateLayout(); update({card:true}); } else shake(); },
                menu ? tr("You see when it was made and last used. View Anyway would open it") : tr("Nothing happens: you turned its details off")],
            [3000, () => { animateLayout(); update({card:false}); }], [600, () => {}]], [menu]);
        const channel = (name, locked, selected) => el(locked ? HiddenPreviewRow : RN.View, locked ?
            {key:name, label:name, shake:state.shake, ripple:tapRipple(state.pulse, "locked", {right:40, top:2})} :
            {key:name, style:[{flexDirection:"row", alignItems:"center", gap:8, paddingHorizontal:8, paddingVertical:7, marginHorizontal:8, borderRadius:8},
                selected ? k.selected : null]},
            el(locked ? TextLock : Hash, {size:"sm", color:selected ? s.name.color : locked ? k.iconMuted.color : k.channel.color}),
            el(RN.Text, {style:[s.text, {flex:1, color:selected ? s.name.color : k.channel.color, fontWeight:selected ? "600" : "500"}], numberOfLines:1}, name));
        // Discord's alert, drawn inside the preview while it plays: a title, the details and its two buttons.
        const button = (text, brand) => el(RN.View, {key:text, style:[brand ? k.brand : k.secondary, {borderRadius:20, paddingVertical:10, alignItems:"center"}]},
            el(RN.Text, {style:[brand ? k.brandText : k.secondaryText, {fontWeight:"600"}]}, text));
        const card = watching && state.card ? el(RN.View, {key:"card", style:[k.scrim, {position:"absolute", left:0, right:0, top:0, bottom:0, justifyContent:"center", padding:16}]},
            popIn("card", el(RN.View, {style:k.modal},
                el(RN.Text, {style:[s.name, {fontSize:18, fontWeight:"700", textAlign:"center"}]}, tr("Locked channel")),
                hiddenDetails(HIDDEN_SAMPLE).map(([label, stamp]) => el(RN.View, {key:label},
                    el(RN.Text, {style:[s.muted, {fontSize:11, fontWeight:"700"}]}, label.toUpperCase()), el(RN.Text, {style:s.text}, stamp.relative))),
                button(tr("View Anyway"), true), button(tr("Cancel"), false)))) : null;
        const list = el(RN.View, {key:"list", style:{paddingVertical:6, transform:state.scroll ? [{translateY:-14}] : []}},
            el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:4, paddingHorizontal:16, paddingVertical:6}},
                el(Down, {size:"xxs", color:k.category.color}), el(RN.Text, {style:k.category}, tr("Text channels").toUpperCase())),
            channel("general", false, true), on ? channel("staff-only", true) : null, channel("memes", false), channel("clips", false));
        const Chevron = venusIcon(6906, "ChevronSmallRightIcon"), Search = venusIcon(6740, "MagnifyingGlassIcon");
        const server = el(RN.View, {key:"server", style:[k.header, {height:52, paddingHorizontal:16}]},
            el(RN.View, {style:{flex:1, flexDirection:"row", alignItems:"center", gap:4}},
                el(RN.Text, {style:[k.title, {fontSize:18}], numberOfLines:1}, tr("Game Night")),
                el(Chevron, {size:"xxs", color:k.iconMuted.color})),
            el(RN.View, {style:k.headerPill}, el(Search, {size:"sm", color:k.icon.color})),
            el(RN.View, {style:k.headerPill}, el(venusIcon(9237, "MoreHorizontalIcon"), {size:"sm", color:k.icon.color})));
        return el(RN.View, {key:"preview"},
            previewScreen(s, "preview", "Hidden channels preview", [el(RN.View, {key:"body", style:{minHeight:210, overflow:"hidden"}}, list, card)],
                {header:server, footer:watching ? storyStrip(k, s, story) : null}));
    }
    function HiddenChannelsSettings() {
        useSettings("hiddenChannels");
        const ui=reviewUI();
        if (!React || !RN) return null;
        const on=enabled("hiddenChannels"), Group=ui.TableRowGroup || RN.View, Switch=ui.TableSwitchRow, lock=venusIcon(8218,"LockIcon");
        const groups=[
            on ? null : offCard("status",lock,"hiddenChannels"),
            el(HiddenChannelsPreview,{key:"preview",on}),
            el(Group,{key:"tap",title:tr("When you tap a locked channel")},
                switchRow(Switch,"hiddenChannelsMenu","Show its details","Shows when it was created, its last message and last pin, with View Anyway.",rowIcon(5046,"CircleInformationIcon"))),
            footnote("note","Only a tap opens it: scrolling past a locked channel, opening a server or opening Discord never does.")];
        return settingsBody(ui,groups);
    }
    // Server info's preview is the server list as Discord draws it: hold a server's icon, its menu opens with Server info
    // as the last row, and a tap shows the sheet with the sample server's details. It plays while the feature is on.
    const SERVER_SAMPLES = [["GN", "#5865f2", "Game Night"], ["AR", "#3ba55c", "Art Club"], ["WD", "#eb459e", "Wumpus Den"]];
    const SERVER_SAMPLE_FRIENDS = [{id:"a", username:"Alex"}, {id:"b", username:"Sam"}, {id:"c", username:"Jordan"}];
    function ServerInfoPreview(props) {
        useSettings("serverInfo");
        const s = useChatPreviewStyles(), k = usePreviewChrome(), si = useServerInfoStyles(), on = props.on;
        const blank = {held:false, menu:false, sheet:false, pulse:null, picked:false, n:0};
        const [state, setState] = React.useState(blank), watching = on;
        const update = change => setState(st => Object.assign({}, st, typeof change === "function" ? change(st) : change));
        const friends = settings.serverInfoFriends;
        const story = useStory(watching, () => [[0, () => setState(blank), tr("Hold a server's icon in the server list")],
            [900, () => update(st => ({held:true, pulse:{who:"icon", id:"hold" + (st.n + 1)}, n:st.n + 1}))],
            [500, () => { animateLayout(); update({menu:true}); }, tr("Its menu opens, with Server info at the bottom")],
            [1600, () => update({picked:true, pulse:{who:"row", id:"row"}}), tr("Tap Server info")],
            [400, () => { animateLayout(); update({menu:false, held:false, sheet:true, picked:false}); },
                tr(friends ? "Live details, boosts, the owner and which friends are there" : "Live details, boosts and the owner, with friends Discord has loaded")],
            [3600, () => { animateLayout(); update({sheet:false}); }], [600, () => {}]], [friends]);
        const icon = ([letters, color, name], i) => {
            const first = i === 0, held = first && state.held;
            return el(RN.View, {key:letters, accessibilityLabel:name, style:{alignItems:"center", justifyContent:"center", width:64, height:56}},
                held ? el(RN.View, {style:{position:"absolute", left:0, width:4, height:36, borderTopRightRadius:4, borderBottomRightRadius:4, backgroundColor:s.name.color}}) : null,
                el(RN.View, {style:{width:44, height:44, borderRadius:held ? 14 : 22, backgroundColor:color, alignItems:"center", justifyContent:"center",
                    transform:held ? [{scale:0.92}] : []}},
                    el(RN.Text, {style:{color:"#ffffff", fontSize:15, fontWeight:"700"}}, letters)),
                first ? tapRipple(state.pulse, "icon", {left:15, top:11}) : null);
        };
        const rail = el(RN.View, {key:"rail", style:{width:64, paddingVertical:6, alignItems:"center"}}, SERVER_SAMPLES.map(icon));
        const channels = el(RN.View, {key:"channels", style:{flex:1, paddingVertical:8, gap:2}},
            el(RN.Text, {style:[k.title, {fontSize:16, paddingHorizontal:12, paddingBottom:6}], numberOfLines:1}, tr("Game Night")),
            ["general", "clips", "memes"].map((name, i) => el(RN.View, {key:name, style:[{flexDirection:"row", alignItems:"center", gap:6, paddingHorizontal:10,
                paddingVertical:6, marginHorizontal:6, borderRadius:8}, i === 0 ? k.selected : null]},
                el(venusIcon(15892, "HashmarkIcon"), {size:"xs", color:k.channel.color}),
                el(RN.Text, {style:[s.text, {fontSize:14, color:i === 0 ? s.name.color : k.channel.color}]}, name))));
        const menuRow = (key, label, Icon, highlight) => el(RN.View, {key, style:[{flexDirection:"row", alignItems:"center", gap:12,
            paddingHorizontal:14, paddingVertical:10}, highlight && state.picked ? k.selected : null]},
            el(Icon, {size:"sm", color:k.icon.color}), el(RN.Text, {style:[s.text, {flex:1, fontSize:15}]}, label),
            highlight ? tapRipple(state.pulse, "row", {right:24, top:4}) : null);
        const overlay = (key, child) => el(RN.View, {key, style:[k.scrim, {position:"absolute", left:0, right:0, top:0, bottom:0, justifyContent:"flex-end"}]},
            el(RN.View, {style:{flex:1}}), child);
        // Discord's own rows in that menu, then ours, the way they really show.
        const menu = state.menu ? overlay("menu", popIn("menu", el(RN.View, {style:[k.sheet, {paddingHorizontal:8, paddingBottom:8}]},
            el(RN.View, {style:[k.sheetRow, {borderRadius:16, borderWidth:1, overflow:"hidden"}]},
                menuRow("invite", tr("Invite people"), venusIcon(5032, "UserPlusIcon")),
                menuRow("bell", tr("Notifications"), venusIcon(8768, "BellIcon")),
                menuRow("settings", tr("Settings"), venusIcon(7092, "SettingsIcon")),
                menuRow("info", tr("Server info"), venusIcon(5046, "CircleInformationIcon"), true))))) : null;
        const tile = (key, Icon, value, label) => el(RN.View, {key, style:[si.tile, {minWidth:0, flexBasis:"22%", paddingHorizontal:8, paddingVertical:8, gap:2, borderRadius:12}]},
            el(Icon, {size:"xs"}), el(RN.Text, {style:[s.name, {fontSize:16, fontWeight:"700"}]}, value),
            el(RN.Text, {style:[s.muted, {fontSize:11}], numberOfLines:1}, label));
        const sheet = state.sheet ? overlay("sheet", popIn("sheet", el(RN.View, {style:[k.sheet, {paddingHorizontal:10, paddingBottom:10, gap:8}]},
            el(RN.View, {style:{height:44, borderRadius:12, backgroundColor:"#5865f2", opacity:0.55}}),
            el(RN.View, {style:{flexDirection:"row", alignItems:"flex-end", gap:10, marginTop:-26, paddingHorizontal:8}},
                el(RN.View, {style:[si.ring, {width:52, height:52, borderRadius:18, borderWidth:3, backgroundColor:"#5865f2", alignItems:"center", justifyContent:"center"}]},
                    el(RN.Text, {style:{color:"#ffffff", fontSize:16, fontWeight:"700"}}, "GN")),
                el(RN.View, {style:{flex:1, paddingBottom:2}},
                    el(RN.Text, {style:[s.name, {fontSize:16, fontWeight:"700"}], numberOfLines:1}, tr("Game Night")),
                    el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:5}},
                        el(RN.View, {style:{width:8, height:8, borderRadius:4, backgroundColor:STATUS_HEX.online}}),
                        el(RN.Text, {style:[s.muted, {fontSize:12}], numberOfLines:1},
                            tr("{count} online", {count:serverNumber(318)}) + " \u00b7 " + serverCount(1284, "{n} member", "{n} members"))))),
            el(RN.View, {style:{flexDirection:"row", gap:6}},
                tile("c", venusIcon(15892, "HashmarkIcon"), serverNumber(24), tr("Channels")), tile("r", venusIcon(8617, "ShieldUserIcon"), serverNumber(12), tr("Roles")),
                tile("e", venusIcon(8956, "ReactionIcon"), serverNumber(48), tr("Emojis")), tile("b", venusIcon(16663, "BoostTier2Icon"), serverNumber(9), tr("Boosts"))),
            el(RN.View, {style:[si.card, {flexDirection:"row", alignItems:"center", gap:10, paddingVertical:10, borderRadius:12}]},
                friends ? avatarPile(SERVER_SAMPLE_FRIENDS, si.ring.borderColor) : el(venusIcon(4815, "FriendsIcon"), {size:"sm"}),
                el(RN.Text, {style:[s.text, {flex:1, fontSize:14}]}, serverCount(friends ? 3 : 1, "{n} friend here", "{n} friends here")),
                el(venusIcon(10262, "CrownIcon"), {size:"xs", color:"#f0b232"}))))) : null;
        return el(RN.View, {key:"preview"},
            previewScreen(s, "preview", "Server info preview",
                [el(RN.View, {key:"body", style:{minHeight:236, flexDirection:"row", overflow:"hidden"}}, rail, channels, menu, sheet)],
                {footer:watching ? storyStrip(k, s, story) : null}));
    }
    function ServerInfoSettings() {
        useSettings("serverInfo");
        const ui = reviewUI();
        if (!React || !RN) return null;
        const on = enabled("serverInfo"), Group = ui.TableRowGroup || RN.View, Switch = ui.TableSwitchRow;
        const groups = [
            on ? null : offCard("status", venusIcon(5046, "CircleInformationIcon"), "serverInfo"),
            el(ServerInfoPreview, {key:"preview", on}),
            el(Group, {key:"friends", title:tr("Friends")},
                switchRow(Switch, "serverInfoFriends", "Look up friends in the server", "Asks Discord which of your friends are members when you open it.", rowIcon(4815, "FriendsIcon"))),
            footnote("note", "Everything else comes from what Discord has already loaded, and updates while the sheet is open.")];
        return settingsBody(ui, groups);
    }
    function ReadAllSettings() {
        useSettings("readAll");
        const ui=reviewUI();
        if (!React || !RN) return null;
        const on=enabled("readAll");
        const groups=[
            on ? null : offCard("status",venusIcon(15928,"DoubleCheckmarkIcon"), "readAll"),
            radioGroup(ui,"mode","When you tap Read all","readAllMode",on,[["guilds","Servers","Marks every unread server as read.",rowIcon(9239,"ServerIcon")],
                ["dms","Direct messages","Marks every unread DM and group DM as read.",rowIcon(6770,"EnvelopeIcon")],
                ["both","Servers and DMs","Marks everything as read in one tap.",rowIcon(15928,"DoubleCheckmarkIcon")]]),
            footnote("note","Hold the button to pick just once, without changing this.")];
        return settingsBody(ui,groups);
    }
    // Nitro stickers and emojis: what a sent emoji looks like with each link style, then the switches.
    // The preview's emoji and sticker are Discord's own Wumpus art, shipped inside the app (drawable resources, loaded by
    // name like Discord's own images), so nothing is read from your servers and nothing is downloaded.
    const NITRO_SAMPLES = {emoji:{name:"wumpus_wave", res:"modules_guilds_bar_native_images_wumpus_wave", size:48, glyph:"\ud83d\udc4b"},
        sticker:{name:"Wumpus Surprise", res:"images_native_gifting_wumpus_box_premium120", size:140, glyph:"\ud83c\udf81"}};
    // Each one moves the way an animated emoji or sticker does: the emoji waves, the sticker hops. Tap to play it again.
    function NitroArt(props) {
        const A = motion(), ref = React.useRef(null), [failed, setFailed] = React.useState(false), item = props.item;
        if (!ref.current && A) ref.current = new A.Value(0);
        React.useEffect(() => {
            const value = ref.current;
            if (!value || reduceMotion || typeof A.sequence !== "function") return undefined;
            value.setValue(0);
            const run = props.kind === "emoji" ?
                A.sequence([0.6, -0.6, 0.6, -0.6, 0].map(to => A.timing(value, {toValue:to, duration:130, useNativeDriver:true}))) :
                A.sequence([A.timing(value, {toValue:1, duration:170, easing:easeOut(), useNativeDriver:true}),
                    A.spring(value, {toValue:0, speed:14, bounciness:14, useNativeDriver:true})]);
            run.start();
            return () => run.stop();
        }, [props.kind, props.play]);
        const motionStyle = !ref.current ? null : props.kind === "emoji" ?
            {transform:[{rotate:ref.current.interpolate({inputRange:[-1, 1], outputRange:["-18deg", "18deg"]})}]} :
            {transform:[{translateY:ref.current.interpolate({inputRange:[0, 1], outputRange:[0, -14]})},
                {scale:ref.current.interpolate({inputRange:[0, 1], outputRange:[1, 1.06]})}]};
        const art = !failed && RN.Image ? el(RN.Image, {source:{uri:item.res, width:item.size, height:item.size}, style:{width:item.size, height:item.size},
            resizeMode:"contain", accessibilityLabel:item.name, onError:() => setFailed(true)}) :
            el(RN.Text, {style:{fontSize:Math.round(item.size * 0.75), lineHeight:item.size}}, item.glyph);
        return el(ref.current ? A.View : RN.View, {style:motionStyle}, art);
    }
    // The message as everyone sees it: just the emoji or sticker, the way chat shows a link to one.
    // While on, it plays: you tap the emoji button in the message bar, pick a Nitro emoji from another server (unlocked
    // by Venus, so there's no lock icon on it), it's sent and everyone sees it; then the same with a sticker.
    function NitroPicker(props) {
        const k = props.k, s = props.s, Down = venusIcon(10534, "ChevronSmallDownIcon"),
            Search = venusIcon(6740, "MagnifyingGlassIcon"), Nitro = venusIcon(9031, "NitroWheelIcon"),
            Smile = venusIcon(8956, "ReactionIcon"), Sticker = venusIcon(12274, "StickerIcon"), Backspace = venusIcon(9578, "BackspaceIcon");
        const kinds = props.kinds, tab = props.tab, item = NITRO_SAMPLES[tab];
        const tabPill = (kind, label, enabledTab) => {
            const active = tab === kind;
            return el(RN.View, {key:kind, accessibilityRole:"tab", accessibilityState:{selected:active, disabled:!enabledTab},
                style:[{flex:1, paddingVertical:6, borderRadius:16, alignItems:"center", opacity:enabledTab ? 1 : 0.45}, active ? k.segIndicator : null]},
                el(RN.Text, {style:[active ? {color:s.name.color} : s.muted, {fontWeight:"600", fontSize:13}]}, label));
        };
        const plain = kind => kind === "emoji" ? ["\ud83d\ude00", "\ud83d\ude02", "\ud83d\udc4d", "\ud83c\udf89", "\ud83d\udd25", "\u2728"] : [];
        return el(RN.View, {key:"picker", style:[k.sheet, {borderTopLeftRadius:16, borderTopRightRadius:16, paddingTop:8, paddingBottom:0, gap:8}]},
            el(RN.View, {style:{alignSelf:"center", width:36, height:4, borderRadius:2, backgroundColor:"#80848e66"}}),
            el(RN.View, {style:[k.segTrack, {flexDirection:"row", padding:3, gap:3, borderRadius:20, marginHorizontal:12}]},
                tabPill("emoji", tr("Emojis"), kinds.includes("emoji")),
                tabPill("gif", tr("GIFs"), false),
                tabPill("sticker", tr("Stickers"), kinds.includes("sticker"))),
            el(RN.View, {style:[k.searchField, {flexDirection:"row", alignItems:"center", gap:8, height:36, borderRadius:18, paddingHorizontal:12, marginHorizontal:12}]},
                el(Search, {size:"xs", color:k.iconMuted.color}),
                el(RN.Text, {style:[s.muted, {flex:1, fontSize:14}], numberOfLines:1}, tr(tab === "emoji" ? "Find the perfect emoji" : "Find the perfect sticker"))),
            el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:4, paddingHorizontal:12, marginTop:2}},
                el(Down, {size:"xxs", color:k.category.color}),
                el(RN.Text, {style:k.category}, tr("Game Night").toUpperCase()),
                el(Nitro, {size:"xxs", color:k.brandFg.color})),
            el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:8, flexWrap:"wrap", paddingHorizontal:12, paddingBottom:4}},
                el(RN.View, {key:"nitro", accessibilityLabel:item.name,
                    style:[{padding:6, borderRadius:10, borderWidth:1.5, borderColor:k.brandFg.color + "66", backgroundColor:k.brandFg.color + "14"}, props.highlight ? k.selected : null]},
                    el(RN.View, {style:{width:tab === "emoji" ? 33 : 64, height:tab === "emoji" ? 33 : 64, alignItems:"center", justifyContent:"center"}},
                        RN.Image ? el(RN.Image, {source:{uri:item.res, width:tab === "emoji" ? 33 : 64, height:tab === "emoji" ? 33 : 64},
                            style:{width:tab === "emoji" ? 33 : 64, height:tab === "emoji" ? 33 : 64}, resizeMode:"contain"}) :
                            el(RN.Text, {style:{fontSize:tab === "emoji" ? 26 : 48}}, item.glyph)),
                    tapRipple(props.pulse, "pick", {left:0, top:0})),
                plain(tab).map(e => el(RN.View, {key:e, style:{width:45, height:45, alignItems:"center", justifyContent:"center"}},
                    el(RN.Text, {style:{fontSize:28}}, e)))),
            el(RN.View, {style:[k.pickerCatBar, {flexDirection:"row", alignItems:"center", height:40, paddingHorizontal:12, gap:14, borderTopWidth:1}]},
                el(RN.View, {style:[k.selected, {width:28, height:28, borderRadius:14, alignItems:"center", justifyContent:"center"}]},
                    el(RN.Text, {style:{color:s.name.color, fontSize:12, fontWeight:"700"}}, "G")),
                el(tab === "emoji" ? Smile : Sticker, {size:"xs", color:k.iconMuted.color}),
                el(RN.View, {style:{flex:1}}),
                tab === "emoji" ? el(Backspace, {size:"xs", color:k.icon.color}) : null));
    }
    function NitroPreview(props) {
        useSettings("freeNitro");
        const s = useChatPreviewStyles(), k = usePreviewChrome(), on = props.on;
        const blank = {pick:0, sent:[], picker:null, pulse:null};
        const kinds = [settings.emojis && "emoji", settings.stickers && "sticker"].filter(Boolean);
        const [state, setState] = React.useState(blank), watching = on && kinds.length > 0;
        const update = change => setState(st => Object.assign({}, st, typeof change === "function" ? change(st) : change));
        const send = kind => update(st => ({picker:null, pulse:null, pick:st.pick + 1, sent:st.sent.concat([kind]).slice(-2)}));
        const link = settings.hyperlinks ? tr("a short link") : tr("a link");
        const story = useStory(watching, () => {
            const steps = [[0, () => setState(blank)]];
            kinds.forEach((kind, i) => {
                steps.push([i ? 600 : 900, () => update({pulse:{who:"smile", id:kind}}), tr(kind === "emoji" ? "You open the emoji picker" : i ? "Then you open the sticker picker" : "You open the sticker picker")],
                    [400, () => { animateLayout(); update({picker:kind}); }],
                    [1400, () => update({pulse:{who:"pick", id:"p" + kind}}), tr(kind === "emoji" ? "You pick a Nitro emoji from another server. Venus unlocks it so there's no lock" :
                        "You pick a Nitro sticker. Venus unlocks it too")],
                    [500, () => { animateLayout(); send(kind); }, tr(kind === "emoji" ? "Venus sends it as {link}, and everyone sees the emoji" : "It's sent as {link} too, and everyone sees the sticker", {link})],
                    [1200, () => {}]);
            });
            return steps;
        }, [settings.emojis, settings.stickers, settings.hyperlinks]);
        // Not playing (off, or nothing to send as links): the finished chat, so the page still shows what it does.
        const tab = watching ? state.picker : null, sent = watching ? state.sent : kinds.length ? kinds : ["emoji"];
        const messages = sent.map((kind, i) => el(RN.View, {key:"msg" + state.pick + ":" + i}, popIn("msg" + i + kind + state.pick,
            previewMessage(s, "m" + i, tr("You"), "#5865f2", tr("Today at 4:01 PM"), el(RN.View, {style:{alignItems:"flex-start", paddingTop:2}},
                el(NitroArt, {key:kind, kind, item:NITRO_SAMPLES[kind], play:state.pick}))))));
        const last = sent[sent.length - 1], item = last && NITRO_SAMPLES[last];
        const sentAs = item ? el(RN.View, {key:"sent", style:{paddingHorizontal:16, paddingBottom:4}},
            el(RN.Text, {style:s.muted, numberOfLines:1}, tr("Sent as {link}", {link:settings.hyperlinks ? "[" + item.name + "](\u2026)" :
                last === "emoji" ? "https://cdn.discordapp.com/emojis/\u2026.gif" : "https://media.discordapp.net/stickers/\u2026.png"}))) : null;
        const picker = tab ? el(NitroPicker, {key:"picker", k, s, kinds, tab, pulse:state.pulse, highlight:state.pulse && state.pulse.who === "pick"}) : null;
        return el(RN.View, {key:"preview"},
            previewScreen(s, "preview", "Nitro link preview", [el(RN.View, {key:"chat", style:{minHeight:watching ? 140 : 96}}, messages), sentAs],
                {header:previewHeader(k, {title:"general"}),
                 footer:el(RN.View, {key:"foot"}, previewInput(k, s, {placeholder:tr("Message {channel}", {channel:"#general"}),
                    pickerOpen:!!tab, smileRipple:tapRipple(state.pulse, "smile", {left:-7, top:-7})}),
                    picker, watching ? storyStrip(k, s, story) : null)}));
    }
    function FreeNitroSettings() {
        useSettings("freeNitro");
        const ui=reviewUI();
        if (!React || !RN) return null;
        const on=enabled("freeNitro"), Group=ui.TableRowGroup || RN.View, Switch=ui.TableSwitchRow, hasAny=!!(settings.emojis || settings.stickers);
        const groups=[
            !on ? offCard("status",venusIcon(9031,"NitroWheelIcon"), "freeNitro") : !hasAny ? statusCard("status","Turn on emojis or stickers below.",
                {title:tr("Sending as links"),IconComponent:venusIcon(9031,"NitroWheelIcon")}) : null,
            el(NitroPreview,{key:"preview",on}),
            el(Group,{key:"send",title:tr("Send as links")},
                switchRow(Switch,"emojis","Emojis","Emojis from other servers, and animated emojis.",rowIcon(12901,"ChatSmileIcon")),
                switchRow(Switch,"stickers","Stickers","Stickers from other servers. Animated ones may not move.",rowIcon(12274,"StickerIcon"))),
            el(Group,{key:"style",title:tr("Link style")},
                switchRow(Switch,"hyperlinks","Short links","In chat it looks the same either way. Short links only change what's copied or quoted.",rowIcon(5038,"LinkIcon"))),
            footnote("note","Everyone sees the image, but it's a link, not a real Nitro emoji or sticker.")];
        return settingsBody(ui,groups);
    }
    // Fix link previews: a sent link and the preview everyone sees, for the site picked in the row of marks above it.
    // While on, it plays: you paste a link to a post, tap Send, Venus changes the address and the post's preview opens
    // under it. Off: the finished message, so the page always shows the result.
    const FIX_SAMPLES = {x:"/wumpus/status/1846602926837096812", instagram:"/reel/C5nYWo0P5yK/", tiktok:"/@wumpus/video/7137423965982592302",
        reddit:"/r/discordapp/comments/1g5x4b0/", bluesky:"/profile/wumpus.bsky.social/post/3l6oveex3ii2l", threads:"/@wumpus/post/DGkNlhDyGm9",
        facebook:"/reel/1180000000000000", pixiv:"/artworks/123456789", bilibili:"/video/BV1xx411c7mD"};
    const FIX_VIDEO = {x:true, instagram:true, tiktok:true, facebook:true, bilibili:true};
    const FIX_PREVIEW_DARK = {link:{color:"#00a8fc"}, embed:{backgroundColor:"#2b2d31", borderColor:"#ffffff14"}, ring:{borderColor:"#5865f2"}};
    function useFixStyles() {
        return useThemed("fixEmbeds", c => ({link:{color:c.TEXT_LINK || "#00a8fc"}, embed:{backgroundColor:c.BACKGROUND_SURFACE_HIGH || c.CARD_BACKGROUND_DEFAULT, borderColor:c.BORDER_SUBTLE},
            ring:{borderColor:c.BACKGROUND_BRAND || "#5865f2"}}), FIX_PREVIEW_DARK);
    }
    // A site's own mark (Discord ships the brand icons it uses for connected accounts), white on its brand color.
    // Sites Discord has no icon for get their letter.
    function fixBadge(site, size) {
        const Icon = Array.isArray(site.icon) ? venusIcon(site.icon[0], site.icon[1]) : null, dark = site.color === "#000000" || site.color === "#101010";
        return el(RN.View, {style:{width:size, height:size, borderRadius:size / 2, alignItems:"center", justifyContent:"center", backgroundColor:site.color,
            borderWidth:dark ? 1 : 0, borderColor:"#ffffff26"}},
            Icon ? el(Icon, {size:size >= 36 ? "sm" : size >= 24 ? "xs" : "xxs", color:"#ffffff"}) :
                el(RN.Text, {style:{color:"#ffffff", fontWeight:"800", fontSize:Math.round(size * 0.45)}}, site.icon));
    }
    function FixEmbedsPreview(props) {
        useSettings("fixEmbeds");
        const s = useChatPreviewStyles(), k = usePreviewChrome(), f = useFixStyles(), on = !!props.on;
        if (!fixEmbeds.sites) fixTables();
        const [siteId, setSiteId] = React.useState("x");
        const site = fixEmbeds.sites[siteId], live = fixService(site), service = live || site.services[0];
        const host = site.hosts[0], sample = FIX_SAMPLES[siteId], original = "https://" + host + sample;
        const fixed = live ? (fixLink(host, sample, false) || {link:original}).link : original;
        const blank = {text:"", sent:false, embed:false, pulse:null};
        const [state, setState] = React.useState(blank), watching = on;
        const update = change => setState(st => Object.assign({}, st, change));
        const story = useStory(watching, () => [
            [0, () => setState(blank), tr("You paste a link to a post on {site}", {site:site.name})],
            [700, () => update({text:original.slice(0, 22)})], [250, () => update({text:original})],
            [1300, () => update({pulse:{who:"send", id:siteId}}), tr("You tap Send")],
            [350, () => { animateLayout(); update({text:"", sent:true}); },
                live ? tr("Venus sends it through {service}", {service:service.name}) : tr("{site} is off, so the link is sent as written", {site:site.name})],
            live ? [900, () => { animateLayout(); update({embed:true}); }, tr("Everyone sees the post, with its picture or video")] : null,
            [1600, () => {}]], [siteId, service.id, !!live]);
        const view = watching ? state : {text:"", sent:true, embed:!!live};
        const pick = id => {
            if (id === siteId) return;
            haptic("SELECTION"); animateLayout(); setSiteId(id); setState(blank);
        };
        const Press = RN.Pressable || RN.View, Play = venusIcon(8396, "PlayIcon"), Picture = venusIcon(8210, "ImageIcon");
        const media = el(RN.View, {style:{height:118, borderRadius:8, marginTop:8, overflow:"hidden", backgroundColor:site.color, alignItems:"center", justifyContent:"center"}},
            el(RN.View, {style:{position:"absolute", left:0, right:0, bottom:0, height:59, backgroundColor:"#00000040"}}),
            el(RN.View, {style:{position:"absolute", right:-24, top:-24, width:96, height:96, borderRadius:48, backgroundColor:"#ffffff1f"}}),
            el(RN.View, {style:{width:44, height:44, borderRadius:22, alignItems:"center", justifyContent:"center", backgroundColor:"#00000080"}},
                el(FIX_VIDEO[siteId] ? Play : Picture, {size:"sm", color:"#ffffff"})));
        const embed = el(RN.View, {style:[f.embed, {marginTop:6, borderRadius:8, borderWidth:1, borderLeftWidth:4, borderLeftColor:site.color, padding:12, maxWidth:320}]},
            el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:6, marginBottom:4}}, fixBadge(site, 16),
                el(RN.Text, {style:[s.muted, {fontWeight:"600"}], numberOfLines:1}, site.name)),
            el(RN.Text, {style:[s.name, {fontSize:14}], numberOfLines:1}, "Wumpus (@wumpus)"),
            el(RN.Text, {style:[s.text, {fontSize:14, marginTop:2}], numberOfLines:2}, tr("Just beat the final boss on my first try!")),
            media);
        const body = el(RN.View, null, el(RN.Text, {style:[f.link, {fontSize:15}], numberOfLines:2}, fixed), view.embed ? popIn("embed:" + siteId, embed) : null);
        const rows = fixRows();
        const marks = el(RN.ScrollView || RN.View, {key:"sites", horizontal:true, showsHorizontalScrollIndicator:false, accessibilityRole:"tablist",
            contentContainerStyle:{gap:6, paddingHorizontal:10, paddingVertical:8}},
            rows.map(row => { const item = fixEmbeds.sites[row[0]], picked = row[0] === siteId;
                return el(Press, {key:row[0], onPress:() => pick(row[0]), accessibilityRole:"tab", accessibilityLabel:item.name, accessibilityState:{selected:picked},
                    hitSlop:{top:4, bottom:4}, style:[{padding:2, borderRadius:20, borderWidth:2, borderColor:"transparent"}, picked ? f.ring : null, fixService(item) ? null : {opacity:0.4}]},
                    fixBadge(item, 30)); }));
        const input = previewInput(k, s, {placeholder:tr("Message {channel}", {channel:"#general"}), text:view.text});
        const message = view.sent ? popIn("msg:" + siteId + ":" + !!live, previewMessage(s, "msg", tr("You"), "#5865f2", tr("Today at 4:01 PM"), body)) :
            el(RN.View, {key:"empty", style:{paddingHorizontal:16, paddingVertical:24}}, el(RN.Text, {style:[s.muted, {textAlign:"center"}]}, tr("Nothing sent yet")));
        return el(RN.View, {key:"preview"},
            previewScreen(s, "preview", "Link preview", [marks,
                // Steady height, so picking a site with a shorter preview never makes the page jump.
                el(RN.View, {key:"chat", style:{height:268, justifyContent:"flex-end", overflow:"hidden"}}, message)],
                {header:previewHeader(k, {title:"general"}),
                 footer:el(RN.View, {key:"foot"},
                    el(RN.View, null, input, tapRipple(state.pulse, "send", {right:10, top:11})),
                    watching ? storyStrip(k, s, story) : null)}));
    }
    // Every site in one card: its mark, where its links go and a switch. A site with more than one service opens a choice under it.
    const FIX_LIST_DARK = {card:{backgroundColor:"#2b2d31", borderRadius:16, overflow:"hidden"}, divider:{height:1, marginLeft:68, backgroundColor:"#ffffff0f"}};
    function FixSiteList(props) {
        useSettings("fixEmbeds");
        const [open, setOpen] = React.useState(null), on = !!props.on;
        const s = useThemed("fixSites", c => ({card:Object.assign({}, FIX_LIST_DARK.card, {backgroundColor:c.CARD_BACKGROUND_DEFAULT}),
            divider:Object.assign({}, FIX_LIST_DARK.divider, {backgroundColor:c.BORDER_SUBTLE})}), FIX_LIST_DARK);
        const Text = inspectedExport(5088, "Text"), FormSwitch = inspectedExport(6897, "FormSwitch"), Press = RN.Pressable || RN.View;
        const Down = venusIcon(10534, "ChevronSmallDownIcon"), Right = venusIcon(6906, "ChevronSmallRightIcon");
        const line = (value, variant, color, fallback) => Text ? el(Text, {variant, color, lineClamp:1}, value) : el(RN.Text, {style:fallback, numberOfLines:1}, value);
        const rows = fixRows(), choices = fixChoices(settings.fixEmbedsSites), active = rows.filter(row => choices[row[0]] !== "off").length, out = [];
        rows.forEach((row, i) => {
            const site = fixEmbeds.sites[row[0]], service = fixService(site), many = site.services.length > 1, expanded = open === site.id && !!service && many && on;
            const to = service ? typeof service.to === "string" ? service.to.replace(/^https:\/\/([^\/]+).*$/, "$1") : service.to[site.hosts[0]] : "";
            if (i) out.push(el(RN.View, {key:"d" + i, style:s.divider}));
            const toggleOpen = () => { if (!on || !service || !many) return; haptic("SELECTION"); animateLayout(); setOpen(expanded ? null : site.id); };
            out.push(el(Press, {key:site.id, onPress:toggleOpen, disabled:!on || !service || !many, accessibilityRole:many && service ? "button" : undefined,
                accessibilityLabel:site.name, accessibilityState:{expanded}, style:{flexDirection:"row", alignItems:"center", gap:12, paddingHorizontal:16, paddingVertical:12, opacity:on ? 1 : 0.5}},
                el(RN.View, {style:{opacity:service ? 1 : 0.4}}, fixBadge(site, 40)),
                el(RN.View, {style:{flex:1, gap:2}},
                    line(site.name, "text-md/semibold", "text-strong", {color:"#f2f3f5", fontSize:16, fontWeight:"600"}),
                    line(service ? service.name + " \u00b7 " + to : tr("Sent as written"), "text-sm/medium", "text-muted", {color:"#949ba4", fontSize:14})),
                many && service && on ? el(expanded ? Down : Right, {size:"sm"}) : null,
                FormSwitch ? el(FormSwitch, {value:!!service, disabled:!on, accessibilityLabel:site.name,
                    onValueChange:value => { animateLayout(); if (!value && open === site.id) setOpen(null); fixSetChoice(site.id, value ? site.services[0].id : "off"); }}) : null));
            if (expanded) out.push(el(RN.View, {key:site.id + ":pick", style:{paddingRight:16, paddingBottom:14, paddingLeft:68}},
                venusSegmented({key:"fix:" + site.id, value:service.id, onChange:value => fixSetChoice(site.id, value),
                    items:site.services.map(item => ({value:item.id, label:item.name}))})));
        });
        return el(RN.View, {key:"sites", style:{gap:8}},
            groupTitle("title", tr("Sites") + " \u00b7 " + tr("{on} of {total} turned on", {on:active, total:rows.length})),
            el(RN.View, {style:s.card}, out),
            footnote("hint", "Tap a site to choose its service. If a preview doesn't show, another service may work."));
    }
    function TenorSettings() {
        useSettings("tenorGifs");
        const ui = reviewUI();
        if (!React || !RN) return null;
        const on = enabled("tenorGifs"), Icon = venusIcon(9748, "GifIcon");
        const groups = [
            !on ? offCard("status", Icon, "tenorGifs") : tenor.down ? statusCard("status", "Discord's own GIFs show until it answers again.",
                {title:tr("Tenor isn't answering"), IconComponent:venusIcon(8204, "ImageWarningIcon")}) : null,
            radioGroup(ui, "source", "GIFs from", "tenorGifsSource", on, [
                ["both", "Tenor and Discord's GIFs", "Tenor's come first, with Discord's mixed in, so you get the most choice.", rowIcon(11587, "ImagesIcon")],
                ["tenor", "Only Tenor", "Search, trending and categories all come from Tenor, like before.", rowIcon(8210, "ImageIcon")]]),
            footnote("note", "What you search for goes to Tenor, without your Discord account. GIFs you pick are sent as tenor.com links, which play for everyone.")];
        return settingsBody(ui, groups);
    }
    function FixEmbedsSettings() {
        useSettings("fixEmbeds");
        const ui = reviewUI();
        if (!React || !RN) return null;
        const on = enabled("fixEmbeds"), Group = ui.TableRowGroup || RN.View, Switch = ui.TableSwitchRow, Icon = venusIcon(12910, "EmbedIcon");
        const choices = fixChoices(settings.fixEmbedsSites), none = !fixRows().some(row => choices[row[0]] !== "off");
        const changed = settings.fixEmbedsSites !== "" || !settings.fixEmbedsClean;
        const groups = [
            !on ? offCard("status", Icon, "fixEmbeds") : none ? statusCard("status", "Turn on a site below.", {title:tr("No sites turned on"), IconComponent:Icon}) :
                fixEmbeds.count ? statusCard("status", pl(fixEmbeds.count, "Fixed {n} link since Discord opened.", "Fixed {n} links since Discord opened."),
                    {title:tr("Fixing links"), IconComponent:Icon}) : null,
            el(FixEmbedsPreview, {key:"preview", on}),
            el(FixSiteList, {key:"sites", on}),
            el(Group, {key:"privacy", title:tr("Privacy")},
                switchRow(Switch, "fixEmbedsClean", "Remove tracking from links", "Drops share IDs like ?igsh= and ?si= from the links Venus fixes.", rowIcon(10410, "ShieldIcon"))),
            changed ? el(Group, {key:"manage", title:tr("Manage")}, actionRow(ui, "reset", "Reset to defaults", "Every site on, through its first service.", () =>
                confirmAction("Reset to defaults?", "Every site goes back to its first service, and tracking is removed again.", "Reset", () => {
                    animateLayout(); setSetting("fixEmbedsSites", ""); setSetting("fixEmbedsClean", true); }), !on, true)) : null,
            footnote("note", "Only the link changes, and only when you send or edit a message. Links in code or in <angle brackets> are sent as written.")];
        return settingsBody(ui, groups);
    }
    // Pastel names: a live chat preview showing names in their own pastel color (and Sam with a role color).
    // The switches below (Replace role colors, Color message text) update the preview live.
    function PastelPreview(props) {
        useSettings("pastelize");
        const s=useChatPreviewStyles(), k=usePreviewChrome(), on=!!props.on;
        const tint=(seed,sat,light,fallback) => { const c=on && pastelColor(seed,sat,light); return c ? c.hex : fallback; };
        const people=[["Alex","#3ba55c",tr("Has anyone tried the new update?"),null],["Sam","#eb459e",tr("Yes, it looks great!"),"#e67e22"],["Jordan","#faa61a",tr("Same here.")]];
        const chat=people.map(([who,avatar,text,role],i) => {
            const kept=role && !settings.pastelAll;
            const name=kept ? role : tint(who,0.75,0.6,s.name.color);
            const body=on && settings.pastelContent && !kept ? tint(who,0.85,0.75,null) : null;
            return el(RN.View,{key:who},previewMessage(s,who,who,avatar,tr(["Today at 4:01 PM","Today at 4:03 PM","Today at 4:05 PM"][i]),
                el(RN.Text,{style:body ? [s.text,{color:body}] : s.text},text),{nameColor:name}));
        });
        return el(RN.View,{key:"preview"},
            previewScreen(s,"preview","Pastel names preview",[el(RN.View,{key:"chat"},chat)],
                {header:previewHeader(k,{title:"general"}),
                 footer:previewInput(k,s,{placeholder:tr("Message {channel}",{channel:"#general"})})}));
    }
    function PastelSettings() {
        useSettings("pastelize");
        const ui=reviewUI();
        if (!React || !RN) return null;
        const on=enabled("pastelize"), Group=ui.TableRowGroup || RN.View, Switch=ui.TableSwitchRow;
        const groups=[
            on ? null : offCard("status",venusIcon(15560,"PaintPaletteIcon"), "pastelize"),
            el(PastelPreview,{key:"preview",on}),
            el(Group,{key:"colors",title:tr("Colors")},
                switchRow(Switch,"pastelAll","Replace role colors","Every name uses its pastel color, even with a role color.",rowIcon(10262,"CrownIcon")),
                switchRow(Switch,"pastelContent","Color message text","What people write is colored too, in a lighter shade of their name.",rowIcon(8203,"TextIcon"))),
            footnote("note","Each person always gets the same color, on every device.")];
        return settingsBody(ui,groups);
    }
    // Device indicators: the icons shown where Discord shows them, inside the screen around them: a DM's header, the
    // member list and a profile, each following its own switch. Pick the screen, or change Alex's devices to see them update.
    const PLATFORM_DEMO = [{desktop:"online", mobile:"idle"}, {mobile:"online"}, {desktop:"dnd", web:"dnd"}, {embedded:"online", desktop:"idle"}];
    const PLATFORM_SCREENS = [["piDmHeader"], ["piUserList"], ["piProfile"]];
    const PLATFORM_PEOPLE = [["Sam", "#eb459e", {desktop:"online"}], ["Riley", "#faa61a", {mobile:"online"}]];
    // Discord's segmented control inside a preview, as its own component so its theme hook only runs while it's shown.
    function PreviewSegmented(props) { return venusSegmented(props); }
    function PlatformPreview(props) {
        useSettings("platformIndicators");
        const s = useChatPreviewStyles(), k = usePreviewChrome(), Press = RN.Pressable || RN.View;
        const blank = {demo:0, screen:"piDmHeader", pulse:null};
        const [state, setState] = React.useState(blank), demo = state.demo, on = props.on;
        const update = change => setState(st => Object.assign({}, st, typeof change === "function" ? change(st) : change));
        const shown = key => on && settings[key];
        const clients = PLATFORM_DEMO[demo % PLATFORM_DEMO.length];
        const statusOf = c => c.desktop || c.mobile || c.web || c.embedded || "offline";
        const icons = (place, c, keyed) => shown(place) ? popIn(place + ":" + (keyed || "") + demo, el(RN.View, {style:{flexDirection:"row", gap:2, alignItems:"center"}},
            Object.keys(c).map(platform => el(RN.View, {key:platform, accessible:true, accessibilityLabel:tr(PLATFORM_LABELS[platform]) + ": " + tr(PLATFORM_STATUS[c[platform]])},
                el(PlatformPng, {platform, color:PLATFORM_COLORS[c[platform]]}))))) : null;
        // Discord's avatar: a status dot, or a small phone instead when the only device is a phone (unless hidden).
        const avatar = (letter, color, c, size, ring) => {
            const mobileOnly = !!c.mobile && Object.keys(c).length === 1, phone = mobileOnly && !(on && settings.piHideMobile), dot = Math.round(size * 0.3);
            return el(RN.View, {style:{width:size, height:size}},
                el(RN.View, {style:{width:size, height:size, borderRadius:size / 2, backgroundColor:color, alignItems:"center", justifyContent:"center"}},
                    el(RN.Text, {style:{color:"#ffffff", fontWeight:"700", fontSize:Math.round(size * 0.42)}}, letter)),
                el(RN.View, {style:{position:"absolute", right:-2, bottom:-2, padding:Math.max(2, Math.round(size / 24)), borderRadius:size, backgroundColor:ring || s.chat.backgroundColor}},
                    phone ? el(RN.View, {style:{width:Math.round(dot * 0.72), height:Math.round(dot * 1.1), borderRadius:2, backgroundColor:STATUS_HEX[statusOf(c)]}}) :
                        el(RN.View, {style:{width:dot, height:dot, borderRadius:dot / 2, backgroundColor:STATUS_HEX[statusOf(c)]}})));
        };
        const ripple = tapRipple(state.pulse, "alex", {left:12, top:4});
        const screen = state.screen, Text = RN.Text;
        // A DM with Alex: Discord's header with the icons next to the name, a short chat and the message bar.
        const dm = () => [
            el(RN.View, {key:"msgs", style:{paddingTop:4}},
                previewMessage(s, "a1", "Alex", "#3ba55c", tr("Today at 4:01 PM"), el(Text, {style:s.text}, tr("Are you coming to the game tonight?"))),
                previewMessage(s, "a2", tr("You"), "#5865f2", tr("Today at 4:02 PM"), el(Text, {style:s.text}, tr("Yes, see you there!")))),
            previewInput(k, s, {placeholder:tr("Message {channel}", {channel:"@Alex"})})];
        const dmHeader = () => el(RN.View, {key:"hd"}, previewHeader(k, {title:"Alex", leading:avatar("A", "#3ba55c", clients, 32, k.header.backgroundColor),
            badges:icons("piDmHeader", clients), icons:[[9317, "PhoneCallIcon"], [10771, "VideoIcon"], [6740, "MagnifyingGlassIcon"]]}), ripple);
        // The member list: Discord's "Online — 3" header and a row per person, status under the name.
        const memberRow = (name, color, c, alex) => el(RN.View, {key:name, style:[{flexDirection:"row", alignItems:"center", gap:12, paddingHorizontal:16, paddingVertical:6},
            alex ? {marginHorizontal:8, paddingHorizontal:8, borderRadius:8} : null]},
            avatar(name.slice(0, 1), color, c, 32), el(RN.View, {style:{flex:1}},
                el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:6}}, el(Text, {style:[s.name, {fontSize:15}], numberOfLines:1}, name), icons("piUserList", c, name)),
                el(Text, {style:s.muted}, tr(PLATFORM_STATUS[statusOf(c)] || "Online"))), alex ? ripple : null);
        const list = () => [el(RN.View, {key:"members", style:{paddingTop:6, paddingBottom:8}},
            el(Text, {style:[k.category, {paddingHorizontal:16, paddingBottom:4}]}, tr("Online").toUpperCase() + " \u2014 3"),
            memberRow("Alex", "#3ba55c", clients, true), PLATFORM_PEOPLE.map(([n, color, c]) => memberRow(n, color, c, false)))];
        // A profile: Discord's banner, the 80px avatar with 6px cutout overlapping it, the name with the icons and action buttons.
        const profile = () => [el(RN.View, {key:"profile"},
            el(RN.View, {style:{height:68, backgroundColor:"#2d7d46"}}),
            el(RN.View, {style:{paddingHorizontal:16, marginTop:-42, gap:6, paddingBottom:12}},
                el(RN.View, {style:{alignSelf:"flex-start", padding:6, borderRadius:46, backgroundColor:s.chat.backgroundColor}}, avatar("A", "#3ba55c", clients, 72), ripple),
                el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:8, marginTop:2}}, el(Text, {style:[s.name, {fontSize:22, fontWeight:"800"}]}, "Alex"), icons("piProfile", clients)),
                el(Text, {style:[s.muted, {fontSize:14, fontWeight:"600"}]}, "alex"),
                el(RN.View, {style:{flexDirection:"row", gap:8, marginTop:4}},
                    el(RN.View, {style:[k.brand, {flex:1, borderRadius:20, paddingVertical:10, alignItems:"center", flexDirection:"row", justifyContent:"center", gap:8}]},
                        el(venusIcon(8194, "ChatIcon"), {size:"sm", color:k.brandText.color}), el(Text, {style:[k.brandText, {fontWeight:"600"}]}, tr("Message"))),
                    el(RN.View, {style:[k.secondary, {width:40, height:40, borderRadius:20, alignItems:"center", justifyContent:"center"}]},
                        el(venusIcon(9317, "PhoneCallIcon"), {size:"sm", color:k.secondaryText.color})),
                    el(RN.View, {style:[k.secondary, {width:40, height:40, borderRadius:20, alignItems:"center", justifyContent:"center"}]},
                        el(venusIcon(10771, "VideoIcon"), {size:"sm", color:k.secondaryText.color})))))];
        const body = screen === "piDmHeader" ? dm() : screen === "piUserList" ? list() : profile();
        const header = screen === "piDmHeader" ? dmHeader() : screen === "piUserList" ? previewHeader(k, {title:"general"}) : null;
        const off = on && !settings[screen] ? el(RN.View, {key:"off", style:{marginHorizontal:12, marginBottom:8, padding:10, borderRadius:8, backgroundColor:"#4e505833"}},
            el(Text, {style:[s.muted, {fontSize:13}]}, tr("Off in your options: no icons here"))) : null;
        const now = Object.keys(clients).map(platform => tr(PLATFORM_LABELS[platform]) + " (" + tr(PLATFORM_STATUS[clients[platform]]) + ")").join(", ");
        const tryBar = on ? el(RN.View, {key:"try", style:[k.strip, {padding:12, gap:10}]},
            el(PreviewSegmented, {key:"platformScreen", value:screen, onChange:value => update({screen:value}),
                items:PLATFORM_SCREENS.map(([key]) => ({value:key, label:tr(key === "piDmHeader" ? "DM" : key === "piUserList" ? "Members" : "Profile")}))}),
            el(Press, {onPress:() => { animateLayout(); update(st => ({demo:st.demo + 1, pulse:{who:"alex", id:"t" + (st.demo + 1)}})); },
                accessibilityRole:"button", accessibilityHint:tr("Tap to change Alex's devices"),
                style:[k.secondary, {borderRadius:20, paddingVertical:10, flexDirection:"row", alignItems:"center", justifyContent:"center", gap:8}]},
                el(venusIcon(15232, "LaptopPhoneIcon"), {size:"sm", color:k.secondaryText.color}),
                el(Text, {style:[k.secondaryText, {fontWeight:"600"}]}, tr("Change Alex's devices"))),
            el(Text, {style:[s.muted, {fontSize:13}]}, tr("Alex is on: {devices}", {devices:now}))) : null;
        return el(RN.View, {key:"preview"},
            previewScreen(s, "preview", "Device indicators preview", [el(RN.View, {key:"screen:" + screen, style:{minHeight:236}}, popIn("screen:" + screen,
                el(RN.View, null, body))), off],
                {header, footer:tryBar}));
    }
    function PlatformSettings() {
        useSettings("platformIndicators");
        const ui=reviewUI();
        if (!React || !RN) return null;
        const on=enabled("platformIndicators"), Group=ui.TableRowGroup || RN.View, Switch=ui.TableSwitchRow;
        const hasPlace=!!(settings.piDmHeader || settings.piUserList || settings.piProfile);
        const groups=[
            !on ? offCard("status",venusIcon(15232,"LaptopPhoneIcon"), "platformIndicators") : !hasPlace ? statusCard("status","Turn on at least one place below.",
                {title:tr("Device indicators"),IconComponent:venusIcon(15232,"LaptopPhoneIcon")}) : null,
            el(PlatformPreview,{key:"preview",on}),
            el(Group,{key:"where",title:tr("Show icons")},
                switchRow(Switch,"piDmHeader","In DMs","Next to the name at the top of a DM.",rowIcon(6770,"EnvelopeIcon")),
                switchRow(Switch,"piUserList","In lists","Member list, friends, DM list and voice channels.",rowIcon(8212,"GroupIcon")),
                switchRow(Switch,"piProfile","On profiles","Next to the name on a profile.",rowIcon(11382,"UserIcon"))),
            el(Group,{key:"avatars",title:tr("Avatars")},
                switchRow(Switch,"piHideMobile","Hide the phone badge","Avatars show a plain status dot, since the icons already show mobile.",rowIcon(6642,"MobilePhoneIcon"))),
            footnote("note","Icons are colored by status on each device: desktop, mobile, web, console or VR.")];
        return settingsBody(ui,groups);
    }
    const highlightProcessed = new Map();
    const highlightRecent = new Map();
    function highlightColorHex(choice, defaultHex) {
        if (typeof choice !== "string" || choice === "default") return defaultHex;
        const clean = normalizeHighlightColor(choice);
        return clean.startsWith("#") ? clean : HIGHLIGHT_COLOR_MAP[clean] || defaultHex;
    }
    const highlightPairCache = new Map();
    function highlightCustomPair(choice, defaultHex, mult, alpha) {
        alpha = alpha || "1a";
        if (!RN || typeof RN.processColor !== "function") return null;
        if (highlightPairCache.owner !== RN.processColor) {
            highlightPairCache.clear();
            highlightPairCache.owner = RN.processColor;
        }
        const key = choice + ":" + defaultHex + ":" + mult + ":" + alpha;
        const cached = highlightPairCache.get(key);
        if (cached !== undefined) return cached;
        const hex = highlightColorHex(choice, defaultHex);
        const gutter = highlightProcess(hex);
        const background = highlightProcess(hex + alpha);
        const pair = gutter == null || background == null ? null : {backgroundColor:background, gutterColor:highlightEncodeGutter(gutter, mult)};
        highlightPairCache.set(key, pair);
        return pair;
    }
    function highlightProcess(colorStr) {
        if (!RN || typeof RN.processColor !== "function") return null;
        if (highlightProcessed.owner !== RN.processColor) {
            highlightProcessed.clear();
            highlightProcessed.owner = RN.processColor;
        }
        if (highlightProcessed.has(colorStr)) return highlightProcessed.get(colorStr);
        let value = null;
        try { value = RN.processColor(colorStr); } catch (_) {}
        if (value != null) highlightProcessed.set(colorStr, value);
        return value;
    }
    function highlightEncodeGutter(colorInt, mult) {
        if (typeof colorInt !== "number") return colorInt;
        if (!Number.isFinite(mult) || mult <= 1) return colorInt;
        const m = Math.max(2, Math.min(8, Math.floor(mult)));
        return ((256 - m) << 24) | (colorInt & 0x00ffffff);
    }
    function highlightMentioned(source, message) {
        if (!source || typeof source !== "object") return !!(message && message.mentioned);
        if (source.mentioned || message && message.mentioned || source.mention_everyone || source.mentionEveryone) return true;
        const mentions = source.mentions;
        const hasMentions = mentions && mentions.length > 0 && Array.isArray(mentions);
        const ref = source.referenced_message || source.referencedMessage && source.referencedMessage.message;
        const refAuthor = ref && ref.author && ref.author.id;
        // A role you have (@Moderators) is a mention too, the same as Discord's own highlight: ask its isRawMessageMentioned
        // (5632), which also knows which roles are yours in that server. It used to be skipped, so those rows lost the ping color.
        const roles = source.mention_roles || source.mentionRoles;
        if (roles && roles.length > 0 && highlightRoleMentioned(source)) return true;
        if (!hasMentions && !refAuthor) return false;
        const me = currentUser();
        const myId = me && me.id;
        if (!myId) return false;
        if (refAuthor === myId) return true;
        if (hasMentions) for (let i = 0; i < mentions.length; i++) {
            const u = mentions[i];
            if (u && (u === myId || u.id === myId)) return true;
        }
        return false;
    }
    function highlightRoleMentioned(source) {
        const me = currentUser(), check = inspectedExport(5632, "isRawMessageMentioned");
        if (!me || !me.id || typeof check !== "function") return false;
        // isRawMessageMentioned reads channel_id/mention_roles; a MessageRecord has the camelCase names instead. Only roles
        // are asked about here: everyone and user mentions are already checked above.
        const raw = {channel_id:source.channel_id || source.channelId, mention_roles:source.mention_roles || source.mentionRoles,
            mention_everyone:false, mentions:[]};
        try { return !!check({rawMessage:raw, userId:me.id, suppressEveryone:true, suppressRoles:false}); } catch (_) { return false; }
    }
    function highlightRemember(channelId, id, source) {
        if (!features.messageHighlight || typeof channelId !== "string" || !channelId || typeof id !== "string" || !id) return;
        const key = channelId + ":" + id;
        const existing = highlightRecent.get(key);
        if (existing && existing.source === source) return;
        if (existing) highlightRecent.delete(key);
        else if (highlightRecent.size >= 80) highlightRecent.delete(highlightRecent.keys().next().value);
        highlightRecent.set(key, {
            channelId,
            id,
            source,
            content:source && typeof source.content === "string" ? source.content : "",
            embeds:source && Array.isArray(source.embeds) ? source.embeds : null,
            components:source && Array.isArray(source.components) ? source.components : null
        });
    }
    function messageHighlightRedraw() {
        let d = dispatcher;
        if (!d) {
            const mod = inspectedExport(584, "default");
            if (mod && typeof mod.dispatch === "function") d = mod.dispatch.bind(mod);
        }
        if (typeof d !== "function" || !highlightRecent.size) return;
        const entries = Array.from(highlightRecent.values());
        entries.forEach(entry => {
            let live = null;
            try { if (msgStore && typeof msgStore.getMessage === "function") live = msgStore.getMessage(entry.channelId, entry.id); } catch (_) {}
            const content = live && typeof live.content === "string" ? live.content : entry.content;
            const embeds = live && Array.isArray(live.embeds) ? live.embeds : entry.embeds;
            const components = live && Array.isArray(live.components) ? live.components : entry.components;
            const restore = {id:entry.id, channel_id:entry.channelId};
            if (embeds && embeds.length) restore.embeds = embeds.slice();
            if (components && components.length) restore.components = components.slice();
            if (content) {
                restore.content = content;
                const temp = Object.assign({}, restore, {content:content + "\u200b"});
                try { d({type:"MESSAGE_UPDATE", message:temp}); } catch (_) {}
                later(() => { try { d({type:"MESSAGE_UPDATE", message:restore}); } catch (_) {} }, 60);
            } else if (restore.embeds || restore.components) {
                try { d({type:"MESSAGE_UPDATE", message:restore}); } catch (_) {}
            }
        });
    }
    function messageRow(orig, self, args) { return messageRowResult(orig.apply(self, args), args[0]); }
    // generate(row) is called once per chat row as you scroll: skip the arguments object (2.3x).
    messageRow.call1 = (orig, self, row) => messageRowResult(orig.call(self, row), row);
    function messageRowResult(result, row) {
        if (!result || !row || row.rowType !== 1 || !result.message) return result;
        const pastelOn = enabled("pastelize"), translateOn = enabled("translate"), noDeleteOn = enabled("noDelete"), highlightOn = enabled("messageHighlight");
        let message = result.message;
        if (pastelOn) message = pastelMessage(message,row.message);
        if (features.pastelize && message.referencedMessage && message.referencedMessage.message) {
            const reply = pastelReply(message.referencedMessage.message);
            if (reply !== message.referencedMessage.message) message = Object.assign({},message,{referencedMessage:Object.assign({},message.referencedMessage,{message:reply})});
        }
        let next = message === result.message ? result : Object.assign({},result,{message});
        if (!translateOn && !features.translate && !(noDeleteOn && (edits.size || deleted.size)) && !highlightOn && !features.messageHighlight) return next;
        const source = row.message || message;
        const channelId = source.channel_id || source.channelId || message.channelId;
        const id = source.id || message.id;
        // Before edit history, so the crossed-out old versions above it stay as they were written.
        if (translateOn) {
            let shown = translateRow(next.message, source, channelId, id);
            if (shown.referencedMessage) shown = translateReply(shown, source, channelId, id);
            if (shown !== next.message) next = Object.assign({},next,{message:shown});
        } else if (features.translate) translateSeen(source, channelId, id, null);
        if (edits.size && noDeleteOn) {
            const shown = withEditHistory(next.message, channelId, id);
            if (shown !== next.message) next = Object.assign({},next,{message:shown});
        }
        const bucket = deleted.size && noDeleteOn && deletedByChannel.get(channelId);
        const isDeletedRow = !!(bucket && bucket.has(deletedKey(channelId,id)));
        const needHighlightCheck = highlightOn || features.messageHighlight;
        const isMentionRow = !isDeletedRow && needHighlightCheck && highlightMentioned(source, next.message);
        if (features.messageHighlight && (isDeletedRow || isMentionRow || next.backgroundHighlight))
            highlightRemember(channelId, id, source);
        const mult = highlightOn ? settings.messageHighlightThickness : 1;
        if (isDeletedRow && RN && typeof RN.processColor === "function") {
            // Native row highlight schema from RowGeneratorConstants (7743). No injected notice, altered
            // message content, or AutoMod state. Only retained local rows are tinted.
            // Its color and brightness are NoDelete's own (Keep deleted messages page); only the bar width is Message highlights'.
            const custom = highlightCustomPair(settings.noDeleteColor, "#f23f43", mult, highlightAlpha(settings.noDeleteBrightness));
            if (custom) next = Object.assign({},next,{backgroundHighlight:custom});
        } else if (highlightOn && RN && typeof RN.processColor === "function") {
            const existing = next.backgroundHighlight;
            // A custom color or brightness repaints the row; Discord's own yellow at Normal keeps its own highlight.
            if (isMentionRow && (settings.messageHighlightPingColor !== "default" || settings.messageHighlightBrightness !== 50)) {
                const custom = highlightCustomPair(settings.messageHighlightPingColor, "#f0b232", mult, highlightAlpha(settings.messageHighlightBrightness));
                if (custom) next = Object.assign({},next,{backgroundHighlight:custom});
            } else if (existing && typeof existing.gutterColor === "number" && mult > 1) {
                next = Object.assign({},next,{backgroundHighlight:Object.assign({},existing,{gutterColor:highlightEncodeGutter(existing.gutterColor, mult)})});
            }
        }
        return next;
    }
    // Deferred retention bookkeeping; runs immediately where timers are absent.
    function later(fn, ms, immediate) { if (typeof global.setTimeout === "function") return global.setTimeout(fn, ms); if (immediate !== false) fn(); return undefined; }
    function inspectedExport(id, key) {
        // Demand-load only a verified bundled helper at the UI action/render boundary.
        // No module scans, remote scripts, or eager initialization of unrelated screens.
        if (typeof global.__r !== "function") return null;
        try { const exports = global.__r(id); return exports && exports[key]; } catch (_) { return null; }
    }
    const PLATFORM_COLORS = {online:"#23a55a",idle:"#f0b232",dnd:"#f23f43"};
    const PLATFORM_LABELS = {desktop:"Desktop",mobile:"Mobile",web:"Web",embedded:"Console",vr:"VR"};
    const PLATFORM_STATUS = {online:"Online",idle:"Idle",dnd:"Do Not Disturb"};
    // This user's clients as a stable key, so a badge only re-renders when its own presence changes.
    function platformClients(userId, myId) {
        let clients = presenceStore.getClientStatus(userId);
        if (myId === undefined) {
            const current = userStore && userStore.getCurrentUser();
            myId = current && current.id;
        }
        if (myId && myId === userId && sessionsStore && typeof sessionsStore.getSessions === "function") {
            clients = {};
            const sessions = sessionsStore.getSessions();
            if (sessions) for (const k in sessions) {
                if (Object.prototype.hasOwnProperty.call(sessions, k)) {
                    const session = sessions[k];
                    const client = session && session.clientInfo && session.clientInfo.client;
                    if (client && client !== "unknown") clients[client] = session.status;
                }
            }
        }
        return clients || null;
    }
    function clientsKey(clients) {
        if (!clients) return "";
        let key = "";
        for (const name in clients) key += name + ":" + clients[name] + ",";
        return key;
    }
    function platformKey(userId, myId) { return clientsKey(presenceStore && platformClients(userId, myId)); }
    // One listener per store for every badge on screen, not two per badge. Each change works
    // out a person's clients once, however many badges show them, and wakes only those badges.
    const platformSubs = new Map(), platformStores = new Set();
    // PresenceStore changes for every presence update of anyone: the key is built without temporary arrays.
    function platformChanged() {
        if (!platformSubs.size) return;
        const current = userStore && userStore.getCurrentUser();
        const myId = current && current.id || null;
        platformSubs.forEach((entry, userId) => {
            const key = platformKey(userId, myId);
            if (key !== entry.key) { entry.key = key; entry.fns.forEach(fn => fn()); }
        });
    }
    function platformSubscribe(userId, fn) {
        let entry = platformSubs.get(userId);
        if (!entry) platformSubs.set(userId, entry = {key:platformKey(userId), fns:new Set()});
        entry.fns.add(fn);
        [presenceStore,sessionsStore].forEach(store => {
            if (store && !platformStores.has(store) && typeof store.addChangeListener === "function" && typeof store.removeChangeListener === "function") {
                platformStores.add(store); store.addChangeListener(platformChanged);
            }
        });
        return () => {
            entry.fns.delete(fn);
            if (!entry.fns.size && platformSubs.get(userId) === entry) platformSubs.delete(userId);
            if (!platformSubs.size) { platformStores.forEach(store => store.removeChangeListener(platformChanged)); platformStores.clear(); }
        };
    }
    function PlatformBadges(props) {
        useSettings("platformIndicators");
        const [,update] = React.useState(0);
        // SessionsStore is the upstream source for the current user's own clients.
        if (enabled("platformIndicators")) {
            if (!sessionsStore) sessionsStore = inspectedExport(5112,"default");
            if (!presenceStore) presenceStore = inspectedExport(5108,"default");
            if (!userStore) userStore = inspectedExport(1390,"default");
        }
        const userId = props.userId;
        React.useEffect(() => platformSubscribe(userId, () => update(n => n+1)),[presenceStore,sessionsStore,userId]);
        if (!enabled("platformIndicators") || !presenceStore || !RN) return null;
        const clients = platformClients(userId);
        if (!clients) return null;
        const colors = PLATFORM_COLORS, labels = PLATFORM_LABELS;
        // One icon per reported client, in presence order.
        const icons = Object.keys(clients).filter(key => key !== "unknown" && colors[clients[key]]).map(key =>
            el(RN.View,{key,accessible:true,accessibilityRole:"image",accessibilityLabel:tr(labels[key] || key)+": "+tr(PLATFORM_STATUS[clients[key]] || clients[key])},
                el(PlatformPng,{platform:key,color:colors[clients[key]]})));
        return icons.length ? el(RN.View,{key:"venus-platforms",style:{flexDirection:"row",gap:2,alignItems:"center"}},icons) : null;
    }
    function platformName(orig, self, args) {
        if (React) useSettings("platformIndicators");
        const tree = orig.apply(self,args), user = args[0] && args[0].user;
        if (!enabled("platformIndicators") || !settings.piProfile || !React || !RN || !tree || !user) return tree;
        return el(RN.View,{style:{flexDirection:"row",flexWrap:"wrap",gap:6,alignItems:"center"}},tree,el(PlatformBadges,{userId:user.id}));
    }
    // DM header (HBC fn58674 PrivateChannelHeader) renders its name inside a separate
    // ChannelTitle component (fn58681, props title/accessibleTitle/userId), so the badge
    // goes inside ChannelTitle's own output: right after the name, before the arrow.
    // One cached wrapper per component and placement, so React keeps the same element type.
    const platformTypes = {piDmHeader:new WeakMap(), piUserList:new WeakMap()};
    function platformType(target, option) {
        let type = platformTypes[option].get(target);
        if (!type) platformTypes[option].set(target, type = function () { return platformPlacement(target,this,arguments,option); });
        return type;
    }
    function platformHeader(orig,self,args) {
        if (React) useSettings("platformIndicators");
        const tree = orig.apply(self,args);
        if (!enabled("platformIndicators") || !settings.piDmHeader || !React || !RN || !tree) return tree;
        let swapped = false;
        function visit(node,depth) {
            if (!node || depth > 18 || typeof node !== "object") return node;
            if (Array.isArray(node)) { const next = node.map(child => visit(child,depth+1)); return next.some((c,i)=>c!==node[i]) ? next : node; }
            if (!node.props) return node;
            const p = node.props;
            if (!swapped && typeof node.type === "function" && "accessibleTitle" in p && "title" in p && typeof p.userId === "string") {
                swapped = true;
                const type = platformType(node.type,"piDmHeader");
                return el(type,Object.assign({},p,{key:node.key}));
            }
            const child = visit(p.children,depth+1);
            return child === p.children ? node : React.cloneElement(node,{children:child});
        }
        const next = visit(tree,0);
        return swapped ? next : placePlatformTree(tree,args[0] || {},"piDmHeader");
    }
    // DM list rows (MessagesItemChannelContent, fn65485): the name shares its line with the
    // server tag, so icons go in the right-side channelIcons row beside the muted/favorite
    // icon (props muted/selected/blocked), above the timestamp.
    function platformDmRow(orig,self,args) {
        if (React) useSettings("platformIndicators");
        const tree = orig.apply(self,args), channel = args[0] && args[0].channel;
        if (!enabled("platformIndicators") || !settings.piUserList || !React || !RN || !tree || !channel) return tree;
        const userId = channel.type === 1 && Array.isArray(channel.recipients) && channel.recipients.length === 1 && channel.recipients[0];
        if (!userId) return tree;
        const isIcon = child => child && child.props && "muted" in child.props && "selected" in child.props && "blocked" in child.props;
        let added = false;
        const next = cloneTree(tree,(node,p) => {
            if (added || node.type === RN.Text) return p;
            const children = Array.isArray(p.children) ? p.children : [p.children];
            if (!children.some(isIcon)) return p;
            added = true;
            return Object.assign({},p,{children:children.concat(el(RN.View,{key:"venus-platform-dm",style:{marginRight:4}},el(PlatformBadges,{userId})))});
        },0,() => added);
        return added ? next : placePlatformTree(tree,args[0] || {},"piUserList");
    }
    function platformPlacement(orig,self,args,option) {
        if (React) useSettings("platformIndicators");
        return placePlatformTree(orig.apply(self,args),args[0] || {},option);
    }
    // Pure tree transform: header/DM fallbacks MUST NOT subscribe a second time.
    // Their chosen placement changes while loading, changing channels or toggling
    // settings; putting hooks here changes the parent fiber's hook count.
    function placePlatformTree(tree,props,option) {
        if (!enabled("platformIndicators") || (option && !settings[option]) || !React || !RN || !tree) return tree;
        const channel = props.channel || channelStore && props.channelId && channelStore.getChannel(props.channelId);
        const userId = props.user && props.user.id || props.userId || channel && channel.type === 1 && channel.recipients && channel.recipients.length === 1 && channel.recipients[0];
        if (!userId) return tree;
        // Verified UserRow exposes label; private headers / DM content expose a
        // channel-title Text; voice MemberRowItem exposes its username Text. Preserve
        // every handler, subtitle, trailing action and frozen child.
        let added = false;
        return cloneTree(tree,(node,p) => {
            if (added) return p;
            if (p.label != null && typeof p.label !== "string" && typeof p.label !== "number") {
                added = true;
                return Object.assign({},p,{label:el(RN.View,{key:"venus-platform-label",style:{flexDirection:"row",alignItems:"center",gap:6,flexShrink:1}},p.label,el(PlatformBadges,{userId}))});
            }
            const children = Array.isArray(p.children) ? p.children : [p.children];
            const title = children.find(child => child && child.props && (child.type === RN.Text && typeof child.props.children === "string" || typeof child.props.variant === "string" && /(?:channel-title|heading|semibold)/.test(child.props.variant) || typeof child.props.userName === "string" && "userId" in child.props));
            // A React Native Text must not contain a View.
            if (!title || node.type === RN.Text) return p;
            added = true;
            return Object.assign({},p,{children:children.map(child => child !== title ? child : el(RN.View,{key:"venus-platform-title",style:{flexDirection:"row",alignItems:"center",gap:6,flexShrink:1}},child,el(PlatformBadges,{userId})))});
        },0,() => added);
    }
    const platformRenderers = new WeakMap();
    function platformRow(row) {
        // Swap a list row's private UserRow for a cached wrapper adding badges after its label.
        if (!row || typeof row !== "object" || typeof row.type !== "function" || !React) return row;
        return el(platformType(row.type,"piUserList"),Object.assign({},row.props,{key:row.key}));
    }
    function wrapProfileTree(tree, target, operation, cache) {
        if (!tree || !target || !React) return tree;
        let patched = cache.get(target);
        if (!patched) {
            patched = function () { return operation(target,this,arguments); };
            cache.set(target,patched);
        }
        // cloneTree transforms props, not element types; replace the specific named
        // child without invoking it outside React's hook lifecycle.
        function visit(node,depth) {
            if (!node || depth>18 || typeof node!=="object" || !node.props) return node;
            if (node.type === target) return el(patched,Object.assign({},node.props,{key:node.key}));
            const children=node.props.children;
            if (Array.isArray(children)) {
                const next=children.map(child=>visit(child,depth+1));
                return next.some((child,i)=>child!==children[i]) ? React.cloneElement(node,{children:next}) : node;
            }
            const child=visit(children,depth+1);
            return child===children ? node : React.cloneElement(node,{children:child});
        }
        return visit(tree,0);
    }
    function hiddenInfo(orig,self,args) {
        if (React) useSettings("hiddenChannels");
        const tree = orig.apply(self,args), channel = args[0] && args[0].channel;
        if (!tree || !React || !RN || !hiddenMetadata(channel)) return tree;
        // Discord already draws its own locked-channel icon (TextLockIcon, the # with a small lock) for these rows,
        // so a second lock beside the name only doubled it. Screen readers still hear that the channel is locked.
        return el(RN.View,{style:{flexDirection:"row",alignItems:"center"},accessible:true,accessibilityLabel:hiddenName(channel)+", "+tr("locked")},tree);
    }
    function authorizationUrl(result) {
        // Do not depend on a browser-complete global URL / URLSearchParams in RN.
        // Rebuild ONLY our fixed HTTPS endpoint; untrusted query keys cannot add
        // credentials, change the host, request another client mod or leak a token.
        const location = typeof result === "string" ? result : result && result.location;
        if (typeof location !== "string" || location.length > 8192) throw new Error("Invalid authorization redirect");
        const match = /^https:\/\/manti\.vendicated\.dev\/api\/reviewdb\/auth\?([^#]*)$/.exec(location);
        if (!match) throw new Error("Invalid authorization redirect");
        const values = {};
        match[1].split("&").forEach(part => {
            const index = part.indexOf("="), key = decodeURIComponent(index < 0 ? part : part.slice(0,index));
            if (!["code","error","error_description"].includes(key)) return;
            if (owns(values,key)) throw new Error("Invalid authorization redirect");
            values[key] = decodeURIComponent((index < 0 ? "" : part.slice(index+1)).replace(/\+/g," "));
        });
        // Tapping Cancel on Discord's authorize screen is a choice, not a problem: no red toast for it.
        if (values.error === "access_denied") return null;
        if (values.error) throw new Error("Discord did not authorize ReviewDB");
        if (!values.code || values.code.length > 2048 || /[\s\u0000-\u001f]/.test(values.code)) throw new Error("Invalid authorization redirect");
        return REVIEW_API+"/auth?code="+encodeURIComponent(values.code)+"&returnType=json&clientMod=vendetta";
    }
    async function reviewJson(url,options,timeoutMessage) {
        const controller = typeof global.AbortController === "function" ? new global.AbortController() : null;
        let timer;
        const task = Promise.resolve().then(async () => {
            const response = await global.fetch(url,Object.assign({credentials:"omit",headers:{accept:"application/json","content-type":"application/json"}},options,controller ? {signal:controller.signal} : {}));
            let result;
            try {result = await response.json();} catch (_) {throw new Error("ReviewDB returned an unreadable response (HTTP "+response.status+")");}
            if (!response.ok || !result || result.success === false) throw new Error(result && result.message || "ReviewDB HTTP "+response.status);
            return result;
        });
        // Abort alone is insufficient on Android versions without AbortController,
        // or on fetch implementations that don't reject when the signal aborts.
        const timeout = new Promise((resolve,reject) => {
            if (global.setTimeout) timer = global.setTimeout(() => {reject(new Error(timeoutMessage || "ReviewDB took too long to respond. Try again."));if (controller) controller.abort();},15000);
        });
        try {return await Promise.race([task,timeout]);}
        finally {if (timer !== undefined && global.clearTimeout) global.clearTimeout(timer);}
    }
    async function reviewRequest(path, method, body) {
        if (!enabled("reviewDB") || typeof global.fetch !== "function") throw new Error("ReviewDB is disabled or networking is unavailable");
        if (!/^\/(users(?:\/\d{17,20}\/reviews)?|reports)(?:\?|$)/.test(path)) throw new Error("Invalid ReviewDB request");
        // Credentials go in the Authorization header as ReviewDB's API expects, never in
        // JSON bodies (which proxies and error reporters are more likely to log).
        const token = method && method !== "GET" ? reviewAuth() : "";
        const headers = {accept:"application/json","content-type":"application/json",...(token ? {authorization:token} : {})};
        return reviewJson(REVIEW_API+path,{method:method || "GET",headers,...(body ? {body:JSON.stringify(body)} : {})});
    }
    function clearReviewAuth() {
        // Every Discord logout lands here: only rewrite preferences when a sign-in was saved.
        const saved=!!(reviewToken || reviewAccount);
        reviewAuthAttempt++;reviewToken="";reviewAccount=null;reviewAuthState="idle";reviewAuthError="";
        reviewCache.clear();if (saved) save();notify("reviewDB");
    }
    // One UserStore listener for every review view, and it only wakes them when the signed-in
    // account actually changes. Before, each open view re-rendered every review view on any user update.
    let reviewWatchers=0, reviewWatchStore=null, reviewWatchId;
    function reviewUserChanged() {
        const id=currentId();
        if (id===reviewWatchId) return;
        reviewWatchId=id;
        reviewAuth();
        notify("reviewDB");
    }
    function useReviews() {
        useSettings("reviewDB");
        React.useEffect(() => {
            const store=userStore;
            if (!store || typeof store.addChangeListener!=="function") return;
            if (!reviewWatchers++) { reviewWatchStore=store; reviewWatchId=currentId(); store.addChangeListener(reviewUserChanged); }
            return () => {
                if (--reviewWatchers || !reviewWatchStore) return;
                if (typeof reviewWatchStore.removeChangeListener==="function") reviewWatchStore.removeChangeListener(reviewUserChanged);
                reviewWatchStore=null;
            };
        },[userStore]);
    }
    function currentId() { const user=userStore && userStore.getCurrentUser(); return user && user.id; }
    // Discord design-system parts traced in the pinned HBC98 bundle. Demand-loaded at
    // render/action time only; no extra Metro factories are wrapped for them.
    const reviewExports=new Map();
    let reviewParts=null;
    function reviewUI() {
        // Once every part has loaded, reuse the same object: this runs on every render.
        if (reviewParts) return reviewParts;
        // Keep successful exports, never a partially initialized UI snapshot.
        // Missing exports must be retried when Metro finishes initializing them.
        const x=(id,key) => {
            const slot=id+":"+key;
            if (reviewExports.has(slot)) return reviewExports.get(slot);
            const value=inspectedExport(id,key);
            if (value != null) reviewExports.set(slot,value);
            return value;
        };
        let tokens=null;
        try { const t=typeof global.__r==="function" && global.__r(587); tokens=t && (t.default || t); } catch (_) {}
        const parts={TableRow:x(6180,"TableRow"),TableRowGroup:nativeRowGroup || x(6265,"TableRowGroup"),TableSwitchRow:nativeSwitchRow || x(6896,"TableSwitchRow"),
            Stack:x(5377,"Stack"),Card:x(6182,"Card"),FormRow:x(8575,"FormRow"),FormLabel:x(8575,"FormLabel"),FormSubLabel:x(8575,"FormSubLabel"),
            TextInput:x(6286,"TextInput"),Send:x(5040,"SendMessageIcon"),ActionSheet:x(6899,"ActionSheet"),Header:x(6839,"BottomSheetTitleHeader"),
            Close:x(6894,"ActionSheetCloseButton"),sheets:x(5056,"default"),showSheet:x(5056,"showActionSheet"),simpleSheet:x(6891,"showSimpleActionSheet"),clipboard:x(6889,"Clipboard"),
            alerts:x(5300,"default"),toasts:x(4809,"default"),pushModal:x(4976,"pushModal"),popModal:x(4976,"popModal"),OAuth:oauthModal || x(10725,"default"),
            createStyles:x(5092,"createStyles"),theme:x(4831,"useThemeContext"),colors:tokens && tokens.colors};
        if (Object.keys(parts).every(key => parts[key] != null)) reviewParts=parts;
        return parts;
    }
    let reviewToastSeq = 0;
    // Discord's own toasts carry an icon for what just happened; IconComponent is optional (venusIcon).
    function reviewToast(ui,content,IconComponent) { showToast(ui,"venus-toast:" + (++reviewToastSeq),tr(content),IconComponent); }
    // 350.8's ToastActionCreators (4809) is open(key, {text, icon}), as its presentCopiedToClipboard calls it. The old
    // open({key, content, IconComponent}) queued a toast with no options, and ToastContainer (14287) then crashed Discord
    // reading its position.
    function showToast(ui,key,text,icon) {
        try { if (ui.toasts && typeof ui.toasts.open==="function") ui.toasts.open(key,icon ? {text,icon} : {text}); } catch (_) {}
    }
    function hideReviewSheet(ui,key) { try { if (ui.sheets && typeof ui.sheets.hideActionSheet==="function") ui.sheets.hideActionSheet(key); } catch (_) {} }
    // Styles from Discord's createStyles: semantic tokens resolve
    // per theme. Decided once so a mounted card never changes its hook count.
    let reviewStyleHook, reviewStylesTried=false;
    function useReviewStyles(ui) {
        if (!reviewStylesTried) {
            reviewStylesTried=true;
            const c=ui.colors;
            if (typeof ui.createStyles==="function" && c) try {
                reviewStyleHook=ui.createStyles({card:{backgroundColor:c.CARD_BACKGROUND_DEFAULT,borderRadius:16,padding:8},
                    row:{backgroundColor:c.CARD_SECONDARY_BG},text:{color:c.TEXT_DEFAULT},muted:{color:c.TEXT_MUTED},
                    placeholder:{color:c.INPUT_PLACEHOLDER_TEXT_DEFAULT}});
            } catch (_) { reviewStyleHook=null; }
        }
        let styles=null;
        if (reviewStyleHook) try { styles=reviewStyleHook(); } catch (_) {}
        return styles || {card:{borderRadius:16,padding:8},row:{},text:{},muted:{},placeholder:{}};
    }
    function ReviewSettings() {
        useReviews();
        const ui=reviewUI();
        if (!React || !RN || !ui.TableRow) return null;
        const authenticated=!!reviewAuth(), pending=reviewAuthState==="exchanging", on=enabled("reviewDB");
        const Group=ui.TableRowGroup || RN.View, Switch=ui.TableSwitchRow;
        const me=currentUser(), myName=me && (me.globalName || me.global_name || me.username);
        const groups=[
            !on ? offCard("status",venusIcon(9354,"ThumbsUpIcon"), "reviewDB") :
                statusCard("status",authenticated ? "You can read, write, delete and report reviews." : "You can read reviews. Sign in to write your own.",
                    {title:authenticated && myName ? tr("Signed in as {name}",{name:myName}) : tr(pending ? "Signing in…" : "Reading reviews"),
                        IconComponent:venusIcon(9354,"ThumbsUpIcon"),leading:authenticated && me ? avatarBubble(me,40) : null}),
            // One row: the action you can take now. The status card already says whether you're signed in.
            el(Group,{key:"auth",title:tr("Account")},
                authenticated ? el(ui.TableRow,{key:"logout",label:tr("Sign out of ReviewDB"),icon:rowIcon(10994,"DoorExitIcon"),variant:"danger",onPress:clearReviewAuth,
                    subLabel:tr("ReviewDB stays in Discord's Authorized Apps until you remove it there.")}) :
                el(ui.TableRow,{key:"login",label:tr(pending ? "Signing in…" : "Sign in to ReviewDB"),icon:rowIcon(6640,"KeyIcon"),
                    arrow:true,disabled:!on || pending,onPress:authenticateReviews,subLabel:reviewAuthError || tr("Needed to post, delete or report reviews. Never uses your Discord token.")})),
            el(Group,{key:"settings",title:tr("Display")},
                switchRow(Switch,"reviewWarning","Show the be-respectful note","ReviewDB's reminder to be kind, shown above reviews.",rowIcon(10410,"ShieldIcon"))),
            footnote("note","Reviews come from manti.vendicated.dev. Opening reviews sends that profile's or server's ID to ReviewDB.")];
        return settingsBody(ui,groups);
    }
    // A live chat preview: Alex's edited message with earlier versions faded and crossed out above it, and Sam's kept
    // deleted message outlined in your deleted highlight color. Toggling Show edit history updates it live.
    function NoDeletePreview(props) {
        const s=useChatPreviewStyles(), k=usePreviewChrome();
        const red=highlightColorHex(settings.noDeleteColor,"#f23f43"), alpha=highlightAlpha(settings.noDeleteBrightness);
        const bar=(features.messageHighlight && enabled("messageHighlight") ? settings.messageHighlightThickness : 1)*2;
        const versions=[tr("See you at 6"),tr("See you at 7"),tr("See you at 8")];
        const history=props.edits ? versions.slice(0,2) : [];
        return el(RN.View,{key:"preview"},
            previewScreen(s,"preview","Deleted messages preview",[
            el(RN.View,{key:"edited"},
                previewMessage(s,"edited","Alex","#3ba55c",tr("Today at 4:01 PM"),el(RN.View,null,
                    history.map((text,i) => popIn("old:"+i,el(RN.Text,{style:s.faded},text))),
                    el(RN.Text,{style:s.text},versions[2],el(RN.Text,{style:s.muted}," "+tr("(edited)")))))),
            el(RN.View,{key:"deleted",style:{backgroundColor:red+alpha}},
                el(RN.View,{style:{position:"absolute",left:0,top:0,bottom:0,width:bar,backgroundColor:red}}),
                previewMessage(s,"msg","Sam","#eb459e",tr("Today at 4:03 PM"),el(RN.Text,{style:s.text},tr("Oops, wrong chat. Deleting this."))))],
            {header:previewHeader(k,{title:"general"}),footer:previewInput(k,s,{placeholder:tr("Message {channel}",{channel:"#general"})})}));
    }
    const NODELETE_LIMITS = [100, 512, 1000, MAX_DELETED];
    function NoDeleteSettings() {
        useSettings();
        const [hexOpen, setHexOpen]=React.useState(false), [hexDraft, setHexDraft]=React.useState(""), card=highlightCardStyle();
        const ui=reviewUI();
        if (!React || !RN) return null;
        const Group=ui.TableRowGroup || RN.View, Switch=ui.TableSwitchRow, on=!!settings.noDelete;
        const cleanHex=String(hexDraft || "").trim(), validHex=/^#?[0-9a-fA-F]{6}$/.test(cleanHex);
        const applyHex=() => { if (!on || !validHex) return; setSetting("noDeleteColor",(cleanHex.startsWith("#") ? cleanHex : "#"+cleanHex).toLowerCase()); setHexOpen(false); setHexDraft(""); };
        const look=settings.noDeleteColor!=="default" || settings.noDeleteBrightness!==50;
        const kept=deleted.size, changed=edits.size, hasKept=kept>0 || changed>0;
        const summary=hasKept ? tr(settings.noDeleteSave ? "{deleted} and {edited} kept, saved on this phone." : "{deleted} and {edited} kept until Discord restarts.",
            {deleted:count(kept,"deleted message"),edited:count(changed,"edited message")}) : "";
        const groups=[
            !settings.noDelete ? offCard("status",venusIcon(5049,"TrashIcon"), "noDelete") : hasKept ? statusCard("status",summary,{title:pl(kept+changed,"{n} message kept","{n} messages kept"),
                IconComponent:venusIcon(5049,"TrashIcon")}) : null,
            el(NoDeletePreview,{key:"preview",edits:!!settings.noDeleteEdits,on:!!settings.noDelete}),
            el(Group,{key:"edits",title:tr("Edited messages")},toggle("noDeleteEdits","Show edit history","What a message said before it was edited, faded and crossed out above it. Up to 10 versions each.",rowIcon(9720,"PencilIcon"))),
            el(Group,{key:"save",title:tr("Storage")},toggle("noDeleteSave","Keep after restarting","Deleted and edited messages survive closing Discord. Saved only on this phone, for this account.",rowIcon(5044,"DownloadIcon"))),
            el(RN.View,{key:"look",style:{gap:8}},
                groupTitle("title","Look"),
                el(RN.View,{style:card},
                    highlightColorPicker({setting:"noDeleteColor",title:"Color",choices:HIGHLIGHT_DELETED_CHOICES,defaultHex:"#f23f43",on,value:settings.noDeleteColor,
                        onNoPicker:() => { setHexOpen(true); setHexDraft(settings.noDeleteColor.startsWith("#") ? settings.noDeleteColor : ""); }}),
                    hexOpen ? inputWithButton(ui,"hex",{value:hexDraft,label:tr("Hex color"),autoCapitalize:"none",autoCorrect:false,maxLength:7,placeholder:"#f23f43",
                        onSubmitEditing:applyHex,returnKeyType:"done",editable:on,isDisabled:!on},text => setHexDraft(String(text || "")),"Use",applyHex,!on || !validHex) : null)),
            el(PresetOrCustom,{key:"brightness",title:"Brightness",value:settings.noDeleteBrightness,disabled:!on,min:0,max:100,placeholder:50,
                inputLabel:tr("Brightness, 0 to 100"),format:n => tr("{n}%",{n}),onChange:value => setSetting("noDeleteBrightness",value),
                presets:BRIGHTNESS_STEPS.map(n => ({value:n,label:tr("{n}%",{n})})),hint:"How strongly a kept message is tinted behind its text. 0% leaves only the bar."}),
            el(PresetOrCustom,{key:"limit",title:"Keep up to",value:settings.noDeleteLimit,disabled:!on,min:1,max:MAX_DELETED,placeholder:512,
                inputLabel:tr("Messages, 1 to {max}",{max:MAX_DELETED}),format:n => String(n),onChange:value => setSetting("noDeleteLimit",value),
                presets:NODELETE_LIMITS.map(n => ({value:n,label:String(n)})),hint:"When it's full, the oldest is removed first."}),
            hasKept || look ? el(Group,{key:"clear",title:tr("Manage")},
                look ? actionRow(ui,"look","Reset the look","Red at 50% brightness, as Discord draws a highlight.",() => { setSetting("noDeleteColor","default"); setSetting("noDeleteBrightness",50); setHexOpen(false); },!on) : null,
                hasKept ? actionRow(ui,"clear","Clear kept messages","Removes every deleted message and edit history Venus kept, from chat and from this phone.",
                    () => confirmAction("Clear kept messages?","Every deleted message and edit history Venus kept is removed. This can't be undone.","Clear",forgetKept),false,true) : null) : null,
            footnote("note","Delete a kept message again to hide just that one.")];
        return settingsBody(ui,groups);
        function toggle(key,label,subLabel,icon) { return switchRow(Switch,key,label,subLabel,icon); }
    }
    // Clear kept messages: every kept deletion leaves chat and the saved file, and so does edit history.
    // Removals go through Discord's own dispatch, bound before Venus hooked it, so they aren't kept again.
    function forgetKept() {
        const events=Array.from(deleted.values());
        deleted.clear(); deletedByChannel.clear(); edits.clear(); invalidateDeleted();
        dispatchRemovals(events); persistDeleted(); notify("noDelete");
        reviewToast(reviewUI(),"Kept messages cleared",venusIcon(5049,"TrashIcon"));
    }
    function authenticateReviews() {
        if (!enabled("reviewDB") || reviewAuthState==="exchanging") return;
        const ui=reviewUI();
        if (typeof ui.pushModal!=="function" || typeof ui.popModal!=="function" || !ui.OAuth) {RN.Alert.alert("ReviewDB",tr("Discord's authorization screen is unavailable. Reopen this page and try again."));return;}
        const accountId=currentId();
        if (!accountId) {RN.Alert.alert("ReviewDB",tr("Discord hasn't loaded your account yet. Try again in a moment."));return;}
        const attempt=++reviewAuthAttempt, key="oauth2-authorize";
        let closed=false;
        reviewAuthError="";notify("reviewDB");
        const live=() => enabled("reviewDB") && attempt===reviewAuthAttempt && currentId()===accountId;
        const close=() => { if (closed) return; closed=true; try { ui.popModal(key); } catch (_) {} };
        function fail(error) {
            if (!live()) return;
            reviewAuthState="idle";reviewAuthError=String(error && error.message || error);notify("reviewDB");
            reviewToast(ui,tr("Couldn't sign in: {problem}",{problem:reviewAuthError}),venusIcon(6296,"CircleXIcon"));
        }
        ui.pushModal({key,modal:{key,modal:ui.OAuth,animation:"slide-up",shouldPersistUnderModals:false,closable:true,props:{
            clientId:"915703782174752809",redirectUri:REVIEW_API+"/auth",scopes:["identify"],responseType:"code",permissions:BigInt(0),cancelCompletesFlow:false,
            // Traced in 347.12, 349.9 and 350.8 (useOAuth2AuthorizeForm, fn50476): after Authorize the form calls
            // dismissOAuthModal FIRST, waits 100 ms, and only THEN calls callback({location}).
            // Dismissal is never a cancellation; treating it as one discarded every sign-in.
            dismissOAuthModal:close,
            callback:result => {
                close();
                if (!live() || !result || result.canceled===true) return;
                let url;
                try { url=authorizationUrl(result); } catch (error) { fail(error); return; }
                if (!url) return;
                reviewAuthState="exchanging";notify("reviewDB");
                reviewJson(url,{method:"GET"},"ReviewDB took too long to authorize. Try again.").then(auth => {
                    if (!live()) return;
                    if (auth.success!==true || typeof auth.token!=="string" || !auth.token.trim() || auth.token.length>8192) throw new Error(auth.message || "ReviewDB did not return a token");
                    reviewToken=auth.token;reviewAccount=accountId;reviewAuthState="idle";reviewAuthError="";reviewCache.clear();
                    save();notify("reviewDB");reviewToast(ui,"Signed in to ReviewDB",venusIcon(6868,"CircleCheckIcon"));
                }).catch(fail);
            }}}});
    }
    function reviewsFor(userId, refresh) {
        if (!/^\d{17,20}$/.test(userId)) return Promise.reject(new Error("Invalid profile ID"));
        const cached = reviewCache.get(userId);
        if (!refresh && cached && cached.expires>Date.now()) return cached.promise;
        // Refreshing a cached profile replaces it in place; only a new profile evicts the oldest one.
        if (cached) reviewCache.delete(userId);
        else if (reviewCache.size>=32) reviewCache.delete(reviewCache.keys().next().value);
        const promise=reviewRequest("/users/"+userId+"/reviews").then(result=>{
            if (!Array.isArray(result.reviews)) throw new Error("Invalid review list");
            return result.reviews.slice(0,100).filter(review=>review && review.sender && typeof review.comment==="string");
        }).catch(error=>{
            // A newer request for this profile owns the slot; only drop our own failed entry.
            const current=reviewCache.get(userId);
            if (current && current.promise===promise) reviewCache.delete(userId);
            throw error;
        });
        reviewCache.set(userId,{promise,expires:Date.now()+60000});return promise;
    }
    function reviewAuth() {
        const current=currentId();
        // Only an actual account switch invalidates the token; an unloaded store at startup does not.
        if (reviewToken && reviewAccount && current && current!==reviewAccount) {
            reviewAuthAttempt++;reviewToken="";reviewAccount=null;reviewAuthState="idle";reviewCache.clear();save();
        }
        return reviewToken;
    }
    let reviewAdminsLoaded=false;
    const reviewAdmins=new Set();
    function loadReviewAdmins() {
        if (reviewAdminsLoaded || typeof global.fetch!=="function") return;
        reviewAdminsLoaded=true;
        reviewJson("https://manti.vendicated.dev/admins",{method:"GET"}).then(list => {
            if (Array.isArray(list)) list.forEach(id => { if (typeof id==="string") reviewAdmins.add(id); });
        },() => {reviewAdminsLoaded=false;});
    }
    const reviewImage=uri => typeof uri==="string" && /^https:\/\//.test(uri);
    function reviewActions(review, owner, ui, refetch) {
        const system=review.type===3, me=currentId(), sender=review.sender || {};
        function confirm(title, content, onConfirm) {
            if (ui.alerts && typeof ui.alerts.show==="function") try { ui.alerts.show({title,body:content,confirmText:tr("Yes"),cancelText:tr("No"),onConfirm}); return; } catch (_) {}
            RN.Alert.alert(title,content,[{text:tr("No"),style:"cancel"},{text:tr("Yes"),style:"destructive",onPress:onConfirm}]);
        }
        function mutate(path, method, body, done) {
            reviewRequest(path,method,body).then(result => {reviewCache.delete(owner);refetch();reviewToast(ui,result && result.message || done,venusIcon(6868,"CircleCheckIcon"));},
                error => reviewToast(ui,String(error && error.message || error),venusIcon(6296,"CircleXIcon")));
        }
        const options=[{label:tr("Copy Text"),onPress:() => {
            try { (ui.clipboard || RN.Clipboard).setString(review.comment); } catch (_) {}
            reviewToast(ui,"Review copied",venusIcon(5042,"CopyIcon"));
        }}];
        if (reviewAuth() && !system) {
            if (sender.discordID===me || owner===me || reviewAdmins.has(me)) options.push({label:tr("Delete review"),isDestructive:true,
                onPress:() => confirm(tr("Delete review"),tr("Are you sure you want to delete this review?"),() => mutate("/users/"+owner+"/reviews","DELETE",{reviewid:review.id},"Review deleted"))});
            options.push({label:tr("Report review"),isDestructive:true,
                onPress:() => confirm(tr("Report review"),tr("Are you sure you want to report this review?"),() => mutate("/reports","PUT",{reviewid:review.id},"Review reported"))});
        }
        const title=system ? tr("ReviewDB System Message") : tr("Review by {name}",{name:String(sender.username || "Unknown")});
        if (typeof ui.simpleSheet==="function") try {
            ui.simpleSheet({key:"ReviewOverflow",header:{title,onClose:() => hideReviewSheet(ui,"ReviewOverflow")},options});return;
        } catch (_) {}
        RN.Alert.alert(title,undefined,options.map(option => ({text:option.label,style:option.isDestructive ? "destructive" : "default",onPress:option.onPress}))
            .concat([{text:tr("Cancel"),style:"cancel"}]));
    }
    function ReviewRow(props) {
        const review=props.review, ui=props.ui, styles=props.styles, sender=review.sender;
        const timestamp=review.type!==3 && Number.isFinite(review.timestamp) ? new Date(review.timestamp*1000).toLocaleDateString() : "";
        const badges=(Array.isArray(sender.badges) ? sender.badges.slice(0,8) : []).filter(badge => badge && reviewImage(badge.icon));
        const label=el(RN.View,{style:{flexDirection:"row",alignItems:"center"}},
            el(ui.FormLabel,{text:String(sender.username || "Unknown"),style:styles.text}),
            el(RN.View,{style:{flexDirection:"row",alignItems:"center"}},badges.map((badge,index) =>
                el(RN.Pressable,{key:String(index),style:{marginLeft:4},onPress:() => reviewToast(ui,String(badge.name || ""))},
                    el(RN.Image,{source:{uri:badge.icon,width:16,height:16},style:{width:16,height:16}})))),
            el(ui.FormLabel,{text:timestamp,style:[styles.muted,{marginLeft:5}]}));
        return el(ui.TableRowGroup || RN.View,{style:[styles.row]},
            el(ui.FormRow,{style:[styles.row],label,
                subLabel:el(ui.FormSubLabel,{text:review.comment,style:styles.text}),
                leading:reviewImage(sender.profilePhoto) ? el(RN.Image,{style:{height:36,width:36,borderRadius:18},source:{uri:sender.profilePhoto}}) : undefined,
                onLongPress:() => reviewActions(review,props.owner,ui,props.refetch)}));
    }
    let reviewThemeHook, reviewThemeTried=false;
    function ReviewInput(props) {
        const ui=props.ui, styles=props.styles;
        const [text,setText]=React.useState(""), [busy,setBusy]=React.useState(false);
        // Like the style hook, choose once. Retrying missing UI exports must not
        // add a theme hook to an input which already mounted without one.
        if (!reviewThemeTried) {reviewThemeTried=true;reviewThemeHook=typeof ui.theme==="function" ? ui.theme : null;}
        // 350.8 useThemeContext (fn32051) throws outside its Provider. Reviews
        // on a server are not a user profile; keep the hook call but use the
        // standard send color when that optional context is absent.
        let theme=null;
        if (reviewThemeHook) try {theme=reviewThemeHook();} catch (_) {}
        const authenticated=!!reviewAuth(), canSend=authenticated && !busy && text.trim().length>0;
        const placeholder=tr(!authenticated ? "Sign in to ReviewDB in Venus settings to write a review." : props.shouldEdit ? "Tap to edit your review" : "Tap to add a review");
        function send() {
            if (!canSend || !text.trim()) return;
            setBusy(true);
            reviewRequest("/users/"+props.userId+"/reviews","PUT",{comment:text.trim()}).then(result => {
                setText("");props.refetch();reviewToast(ui,result && result.message || "Review posted",venusIcon(6868,"CircleCheckIcon"));
            },error => reviewToast(ui,String(error && error.message || error),venusIcon(6296,"CircleXIcon"))).then(() => setBusy(false));
        }
        const input=ui.TextInput ?
            el(ui.TextInput,{style:[{flex:1,fontSize:16},styles.text],isDisabled:!authenticated,placeholder,placeholderTextColor:styles.placeholder.color,
                value:text,onChange:setText,maxLength:1000}) :
            el(RN.TextInput,{style:[{flex:1,fontSize:16},styles.text],editable:authenticated,placeholder,placeholderTextColor:styles.placeholder.color,
                value:text,onChangeText:setText,maxLength:1000});
        const color=theme && theme.primaryColor || "#5865f2";
        return el(RN.View,{style:{flexDirection:"row",alignItems:"center",gap:8,paddingHorizontal:8,paddingVertical:4}},
            el(RN.View,{style:{flex:1}},input),
            el(RN.Pressable,{accessibilityRole:"button",accessibilityLabel:tr(props.shouldEdit ? "Update review" : "Send review"),disabled:!canSend,onPress:send,
                style:{minHeight:40,minWidth:40,borderRadius:999,alignItems:"center",justifyContent:"center",backgroundColor:color,opacity:canSend ? 1 : 0.25}},
                ui.Send ? el(ui.Send,{size:"sm",color:"#ffffff"}) : el(RN.Text,{style:{color:"#ffffff",fontWeight:"700"}},">")));
    }
    function ReviewSection(props) {
        useReviews();
        const ui=reviewUI(), styles=useReviewStyles(ui), userId=props.userId;
        const [reviews,setReviews]=React.useState(null), [generation,reload]=React.useState(0), [error,setError]=React.useState("");
        const valid=typeof userId==="string" && /^\d{17,20}$/.test(userId);
        React.useEffect(() => {
            let live=true;
            if (!enabled("reviewDB") || !valid) return;
            setReviews(null);setError("");loadReviewAdmins();
            reviewsFor(userId,generation>0).then(list => {if (live) setReviews(list);},failure => {
                if (live) {setReviews(null);setError(String(failure && failure.message || failure).slice(0,512));}
            });
            return () => {live=false;};
        },[userId,generation,settings.reviewDB]);
        const Card=props.standalone ? RN && RN.View : ui.Card;
        if (!enabled("reviewDB") || !valid || !RN || !Card || !ui.FormRow) return null;
        const list=reviews || [], me=currentId();
        const shown=settings.reviewWarning ? list : list.filter(review => review.type!==3);
        const refetch=() => {reviewCache.delete(userId);reload(n => n+1);};
        const rows=error ? el(RN.View,{style:{gap:8}},
            el(RN.Text,{accessibilityRole:"alert",style:styles.text},tr("Couldn't load reviews: {problem}",{problem:error})),
            reviewRetry(refetch)) :
            reviews===null ? el(RN.Text,{accessibilityLiveRegion:"polite",style:styles.muted},tr("Loading reviews…")) :
            !shown.length ? el(RN.Text,{style:styles.muted},tr("No reviews yet.")) :
            shown.map((review,index) => el(ReviewRow,{key:(review.id==null ? "" : String(review.id))+":"+index,review,owner:userId,ui,styles,refetch}));
        return el(RN.View,{style:[styles.card]},
            el(Card,props.standalone ? {accessibilityLabel:tr("Reviews")} : {title:tr("Reviews")},
                el(RN.View,{style:{gap:8}},rows),
                el(ReviewInput,{userId,ui,styles,refetch,shouldEdit:list.some(review => review.type!==3 && review.sender.discordID===me)})));
    }
    // Discord's own small secondary button (Button 5282), or a themed pill if it hasn't loaded.
    function reviewRetry(onPress) {
        const Button=inspectedExport(5379,"Button");
        if (Button) return el(RN.View,{style:{alignSelf:"flex-start"}},
            el(Button,{text:tr("Retry"),size:"sm",variant:"secondary",accessibilityLabel:tr("Retry reviews"),onPress}));
        return el(RN.Pressable,{accessibilityRole:"button",accessibilityLabel:tr("Retry reviews"),onPress,
            style:{alignSelf:"flex-start",paddingHorizontal:16,height:32,borderRadius:16,justifyContent:"center",backgroundColor:"#4e505899"}},
            el(RN.Text,{style:{color:"#ffffff",fontWeight:"600"}},tr("Retry")));
    }
    function ReviewSheet(props) {
        const ui=reviewUI();
        return el(ui.ActionSheet,{header:ui.Header ? el(ui.Header,{title:tr("Reviews"),trailing:ui.Close ? el(ui.Close,{onPress:() => hideReviewSheet(ui,props.sheetKey)}) : undefined}) : undefined},
            el(RN.View,null,el(RN.ScrollView,{style:{gap:12,marginBottom:12}},el(ReviewSection,{userId:props.userId,standalone:true}))));
    }
    function openReviewSheet(userId) {
        if (!enabled("reviewDB") || !React || !RN || typeof userId!=="string" || !/^\d{17,20}$/.test(userId)) return;
        const ui=reviewUI();
        if (!ui.ActionSheet || typeof ui.showSheet!=="function") { reviewToast(ui,"Reviews are unavailable. Reopen the server menu and try again.",venusIcon(6296,"CircleXIcon")); return; }
        // 4801's NAMED showActionSheet (HBC fn32121) takes an already-created
        // element, then schedules SHOW_ACTION_SHEET through Dispatcher.wait.
        // Reviews are bundled, not lazy imports: avoid openLazy's detached Promise
        // chain entirely. The inspected store (fn31181) accepts "stack".
        const key="VenusReviews:"+userId;
        try { ui.showSheet({key,content:el(ReviewSheet,{userId,sheetKey:key}),stackingBehavior:"stack"}); }
        catch (error) { reviewToast(ui,tr("Couldn't open reviews: {problem}",{problem:String(error && error.message || error)}),venusIcon(6296,"CircleXIcon")); }
    }
    // Profiles: reviews go in as the LAST card of the profile card stack
    // (after the note). In 350.8 UserProfileNote (13181) is that last card in the normal, bot,
    // tabbed and You-screen layouts, so reviews render directly beneath it.
    function reviewNote(orig,self,args) {
        const tree=orig.apply(self,args), userId=args[0] && args[0].userId;
        if (!React || !RN || !features.reviewDB || typeof userId!=="string") return tree;
        return el(React.Fragment,null,tree,el(ReviewSection,{key:"venus-reviews:"+userId,userId}));
    }
    // The server sheet already supplies its native scrolling/presentation context
    // (GuildActionSheet fn60681). Expand content there instead of spawning a second
    // dialog. No detached dispatcher callback, new portal or nested RN ScrollView.
    function ServerReviews(props) {
        useReviews();
        const [open,setOpen]=React.useState(false), ui=reviewUI();
        React.useEffect(() => {setOpen(false);},[props.guildId]);
        if (!enabled("reviewDB") || !RN || !ui.TableRow) return null;
        return el(RN.View,null,
            el(ui.TableRowGroup || RN.View,null,el(ui.TableRow,{label:tr("Reviews"),arrow:!open,
                subLabel:tr(open ? "Tap to close server reviews." : "Read and write community reviews for this server."),
                accessibilityState:{expanded:open},onPress:() => {if (enabled("reviewDB")) setOpen(value => !value);}})),
            open ? el(ReviewSection,{key:props.guildId,userId:props.guildId,standalone:true}) : null);
    }
    function reviewGuild(orig,self,args) {
        if (React) useSettings("reviewDB");
        const props=args[0] || {}, guild=props.guild, ui=reviewUI();
        if (!enabled("reviewDB") || !React || !RN || !guild || !/^\d{17,20}$/.test(guild.id) || !ui.TableRow) return React ? el(orig,props) : orig.apply(self,args);
        return el(ServerReviews,{key:guild.id,guildId:guild.id});
    }
    // User long-press context menu gets a "Reviews" item.
    function reviewMenu(orig,self,args) {
        const props=args[0], menu=props && props.menu, id=menu && menu.key;
        if (!enabled("reviewDB") || !menu || !Array.isArray(menu.items) || menu.items.length!==3 || typeof id!=="string" || !/^\d{17,20}$/.test(id)) return orig.apply(self,args);
        const next=Array.from(args);
        next[0]=Object.assign({},props,{menu:Object.assign({},menu,{items:menu.items.concat([{label:tr("Reviews"),action:() => openReviewSheet(id)}])})});
        return orig.apply(self,next);
    }
    // Server info (#77, based on ServerInfo by fshin): hold a server icon in the server list and its menu
    // (getGuildsBarGuildMenuItems 16748) gets a Server info row. It opens a sheet that reads everything from Discord's own
    // stores and redraws live: who's online, channels, roles, emojis, stickers, events, boost level with how far the next
    // one is, which friends are there (with their status), the owner, when you joined and copyable details.
    const SERVER_INFO_STORES = [2087, 5020, 2125, 2119, 4748, 4760, 5108, 1390];
    const SERVER_BOOST_LEVELS = [0, 2, 7, 14];
    // Discord's verification levels 0-4, as words.
    function serverVerification(level) { return [tr("None"), tr("Low"), tr("Medium"), tr("High"), tr("Highest")][Math.max(0, Math.min(4, level))]; }
    const SERVER_BADGES = [["VERIFIED", () => tr("Verified")], ["PARTNERED", () => tr("Partner")], ["COMMUNITY", () => tr("Community")], ["DISCOVERABLE", () => tr("Discoverable")]];
    const SERVER_STATUS_RANK = {online:0, streaming:0, dnd:1, idle:2};
    // members counts changes to any store but presence (5108), so a status-only tick skips the friend membership walk.
    const serverInfo = {asked:new Map(), fetched:new Set(), members:0, friendsKey:"", friends:[]};
    function serverStore(id) { const store = inspectedExport(id, "default"); return store && typeof store === "object" ? store : null; }
    function serverCall(store, name, a, b) {
        if (!store || typeof store[name] !== "function") return undefined;
        try { return store[name](a, b); } catch (_) { return undefined; }
    }
    function serverSize(value) {
        if (!value) return 0;
        if (typeof value.length === "number") return value.length;
        if (typeof value.size === "number") return value.size;
        return typeof value === "object" ? Object.keys(value).length : 0;
    }
    // 1284 -> "1,284" in the language Venus is shown in, when Hermes has Intl; plain digits otherwise.
    function serverNumber(n) {
        if (typeof n !== "number" || !isFinite(n)) return "\u2014";
        try { const text = n.toLocaleString(uiLanguage()); if (typeof text === "string" && /\d/.test(text)) return text; } catch (_) {}
        return String(Math.round(n));
    }
    // "{n} members" with the number grouped, still using the language's plural form for it.
    function serverCount(n, one, other, vars) { return pl(n, one, other, vars).replace(String(n), serverNumber(n)); }
    function serverDate(ms) {
        if (!isFinite(ms)) return tr("Unavailable");
        try { const text = new Date(ms).toLocaleDateString(uiLanguage(), {year:"numeric", month:"long", day:"numeric"}); if (text) return text; } catch (_) {}
        return backupDate(ms);
    }
    // The largest whole unit since then: "3 years ago", "5 months ago", "12 days ago".
    function serverAge(ms) {
        if (!isFinite(ms)) return "";
        const diff = Math.max(0, Date.now() - ms), day = 86400000;
        if (diff < day) return tr("just now");
        const time = diff >= 365 * day ? pl(Math.floor(diff / (365 * day)), "{n} year", "{n} years") :
            diff >= 30 * day ? pl(Math.floor(diff / (30 * day)), "{n} month", "{n} months") : pl(Math.floor(diff / day), "{n} day", "{n} days");
        return tr("{time} ago", {time});
    }
    function serverIconUri(guild, size) {
        return guild && typeof guild.icon === "string" && guild.icon ? "https://cdn.discordapp.com/icons/" + guild.id + "/" + guild.icon + ".png?size=" + (size || 128) : null;
    }
    function serverBannerUri(guild) {
        const hash = guild && (guild.banner || guild.splash);
        return typeof hash === "string" && hash ? "https://cdn.discordapp.com/" + (guild.banner ? "banners/" : "splashes/") + guild.id + "/" + hash + ".png?size=600" : null;
    }
    function serverAcronym(name) {
        const words = String(name || "?").trim().split(/\s+/).filter(Boolean);
        return (words.length > 1 ? words.slice(0, 3).map(w => w[0]).join("") : String(name || "?").slice(0, 2)).toUpperCase();
    }
    // Boost level and how far the next one is: {level, boosts, next, need, share}.
    function serverBoost(guild) {
        const boosts = Math.max(0, Number(guild && guild.premiumSubscriberCount) || 0);
        let level = Math.max(0, Math.min(3, Number(guild && guild.premiumTier) || 0));
        if (!level) for (let i = 3; i > 0; i--) if (boosts >= SERVER_BOOST_LEVELS[i]) { level = i; break; }
        if (level >= 3) return {level, boosts, next:0, need:0, share:1};
        const from = SERVER_BOOST_LEVELS[level], to = SERVER_BOOST_LEVELS[level + 1];
        return {level, boosts, next:level + 1, need:Math.max(1, to - boosts), share:Math.max(0, Math.min(1, (boosts - from) / (to - from)))};
    }
    function serverFeature(guild, name) {
        const list = guild && guild.features;
        try { return !!list && (typeof list.has === "function" ? list.has(name) : Array.isArray(list) && list.indexOf(name) >= 0); } catch (_) { return false; }
    }
    // Everything the sheet shows, read once per render from Discord's stores. A store that isn't there leaves its part out.
    function serverSnapshot(guildId) {
        const guild = serverCall(serverStore(2087), "getGuild", guildId);
        if (!guild) return null;
        const counts = serverStore(5020), members = serverStore(2125), channels = serverCall(serverStore(4748), "getChannels", guildId) || {};
        const textCount = serverSize(channels.SELECTABLE), voiceCount = serverSize(channels.VOCAL);
        const roles = serverCall(serverStore(2119), "getNumRoles", guildId);
        const events = serverCall(serverStore(6054), "getGuildScheduledEventsForGuild", guildId);
        const me = currentUser(), joined = serverCall(members, "getSelfMemberJoinedAt", guildId);
        const memberCount = serverCall(counts, "getMemberCount", guildId), online = serverCall(counts, "getOnlineCount", guildId);
        return {guild, id:guildId, name:guild.name || "", description:typeof guild.description === "string" ? guild.description.trim() : "",
            members:typeof memberCount === "number" ? memberCount : typeof guild.memberCount === "number" ? guild.memberCount : null,
            online:typeof online === "number" ? online : null,
            text:textCount, voice:voiceCount, channels:textCount + voiceCount,
            // Discord counts @everyone as a role; nobody thinks of it as one.
            roles:typeof roles === "number" ? Math.max(0, roles - 1) : null,
            emojis:serverSize(serverCall(serverStore(5989), "getGuildEmojis", guildId)),
            stickers:serverSize(serverCall(serverStore(6031), "getStickersByGuildId", guildId)),
            events:Array.isArray(events) ? events.length : 0,
            boost:serverBoost(guild), created:snowflakeMs(guildId),
            joined:joined && typeof joined.getTime === "function" ? joined.getTime() : typeof joined === "number" ? joined : NaN,
            ownerId:typeof guild.ownerId === "string" ? guild.ownerId : null, mine:!!(me && guild.ownerId === me.id),
            vanity:typeof guild.vanityURLCode === "string" && guild.vanityURLCode ? guild.vanityURLCode : "",
            verification:Number(guild.verificationLevel) || 0, locale:typeof guild.preferredLocale === "string" ? guild.preferredLocale : "",
            badges:SERVER_BADGES.filter(entry => serverFeature(guild, entry[0])).map(entry => entry[1]())};
    }
    function serverRank(status) { const rank = SERVER_STATUS_RANK[status]; return rank == null ? 3 : rank; }
    // Your friends who are members, online ones first, each with their status and server nickname. Who's here (one
    // getMember per friend) only changes with the member, user or friend stores, so it's kept, sorted by name, until
    // one of them changes; a presence tick (up to ~3/s) just re-reads their statuses and stable-sorts by rank
    // (1.63 ms -> 70 us for 300 friends, 60 here).
    function serverFriends(guildId) {
        const ids = serverCall(serverStore(4760), "getFriendIDs") || [], members = serverStore(2125), presence = serverStore(5108);
        if (!members || !ids.length) return [];
        const key = guildId + ":" + ids.length + ":" + serverInfo.members;
        let list = serverInfo.friends;
        if (serverInfo.friendsKey !== key) {
            list = [];
            for (let i = 0; i < ids.length; i++) {
                const id = ids[i], member = serverCall(members, "getMember", guildId, id);
                if (!member) continue;
                const user = userStore && serverCall(userStore, "getUser", id) || {id};
                list.push({id, user, name:String(member.nick || user.globalName || user.global_name || user.username || id)});
            }
            list.sort((a, b) => a.name.localeCompare(b.name));
            serverInfo.friendsKey = key; serverInfo.friends = list;
        }
        const out = new Array(list.length);
        for (let i = 0; i < list.length; i++) {
            const f = list[i], status = serverCall(presence, "getStatus", f.id) || "offline";
            out[i] = {id:f.id, user:f.user, name:f.name, status, rank:serverRank(status), at:i};
        }
        return out.sort((a, b) => a.rank - b.rank || a.at - b.at);
    }
    // Asks Discord once every few minutes which of your friends are members (the request its own member list makes).
    function serverAskFriends(guildId) {
        if (!settings.serverInfoFriends) return false;
        const last = serverInfo.asked.get(guildId) || 0, ids = serverCall(serverStore(4760), "getFriendIDs") || [];
        if (!ids.length || Date.now() - last < 5 * 60000) return false;
        const actions = serverStore(6098);
        if (!actions || typeof actions.requestMembersById !== "function") return false;
        serverInfo.asked.set(guildId, Date.now());
        try { for (let i = 0; i < ids.length; i += 100) actions.requestMembersById(guildId, ids.slice(i, i + 100)); return true; } catch (_) { return false; }
    }
    // The owner isn't always loaded; Discord's own getUser (8301) fetches them once and adds them to UserStore.
    function serverOwner(snap) {
        if (!snap.ownerId) return null;
        const user = userStore && serverCall(userStore, "getUser", snap.ownerId);
        if (!user && !serverInfo.fetched.has(snap.ownerId)) {
            serverInfo.fetched.add(snap.ownerId);
            const getUser = inspectedExport(8301, "getUser");
            if (typeof getUser === "function") Promise.resolve().then(() => getUser(snap.ownerId)).catch(() => {});
        }
        const member = serverCall(serverStore(2125), "getMember", snap.id, snap.ownerId);
        return {id:snap.ownerId, user, name:member && member.nick || user && (user.globalName || user.global_name || user.username) || null,
            handle:user && user.username ? "@" + user.username : "", status:serverCall(serverStore(5108), "getStatus", snap.ownerId) || null};
    }
    function serverOpenProfile(userId, guildId) {
        const show = inspectedExport(8299, "default");
        if (typeof show !== "function" || !userId) return;
        haptic("SELECTION");
        try { show({userId, guildId}); } catch (_) {}
    }
    function serverCopy(text, toast) {
        const ui = reviewUI();
        try { (ui.clipboard || RN.Clipboard).setString(text); } catch (_) { return; }
        haptic("SELECTION");
        reviewToast(ui, toast, venusIcon(5042, "CopyIcon"));
    }
    // Redraws when any store it reads changes, at most about three times a second (presence changes all the time).
    function useServerStores(guildId) {
        const [, tick] = React.useState(0);
        React.useEffect(() => {
            let pending, live = true;
            const bump = () => { if (pending !== undefined || !live) return; pending = later(() => { pending = undefined; if (live) tick(n => n + 1); }, 300, false); };
            const changed = () => { serverInfo.members++; bump(); }, presence = serverStore(5108);
            const stores = SERVER_INFO_STORES.map(serverStore).filter(store => store && typeof store.addChangeListener === "function");
            const listen = store => store === presence ? bump : changed;
            stores.forEach(store => { try { store.addChangeListener(listen(store)); } catch (_) {} });
            serverInfo.members++;
            return () => { live = false; stores.forEach(store => { try { store.removeChangeListener(listen(store)); } catch (_) {} });
                if (pending !== undefined && global.clearTimeout) global.clearTimeout(pending); };
        }, [guildId]);
    }
    const SERVER_INFO_DARK = {banner:{height:112, backgroundColor:"#4e50584d"}, ring:{borderColor:"#232428", backgroundColor:"#2b2d31"},
        card:{backgroundColor:"#2b2d31", borderRadius:16, paddingHorizontal:16, paddingVertical:14, gap:10},
        tile:{flexGrow:1, flexBasis:"30%", minWidth:96, backgroundColor:"#2b2d31", borderRadius:16, paddingHorizontal:12, paddingVertical:12, gap:4},
        chip:{flexDirection:"row", alignItems:"center", gap:4, paddingHorizontal:8, paddingVertical:3, borderRadius:10, backgroundColor:"#4e50584d"},
        acronym:{backgroundColor:"#5865f2"}};
    function useServerInfoStyles() {
        return useThemed("serverInfo", c => ({banner:Object.assign({}, SERVER_INFO_DARK.banner, {backgroundColor:c.BACKGROUND_MOD_SUBTLE}),
            ring:{borderColor:c.MOBILE_ACTIONSHEET_BACKGROUND || c.BACKGROUND_BASE_LOW, backgroundColor:c.CARD_BACKGROUND_DEFAULT},
            card:Object.assign({}, SERVER_INFO_DARK.card, {backgroundColor:c.CARD_BACKGROUND_DEFAULT}),
            tile:Object.assign({}, SERVER_INFO_DARK.tile, {backgroundColor:c.CARD_BACKGROUND_DEFAULT}),
            chip:Object.assign({}, SERVER_INFO_DARK.chip, {backgroundColor:c.BACKGROUND_MOD_SUBTLE}),
            acronym:{backgroundColor:c.BACKGROUND_BRAND || "#5865f2"}}), SERVER_INFO_DARK);
    }
    function serverText(value, variant, color, fallback, extra) {
        const Text = inspectedExport(5088, "Text");
        return Text ? el(Text, Object.assign({variant, color}, extra), value) : el(RN.Text, Object.assign({style:fallback}, extra), value);
    }
    function serverBoostIcon(level) {
        return level >= 3 ? venusIcon(13820, "BoostTier3Icon") : level === 2 ? venusIcon(16663, "BoostTier2Icon") : venusIcon(12325, "BoostTier1Icon");
    }
    // The top of the sheet: banner, the server's icon over it, name, badges, description and who's online.
    function serverHero(s, snap) {
        const icon = serverIconUri(snap.guild, 160), banner = serverBannerUri(snap.guild);
        const dot = (color, label) => el(RN.View, {key:label, style:{flexDirection:"row", alignItems:"center", gap:6}},
            el(RN.View, {style:{width:10, height:10, borderRadius:5, backgroundColor:color}}),
            serverText(label, "text-sm/medium", "text-muted", {color:"#949ba4", fontSize:14}));
        return el(RN.View, {key:"hero"},
            el(RN.View, {style:[s.banner, {borderRadius:16, overflow:"hidden"}]},
                banner && RN.Image ? el(RN.Image, {source:{uri:banner}, style:{width:"100%", height:"100%"}, resizeMode:"cover"}) : null),
            el(RN.View, {style:{paddingHorizontal:16, marginTop:-40, gap:8}},
                popIn("icon:" + snap.id, el(RN.View, {style:[s.ring, {width:84, height:84, borderRadius:28, borderWidth:4, overflow:"hidden", alignItems:"center", justifyContent:"center"}]},
                    icon && RN.Image ? el(RN.Image, {source:{uri:icon}, style:{width:76, height:76}}) :
                        el(RN.View, {style:[s.acronym, {width:76, height:76, alignItems:"center", justifyContent:"center"}]},
                            el(RN.Text, {style:{color:"#ffffff", fontSize:24, fontWeight:"700"}}, serverAcronym(snap.name))))),
                serverText(snap.name, "heading-xl/bold", "text-strong", {color:"#f2f3f5", fontSize:22, fontWeight:"700"}, {numberOfLines:2, selectable:true}),
                snap.badges.length ? el(RN.View, {style:{flexDirection:"row", flexWrap:"wrap", gap:6}}, snap.badges.map(label =>
                    el(RN.View, {key:label, style:s.chip}, el(venusIcon(6868, "CircleCheckIcon"), {size:"xxs"}),
                        serverText(label, "text-xs/semibold", "text-strong", {color:"#f2f3f5", fontSize:12, fontWeight:"600"})))) : null,
                snap.description ? serverText(snap.description, "text-sm/medium", "text-default", {color:"#dbdee1", fontSize:14}, {selectable:true}) : null,
                el(RN.View, {style:{flexDirection:"row", flexWrap:"wrap", gap:16}},
                    snap.online != null ? dot(STATUS_HEX.online, tr("{count} online", {count:serverNumber(snap.online)})) : null,
                    snap.members != null ? dot(STATUS_HEX.offline, serverCount(snap.members, "{n} member", "{n} members")) : null)));
    }
    // A grid of what's in the server; parts Discord hasn't loaded are left out rather than shown as zero.
    function serverTiles(s, snap) {
        const tile = (key, Icon, value, label, sub) => el(RN.View, {key, style:s.tile, accessible:true, accessibilityLabel:label + ": " + serverNumber(value)},
            el(Icon, {size:"sm"}),
            serverText(serverNumber(value), "heading-lg/bold", "text-strong", {color:"#f2f3f5", fontSize:20, fontWeight:"700"}),
            serverText(label, "text-xs/medium", "text-muted", {color:"#949ba4", fontSize:12}, {numberOfLines:1}),
            sub ? serverText(sub, "text-xxs/medium", "text-muted", {color:"#949ba4", fontSize:11}, {numberOfLines:1}) : null);
        const tiles = [
            snap.channels ? tile("channels", venusIcon(15892, "HashmarkIcon"), snap.channels, tr("Channels"), tr("{text} text, {voice} voice", {text:snap.text, voice:snap.voice})) : null,
            snap.roles != null ? tile("roles", venusIcon(8617, "ShieldUserIcon"), snap.roles, tr("Roles")) : null,
            tile("emojis", venusIcon(8956, "ReactionIcon"), snap.emojis, tr("Emojis")),
            tile("stickers", venusIcon(12274, "StickerIcon"), snap.stickers, tr("Stickers")),
            tile("boosts", serverBoostIcon(snap.boost.level), snap.boost.boosts, tr("Boosts")),
            snap.events ? tile("events", venusIcon(8675, "CalendarIcon"), snap.events, tr("Events")) : null];
        return el(RN.View, {key:"tiles", style:{flexDirection:"row", flexWrap:"wrap", gap:8}}, tiles.filter(Boolean));
    }
    // Boost level, with a bar to the next one.
    function serverBoostCard(s, snap) {
        const b = snap.boost, Icon = serverBoostIcon(b.level);
        return el(RN.View, {key:"boost", style:s.card, accessible:true},
            el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:12}},
                el(Icon, {size:"md"}),
                el(RN.View, {style:{flex:1, gap:2}},
                    serverText(b.level ? tr("Level {level}", {level:b.level}) : tr("No boost level yet"), "text-md/semibold", "text-strong", {color:"#f2f3f5", fontSize:16, fontWeight:"600"}),
                    serverText(serverCount(b.boosts, "{n} boost", "{n} boosts"), "text-sm/medium", "text-muted", {color:"#949ba4", fontSize:14}))),
            el(VenusProgress, {key:"bar", value:b.share}),
            serverText(b.next ? pl(b.need, "{n} more boost for Level {level}", "{n} more boosts for Level {level}", {level:b.next}) : tr("Highest level reached"),
                "text-xs/medium", "text-muted", {color:"#949ba4", fontSize:12}));
    }
    function ServerInfoSheet(props) {
        useSettings("serverInfo"); useServerStores(props.guildId);
        const ui = reviewUI(), s = useServerInfoStyles(), guildId = props.guildId;
        const [looking, setLooking] = React.useState(false), [all, setAll] = React.useState(false);
        React.useEffect(() => {
            if (!serverAskFriends(guildId)) return undefined;
            setLooking(true);
            const timer = later(() => setLooking(false), 2500, false);
            return () => { if (timer !== undefined && global.clearTimeout) global.clearTimeout(timer); };
        }, [guildId]);
        const snap = serverSnapshot(guildId);
        const header = ui.Header ? el(ui.Header, {title:tr("Server info"), trailing:ui.Close ? el(ui.Close, {onPress:() => hideReviewSheet(ui, props.sheetKey)}) : undefined}) : undefined;
        if (!snap) return el(ui.ActionSheet || RN.View, {header}, el(RN.View, {style:{padding:24}},
            serverText(tr("This server isn't available right now."), "text-md/medium", "text-muted", {color:"#949ba4", fontSize:16})));
        const Group = ui.TableRowGroup || RN.View, Row = ui.TableRow, friends = serverFriends(guildId), owner = serverOwner(snap);
        const shown = all ? friends : friends.slice(0, 5), ring = s.ring.borderColor;
        const friendRow = friend => Row ? el(Row, {key:friend.id, label:friend.name,
            subLabel:friend.user.username && friend.user.username !== friend.name ? "@" + friend.user.username : undefined,
            icon:avatarBubble(friend.user, 32, friend.status, ring), arrow:true, onPress:() => serverOpenProfile(friend.id, guildId)}) : null;
        const friendsTitle = friends.length ? serverCount(friends.length, "{n} friend here", "{n} friends here") :
            tr(looking ? "Looking for friends\u2026" : "None of your friends are here");
        const detail = (key, label, value, id, name, onPress) => Row ? el(Row, {key, label:tr(label), subLabel:value, icon:rowIcon(id, name), onPress}) : null;
        const body = [
            serverHero(s, snap),
            serverTiles(s, snap),
            serverBoostCard(s, snap),
            el(Group, {key:"friends", title:tr("Friends")},
                Row ? el(Row, {key:"summary", label:friendsTitle,
                    icon:friends.length ? avatarPile(friends.slice(0, 4).map(f => f.user), ring) : rowIcon(4815, "FriendsIcon"),
                    subLabel:!settings.serverInfoFriends && !friends.length ? tr("Only friends Discord has already loaded show here.") : undefined}) : null,
                shown.map(friendRow),
                friends.length > 5 && Row ? el(Row, {key:"more", label:all ? tr("Show fewer") : tr("Show all {n}", {n:friends.length}), arrow:!all,
                    onPress:() => { animateLayout(); haptic("SELECTION"); setAll(v => !v); }}) : null),
            owner && Row ? el(Group, {key:"owner", title:tr("Owner")},
                el(Row, {key:"owner", label:snap.mine ? tr("You own this server") : owner.name || tr("Loading\u2026"), subLabel:snap.mine ? undefined : owner.handle || undefined,
                    icon:owner.user ? avatarBubble(owner.user, 32, owner.status, ring) : rowIcon(10262, "CrownIcon"), arrow:!snap.mine,
                    trailing:el(venusIcon(10262, "CrownIcon"), {size:"sm", color:"#f0b232"}),
                    onPress:snap.mine ? undefined : () => serverOpenProfile(owner.id, guildId)})) : null,
            el(Group, {key:"details", title:tr("Details")},
                detail("created", "Created", serverDate(snap.created) + " \u00b7 " + serverAge(snap.created), 8675, "CalendarIcon"),
                isFinite(snap.joined) ? detail("joined", "You joined", serverDate(snap.joined) + " \u00b7 " + serverAge(snap.joined), 5032, "UserPlusIcon") : null,
                snap.vanity ? detail("vanity", "Invite link", "discord.gg/" + snap.vanity, 5038, "LinkIcon", () => serverCopy("https://discord.gg/" + snap.vanity, "Link copied")) : null,
                detail("verification", "Verification", serverVerification(snap.verification), 10410, "ShieldIcon"),
                snap.locale ? detail("locale", "Language", languageName(snap.locale), 9099, "GlobeEarthIcon") : null,
                detail("id", "Server ID", snap.id, 10013, "IdIcon", () => serverCopy(snap.id, "Server ID copied"))),
            footnote("note", "Tap the invite link or the server ID to copy it.")];
        const content = el(RN.View, {style:{paddingHorizontal:12, paddingBottom:24, gap:20}}, body.filter(Boolean));
        // Discord's own long sheets (channel picker, forum tags) pass scrollable and scroll with the sheet's
        // BottomSheetScrollView (6307). A plain RN ScrollView fought the sheet's drag: swiping up either scrolled the
        // page or dragged the sheet, and the sheet couldn't be pulled down from the middle of the page.
        const Scroll = inspectedExport(6307, "BottomSheetScrollView");
        return Scroll ? el(ui.ActionSheet || RN.View, {header, scrollable:true}, el(Scroll, null, content)) :
            el(ui.ActionSheet || RN.View, {header}, RN.ScrollView ? el(RN.ScrollView, null, content) : content);
    }
    function openServerInfo(guildId) {
        if (!enabled("serverInfo") || !React || !RN || typeof guildId !== "string") return;
        const ui = reviewUI();
        if (!ui.ActionSheet || typeof ui.showSheet !== "function") { reviewToast(ui, "Server info is unavailable right now.", venusIcon(6296, "CircleXIcon")); return; }
        const key = "VenusServerInfo:" + guildId;
        try { ui.showSheet({key, content:el(ServerInfoSheet, {guildId, sheetKey:key}), stackingBehavior:"stack"}); } catch (_) {}
    }
    // The server icon's hold menu: Server info goes last, after Discord's own rows, in the same shape.
    function serverInfoMenu(orig, self, args) {
        const items = orig.apply(self, args), guildId = args[0] == null ? null : String(args[0]);
        if (!enabled("serverInfo") || !Array.isArray(items) || !guildId || !/^\d{17,20}$/.test(guildId)) return items;
        return items.concat([{IconComponent:venusIcon(5046, "CircleInformationIcon"), label:tr("Server info"), action:() => openServerInfo(guildId)}]);
    }
    // Rewrites a component's props before Discord's own render, through memo and forwardRef wrappers.
    // The change runs inside the render, so it may use hooks, and it always runs, so the hook count never changes.
    function propsComponent(component, change) {
        if (typeof component === "function") {
            const patched = function (props, second) {
                const next = change(props), n = arguments.length;
                if (n <= 1) return component.call(this, next);
                if (n === 2) return component.call(this, next, second);
                const args = Array.from(arguments); args[0] = next;
                return component.apply(this, args);
            };
            if (component.displayName) patched.displayName = component.displayName;
            return patched;
        }
        if (component && typeof component === "object" && component.$$typeof) for (const key of ["type", "render"]) {
            const inner = data(component, key);
            if (!inner || typeof inner !== "function" && typeof inner !== "object") continue;
            const patched = propsComponent(inner, change);
            if (patched !== inner) return cloneWith(component, key, patched);
        }
        return component;
    }
    function withoutGift(props) {
        useSettings("hideGift");
        return enabled("hideGift") && props && props.shouldShowGiftButton ? Object.assign({}, props, {shouldShowGiftButton:false}) : props;
    }
    // Hide extra buttons (#85). Your profile's floating pill (YouBannerDecorations 9115) renders its buttons as elements
    // keyed "conjure", "quests", "shop", "nitro" and "settings" inside YouScreenNavIconMeasurer, which sizes the pill from the
    // buttons it measures: a button taken out is unmeasured and the pill shrinks around the rest, with Discord's own gap.
    const YOU_PILL_KEYS = {quests:"hideButtonsQuests", shop:"hideButtonsShop", nitro:"hideButtonsNitro"};
    function withoutPillButtons(node, depth) {
        if (!node || depth > 8) return node;
        if (Array.isArray(node)) {
            let changed = false;
            const out = [];
            for (const child of node) {
                const next = withoutPillButtons(child, depth + 1);
                if (next !== child) changed = true;
                if (next != null && next !== false) out.push(next); else if (child != null && child !== false) changed = true;
            }
            return changed ? out : node;
        }
        if (typeof node !== "object" || !node.props) return node;
        const setting = node.key != null && YOU_PILL_KEYS[node.key];
        if (setting && settings[setting]) return null;
        const children = node.props.children;
        if (children == null) return node;
        const next = withoutPillButtons(children, depth + 1);
        return next === children ? node : React.cloneElement(node, null, next);
    }
    function youPillButtons(orig, self, args) {
        useSettings("hideButtons");
        const rendered = orig.apply(self, args);
        return enabled("hideButtons") && (settings.hideButtonsQuests || settings.hideButtonsShop || settings.hideButtonsNitro) ? withoutPillButtons(rendered, 0) : rendered;
    }
    // The attach menu's buttons (MediaKeyboardBottomSheetActions 10028) are {text, IconComponent, onPress} in a row where each
    // grows to fill it, so the ones left share the width evenly. Matched by Discord's own icon, never by translated text.
    function attachMenuButtons(props) {
        useSettings("hideButtons");
        const list = props && props.overflowButtons;
        if (!enabled("hideButtons") || !Array.isArray(list)) return props;
        const gone = new Set();
        for (const [, id, name, , key] of HIDE_ATTACH) if (settings[key]) { const Icon = inspectedExport(id, name); if (Icon) gone.add(Icon); }
        if (!gone.size) return props;
        const kept = list.filter(b => !(b && gone.has(b.IconComponent)));
        // Never leave the row empty, whatever Discord adds to it later.
        return kept.length === list.length || !kept.length ? props : Object.assign({}, props, {overflowButtons:kept});
    }
    // The page's preview: the two places as Discord draws them, following the switches below as you flip them.
    const HIDE_PILL = [["quests", 13012, "QuestsIcon", "hideButtonsQuests"], ["shop", 11828, "ShopIcon", "hideButtonsShop"],
        ["nitro", 9031, "NitroWheelIcon", "hideButtonsNitro"], ["settings", 7092, "SettingsIcon", null]];
    const HIDE_ATTACH = [["photos", 8210, "ImageIcon", "Photos", "hideButtonsPhotos"], ["polls", 10022, "PollsIcon", "Polls", "hideButtonsPolls"],
        ["apps", 8229, "AppsIcon", "Apps", "hideButtonsApps"], ["files", 10024, "AttachmentIcon", "Files", null]];
    const HIDE_PREVIEW_DARK = {stage:{borderRadius:16, overflow:"hidden", backgroundColor:"#1a1a1e", borderWidth:1, borderColor:"#ffffff14", padding:16, gap:18},
        pill:{flexDirection:"row", alignSelf:"center", alignItems:"center", gap:8, padding:8, borderRadius:28, backgroundColor:"#2b2d31",
            shadowColor:"#000000", shadowOpacity:0.25, shadowRadius:8, shadowOffset:{width:0, height:3}, elevation:4},
        round:{width:40, height:40, borderRadius:20, alignItems:"center", justifyContent:"center", backgroundColor:"#ffffff0f"},
        bar:{flexDirection:"row", gap:8, padding:8, borderRadius:20, backgroundColor:"#2b2d31", borderWidth:1, borderColor:"#ffffff0f"},
        button:{flexGrow:1, flexBasis:0, minHeight:64, alignItems:"center", justifyContent:"center", gap:6, borderRadius:14, backgroundColor:"#ffffff0f"},
        label:{color:"#dbdee1", fontSize:12, fontWeight:"600"}, caption:{color:"#949ba4", fontSize:12, fontWeight:"600", textAlign:"center"}, icon:{color:"#dbdee1"}};
    // Files always stays, so the row is never empty; the fallback only guards against a future Discord change.
    function attachShown(isHidden) { const left = HIDE_ATTACH.filter(b => !isHidden(b)); return left.length ? left : HIDE_ATTACH; }
    // Written out so every label is a plain tr() call the language check can see.
    function hideAttachLabel(k) { return k === "photos" ? tr("Photos") : k === "polls" ? tr("Polls") : k === "apps" ? tr("Apps") : tr("Files"); }
    function HideButtonsPreview(props) {
        useSettings("hideButtons");
        const s = useThemed("hidePreview", c => ({stage:Object.assign({}, HIDE_PREVIEW_DARK.stage, {backgroundColor:c.BACKGROUND_BASE_LOWER || c.CHANNEL_BACKGROUND_DEFAULT, borderColor:c.BORDER_SUBTLE}),
            pill:Object.assign({}, HIDE_PREVIEW_DARK.pill, {backgroundColor:c.BACKGROUND_SURFACE_HIGH || c.CARD_BACKGROUND_DEFAULT}),
            round:Object.assign({}, HIDE_PREVIEW_DARK.round, {backgroundColor:c.BACKGROUND_MOD_SUBTLE}),
            bar:Object.assign({}, HIDE_PREVIEW_DARK.bar, {backgroundColor:c.MOBILE_FLOATINGBAR_BACKGROUND_HIGHER || c.BACKGROUND_SURFACE_HIGH, borderColor:c.BORDER_MUTED || c.BORDER_SUBTLE}),
            button:Object.assign({}, HIDE_PREVIEW_DARK.button, {backgroundColor:c.BACKGROUND_MOD_SUBTLE}),
            label:Object.assign({}, HIDE_PREVIEW_DARK.label, {color:c.TEXT_DEFAULT}), caption:Object.assign({}, HIDE_PREVIEW_DARK.caption, {color:c.TEXT_MUTED}),
            icon:{color:c.INTERACTIVE_ICON_DEFAULT || c.TEXT_DEFAULT}}), HIDE_PREVIEW_DARK);
        const hidden = key => props.on && key && settings[key];
        return el(RN.View, {key:"preview", style:s.stage, accessible:true, accessibilityLabel:tr("Buttons preview")},
            el(RN.Text, {style:s.caption}, tr("Your profile")),
            el(RN.View, {style:s.pill}, HIDE_PILL.filter(b => !hidden(b[3])).map(([k, id, name]) =>
                el(RN.View, {key:k, style:s.round}, el(venusIcon(id, name), {size:"sm", color:s.icon.color})))),
            el(RN.Text, {style:s.caption}, tr("Attach menu")),
            el(RN.View, {style:s.bar}, attachShown(b => hidden(b[4])).map(([k, id, name, label]) =>
                el(RN.View, {key:k, style:s.button}, el(venusIcon(id, name), {size:"md", color:s.icon.color}),
                    el(RN.Text, {numberOfLines:1, style:s.label}, hideAttachLabel(k))))));
    }
    function HideButtonsSettings() {
        useSettings("hideButtons");
        const ui = reviewUI();
        if (!React || !RN) return null;
        const on = enabled("hideButtons"), Group = ui.TableRowGroup || RN.View, Switch = ui.TableSwitchRow;
        const groups = [
            on ? null : offCard("status", venusIcon(15612, "CircleMinusIcon"), "hideButtons"),
            el(HideButtonsPreview, {key:"preview", on}),
            el(Group, {key:"profile", title:tr("On your profile")},
                switchRow(Switch, "hideButtonsQuests", "Quests", "The Quests button at the bottom of your profile.", rowIcon(13012, "QuestsIcon")),
                switchRow(Switch, "hideButtonsShop", "Shop", "The Shop button at the bottom of your profile.", rowIcon(11828, "ShopIcon")),
                switchRow(Switch, "hideButtonsNitro", "Nitro", "The Nitro button at the bottom of your profile.", rowIcon(9031, "NitroWheelIcon"))),
            el(Group, {key:"attach", title:tr("In the attach menu")},
                switchRow(Switch, "hideButtonsApps", "Apps", "Activities and app commands.", rowIcon(8229, "AppsIcon")),
                switchRow(Switch, "hideButtonsPolls", "Polls", "Start a poll.", rowIcon(10022, "PollsIcon")),
                switchRow(Switch, "hideButtonsPhotos", "Photos", "Opens your full gallery. Recent photos still show above the buttons.", rowIcon(8210, "ImageIcon"))),
            footnote("note", "The buttons that are left move together and grow to fill the space, so there are no gaps.")];
        return settingsBody(ui, groups);
    }
    // Unlock app icons: lets you pick any Discord app icon in Settings -> App Icon without Nitro, stops
    // AppIconPremiumManager (18051) from resetting the icon on app state changes, and removes the "Unlock all
    // icons with Nitro" upsell button and "Nitro" section heading on the App Icon screen (15831 / 15832).
    const appIconCache = new WeakMap();
    function appIconObject(icon) {
        if (!enabled("appIcons") || !icon || typeof icon !== "object" || !icon.isPremium) return icon;
        let cached = appIconCache.get(icon);
        if (!cached) appIconCache.set(icon, cached = Object.assign({}, icon, {isPremium:false}));
        return cached;
    }
    function appIconsList(orig, self, args) {
        const list = orig.apply(self, args);
        return enabled("appIcons") && Array.isArray(list) ? list.map(appIconObject) : list;
    }
    function hookAppIconConstants(exports) {
        if (!exports) return exports;
        exports = hookExport(exports, "getIconById", (orig, self, args) => appIconObject(orig.apply(self, args)));
        exports = hookExport(exports, "getIcons", appIconsList);
        exports = hookExport(exports, "getOfficialAlternateIcons", appIconsList);
        return hookExport(exports, "getLimitedAlternateIcons", appIconsList);
    }
    function hookAppIconPremiumManager(exports) {
        const mgr = exports && exports.default;
        if (!mgr) return exports;
        let patched = hookExport(mgr, "validateAndResetIfNeeded", function (orig, self, args) {
            return enabled("appIcons") ? Promise.resolve() : orig.apply(self, args);
        });
        patched = hookExport(patched, "resetIcon", function (orig, self, args) {
            if (enabled("appIcons")) return;
            return orig.apply(self, args);
        });
        return replaceValue(exports, "default", patched);
    }
    function withoutAppIconUpsell(node, depth, UpsellButton, TableRow) {
        if (!node || typeof node !== "object" || depth > 8) return node;
        if (Array.isArray(node)) {
            let changed = false;
            const out = [];
            for (let i = 0; i < node.length; i++) {
                const child = withoutAppIconUpsell(node[i], depth + 1, UpsellButton, TableRow);
                if (child !== node[i]) changed = true;
                if (child !== null) out.push(child);
            }
            return changed ? out : node;
        }
        if (typeof node.type === "function" && (node.type.name === "AppIconRows" || node.type.displayName === "AppIconRows")) {
            try { return withoutAppIconUpsell(node.type(node.props || {}), depth + 1, UpsellButton, TableRow); } catch (_) {}
        }
        if (!node.props) return node;
        if (UpsellButton && (node.type === UpsellButton || node.type && node.type.type === UpsellButton)) return null;
        if (typeof node.props.text === "string" && typeof node.props.onPress === "function" &&
            node.type !== TableRow) return null;
        let props = node.props;
        // AppIconRows (15832) sets title="Nitro" on the alternate icons TableRowGroup when !hasNitro.
        if (typeof props.title === "string" && /nitro/i.test(props.title))
            props = Object.assign({}, props, {title:undefined});
        const children = props.children, next = withoutAppIconUpsell(children, depth + 1, UpsellButton, TableRow);
        if (next !== children) {
            if (next === null || Array.isArray(next) && !next.length && props.style && !props.label && !props.icon) return null;
            props = Object.assign({}, props, {children:next});
        }
        return props === node.props ? node : React.cloneElement(node, props);
    }
    // Unlock Nitro themes: Discord's gradient themes are a Nitro perk. The capability check (PremiumUtils 4769
    // canUseClientThemes, ProductCatalog 14299 CLIENT_THEMES) says yes for you, the theme picker (15566) is told the themes
    // aren't locked, and ClientThemesBackgroundStore (4937) stops treating a chosen gradient as a preview it throws away.
    // Only this phone changes: a gradient theme is a local look, and nobody else ever sees it.
    function hookThemeBackgroundStore(exports) {
        const themeStore = exports && exports.default;
        if (!themeStore || typeof themeStore !== "object") return exports;
        let holder = themeStore, own = null;
        while (holder && !(own = Object.getOwnPropertyDescriptor(holder, "isPreview"))) holder = Object.getPrototypeOf(holder);
        if (own && typeof own.get === "function") {
            const get = own.get;
            try {
                Object.defineProperty(themeStore, "isPreview", {configurable:true, enumerable:false,
                    get() { return enabled("nitroThemes") ? false : get.call(this); }});
            } catch (_) {}
        }
        return exports;
    }
    // Why the theme fell back to Dark: picking a gradient saves it to your account (saveClientTheme 5260 ->
    // PreloadedUserSettingsActionCreators.updateAsync("appearance") 2046), and Discord's servers drop a gradient an account
    // without Nitro isn't allowed. The next settings sync (USER_SETTINGS_PROTO_UPDATE) or reconnect (CONNECTION_OPEN)
    // then replaced the local copy with the server's, so the gradient vanished and the theme went back to Dark.
    // Now the gradient and its base theme are kept on this phone (nitroTheme in the settings file), stripped from what
    // is sent to Discord, and laid back over every copy of your settings that comes in, before any store reads it.
    // Accounts that really have Nitro are left alone: their gradient syncs like before.
    const nitroTheme = {preset:null, theme:null, attached:false};
    function nitroThemeOwnsGradient() {
        if (!enabled("nitroThemes")) return false;
        const me = currentUser();
        if (!me) return false;
        if (typeof premiumOriginal.canUseClientThemes === "function") return !capability("canUseClientThemes", me);
        return me.premiumType !== 2;
    }
    function nitroThemeProtoTypes() {
        const A = inspectedExport(1209, "AppearanceSettings"), C = inspectedExport(1209, "ClientThemeSettings"), U = inspectedExport(1240, "UInt32Value");
        return A && C && U && typeof A.create === "function" && typeof C.create === "function" && typeof U.create === "function" ? {A, C, U} : null;
    }
    // A new appearance message: everything the given one had, plus the gradient and theme kept on this phone.
    function nitroThemeAppearance(appearance) {
        const types = nitroThemeProtoTypes();
        if (!types || nitroTheme.preset == null) return null;
        const fields = Object.assign({}, appearance || {});
        if (typeof nitroTheme.theme === "number") fields.theme = nitroTheme.theme;
        fields.clientThemeSettings = types.C.create({backgroundGradientPresetId:types.U.create({value:nitroTheme.preset})});
        try { return types.A.create(fields); } catch (_) { return null; }
    }
    function nitroThemeSettingsType() {
        const types = inspectedExport(1095, "UserSettingsTypes");
        return types && typeof types.PRELOADED_USER_SETTINGS === "number" ? types.PRELOADED_USER_SETTINGS : 1;
    }
    // Flux interceptor (Dispatcher 584): runs before every store, so ThemeStore and ClientThemesBackgroundStore only ever
    // see your gradient. Returns false so the action always goes on to Discord.
    function nitroThemeIntercept(action) {
        if (!action || nitroTheme.preset == null || (action.type !== "CONNECTION_OPEN" && action.type !== "USER_SETTINGS_PROTO_UPDATE")) return false;
        try {
            if (!nitroThemeOwnsGradient()) return false;
            if (action.type === "CONNECTION_OPEN") {
                const proto = action.userSettingsProto;
                if (proto && typeof proto === "object") {
                    const appearance = nitroThemeAppearance(proto.appearance);
                    if (appearance) proto.appearance = appearance;
                }
                return false;
            }
            const incoming = action.settings;
            if (!incoming || incoming.type !== nitroThemeSettingsType() || !incoming.proto || typeof incoming.proto !== "object") return false;
            const proto = incoming.proto;
            // A partial update without appearance leaves the appearance already shown alone.
            if (action.partial && !proto.appearance) return false;
            const appearance = nitroThemeAppearance(proto.appearance);
            if (!appearance) return false;
            // Never change the proto object itself: for a local edit it is also what gets sent to Discord.
            const PreloadedUserSettings = inspectedExport(1209, "PreloadedUserSettings");
            let copy = null;
            try { copy = PreloadedUserSettings && typeof PreloadedUserSettings.create === "function" ? PreloadedUserSettings.create(Object.assign({}, proto, {appearance})) : null; } catch (_) { copy = null; }
            if (!copy) copy = Object.assign(Object.create(Object.getPrototypeOf(proto)), proto, {appearance});
            action.settings = Object.assign({}, incoming, {proto:copy});
        } catch (_) {}
        return false;
    }
    function nitroThemeAttach(dispatcher) {
        if (nitroTheme.attached || !dispatcher || typeof dispatcher.addInterceptor !== "function") return;
        nitroTheme.attached = true;
        try { dispatcher.addInterceptor(nitroThemeIntercept); } catch (_) { nitroTheme.attached = false; }
    }
    function nitroThemeRemember(preset, theme) {
        const nextPreset = typeof preset === "number" && Number.isFinite(preset) ? preset : null;
        const nextTheme = nextPreset == null ? null : typeof theme === "number" && Number.isFinite(theme) ? theme : null;
        if (nitroTheme.preset === nextPreset && nitroTheme.theme === nextTheme) return;
        nitroTheme.preset = nextPreset; nitroTheme.theme = nextTheme;
        save();
    }
    // Every appearance edit goes through updateAsync with a function that changes a copy of your appearance settings.
    // Afterwards, a gradient in it is remembered here and left out of what Discord receives.
    function nitroThemeUpdateAsync(orig, self, args) {
        if (args[0] !== "appearance" || typeof args[1] !== "function" || !nitroThemeOwnsGradient()) return orig.apply(self, args);
        const change = args[1];
        const next = Array.from(args);
        next[1] = function (appearance) {
            const result = change.apply(this, arguments);
            try {
                if (appearance && typeof appearance === "object") {
                    const settingsNow = appearance.clientThemeSettings;
                    const id = settingsNow && settingsNow.backgroundGradientPresetId;
                    const preset = id && typeof id === "object" ? id.value : typeof id === "number" ? id : null;
                    nitroThemeRemember(preset, appearance.theme);
                    if (preset != null) appearance.clientThemeSettings = undefined;
                }
            } catch (_) {}
            return result;
        };
        return orig.apply(self, next);
    }
    // Shows the kept gradient again without asking Discord: a local partial settings update that the interceptor fills in.
    // Used when the settings file finishes loading after Discord already applied the server's copy.
    function nitroThemeReapply() {
        if (nitroTheme.preset == null || !nitroTheme.attached || !nitroThemeOwnsGradient()) return;
        try {
            const creators = inspectedExport(2046, "PreloadedUserSettingsActionCreators");
            const current = creators && typeof creators.getCurrentValue === "function" ? creators.getCurrentValue() : null;
            const PreloadedUserSettings = inspectedExport(1209, "PreloadedUserSettings");
            const dispatcher = inspectedExport(584, "default");
            if (!current || !PreloadedUserSettings || !dispatcher) return;
            const proto = PreloadedUserSettings.create({appearance:current.appearance});
            dispatcher.dispatch({type:"USER_SETTINGS_PROTO_UPDATE", local:true, partial:true, settings:{type:nitroThemeSettingsType(), proto}});
        } catch (_) {}
    }
    // Turning the feature off takes the gradient away right here; Discord's own settings show again after the next sync.
    function nitroThemeTurnedOff() {
        if (nitroTheme.preset == null) return;
        nitroTheme.preset = null; nitroTheme.theme = null;
        try {
            const reset = inspectedExport(15460, "resetBackgroundGradientPreset");
            if (typeof reset === "function") reset();
        } catch (_) {}
    }
    function nitroThemePicker(orig, self, args) {
        useSettings("nitroThemes");
        const props = args[0];
        if (!enabled("nitroThemes") || !props || props.themeSelector !== "nitro") return orig.apply(self, args);
        const next = Array.from(args); next[0] = Object.assign({}, props, {themeSelector:undefined});
        return orig.apply(self, next);
    }
    function appIconsScreen(orig, self, args) {
        useSettings("appIcons");
        const rendered = orig.apply(self, args);
        return enabled("appIcons") && React ? withoutAppIconUpsell(rendered, 0, inspectedExport(9778, "default"), inspectedExport(6180, "TableRow") || null) : rendered;
    }
    // Hide call button: UserProfileContactButtons (13425) draws Message and Call side by side, each in a
    // flex:1 slot, or as icon buttons next to a friend button. Its disableCalls prop only greys Call out, so
    // the Call button and the slot it sat in are left out of what it renders. Message's slot then takes the
    // whole row, and the change animates when the setting flips while a profile is open.
    // The icon is looked up once per render, not once for every element in the row.
    function withoutCall(node, depth, Phone) {
        if (!node || typeof node !== "object" || depth > 12) return node;
        if (Array.isArray(node)) {
            let changed = false;
            const next = node.map(child => { const value = withoutCall(child, depth + 1, Phone); if (value !== child) changed = true; return value; });
            return changed ? next.filter(child => child !== null) : node;
        }
        if (!node.props) return node;
        const icon = node.props.icon;
        if (icon && icon.type === Phone) return null;
        const children = node.props.children, next = withoutCall(children, depth + 1, Phone);
        if (next === children) return node;
        // A slot that only held the Call button goes too, so nothing keeps half the row.
        if (next === null || Array.isArray(next) && !next.length) return null;
        return React.cloneElement(node, Object.assign({}, node.props, {children:next}));
    }
    function profileButtons(orig, self, args) {
        useSettings("hideCall");
        const hidden = !!enabled("hideCall"), last = React.useRef(hidden);
        if (last.current !== hidden) {
            last.current = hidden;
            const animate = RN && RN.LayoutAnimation;
            try { if (animate && animate.Presets) animate.configureNext(animate.Presets.easeInEaseOut); } catch (_) {}
        }
        const rendered = orig.apply(self, args);
        if (!hidden) return rendered;
        const Phone = inspectedExport(9317, "PhoneCallIcon");
        return Phone ? withoutCall(rendered, 0, Phone) : rendered;
    }
    // Discord's own "no Quest to show" answer, so the dock, the space kept for it and its tracking all go away together.
    let noQuestDock = null;
    function questDockHidden() { useSettings("hideQuestDock"); return enabled("hideQuestDock"); }
    function hideQuestHooks(exports) {
        const types = inspectedExport(5979, "AdCreativeType");
        if (!types || types.NO_FILL === undefined) return exports;
        noQuestDock = Object.freeze({type:types.NO_FILL});
        exports = hookExport(exports, "useMobileQuestDock", (orig, self, args) => { const dock = orig.apply(self, args); return questDockHidden() ? noQuestDock : dock; });
        exports = hookExport(exports, "useMobileQuestDockHeight", (orig, self, args) => { const height = orig.apply(self, args); return questDockHidden() ? 0 : height; });
        for (const key of ["useIsMobileQuestDockRendered", "useIsMobileQuestDockRenderedBase", "useIsMobileQuestDockVisibleToUser"])
            exports = hookExport(exports, key, (orig, self, args) => { const value = orig.apply(self, args); return questDockHidden() ? false : value; });
        return exports;
    }
    // The dock itself sits in its own component, so switching it off unmounts it instead of changing its hooks.
    function hideQuestDock(exports) {
        const Dock = exports && exports.default;
        if (!Dock) return exports;
        const HiddenQuestDock = function (props) { return questDockHidden() ? null : el(Dock, props); };
        HiddenQuestDock.displayName = "QuestDock";
        return replaceValue(exports, "default", HiddenQuestDock);
    }
    // React Native emojis (reaction lists, statuses, the emoji grid) draw a Unicode emoji with the phone's
    // font when forceTextEmoji is set. Only Unicode emojis: custom ones have a CDN picture and a word for a name.
    function systemEmojiProps(props) {
        // A word is a custom emoji's name. Keycaps (#\uFE0F\u20E3, 1\uFE0F\u20E3...) start with a digit or # but
        // are Unicode emojis too, and used to keep Discord's picture.
        if (!emojiInUse || !features.systemEmoji || !props || props.forceTextEmoji || typeof props.name !== "string" || !props.name ||
            /[A-Za-z_:]/.test(props.name) || /[0-9#*]/.test(props.name) && !/^[0-9#*]\uFE0F?\u20E3$/.test(props.name)) return props;
        const src = props.src, uri = src && typeof src === "object" ? src.uri : src;
        if (uri != null && !(typeof uri === "string" && /^asset:/.test(uri))) return props;
        return Object.assign({}, props, {forceTextEmoji:true});
    }
    function cloneWith(object, key, value) {
        // ES module markers, React tags, symbols and lazy getters are not necessarily enumerable.
        // Object.assign loses them and Metro imports the exports object as a component.
        const descriptors = Object.getOwnPropertyDescriptors(object);
        const old = descriptors[key];
        descriptors[key] = { value, writable: true, configurable: true, enumerable: old ? old.enumerable : true };
        return Object.create(Object.getPrototypeOf(object), descriptors);
    }
    function replaceValue(object, key, value) {
        const descriptor = Object.getOwnPropertyDescriptor(object, key);
        // Flux/store methods live on prototypes. Shadow them on the same instance:
        // cloning a live store would split dispatch state, subscriptions or private fields.
        if (!descriptor && Object.isExtensible(object)) {
            Object.defineProperty(object, key, {value, writable:true, configurable:true, enumerable:true});
            return object;
        }
        if (descriptor && descriptor.configurable) {
            Object.defineProperty(object, key, { value, writable: true, configurable: true, enumerable: descriptor.enumerable });
            return object;
        }
        if (descriptor && "value" in descriptor && descriptor.writable) { object[key] = value; return object; }
        return cloneWith(object, key, value);
    }
    function hookExport(exports, key, operation) {
        const orig = exports && exports[key];
        if (typeof orig !== "function") return exports;
        // Hot two-argument hooks (permission checks, message lookups) can declare operation.call2(orig, self, a, b):
        // passing `arguments` on to apply is ~3x the cost of the call itself on Hermes.
        // One-argument hooks (RowGenerator.generate) can declare operation.call1(orig, self, a) the same way.
        const call2 = operation.call2, call1 = operation.call1;
        const patched = typeof call2 === "function" && typeof call1 === "function" ?
            function (a, b) {
                const n = arguments.length;
                return n === 1 ? call1(orig, this, a) : n === 2 ? call2(orig, this, a, b) : operation(orig, this, arguments);
            } :
            typeof call2 === "function" ?
            function (a, b) { return arguments.length === 2 ? call2(orig, this, a, b) : operation(orig, this, arguments); } :
            typeof call1 === "function" ?
            function (a) { return arguments.length === 1 ? call1(orig, this, a) : operation(orig, this, arguments); } :
            function () { return operation(orig, this, arguments); };
        copyStatics(patched, orig);
        return replaceValue(exports, key, patched);
    }
    // A wrapper must keep the static members of the function it replaces: resolveAssetSource (81) carries
    // addCustomSourceTransformer and pickScale, which BundleUpdater calls at launch, and Image (328) carries getSize,
    // prefetch and resolveAssetSource. Losing them crashed Discord on start with "undefined is not a function".
    function copyStatics(target, source) {
        const names = Object.getOwnPropertyNames(source);
        for (let i = 0; i < names.length; i++) {
            const name = names[i];
            if (name === "length" || name === "name" || name === "prototype" || name === "arguments" || name === "caller") continue;
            const descriptor = Object.getOwnPropertyDescriptor(source, name);
            if (descriptor) try { Object.defineProperty(target, name, descriptor); } catch (_) {}
        }
        return target;
    }
    // Hook a component export (plain function, or memo/forwardRef object) without breaking React tags.
    function hookComponent(exports, operation, key) {
        key = key || "default";
        const component = exports && exports[key];
        if (component && typeof component === "object" && component.$$typeof) {
            const inner = typeof component.type === "function" ? "type" : typeof component.render === "function" ? "render" : null;
            if (!inner) return exports;
            const orig = component[inner], call2 = operation.call2, call1 = operation.call1;
            const patched = typeof call2 === "function" ?
                function (a, b) { return arguments.length === 2 ? call2(orig, this, a, b) : operation(orig, this, arguments); } :
                typeof call1 === "function" ?
                function (a) { return arguments.length === 1 ? call1(orig, this, a) : operation(orig, this, arguments); } :
                function () { return operation(orig, this, arguments); };
            copyStatics(patched, orig);
            return replaceValue(exports, key, cloneWith(component, inner, patched));
        }
        return hookExport(exports, key, operation);
    }
    // Fix unknown mentions (based on ValidUser by fshin, o.oer and kmmiio99o): a mention of someone Discord hasn't
    // loaded shows as @unknown-user. Instead of a "Fix mentions" button on every message, messages are checked as
    // they arrive or load. Unknown IDs are looked up one at a time with Discord's own getUser (GET /users/:id, which
    // adds the user to UserStore), and each affected message is redrawn so the mention shows the name.
    const MENTION_ID = /<@!?(\d{17,20})>/g;
    const VALID_EVENTS = ["MESSAGE_CREATE", "MESSAGE_UPDATE", "LOAD_MESSAGES_SUCCESS", "LOAD_MESSAGES_AROUND_SUCCESS", "LOCAL_MESSAGES_LOADED"];
    const valid = {dispatcher:null, queue:[], queued:new Set(), tried:new Set(), waiting:new Map(), running:false, refreshing:new Set(), generation:0};
    function mentionIds(text, out) {
        // Most text has no mention at all: one indexOf, no regex run.
        if (typeof text !== "string" || text.indexOf("<@") < 0) return;
        MENTION_ID.lastIndex = 0;
        let match;
        while ((match = MENTION_ID.exec(text))) out.add(match[1]);
    }
    function componentIds(components, out, depth) {
        if (!components || !components.length || depth > 6 || !Array.isArray(components)) return;
        for (let i = 0; i < components.length; i++) {
            const component = components[i];
            if (component) {
                mentionIds(component.content, out);
                if (component.components && component.components.length) componentIds(component.components, out, depth + 1);
            }
        }
    }
    // Every place a raw (server-shaped) message can mention someone: text, embeds, components and forwards.
    function messageMentionIds(message, out) {
        const content = message.content;
        if (typeof content === "string" && content.indexOf("<@") >= 0) mentionIds(content, out);
        const embeds = message.embeds;
        if (embeds && embeds.length && Array.isArray(embeds)) for (let i = 0; i < embeds.length; i++) {
            const embed = embeds[i];
            if (embed) {
                mentionIds(embed.title, out); mentionIds(embed.description, out);
                mentionIds(embed.rawTitle, out); mentionIds(embed.rawDescription, out);
                if (embed.footer) mentionIds(embed.footer.text, out);
                const fields = embed.fields;
                if (fields && fields.length && Array.isArray(fields)) for (let j = 0; j < fields.length; j++) {
                    const field = fields[j];
                    if (field) {
                        mentionIds(field.name, out); mentionIds(field.value, out); mentionIds(field.rawName, out); mentionIds(field.rawValue, out);
                    }
                }
            }
        }
        const comps = message.components;
        if (comps && comps.length) componentIds(comps, out, 0);
        const snapshots = message.message_snapshots || message.messageSnapshots;
        if (snapshots && snapshots.length && Array.isArray(snapshots)) for (let k = 0; k < snapshots.length; k++) {
            const inner = snapshots[k] && snapshots[k].message;
            if (inner) { mentionIds(inner.content, out); if (inner.components && inner.components.length) componentIds(inner.components, out, 0); }
        }
        return out;
    }
    function knownUser(id) { try { return !!(userStore && userStore.getUser(id)); } catch (_) { return true; } }
    function validInit(dispatcher) {
        if (valid.dispatcher || !dispatcher || typeof dispatcher.subscribe !== "function") return;
        valid.dispatcher = dispatcher;
        VALID_EVENTS.forEach(type => dispatcher.subscribe(type, validEvent));
        dispatcher.subscribe("LOGOUT", validReset);
    }
    function validReset() {
        valid.generation++; valid.queue.length = 0; valid.queued.clear(); valid.tried.clear(); valid.waiting.clear(); valid.running = false;
    }
    // One reused set per check: a channel load hands over 50 messages at once.
    const validScratch = new Set();
    function validEvent(event) {
        if (!enabled("validUser") || !event || !userStore) return;
        const channelId = event.channelId;
        if (event.message) validMessage(event.message, event.message.channel_id || channelId);
        const msgs = event.messages;
        if (msgs && msgs.length && Array.isArray(msgs)) for (let i = 0; i < msgs.length; i++) {
            const message = msgs[i];
            if (message) validMessage(message, message.channel_id || channelId);
        }
    }
    function validMessage(message, channelId) {
        if (!message || !message.id || !channelId || valid.refreshing.size && valid.refreshing.has(message.id)) return;
        if (validScratch.size) validScratch.clear();
        messageMentionIds(message, validScratch);
        if (!validScratch.size) return;
        const missing = [];
        validScratch.forEach(id => { if (!valid.tried.has(id) && !knownUser(id)) missing.push(id); });
        validScratch.clear();
        if (!missing.length) return;
        // Remember the raw message so it can be redrawn once its people are known.
        const key = channelId + ":" + message.id;
        let entry = valid.waiting.get(key);
        if (!entry) {
            if (valid.waiting.size >= 300) valid.waiting.delete(valid.waiting.keys().next().value);
            valid.waiting.set(key, entry = {channelId, id:message.id, ids:new Set()});
        }
        entry.content = typeof message.content === "string" ? message.content : "";
        entry.embeds = Array.isArray(message.embeds) ? message.embeds : null;
        entry.components = Array.isArray(message.components) ? message.components : null;
        missing.forEach(id => {
            entry.ids.add(id);
            if (!valid.queued.has(id)) { valid.queued.add(id); valid.queue.push(id); }
        });
        // Never dispatch in the middle of Discord's own dispatch.
        if (!valid.running) { valid.running = true; later(validNext, 250); }
    }
    function deletedUser(id) {
        return {id, username:"Deleted User", global_name:null, discriminator:"0000", avatar:null, avatar_decoration_data:null, bot:false, system:false, public_flags:0};
    }
    function validNext() {
        const generation = valid.generation;
        if (!enabled("validUser")) { valid.running = false; return; }
        const id = valid.queue.shift();
        if (id === undefined) { valid.running = false; return; }
        valid.queued.delete(id);
        if (valid.tried.size >= 5000) valid.tried.delete(valid.tried.values().next().value);
        valid.tried.add(id);
        const getUser = inspectedExport(8301, "getUser");
        let wait = 400;
        Promise.resolve().then(() => {
            if (knownUser(id)) return;
            if (typeof getUser !== "function") throw new Error("getUser unavailable");
            return getUser(id);
        }).catch(error => {
            const code = error && (error.status || error.statusCode), body = error && error.body;
            // Only a real "Unknown User" answer means the account is gone; anything else is retried later.
            if (code === 404 || body && body.code === 10013) {
                if (valid.dispatcher) valid.dispatcher.dispatch({type:"USER_UPDATE", user:deletedUser(id)});
            } else {
                valid.tried.delete(id);
                if (code === 429) {
                    const retry = Number(body && body.retry_after);
                    wait = Math.min(60000, Math.max(1000, Number.isFinite(retry) ? retry * 1000 : 5000));
                    if (!valid.queued.has(id)) { valid.queued.add(id); valid.queue.unshift(id); }
                }
            }
        }).then(() => {
            if (generation !== valid.generation) return;
            validRefresh();
            later(validNext, wait);
        });
    }
    // Redraw each waiting message whose people are all known now. Discord keeps a row until its message record
    // changes, so its text is changed for a moment (a zero-width space) and then put back, like ValidUser does.
    function validRefresh() {
        if (!valid.dispatcher) return;
        for (const [key, entry] of Array.from(valid.waiting)) {
            let pending = false;
            entry.ids.forEach(id => { if (!knownUser(id) && (valid.queued.has(id) || !valid.tried.has(id))) pending = true; });
            if (pending) continue;
            valid.waiting.delete(key);
            if (!Array.from(entry.ids).some(knownUser)) continue;
            validRedraw(entry);
        }
    }
    function validRedraw(entry) {
        const dispatch = message => { try { valid.dispatcher.dispatch({type:"MESSAGE_UPDATE", message}); } catch (_) {} };
        const restore = {id:entry.id, channel_id:entry.channelId};
        if (entry.embeds && entry.embeds.length) restore.embeds = entry.embeds.slice();
        if (entry.components && entry.components.length) restore.components = entry.components.slice();
        if (entry.content) restore.content = entry.content;
        valid.refreshing.add(entry.id);
        if (entry.content) {
            const temp = {id:entry.id, channel_id:entry.channelId, content:entry.content + "\u200b"};
            if (restore.embeds) temp.embeds = entry.embeds.slice();
            if (restore.components) temp.components = entry.components.slice();
            dispatch(temp);
            later(() => { dispatch(restore); valid.refreshing.delete(entry.id); }, 120);
        } else {
            // Cloned embed and component arrays make a new record reference by themselves.
            if (restore.embeds || restore.components) dispatch(restore);
            valid.refreshing.delete(entry.id);
        }
    }

    // User activity notifications (based on UserNotif by cywrx and coder.gg): shows a toast when chosen friends or
    // people by user ID change status, start typing or send a message. Friends can be watched all at once or picked
    // one by one from the friend picker, and non-friends who share a server can be added by user ID as a backup.
    // Leaving the app on Android normally closes Discord's Gateway socket (GatewayConnectionStore 5757 ->
    // GatewaySocketSingleton 13933 socket.close(true)) and lets Android suspend timers. While a Quest is running or
    // background push notifications are enabled, keep the socket open and hold Discord's ForegroundServiceManager
    // (9699) wake lock so Quests finish and activity notifications arrive outside the app.
    const BACKGROUND_SERVICE_KEY = "venus-background";
    const bgKeepAlive = {active:false, title:"", content:"", socketHooked:false, pauseHooked:false, fg:null, setIsPaused:null};
    function isAppActive() {
        const store = inspectedExport(1999, "default");
        try {
            if (store && typeof store.getState === "function") return store.getState() === "active";
        } catch (_) {}
        try {
            const state = RN && RN.AppState && RN.AppState.currentState;
            if (typeof state === "string" && state) return state === "active";
        } catch (_) {}
        return true;
    }
    function userNotifHasTargets() {
        return !!(enabled("userNotif") && (settings.userNotifStatus || settings.userNotifMessages || settings.userNotifTyping) &&
            (settings.userNotifFriends || userNotif.ids.size > 0));
    }
    function backgroundNeeded() {
        const questBusy = !!(enabled("quests") && (quest.running || quest.enrolling));
        const badgeBusy = !!(enabled("badges") && (badges.current && badgeNeedsGame() || badges.granting));
        const pushListening = !!(settings.userNotifPush && userNotifHasTargets());
        return questBusy || badgeBusy || pushListening;
    }
    function unpauseGateway() {
        let fn = bgKeepAlive.setIsPaused;
        if (typeof fn !== "function") {
            const named = inspectedExport(13968, "setIsPaused");
            if (typeof named === "function") fn = named;
            else {
                const def = inspectedExport(13968, "default");
                if (def && typeof def.setIsPaused === "function") fn = def.setIsPaused.bind(def);
            }
        }
        try { if (typeof fn === "function") fn(false); } catch (_) {}
    }
    function backgroundSync() {
        const questBusy = !!(enabled("quests") && (quest.running || quest.enrolling));
        const badgeBusy = !!(enabled("badges") && (badges.current && badgeNeedsGame() || badges.granting));
        const pushListening = !!(settings.userNotifPush && userNotifHasTargets());
        const needed = questBusy || badgeBusy || pushListening;
        if (needed) unpauseGateway();
        const fg = bgKeepAlive.fg || inspectedExport(9699, "default");
        if (!needed) {
            if (!bgKeepAlive.active) return;
            bgKeepAlive.active = false; bgKeepAlive.title = ""; bgKeepAlive.content = "";
            try { if (fg && typeof fg.removeServiceHandler === "function") fg.removeServiceHandler(BACKGROUND_SERVICE_KEY); } catch (_) {}
            return;
        }
        const title = tr("Venus Patches");
        const content = questBusy && quest.running ? tr("Now: {name}.", {name:quest.running.name}) :
            questBusy ? tr("Quest Completer") :
            badgeBusy && badges.current ? tr("Playing {name}", {name:badges.current.game.name}) :
            badgeBusy ? tr("Completing badges") : tr("Activity notifications");
        if (bgKeepAlive.active && bgKeepAlive.title === title && bgKeepAlive.content === content && fg) return;
        if (fg && typeof fg.updateServiceHandler === "function") {
            bgKeepAlive.active = true; bgKeepAlive.title = title; bgKeepAlive.content = content;
            try { fg.updateServiceHandler(BACKGROUND_SERVICE_KEY, {title, content, priority:2, type:0, usesGateway:true}); } catch (_) {}
        }
    }
    function hookPauseGateway(exports) {
        if (!exports || bgKeepAlive.pauseHooked) return exports;
        bgKeepAlive.pauseHooked = true;
        const target = typeof exports.setIsPaused === "function" ? exports :
            exports.default && typeof exports.default.setIsPaused === "function" ? exports.default : null;
        if (!target) return exports;
        const origSet = target.setIsPaused;
        bgKeepAlive.setIsPaused = v => origSet.call(target, v);
        let patched = hookExport(target, "setIsPaused", (orig, self, args) => {
            if (args[0] === true && !isAppActive() && backgroundNeeded()) return orig.call(self, false);
            return orig.apply(self, args);
        });
        if (typeof target.getIsPaused === "function") {
            patched = hookExport(patched, "getIsPaused", (orig, self, args) => {
                if (!isAppActive() && backgroundNeeded()) return false;
                return orig.apply(self, args);
            });
        }
        return target === exports ? patched : replaceValue(exports, "default", patched);
    }
    function hookGatewaySocket(exports) {
        const socket = exports && exports.socket;
        if (!socket || typeof socket.close !== "function" || bgKeepAlive.socketHooked) return exports;
        bgKeepAlive.socketHooked = true;
        const origClose = socket.close;
        replaceValue(socket, "close", function (clean) {
            if (clean === true && !isAppActive() && backgroundNeeded()) {
                unpauseGateway();
                return;
            }
            return origClose.apply(this, arguments);
        });
        return exports;
    }
    const USER_NOTIF_MAX_IDS = 500, USER_NOTIF_COOLDOWN_MS = 8000;
    const USER_NOTIF_EVENTS = ["PRESENCE_UPDATES", "PRESENCE_UPDATE", "MESSAGE_CREATE", "TYPING_START", "CONNECTION_OPEN",
        "CONNECTION_OPEN_SUPPLEMENTAL", "PRESENCES_REPLACE", "OVERLAY_INITIALIZE", "RELATIONSHIP_ADD", "RELATIONSHIP_UPDATE",
        "CONNECTION_RESUMED", "GUILD_CREATE", "IDLE", "LOGOUT"];
    const userNotif = {dispatcher:null, subscribed:false, relationships:null, guilds:null, ids:new Set(), dirty:false,
        statuses:new Map(), cooldowns:new Map(), shown:0, last:null, permissionGranted:null};
    function userNotifNativePerm() {
        const native = RN && RN.NativeModules;
        return native && (native.NativePermissionManager || native.RTNNativePermissionManager) || null;
    }
    function userNotifCheckPermissions() {
        const perm = userNotifNativePerm();
        if (perm && typeof perm.getNotificationAuthorizationStatus === "function") {
            return Promise.resolve().then(() => perm.getNotificationAuthorizationStatus()).then(code => {
                const ok = code === 2 || code === "authorized" || code === true;
                userNotif.permissionGranted = ok; notify("userNotif");
                return ok;
            }, () => true);
        }
        return Promise.resolve(true);
    }
    function userNotifRequestPermissions(showFeedback) {
        const ui = reviewUI(), pushMod = inspectedExport(11033, "default"), perm = userNotifNativePerm();
        const openSystemSettings = () => {
            try { if (pushMod && typeof pushMod.openNotificationSettings === "function") { pushMod.openNotificationSettings(); return; } } catch (_) {}
            try { if (perm && typeof perm.openSettings === "function") perm.openSettings(); } catch (_) {}
        };
        const askEnableInSystem = () => {
            userNotif.permissionGranted = false; notify("userNotif");
            confirmAction("Allow Discord notifications?",
                "Android notifications are off for Discord. Turn them on in your phone's settings to get alerts while Discord is closed.",
                "Open settings", openSystemSettings);
        };
        const checkStatus = () => userNotifCheckPermissions().then(ok => {
            if (!ok) askEnableInSystem();
            else if (showFeedback) reviewToast(ui, "Notification permission granted", venusIcon(6868,"CircleCheckIcon"));
            return ok;
        });
        if (perm && typeof perm.requestNotificationAuthorization === "function") {
            return Promise.resolve().then(() => perm.requestNotificationAuthorization()).then(() => checkStatus(), () => checkStatus());
        }
        const permsAndroid = RN && RN.PermissionsAndroid;
        if (permsAndroid && typeof permsAndroid.request === "function") {
            const postNotif = permsAndroid.PERMISSIONS && permsAndroid.PERMISSIONS.POST_NOTIFICATIONS || "android.permission.POST_NOTIFICATIONS";
            return Promise.resolve().then(() => permsAndroid.request(postNotif)).then(res => {
                const granted = !res || res === "granted" || (permsAndroid.RESULTS && res === permsAndroid.RESULTS.GRANTED);
                userNotif.permissionGranted = granted; notify("userNotif");
                if (!granted) askEnableInSystem();
                else if (showFeedback) reviewToast(ui, "Notification permission granted", venusIcon(6868,"CircleCheckIcon"));
                return granted;
            }, () => checkStatus());
        }
        return checkStatus();
    }
    function userNotifPushSend(content) {
        if (!settings.userNotifPush || isAppActive()) return;
        const pushMod = inspectedExport(11033, "default");
        const mid = String(userNotif.shown);
        try {
            if (pushMod && typeof pushMod.presentLocalNotification === "function")
                pushMod.presentLocalNotification({alertTitle:tr("Activity notifications"), alertBody:content,
                    channelId:"venus-user-notif", channel_id:"venus-user-notif", messageId:mid, message_id:mid});
        } catch (_) {}
    }
    function userNotifFriendIds() {
        const store = userNotif.relationships || (userNotif.relationships = inspectedExport(4760, "default"));
        try {
            const list = store && typeof store.getFriendIDs === "function" ? store.getFriendIDs() : null;
            return Array.isArray(list) ? list.filter(id => typeof id === "string" && /^\d{17,20}$/.test(id)) : [];
        } catch (_) { return []; }
    }
    function userNotifIsFriend(id) {
        const store = userNotif.relationships || (userNotif.relationships = inspectedExport(4760, "default"));
        try {
            if (store && typeof store.isFriend === "function") return !!store.isFriend(id);
            if (store && typeof store.getFriendIDs === "function") {
                const list = store.getFriendIDs();
                return Array.isArray(list) && list.includes(id);
            }
        } catch (_) {}
        return false;
    }
    function userNotifWatched(id) {
        if (typeof id !== "string") return false;
        if (!userNotif.ids.has(id) && !(settings.userNotifFriends && userNotifIsFriend(id))) return false;
        if (!/^\d{17,20}$/.test(id)) return false;
        const me = currentUser();
        return !(me && me.id === id);
    }
    function userNotifPersonName(id, fallbackUser) {
        const store = userNotif.relationships || (userNotif.relationships = inspectedExport(4760, "default"));
        try {
            const nick = store && typeof store.getNickname === "function" && store.getNickname(id);
            if (typeof nick === "string" && nick.trim()) return nick.trim();
        } catch (_) {}
        let user = fallbackUser;
        try { if ((!user || !user.username && !user.globalName && !user.global_name) && userStore) user = userStore.getUser(id) || user; } catch (_) {}
        const name = user && (user.globalName || user.global_name || user.username);
        return typeof name === "string" && name.trim() ? name.trim() : id;
    }
    function userNotifStatusName(statusValue) {
        return statusValue === "online" ? tr("Online") : statusValue === "idle" ? tr("Idle") :
            statusValue === "dnd" ? tr("Do Not Disturb") : tr("Offline");
    }
    function userNotifPlace(channelId, guildId) {
        const channel = channelId ? receivedChannel(channelId) : null;
        const gId = guildId || channel && (channel.guild_id || channel.guildId);
        const guilds = userNotif.guilds || (userNotif.guilds = inspectedExport(2087, "default"));
        const guild = guilds && gId && typeof guilds.getGuild === "function" ? guilds.getGuild(gId) : null;
        const cName = channel && typeof channel.name === "string" && channel.name.trim() ? channel.name.trim() : "";
        const gName = guild && typeof guild.name === "string" && guild.name.trim() ? guild.name.trim() : "";
        const isDm = !gId && (!channel || channel.type === 1 || channel.type === 3);
        return {isDm:!!isDm, cName, gName};
    }
    function userNotifSubscribeGuild(guildId, subFn) {
        if (typeof guildId !== "string" || !/^\d{17,20}$/.test(guildId)) return;
        const sub = subFn !== undefined ? subFn : inspectedExport(7012, "subscribeGuild");
        try {
            if (typeof sub === "function") { sub(guildId); return; }
        } catch (_) {}
        const d = userNotif.dispatcher;
        try { if (d && typeof d.dispatch === "function") d.dispatch({type:"GUILD_SUBSCRIPTIONS", guildId}); } catch (_) {}
    }
    function userNotifSubscribeGuilds() {
        if (!userNotifHasTargets()) return;
        const guilds = userNotif.guilds || (userNotif.guilds = inspectedExport(2087, "default"));
        if (!guilds) return;
        let ids = null;
        try {
            if (typeof guilds.getGuildIds === "function") ids = guilds.getGuildIds();
            else if (typeof guilds.getGuilds === "function") {
                const map = guilds.getGuilds();
                if (map && typeof map === "object") ids = Object.keys(map);
            }
        } catch (_) {}
        if (!Array.isArray(ids)) return;
        const sub = inspectedExport(7012, "subscribeGuild");
        for (let i = 0; i < ids.length && i < 200; i++) userNotifSubscribeGuild(ids[i], sub);
    }
    function userNotifAllowed(id, kind) {
        const now = Date.now(), key = id + ":" + kind, prev = userNotif.cooldowns.get(key) || 0;
        if (now - prev < USER_NOTIF_COOLDOWN_MS) return false;
        if (userNotif.cooldowns.size >= 500) userNotif.cooldowns.delete(userNotif.cooldowns.keys().next().value);
        userNotif.cooldowns.set(key, now);
        return true;
    }
    function userNotifShow(text, vars) {
        userNotif.shown++;
        userNotif.last = {text, vars};
        const content = tr(text, vars);
        const ui = reviewUI(), Icon = venusIcon(8768, "BellIcon");
        try {
            showToast(ui, "venus-user-notif:" + userNotif.shown, content, Icon);
        } catch (_) {}
        userNotifPushSend(content);
        notify("userNotif");
    }
    function userNotifSeedStatuses(includeOffline) {
        if (!presenceStore || typeof presenceStore.getStatus !== "function") return;
        const seedId = id => {
            if (userNotif.statuses.has(id)) return;
            try {
                const current = presenceStore.getStatus(id);
                if (typeof current === "string" && current && (includeOffline !== false || current !== "offline" && current !== "invisible"))
                    userNotif.statuses.set(id, current);
            } catch (_) {}
        };
        userNotif.ids.forEach(seedId);
        if (!settings.userNotifFriends) return;
        const store = userNotif.relationships || (userNotif.relationships = inspectedExport(4760, "default"));
        try {
            const list = store && typeof store.getFriendIDs === "function" ? store.getFriendIDs() : null;
            if (Array.isArray(list)) for (let i = 0; i < list.length; i++) {
                const id = list[i];
                if (typeof id === "string" && /^\d{17,20}$/.test(id)) seedId(id);
            }
        } catch (_) {}
    }
    function userNotifPresence(update) {
        if (!update || !enabled("userNotif") || !settings.userNotifStatus) return;
        const user = update.user, id = user && user.id || update.userId;
        const nextStatus = typeof update.status === "string" ? update.status : "";
        if (!id || !nextStatus || !userNotifWatched(id)) return;
        let prev = userNotif.statuses.get(id);
        if (prev === undefined && presenceStore && typeof presenceStore.getStatus === "function") {
            try {
                const stored = presenceStore.getStatus(id);
                if (typeof stored === "string" && stored && stored !== nextStatus) prev = stored;
            } catch (_) {}
        }
        // Flux stores update before dispatcher.subscribe listeners run: if a watched person was offline (never seeded
        // or not yet in statuses) and just came online/idle/dnd, PresenceStore.getStatus(id) already equals nextStatus.
        if (prev === undefined && nextStatus !== "offline" && nextStatus !== "invisible") prev = "offline";
        if (userNotif.statuses.size >= 2000 && !userNotif.statuses.has(id))
            userNotif.statuses.delete(userNotif.statuses.keys().next().value);
        userNotif.statuses.set(id, nextStatus);
        if (!prev || prev === nextStatus || !userNotifAllowed(id, "status:" + nextStatus)) return;
        userNotifShow("{name} is now {status}", {name:userNotifPersonName(id, user), status:userNotifStatusName(nextStatus)});
    }
    function userNotifMessage(event) {
        if (!enabled("userNotif") || !settings.userNotifMessages || !event || event.optimistic) return;
        const message = event.message;
        if (!message || message.state === "SENDING") return;
        const author = message.author, id = author && author.id;
        if (!id || !userNotifWatched(id) || !userNotifAllowed(id, "message")) return;
        const name = userNotifPersonName(id, author);
        const place = userNotifPlace(message.channel_id || message.channelId || event.channelId, message.guild_id || message.guildId || event.guildId);
        if (place.isDm) userNotifShow("{name} sent you a DM", {name});
        else if (place.cName && place.gName) userNotifShow("{name} sent a message in #{channel} ({server})", {name, channel:place.cName, server:place.gName});
        else if (place.cName) userNotifShow("{name} sent a message in #{channel}", {name, channel:place.cName});
        else userNotifShow("{name} sent a message", {name});
    }
    function userNotifTyping(event) {
        if (!enabled("userNotif") || !settings.userNotifTyping || !event) return;
        const id = event.userId || event.user && event.user.id;
        if (!id || !userNotifWatched(id) || !userNotifAllowed(id, "typing")) return;
        const name = userNotifPersonName(id, event.user);
        const place = userNotifPlace(event.channelId || event.channel_id, event.guildId || event.guild_id);
        if (place.isDm) userNotifShow("{name} is typing in your DM", {name});
        else if (place.cName && place.gName) userNotifShow("{name} is typing in #{channel} ({server})", {name, channel:place.cName, server:place.gName});
        else if (place.cName) userNotifShow("{name} is typing in #{channel}", {name, channel:place.cName});
        else userNotifShow("{name} is typing", {name});
    }
    function userNotifEvent(event) {
        if (!event || !enabled("userNotif")) return;
        switch (event.type) {
        case "PRESENCE_UPDATES":
            if (Array.isArray(event.updates)) for (let i = 0; i < event.updates.length; i++) userNotifPresence(event.updates[i]);
            return;
        case "PRESENCE_UPDATE": userNotifPresence(event); return;
        case "MESSAGE_CREATE": userNotifMessage(event); return;
        case "TYPING_START": userNotifTyping(event); return;
        case "CONNECTION_OPEN": userNotif.statuses.clear(); userNotifSeedStatuses(false); userNotifSubscribeGuilds(); return;
        case "CONNECTION_OPEN_SUPPLEMENTAL":
        case "PRESENCES_REPLACE":
        case "OVERLAY_INITIALIZE":
            userNotifSeedStatuses(true);
            userNotifSubscribeGuilds();
            return;
        case "RELATIONSHIP_ADD":
        case "RELATIONSHIP_UPDATE":
            userNotifSeedStatuses(true);
            return;
        case "CONNECTION_RESUMED":
        case "IDLE":
            userNotifSubscribeGuilds();
            return;
        case "GUILD_CREATE":
            userNotifSeedStatuses(true);
            if (event.guild && event.guild.id) userNotifSubscribeGuild(event.guild.id);
            return;
        case "LOGOUT":
            userNotif.statuses.clear(); userNotif.cooldowns.clear(); userNotif.shown = 0; userNotif.last = null; notify("userNotif");
            return;
        }
    }
    function userNotifSync() {
        const d = userNotif.dispatcher;
        if (!d || typeof d.subscribe !== "function") return;
        const active = enabled("userNotif");
        if (active && !userNotif.subscribed) {
            userNotif.subscribed = true;
            userNotifSeedStatuses();
            userNotifSubscribeGuilds();
            USER_NOTIF_EVENTS.forEach(type => d.subscribe(type, userNotifEvent));
        } else if (!active && userNotif.subscribed) {
            userNotif.subscribed = false;
            if (typeof d.unsubscribe === "function") USER_NOTIF_EVENTS.forEach(type => d.unsubscribe(type, userNotifEvent));
            userNotif.statuses.clear(); userNotif.cooldowns.clear();
        } else if (active) {
            userNotifSeedStatuses();
            userNotifSubscribeGuilds();
        }
    }
    function userNotifInit(d) {
        if (userNotif.dispatcher || !d || typeof d.subscribe !== "function") return;
        userNotif.dispatcher = d;
        userNotifSync();
    }
    function userNotifSetId(id, wanted) {
        if (typeof id !== "string" || !/^\d{17,20}$/.test(id)) return false;
        if (wanted) {
            if (userNotif.ids.has(id)) return true;
            if (userNotif.ids.size >= USER_NOTIF_MAX_IDS) userNotif.ids.delete(userNotif.ids.values().next().value);
            userNotif.ids.add(id);
            if (presenceStore && typeof presenceStore.getStatus === "function") {
                try { const s = presenceStore.getStatus(id); if (typeof s === "string" && s) userNotif.statuses.set(id, s); } catch (_) {}
            }
        } else if (!userNotif.ids.delete(id)) return true;
        userNotif.dirty = true;
        save();
        backgroundSync();
        notify("userNotif");
        return true;
    }
    function userNotifClearIds() {
        if (!userNotif.ids.size && settings.userNotifFriends) return;
        userNotif.ids.clear();
        userNotif.dirty = true;
        if (!settings.userNotifFriends) {
            settings.userNotifFriends = true;
            dirty.add("userNotifFriends");
            userNotifSeedStatuses();
        }
        save();
        if (enabled("userNotif")) userNotifSubscribeGuilds();
        backgroundSync();
        notify("userNotif");
        reviewToast(reviewUI(), "People list reset", venusIcon(6868,"CircleCheckIcon"));
    }
    function userNotifAvatarUri(user, size) {
        if (!user) return null;
        let uri = null;
        const avatars = inspectedExport(1415, "default");
        try { if (avatars && typeof avatars.getUserAvatarURL === "function") uri = avatars.getUserAvatarURL(user, false, size || 64); } catch (_) {}
        if ((typeof uri !== "string" || !/^https?:\/\//.test(uri)) && typeof user.id === "string" && typeof user.avatar === "string" && user.avatar)
            uri = "https://cdn.discordapp.com/avatars/" + user.id + "/" + user.avatar + ".png?size=" + (size || 64);
        return typeof uri === "string" && /^https?:\/\//.test(uri) ? uri : null;
    }
    // A round avatar like Discord's lists: the picture, or the first letter on a color of its own, with an optional
    // status dot cut out of the corner (ringColor is whatever is behind it, so the cut-out blends in).
    const AVATAR_TINTS = ["#5865f2", "#3ba55c", "#faa61a", "#ed4245", "#eb459e", "#00a8fc", "#9b59b6"];
    function avatarBubble(user, size, statusValue, ringColor) {
        if (!RN) return undefined;
        size = size || 32;
        const uri = RN.Image ? userNotifAvatarUri(user, size >= 40 ? 128 : 64) : null;
        const name = user && (user.globalName || user.global_name || user.username) || "?";
        const id = user && typeof user.id === "string" ? user.id : name;
        let hash = 0; for (let i = 0; i < id.length; i++) hash = (hash * 31 + id.charCodeAt(i)) | 0;
        const face = uri ? el(RN.Image, {source:{uri}, style:{width:size, height:size, borderRadius:size / 2}}) :
            el(RN.View, {style:{width:size, height:size, borderRadius:size / 2, backgroundColor:AVATAR_TINTS[Math.abs(hash) % AVATAR_TINTS.length], alignItems:"center", justifyContent:"center"}},
                el(RN.Text, {style:{color:"#ffffff", fontSize:Math.round(size * 0.42), fontWeight:"700"}}, name.slice(0, 1).toUpperCase()));
        if (!statusValue) return face;
        const dot = Math.max(10, Math.round(size * 0.34));
        return el(RN.View, {style:{width:size, height:size}}, face,
            el(RN.View, {style:{position:"absolute", right:-2, bottom:-2, width:dot + 4, height:dot + 4, borderRadius:(dot + 4) / 2,
                backgroundColor:ringColor || "#2b2d31", alignItems:"center", justifyContent:"center"}},
                el(RN.View, {style:{width:dot, height:dot, borderRadius:dot / 2, backgroundColor:STATUS_HEX[statusValue] || STATUS_HEX.offline}})));
    }
    function userNotifAvatar(user) { return user ? avatarBubble(user, 32) : undefined; }
    // Up to four overlapping avatars of the people being watched, like Discord's avatar piles.
    function avatarPile(users, ringColor) {
        if (!users.length || !RN) return null;
        const shown = users.slice(0, 4);
        return el(RN.View, {style:{flexDirection:"row", alignItems:"center"}},
            shown.map((user, i) => el(RN.View, {key:user.id || String(i), style:{marginLeft:i ? -10 : 0, borderRadius:15, borderWidth:2, borderColor:ringColor || "#2b2d31"}},
                avatarBubble(user, 26))));
    }
    // Who is watched right now: every friend while All friends is on, plus the people picked or added by ID.
    function userNotifWatchedIds() {
        const out = settings.userNotifFriends ? userNotifFriendIds() : [];
        userNotif.ids.forEach(id => { if (!out.includes(id)) out.push(id); });
        return out;
    }
    function userNotifAnyEvent() { return !!(settings.userNotifStatus || settings.userNotifMessages || settings.userNotifTyping); }
    function userNotifSummaryTitle() {
        if (!enabled("userNotif")) return tr("Turned off");
        const watched = userNotifWatchedIds().length;
        if (!watched) return tr("No one chosen yet");
        if (!userNotifAnyEvent()) return tr("Nothing to notify about");
        // People picked earlier stay saved for People I pick; while they're all friends anyway, it's still "all friends".
        return settings.userNotifFriends && watched === userNotifFriendIds().length ? pl(watched, "Watching {n} friend", "Watching all {n} friends") :
            pl(watched, "Watching {n} person", "Watching {n} people");
    }
    function userNotifSummary() {
        if (!enabled("userNotif")) return tr("Turned off. Switch it on in Features to start.");
        if (!userNotifWatchedIds().length) return tr("Choose who to watch below.");
        if (!userNotifAnyEvent()) return tr("Turn on at least one thing to be notified about.");
        const countLine = userNotif.shown ? pl(userNotif.shown, "Shown {n} notification since Discord opened.", "Shown {n} notifications since Discord opened.") :
            tr("No notifications shown yet since Discord opened.");
        return userNotif.last ? countLine + "\n" + tr("Last: {name}", {name:tr(userNotif.last.text, userNotif.last.vars)}) : countLine;
    }
    const USER_NOTIF_DARK = {ring:{backgroundColor:"#2b2d31"}, row:{backgroundColor:"#2b2d31"},
        button:{width:32, height:32, borderRadius:16, alignItems:"center", justifyContent:"center", backgroundColor:"#4e50584d"}};
    function UserNotifSettings() {
        useSettings("userNotif");
        const ui = reviewUI();
        const [query, setQuery] = React.useState(""), [idDraft, setIdDraft] = React.useState(""), [, redraw] = React.useState(0);
        React.useEffect(() => {
            const stores = [userStore, presenceStore, userNotif.relationships || (userNotif.relationships = inspectedExport(4760, "default"))].filter(Boolean);
            const wake = () => redraw(n => n + 1);
            stores.forEach(s => { try { if (typeof s.addChangeListener === "function") s.addChangeListener(wake); } catch (_) {} });
            return () => stores.forEach(s => { try { if (typeof s.removeChangeListener === "function") s.removeChangeListener(wake); } catch (_) {} });
        }, []);
        if (!React || !RN) return null;
        const theme = useThemed("userNotif", c => ({ring:{backgroundColor:c.CARD_BACKGROUND_DEFAULT}, row:{backgroundColor:c.CARD_BACKGROUND_DEFAULT},
            button:Object.assign({}, USER_NOTIF_DARK.button, {backgroundColor:c.BACKGROUND_MOD_SUBTLE})}), USER_NOTIF_DARK);
        const ringColor = theme.ring && theme.ring.backgroundColor, rowColor = theme.row && theme.row.backgroundColor;
        const Group = ui.TableRowGroup || RN.View, Switch = ui.TableSwitchRow, Row = ui.TableRow, Press = RN.Pressable || RN.View;
        const CheckboxRow = inspectedExport(6177, "TableCheckboxRow"), SearchField = inspectedExport(6739, "SearchField");
        const on = enabled("userNotif"), allFriends = !!settings.userNotifFriends;
        const friends = userNotifFriendIds(), friendSet = new Set(friends);
        const lookup = id => {
            let user = null, st = "offline";
            try { if (userStore) user = userStore.getUser(id); } catch (_) {}
            try { if (presenceStore && typeof presenceStore.getStatus === "function") st = presenceStore.getStatus(id) || "offline"; } catch (_) {}
            return {id, user, name:userNotifPersonName(id, user), username:user && user.username || "", status:st};
        };
        const friendEntries = friends.map(lookup).sort((a, b) => {
            const aPicked = allFriends || userNotif.ids.has(a.id), bPicked = allFriends || userNotif.ids.has(b.id);
            if (aPicked !== bPicked) return aPicked ? -1 : 1;
            const aOnline = a.status && a.status !== "offline", bOnline = b.status && b.status !== "offline";
            if (aOnline !== bOnline) return aOnline ? -1 : 1;
            return a.name.localeCompare(b.name);
        });
        const searchText = typeof query === "string" ? query : "", cleanQuery = searchText.trim().toLowerCase(), idText = typeof idDraft === "string" ? idDraft : "";
        const filteredFriends = cleanQuery ? friendEntries.filter(f => f.name.toLowerCase().includes(cleanQuery) || f.username.toLowerCase().includes(cleanQuery) || f.id.includes(cleanQuery)) : friendEntries;
        const shownFriends = filteredFriends.slice(0, 60);
        const customIds = [];
        userNotif.ids.forEach(id => { if (!friendSet.has(id)) customIds.push(id); });
        let pickedFriendsCount = 0;
        userNotif.ids.forEach(id => { if (friendSet.has(id)) pickedFriendsCount++; });
        // Unticking one friend while All friends is on starts from everyone, minus that friend.
        const toggleFriend = id => {
            if (!on) return;
            if (allFriends) {
                userNotif.ids.clear();
                friends.forEach(fId => { if (fId !== id && userNotif.ids.size < USER_NOTIF_MAX_IDS) userNotif.ids.add(fId); });
                customIds.forEach(cId => { if (userNotif.ids.size < USER_NOTIF_MAX_IDS) userNotif.ids.add(cId); });
                userNotif.dirty = true;
                setSetting("userNotifFriends", false);
                return;
            }
            userNotifSetId(id, !userNotif.ids.has(id));
        };
        // Switching to "People I pick" keeps everyone who was watched ticked, so nothing goes quiet by surprise.
        const setWho = value => {
            if (!on || (value === "all") === allFriends) return;
            if (value === "all") { setSetting("userNotifFriends", true); return; }
            if (!pickedFriendsCount) {
                friends.forEach(fId => { if (userNotif.ids.size < USER_NOTIF_MAX_IDS) userNotif.ids.add(fId); });
                userNotif.dirty = true;
            }
            setSetting("userNotifFriends", false);
        };
        const handle = entry => entry.username && entry.username !== entry.name ? "@" + entry.username : "";
        const personSub = entry => [handle(entry), userNotifStatusName(entry.status)].filter(Boolean).join(" \u00b7 ");
        const friendRow = entry => {
            const checked = allFriends || userNotif.ids.has(entry.id);
            const avatar = avatarBubble(entry.user || {id:entry.id, username:entry.name}, 32, entry.status, rowColor);
            if (CheckboxRow) return el(CheckboxRow, {key:entry.id, label:entry.name, subLabel:personSub(entry), icon:avatar, checked, disabled:!on, onPress:() => toggleFriend(entry.id)});
            return Row ? el(Row, {key:entry.id, label:(checked ? "\u2713 " : "") + entry.name, subLabel:personSub(entry), icon:avatar, disabled:!on, onPress:() => toggleFriend(entry.id)}) : null;
        };
        const searchBox = friends.length > 5 ? (SearchField ?
            el(SearchField, {key:"search", placeholder:tr("Search friends"), value:searchText, onChange:text => setQuery(String(text || "")), isDisabled:!on}) :
            ui.TextInput ? el(ui.TextInput, {key:"search", placeholder:tr("Search friends"), value:searchText, onChange:text => setQuery(String(text || "")), isDisabled:!on, editable:on}) : null) : null;
        const friendRows = !friends.length ? [Row ? el(Row, {key:"empty", label:tr("No friends found"), subLabel:tr("Open your friends list once if Discord hasn't loaded it yet."), disabled:true}) : null] :
            !shownFriends.length ? [Row ? el(Row, {key:"none", label:tr("No matching friends"), disabled:true}) : null] :
            shownFriends.map(friendRow);
        if (filteredFriends.length > shownFriends.length && Row)
            friendRows.push(el(Row, {key:"more", label:tr("Search to see {n} more", {n:filteredFriends.length - shownFriends.length}), disabled:true}));
        const onIdText = text => setIdDraft(String(text || "").replace(/[^0-9]/g, "").slice(0, 20));
        const validDraft = /^\d{17,20}$/.test(idText);
        const addById = () => {
            if (!on || !validDraft) return;
            const me = currentUser();
            if (me && me.id === idText) { reviewToast(ui, "That's your own user ID", venusIcon(5046,"CircleInformationIcon")); return; }
            userNotifSetId(idText, true);
            const getUser = inspectedExport(8301, "getUser");
            if (!knownUser(idText) && typeof getUser === "function") try { Promise.resolve(getUser(idText)).catch(() => {}); } catch (_) {}
            setIdDraft("");
        };
        const idInput = inputWithButton(ui, "input", {value:idText, keyboardType:"number-pad", maxLength:20, placeholder:tr("17 to 20 digit user ID"),
            onSubmitEditing:addById, returnKeyType:"done", editable:on, isDisabled:!on}, onIdText, "Add", addById, !on || !validDraft);
        const removeButton = id => el(Press, {style:[theme.button, {opacity:on ? 1 : 0.5}], accessibilityRole:"button", accessibilityLabel:tr("Stop watching"),
            disabled:!on, hitSlop:{top:6, bottom:6, left:6, right:6}, onPress:on ? () => userNotifSetId(id, false) : undefined}, el(venusIcon(6208, "XSmallIcon"), {size:"sm"}));
        const customRows = customIds.map(id => {
            const entry = lookup(id), known = entry.name !== id;
            const sub = known ? [handle(entry), userNotifStatusName(entry.status)].filter(Boolean).join(" \u00b7 ") : tr("Not loaded yet");
            return Row ? el(Row, {key:"id:" + id, label:entry.name, subLabel:sub, icon:avatarBubble(entry.user || {id, username:"#"}, 32, known ? entry.status : null, rowColor),
                trailing:removeButton(id), disabled:!on}) : null;
        });
        const watchedUsers = userNotifWatchedIds().slice(0, 4).map(lookup).map(e => e.user || {id:e.id, username:e.name});
        const groups = [
            on ? VenusStatusCard({key:"status", title:userNotifSummaryTitle(), IconComponent:venusIcon(8768, "BellIcon"),
                leading:userNotifAnyEvent() && watchedUsers.length ? avatarPile(watchedUsers, ringColor) : null, body:userNotifSummary()}) :
                offCard("status", venusIcon(8768, "BellIcon"), "userNotif"),
            el(Group, {key:"events", title:tr("Notify me when they")},
                switchRow(Switch, "userNotifStatus", "Change status", "Online, Idle, Do Not Disturb or Offline.", rowIcon(10287, "UserCircleIcon")),
                switchRow(Switch, "userNotifMessages", "Send a message", "In DMs or in any server channel your client receives.", rowIcon(8194, "ChatIcon")),
                switchRow(Switch, "userNotifTyping", "Start typing", "In DMs or in a channel you have open.", rowIcon(12822, "KeyboardIcon"))),
            el(Group, {key:"push", title:tr("Outside Discord")},
                switchRow(Switch, "userNotifPush", "Phone notifications", "Also notify you while Discord is closed. Keeps Discord connected, which uses more battery.", rowIcon(6642, "MobilePhoneIcon")),
                settings.userNotifPush && userNotif.permissionGranted === false && Row ?
                    el(Row, {key:"perm", label:tr("Allow notification permission"), subLabel:tr("Android notifications are turned off for Discord. Tap to check or open system settings."),
                        icon:rowIcon(10347, "BellSlashIcon"), variant:"danger", arrow:true, disabled:!on, onPress:() => userNotifRequestPermissions(true)}) : null),
            el(RN.View, {key:"who", style:{gap:8}},
                groupTitle("title", "Who to watch"),
                venusSegmented({key:"choice", value:allFriends ? "all" : "picked", disabled:!on, onChange:setWho,
                    items:[{value:"all", label:tr("All friends")}, {value:"picked", label:tr("People I pick")}]}),
                allFriends ? el(Group, {key:"all"},
                    Row ? el(Row, {key:"all", label:friends.length ? pl(friends.length, "{n} friend", "{n} friends") : tr("All friends"),
                        subLabel:tr("Everyone on your friends list, new friends too."), icon:rowIcon(4815, "FriendsIcon"), disabled:!on,
                        trailing:watchedUsers.length ? avatarPile(watchedUsers, rowColor) : undefined}) : null) : null),
            allFriends ? null : el(RN.View, {key:"friends", style:{gap:8}},
                searchBox,
                el(Group, {title:pickedFriendsCount ? pl(pickedFriendsCount, "Friends \u00b7 {n} picked", "Friends \u00b7 {n} picked") : tr("Friends")}, friendRows)),
            el(Group, {key:"ids", title:tr("People who aren't your friends")},
                el(RN.View, {key:"input", style:{padding:12}}, idInput),
                customRows),
            userNotif.ids.size || !allFriends ? el(Group, {key:"manage", title:tr("Manage")},
                // With All friends already on, resetting only forgets who was picked or added by ID.
                actionRow(ui, "reset", "Reset chosen people", allFriends ? pl(userNotif.ids.size, "Clears {n} person you picked or added by ID.", "Clears {n} people you picked or added by ID.") :
                    tr("Switches All friends back on and clears {count}.", {count:pl(userNotif.ids.size, "{n} chosen person", "{n} chosen people")}),
                    () => confirmAction("Reset chosen people?", allFriends ? "The people you picked and added by ID will be cleared." :
                        "Your picked friends and custom user IDs will be cleared, and All friends will be turned back on.", "Reset", userNotifClearIds),
                    false, true)) : null,
            footnote("note", "Notifications show as banners while Discord is open. For people who aren't your friends, Discord only sends what happens in servers you share.")];
        return settingsBody(ui, groups, {keyboardShouldPersistTaps:"handled"});
    }

    // Settings button on the profile bar ("You bar"), next to the notifications bell. Same button Discord uses for
    // its own bar buttons (YouBarButton 16857), with Discord's settings icon, opening Discord's own settings.
    let youBarParts = null;
    function YouBarSettingsButton(props) {
        useSettings("youBarSettings");
        if (!enabled("youBarSettings") || !RN) return null;
        // Looked up once they've all loaded, not on every render of the bar.
        if (!youBarParts) {
            const Button = inspectedExport(16857, "default"), Icon = inspectedExport(7092, "SettingsIcon");
            if (!Button || !Icon) return null;
            const size = inspectedExport(15378, "YOU_BAR_BUTTON_ICON_SIZE") || 20;
            youBarParts = {Button, Icon, style:{width:size, height:size}};
        }
        const nameplate = !!(props && props.hasNameplate);
        return el(youBarParts.Button, {hasNameplate:nameplate, hasBadge:false, accessibilityLabel:tr("Venus settings"), onPress:openSettings,
            icon:el(youBarParts.Icon, {size:"custom", style:youBarParts.style, color:nameplate ? "white" : undefined})});
    }
    // Opens Venus settings, not Discord's. openUserSettings (6801) opens the settings navigator on the screen it's
    // given, and every settings route node, VENUS_PLUGINS too, is one of that navigator's screens (14974
    // getSettingScreens), so Back goes to Discord's settings like when you open Venus from there.
    function openSettings() {
        // Ensure SettingsRendererConfig (14839) and SettingListRenderer (14971) are initialized before
        // opening SettingsNavigator so VENUS_PLUGINS is registered even on first tap after app restart
        // and SettingsList is non-null so the page never renders a blank black screen (#58).
        if (!status.menu) inspectedExport(14839, "SETTING_RENDERER_CONFIG");
        if (!SettingsList) SettingsList = inspectedExport(14971, "SettingsList");
        const screen = status.menu ? "VENUS_PLUGINS" : undefined;
        const open = inspectedExport(7094, "openUserSettings");
        try { if (typeof open === "function") { open(screen ? {screen} : undefined); return; } } catch (_) {}
        try { const ref = inspectedExport(4977, "getRootNavigationRef"); const nav = ref && ref(); if (nav) nav.navigate("settings", screen ? {screen} : undefined); } catch (_) {}
    }
    function youBarButtons(orig, self, args) {
        // Always the same shape, so switching it on or off never remounts the bell.
        const nameplate = args[0] && args[0].hasNameplate;
        const children = [orig.apply(self, args)];
        if (features.accountSwitcher) children.push(el(YouBarAccountSwitcherButton, {hasNameplate:nameplate}));
        if (features.youBarSettings) children.push(el(YouBarSettingsButton, {hasNameplate:nameplate}));
        return el.apply(null, [React.Fragment, null].concat(children));
    }

    // Account switcher: unlocks Discord's built-in mobile multi-account engine (MultiAccountStore 12129,
    // MultiAccountActionCreators 12133, YouAccountActionSheet 16836 and ManageAccountsModal 16840), which Discord
    // hides behind isStaffFromRawUser (12131) on mobile. Also places an optional button on the bottom profile bar
    // (YouBarNotificationsButton 16858 / YouBarButton 16857).
    const ACCOUNT_SWITCHER_DEFAULT_LIMIT = 5, ACCOUNT_SWITCHER_RAISED_LIMIT = 50;
    const accountSwitcher = {store:null, origUsers:null, origValidUsers:null, realMaxAccounts:ACCOUNT_SWITCHER_DEFAULT_LIMIT,
        youBarParts:null, registering:false};
    function multiAccountLimit() {
        // MultiAccountStore (12129) and PushNotificationActionCreators (12128) read MAX_ACCOUNTS /
        // MAX_PUSH_SYNC_ACCOUNTS once at module evaluation time during startup (before venus-patches.json
        // finishes restoring settings.accountSwitcher) and permanently cache the number in a closure slot.
        // Always return the raised limit when the patch is built in so CONNECTION_OPEN never splices >5 accounts.
        return features.accountSwitcher ?
            ACCOUNT_SWITCHER_RAISED_LIMIT : accountSwitcher.realMaxAccounts;
    }
    function multiAccountConstants(exports) {
        if (!exports || typeof exports !== "object") return;
        for (const key of ["MAX_ACCOUNTS", "MAX_PUSH_SYNC_ACCOUNTS"]) {
            const desc = Object.getOwnPropertyDescriptor(exports, key);
            if (!desc || !desc.configurable) continue;
            if (typeof desc.value === "number" && desc.value > 0) accountSwitcher.realMaxAccounts = desc.value;
            Object.defineProperty(exports, key, {get:multiAccountLimit, enumerable:desc.enumerable, configurable:true});
        }
    }
    function accountSwitcherCurrentEntry() {
        const me = currentUser();
        if (!me || !me.id) return null;
        const statuses = inspectedExport(12129, "MultiAccountTokenStatus");
        const validStatus = statuses && typeof statuses.VALID === "number" ? statuses.VALID : 2;
        return {id:me.id, avatar:me.avatar || null, username:me.username || "", discriminator:me.discriminator || "0", tokenStatus:validStatus};
    }
    function accountSwitcherWithCurrent(list, validOnly) {
        const base = Array.isArray(list) ? list : [];
        if (!enabled("accountSwitcher")) return base;
        const entry = accountSwitcherCurrentEntry();
        if (!entry) return base;
        const statuses = inspectedExport(12129, "MultiAccountTokenStatus");
        const invalidStatus = statuses && typeof statuses.INVALID === "number" ? statuses.INVALID : 0;
        const filtered = validOnly ? base.filter(u => u && u.tokenStatus !== invalidStatus) : base;
        if (filtered.some(u => u && u.id === entry.id)) return filtered;
        return [entry].concat(filtered);
    }
    function accountSwitcherStore() {
        return accountSwitcher.store || (accountSwitcher.store = inspectedExport(12129, "default"));
    }
    function accountSwitcherUsers() {
        const store = accountSwitcherStore();
        let list = [];
        try {
            if (store && typeof store.getUsers === "function") list = store.getUsers() || [];
            else if (accountSwitcher.origUsers) list = accountSwitcher.origUsers() || [];
        } catch (_) {}
        return accountSwitcherWithCurrent(list, false);
    }
    // Discord's saved data (Storage 510/511) is read asynchronously at startup. Until it has loaded, the saved
    // account list and tokens look empty, so nothing may be written yet.
    function accountSwitcherStorageReady() {
        const storage = inspectedExport(510, "Storage");
        return !storage || storage.hasLoaded !== false;
    }
    function accountSwitcherSync() {
        const store = accountSwitcherStore();
        // MultiAccountStore is a PersistedStore: initializeIfNeeded() reads the saved list once and then never again.
        // Calling it (or initialize + asyncPersist) before Discord loaded its storage and signed in, as happens on a
        // cold start, read an empty list and saved it over every account (#63). Only Discord initializes the store;
        // Venus adds the signed-in account afterwards, and only when it is missing.
        // A PersistedStore saves itself on every change (its constructor adds a change listener that calls
        // asyncPersist), whether or not it has read its saved state yet. Before that, getState() is the empty list
        // the module starts with, so even a bare emitChange() on a cold start saved [] over every account (#69).
        // Nothing here touches the store until Discord has loaded its storage and initialized the store itself.
        const storeReady = !!store && store._isInitialized === true && accountSwitcherStorageReady();
        const me = enabled("accountSwitcher") && storeReady ? currentUser() : null;
        if (me && me.id) {
            const rawTokenMod = global.__r && global.__r(1111);
            const tokenMgr = rawTokenMod && typeof rawTokenMod.setToken === "function" ? rawTokenMod :
                rawTokenMod && rawTokenMod.default && typeof rawTokenMod.default.setToken === "function" ? rawTokenMod.default : null;
            try {
                if (tokenMgr && typeof tokenMgr.getToken === "function") {
                    const activeToken = tokenMgr.getToken();
                    // While an account switch is under way, the active token already belongs to the next account but
                    // UserStore still shows the last one. Saving it under the wrong id signs that account out, so
                    // only save a token no other saved account already uses.
                    const users = typeof store.getState === "function" && store.getState() && store.getState().users;
                    const usedByOther = Array.isArray(users) && users.some(u => u && u.id && u.id !== me.id && tokenMgr.getToken(u.id) === activeToken);
                    if (typeof activeToken === "string" && activeToken && !tokenMgr.getToken(me.id) && !usedByOther)
                        tokenMgr.setToken(activeToken, me.id);
                }
            } catch (_) {}
            try {
                if (typeof store.initialize === "function" && typeof store.getState === "function") {
                    const state = store.getState() || {};
                    const saved = Array.isArray(state.users) ? state.users : [];
                    if (!saved.some(u => u && u.id === me.id)) {
                        store.initialize(Object.assign({}, state, {users:accountSwitcherWithCurrent(saved, false), canUseMultiAccountMobile:true}));
                        if (typeof store.asyncPersist === "function") store.asyncPersist();
                    }
                }
            } catch (_) {}
        }
        try { if (storeReady && typeof store.emitChange === "function") store.emitChange(); } catch (_) {}
        notify("accountSwitcher");
    }
    function hookMultiAccountStore(exports) {
        const store = exports && exports.default;
        if (!store) return exports;
        accountSwitcher.store = store;
        if (!accountSwitcher.origUsers && typeof store.getUsers === "function")
            accountSwitcher.origUsers = store.getUsers.bind(store);
        if (!accountSwitcher.origValidUsers && typeof store.getValidUsers === "function")
            accountSwitcher.origValidUsers = store.getValidUsers.bind(store);
        let patched = hookExport(store, "getCanUseMultiAccountMobile", function (orig, self, args) {
            return enabled("accountSwitcher") ? true : orig.apply(self, args);
        });
        patched = hookExport(patched, "getUsers", function (orig, self, args) {
            const res = orig.apply(self, args);
            return enabled("accountSwitcher") ? accountSwitcherWithCurrent(res, false) : res;
        });
        patched = hookExport(patched, "getValidUsers", function (orig, self, args) {
            const res = orig.apply(self, args);
            return enabled("accountSwitcher") ? accountSwitcherWithCurrent(res, true) : res;
        });
        patched = hookExport(patched, "getHasLoggedInAccounts", function (orig, self, args) {
            const res = orig.apply(self, args);
            return enabled("accountSwitcher") ? (res || accountSwitcherUsers().length > 0) : res;
        });
        const out = replaceValue(exports, "default", patched);
        if (enabled("accountSwitcher")) accountSwitcherSync();
        return out;
    }
    function hookIsStaffForMultiAccount(exports) {
        if (!exports) return exports;
        const wrap = function (orig, self, args) {
            const res = orig.apply(self, args);
            if (res || !enabled("accountSwitcher")) return res;
            const user = args[0], me = currentUser();
            if (!me || (user && user.id === me.id)) return true;
            const store = accountSwitcherStore();
            try { if (store && typeof store.getCanUseMultiAccountMobile === "function" && !store.getCanUseMultiAccountMobile()) return true; } catch (_) {}
            return res;
        };
        if (typeof exports.default === "function") exports = hookExport(exports, "default", wrap);
        if (typeof exports.isStaffFromRawUser === "function") exports = hookExport(exports, "isStaffFromRawUser", wrap);
        return exports;
    }
    function openAccountSwitcherSheet() {
        accountSwitcherSync();
        const showSheet = inspectedExport(16834, "showYouAccountActionSheet");
        try { if (typeof showSheet === "function") { showSheet(false); return; } } catch (_) {}
        openManageAccounts();
    }
    function openManageAccounts(screen) {
        accountSwitcherSync();
        if (!screen) {
            const screens = inspectedExport(16841, "ManageAccountsScreens") || inspectedExport(16841, "ManageAccountsModalRoutes");
            screen = screens && screens.MANAGE_ACCOUNTS || "manage_accounts";
        }
        const openModal = inspectedExport(16839, "default");
        try { if (typeof openModal === "function") { openModal(screen); return; } } catch (_) {}
    }
    function openAddAccountModal() {
        const screens = inspectedExport(16841, "ManageAccountsScreens") || inspectedExport(16841, "ManageAccountsModalRoutes");
        const loginRoute = screens && screens.LOGIN || "login";
        openManageAccounts(loginRoute);
    }
    // Create a new account (#86): Discord's Add account screen (Login 6623 with isMultiAccount) only signs in, and
    // ManageAccountsModal (16840) only registers four screens (MANAGE_ACCOUNTS, LOGIN, MFA,
    // ACCOUNT_DISABLED_OR_DELETION_SCHEDULED). The Add account screen gets a "Create a new account" link drawn with
    // Discord's own LinkButton, next to "Forgot your password?", so the screen keeps Discord's look. The modal also
    // mounts Discord's sign-up screens (REGISTER_IDENTITY, REGISTER_DISPLAY_NAME, REGISTER_ACCOUNT_INFORMATION,
    // VERIFY_PHONE, AGE_GATE…) from RegistrationStepsUtils.getAllAuthScreens (16375) inside
    // TrackRegistrationContext (16373). When registerFull (16387) succeeds, its REGISTER_SUCCESS token goes to
    // switchAccountToken (5930) instead of replacing the signed-in token, so the new account is added next to the
    // others.
    // AuthStates (1085) values of Discord's sign-up steps, including the screens they open along the way.
    const REGISTRATION_ROUTES = ["REGISTER_IDENTITY", "REGISTER_DISPLAY_NAME", "REGISTER_ACCOUNT_INFORMATION", "VERIFY_PHONE",
        "AGE_GATE", "AGE_GATE_UNDERAGE", "COUNTRY_SELECT", "EXTERNAL_LINK"];
    function resetMultiAccountRegistration() {
        const resetReg = inspectedExport(16376, "resetRegistration");
        try { if (typeof resetReg === "function") resetReg(); } catch (_) {}
    }
    function registerIdentityRoute() {
        const auth = inspectedExport(1085, "AuthStates");
        return auth && auth.REGISTER_IDENTITY || "register_identity";
    }
    function openRegister() {
        resetMultiAccountRegistration();
        openManageAccounts(registerIdentityRoute());
    }
    function addAccountLogin(orig, self, args) {
        // Login itself calls useNavigation; calling it here too, before any early return, keeps the hook order
        // stable when Account switcher is toggled. Inside the Add account modal it's the modal's own stack.
        const useNav = inspectedExport(1503, "useNavigation");
        let nav = null;
        try { if (typeof useNav === "function") nav = useNav(); } catch (_) {}
        const rendered = orig.apply(self, args);
        const props = args[0];
        if (!enabled("accountSwitcher") || !props || !props.isMultiAccount || !React) return rendered;
        const LinkButton = inspectedExport(6623, "LinkButton");
        if (typeof LinkButton !== "function" && !(LinkButton && LinkButton.$$typeof)) return rendered;
        const onRegister = () => {
            resetMultiAccountRegistration();
            const route = registerIdentityRoute();
            try { if (nav && typeof nav.navigate === "function") { nav.navigate(route); return; } } catch (_) {}
            openManageAccounts(route);
        };
        let added = false;
        const isLink = child => child && typeof child === "object" && child.type === LinkButton;
        const withRegister = cloneTree(rendered, function (node, nodeProps) {
            if (added) return nodeProps;
            const kids = nodeProps.children;
            const list = Array.isArray(kids) ? kids : [kids];
            let last = -1;
            for (let i = 0; i < list.length; i++) if (isLink(list[i])) last = i;
            if (last < 0) return nodeProps;
            added = true;
            const next = list.slice();
            next.splice(last + 1, 0, el(LinkButton, {key:"venus-register", text:tr("Create a new account"), onPress:onRegister}));
            return Object.assign({}, nodeProps, {children:next});
        }, 0, () => added);
        return withRegister;
    }
    // One screen per sign-up step. Built in its own function: the pinned hermesc compiles let/const in a loop body
    // as one shared variable, so closures made inside the loop all saw the last screen (COMPANION_REMOTE_AUTH, the
    // endless "Connecting…" page) instead of their own.
    function registrationScreen(screenType, routeName, cfg, parts) {
        const options = routeProps => {
            const nav = routeProps && routeProps.navigation;
            const opts = {headerTitle:typeof cfg.headerTitle === "function" ? cfg.headerTitle : () => null};
            if (cfg.headerShown === false) opts.headerShown = false;
            if (parts.HeaderBackImage && parts.BackButtonWithTracking && nav && typeof nav.goBack === "function") {
                const backImage = () => el(parts.HeaderBackImage, {});
                opts.headerLeft = headerProps => {
                    const backProps = Object.assign({}, headerProps, {backImage});
                    return typeof cfg.headerLeft === "function" ? cfg.headerLeft(backProps) : el(parts.BackButtonWithTracking, backProps);
                };
            }
            return opts;
        };
        const screenProps = {key:"venus-auth:" + routeName, name:routeName, options};
        if (typeof cfg.render === "function") screenProps.children = p => cfg.render(p && p.route && p.route.params, p && p.navigation);
        else screenProps.component = cfg.screen;
        return el(screenType, screenProps);
    }
    function manageAccountsModalWithRegister(orig, self, args) {
        const rendered = orig.apply(self, args);
        if (!enabled("accountSwitcher") || !rendered || !React) return rendered;
        const getAllAuthScreens = inspectedExport(16375, "getAllAuthScreens");
        if (typeof getAllAuthScreens !== "function") return rendered;
        let authScreens = null;
        try { authScreens = getAllAuthScreens(); } catch (_) {}
        if (!authScreens || typeof authScreens !== "object") return rendered;
        const parts = {BackButtonWithTracking:inspectedExport(16384, "BackButtonWithTracking"), HeaderBackImage:inspectedExport(6201, "HeaderBackImage")};
        const TrackRegistrationContext = inspectedExport(16373, "TrackRegistrationContext");
        const getTrackRegTransition = inspectedExport(16384, "getTrackRegTransition");
        let patched = false;
        const tree = cloneTree(rendered, function (node, nodeProps) {
            if (patched) return nodeProps;
            const kids = nodeProps.children;
            if (!Array.isArray(kids) || kids.length < 2) return nodeProps;
            let screenType = null;
            const existingNames = new Set();
            for (let i = 0; i < kids.length; i++) {
                const k = kids[i];
                if (k && typeof k === "object" && k.props && typeof k.props.name === "string" && (k.props.component || k.props.children)) {
                    screenType = k.type;
                    existingNames.add(k.props.name);
                }
            }
            if (!screenType || (!existingNames.has("login") && !existingNames.has("LOGIN"))) return nodeProps;
            patched = true;
            const next = kids.slice();
            const keys = Object.keys(authScreens);
            for (let i = 0; i < keys.length; i++) {
                const routeName = keys[i];
                // Only the sign-up steps: Welcome, Log in with Meta Horizon and the rest stay out of the Add account modal.
                if (existingNames.has(routeName) || REGISTRATION_ROUTES.indexOf(routeName) < 0) continue;
                const cfg = authScreens[routeName];
                if (!cfg || (typeof cfg.render !== "function" && !cfg.screen)) continue;
                next.push(registrationScreen(screenType, routeName, cfg, parts));
            }
            return Object.assign({}, nodeProps, {children:next});
        }, 0, () => patched);
        if (TrackRegistrationContext && typeof getTrackRegTransition === "function") {
            let trackVal = null;
            try { trackVal = getTrackRegTransition({current:undefined}); } catch (_) {}
            if (trackVal) return el(TrackRegistrationContext.Provider || TrackRegistrationContext, {value:trackVal}, tree);
        }
        return tree;
    }
    function hookRegisterForMultiAccount(exports) {
        if (!exports || typeof exports !== "object") return exports;
        const wrapRegister = function (orig, self, args) {
            if (!enabled("accountSwitcher") || !currentUser() || accountSwitcher.registering) return orig.apply(self, args);
            accountSwitcherSync();
            const d = inspectedExport(584, "default");
            const authActions = inspectedExport(5930, "default");
            if (!d || typeof d.dispatch !== "function" || !authActions || typeof authActions.switchAccountToken !== "function") {
                return orig.apply(self, args);
            }
            // registerFull dispatches REGISTER_SUCCESS {token}; AuthenticationStore would then swap the signed-in
            // token in place. Hold it back and switch to the new account the way Add account does.
            const realDispatch = d.dispatch;
            let capturedToken = null;
            accountSwitcher.registering = true;
            d.dispatch = function (event) {
                if (event && event.type === "REGISTER_SUCCESS" && typeof event.token === "string" && event.token) {
                    capturedToken = event.token;
                    return Promise.resolve();
                }
                return realDispatch.apply(this, arguments);
            };
            const restore = () => { accountSwitcher.registering = false; if (d.dispatch !== realDispatch) d.dispatch = realDispatch; };
            let res;
            try {
                res = orig.apply(self, args);
            } catch (err) {
                restore();
                throw err;
            }
            return Promise.resolve(res).then(val => {
                restore();
                // A token equal to the signed-in one would only reconnect to the same account; never switch to it.
                const tokenMgr = inspectedExport(1111, "getToken") ? global.__r(1111) : null;
                let activeToken = null;
                try { activeToken = tokenMgr ? tokenMgr.getToken() : null; } catch (_) {}
                if (capturedToken && capturedToken !== activeToken) {
                    try { authActions.switchAccountToken(capturedToken, true); } catch (_) {}
                }
                return val;
            }, err => {
                restore();
                throw err;
            });
        };
        if (typeof exports.registerFull === "function") exports = hookExport(exports, "registerFull", wrapRegister);
        if (typeof exports.default === "function") exports = hookExport(exports, "default", wrapRegister);
        return exports;
    }
    // Every request carries the signed-in account's token (superagentPatch adds Authorization unless the request sets
    // it). Discord's Add account login sends authorization:"" for that reason, but its sign-up requests never had to:
    // signed in, POST /auth/register and /auth/register/phone ran as the current account, the token that came back
    // was that account's own, and the switch reconnected to the same account ("Switch failed, sorry :("). Sign-up
    // requests made while signed in now go out signed out, like the Add account login.
    function isSignUpUrl(url) {
        if (typeof url !== "string") return false;
        const endpoints = inspectedExport(1085, "Endpoints");
        const register = endpoints && endpoints.REGISTER || "/auth/register";
        const registerPhone = endpoints && endpoints.REGISTER_PHONE || "/auth/register/phone";
        return url === register || url === registerPhone;
    }
    function signUpSignedOut(orig, self, args) {
        const options = args[0];
        if (!enabled("accountSwitcher") || !options || typeof options !== "object" || !isSignUpUrl(options.url) || !currentUser())
            return orig.apply(self, args);
        const next = Array.prototype.slice.call(args);
        next[0] = Object.assign({}, options, {headers:Object.assign({}, options.headers, {authorization:""})});
        return orig.apply(self, next);
    }
    function hookTrackedHttpForSignUp(exports) {
        const http = exports && exports.default;
        if (http && typeof http.post === "function") hookExport(http, "post", signUpSignedOut);
        return exports;
    }
    function switchToAccount(userId) {
        if (typeof userId !== "string" || !userId) return;
        const me = currentUser();
        if (me && me.id === userId) return;
        accountSwitcherSync();
        const rawActions = global.__r && global.__r(12133);
        const actions = rawActions && typeof rawActions.switchAccount === "function" ? rawActions : rawActions && rawActions.default;
        const locs = inspectedExport(12130, "MultiAccountSwitchLocation");
        const location = locs && (locs.MANAGE_ACCOUNTS_MODAL || locs.YOU_ACCOUNT_ACTION_SHEET) || "manage_accounts_modal";
        try {
            if (actions && typeof actions.switchAccount === "function") {
                actions.switchAccount(userId, undefined, location);
                return;
            }
        } catch (_) {}
    }
    function removeSavedAccount(userId) {
        if (typeof userId !== "string" || !userId) return;
        const me = currentUser();
        if (me && me.id === userId) return;
        const rawActions = global.__r && global.__r(12133);
        const actions = rawActions && typeof rawActions.removeAccount === "function" ? rawActions : rawActions && rawActions.default;
        try { if (actions && typeof actions.removeAccount === "function") actions.removeAccount(userId); } catch (_) {}
        notify("accountSwitcher");
    }
    function YouBarAccountSwitcherButton(props) {
        useSettings("accountSwitcher");
        useSettings("accountSwitcherYouBar");
        if (!enabled("accountSwitcher") || !settings.accountSwitcherYouBar || !RN) return null;
        if (!accountSwitcher.youBarParts) {
            const Button = inspectedExport(16857, "default"), Icon = inspectedExport(8212, "GroupIcon") || inspectedExport(10287, "UserCircleIcon");
            if (!Button || !Icon) return null;
            const size = inspectedExport(15378, "YOU_BAR_BUTTON_ICON_SIZE") || 20;
            accountSwitcher.youBarParts = {Button, Icon, style:{width:size, height:size}};
        }
        const nameplate = !!(props && props.hasNameplate);
        return el(accountSwitcher.youBarParts.Button, {hasNameplate:nameplate, hasBadge:false,
            accessibilityLabel:tr("Switch accounts"), onPress:openAccountSwitcherSheet, onLongPress:() => openManageAccounts(),
            icon:el(accountSwitcher.youBarParts.Icon, {size:"custom", style:accountSwitcher.youBarParts.style, color:nameplate ? "white" : undefined})});
    }
    function accountSwitcherSummary() {
        if (!enabled("accountSwitcher")) return tr("Turned off. Switch it on in Features to start.");
        const accounts = accountSwitcherUsers();
        const me = currentUser();
        const limit = multiAccountLimit();
        // The card's title already gives the count, so the details say who you are and how many fit.
        const room = accounts.length ? pl(limit, "You can save up to {n} account.", "You can save up to {n} accounts.") : tr("No accounts saved yet (up to {max}).", {max:limit});
        const activeName = me && (me.globalName || me.global_name || me.username);
        return activeName ? tr("Signed in as {name}.", {name:activeName}) + "\n" + room : room;
    }
    function AccountSwitcherSettings() {
        useSettings("accountSwitcher");
        const [, forceUpdate] = React.useState(0);
        const ui = reviewUI();
        React.useEffect(() => {
            accountSwitcherSync();
            const validate = inspectedExport(12133, "validateMultiAccountTokens");
            try { if (enabled("accountSwitcher") && typeof validate === "function") validate(); } catch (_) {}
            const wake = () => forceUpdate(n => n + 1);
            const stores = [userStore, accountSwitcherStore()].filter(Boolean);
            stores.forEach(s => { try { if (typeof s.addChangeListener === "function") s.addChangeListener(wake); } catch (_) {} });
            return () => stores.forEach(s => { try { if (typeof s.removeChangeListener === "function") s.removeChangeListener(wake); } catch (_) {} });
        }, []);
        if (!React || !RN) return null;
        const Group = ui.TableRowGroup || RN.View, Switch = ui.TableSwitchRow, Row = ui.TableRow;
        const on = enabled("accountSwitcher");
        const me = currentUser(), myId = me && me.id;
        const accounts = accountSwitcherUsers();
        const statuses = inspectedExport(12129, "MultiAccountTokenStatus");
        const invalidStatus = statuses && typeof statuses.INVALID === "number" ? statuses.INVALID : 0;
        const validatingStatus = statuses && typeof statuses.VALIDATING === "number" ? statuses.VALIDATING : 1;
        const accountRows = accounts.length ? accounts.map(acc => {
            if (!acc || !acc.id || !Row) return null;
            const active = myId && acc.id === myId;
            const fullUser = (active ? me : userStore && userStore.getUser(acc.id)) || acc;
            const displayName = fullUser && (fullUser.globalName || fullUser.global_name || fullUser.username) || acc.username || acc.id;
            const handle = acc.username && acc.username !== displayName ? "@" + acc.username + " \u00b7 " : "";
            const statusText = active ? tr("Active account \u00b7 Tap for the quick switcher") :
                acc.tokenStatus === invalidStatus ? tr("Session expired \u00b7 Tap to sign in again") :
                acc.tokenStatus === validatingStatus ? tr("Checking session…") : tr("Tap to switch");
            return el(Row, {key:"acc:" + acc.id, label:displayName, subLabel:handle + statusText,
                icon:avatarBubble(fullUser, 32, active ? "online" : acc.tokenStatus === invalidStatus ? "dnd" : null), disabled:!on,
                trailing:active ? popIn("on:" + acc.id, el(venusIcon(6823, "CheckmarkSmallIcon"), {size:"md"})) : undefined,
                onPress:() => {
                    if (active) { openAccountSwitcherSheet(); return; }
                    if (acc.tokenStatus === invalidStatus) { openAddAccountModal(); return; }
                    switchToAccount(acc.id);
                },
                onLongPress:!active ? () => confirmAction("Remove account?",
                    tr("Remove {name} from this phone's account switcher? You can add it again anytime.", {name:displayName}),
                    "Remove", () => removeSavedAccount(acc.id)) : undefined});
        }) : [Row ? el(Row, {key:"empty", label:tr("No saved accounts yet"), subLabel:tr("Tap Add account below to sign in to another account."), disabled:true}) : null];
        const groups = [
            on ? statusCard("status", accountSwitcherSummary(), {title:accounts.length > 1 ? pl(accounts.length, "{n} account", "{n} accounts") : tr("One account so far"),
                IconComponent:venusIcon(8212, "GroupIcon"), leading:accounts.length ? avatarPile(accounts.slice(0, 4).map(acc => (myId && acc.id === myId ? me : userStore && userStore.getUser(acc.id)) || acc)) : null}) :
                offCard("status", venusIcon(8212, "GroupIcon"), "accountSwitcher"),
            el(Group, {key:"accounts", title:tr("Accounts")},
                accountRows,
                Row ? el(Row, {key:"add", label:tr("Add account"), subLabel:tr("Sign in to another Discord account on this phone."), icon:rowIcon(5032, "UserPlusIcon"),
                    arrow:true, disabled:!on || accounts.length >= multiAccountLimit(), onPress:openAddAccountModal}) : null,
                Row ? el(Row, {key:"register", label:tr("Create a new account"), subLabel:tr("Register a new Discord account right inside the app."), icon:rowIcon(5032, "UserPlusIcon"),
                    arrow:true, disabled:!on || accounts.length >= multiAccountLimit(), onPress:openRegister}) : null,
                Row ? el(Row, {key:"manage", label:tr("Manage accounts"), subLabel:tr("Open Discord's account manager to reorder or remove accounts."), icon:rowIcon(7092, "SettingsIcon"),
                    arrow:true, disabled:!on, onPress:() => openManageAccounts()}) : null,
                null),
            el(Group, {key:"shortcuts", title:tr("Shortcuts")},
                switchRow(Switch, "accountSwitcherYouBar", "Button on the profile bar", "Shows a Switch accounts button next to the notifications bell on the bottom bar.", rowIcon(10287, "UserCircleIcon"))),
            footnote("note", "Tap your avatar on the You tab, or hold the You tab, to switch from anywhere. Hold an account above to remove it.")];
        return settingsBody(ui, groups);
    }

    // Send messages longer than the limit (based on SplitLargeMessages by sunnie): the message box accepts
    // any length, and a long message is sent as several, each within Discord's limit.
    const SPLIT_UNLIMITED = 1 << 30;
    const realLimits = {normal:2000, premium:4000};
    const split = {generation:0, premium:null, canBypassSlowmode:null};
    function messageLimit() {
        const user = currentUser();
        if (!user) return realLimits.normal;
        try {
            const premium = split.premium || (split.premium = inspectedExport(4769, "default"));
            const check = premium && premium.canUseIncreasedMessageLength;
            if (typeof check === "function") return check.call(premium, user) ? realLimits.premium : realLimits.normal;
        } catch (_) {}
        return user.premiumType === 2 ? realLimits.premium : realLimits.normal;
    }
    // Splits at the last line break, else the last space, else anywhere. A code block cut in two is closed at
    // the end of one part and opened again, with its language, at the start of the next.
    const FENCE = /```([^\s`]{0,20})/g;
    function splitContent(text, limit) {
        const chunks = [];
        let start = 0, prefix = "";
        while (prefix.length + (text.length - start) > limit) {
            const budget = limit - prefix.length - 4;
            if (budget < 16) return null;
            const searchEnd = start + budget;
            let cut = text.lastIndexOf("\n", searchEnd);
            if (cut - start < budget / 2) {
                const space = text.lastIndexOf(" ", searchEnd);
                if (space > cut) cut = space;
            }
            if (cut <= start) cut = searchEnd;
            const code = text.charCodeAt(cut - 1);
            if (code >= 0xD800 && code <= 0xDBFF && cut - 1 > start) cut--;
            let piece = prefix + text.slice(start, cut);
            start = cut;
            if (text[start] === "\n" || text[start] === " ") start++;
            let open = false, language = "";
            if (piece.indexOf("```") >= 0) {
                let match;
                FENCE.lastIndex = 0;
                while ((match = FENCE.exec(piece))) { open = !open; if (open) language = match[1]; }
            }
            if (open) { piece += "\n```"; prefix = "```" + language + "\n"; } else prefix = "";
            if (piece.trim()) chunks.push(piece);
        }
        const last = prefix + (start ? text.slice(start) : text);
        if (last.trim() && last.trim() !== prefix.trim()) chunks.push(last);
        return chunks;
    }
    function splitGapMs(channelId) {
        const channel = receivedChannel(channelId);
        const slowmode = channel && Number(channel.rateLimitPerUser) || 0;
        if (slowmode <= 0) return 1000;
        const canBypass = split.canBypassSlowmode || (split.canBypassSlowmode = inspectedExport(7371, "canBypassSlowmode"));
        try { if (typeof canBypass === "function" && canBypass(channel)) return 1000; } catch (_) {}
        return Math.max(1000, slowmode * 1000 + 500);
    }
    function splitFollowUpOptions(options) {
        if (!options || typeof options !== "object") return {};
        const next = {};
        if (options.location !== undefined) next.location = options.location;
        if (options.flags !== undefined) next.flags = options.flags;
        if (options.allowedMentions !== undefined) next.allowedMentions = options.allowedMentions;
        if (options.eagerDispatch !== undefined) next.eagerDispatch = options.eagerDispatch;
        if (options.doNotNotifyOnError !== undefined) next.doNotNotifyOnError = options.doNotNotifyOnError;
        return next;
    }
    function splitSend(orig, self, args) {
        const channelId = args[0], message = args[1], waitForReady = args[2], options = args[3];
        // Hot path: every send that fits goes straight through after one length check.
        if (!message || typeof message.content !== "string" || message.content.length <= 2000 || !enabled("splitMessages")) return orig.apply(self, args);
        // Never split scheduled messages: createScheduledMessage (297457) schedules a single server payload.
        if (options && options.scheduledTimestamp != null) return orig.apply(self, args);
        const limit = messageLimit();
        if (message.content.length <= limit) return orig.apply(self, args);
        const chunks = splitContent(message.content, limit);
        if (!chunks || chunks.length < 2) return orig.apply(self, args);
        const generation = split.generation;
        const first = Array.from(args); first[1] = Object.assign({}, message, {content:chunks[0]});
        const result = orig.apply(self, first);
        const gap = splitGapMs(channelId);
        const followOptions = splitFollowUpOptions(options);
        const followMessageBase = {tts:!!message.tts, invalidEmojis:message.invalidEmojis || [],
            validNonShortcutEmojis:message.validNonShortcutEmojis || []};
        // The rest follow one at a time, without the reply or attachments, only after the previous part succeeds.
        let chain = Promise.resolve(result).then(res => !(res && res.hasErr), () => false);
        for (let i = 1; i < chunks.length; i++) {
            const content = chunks[i];
            chain = chain.then(ok => {
                if (!ok || !enabled("splitMessages") || split.generation !== generation) return false;
                return new Promise(resolve => later(resolve, gap)).then(() => {
                    if (!enabled("splitMessages") || split.generation !== generation) return false;
                    return orig.call(self, channelId, Object.assign({content}, followMessageBase), waitForReady, Object.assign({}, followOptions));
                }).then(res => !(res && res.hasErr), () => false);
            });
        }
        return result;
    }
    // useMessageMaxLength (9255): the message box, its counter and the "too long" check all ask it.
    // Its internal useStateFromStores closure (101129 / 101130) reads MAX_MESSAGE_LENGTH / MAX_MESSAGE_LENGTH_PREMIUM
    // from lexical environment slots [2, 4] and [2, 5] captured once when 9255's factory ran, so lengthConstants
    // always returns SPLIT_UNLIMITED when features.splitMessages is built in, and maxLengthModule restores the real
    // limit when the toggle is off.
    function maxLengthModule(exports) {
        const big = (orig, self, args) => {
            const value = orig.apply(self, args);
            if (enabled("splitMessages")) return SPLIT_UNLIMITED;
            return value === SPLIT_UNLIMITED ? messageLimit() : value;
        };
        exports = hookExport(exports, "getMaxMessageLength", big);
        return hookExport(exports, "default", (orig, self, args) => {
            if (React) useSettings("splitMessages");
            return big(orig, self, args);
        });
    }
    // Constants (1085): DraftStore (7239) and useMessageMaxLength (9255) both read MAX_MESSAGE_LENGTH and
    // MAX_MESSAGE_LENGTH_PREMIUM once at module evaluation time during startup (before venus-patches.json finishes
    // loading settings.splitMessages) and cache the numbers in closure environment slots. Always return
    // SPLIT_UNLIMITED while features.splitMessages is built in so DraftStore never truncates long drafts to 4500
    // characters and 8602's closure slots hold SPLIT_UNLIMITED.
    function lengthConstants(exports) {
        if (!exports) return exports;
        for (const [key, slot] of [["MAX_MESSAGE_LENGTH", "normal"], ["MAX_MESSAGE_LENGTH_PREMIUM", "premium"]]) {
            const descriptor = Object.getOwnPropertyDescriptor(exports, key);
            if (!descriptor || !("value" in descriptor) || typeof descriptor.value !== "number" || !descriptor.configurable) continue;
            realLimits[slot] = descriptor.value;
            const value = descriptor.value;
            Object.defineProperty(exports, key, {configurable:true, enumerable:descriptor.enumerable,
                get:() => features.splitMessages ? SPLIT_UNLIMITED : value, set:() => {}});
        }
        return exports;
    }

    // Fix link previews: links to posts on sites whose previews Discord can't build (X, Instagram, TikTok, Reddit...) are
    // sent through an embed service that can: x.com/... becomes fixupx.com/..., and the post shows with its text, picture
    // or video. Only the address changes: Venus fetches nothing, and nothing happens until you send.
    // Each site: [id, name, brand color, icon (module, export) or a letter, hosts, post path (or one per host), services].
    // A service is [id, name, {from host: to host}], or [id, name, "prefix"] for one that takes the whole link.
    // Built only when a link is first sent or the page opens, never while Discord starts.
    function fixSiteRows() {
        return [
            ["x", "X (Twitter)", "#000000", [8128, "XNeutralIcon"], ["x.com", "twitter.com"], /^\/(?:[A-Za-z0-9_]{1,15}|i(?:\/web)?)\/status(?:es)?\/\d+/,
                [["fxtwitter", "FxTwitter", {"x.com":"fixupx.com", "twitter.com":"fxtwitter.com"}], ["vxtwitter", "vxTwitter", {"x.com":"fixvx.com", "twitter.com":"vxtwitter.com"}]]],
            ["instagram", "Instagram", "#e1306c", [8132, "InstagramNeutralIcon"], ["instagram.com"], /^\/(?:[\w.]+\/)?(?:p|reels?|tv|share(?:\/(?:p|reels?))?)\/[\w-]+/,
                [["oginstagram", "OGInstagram", {"instagram.com":"oginstagram.com"}], ["instafix", "InstaFix", {"instagram.com":"eeinstagram.com"}],
                 ["kkinstagram", "KKInstagram", {"instagram.com":"kkinstagram.com"}]]],
            ["tiktok", "TikTok", "#ee1d52", [12055, "TiktokNeutralIcon"], ["tiktok.com", "vm.tiktok.com", "vt.tiktok.com"],
                {"tiktok.com":/^\/(?:@[\w.-]+\/(?:video|photo)\/\d+|t\/\w+)/, "vm.tiktok.com":/^\/\w+/, "vt.tiktok.com":/^\/\w+/},
                [["fxtiktok", "fxTikTok", {"tiktok.com":"tnktok.com", "vm.tiktok.com":"vm.tnktok.com", "vt.tiktok.com":"vt.tnktok.com"}],
                 ["tiktxk", "tiktxk", {"tiktok.com":"tiktxk.com", "vm.tiktok.com":"vm.tiktxk.com", "vt.tiktok.com":"vt.tiktxk.com"}]]],
            ["reddit", "Reddit", "#ff4500", [9105, "RedditNeutralIcon"], ["reddit.com"], /^\/(?:r|u|user)\/[\w-]+\/(?:comments|s)\/\w+/,
                [["vxreddit", "vxReddit", {"reddit.com":"vxreddit.com"}], ["fixreddit", "FixReddit", {"reddit.com":"fxreddit.seria.moe"}], ["rxddit", "rxddit", {"reddit.com":"rxddit.com"}]]],
            ["bluesky", "Bluesky", "#1185fe", [9103, "BlueskyNeutralIcon"], ["bsky.app"], /^\/profile\/[^\/\s]+\/post\/\w+/,
                [["fxbsky", "FxBluesky", {"bsky.app":"fxbsky.app"}], ["vixbluesky", "VixBluesky", {"bsky.app":"bskx.app"}]]],
            ["threads", "Threads", "#101010", "@", ["threads.net", "threads.com"], /^\/@[\w.]+\/post\/[\w-]+/,
                [["fixembed", "FixEmbed", "https://fixembed.app/embed?url="]]],
            ["facebook", "Facebook", "#0866ff", [8130, "FacebookNeutralIcon"], ["facebook.com"],
                /^\/(?:reel\/\d+|watch\/?\?|share\/[rvp]\/\w+|[\w.]+\/(?:videos|posts)\/[\w.-]+|story\.php|permalink\.php)/,
                [["facebed", "facebed", {"facebook.com":"facebed.com"}]]],
            ["pixiv", "pixiv", "#0096fa", "P", ["pixiv.net"], /^\/(?:[a-z]{2}\/)?artworks\/\d+/,
                [["phixiv", "phixiv", {"pixiv.net":"phixiv.net"}], ["ppxiv", "ppxiv", {"pixiv.net":"ppxiv.net"}]]],
            ["bilibili", "Bilibili", "#fb7299", "B", ["bilibili.com"], /^\/video\/\w+/,
                [["bilifix", "BiliFix", {"bilibili.com":"vxbilibili.com"}]]]];
    }
    // Share and tracking parameters each site adds when you copy a link: who shared it, from which app, and when. They're
    // removed from links Venus fixes, so neither the embed service nor anyone who taps the link sees them. utm_*, si and fbclid go everywhere.
    function fixTrackingTable() {
        return {x:/^(?:s|t|ref_src|ref_url)$/, instagram:/^(?:igsh|igshid|img_index)$/,
            tiktok:/^(?:_r|_t|_d|is_from_webapp|sender_device|sender_web_id|web_id|share_app_id|share_link_id|u_code|preview_pb|timestamp|checksum|tt_from|enter_from|source|social_share_type|share_item_id|user_id|sec_user_id)$/,
            reddit:/^(?:share_id|rdt|context|ref|ref_source|ref_campaign)$/, threads:/^(?:xmt|slof)$/, facebook:/^(?:mibextid|rdid|sfnsn|extid|ref|__tn__)$/,
            bilibili:/^(?:spm_id_from|vd_source|share_source|share_medium|share_plat|share_session_id|share_tag|timestamp|unique_k|up_id|bbid|ts)$/};
    }
    const FIX_TRACKING_ANY = /^(?:utm_\w+|si|fbclid|gclid|mc_cid|mc_eid)$/;
    const fixEmbeds = {hosts:null, sites:null, rows:null, tracking:null, parsed:null, parsedFrom:null, count:0, pending:0};
    // One host lookup per link instead of a regex per site.
    function fixTables() {
        const hosts = Object.create(null), sites = Object.create(null), rows = fixSiteRows();
        rows.forEach(row => {
            const site = {id:row[0], name:row[1], color:row[2], icon:row[3], hosts:row[4], path:row[5], services:row[6].map(s => ({id:s[0], name:s[1], to:s[2]}))};
            sites[site.id] = site;
            site.hosts.forEach(host => { hosts[host] = site; });
        });
        fixEmbeds.hosts = hosts; fixEmbeds.sites = sites; fixEmbeds.rows = rows; fixEmbeds.tracking = fixTrackingTable();
    }
    function fixRows() { if (!fixEmbeds.rows) fixTables(); return fixEmbeds.rows; }
    function fixSite(id) { if (!fixEmbeds.sites) fixTables(); return fixEmbeds.sites[id] || null; }
    // fixEmbedsSites keeps only what differs from the defaults (each site's first service): "x:vxtwitter,threads:off".
    function fixChoices(raw) {
        if (fixEmbeds.parsedFrom === raw && fixEmbeds.parsed) return fixEmbeds.parsed;
        if (!fixEmbeds.sites) fixTables();
        const out = Object.create(null);
        String(raw || "").split(",").forEach(part => {
            const at = part.indexOf(":"), id = part.slice(0, at), choice = part.slice(at + 1), site = at > 0 && fixEmbeds.sites[id];
            if (site && (choice === "off" || site.services.some(s => s.id === choice)) && choice !== site.services[0].id) out[id] = choice;
        });
        fixEmbeds.parsedFrom = raw; fixEmbeds.parsed = out;
        return out;
    }
    function fixChoicesText(choices) { return fixRows().filter(row => choices[row[0]]).map(row => row[0] + ":" + choices[row[0]]).join(","); }
    // The choices written the one way they're saved; unknown sites or services are dropped. Undefined for anything else.
    function fixSitesText(raw) { return typeof raw === "string" && raw.length <= 400 ? fixChoicesText(fixChoices(raw)) : undefined; }
    function fixService(site) {
        const choice = fixChoices(settings.fixEmbedsSites)[site.id];
        return choice === "off" ? null : choice ? site.services.find(s => s.id === choice) || site.services[0] : site.services[0];
    }
    function fixSetChoice(siteId, choice) {
        const site = fixSite(siteId);
        if (!site) return;
        const choices = Object.assign({}, fixChoices(settings.fixEmbedsSites));
        if (choice === site.services[0].id) delete choices[siteId]; else choices[siteId] = choice;
        setSetting("fixEmbedsSites", fixChoicesText(choices));
    }
    function fixClean(site, query) {
        const own = fixEmbeds.tracking[site.id], kept = query.split("&").filter(pair => {
            if (!pair) return false;
            const at = pair.indexOf("="), name = at < 0 ? pair : pair.slice(0, at);
            return !FIX_TRACKING_ANY.test(name) && !(own && own.test(name));
        });
        return kept.length ? "?" + kept.join("&") : "";
    }
    // One link: {site, service, link}, or null when it isn't a post on a site you fix. A closing ")" or "." stays outside it.
    const FIX_TAIL = /[.,!?:;'")\]}*_~]+$/, FIX_SUBDOMAIN = /^(?:www|m|mobile|old|new|web)\./;
    function fixLink(host, rest, clean) {
        if (!fixEmbeds.hosts) fixTables();
        let bare = host.toLowerCase();
        if (FIX_SUBDOMAIN.test(bare)) bare = bare.slice(bare.indexOf(".") + 1);
        const site = fixEmbeds.hosts[bare];
        if (!site) return null;
        const tail = FIX_TAIL.exec(rest), body = tail ? rest.slice(0, tail.index) : rest;
        const path = site.path instanceof RegExp ? site.path : site.path[bare];
        if (!path || !path.test(body)) return null;
        const service = fixService(site);
        if (!service) return null;
        let address = body;
        if (clean !== false && settings.fixEmbedsClean) {
            const hash = address.indexOf("#"), fragment = hash < 0 ? "" : address.slice(hash), noHash = hash < 0 ? address : address.slice(0, hash), q = noHash.indexOf("?");
            if (q >= 0) address = noHash.slice(0, q) + fixClean(site, noHash.slice(q + 1)) + fragment;
        }
        const fixed = typeof service.to === "string" ? service.to + encodeURIComponent("https://" + bare + address) : "https://" + service.to[bare] + address;
        return {site, service, link:fixed + (tail ? tail[0] : "")};
    }
    // Code, escaped text and <links in angle brackets> (Discord's way to send a link without a preview) are left as written.
    const FIX_SCAN = /```[\s\S]*?(?:```|$)|``[^\n]*?(?:``|$)|`[^`\n]*(?:`|$)|\\[\s\S]|<https?:\/\/[^\s>]*>|https?:\/\/([A-Za-z0-9.-]+)([\/?#][^\s<>|]*)/g;
    function fixContent(content) {
        // A message without a link costs one indexOf.
        if (typeof content !== "string" || content.indexOf("://") < 0) return content;
        let changed = 0;
        const out = content.replace(FIX_SCAN, (match, host, rest) => {
            if (!host) return match;
            const fixed = fixLink(host, rest);
            if (!fixed) return match;
            changed++;
            return fixed.link;
        });
        if (!changed) return content;
        fixEmbeds.pending = changed;
        return out;
    }
    // Counted only once the fixed text is really what's sent, not when it's sent as written because it got too long.
    function fixCounted() {
        if (!fixEmbeds.pending) return;
        fixEmbeds.count += fixEmbeds.pending; fixEmbeds.pending = 0;
        later(() => notify("fixEmbeds"), 0);
    }
    // Longer links never make a message too long to send: it goes as written instead, unless Send long messages splits it.
    function fixFits(content) {
        if (features.splitMessages && enabled("splitMessages")) return true;
        const user = currentUser();
        return content.length <= (user && user.premiumType === 2 ? 4000 : 2000);
    }
    // MessageActionCreators (7174) sendMessage(channelId, message) and editMessage(channelId, messageId, {content}).
    function fixEmbedsSend(orig, self, args) {
        const message = args[1];
        if (!message || typeof message.content !== "string" || message.content.indexOf("://") < 0 || !enabled("fixEmbeds")) return orig.apply(self, args);
        const content = fixContent(message.content);
        if (content === message.content || !fixFits(content)) return orig.apply(self, args);
        fixCounted();
        const next = Array.from(args); next[1] = Object.assign({}, message, {content});
        return orig.apply(self, next);
    }
    function fixEmbedsEdit(orig, self, args) {
        const edit = args[2];
        if (!edit || typeof edit.content !== "string" || edit.content.indexOf("://") < 0 || !enabled("fixEmbeds")) return orig.apply(self, args);
        const content = fixContent(edit.content);
        if (content === edit.content || !fixFits(content)) return orig.apply(self, args);
        fixCounted();
        const next = Array.from(args); next[2] = Object.assign({}, edit, {content});
        return orig.apply(self, next);
    }

    // Bring back Tenor GIFs (#83): Discord's GIF picker asks Discord's API for /gifs/search, /gifs/trending and the rest
    // (GIFPickerActionCreators 9732 through HTTP.get, 1295), and since Tenor's API closed to Discord those answers come from
    // Klipy. Venus answers the same requests from Tenor's public v1 API, in the exact shape the picker's store (9731) reads,
    // so Tenor GIFs show in Discord's own picker: no new tab or button. "Tenor and Discord's GIFs" puts Tenor first and
    // mixes in Discord's own; "Only Tenor" uses Tenor for everything. If Tenor doesn't answer, Discord's own GIFs show.
    // GIFs are sent as tenor.com links, which Discord still turns into a playing GIF for everyone.
    const TENOR_API = "https://g.tenor.com/v1/", TENOR_KEY = "3Z0688EVWYKH";
    // Only the sizes the picker draws: tinywebp tiles (animated, ~5x smaller than tinygif), tinymp4 when Discord asks for
    // video, and the full gif for favourites. A 50-GIF page is ~70 KB of JSON instead of ~250 KB with every format.
    const TENOR_MEDIA = "tinywebp,tinygif,gif,tinymp4";
    const tenor = {cache:new Map(), ids:new Set(), down:false};
    // Discord's "en-US" is Tenor's "en_US".
    function tenorLocale(locale) { return typeof locale === "string" && /^[a-z]{2,3}(?:[-_][A-Za-z]{2,4})?$/.test(locale) ? locale.replace("-", "_") : "en_US"; }
    function tenorHealth(up) {
        if (tenor.down === !up) return;
        tenor.down = !up;
        later(() => notify("tenorGifs"), 0);
    }
    // Every answer is kept for 10 minutes, so scrolling further (a bigger limit), reopening the picker or going back to a
    // search reuses the pages it already has. contentfilter=medium matches Discord's own picker (no adult results).
    function tenorRequest(path, params) {
        let url = TENOR_API + path + "?key=" + TENOR_KEY + "&contentfilter=medium";
        for (const name in params) if (params[name] != null && params[name] !== "") url += "&" + name + "=" + encodeURIComponent(params[name]);
        const now = Date.now(), hit = tenor.cache.get(url);
        if (hit && hit.until > now) return hit.promise;
        if (typeof global.fetch !== "function") return Promise.reject(new Error("Venus: no fetch"));
        const Abort = global.AbortController, controller = typeof Abort === "function" ? new Abort() : null;
        const timer = controller ? later(() => controller.abort(), 6000, false) : undefined;
        const done = () => { if (timer !== undefined && global.clearTimeout) global.clearTimeout(timer); };
        const promise = Promise.resolve().then(() => global.fetch(url, Object.assign({method:"GET", credentials:"omit", headers:{Accept:"application/json"}},
            controller ? {signal:controller.signal} : {})))
            .then(res => { if (!res || !res.ok) throw new Error("Tenor " + (res && res.status)); return res.json(); })
            .then(body => { done(); tenorHealth(true); return body; }, error => { done(); tenor.cache.delete(url); tenorHealth(false); throw error; });
        tenor.cache.set(url, {promise, until:now + 600000});
        if (tenor.cache.size > 80) tenor.cache.delete(tenor.cache.keys().next().value);
        return promise;
    }
    // One Tenor result as the store's item: {id, url, src, gif_src, width, height}. url is what gets sent.
    function tenorItem(result, video) {
        const media = result && Array.isArray(result.media) ? result.media[0] : null;
        if (!media || typeof result.itemurl !== "string") return null;
        const thumb = video && media.tinymp4 || media.tinywebp || media.tinygif || media.gif, full = media.gif || media.tinygif || thumb;
        if (!thumb || typeof thumb.url !== "string") return null;
        const dims = Array.isArray(thumb.dims) ? thumb.dims : [];
        const id = String(result.id);
        if (tenor.ids.size > 4000) tenor.ids.clear();
        tenor.ids.add(id);
        return {id, url:result.itemurl, src:thumb.url, gif_src:full.url, width:dims[0] || 0, height:dims[1] || 0};
    }
    // Pages of 50 (Tenor's most), fetched until the picker's limit is reached: the same page URLs every time, so they cache.
    function tenorList(path, params, limit, format) {
        const want = Math.max(1, Math.min(200, Number(limit) || 50)), video = /mp4|webm/.test(String(format || "")), out = [], seen = new Set();
        const step = (pos, pages) => tenorRequest(path, Object.assign({}, params, {limit:50, pos, media_filter:TENOR_MEDIA})).then(body => {
            const results = body && Array.isArray(body.results) ? body.results : [];
            for (let i = 0; i < results.length && out.length < want; i++) {
                const item = tenorItem(results[i], video);
                if (item && !seen.has(item.id)) { seen.add(item.id); out.push(item); }
            }
            const next = body && typeof body.next === "string" ? body.next : "";
            return out.length < want && results.length && next && next !== pos && next !== "0" && pages < 4 ? step(next, pages + 1) : out;
        });
        return step("", 1);
    }
    // Category tiles: Tenor sends each as a tinygif (~100 KB); the same GIF as a tinywebp is the same picture at ~8 KB.
    function tenorCategoryImage(src) { return typeof src === "string" ? src.replace(/^(https:\/\/media\d*\.tenor\.com\/[\w-]+?)AAAAM(\/[^/?#]+)\.gif$/, "$1AAAA1$2.webp") : src; }
    // Tenor first, then one of each: a page reads as one mixed list, and a bigger limit only adds to the end of it.
    function tenorMix(mine, theirs, limit) {
        const a = Array.isArray(mine) ? mine : [], b = Array.isArray(theirs) ? theirs : [], want = Math.max(1, Number(limit) || a.length + b.length), out = [];
        for (let i = 0; out.length < want && (i < a.length || i < b.length); i++) {
            if (i < a.length) out.push(a[i]);
            if (i < b.length && out.length < want) out.push(b[i]);
        }
        return out;
    }
    function tenorWords(mine, theirs, limit) {
        const out = [], seen = new Set(), want = Math.max(1, Number(limit) || 20);
        [mine, theirs].forEach(list => { if (Array.isArray(list)) list.forEach(word => {
            const key = typeof word === "string" ? word.trim().toLowerCase() : "";
            if (key && !seen.has(key) && out.length < want) { seen.add(key); out.push(word); } }); });
        return out;
    }
    // What Tenor answers for one picker request, or null to leave it to Discord.
    function tenorAnswer(url, query) {
        const locale = tenorLocale(query.locale), q = typeof query.q === "string" ? query.q.trim() : "";
        switch (url) {
            case "/gifs/search": return q ? {list:true, limit:query.limit, load:() => tenorList("search", {q, locale}, query.limit, query.media_format)} : null;
            case "/gifs/trending-gifs": return {list:true, limit:query.limit, load:() => tenorList("trending", {locale}, query.limit, query.media_format)};
            case "/gifs/trending-search": return {words:true, limit:20, load:() => tenorRequest("trending_terms", {locale, limit:20}).then(body => body && body.results || [])};
            case "/gifs/suggest": return q ? {words:true, limit:query.limit || 10, load:() =>
                tenorRequest("search_suggestions", {q, locale, limit:Math.min(20, Number(query.limit) || 10)}).then(body => body && body.results || [])} : null;
            // The categories screen: Tenor's featured searches, and its top trending GIF on the Trending tile.
            case "/gifs/trending": return {whole:true, load:() => Promise.all([tenorRequest("categories", {type:"featured", locale}),
                tenorList("trending", {locale}, 1, query.media_format)]).then(([body, top]) => {
                const tags = body && Array.isArray(body.tags) ? body.tags : [];
                const categories = tags.filter(tag => tag && typeof tag.searchterm === "string" && typeof tag.image === "string")
                    .map(tag => ({name:tag.searchterm, src:tenorCategoryImage(tag.image)}));
                if (!categories.length || !top.length) throw new Error("Tenor: no categories");
                return {categories, gifs:[{src:top[0].src}]};
            })};
            default: return null;
        }
    }
    function tenorResponse(body, base) { return Object.assign({ok:true, status:200, headers:{}}, base && typeof base === "object" ? base : null, {body}); }
    // HTTP.get(options) from HTTPUtils (1295): the picker's requests are the ones whose url starts with /gifs/.
    function tenorGet(orig, self, args) {
        const options = args[0], url = options && options.url;
        if (typeof url !== "string" || url.charCodeAt(1) !== 103 || url.indexOf("/gifs/") !== 0 || !enabled("tenorGifs")) return orig.apply(self, args);
        const answer = tenorAnswer(url, options.query && typeof options.query === "object" ? options.query : {});
        if (!answer) return orig.apply(self, args);
        const theirs = () => orig.apply(self, args);
        // Only Tenor, and the categories screen in both: Discord is asked only if Tenor doesn't answer.
        if (answer.whole || settings.tenorGifsSource === "tenor") return answer.load().then(body => tenorResponse(answer.words ? tenorWords(body, null, answer.limit) : body), () => theirs());
        // Both: one list from the two answers. If one fails the other still shows; only both failing is an error.
        const failed = {};
        return Promise.all([answer.load().then(body => body, () => failed),
            Promise.resolve().then(theirs).then(res => res, error => ({failed:error}))]).then(([mine, res]) => {
            const discord = res && res.failed === undefined && res !== failed ? res : null;
            if (mine === failed && !discord) throw res.failed;
            const body = discord ? discord.body : null, own = mine === failed ? [] : mine;
            return tenorResponse(answer.words ? tenorWords(own, body, answer.limit) : tenorMix(own, body, answer.limit), discord);
        });
    }
    // Picking a GIF reports it to Discord (POST /gifs/select) for Klipy's rankings. A Tenor GIF isn't Klipy's, so that's skipped.
    function tenorPost(orig, self, args) {
        const options = args[0];
        if (!options || options.url !== "/gifs/select" || !enabled("tenorGifs")) return orig.apply(self, args);
        const body = options.body, id = body && body.id != null ? String(body.id) : "";
        return id && tenor.ids.has(id) ? Promise.resolve(tenorResponse({}, {status:204})) : orig.apply(self, args);
    }
    // Discord's search box names Klipy (GifProvider 9733). It says Tenor in Only Tenor, and just GIFs while both show.
    function tenorPlaceholder(orig, self, args) {
        return enabled("tenorGifs") ? tr(settings.tenorGifsSource === "tenor" ? "Search Tenor" : "Search GIFs") : orig.apply(self, args);
    }

    // Translate messages: every message on screen that isn't in your language is shown translated, with a note
    // saying from what. Google Translate's free, keyless endpoint (the one its browser extension uses) translates
    // and detects the language in one go, and takes many messages per request: messages are sent in batches, only
    // once each, and only when they're drawn. Mentions, emojis, links, code and timestamps are never sent as text:
    // they're replaced by numbered tags the translator keeps in place, and put back as they were.
    const TRANSLATE_HOSTS = ["https://translate.googleapis.com", "https://clients5.google.com"];
    const TRANSLATE_PATH = "/translate_a/t?client=dict-chrome-ex&sl=auto&tl=";
    // Per request: Google accepts more, but smaller requests fail less and look like the extension's.
    const TRANSLATE_BATCH = 40, TRANSLATE_BATCH_CHARS = 6000, TRANSLATE_MAX_TEXT = 4500, TRANSLATE_CACHE = 2000;
    // Up to three requests at once, each with its own timeout: one slow answer no longer holds up the rest.
    // Translations are saved on the phone, so a chat opened again after a restart needs no request at all.
    const TRANSLATE_PARALLEL = 3, TRANSLATE_TIMEOUT_MS = 8000, TRANSLATE_FILE = "venus-translations.json", TRANSLATE_SAVED = 1500, TRANSLATE_SAVED_BYTES = 2 * 1024 * 1024;
    // Formatting whose words are translated. Every other node (mentions, emojis, links, code, timestamps) is kept as it is.
    const TRANSLATE_GROUPS = new Set(["strong", "em", "u", "s", "spoiler", "blockQuote", "subtext", "heading", "paragraph", "link"]);
    // Letters of any script, but not digits, punctuation or emojis (surrogates): those need no translating.
    const TRANSLATE_LETTER = /[A-Za-z\u00C0-\u024F\u0370-\u1FFF\u2C00-\uD7FF\uF900-\uFDFF\uFE70-\uFEFF\uFF21-\uFF5A\uFF66-\uFFDC]/g;
    const LANGUAGE_NAMES = {af:"Afrikaans", ar:"Arabic", bg:"Bulgarian", bn:"Bengali", ca:"Catalan", cs:"Czech", cy:"Welsh", da:"Danish", de:"German",
        el:"Greek", en:"English", eo:"Esperanto", es:"Spanish", et:"Estonian", fa:"Persian", fi:"Finnish", fil:"Filipino", tl:"Filipino", fr:"French",
        ga:"Irish", gl:"Galician", gu:"Gujarati", he:"Hebrew", hi:"Hindi", hr:"Croatian", hu:"Hungarian", hy:"Armenian", id:"Indonesian", is:"Icelandic",
        it:"Italian", ja:"Japanese", jv:"Javanese", ka:"Georgian", kk:"Kazakh", km:"Khmer", ko:"Korean", la:"Latin", lt:"Lithuanian", lv:"Latvian",
        mk:"Macedonian", ml:"Malayalam", mn:"Mongolian", mr:"Marathi", ms:"Malay", my:"Burmese", ne:"Nepali", nl:"Dutch", no:"Norwegian", pa:"Punjabi",
        pl:"Polish", pt:"Portuguese", ro:"Romanian", ru:"Russian", sk:"Slovak", sl:"Slovenian", sq:"Albanian", sr:"Serbian", sv:"Swedish", sw:"Swahili",
        ta:"Tamil", te:"Telugu", th:"Thai", tr:"Turkish", uk:"Ukrainian", ur:"Urdu", uz:"Uzbek", vi:"Vietnamese", zh:"Chinese"};
    const translate = {dispatcher:null, cache:new Map(), queue:[], shown:new Map(), timer:undefined, active:0,
        host:0, pausedUntil:0, failures:0, translated:0, error:"", generation:0, version:0, layouts:new WeakMap(), refreshing:new Set(),
        restored:false, restoring:false, saveTimer:undefined, saving:false,
        // Your choice for single messages from the hold menu: true translates it, false keeps the original.
        // With "Only when you ask", only messages set to true are translated.
        choice:new Map(), asked:new Set(),
        // Chats translated as a whole from the translate bar (#82), in "Only when you ask". A message's own choice still wins.
        // Like Telegram: kept while Discord is open, so leaving and coming back still translates. Never saved, so after
        // Discord restarts every chat asks again.
        channels:new Set(),
        // Chats with a message you could translate: one Google already said isn't in your language. Only those show the bar.
        foreign:new Map()};
    const TRANSLATE_CHOICES = 1000, TRANSLATE_FOREIGN = 200, TRANSLATE_CHANNELS = 200;
    // What a message does when you haven't chosen for it: translated, unless you only translate when you ask and its chat isn't on.
    function translateDefault(channelId) { return settings.translateMode !== "manual" || translateChatOn(channelId); }
    // A chat you translated from the bar. Only while the bar is one of the ways you ask, so choosing "Message menu" never
    // leaves chats translated with no bar to turn them back.
    function translateChatOn(channelId) { return settings.translateAsk !== "menu" && translate.channels.has(channelId); }
    // Whether a message is likely not in the language you translate into, decided on the phone without sending it
    // anywhere (#82): it only decides whether the translate bar shows. The writing system tells most languages apart
    // (Cyrillic, Arabic, Hangul...). For Latin text against a Latin language, it takes letters that language doesn't
    // use, or at least two everyday words of another one, so a stray accent or a word like "die" never shows the bar.
    const TRANSLATE_SCRIPTS = [["cyrl", /[\u0400-\u04ff]/], ["arab", /[\u0600-\u06ff]/], ["hebr", /[\u0590-\u05ff]/], ["deva", /[\u0900-\u097f]/],
        ["thai", /[\u0e00-\u0e7f]/], ["hang", /[\uac00-\ud7af]/], ["kana", /[\u3040-\u30ff]/], ["hani", /[\u4e00-\u9fff]/], ["grek", /[\u0370-\u03ff]/]];
    const TRANSLATE_SCRIPT_OF = {ru:"cyrl", uk:"cyrl", bg:"cyrl", sr:"cyrl", mk:"cyrl", kk:"cyrl", mn:"cyrl", ar:"arab", fa:"arab", ur:"arab", he:"hebr",
        hi:"deva", mr:"deva", ne:"deva", th:"thai", ko:"hang", ja:"kana", zh:"hani", el:"grek"};
    // Letters each Latin language writes with, beyond a-z. Anything else in a message is another language's.
    const LATIN_LETTERS = {en:"", de:"\u00e4\u00f6\u00fc\u00df", fr:"\u00e0\u00e2\u00e6\u00e7\u00e9\u00e8\u00ea\u00eb\u00ee\u00ef\u00f4\u0153\u00f9\u00fb\u00fc\u00ff",
        es:"\u00e1\u00e9\u00ed\u00f1\u00f3\u00fa\u00fc", it:"\u00e0\u00e8\u00e9\u00ec\u00ed\u00f2\u00f3\u00f9\u00fa", pt:"\u00e0\u00e1\u00e2\u00e3\u00e7\u00e9\u00ea\u00ed\u00f3\u00f4\u00f5\u00fa",
        nl:"\u00e9\u00eb\u00ef\u00f6", sv:"\u00e5\u00e4\u00f6", no:"\u00e5\u00e6\u00f8", da:"\u00e5\u00e6\u00f8", fi:"\u00e4\u00f6\u00e5",
        pl:"\u0105\u0107\u0119\u0142\u0144\u00f3\u015b\u017a\u017c", cs:"\u00e1\u010d\u010f\u00e9\u011b\u00ed\u0148\u00f3\u0159\u0161\u0165\u00fa\u016f\u00fd\u017e",
        sk:"\u00e1\u00e4\u010d\u010f\u00e9\u00ed\u013a\u013e\u0148\u00f3\u00f4\u0155\u0161\u0165\u00fa\u00fd\u017e", hu:"\u00e1\u00e9\u00ed\u00f3\u00f6\u0151\u00fa\u00fc\u0171",
        ro:"\u0103\u00e2\u00ee\u0219\u021b\u015f\u0163", tr:"\u00e7\u011f\u0131\u00f6\u015f\u00fc", hr:"\u010d\u0107\u0111\u0161\u017e", sl:"\u010d\u0161\u017e",
        lt:"\u0105\u010d\u0119\u0117\u012f\u0161\u0173\u016b\u017e", lv:"\u0101\u010d\u0113\u0123\u012b\u0137\u013c\u0146\u0161\u016b\u017e", et:"\u00e4\u00f5\u00f6\u00fc\u0161\u017e",
        vi:"\u00e0\u00e1\u00e2\u00e3\u00e8\u00e9\u00ea\u00ec\u00ed\u00f2\u00f3\u00f4\u00f5\u00f9\u00fa\u00fd\u0103\u0111\u0129\u0169\u01a1\u01b0\u1ea1-\u1ef9",
        ca:"\u00e0\u00e7\u00e8\u00e9\u00ed\u00ef\u00f2\u00f3\u00fa\u00fc", is:"\u00e1\u00e6\u00e9\u00ed\u00f0\u00f3\u00f6\u00fa\u00fd\u00fe", ga:"\u00e1\u00e9\u00ed\u00f3\u00fa",
        sq:"\u00e7\u00eb", eo:"\u0109\u011d\u0125\u0135\u015d\u016d", gl:"\u00e1\u00e9\u00ed\u00f1\u00f3\u00fa"};
    // Everyday words that are only one language's (none of them an English word), to tell Latin languages apart.
    const LATIN_WORDS = {
        en:["the", "and", "you", "what", "with", "this", "that", "have", "just", "about", "from", "your", "they", "would", "there", "their", "don't", "can't", "it's", "that's"],
        es:["que", "qu\u00e9", "los", "las", "del", "una", "uno", "por", "para", "con", "sin", "pero", "como", "c\u00f3mo", "m\u00e1s", "muy", "todo", "toda", "todos", "todas", "nada", "algo", "aqu\u00ed", "ah\u00ed", "all\u00ed", "este", "esta", "esto", "estos", "estas", "ese", "esa", "eso", "est\u00e1", "est\u00e1s", "est\u00e1n", "estoy", "eres", "somos", "tengo", "tienes", "tiene", "puede", "puedo", "hacer", "hace", "decir", "dice", "dijo", "cuando", "donde", "d\u00f3nde", "quien", "qui\u00e9n", "porque", "porqu\u00e9", "tambi\u00e9n", "siempre", "nunca", "ahora", "antes", "despu\u00e9s", "bueno", "buena", "buenos", "buenas", "bien", "mal", "hola", "ola", "gracias", "usted", "nosotros", "ellos", "ellas", "mis", "tus", "sus", "nuestro", "claro", "claramente", "verdad", "hermano", "amigo", "brochachon", "tradujiste", "traducir", "noche"],
        de:["und", "nicht", "ich", "ist", "auch", "aber", "wir", "das", "noch", "schon", "danke", "ein", "eine", "einen", "einem", "mit", "auf", "f\u00fcr", "von", "sich", "sie", "dem", "den", "des", "dass", "wenn", "oder", "nur", "wie", "kann", "sind", "haben", "wird", "wurde", "werden", "jetzt", "immer", "alles", "etwas", "nichts", "warum", "hall\u00f6chen", "guten", "bitte", "gerne", "heute", "morgen", "wirklich"],
        fr:["les", "des", "est", "pas", "avec", "pour", "dans", "plus", "mais", "sur", "sont", "cette", "tout", "tous", "toute", "faire", "fait", "comme", "\u00eatre", "avoir", "nous", "vous", "ils", "elles", "leur", "leurs", "m\u00eame", "aussi", "tr\u00e8s", "bien", "peut", "suis", "sais", "veux", "quand", "comment", "pourquoi", "bonjour", "salut", "merci", "oui", "alors", "donc", "rien", "quelque", "toujours", "jamais", "aujourd'hui", "c'est", "qu'il", "j'ai", "n'est"],
        it:["che", "non", "sono", "per", "una", "con", "del", "della", "dei", "degli", "delle", "nel", "nella", "sul", "sulla", "questo", "questa", "questi", "queste", "quello", "quella", "anche", "come", "pi\u00f9", "molto", "tutto", "tutti", "fare", "fatto", "essere", "avere", "abbiamo", "hanno", "pu\u00f2", "sono", "stato", "quando", "dove", "perch\u00e9", "ciao", "grazie", "prego", "buongiorno", "sempre", "mai", "adesso", "ancora", "allora", "per\u00f2"],
        pt:["n\u00e3o", "nao", "voc\u00ea", "voce", "voc\u00eas", "com", "para", "por", "uma", "dos", "das", "nos", "nas", "pelo", "pela", "isso", "isto", "aquilo", "esse", "essa", "este", "esta", "mais", "muito", "tudo", "todos", "todas", "como", "quando", "onde", "porque", "porqu\u00ea", "est\u00e1", "estou", "est\u00e3o", "tenho", "tem", "pode", "fazer", "feito", "dizer", "disse", "tamb\u00e9m", "sempre", "nunca", "agora", "ent\u00e3o", "mas", "bom", "boa", "ol\u00e1", "ola", "oi", "obrigado", "obrigada", "valeu", "gente", "cara"],
        nl:["een", "het", "van", "dat", "niet", "voor", "met", "zijn", "ook", "maar", "naar", "bij", "nog", "wel", "geen", "meer", "deze", "hebben", "heeft", "heb", "kan", "worden", "wordt", "wat", "hoe", "waarom", "wanneer", "alles", "iets", "niets", "altijd", "nooit", "goed", "heel", "echt", "bedankt", "dank", "alsjeblieft"],
        sv:["och", "att", "det", "som", "f\u00f6r", "p\u00e5", "med", "inte", "har", "den", "till", "fr\u00e5n", "n\u00e4r", "kan", "ska", "vill", "alla", "mycket", "bara", "eller", "men", "h\u00e4r", "d\u00e4r", "varf\u00f6r", "n\u00e5got", "inget", "alltid", "aldrig", "jag", "dig", "mig", "\u00e4r", "hej", "tack"],
        pl:["jest", "nie", "tak", "czy", "si\u0119", "dzi\u0119ki", "ale", "jak", "dla", "tego", "tylko", "jeszcze", "bardzo", "wszystko", "kiedy", "gdzie", "dlaczego", "mo\u017ce", "mam", "masz", "mamy", "by\u0107", "by\u0142", "by\u0142a", "b\u0119dzie", "cze\u015b\u0107", "dobrze", "prosz\u0119"],
        tr:["bir", "ve", "bu", "ne", "\u00e7ok", "te\u015fekk\u00fcrler", "i\u00e7in", "ile", "ama", "daha", "gibi", "var", "yok", "ben", "sen", "biz", "siz", "onlar", "olan", "olarak", "kadar", "sonra", "\u00f6nce", "\u015fimdi", "neden", "nas\u0131l", "nerede", "merhaba", "selam", "evet", "hay\u0131r", "iyi", "g\u00fczel"],
        id:["yang", "dan", "tidak", "ini", "itu", "aku", "kamu", "terima", "untuk", "dengan", "dari", "pada", "dalam", "bisa", "akan", "sudah", "belum", "lagi", "juga", "saja", "kalau", "karena", "tapi", "atau", "apa", "siapa", "dimana", "kapan", "kenapa", "bagaimana", "banyak", "semua", "sangat", "sekali", "kasih", "halo", "baik", "enggak", "gak", "udah", "banget"],
        ro:["este", "sunt", "pentru", "care", "dar", "mai", "foarte", "doar", "c\u00e2nd", "unde", "cum", "dac\u0103", "fost", "avea", "face", "spune", "bine", "mul\u021bumesc", "salut", "nimic", "totul"],
        cs:["jsem", "jsi", "jsou", "nen\u00ed", "ale", "jako", "pro", "kdy\u017e", "kde", "jak", "pro\u010d", "velmi", "v\u0161echno", "nic", "n\u011bco", "dobr\u00fd", "d\u00edky", "ahoj", "pros\u00edm"],
        hu:["hogy", "nem", "van", "egy", "meg", "csak", "m\u00e9g", "m\u00e1r", "mint", "vagy", "lesz", "volt", "nagyon", "minden", "semmi", "valami", "mikor", "hol", "mi\u00e9rt", "hogyan", "k\u00f6sz\u00f6n\u00f6m", "szia", "igen"],
        fi:["ett\u00e4", "ei", "ole", "oli", "mutta", "kun", "jos", "niin", "vain", "my\u00f6s", "kuin", "mit\u00e4", "miss\u00e4", "milloin", "miksi", "miten", "kaikki", "jotain", "hyv\u00e4", "kiitos", "hei", "moi"],
        vi:["c\u1ee7a", "v\u00e0", "l\u00e0", "c\u00f3", "kh\u00f4ng", "\u0111\u01b0\u1ee3c", "trong", "cho", "v\u1edbi", "n\u00e0y", "\u0111\u00f3", "nh\u1eefng", "m\u1ed9t", "c\u00e1c", "ng\u01b0\u1eddi", "nh\u01b0", "khi", "th\u00ec", "m\u00e0", "r\u1ea5t", "nhi\u1ec1u", "c\u1ea3m", "\u01a1n", "xin", "ch\u00e0o"]};
    // Per target language, worked out once: the letters it doesn't use, and every other language's everyday words that
    // aren't its own. translateLooksForeign runs for rows and on every message change in a chat, so it no longer builds a
    // RegExp and walks ~550 listed words for each message.
    const translateForeignPlans = new Map();
    function translateForeignPlan(base) {
        if (translateForeignPlans.has(base)) return translateForeignPlans.get(base);
        const own = LATIN_LETTERS[base];
        let plan = null;
        if (own !== undefined) {
            const ownWords = new Set(LATIN_WORDS[base] || []), foreign = new Set();
            for (const code in LATIN_WORDS) if (code !== base) for (const word of LATIN_WORDS[code]) if (!ownWords.has(word)) foreign.add(word);
            plan = {allowed:new RegExp("[^a-z'" + own + "]"), foreign};
        }
        translateForeignPlans.set(base, plan);
        return plan;
    }
    function translateLooksForeign(text) {
        if (typeof text !== "string" || text.length < 2) return false;
        const target = translateTarget(), base = languageBase(target), want = TRANSLATE_SCRIPT_OF[base] || null;
        if (/[\u00a1\u00bf]/.test(text) && base !== "es" && base !== "gl" && base !== "ca") return true;
        let found = null;
        for (let i = 0; i < TRANSLATE_SCRIPTS.length && !found; i++) if (TRANSLATE_SCRIPTS[i][1].test(text)) found = TRANSLATE_SCRIPTS[i][0];
        // Japanese is written with kanji too, so kanji alone never shows the bar to a Japanese reader.
        if (found === "hani" && base === "ja") return false;
        if (found) return found !== want;
        const words = text.toLowerCase().replace(/https?:\/\/\S+|<[^>]*>|:[\w~]+:/g, " ").match(/[a-z\u00c0-\u024f\u1e00-\u1eff']+/g);
        if (!words || !words.some(word => word.length > 2)) return false;
        // Latin text for someone reading a non-Latin language.
        if (want) return true;
        const plan = translateForeignPlan(base);
        if (!plan) return false;
        let marked = 0;
        for (const word of words) if (plan.allowed.test(word) && ++marked >= 1 && (marked >= 2 || words.length <= 6)) return true;
        // Everyday words of other languages, looked up per word of the message, not per word of every list.
        let other = marked, english = 0;
        const wordSet = new Set(words);
        wordSet.forEach(word => { if (plan.foreign.has(word)) other++; });
        if (other >= 2 || other >= 1 && words.length <= 6) return true;
        if (base === "en") {
            for (const word of LATIN_WORDS.en) if (wordSet.has(word)) english++;
            // Longer Latin sentence with zero common English words and typical Romance/Germanic morphology.
            if (!english && words.length >= 3 && words.some(w => /(?:mente|ci\u00f3n|si\u00f3n|ando|iendo|aste|iste|aron|ieron|ch\u00f6n|ung|keit|heit|lich|isch|aux|eux|oir|aient|zione|ggi|nho|lho|zinho|\u00e3o|\u00f5es)$/.test(w))) return true;
        }
        return false;
    }
    // A row in "Only when you ask" that the bar could translate: remembered per chat, and the bar shows from then on.
    function translateNoticeForeign(channelId, text) {
        if (!channelId || translate.foreign.get(channelId) === true || settings.translateAsk === "menu" || !translateLooksForeign(text)) return;
        if (translate.foreign.size >= TRANSLATE_FOREIGN) translate.foreign.delete(translate.foreign.keys().next().value);
        translate.foreign.set(channelId, true);
        // Rows are generated while Discord renders the list; the bar updates right after, never during it.
        later(() => notify("translate"), 0);
    }
    function translateWanted(id, channelId) {
        const choice = translate.choice.get(id);
        return choice === undefined ? translateDefault(channelId) : choice;
    }
    // The translate bar: translate a whole chat, or show it as written again. Every row on screen from it is redrawn.
    // Discord replaces a chat's message collection whenever anything in it changes, so a scan of the same collection, for the
    // same language and account, gives the same answer. The bar asks on every render and on every message store change (from
    // any chat), so only a collection it hasn't seen is walked. force: a full walk anyway.
    const translateScans = new Map();
    function translateScanChannel(channelId, force) {
        if (!channelId || !msgStore || typeof msgStore.getMessages !== "function") return false;
        let msgs;
        try { msgs = msgStore.getMessages(channelId); } catch (_) { return false; }
        const me = currentUser(), myId = me && me.id, target = translateTarget(), last = translateScans.get(channelId);
        if (!force && last && last.msgs === msgs && last.target === target && last.myId === myId) return last.result;
        const list = msgs && (Array.isArray(msgs._array) ? msgs._array : typeof msgs.toArray === "function" ? msgs.toArray() : null);
        if (!Array.isArray(list) || !list.length) return false;
        let foundForeign = false;
        for (let i = list.length - 1; i >= 0; i--) {
            const msg = list[i];
            if (!msg || !msg.id) continue;
            const contentSource = translateContentSource(msg);
            const text = contentSource && contentSource.content;
            if (typeof text !== "string" || !text) continue;
            translateSeen(msg, channelId, msg.id, null);
            const authorId = msg.author && msg.author.id || msg.authorId;
            if (!foundForeign && (!myId || authorId !== myId) && translateLooksForeign(text)) foundForeign = true;
        }
        if (foundForeign && translate.foreign.get(channelId) !== true) {
            if (translate.foreign.size >= TRANSLATE_FOREIGN) translate.foreign.delete(translate.foreign.keys().next().value);
            translate.foreign.set(channelId, true);
        }
        if (!last && translateScans.size >= TRANSLATE_FOREIGN) translateScans.delete(translateScans.keys().next().value);
        translateScans.set(channelId, {msgs, target, myId, result:foundForeign});
        return foundForeign;
    }
    function translateChannel(channelId, on) {
        if (!channelId || translate.channels.has(channelId) === !!on) return;
        if (on) {
            if (translate.channels.size >= TRANSLATE_CHANNELS) translate.channels.delete(translate.channels.values().next().value);
            translate.channels.add(channelId);
        } else translate.channels.delete(channelId);
        translateScanChannel(channelId, true);
        notify("translate");
        const ids = new Set();
        translate.shown.forEach((entry, id) => { if (entry.channelId === channelId) ids.add(id); });
        translateRedraw(ids);
    }
    function translateInit(dispatcher) {
        if (translate.dispatcher || !dispatcher || typeof dispatcher.dispatch !== "function") return;
        translate.dispatcher = dispatcher;
        if (typeof dispatcher.subscribe === "function") dispatcher.subscribe("LOGOUT", () => {
            translate.generation++; translate.cache.clear(); translate.queue.length = 0; translate.shown.clear(); translate.choice.clear(); translate.asked.clear(); translate.channels.clear(); translate.foreign.clear(); translateScans.clear();
            // Another account's messages must never be shown from this one's translations.
            if (files) Promise.resolve().then(() => files.writeFile("documents", TRANSLATE_FILE, "{\"version\":1,\"entries\":[]}", "utf8")).catch(() => {});
        });
    }
    // Saved translations: only finished ones, newest last, read once when Discord opens. A damaged file is ignored.
    function translateRestore() {
        if (translate.restored || translate.restoring || !files || !features.translate) return;
        let constants;
        try { constants = typeof files.getConstants === "function" ? files.getConstants() : files; } catch (_) { constants = null; }
        const directory = constants && constants.DocumentsDirPath;
        if (typeof directory !== "string") { translate.restored = true; return; }
        const path = directory.replace(/\/$/, "") + "/" + TRANSLATE_FILE, generation = translate.generation;
        translate.restoring = true;
        Promise.resolve().then(() => files.fileExists(path)).then(exists => exists ? files.readFile(path, "utf8") : null).then(text => {
            if (!text || text.length > TRANSLATE_SAVED_BYTES || generation !== translate.generation) return;
            const saved = JSON.parse(text);
            if (!saved || saved.version !== 1 || !Array.isArray(saved.entries)) return;
            let restored = 0;
            // Messages you translated, or kept original, from the hold menu. A choice made since Discord opened wins.
            if (Array.isArray(saved.choices)) saved.choices.slice(-TRANSLATE_CHOICES).forEach(item => {
                if (Array.isArray(item) && item.length === 2 && typeof item[0] === "string" && /^\d{1,20}$/.test(item[0]) && typeof item[1] === "boolean" &&
                    !translate.choice.has(item[0])) { translate.choice.set(item[0], item[1]); restored++; }
            });
            saved.entries.slice(-TRANSLATE_SAVED).forEach(item => {
                if (!Array.isArray(item) || item.length !== 4 || !item.every(part => typeof part === "string")) return;
                const [target, text, translated, language] = item, key = translateKey(target, text), known = translate.cache.get(key);
                if (known && known.state !== "queued") return;
                if (known) { known.state = "done"; known.translated = translated; known.language = language; known.layout = null; known.ids.clear(); known.restored = true; restored++; return; }
                translateRemember(key, {state:"done", text, target, translated, language, layout:null, ids:new Set(), restored:true});
                restored++;
            });
            if (restored) translateChanged();
        }).catch(() => {}).then(() => { translate.restoring = false; translate.restored = true; if (enabled("translate")) translateSchedule(0); });
    }
    function translatePersist() {
        if (!files || translate.saveTimer !== undefined) return;
        translate.saveTimer = later(() => {
            translate.saveTimer = undefined;
            if (translate.saving) { translatePersist(); return; }
            const entries = [];
            translate.cache.forEach(entry => { if (entry.state === "done" && typeof entry.translated === "string") entries.push([entry.target, entry.text, entry.translated, entry.language || ""]); });
            const choices = Array.from(translate.choice.entries());
            const extra = entries => Object.assign({version:1, entries}, choices.length ? {choices} : null);
            let text = JSON.stringify(extra(entries.slice(-TRANSLATE_SAVED)));
            // Too big to read back: keep the newest half instead.
            if (text.length > TRANSLATE_SAVED_BYTES) text = JSON.stringify(extra(entries.slice(-Math.floor(TRANSLATE_SAVED / 2))));
            translate.saving = true;
            Promise.resolve().then(() => files.writeFile("documents", TRANSLATE_FILE, text, "utf8")).catch(() => {}).then(() => { translate.saving = false; });
        }, 3000, false);
    }
    // Discord's language (Settings -> Language) or the phone's, as a Google language code.
    function localeCode(kind) {
        let value = null;
        try { value = localeStore && (kind === "phone" ? localeStore.systemLocale : localeStore.locale); } catch (_) {}
        if (typeof value !== "string" || !/^[A-Za-z]{2,3}([-_][A-Za-z0-9]{2,8})*$/.test(value)) value = kind === "phone" ? localeCode("discord") : "en-US";
        return value.replace("_", "-");
    }
    function translateTarget() {
        // Another language (#79): already a Google code, whatever Discord's or the phone's language is.
        if (settings.translateTarget === "custom" && TRANSLATE_LANGUAGES.includes(settings.translateLanguage)) return settings.translateLanguage;
        const mode = settings.translateTarget === "phone" ? "phone" : "discord";
        let raw = null;
        try { raw = localeStore && (mode === "phone" ? localeStore.systemLocale || localeStore.locale : localeStore.locale); } catch (_) {}
        if (mode === translate.targetMode && raw === translate.targetRaw && translate.targetCode) return translate.targetCode;
        const locale = localeCode(mode);
        const parts = locale.split("-"), base = parts[0].toLowerCase();
        const out = base === "zh" ? (/^(TW|HK|MO|Hant)$/i.test(parts[1] || "") ? "zh-TW" : "zh-CN") : (base === "nb" || base === "nn") ? "no" : base;
        translate.targetMode = mode;
        translate.targetRaw = raw;
        translate.targetCode = out;
        return out;
    }
    // "iw" and "zh-CN" from Google, "he" and "zh-TW" from Discord: the same language either way.
    function languageBase(code) {
        const base = String(code || "").split("-")[0].toLowerCase();
        return ({iw:"he", jw:"jv", nb:"no", nn:"no", tl:"fil"})[base] || base;
    }
    // Language names in the language Venus is shown in.
    const languageNames = new Map();
    // The language Translate messages writes in, by name: Discord's, the phone's or the one you picked (#79).
    function translateTargetName() {
        return settings.translateTarget === "custom" ? translateLanguageName(translateTarget()) : languageName(localeCode(settings.translateTarget === "phone" ? "phone" : "discord"));
    }
    // Both Chinese scripts can be picked, so they need names that tell them apart.
    function translateLanguageName(code) {
        return code === "zh-CN" ? tr("Chinese (Simplified)") : code === "zh-TW" ? tr("Chinese (Traditional)") : languageName(code);
    }
    function languageName(code) {
        // The language actually shown: English until the chosen one has loaded, so a line never mixes two.
        const chosen = uiLanguage(), pack = i18n.packs.get(chosen);
        const base = languageBase(code), ui = chosen === "en" || pack && pack !== EMPTY_PACK ? chosen : "en";
        if (!languageNames.has(ui)) {
            let names = null;
            try { if (global.Intl && typeof global.Intl.DisplayNames === "function") names = new global.Intl.DisplayNames([ui, "en"], {type:"language"}); } catch (_) {}
            languageNames.set(ui, names);
        }
        const names = languageNames.get(ui);
        try { const name = names && names.of(code); if (typeof name === "string" && name && name !== code) return name; } catch (_) {}
        return tr(LANGUAGE_NAMES[base] || "another language");
    }
    const ESCAPE_TRANSLATE_RE = /[&<>]/;
    function escapeTranslate(text) { return ESCAPE_TRANSLATE_RE.test(text) ? text.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;") : text; }
    // The row's content as text to translate: plain text stays text, formatting becomes <g i=N>...</g> around
    // the words it covers, and everything that must not change (mentions, emojis, code...) becomes <a i=N/>.
    // Worked out once per content array: rows are generated again for every change in the chat.
    function translateLayout(content) {
        let layout = translate.layouts.get(content);
        if (layout !== undefined) return layout;
        const nodes = [];
        let letters = 0, lines = false, failed = false;
        function walk(list, depth) {
            let out = "";
            if (depth > 8) { failed = true; return out; }
            for (let i = 0; i < list.length; i++) {
                const node = list[i];
                if (!node || typeof node !== "object") continue;
                const type = node.type;
                if (type === "text" && typeof node.content === "string") {
                    // A zero-width space is how a message is redrawn: never let it make a new translation.
                    const raw = node.content;
                    const text = raw.indexOf("\u200b") >= 0 ? raw.replace(/\u200b/g, "") : raw;
                    if (letters < 3) {
                        TRANSLATE_LETTER.lastIndex = 0;
                        while (letters < 3 && TRANSLATE_LETTER.exec(text)) letters++;
                    }
                    out += escapeTranslate(text);
                } else if (type === "br" || type === "newline") { lines = true; out += "\n"; }
                else if (TRANSLATE_GROUPS.has(type) && Array.isArray(node.content)) {
                    const index = nodes.push(node) - 1;
                    out += "<g i=" + index + ">" + walk(node.content, depth + 1) + "</g>";
                } else { const index = nodes.push(node) - 1; out += "<a i=" + index + "/>"; }
            }
            return out;
        }
        const text = Array.isArray(content) ? walk(content, 0) : "";
        // Nothing to translate: emojis, links, code or a word or two of letters ("ok", "xd").
        layout = failed || letters < 3 || text.length > TRANSLATE_MAX_TEXT ? null : {text, nodes, lines};
        translate.layouts.set(content, layout);
        return layout;
    }
    const UNESCAPE_TRANSLATE_RE = /&#39;|&#x27;|&quot;/;
    function unescapeTranslate(text) { return UNESCAPE_TRANSLATE_RE.test(text) ? text.replace(/&#39;|&#x27;/g, "'").replace(/&quot;/g, "\"") : text; }
    // The translation back as Discord's own nodes. Every tag must come back exactly once and nested the same way,
    // or the original is shown: a mention can never be lost, doubled or turned into text.
    const TRANSLATE_TAG = /<a\s+i\s*=\s*"?(\d+)"?\s*\/>|<g\s+i\s*=\s*"?(\d+)"?\s*>|<\/g\s*>/g;
    function translateNodes(translated, layout) {
        const used = new Set(), root = [], stack = [{children:root, index:-1}];
        const text = value => {
            if (!value) return;
            const children = stack[stack.length - 1].children;
            if (!layout.lines) { children.push({type:"text", content:value}); return; }
            value.split("\n").forEach((part, i) => { if (i) children.push({type:"br"}); if (part) children.push({type:"text", content:part}); });
        };
        TRANSLATE_TAG.lastIndex = 0;
        let last = 0, match;
        while ((match = TRANSLATE_TAG.exec(translated))) {
            text(unescapeTranslate(translated.slice(last, match.index)));
            last = TRANSLATE_TAG.lastIndex;
            if (match[1] !== undefined || match[2] !== undefined) {
                const index = Number(match[1] !== undefined ? match[1] : match[2]), node = layout.nodes[index];
                const group = match[2] !== undefined;
                // A tag must come back as what it was sent as: <g> for formatting around words, <a/> for the rest.
                if (!node || used.has(index) || group !== (TRANSLATE_GROUPS.has(node.type) && Array.isArray(node.content))) return null;
                used.add(index);
                if (group) stack.push({children:[], index});
                else stack[stack.length - 1].children.push(node);
            } else {
                if (stack.length < 2) return null;
                const done = stack.pop();
                stack[stack.length - 1].children.push(Object.assign({}, layout.nodes[done.index], {content:done.children}));
            }
        }
        text(unescapeTranslate(translated.slice(last)));
        if (stack.length !== 1 || used.size !== layout.nodes.length) return null;
        return root;
    }
    function translateKey(target, text) { return target + "\u0000" + text; }
    function translateRemember(key, entry) {
        if (translate.cache.has(key)) translate.cache.delete(key);
        else if (translate.cache.size >= TRANSLATE_CACHE) translate.cache.delete(translate.cache.keys().next().value);
        translate.cache.set(key, entry);
    }
    function translateContentSource(message) {
        if (!message || typeof message !== "object") return null;
        if (typeof message.getContentMessage === "function") try { const inner = message.getContentMessage(); if (inner && typeof inner === "object") return inner; } catch (_) {}
        const snapshots = message.messageSnapshots || message.message_snapshots;
        if (Array.isArray(snapshots) && snapshots[0] && snapshots[0].message && typeof snapshots[0].message === "object") return snapshots[0].message;
        return message;
    }
    // MessageRowGenerator hook: a translated message's content, note and (if asked) original, or the message as it is.
    // Translations are kept by text, but drawn per message: "hi @A" and "hi @B" share one translation, not one mention.
    function translateRow(message, source, channelId, id) {
        const contentSource = translateContentSource(source);
        if (!message || !Array.isArray(message.content) || !contentSource || typeof contentSource.content !== "string" || !channelId || !id) return message;
        // Not wanted (most rows in "Only when you ask") needs no user lookup (1.44x).
        const choice = translate.choice.get(id);
        if (choice === false || choice === undefined && settings.translateMode === "manual" && !translateChatOn(channelId)) {
            translateSeen(source, channelId, id, null);
            // Your own messages never count: you wrote them in a language you read.
            if (choice === undefined && translate.foreign.get(channelId) !== true) {
                const author = source && source.author && source.author.id || message.authorId, me = currentUser();
                if (!me || author !== me.id) translateNoticeForeign(channelId, contentSource.content);
            }
            return message;
        }
        // Your own messages are already in a language you read, unless you ask for one from the hold menu.
        if (choice !== true) {
            const author = source && source.author && source.author.id || message.authorId, me = currentUser();
            if (me && author === me.id) { translateSeen(source, channelId, id, null); return message; }
        }
        const layout = translateLayout(message.content);
        if (!layout) { translateSeen(source, channelId, id, null); translateNothing(id); return message; }
        const target = translateTarget(), key = translateKey(target, layout.text);
        translateSeen(source, channelId, id, key);
        let entry = translate.cache.get(key);
        if (!entry) {
            entry = {state:"queued", text:layout.text, layout, target, ids:new Set()};
            translateRemember(key, entry);
            // Newest first: the message that just arrived, or the bottom of a chat you opened, is what you're reading.
            translate.queue.unshift(key);
            translateSchedule(60);
        }
        if (entry.state === "queued" || entry.state === "sending") { entry.ids.add(id); return message; }
        // Only "same" means it's already in your language; a translation that broke a mention or emoji just isn't shown.
        if (entry.state !== "done") { if (entry.state === "same") translateNothing(id); else translate.asked.delete(id); return message; }
        translate.asked.delete(id);
        if (layout.view === undefined || layout.viewOf !== entry || layout.viewVersion !== translate.version) {
            layout.viewOf = entry; layout.viewVersion = translate.version;
            layout.view = translateView(entry, layout, message.content);
        }
        return layout.view ? Object.assign({}, message, {content:layout.view}) : message;
    }
    // A message you asked to translate from the hold menu that has nothing to translate says so, once.
    function translateNothing(id) {
        if (!translate.asked.delete(id)) return;
        later(() => reviewToast(reviewUI(), "This message is already in your language", venusIcon(15723,"LanguageIcon")), 0);
    }
    // The message a reply quotes, above the reply. It was always shown as written, even when that message was
    // shown translated in chat (#51). It now gets the same translation, without the note or the original, since
    // the preview is one short line. Translations are kept by text, so this never costs a second request.
    function translateReply(message, source, channelId, id) {
        const quoted = message.referencedMessage && message.referencedMessage.message;
        if (!quoted || !Array.isArray(quoted.content) || !channelId || !id) return message;
        const reference = source && (source.messageReference || source.message_reference);
        const quotedId = quoted.id || reference && (reference.message_id || reference.messageId);
        // Known as the reply's row, so the reply is redrawn once its quote is translated or toggled.
        if (source) translateSeen(source, channelId, id, null, null, quotedId);
        // The same order as translateRow: the choice first, the current user only when it can matter.
        if (!quotedId) return message;
        const choice = translate.choice.get(quotedId);
        if (choice === false || choice === undefined && settings.translateMode === "manual" && !translateChatOn(channelId)) return message;
        if (choice !== true) { const me = currentUser(); if (me && quoted.authorId === me.id) return message; }
        const layout = translateLayout(quoted.content);
        if (!layout) return message;
        const target = translateTarget(), key = translateKey(target, layout.text);
        if (source) translateSeen(source, channelId, id, null, key, quotedId);
        let entry = translate.cache.get(key);
        if (!entry) {
            entry = {state:"queued", text:layout.text, layout, target, ids:new Set()};
            translateRemember(key, entry);
            translate.queue.unshift(key);
            translateSchedule(60);
        }
        if (entry.state === "queued" || entry.state === "sending") { entry.ids.add(id); return message; }
        if (entry.state !== "done") return message;
        if (layout.preview === undefined || layout.previewOf !== entry) { layout.previewOf = entry; layout.preview = translateNodes(entry.translated, layout); }
        if (!layout.preview) return message;
        return Object.assign({}, message, {referencedMessage:Object.assign({}, message.referencedMessage,
            {message:Object.assign({}, quoted, {content:layout.preview})})});
    }
    // Hold a message: "Translate" or "Show original", for just that message.
    function translateToggle(message) {
        const id = message && message.id;
        if (!id || !enabled("translate")) return;
        const wanted = !translateShownFor(message), channelId = message.channel_id || message.channelId;
        translate.choice.delete(id);
        // Back to what the mode (or the chat's translate bar) does anyway, and not your own message: nothing to remember.
        const mine = currentUser() && message.author && message.author.id === currentUser().id;
        if (wanted !== translateDefault(channelId) || mine) {
            if (translate.choice.size >= TRANSLATE_CHOICES) translate.choice.delete(translate.choice.keys().next().value);
            translate.choice.set(id, wanted);
        }
        if (wanted) translate.asked.add(id); else translate.asked.delete(id);
        translatePersist();
        if (channelId) translateSeen(message, channelId, id, null);
        // Every row showing this message or quoting it.
        const ids = new Set([id]);
        translate.shown.forEach((entry, shownId) => { if (entry.quotes === id) ids.add(shownId); });
        translateRedraw(ids);
    }
    // Whether this message is (or will be) shown translated: your own only when you asked.
    function translateShownFor(message) {
        const mine = currentUser() && message.author && message.author.id === currentUser().id;
        return mine ? translate.choice.get(message.id) === true : translateWanted(message.id, message.channel_id || message.channelId);
    }
    // LongPressMessageActionSheet (9675): one more row, after Discord's own, styled like them.
    function translateSheet(orig, self, args) {
        const tree = orig.apply(self, args), props = args[0], message = props && props.message;
        const contentSource = translateContentSource(message);
        if (!enabled("translate") || !React || !tree || !message || !message.id || !contentSource || typeof contentSource.content !== "string" || !contentSource.content.trim()) return tree;
        const shownNow = translateShownFor(message);
        // "Top bar" only: the menu is for showing one message's original in a chat you translated, not for asking.
        if (settings.translateMode === "manual" && settings.translateAsk === "bar" && !shownNow && !translateChatOn(message.channel_id || message.channelId)) return tree;
        const label = shownNow ? tr("Show original") : tr("Translate");
        let added = false;
        const Icon = venusIcon(15723, "LanguageIcon");
        return cloneTree(tree, function (node, nodeProps) {
            if (added || !Array.isArray(nodeProps.children)) return nodeProps;
            const rows = nodeProps.children.filter(child => child && child.props && typeof child.props.label === "string" && typeof child.props.onPress === "function");
            if (!rows.length || nodeProps.children.some(child => child && child.key === "venus-translate")) return nodeProps;
            added = true;
            const template = rows[rows.length - 1], icon = template.props.icon;
            const row = React.cloneElement(template, {key:"venus-translate", label, arrow:false, variant:undefined, disabled:false,
                icon:icon && icon.props && "IconComponent" in icon.props ? React.cloneElement(icon, {IconComponent:Icon}) : icon,
                onPress:function () {
                    const sheets = reviewUI().sheets;
                    try { if (sheets && typeof sheets.hideActionSheet === "function") sheets.hideActionSheet("MessageLongPressActionSheet"); } catch (_) {}
                    if (typeof props.onClose === "function") try { props.onClose(); } catch (_) {}
                    translateToggle(message);
                }});
            const index = nodeProps.children.indexOf(template) + 1;
            return Object.assign({}, nodeProps, {children:nodeProps.children.slice(0, index).concat([row], nodeProps.children.slice(index))});
        }, 0, () => added);
    }
    // Messages drawn lately, so switching on or changing an option can redraw them. Never while a redraw has
    // its zero-width space in, or that space would be put back for good.
    function translateSeen(source, channelId, id, key, quoteKey, quotedId) {
        if (!source || !channelId || !id || translate.refreshing.size && translate.refreshing.has(id)) return;
        const existing = translate.shown.get(id);
        const reference = source.messageReference || source.message_reference;
        const nextQuotes = quotedId || (reference ? reference.message_id || reference.messageId : existing && existing.quotes) || null;
        if (existing && existing.source === source && existing.channelId === channelId &&
            (!key || existing.key === key) && (!quoteKey || existing.quoteKey === quoteKey) && existing.quotes === nextQuotes) return;
        let raw = source.content;
        const hasRaw = typeof raw === "string" && raw.length > 0;
        let snapshot = null;
        if (!hasRaw) {
            raw = "";
            const contentSource = translateContentSource(source);
            if (contentSource && contentSource !== source && typeof contentSource.content === "string" && contentSource.content) {
                const list = source.messageSnapshots || source.message_snapshots;
                const first = Array.isArray(list) && list[0];
                if (first && first.message) snapshot = {message:Object.assign({}, typeof first.message.toJS === "function" ? first.message.toJS() : first.message),
                    moderator_report:first.moderatorReport !== undefined ? first.moderatorReport : first.moderator_report || null,
                    rest:Array.isArray(list) && list.length > 1 ? list.slice(1).map(item => ({message:item && item.message && typeof item.message.toJS === "function" ? item.message.toJS() : item && item.message,
                        moderator_report:item && (item.moderatorReport !== undefined ? item.moderatorReport : item.moderator_report || null)})) : []};
            }
            if (!snapshot) return;
        }
        let entry = existing;
        if (entry) translate.shown.delete(id);
        else if (translate.shown.size >= 300) translate.shown.delete(translate.shown.keys().next().value);
        if (!entry) entry = {channelId, id, source, raw, snapshot, key:key || null, quoteKey:quoteKey || null, quotes:nextQuotes};
        else {
            entry.source = source; entry.raw = raw; entry.snapshot = snapshot;
            if (key) entry.key = key;
            if (quoteKey) entry.quoteKey = quoteKey;
            entry.quotes = nextQuotes;
        }
        translate.shown.set(id, entry);
    }
    function translateView(entry, layout, original) {
        let view = translateNodes(entry.translated, layout);
        if (!view) return null;
        if (settings.translateNote || settings.translateOriginal) view = view.concat([{type:"br"}, {type:"subtext", content:[{type:"text",
            content:tr(settings.translateOriginal ? "Translated from {language}. Original:" : "Translated from {language}", {language:languageName(entry.language)})}]}]);
        // A quote can't hold a quote or a code block, so those originals just follow on the next line.
        if (settings.translateOriginal) view = view.concat(layout.nodes.some(node => node.type === "blockQuote" || node.type === "codeBlock") ?
            [{type:"br"}].concat(original) : [{type:"blockQuote", content:original}]);
        return view;
    }
    function translateSchedule(ms) {
        if (translate.timer !== undefined || translate.active >= TRANSLATE_PARALLEL || !translate.queue.length) return;
        // The first request waits for the saved translations, so nothing on screen is asked for twice.
        if (!translate.restored) { if (!files) translate.restored = true; else { translateRestore(); if (!translate.restored) return; } }
        const wait = Math.max(ms, translate.pausedUntil - Date.now());
        translate.timer = later(() => { translate.timer = undefined; translateNext(); }, wait, false);
    }
    // Drops what is no longer worth asking for: switched off, target changed, or long gone from the cache.
    function translateBatch() {
        const keys = [], target = translateTarget();
        let chars = 0;
        // After a batch failed more than once, try smaller ones: one bad text can't keep the rest waiting.
        const most = translate.failures > 1 ? Math.max(1, TRANSLATE_BATCH >> Math.min(5, translate.failures - 1)) : TRANSLATE_BATCH;
        while (translate.queue.length && keys.length < most) {
            const key = translate.queue[0], entry = translate.cache.get(key);
            if (!entry || entry.state !== "queued" || entry.target !== target) { translate.queue.shift(); if (entry && entry.state === "queued") translate.cache.delete(key); continue; }
            const size = encodeURIComponent(entry.text).length;
            if (keys.length && chars + size > TRANSLATE_BATCH_CHARS) break;
            translate.queue.shift(); keys.push(key); chars += size;
        }
        return {keys, target};
    }
    async function translateRequest(texts, target, host) {
        if (typeof global.fetch !== "function") throw new Error("networking is unavailable");
        const controller = typeof global.AbortController === "function" ? new global.AbortController() : null;
        let timer;
        const body = texts.map(text => "q=" + encodeURIComponent(text)).join("&");
        const url = TRANSLATE_HOSTS[(host === undefined ? translate.host : host) % TRANSLATE_HOSTS.length] + TRANSLATE_PATH + encodeURIComponent(target);
        const task = Promise.resolve().then(async () => {
            const response = await global.fetch(url, Object.assign({method:"POST", credentials:"omit",
                headers:{accept:"application/json", "content-type":"application/x-www-form-urlencoded;charset=UTF-8"}, body},
                controller ? {signal:controller.signal} : {}));
            if (!response.ok) { const error = new Error("HTTP " + response.status); error.status = response.status; throw error; }
            const result = await response.json();
            if (!Array.isArray(result)) throw new Error("unreadable answer");
            // One text comes back as [text, language] in an array of one; several as one pair each.
            return texts.map((_, i) => {
                const item = result[i];
                if (Array.isArray(item)) return {text:String(item[0] == null ? "" : item[0]), language:typeof item[1] === "string" ? item[1] : ""};
                if (typeof item === "string") return {text:item, language:""};
                return null;
            });
        });
        const timeout = new Promise((resolve, reject) => {
            if (global.setTimeout) timer = global.setTimeout(() => { reject(new Error("no answer")); if (controller) controller.abort(); }, TRANSLATE_TIMEOUT_MS);
        });
        try { return await Promise.race([task, timeout]); }
        finally { if (timer !== undefined && global.clearTimeout) global.clearTimeout(timer); }
    }
    function translateNext() {
        if (!enabled("translate")) return;
        // translateSchedule's timer already waited out any pause.
        while (translate.active < TRANSLATE_PARALLEL && translate.queue.length) {
            const {keys, target} = translateBatch();
            if (!keys.length) break;
            translateSend(keys, target);
        }
        if (translate.queue.length) translateSchedule(0);
    }
    function translateSend(keys, target) {
        const generation = translate.generation, host = translate.host;
        translate.active++;
        keys.forEach(key => { translate.cache.get(key).state = "sending"; });
        translateRequest(keys.map(key => translate.cache.get(key).text), target, host).then(results => {
            if (generation !== translate.generation) return;
            translate.failures = 0; translate.error = "";
            const redraw = new Set();
            keys.forEach((key, i) => {
                const entry = translate.cache.get(key), result = results[i];
                if (!entry) return;
                const ids = entry.ids; entry.ids = new Set();
                // Missing from the answer: asked for again, not given up on.
                if (!result) { entry.state = "queued"; translate.queue.push(key); return; }
                // Already in your language, or given back unchanged: nothing to show, and it's never asked for again.
                // The row isn't redrawn, so a message you asked for from the hold menu says so now instead of never.
                if (result.text === entry.text || result.language && languageBase(result.language) === languageBase(target)) { entry.state = "same"; entry.layout = null; ids.forEach(translateNothing); return; }
                // A translation that lost, doubled or moved a mention or emoji out of its formatting is never shown.
                if (!translateNodes(result.text, entry.layout)) { entry.state = "failed"; entry.layout = null; ids.forEach(id => translate.asked.delete(id)); return; }
                entry.translated = result.text; entry.language = result.language; entry.state = "done"; entry.layout = null; translate.translated++;
                // Only rows that change are redrawn: one in your language looks the same as before.
                ids.forEach(id => redraw.add(id));
            });
            translateRedraw(redraw);
            translatePersist();
        }, error => {
            if (generation !== translate.generation) return;
            // Back in front, in the same order, and on the other Google server next time.
            keys.slice().reverse().forEach(key => { const entry = translate.cache.get(key); if (entry) { entry.state = "queued"; translate.queue.unshift(key); } });
            translate.failures++;
            if (translate.host === host) translate.host++;
            // Asked to slow down: wait 15 s, longer each time, up to 10 minutes. A timeout or a dropped connection
            // is usually the network: the other server is tried in a moment, and only after a few in a row does it wait.
            const limited = error && error.status === 429;
            const wait = limited ? Math.min(600000, 15000 * Math.pow(2, Math.min(6, translate.failures - 1))) :
                translate.failures < 3 ? 500 * translate.failures : Math.min(120000, 5000 * Math.pow(2, Math.min(5, translate.failures - 3)));
            translate.pausedUntil = Math.max(translate.pausedUntil, Date.now() + wait);
            translate.error = translate.failures < 3 && !limited ? "" : (limited ? tr("Google Translate asked to slow down.") : tr("Google Translate isn't answering ({problem}).", {problem:String(error && error.message || error)})) +
                " " + tr("Trying again in {n} s.", {n:Math.max(1, Math.round(wait / 1000))});
        }).then(() => {
            translate.active--;
            if (generation === translate.generation && translate.queue.length) translateSchedule(translate.failures ? 0 : 30);
            notify("translate");
        });
    }
    // Discord keeps a row until its message record changes, so its text is changed for a moment (a zero-width
    // space) and then put back, like Fix unknown mentions does. The translation ignores that space.
    function translateRedraw(ids) {
        if (!translate.dispatcher) return;
        const entries = [];
        ids.forEach(id => {
            const entry = translate.shown.get(id);
            if (entry && (typeof entry.raw === "string" && entry.raw || entry.snapshot) && !translate.refreshing.has(id)) entries.push(entry);
        });
        if (!entries.length) return;
        const dispatch = message => { try { translate.dispatcher.dispatch({type:"MESSAGE_UPDATE", message}); } catch (_) {} };
        const update = (entry, suffix) => {
            if (entry.raw) return {id:entry.id, channel_id:entry.channelId, content:entry.raw + suffix};
            const snap = entry.snapshot;
            return {id:entry.id, channel_id:entry.channelId, message_snapshots:[{message:Object.assign({}, snap.message, {content:snap.message.content + suffix}),
                moderator_report:snap.moderator_report}].concat(snap.rest)};
        };
        entries.forEach(entry => { translate.refreshing.add(entry.id); dispatch(update(entry, "\u200b")); });
        later(() => entries.forEach(entry => { dispatch(update(entry, "")); translate.refreshing.delete(entry.id); }), 120);
    }
    // Switched on or off, or a different language or option: redraw what's on screen.
    // Only messages that are (or were) shown translated are redrawn.
    function translateChanged() {
        translate.version++;
        translate.foreign.clear(); translateScans.clear();
        if (enabled("translate")) translateSchedule(0);
        // Messages known to be in your language, or that failed, look the same either way unless they quote a message that doesn't.
        const ids = new Set();
        translate.shown.forEach((entry, id) => {
            const cached = entry.key && translate.cache.get(entry.key);
            const quoted = entry.quoteKey && translate.cache.get(entry.quoteKey);
            if (!cached || cached.state !== "same" && cached.state !== "failed" ||
                entry.quotes && (!quoted || quoted.state !== "same" && quoted.state !== "failed")) ids.add(id);
        });
        translateRedraw(ids);
    }
    function translateRelabel() {
        translate.version++;
        const ids = new Set();
        translate.shown.forEach((entry, id) => { const cached = entry.key && translate.cache.get(entry.key); if (cached && cached.state === "done") ids.add(id); });
        translateRedraw(ids);
    }
    function translateStatus() {
        if (translate.error) return translate.error;
        const waiting = translate.queue.length;
        return (translate.translated ? pl(translate.translated, "Translated {n} message since Discord opened.", "Translated {n} messages since Discord opened.") : tr("Nothing translated yet since Discord opened.")) +
            (waiting ? " " + tr("{n} waiting.", {n:waiting}) : "");
    }
    // A message in Spanish shown the way Translate messages shows it, following the Display switches.
    // While on, it plays: Lucía writes in Spanish and it turns into your language on its own, from the bar, or after you
    // hold it and tap Translate in Discord's message menu (whichever you chose below).
    const TRANSLATE_SAMPLE = "\u00a1Hola a todos! \u00bfQui\u00e9n viene esta noche?";
    // A message's long-press menu (LongPressMessageActionSheet 9675 + EmojiRow 12834): 5 quick reactions + Add Reaction, and a rounded card of actions.
    function previewSheet(k, s, rows, pulse) {
        const Press = RN.Pressable || RN.View, AddReaction = venusIcon(8956, "ReactionIcon");
        return el(RN.View, {key:"sheet", style:[k.sheet, {marginTop:6}]},
            el(RN.View, {style:{alignSelf:"center", width:36, height:4, borderRadius:2, backgroundColor:"#80848e66", marginBottom:8}}),
            el(RN.View, {style:{flexDirection:"row", justifyContent:"space-between", paddingHorizontal:16, paddingBottom:10}},
                ["\ud83d\udc4d", "\u2764\ufe0f", "\ud83d\ude02", "\ud83d\ude2e", "\ud83d\ude22"].map(e => el(RN.View, {key:e, style:k.emojiBtn}, el(RN.Text, {style:{fontSize:20}}, e))),
                el(RN.View, {key:"more", style:k.emojiBtn}, el(AddReaction, {size:"sm", color:k.icon.color}))),
            el(RN.View, {style:[k.sheetRow, {marginHorizontal:16, marginBottom:8, borderRadius:16, overflow:"hidden"}]},
                rows.map(([key, Icon, label, onPress], i) => el(Press, {key, onPress, accessibilityRole:onPress ? "button" : undefined,
                    style:[{flexDirection:"row", alignItems:"center", gap:12, paddingHorizontal:16, height:48}, i ? {borderTopWidth:1, borderTopColor:k.sheetRow.borderColor} : null]},
                    el(Icon, {size:"sm", color:k.icon.color}), el(RN.Text, {style:[s.text, {fontSize:15, fontWeight:"500"}]}, label), tapRipple(pulse, key, {left:8, top:7})))));
    }
    // The translate bar as it looks in chat (TranslateBar): the same compact 32 dp pill, centered, with its divider and cog,
    // drawn with the preview's own colors. It used to be a full-width bar with the cog at the far edge, which the real bar isn't.
    // The translate bar as it looks in chat: the very same pill (translatePill), floating over the top of the chat.
    function previewTranslateBar(s, done, target, onPress, pulse) {
        const label = done ? tr("Show original") : tr("Translate to {language}", {language:target});
        return el(RN.View, {key:"bar", style:{alignItems:"center", paddingHorizontal:12, paddingTop:8, paddingBottom:4}},
            translatePill(s, done, label, onPress, null, null, tapRipple(pulse, "bar", {left:"40%", top:-2})));
    }
    function TranslatePreview(props) {
        useSettings("translate");
        const s = useChatPreviewStyles(), k = usePreviewChrome(), barStyles = useTranslateBarStyles(), on = !!props.on;
        const blank = {shown:true, done:false, busy:false, menu:false, held:false, pulse:null};
        const [state, setState] = React.useState(blank), watching = on, manual = settings.translateMode === "manual";
        // The translate bar (#82) is shown, and is how Watch asks, whenever "How you ask" includes it.
        const barAsk = manual && settings.translateAsk !== "menu";
        const update = change => setState(st => Object.assign({}, st, typeof change === "function" ? change(st) : change));
        const target = translateTargetName();
        const story = useStory(watching, () => {
            const steps = [[0, () => setState(blank), tr("Luc\u00eda writes in Spanish")]];
            if (barAsk) steps.push([1400, () => update({pulse:{who:"bar", id:"tap"}}), tr("You tap the bar at the top of the chat")],
                [600, () => update({busy:true})]);
            else if (manual) steps.push([1400, () => update({pulse:{who:"msg", id:"hold"}, held:true}), tr("You hold the message to open its menu")],
                [700, () => update({menu:true})],
                [1800, () => update({pulse:{who:"translate", id:"tap"}}), tr("And tap Translate")],
                [600, () => update({menu:false, held:false, busy:true})]);
            else steps.push([1400, () => update({busy:true}), tr("Venus sees it's not in {language} and translates it on its own", {language:target})]);
            steps.push([1600, () => update({busy:false, done:true}), tr("Now it reads in {language}", {language:target})]);
            if (settings.translateNote || settings.translateOriginal) steps.push([300, () => {},
                tr(settings.translateOriginal ? "The note under it says what it was in, with the original quoted below" : "The small note under it says what language it was in")]);
            steps.push([800, () => {}]);
            return steps;
        }, [manual, barAsk, settings.translateNote, settings.translateOriginal, target]);
        const translated = on ? state.done : true;
        const Lang = venusIcon(15723, "LanguageIcon");
        const body = state.busy ? el(RN.View, null, el(RN.Text, {style:s.text}, TRANSLATE_SAMPLE),
                el(RN.Text, {style:[s.muted, {marginTop:2}]}, tr("Translating\u2026"))) :
            !translated ? el(RN.Text, {style:s.text}, TRANSLATE_SAMPLE) : el(RN.View, null,
                popIn("tr", el(RN.Text, {style:s.text}, tr("Hi everyone! Who's coming tonight?"))),
                // Like chat (translateView): the note shows when either switch is on, and says "Original:" over the quote.
                settings.translateNote || settings.translateOriginal ? el(RN.Text, {style:[s.muted, {marginTop:2}]}, settings.translateOriginal ? tr("Translated from {language}. Original:", {language:languageName("es")}) :
                    tr("Translated from {language}", {language:languageName("es")})) : null,
                settings.translateOriginal ? el(RN.View, {style:s.quote}, el(RN.Text, {style:s.muted}, TRANSLATE_SAMPLE)) : null);
        const bar = barAsk ? previewTranslateBar(barStyles, state.done, target, null, state.pulse) : null;
        const msgView = el(RN.View, {key:"msg", style:state.held ? k.selected : null},
            popIn("msg", previewMessage(s, "msg", "Luc\u00eda", "#faa61a", tr("Today at 4:01 PM"), body)), tapRipple(state.pulse, "msg"));
        const message = msgView;
        const actionLabel = tr(state.done ? "Show original" : "Translate");
        const sheet = watching && state.menu ? el(RN.View, {key:"overlay", style:[k.scrim, {position:"absolute", left:0, right:0, top:0, bottom:0, justifyContent:"flex-end"}]},
            el(RN.View, {style:{flex:1}}),
            popIn("sheet", previewSheet(k, s, [
                ["reply", venusIcon(12838, "ArrowAngleLeftUpIcon"), tr("Reply"), null],
                ["copy", venusIcon(5042, "CopyIcon"), tr("Copy Text"), null],
                ["translate", Lang, actionLabel, null]], state.pulse))) : null;
        return el(RN.View, {key:"preview"},
            previewScreen(s, "preview", "Translation preview",
                // Steady while you watch or tap (#82), but taller when the original is quoted under the translation, so the quote never
                // pushes the message bar out of the stage.
                [el(RN.View, {key:"stage", style:{height:settings.translateOriginal ? 256 : 228, justifyContent:"space-between", overflow:"hidden"}},
                    el(RN.View, {key:"chat", style:{paddingTop:4}}, bar, message),
                    previewInput(k, s, {placeholder:tr("Message {channel}", {channel:"#general"})}),
                    sheet)],
                {header:previewHeader(k, {title:"general"}),
                 footer:watching ? storyStrip(k, s, story) : null}));
    }
    // The translate bar (#82), like Telegram's: in "Only when you ask", a slim bar appears at the top of a chat once a
    // message in it is in another language. Tap it to translate the chat, and every message you see in it; the bar
    // stays, so one more tap shows it as written. The chat stays translated when you leave and come back, until
    // Discord restarts. Single messages still have Translate and Show original in their menu. The cog opens these settings.
    function translateBarHeader(orig, self, args) {
        const props = args[0];
        // The bar is always in the tree and draws nothing unless it's wanted, so switching options never remounts the chat.
        // Appended after ChatViewWrapper's children (like JumpToPresentButton) so it sits above DCDChatList's native
        // GestureDetector on Android and receives touches directly.
        if (!props || !props.channelId || !React || !RN) return orig.apply(self, args);
        const bar = el(TranslateBar, {key:"venus-translate-bar", channelId:props.channelId});
        const children = Array.isArray(props.children) ? props.children.concat([bar]) : [props.children, bar];
        // Discord's own sticky header (the blue "25+ new messages" bar, thread and safety banners) is measured, so the
        // pill always sits just under whatever Discord shows there instead of on top of it (#82).
        // Only a header Discord already passes is wrapped: StickyWrapper (10380) fills the chat with its header box on Android,
        // so adding one where there was none could take touches from the messages.
        const next = Object.assign({}, props, props.stickyHeader ? {children, stickyHeader:el(TranslateHeaderMeasure, {channelId:props.channelId}, props.stickyHeader)} : {children});
        return args.length === 1 ? orig.call(self, next) : orig.apply(self, [next].concat(Array.prototype.slice.call(args, 1)));
    }
    // How tall Discord's sticky header is right now, per channel. Only the bar listens, so a change never redraws the chat.
    const translateHeader = {heights:new Map(), listeners:new Set()};
    function TranslateHeaderMeasure(props) {
        const channelId = props.channelId;
        React.useEffect(() => () => { if (translateHeader.heights.delete(channelId)) translateHeader.listeners.forEach(fn => fn()); }, [channelId]);
        const onLayout = event => {
            const h = Math.max(0, Math.round(event && event.nativeEvent && event.nativeEvent.layout ? event.nativeEvent.layout.height : 0));
            if (translateHeader.heights.get(channelId) === h) return;
            translateHeader.heights.set(channelId, h);
            translateHeader.listeners.forEach(fn => fn());
        };
        // box-none: the wrapper itself never takes a touch, so Discord's banners work exactly as before.
        return el(RN.View, {pointerEvents:"box-none", onLayout, collapsable:false}, props.children);
    }
    function useTranslateHeaderHeight(channelId) {
        const [h, setH] = React.useState(() => translateHeader.heights.get(channelId) || 0);
        React.useEffect(() => {
            const fn = () => setH(translateHeader.heights.get(channelId) || 0);
            translateHeader.listeners.add(fn); fn();
            return () => { translateHeader.listeners.delete(fn); };
        }, [channelId]);
        return h;
    }
    // A floating pill, centered, 36 dp: a round brand badge with the language icon, what a tap does, and a cog.
    // Once the chat is translated the badge turns quiet and the label says how to go back.
    const TRANSLATE_BAR_DARK = {bar:{flexDirection:"row", alignItems:"center", height:36, paddingLeft:4, paddingRight:4, borderRadius:18,
        backgroundColor:"#2b2d31", borderWidth:1, borderColor:"#ffffff14",
        shadowColor:"#000000", shadowOpacity:0.28, shadowRadius:10, shadowOffset:{width:0, height:4}, elevation:8},
        badge:{width:28, height:28, borderRadius:14, alignItems:"center", justifyContent:"center", backgroundColor:"#5865f2"},
        badgeOn:{width:28, height:28, borderRadius:14, alignItems:"center", justifyContent:"center", backgroundColor:"#4e505899"},
        badgeIcon:{color:"#ffffff"}, text:{color:"#f2f3f5"}, muted:{color:"#b5bac1"},
        cog:{width:28, height:28, borderRadius:14, alignItems:"center", justifyContent:"center"},
        divider:{width:1, height:16, marginHorizontal:4, backgroundColor:"#ffffff1f"}};
    function useTranslateBarStyles() {
        return useThemed("translateBar", c => ({
            bar:Object.assign({}, TRANSLATE_BAR_DARK.bar, {backgroundColor:c.BACKGROUND_SURFACE_HIGHEST || c.MOBILE_FLOATING_ACCESSORY_BACKGROUND || c.CARD_BACKGROUND_DEFAULT,
                borderColor:c.BORDER_SUBTLE}),
            badge:Object.assign({}, TRANSLATE_BAR_DARK.badge, {backgroundColor:c.BACKGROUND_BRAND}),
            badgeOn:Object.assign({}, TRANSLATE_BAR_DARK.badgeOn, {backgroundColor:c.BACKGROUND_MOD_STRONG || c.BACKGROUND_MOD_NORMAL}),
            badgeIcon:{color:c.CONTROL_BRAND_FOREGROUND_NEW || c.WHITE || "#ffffff"}, text:{color:c.TEXT_STRONG}, muted:{color:c.TEXT_MUTED},
            cog:TRANSLATE_BAR_DARK.cog, divider:Object.assign({}, TRANSLATE_BAR_DARK.divider, {backgroundColor:c.BORDER_SUBTLE})}), TRANSLATE_BAR_DARK);
    }
    // The pill's insides, shared by chat and the settings preview so both always look the same.
    function translatePill(s, on, label, onPress, onCog, Press, extra) {
        Press = Press || RN.View;
        const Lang = venusIcon(15723, "LanguageIcon"), Cog = venusIcon(15285, "FiltersHorizontalIcon", venusIcon(7092, "SettingsIcon"));
        const Text = inspectedExport(5088, "Text");
        return el(RN.View, {style:s.bar},
            el(Press, {style:{flexDirection:"row", alignItems:"center", gap:8, height:34, paddingRight:6, flexShrink:1},
                accessibilityRole:onPress ? "button" : undefined, accessibilityLabel:label, accessibilityState:{checked:on}, onPress, hitSlop:{top:6, bottom:6, left:6}},
                popIn("badge:" + on, el(RN.View, {style:on ? s.badgeOn : s.badge}, el(Lang, {size:"xs", color:on ? s.muted.color : s.badgeIcon.color}))),
                popIn("label:" + on, Text ? el(Text, {variant:"text-sm/semibold", style:on ? s.muted : s.text, lineClamp:1}, label) :
                    el(RN.Text, {numberOfLines:1, style:[{fontSize:14, fontWeight:"600"}, on ? s.muted : s.text]}, label)),
                extra || null),
            el(RN.View, {style:s.divider}),
            el(onCog ? Press : RN.View, {style:s.cog, accessibilityRole:onCog ? "button" : undefined, accessibilityLabel:tr("Translate messages"), onPress:onCog,
                hitSlop:{top:6, bottom:6, left:4, right:6}}, el(Cog, {size:"xs", color:s.muted.color})));
    }
    function translateBarShown(channelId) {
        if (!enabled("translate") || settings.translateMode !== "manual" || settings.translateAsk === "menu" || !channelId || hiddenChannel(channelId)) return false;
        if (translate.channels.has(channelId) || translate.foreign.get(channelId) === true) return true;
        return translateScanChannel(channelId);
    }
    function TranslateBar(props) {
        useSettings("translate");
        const [, bump] = React.useState(0);
        const channelId = props.channelId, headerHeight = useTranslateHeaderHeight(channelId);
        React.useEffect(() => {
            if (!channelId || !enabled("translate") || settings.translateMode !== "manual" || settings.translateAsk === "menu") return undefined;
            if (!msgStore) msgStore = inspectedExport(5432, "default");
            if (!msgStore || typeof msgStore.addChangeListener !== "function" || typeof msgStore.removeChangeListener !== "function") return undefined;
            const check = () => {
                if (translate.foreign.get(channelId) !== true && translateScanChannel(channelId)) bump(n => n + 1);
            };
            check();
            msgStore.addChangeListener(check);
            return () => msgStore.removeChangeListener(check);
        }, [channelId, settings.translate, settings.translateMode, settings.translateAsk, settings.translateTarget, settings.translateLanguage]);
        const s = useTranslateBarStyles();
        if (!translateBarShown(channelId)) return null;
        const on = translate.channels.has(channelId), Press = inspectedExport(6185, "PressableOpacity") || RN.TouchableOpacity || RN.Pressable || RN.View;
        const label = on ? tr("Show original") : tr("Translate to {language}", {language:translateTargetName()});
        const tap = () => { haptic("SELECTION"); animateLayout(); translateChannel(channelId, !on); };
        // A plain view placed with layout (top), never a native-driven transform or popIn wrapper: on Android those draw the
        // pill where it belongs but leave its touch area behind, so taps did nothing (#82). Only the pill takes touches.
        return el(RN.View, {pointerEvents:"box-none", style:{position:"absolute", top:headerHeight, left:0, right:0, alignItems:"center", paddingHorizontal:12, paddingTop:8,
                zIndex:100, elevation:8}},
            translatePill(s, on, label, tap, openTranslateSettings, Press));
    }
    function openTranslateSettings() {
        haptic("SELECTION");
        if (!status.menu) inspectedExport(14839, "SETTING_RENDERER_CONFIG");
        if (!SettingsList) SettingsList = inspectedExport(14971, "SettingsList");
        const open = inspectedExport(7094, "openUserSettings");
        try { if (typeof open === "function") { open({screen:status.menu ? "VENUS_TRANSLATE" : undefined}); return; } } catch (_) {}
        openSettings();
    }
    // A language in its own words (TRANSLATE_NATIVE); the list shows Venus's name for it under it when that's different.
    function translateNativeName(code) { return TRANSLATE_NATIVE[code] || translateLanguageName(code); }
    // Another language (#79): one row that says which language, and opens the list only when you want to change it.
    // Each language is listed in its own words with Venus's name for it under it (#82), with Discord's search field.
    // Picking one closes the list again, so the rest of the page is never pushed far down.
    function TranslateLanguagePicker(props) {
        useSettings("translate");
        const [query, setQuery] = React.useState(""), [open, setOpen] = React.useState(false), ui = reviewUI(), on = !!props.on;
        const RadioGroup = inspectedExport(6263, "TableRadioGroup"), RadioRow = inspectedExport(6262, "TableRadioRow");
        const SearchField = inspectedExport(6739, "SearchField"), Group = ui.TableRowGroup || RN.View;
        const shownIn = i18n.shownIn;
        const all = React.useMemo(() => TRANSLATE_LANGUAGES.map(code => {
            const local = translateLanguageName(code), own = translateNativeName(code);
            const english = code === "zh-CN" ? "Chinese Simplified" : code === "zh-TW" ? "Chinese Traditional" : LANGUAGE_NAMES[languageBase(code)] || "";
            return {code, label:own, sub:local !== own ? local : undefined, search:searchFold(own + " " + local + " " + english + " " + code)};
        }).sort((a, b) => a.label.localeCompare(b.label)), [shownIn, i18n.version]);
        const needle = searchFold(query.trim());
        const shown = needle ? all.filter(entry => entry.search.includes(needle)) : all;
        const toggle = () => { if (!on) return; haptic("SELECTION"); animateLayout(); setOpen(!open); setQuery(""); };
        const pick = value => {
            if (value !== settings.translateLanguage) { haptic("SELECTION"); setSetting("translateLanguage", value); }
            animateLayout(); setOpen(false); setQuery("");
        };
        const current = all.find(entry => entry.code === settings.translateLanguage);
        const Chevron = venusIcon(open ? 10534 : 6906, open ? "ChevronSmallDownIcon" : "ChevronSmallRightIcon");
        const head = ui.TableRow ? el(ui.TableRow, {key:"current", label:current ? current.label : settings.translateLanguage, subLabel:current && current.sub,
            icon:rowIcon(15723, "LanguageIcon"), trailing:el(Chevron, {size:"sm"}), onPress:toggle, disabled:!on,
            accessibilityHint:tr(open ? "Close the list" : "Choose a language")}) : null;
        if (!open) return el(Group, {key:"language", title:tr("Language")}, head);
        const search = SearchField ? el(SearchField, {key:"search", placeholder:tr("Search languages"), value:query, onChange:text => setQuery(String(text || "")), isDisabled:!on}) :
            ui.TextInput ? el(ui.TextInput, {key:"search", placeholder:tr("Search languages"), value:query, onChange:text => setQuery(String(text || "")), editable:on}) : null;
        const rows = !shown.length ? (ui.TableRow ? el(ui.TableRow, {key:"none", label:tr("No matching languages"), disabled:true}) : null) :
            RadioGroup && RadioRow ? el(RadioGroup, {key:"list", value:settings.translateLanguage, onChange:pick},
                shown.map(entry => el(RadioRow, {key:entry.code, value:entry.code, label:entry.label, subLabel:entry.sub, disabled:!on}))) :
            el(Group, {key:"list"}, shown.map(entry => ui.TableRow && el(ui.TableRow, {key:entry.code, label:entry.label, subLabel:entry.sub,
                trailing:entry.code === settings.translateLanguage ? el(venusIcon(6823, "CheckmarkSmallIcon"), {size:"sm"}) : undefined, disabled:!on, onPress:() => pick(entry.code)})));
        return el(RN.View, {key:"language", style:{gap:12}}, el(Group, {key:"head", title:tr("Language")}, head),
            el(RN.View, {style:{paddingHorizontal:16}}, search), rows);
    }
    function TranslateSettings() {
        useSettings("translate");
        const ui = reviewUI();
        if (!React || !RN) return null;
        const Group = ui.TableRowGroup || RN.View, Switch = ui.TableSwitchRow, on = enabled("translate");
        const name = kind => languageName(localeCode(kind));
        let saved = 0; translate.cache.forEach(entry => { if (entry.state === "done") saved++; });
        const groups = [
            on ? statusCard("status", translateStatus(), {title:tr("Into {language}", {language:translateTargetName()}), IconComponent:venusIcon(15723, "LanguageIcon")}) :
                offCard("status", venusIcon(15723, "LanguageIcon"), "translate"),
            el(TranslatePreview, {key:"preview", on}),
            radioGroup(ui, "mode", "When to translate", "translateMode", on, [["auto", "Automatically", "Every message on screen in another language.", rowIcon(17143, "SparklesIcon")],
                ["manual", "Only when you ask", "From the bar at the top of a chat, or a message's menu. Nothing else is sent.", rowIcon(8956, "ReactionIcon")]]),
            // How you ask (#82): one choice, so there's always a way to translate. Only shown when it matters.
            settings.translateMode === "manual" ? el(RN.View, {key:"ask", style:{gap:8}},
                groupTitle("title", "How you ask"),
                venusSegmented({key:"ask:choice", value:settings.translateAsk, disabled:!on, onChange:value => setSetting("translateAsk", value),
                    items:[{value:"both", label:tr("Both")}, {value:"bar", label:tr("Top bar")}, {value:"menu", label:tr("Message menu")}]}),
                footnote("hint", settings.translateAsk === "bar" ? "Chats with messages in another language show a bar at the top. Tap it to translate the chat until Discord restarts. Hold a message there to see its original." :
                    settings.translateAsk === "menu" ? "Hold a message and tap Translate. No bar at the top of chats." :
                    "Chats with messages in another language show a bar at the top. Tap it to translate the chat until Discord restarts, or hold one message and tap Translate.")) : null,
            radioGroup(ui, "target", "Translate into", "translateTarget", on, [["discord", tr("Discord's language"), tr("{language}. Change it in Discord's Language settings.", {language:name("discord")}), rowIcon(12901, "ChatSmileIcon")],
                ["phone", tr("Your phone's language"), name("phone") + ".", rowIcon(6642, "MobilePhoneIcon")],
                ["custom", tr("Another language"), translateLanguageName(settings.translateLanguage) + ".", rowIcon(15723, "LanguageIcon")]], true),
            settings.translateTarget === "custom" ? el(TranslateLanguagePicker, {key:"language", on}) : null,
            el(Group, {key:"show", title:tr("Display")},
                // The quoted original always comes with its "Translated from" line, so while it's on that switch shows on and
                // can't be turned off, instead of reading off while the line still shows in chat.
                settings.translateOriginal && Switch ? el(Switch, {key:"translateNote", label:tr("Show the original language"), icon:rowIcon(9099, "GlobeEarthIcon"),
                    subLabel:tr("Always shown with the original text."), value:true, disabled:true, onValueChange:() => {}}) :
                    switchRow(Switch, "translateNote", "Show the original language", "A small \"Translated from Spanish\" line under each translation.", rowIcon(9099, "GlobeEarthIcon")),
                switchRow(Switch, "translateOriginal", "Show the original text", "The untranslated message, in a quote under the translation.", rowIcon(13262, "QuoteIcon"))),
            el(Group, {key:"clear", title:tr("Manage")}, actionRow(ui, "clear", "Clear saved translations",
                saved ? tr("{count} kept on this phone, so chats you reopen show them at once.", {count:count(saved, "translation")}) : "Nothing saved yet.",
                () => confirmAction("Clear saved translations?", "Messages on screen will be translated again.", "Clear", translateForget), !saved, true)),
            footnote("note", settings.translateMode === "manual" ? "Only messages you choose, or chats you translate from the bar, are sent to Google Translate, once each, without your Discord account." :
                "Only messages on screen are sent to Google Translate, once each, without your Discord account. Hold a message to show its original, or translate your own.")];
        return settingsBody(ui, groups);
    }
    // Clear saved translations: forgets every translation, on the phone too, and translates what's on screen again.
    function translateForget() {
        translate.generation++; translate.cache.clear(); translate.queue.length = 0; translate.translated = 0; translate.error = ""; translate.choice.clear(); translate.asked.clear(); translate.channels.clear(); translate.foreign.clear(); translateScans.clear();
        if (files) Promise.resolve().then(() => files.writeFile("documents", TRANSLATE_FILE, "{\"version\":1,\"entries\":[]}", "utf8")).catch(() => {});
        translateChanged(); notify("translate");
        reviewToast(reviewUI(), "Saved translations cleared", venusIcon(5049, "TrashIcon"));
    }

    // Custom themes: installs Revenge / Vendetta JSON themes from links and compiles their rawColors,
    // semanticColors, plus extensions and optional background alpha straight into Discord's native color token
    // tables (RawColors 591 and SemanticColors 589) once when a theme is picked or toggled. Render-time color
    // lookups (resolveSemanticColor 587, useToken 4818 and createStyles 5092) run Discord's unmodified native
    // bytecode and Map caches with zero wrapper functions and zero per-render work, and optional background
    // wallpapers render as a single static native Image layer behind ChatViewWrapper (10368) outside the message list.
    const THEMES_FILE = "venus-themes.json", THEMES_MAX = 40, THEMES_MAX_BYTES = 512 * 1024, THEMES_TIMEOUT_MS = 10000;
    const THEME_SLOTS = ["dark", "light", "darker", "midnight"];
    // Maps Vendetta / Revenge legacy semantic color names to Discord 350.8's Mana SemanticColors (589) keys.
    const LEGACY_SEMANTIC_ALIASES = {
        BACKGROUND_PRIMARY: ["BACKGROUND_BASE_LOWER", "CHANNEL_BACKGROUND_DEFAULT", "STANDALONE_CHANNEL_CONTENT_BACKGROUND", "PANEL_BG", "MOBILE_KEYBOARD_GAP_BACKGROUND", "MOBILE_TYPING_INDICATOR_BACKGROUND_DEFAULT"],
        BACKGROUND_MOBILE_PRIMARY: ["BACKGROUND_BASE_LOWER", "CHANNEL_BACKGROUND_DEFAULT", "STANDALONE_CHANNEL_CONTENT_BACKGROUND", "PANEL_BG"],
        BG_BASE_PRIMARY: ["BACKGROUND_BASE_LOWER", "CHANNEL_BACKGROUND_DEFAULT", "STANDALONE_CHANNEL_CONTENT_BACKGROUND", "PANEL_BG"],
        CHAT_BACKGROUND: ["BACKGROUND_BASE_LOWER", "CHANNEL_BACKGROUND_DEFAULT", "STANDALONE_CHANNEL_CONTENT_BACKGROUND"],
        HOME_BACKGROUND: ["BACKGROUND_BASE_LOWER", "BACKGROUND_BASE_LOW"],
        BACKGROUND_SECONDARY: ["BACKGROUND_BASE_LOW", "BACKGROUND_SURFACE_HIGH", "CARD_BACKGROUND_DEFAULT", "TAB_BAR_BACKGROUND", "MOBILE_FLOATINGBAR_BACKGROUND", "MOBILE_COMMAND_BAR_BACKGROUND"],
        BACKGROUND_MOBILE_SECONDARY: ["BACKGROUND_BASE_LOW", "BACKGROUND_SURFACE_HIGH", "CARD_BACKGROUND_DEFAULT", "TAB_BAR_BACKGROUND"],
        BG_BASE_SECONDARY: ["BACKGROUND_BASE_LOW", "TAB_BAR_BACKGROUND"],
        BACKGROUND_SECONDARY_ALT: ["BACKGROUND_SECONDARY_ALT", "MOBILE_FLOATINGBAR_BACKGROUND_HIGHER"],
        BACKGROUND_TERTIARY: ["BACKGROUND_BASE_LOWEST", "ANDROID_NAVIGATION_BAR_BACKGROUND", "MOBILE_VOICE_PANEL_BACKGROUND", "USER_PROFILE_GRADIENT_BACKGROUND"],
        BG_BASE_TERTIARY: ["BACKGROUND_BASE_LOWEST", "ANDROID_NAVIGATION_BAR_BACKGROUND"],
        KEYBOARD: ["MOBILE_KEYBOARD_PANEL_BACKGROUND", "MOBILE_KEYBOARD_GAP_BACKGROUND", "MOBILE_EXPRESSION_PICKER_BACKGROUND_DEFAULT"],
        BACKGROUND_FLOATING: ["BACKGROUND_SURFACE_HIGHEST", "MODAL_BACKGROUND", "MODAL_FOOTER_BACKGROUND", "MOBILE_ACTIONSHEET_BACKGROUND", "MOBILE_ALERT_BACKGROUND_DEFAULT", "MOBILE_TOAST_BACKGROUND_DEFAULT"],
        BACKGROUND_NESTED_FLOATING: ["BACKGROUND_SURFACE_HIGHEST", "MODAL_BACKGROUND", "MOBILE_ACTIONSHEET_BACKGROUND"],
        BG_SURFACE_OVERLAY: ["BACKGROUND_SURFACE_HIGH", "MODAL_BACKGROUND", "MOBILE_ACTIONSHEET_BACKGROUND", "MOBILE_EXPRESSION_PICKER_BACKGROUND_DEFAULT"],
        BG_SURFACE_OVERLAY_TMP: ["BACKGROUND_SURFACE_HIGH", "MODAL_BACKGROUND", "MOBILE_ACTIONSHEET_BACKGROUND"],
        BG_SURFACE_RAISED: ["BG_SURFACE_RAISED", "BACKGROUND_SURFACE_HIGH", "CARD_BACKGROUND_DEFAULT"],
        CARD_PRIMARY_BG: ["CARD_BACKGROUND_DEFAULT", "BACKGROUND_SURFACE_HIGH", "EMBED_BACKGROUND", "MOBILE_EMBED_BACKGROUND_DEFAULT"],
        CARD_SECONDARY_BG: ["CARD_SECONDARY_BG", "CARD_SECONDARY_BACKGROUND_DEFAULT", "EMBED_BACKGROUND_ALTERNATE"],
        REDESIGN_ACTIVITY_CARD_BACKGROUND: ["CARD_BACKGROUND_DEFAULT", "CARD_SECONDARY_BACKGROUND_DEFAULT"],
        CHANNELTEXTAREA_BACKGROUND: ["CHANNELTEXTAREA_BACKGROUND", "REDESIGN_CHAT_INPUT_BACKGROUND", "CHAT_INPUT_BACKGROUND", "MOBILE_CHATINPUT_BACKGROUND_DEFAULT", "MOBILE_CHATINPUT_BACKGROUND_ACTIVE"],
        REDESIGN_CHAT_INPUT_BACKGROUND: ["REDESIGN_CHAT_INPUT_BACKGROUND", "CHAT_INPUT_BACKGROUND", "MOBILE_CHATINPUT_BACKGROUND_DEFAULT", "MOBILE_CHATINPUT_BACKGROUND_ACTIVE", "CHANNELTEXTAREA_BACKGROUND"],
        INPUT_BACKGROUND: ["INPUT_BACKGROUND_DEFAULT", "MOBILE_CHATINPUT_BACKGROUND_DEFAULT"],
        BACKGROUND_MODIFIER_ACCENT: ["BACKGROUND_MOD_MUTED", "BORDER_SUBTLE", "BORDER_MUTED"],
        BACKGROUND_MODIFIER_HOVER: ["BACKGROUND_MOD_SUBTLE", "INTERACTIVE_BACKGROUND_HOVER"],
        BACKGROUND_MODIFIER_ACTIVE: ["BACKGROUND_MOD_NORMAL", "INTERACTIVE_BACKGROUND_ACTIVE", "TABLEROW_BACKGROUND_PRESSED"],
        BACKGROUND_MODIFIER_SELECTED: ["BACKGROUND_MOD_STRONG", "INTERACTIVE_BACKGROUND_SELECTED", "MOBILE_CHANNEL_ITEM_BACKGROUND_SELECTED"],
        BG_MOD_FAINT: ["BACKGROUND_MOD_MUTED"],
        BG_MOD_SUBTLE: ["BACKGROUND_MOD_SUBTLE", "TABLEROW_BACKGROUND_DEFAULT"],
        BG_MOD_STRONG: ["BACKGROUND_MOD_STRONG"],
        BORDER_FAINT: ["BORDER_MUTED", "BORDER_SUBTLE"],
        BACKGROUND_MENTIONED: ["MESSAGE_MENTIONED_BACKGROUND_DEFAULT", "MENTION_BACKGROUND"],
        BACKGROUND_MENTIONED_HOVER: ["MESSAGE_MENTIONED_BACKGROUND_HOVER"],
        BACKGROUND_MESSAGE_HOVER: ["MESSAGE_BACKGROUND_HOVER"],
        HEADER_PRIMARY: ["TEXT_STRONG", "MOBILE_TEXT_HEADING_PRIMARY", "REDESIGN_CHANNEL_NAME_TEXT", "USER_PROFILE_ABOUT_ME_HEADING_TEXT", "NAVIGATOR_HEADER_TINT", "MOBILE_HEADER_ICON_DEFAULT"],
        HEADER_SECONDARY: ["TEXT_SUBTLE", "TEXT_MUTED", "REDESIGN_CHANNEL_NAME_MUTED_TEXT"],
        TEXT_NORMAL: ["TEXT_DEFAULT", "INPUT_TEXT_DEFAULT", "ICON_DEFAULT"],
        TEXT_PRIMARY: ["TEXT_DEFAULT", "TEXT_STRONG", "INPUT_TEXT_DEFAULT"],
        TEXT_MUTED: ["TEXT_MUTED", "ICON_MUTED", "REDESIGN_CHANNEL_NAME_MUTED_TEXT", "INPUT_PLACEHOLDER_TEXT_DEFAULT"],
        INPUT_PLACEHOLDER_TEXT: ["INPUT_PLACEHOLDER_TEXT_DEFAULT"],
        CHANNEL_TEXT_AREA_PLACEHOLDER: ["INPUT_PLACEHOLDER_TEXT_DEFAULT"],
        REDESIGN_CHANNEL_CATEGORY_NAME_TEXT: ["TEXT_MUTED", "CHANNELS_DEFAULT"],
        INTERACTIVE_NORMAL: ["INTERACTIVE_TEXT_DEFAULT", "INTERACTIVE_ICON_DEFAULT", "CHANNELS_DEFAULT", "CHANNEL_ICON", "MESSAGES_ITEM_CHANNEL_TEXT_DEFAULT", "CHAT_INPUT_ICON_DEFAULT_TINT"],
        INTERACTIVE_HOVER: ["INTERACTIVE_TEXT_HOVER", "INTERACTIVE_ICON_HOVER"],
        INTERACTIVE_ACTIVE: ["INTERACTIVE_TEXT_ACTIVE", "INTERACTIVE_ICON_ACTIVE", "TEXT_STRONG", "TABLEROW_ICON_COLOR_DEFAULT", "CHAT_INPUT_ACTION_ICON_ACTIVE_TINT"],
        INTERACTIVE_MUTED: ["INTERACTIVE_MUTED", "ICON_MUTED"],
        ANDROID_RIPPLE: ["MOBILE_ANDROID_BUTTON_BACKGROUND_RIPPLE"],
        BG_BACKDROP: ["BACKGROUND_SCRIM", "CONTEXT_MENU_BACKDROP_BACKGROUND"],
        TEXT_DANGER: ["TEXT_FEEDBACK_CRITICAL", "ICON_FEEDBACK_CRITICAL"],
        TEXT_POSITIVE: ["TEXT_FEEDBACK_POSITIVE", "STATUS_POSITIVE_TEXT"],
        TEXT_WARNING: ["TEXT_FEEDBACK_WARNING", "STATUS_WARNING_TEXT"],
        STATUS_DND: ["ICON_STATUS_DND", "TEXT_STATUS_DND"],
        STATUS_IDLE: ["ICON_STATUS_IDLE", "TEXT_STATUS_IDLE"],
        STATUS_OFFLINE: ["ICON_STATUS_OFFLINE", "TEXT_STATUS_OFFLINE"],
        STATUS_ONLINE: ["STATUS_ONLINE", "ICON_STATUS_ONLINE", "TEXT_STATUS_ONLINE"],
        REDESIGN_BUTTON_PRIMARY_BACKGROUND: ["CONTROL_PRIMARY_BACKGROUND_DEFAULT", "BACKGROUND_BRAND", "CHAT_INPUT_SEND_BUTTON_ACTIVE_BACKGROUND", "SWITCH_BACKGROUND_SELECTED_DEFAULT", "CHECKBOX_BACKGROUND_SELECTED_DEFAULT"],
        REDESIGN_BUTTON_PRIMARY_PRESSED_BACKGROUND: ["CONTROL_PRIMARY_BACKGROUND_ACTIVE"],
        REDESIGN_BUTTON_SECONDARY_BACKGROUND: ["CONTROL_SECONDARY_BACKGROUND_DEFAULT", "MOBILE_LEGACY_BUTTON_SECONDARY_BACKGROUND_DEFAULT"],
        REDESIGN_BUTTON_SECONDARY_OVERLAY_PRESSED_BACKGROUND: ["CONTROL_SECONDARY_BACKGROUND_ACTIVE", "CONTROL_OVERLAY_SECONDARY_BACKGROUND_ACTIVE"],
        REDESIGN_BUTTON_SECONDARY_BORDER: ["CONTROL_SECONDARY_BORDER_DEFAULT", "MOBILE_LEGACY_BUTTON_SECONDARY_BORDER_DEFAULT"],
        // 1.16.0: keys found in published themes that had no 349.9 target (checked against the decoded tables).
        TEXT_SECONDARY: ["TEXT_SUBTLE"],
        TEXT_LINK_LOW_SATURATION: ["TEXT_LINK"],
        TEXT_BRAND: ["ICON_BRAND"],
        TEXTBOX_MARKDOWN_SYNTAX: ["TEXT_CODE"],
        LOGO_PRIMARY: ["ICON_BRAND"],
        BADGE_BRAND_TEXT: ["BADGE_TEXT_BRAND"],
        BG_BRAND: ["BACKGROUND_BRAND", "BADGE_BACKGROUND_BRAND"],
        FOCUS_PRIMARY: ["BORDER_FOCUS"],
        DIVIDER_STRONG: ["BORDER_STRONG"],
        TYPING_INDICATOR_BG: ["MOBILE_TYPING_INDICATOR_BACKGROUND_DEFAULT"],
        CHANNEL_TEXT_AREA_BACKGROUND: ["CHAT_INPUT_BACKGROUND", "MOBILE_CHATINPUT_BACKGROUND_DEFAULT", "MOBILE_CHATINPUT_BACKGROUND_ACTIVE"],
        BACKGROUND_MESSAGE_AUTOMOD: ["MESSAGE_AUTOMOD_BACKGROUND_DEFAULT"],
        BACKGROUND_MESSAGE_AUTOMOD_HOVER: ["MESSAGE_AUTOMOD_BACKGROUND_HOVER"],
        ACTIVITY_CARD_BACKGROUND: ["CARD_BACKGROUND_DEFAULT"],
        REDESIGN_ACTIVITY_CARD_BACKGROUND_PRESSED: ["CARD_PRIMARY_PRESSED_BG"],
        STATUS_DANGER_TEXT: ["TEXT_FEEDBACK_CRITICAL"],
        STATUS_DANGER_BACKGROUND: ["BACKGROUND_FEEDBACK_CRITICAL"],
        INFO_DANGER_BACKGROUND: ["BACKGROUND_FEEDBACK_CRITICAL"],
        INFO_DANGER_FOREGROUND: ["ICON_FEEDBACK_CRITICAL", "BORDER_FEEDBACK_CRITICAL"],
        INFO_DANGER_TEXT: ["TEXT_FEEDBACK_CRITICAL"],
        INFO_WARNING_BACKGROUND: ["BACKGROUND_FEEDBACK_WARNING"],
        INFO_WARNING_FOREGROUND: ["ICON_FEEDBACK_WARNING", "BORDER_FEEDBACK_WARNING"],
        INFO_WARNING_TEXT: ["TEXT_FEEDBACK_WARNING"],
        INFO_POSITIVE_BACKGROUND: ["BACKGROUND_FEEDBACK_POSITIVE"],
        INFO_POSITIVE_FOREGROUND: ["ICON_FEEDBACK_POSITIVE", "BORDER_FEEDBACK_POSITIVE"],
        INFO_POSITIVE_TEXT: ["TEXT_FEEDBACK_POSITIVE"],
        INFO_HELP_BACKGROUND: ["BACKGROUND_FEEDBACK_INFO"],
        INFO_HELP_FOREGROUND: ["ICON_FEEDBACK_INFO", "BORDER_FEEDBACK_INFO"],
        INFO_HELP_TEXT: ["TEXT_FEEDBACK_INFO"],
        BUTTON_OUTLINE_DANGER_BORDER: ["CONTROL_CRITICAL_SECONDARY_BORDER_DEFAULT"],
        REDESIGN_BUTTON_DANGER_BACKGROUND: ["CONTROL_CRITICAL_PRIMARY_BACKGROUND_DEFAULT"],
        REDESIGN_BUTTON_DESTRUCTIVE_BACKGROUND: ["CONTROL_CRITICAL_PRIMARY_BACKGROUND_DEFAULT"],
        REDESIGN_BUTTON_DESTRUCTIVE_TEXT: ["CONTROL_CRITICAL_PRIMARY_TEXT_DEFAULT"],
        REDESIGN_BUTTON_PRIMARY_TEXT: ["CONTROL_PRIMARY_TEXT_DEFAULT", "CONTROL_BRAND_FOREGROUND", "CONTROL_BRAND_FOREGROUND_NEW"],
        REDESIGN_BUTTON_SECONDARY_TEXT: ["CONTROL_SECONDARY_TEXT_DEFAULT", "MOBILE_LEGACY_BUTTON_SECONDARY_TEXT_DEFAULT"],
        REDESIGN_BUTTON_SECONDARY_PRESSED_BACKGROUND: ["CONTROL_SECONDARY_BACKGROUND_ACTIVE"],
        REDESIGN_BUTTON_SECONDARY_ALT_BACKGROUND: ["CARD_SECONDARY_BACKGROUND_DEFAULT"],
        REDESIGN_BUTTON_SECONDARY_ALT_PRESSED_BACKGROUND: ["CARD_SECONDARY_BACKGROUND_ACTIVE"],
        REDESIGN_BUTTON_ACTIVE_TEXT: ["CONTROL_PRIMARY_TEXT_DEFAULT"],
        REDESIGN_BUTTON_SECONDARY_OVERLAY_BACKGROUND: ["CONTROL_OVERLAY_SECONDARY_BACKGROUND_DEFAULT"],
        REDESIGN_BUTTON_SECONDARY_OVERLAY_TEXT: ["CONTROL_OVERLAY_SECONDARY_TEXT_DEFAULT"],
        POLLS_NORMAL_FILL_HOVER: ["POLLS_VOTED_FILL"]
    };
    // Chat surface tokens whose opacity is multiplied by background.alpha when a theme wallpaper is displayed.
    const CHAT_SURFACE_TOKENS = [
        "CHANNEL_BACKGROUND_DEFAULT",
        "STANDALONE_CHANNEL_CONTENT_BACKGROUND",
        "BACKGROUND_BASE_LOWER",
        "PANEL_BG",
        "MOBILE_TYPING_INDICATOR_BACKGROUND_DEFAULT",
        "MOBILE_KEYBOARD_GAP_BACKGROUND"
    ];
    // Maps Vendetta Theme Plus (plus.icons) status keys to Discord's RawColors (591) and SemanticColors (589) tokens.
    const PLUS_STATUS_ICON_MAP = {
        StatusOnline: {raw:["GREEN_360"], sem:["STATUS_ONLINE", "ICON_STATUS_ONLINE", "TEXT_STATUS_ONLINE"]},
        StatusMobileOnline: {raw:["GREEN_360"], sem:["STATUS_ONLINE", "ICON_STATUS_ONLINE"]},
        StatusIdle: {raw:["YELLOW_300"], sem:["ICON_STATUS_IDLE", "TEXT_STATUS_IDLE"]},
        StatusDND: {raw:["RED_400"], sem:["ICON_STATUS_DND", "TEXT_STATUS_DND"]},
        StatusOffline: {raw:["PRIMARY_400"], sem:["ICON_STATUS_OFFLINE", "TEXT_STATUS_OFFLINE"]},
        StatusStreaming: {raw:["PLATFORM_TWITCH"], sem:[]}
    };
    // Maps Discord's Neutral & Plum raw tokens to the corresponding legacy Primary / Brand / Neutral shades
    // so themes that mainly customize rawColors (PRIMARY_600..800, PRIMARY_100..400, BRAND_500, etc.) also
    // theme Discord 350.8's Mana Neutral/Blurple palette without any runtime indirection.
    const LEGACY_RAW_BRIDGES = [
        ["NEUTRAL_100", ["PLUM_24", "PLUM_23", "PRIMARY_830", "PRIMARY_800", "BLACK"]],
        ["NEUTRAL_96", ["PLUM_23", "PLUM_22", "PRIMARY_800", "PRIMARY_730"]],
        ["NEUTRAL_92", ["PLUM_22", "PLUM_20", "PRIMARY_730", "PRIMARY_700"]],
        ["NEUTRAL_88", ["PLUM_20", "PLUM_19", "PRIMARY_700", "PRIMARY_660"]],
        ["NEUTRAL_86", ["PLUM_20", "PLUM_18", "PRIMARY_600", "PRIMARY_630"]],
        ["NEUTRAL_82", ["PLUM_19", "PLUM_17", "PRIMARY_630", "PRIMARY_660"]],
        ["NEUTRAL_79", ["PLUM_18", "PLUM_17", "PRIMARY_630", "PRIMARY_660", "PRIMARY_600"]],
        ["NEUTRAL_76", ["PLUM_17", "PLUM_16", "PRIMARY_660", "PRIMARY_630"]],
        ["NEUTRAL_73", ["PLUM_16", "PLUM_15", "PRIMARY_660", "PRIMARY_700"]],
        ["NEUTRAL_69", ["PRIMARY_600", "PLUM_18"]],
        ["NEUTRAL_66", ["PRIMARY_630", "PLUM_17"]],
        ["NEUTRAL_64", ["PRIMARY_630", "PRIMARY_660", "PLUM_16"]],
        ["NEUTRAL_60", ["PRIMARY_560", "PRIMARY_600", "PLUM_15"]],
        ["NEUTRAL_35", ["PLUM_11", "PLUM_10", "PRIMARY_360", "PRIMARY_400"]],
        ["NEUTRAL_31", ["PLUM_11", "PRIMARY_400"]],
        ["NEUTRAL_29", ["PLUM_10", "PLUM_11", "PRIMARY_360", "PRIMARY_400"]],
        ["NEUTRAL_23", ["PLUM_9", "PLUM_10", "PRIMARY_330", "PRIMARY_360"]],
        ["NEUTRAL_16", ["PRIMARY_300", "PLUM_9"]],
        ["NEUTRAL_12", ["PLUM_6", "PRIMARY_200", "PRIMARY_100"]],
        ["NEUTRAL_10", ["PLUM_6", "PLUM_3", "PRIMARY_100", "PRIMARY_200"]],
        ["NEUTRAL_8", ["PLUM_6", "PRIMARY_200"]],
        ["NEUTRAL_5", ["PLUM_4", "PLUM_3", "PRIMARY_200", "PRIMARY_100"]],
        ["NEUTRAL_4", ["PRIMARY_160", "PRIMARY_200", "PLUM_3"]],
        ["NEUTRAL_2", ["PLUM_3", "PRIMARY_100", "WHITE_500", "WHITE"]],
        ["NEUTRAL_1", ["PRIMARY_100", "WHITE_500", "WHITE"]],
        ["BLURPLE_50", ["BRAND_500", "BRAND_560"]],
        ["BLURPLE_36", ["BRAND_360", "BRAND_500"]],
        ["BLURPLE_26", ["BRAND_260", "BRAND_360"]],
        ["BLURPLE_19", ["BRAND_260", "BRAND_360", "BRAND_500"]],
        ["BLUE_NEW_37", ["BLUE_345", "BLUE_330", "BRAND_260"]]
    ];
    const THEME_BG_WRAP_STYLE = {flex:1};
    const THEME_BG_LAYER_STYLE = {position:"absolute", top:0, left:0, right:0, bottom:0};
    const customThemes = {
        rawTable:null, origRaw:null, semTable:null, origSem:null, expTable:null, origExp:null, themeStore:null, themeContextMod:null,
        list:[], active:"", loaded:false, loading:false, installing:false, error:"", revision:0, editCounter:0, appliedKey:""
    };
    function parseAlphaValue(rawAlpha) {
        if (rawAlpha === undefined || rawAlpha === null || rawAlpha === "") return 1;
        const s = String(rawAlpha).trim();
        const a = s.endsWith("%") ? parseFloat(s) / 100 : parseFloat(s);
        if (!Number.isFinite(a)) return null;
        return Math.max(0, Math.min(1, a));
    }
    // Accepts #rgb, #rgba, #rrggbb, #rrggbbaa (with or without leading # for 6/8-digit hex), or
    // rgb()/rgba()/hsl()/hsla() strings and converts them to {hex:"#rrggbb", opacity:0..1} once at theme compile
    // time so Discord's chroma/color tables never see malformed strings.
    // Themes repeat the same few dozen colors hundreds of times; each distinct string is parsed once. Results are
    // frozen because callers share them.
    const parsedColorCache = new Map();
    function parseThemeColor(value) {
        if (typeof value !== "string") return null;
        let hit = parsedColorCache.get(value);
        if (hit !== undefined) return hit;
        hit = parseThemeColorUncached(value);
        if (hit) Object.freeze(hit);
        if (parsedColorCache.size > 4096) parsedColorCache.clear();
        parsedColorCache.set(value, hit);
        return hit;
    }
    const HEX6_CLEAN_RE = /^#[0-9a-f]{6}$/;
    const HEX8_CLEAN_RE = /^#[0-9a-f]{8}$/;
    const WHITESPACE_RE = /\s/;
    function parseThemeColorUncached(value) {
        const len = value.length;
        if (len === 7 && value.charCodeAt(0) === 35 && HEX6_CLEAN_RE.test(value)) return {hex:value, opacity:1};
        if (len === 9 && value.charCodeAt(0) === 35 && HEX8_CLEAN_RE.test(value)) {
            const aFast = parseInt(value.slice(7, 9), 16) / 255;
            return {hex:value.slice(0, 7), opacity:Math.round(aFast * 10000) / 10000};
        }
        const s = value.trim();
        if (!s) return null;
        // Hex and keywords never contain spaces, so a value that a theme author wrapped across lines
        // ("#66006\n\n64d") or wrote as "#transparent" still reads as the color they meant.
        const compact = WHITESPACE_RE.test(s) ? s.replace(/\s+/g, "") : s;
        if (/^#?transparent$/i.test(compact)) return {hex:"#000000", opacity:0};
        let m = /^#([0-9a-f]{3,8})$/i.exec(compact) || /^([0-9a-f]{6}|[0-9a-f]{8})$/i.exec(compact);
        if (m) {
            const hex = m[1].toLowerCase();
            if (hex.length === 3) return {hex:"#" + hex[0] + hex[0] + hex[1] + hex[1] + hex[2] + hex[2], opacity:1};
            if (hex.length === 4) {
                const a = parseInt(hex[3] + hex[3], 16) / 255;
                return {hex:"#" + hex[0] + hex[0] + hex[1] + hex[1] + hex[2] + hex[2], opacity:Math.round(a * 10000) / 10000};
            }
            if (hex.length === 6) return {hex:"#" + hex, opacity:1};
            if (hex.length === 8) {
                const a = parseInt(hex.slice(6, 8), 16) / 255;
                return {hex:"#" + hex.slice(0, 6), opacity:Math.round(a * 10000) / 10000};
            }
            return null;
        }
        m = /^rgba?\(\s*([0-9.]+%?)\s*(?:,\s*|\s+)([0-9.]+%?)\s*(?:,\s*|\s+)([0-9.]+%?)(?:\s*[,/]\s*([0-9.]+%?))?\s*\)$/i.exec(s);
        if (m) {
            const chan = part => {
                const v = part.endsWith("%") ? parseFloat(part) * 2.55 : parseFloat(part);
                return Math.max(0, Math.min(255, Math.round(v))).toString(16).padStart(2, "0");
            };
            const a = parseAlphaValue(m[4]);
            if (a === null) return null;
            return {hex:"#" + chan(m[1]) + chan(m[2]) + chan(m[3]), opacity:Math.round(a * 10000) / 10000};
        }
        m = /^hsla?\(\s*(-?[0-9.]+)(?:deg)?\s*(?:,\s*|\s+)([0-9.]+)%\s*(?:,\s*|\s+)([0-9.]+)%(?:\s*[,/]\s*([0-9.]+%?))?\s*\)$/i.exec(s);
        if (m) {
            const h = (((parseFloat(m[1]) % 360) + 360) % 360) / 360;
            const sat = Math.max(0, Math.min(1, parseFloat(m[2]) / 100));
            const lig = Math.max(0, Math.min(1, parseFloat(m[3]) / 100));
            const a = parseAlphaValue(m[4]);
            if (a === null) return null;
            const q = lig < 0.5 ? lig * (1 + sat) : lig + sat - lig * sat;
            const p = 2 * lig - q;
            const hue2rgb = t => {
                if (t < 0) t += 1;
                if (t > 1) t -= 1;
                if (t < 1 / 6) return p + (q - p) * 6 * t;
                if (t < 1 / 2) return q;
                if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;
                return p;
            };
            const toHex = c => Math.max(0, Math.min(255, Math.round(c * 255))).toString(16).padStart(2, "0");
            const r = sat === 0 ? lig : hue2rgb(h + 1 / 3);
            const g = sat === 0 ? lig : hue2rgb(h);
            const b = sat === 0 ? lig : hue2rgb(h - 1 / 3);
            return {hex:"#" + toHex(r) + toHex(g) + toHex(b), opacity:Math.round(a * 10000) / 10000};
        }
        return null;
    }
    function formatThemeColor(parsed) {
        return parsed.opacity < 1 ? parsed.hex + Math.round(parsed.opacity * 255).toString(16).padStart(2, "0") : parsed.hex;
    }
    function normalizeThemeUrl(input) {
        if (typeof input !== "string") return "";
        let url = input.trim();
        if (!/^https?:\/\//i.test(url)) return "";
        // Convert GitHub blob links and Gist page links to their raw JSON URLs automatically.
        url = url.replace(/^https?:\/\/github\.com\/([^/]+)\/([^/]+)\/blob\/(.+)$/i, "https://raw.githubusercontent.com/$1/$2/$3");
        url = url.replace(/^https?:\/\/gist\.github\.com\/([^/]+)\/([0-9a-f]+)\/?$/i, "https://gist.githubusercontent.com/$1/$2/raw");
        return url;
    }
    function sanitizeThemeBackground(bgIn) {
        if (!bgIn || typeof bgIn !== "object" || Array.isArray(bgIn)) return null;
        const url = typeof bgIn.url === "string" && /^https?:\/\/\S+/i.test(bgIn.url.trim()) ? bgIn.url.trim().slice(0, 1024) : "";
        const colorParsed = parseThemeColor(bgIn.color);
        const color = colorParsed ? formatThemeColor(colorParsed) : "";
        if (!url && !color) return null;
        const rawAlpha = Number(bgIn.alpha);
        const alpha = Number.isFinite(rawAlpha) ? Math.max(0, Math.min(1, Number(rawAlpha.toFixed(4)))) : 1;
        const rawBlur = Number(bgIn.blur);
        const blur = Number.isFinite(rawBlur) ? Math.max(0, Math.min(1, Number(rawBlur.toFixed(4)))) : 0;
        const out = {url, alpha, blur};
        if (color) out.color = color;
        return out;
    }
    function sanitizeThemePlus(plusIn) {
        if (!plusIn || typeof plusIn !== "object" || Array.isArray(plusIn)) return null;
        const out = {};
        let hasAny = false;
        for (const key of ["mentionLineColor", "unreadBadgeColor"]) {
            const v = plusIn[key];
            const str = Array.isArray(v) ? v[0] : v;
            const parsed = parseThemeColor(str);
            if (parsed) { out[key] = formatThemeColor(parsed); hasAny = true; }
        }
        const iconsIn = plusIn.icons;
        if (iconsIn && typeof iconsIn === "object" && !Array.isArray(iconsIn)) {
            const icons = {};
            for (const rawKey of Object.keys(iconsIn)) {
                const key = rawKey.trim();
                if (!/^[A-Za-z0-9_-]{1,80}$/.test(key)) continue;
                const v = iconsIn[rawKey];
                const arr = Array.isArray(v) ? v : typeof v === "string" ? [v] : null;
                if (!arr || !arr.length) continue;
                const cleaned = arr.slice(0, 4).map(item => {
                    const p = parseThemeColor(item);
                    return p ? formatThemeColor(p) : null;
                });
                if (cleaned.some(Boolean)) { icons[key] = cleaned; hasAny = true; }
            }
            if (Object.keys(icons).length) out.icons = icons;
        }
        if (typeof plusIn.iconpack === "string" && plusIn.iconpack.trim()) {
            out.iconpack = normalizeIconPackId(plusIn.iconpack.trim().slice(0, 120));
            hasAny = true;
        }
        if (plusIn.customOverlays === true) { out.customOverlays = true; hasAny = true; }
        return hasAny ? out : null;
    }
    function sanitizeThemeSpec(data, sourceUrl) {
        if (!data || typeof data !== "object" || Array.isArray(data)) throw new Error(tr("That link didn't return a JSON theme."));
        const rawIn = data.rawColors && typeof data.rawColors === "object" && !Array.isArray(data.rawColors) ? data.rawColors : {};
        const semIn = data.semanticColors && typeof data.semanticColors === "object" && !Array.isArray(data.semanticColors) ? data.semanticColors : {};
        const rawColors = {}, semanticColors = {};
        let count = 0;
        // "INTERACTIVE_NORMAL " with a stray space is the same key; an exact spelling elsewhere in the file wins.
        const tidyKey = (key, table) => {
            const k = typeof key === "string" ? key.trim() : "";
            if (!/^[A-Z0-9_]{1,80}$/.test(k)) return "";
            return k !== key && Object.prototype.hasOwnProperty.call(table, k) ? "" : k;
        };
        for (const rawKey of Object.keys(rawIn)) {
            const key = tidyKey(rawKey, rawIn);
            if (!key) continue;
            const parsed = parseThemeColor(rawIn[rawKey]);
            if (parsed) { rawColors[key] = formatThemeColor(parsed); count++; }
        }
        for (const rawKey of Object.keys(semIn)) {
            const key = tidyKey(rawKey, semIn);
            if (!key) continue;
            const val = semIn[rawKey];
            const arr = Array.isArray(val) ? val : typeof val === "string" ? [val] : null;
            if (!arr || !arr.length) continue;
            const cleaned = arr.slice(0, 4).map(v => {
                if (typeof v !== "string") return null;
                const parsed = parseThemeColor(v);
                return parsed ? formatThemeColor(parsed) : null;
            });
            if (cleaned.some(Boolean)) { semanticColors[key] = cleaned; count++; }
        }
        const background = sanitizeThemeBackground(data.background);
        const plus = sanitizeThemePlus(data.plus);
        if (background) count++;
        if (plus) count++;
        if (!count) throw new Error(tr("That JSON file has no semanticColors or rawColors."));
        let name = typeof data.name === "string" ? data.name.trim().slice(0, 80) : "";
        if (!name && typeof sourceUrl === "string") {
            const tail = sourceUrl.split(/[?#]/)[0].split("/").filter(Boolean).pop() || "";
            name = decodeURIComponent(tail.replace(/\.json$/i, "")).slice(0, 80);
        }
        if (!name) name = tr("Custom theme");
        const description = typeof data.description === "string" ? data.description.trim().slice(0, 200) : "";
        const authors = Array.isArray(data.authors) ? data.authors.map(a => a && typeof a.name === "string" ? a.name.trim() : typeof a === "string" ? a.trim() : "").filter(Boolean).slice(0, 5).join(", ").slice(0, 100) : "";
        const spec = {
            id: sourceUrl || ("theme:" + name.toLowerCase()),
            url: typeof sourceUrl === "string" ? sourceUrl : "",
            name,
            description,
            authors,
            rawColors,
            semanticColors
        };
        if (background) spec.background = background;
        if (plus) spec.plus = plus;
        return spec;
    }
    function snapshotColorTables() {
        if (customThemes.rawTable && !customThemes.origRaw) {
            customThemes.origRaw = Object.assign({}, customThemes.rawTable);
        }
        if (customThemes.semTable && !customThemes.origSem) {
            const copy = {}, sem = customThemes.semTable;
            for (const k in sem) {
                if (!owns(sem, k)) continue;
                const entry = sem[k];
                if (!entry || typeof entry !== "object") continue;
                const snap = {};
                for (let i = 0; i < THEME_SLOTS.length; i++) {
                    const slot = THEME_SLOTS[i], sObj = entry[slot];
                    if (sObj && typeof sObj === "object")
                        snap[slot] = {raw:sObj.raw, opacity:sObj.opacity};
                }
                if ("gradient" in entry) snap.gradient = entry.gradient;
                if ("userProfileThemes" in entry) snap.userProfileThemes = entry.userProfileThemes;
                copy[k] = snap;
            }
            customThemes.origSem = copy;
        }
        // SemanticColorExperiments (590): {token: {experiment: {theme: {raw, opacity}}}}. resolveSemanticColor (587)
        // reads it before SemanticColors whenever an experiment like mobile-visual-refresh is on.
        if (customThemes.expTable && !customThemes.origExp) {
            const copy = [];
            eachExperimentSlot((token, slot) => copy.push([slot, slot.raw, slot.opacity]));
            customThemes.origExp = copy;
        }
    }
    function eachExperimentSlot(fn) {
        const table = customThemes.expTable;
        if (!table || typeof table !== "object") return;
        for (const token in table) {
            if (!owns(table, token)) continue;
            const byExperiment = table[token];
            if (!byExperiment || typeof byExperiment !== "object") continue;
            for (const experiment in byExperiment) {
                if (!owns(byExperiment, experiment)) continue;
                const byTheme = byExperiment[experiment];
                if (!byTheme || typeof byTheme !== "object") continue;
                for (let i = 0; i < THEME_SLOTS.length; i++) {
                    const theme = THEME_SLOTS[i], slot = byTheme[theme];
                    if (slot && typeof slot === "object") fn(token, slot, theme);
                }
            }
        }
    }
    // Every write compile makes is journaled, so turning a theme off or switching themes undoes only the ~200 keys
    // it touched instead of walking all 1707 raw colors and 414 tokens (that full walk was two thirds of a switch).
    function restoreOriginalColorTables(keepSynthetic) {
        const journal = customThemes.journal;
        if (journal && customThemes.origRaw && customThemes.origSem) {
            const raw = customThemes.rawTable, sem = customThemes.semTable, origRaw = customThemes.origRaw, origSem = customThemes.origSem;
            // When one theme replaces another, synthetic __VENUS_ keys stay for the next theme to overwrite in place
            // (nothing reads them once their tokens point back at Discord's keys). Turning themes off removes them.
            const kept = [];
            journal.raw.forEach(k => {
                if (owns(origRaw, k)) raw[k] = origRaw[k];
                else if (keepSynthetic && k.startsWith("__VENUS_")) kept.push(k);
                else delete raw[k];
            });
            journal.sem.forEach(k => {
                const entry = sem[k], snap = origSem[k];
                if (!entry || !snap) return;
                for (let i = 0; i < THEME_SLOTS.length; i++) {
                    const slot = THEME_SLOTS[i], sn = snap[slot], en = entry[slot];
                    if (sn && en && typeof en === "object") { en.raw = sn.raw; en.opacity = sn.opacity; }
                    else if (sn) entry[slot] = {raw:sn.raw, opacity:sn.opacity};
                }
            });
            journal.raw.clear();
            for (let i = 0; i < kept.length; i++) journal.raw.add(kept[i]);
            journal.sem.clear();
            if (journal.exp) {
                for (let i = 0; i < journal.exp.length; i += 3) {
                    const s = journal.exp[i]; s.raw = journal.exp[i + 1]; s.opacity = journal.exp[i + 2];
                }
                journal.exp.length = 0;
            } else if (customThemes.origExp) customThemes.origExp.forEach(([slot, raw, opacity]) => { slot.raw = raw; slot.opacity = opacity; });
            return;
        }
        if (customThemes.rawTable && customThemes.origRaw) {
            for (const k of Object.keys(customThemes.rawTable)) {
                if (k.startsWith("__VENUS_")) delete customThemes.rawTable[k];
            }
            Object.assign(customThemes.rawTable, customThemes.origRaw);
        }
        if (customThemes.semTable && customThemes.origSem) {
            const origSem = customThemes.origSem;
            for (const k in origSem) {
                if (!owns(origSem, k)) continue;
                const entry = customThemes.semTable[k], snap = origSem[k];
                if (!entry || !snap) continue;
                for (let i = 0; i < THEME_SLOTS.length; i++) {
                    const slot = THEME_SLOTS[i], sn = snap[slot];
                    if (sn) {
                        if (entry[slot] && typeof entry[slot] === "object") {
                            entry[slot].raw = sn.raw;
                            entry[slot].opacity = sn.opacity;
                        } else entry[slot] = {raw:sn.raw, opacity:sn.opacity};
                    }
                }
                if ("gradient" in snap) entry.gradient = snap.gradient;
                if ("userProfileThemes" in snap) entry.userProfileThemes = snap.userProfileThemes;
            }
        }
        if (customThemes.origExp) customThemes.origExp.forEach(([slot, raw, opacity]) => { slot.raw = raw; slot.opacity = opacity; });
        if (customThemes.origRaw && customThemes.origSem) customThemes.journal = {raw:new Set(), sem:new Set(), exp:[]};
    }
    function compileThemeIntoTables(theme) {
        const rawTable = customThemes.rawTable, sem = customThemes.semTable;
        if (!rawTable || !sem) return;
        snapshotColorTables();
        if (customThemes.journal && (customThemes.journal.rawTable !== rawTable || customThemes.journal.semTable !== sem)) customThemes.journal = null;
        restoreOriginalColorTables(!!theme);
        if (!theme) return;
        const journal = customThemes.journal;
        if (journal) { journal.rawTable = rawTable; journal.semTable = sem; }
        const touchedRaw = journal ? journal.raw : new Set(), touchedSem = journal ? journal.sem : new Set();
        const setRaw = (k, v) => { touchedRaw.add(k); rawTable[k] = v; };
        const rawIn = theme.rawColors || {}, semIn = theme.semanticColors || {}, plus = theme.plus, bg = theme.background;
        // 1. Apply rawColors directly onto Discord's RawColors table (hex only; alpha is carried on semantic slots).
        for (const key in rawIn) {
            if (!owns(rawIn, key)) continue;
            const parsed = parseThemeColor(rawIn[key]);
            if (parsed) setRaw(key, parsed.hex);
        }
        // 2. Bridge legacy PRIMARY / PLUM / BRAND raw colors to Discord 350.8's NEUTRAL / BLURPLE raw tokens
        // whenever the theme didn't already set the NEUTRAL / BLURPLE key directly.
        for (let i = 0; i < LEGACY_RAW_BRIDGES.length; i++) {
            const target = LEGACY_RAW_BRIDGES[i][0], sources = LEGACY_RAW_BRIDGES[i][1];
            if (rawIn[target]) continue;
            for (let j = 0; j < sources.length; j++) {
                const src = sources[j];
                if (rawIn[src]) {
                    const parsed = parseThemeColor(rawIn[src]);
                    if (parsed) { setRaw(target, parsed.hex); break; }
                }
            }
        }
        // 3. Apply semanticColors onto Discord's SemanticColors table.
        // Helper that writes a parsed color into a SemanticColors[targetKey] entry across all 4 theme slots.
        // Revenge semanticColors arrays are [dark, light, amoled/midnight]:
        // - dark & darker (Ash) use index 0
        // - light uses index 1 (or falls back to index 0 when the theme is single-palette)
        // - midnight (Onyx) uses index 2 (or falls back to index 0)
        const directWritten = new Set();
        function writeSemanticTarget(targetKey, arr, isDirect) {
            const entry = sem[targetKey];
            if (!entry || typeof entry !== "object") return;
            if (!isDirect && directWritten.has(targetKey)) return;
            if (isDirect) directWritten.add(targetKey);
            touchedSem.add(targetKey);
            // A slot the array doesn't reach (single-palette themes) borrows index 0. A slot the theme wrote as
            // false (stored as null) means "keep Discord's color here", as in Revenge: [false, false, "#fff"]
            // only recolors Onyx.
            const len = arr.length;
            const c0 = parseThemeColor(arr[0]);
            const c1 = len > 1 ? parseThemeColor(arr[1]) : c0;
            const c2 = len > 2 ? parseThemeColor(arr[2]) : c0;
            const c3 = len > 3 ? parseThemeColor(arr[3]) : c0;
            const orig = isDirect && customThemes.origSem && customThemes.origSem[targetKey];
            const prefix = "__VENUS_" + targetKey + "_";
            for (let i = 0; i < 4; i++) {
                const slot = THEME_SLOTS[i];
                const picked = i === 0 ? c0 : i === 1 ? c1 : i === 2 ? c3 : c2;
                if (!picked) {
                    // The theme's own key said false here: undo any legacy alias that reached this slot first.
                    if (orig && orig[slot] && entry[slot] && typeof entry[slot] === "object") {
                        entry[slot].raw = orig[slot].raw;
                        entry[slot].opacity = orig[slot].opacity;
                    }
                    continue;
                }
                const syntheticKey = prefix + slot;
                setRaw(syntheticKey, picked.hex);
                if (entry[slot] && typeof entry[slot] === "object") {
                    entry[slot].raw = syntheticKey;
                    entry[slot].opacity = picked.opacity;
                } else entry[slot] = {raw:syntheticKey, opacity:picked.opacity};
            }
        }
        // First pass: aliases (so explicit Mana semantic keys in the same theme win over legacy aliases). When two
        // legacy keys feed one token, the key that names it more exactly wins (its alias list puts the token
        // earlier), not whichever key the theme happened to write last: CHAT_BACKGROUND over BACKGROUND_PRIMARY
        // for the chat surface, KEYBOARD over BACKGROUND_PRIMARY for the keyboard gap.
        const aliasRank = new Map();
        for (const key in semIn) {
            if (!owns(semIn, key)) continue;
            const arr = semIn[key];
            if (!Array.isArray(arr) || !arr.length || sem[key]) continue;
            const targets = LEGACY_SEMANTIC_ALIASES[key];
            if (!targets) continue;
            for (let i = 0; i < targets.length; i++) {
                const was = aliasRank.get(targets[i]);
                if (!was || i < was.rank || i === was.rank && targets.length < was.width) aliasRank.set(targets[i], {rank:i, width:targets.length, arr});
            }
        }
        aliasRank.forEach((pick, target) => writeSemanticTarget(target, pick.arr, false));
        // Second pass: direct Mana semantic keys.
        for (const key in semIn) {
            if (!owns(semIn, key)) continue;
            const arr = semIn[key];
            if (!Array.isArray(arr) || !arr.length) continue;
            if (sem[key]) writeSemanticTarget(key, arr, true);
        }
        // 4. Apply declarative Vendetta Theme Plus (plus) extensions into the native token tables.
        if (plus && typeof plus === "object") {
            if (plus.mentionLineColor) {
                const mc = parseThemeColor(plus.mentionLineColor);
                if (mc && sem.BACKGROUND_MENTIONED_FEEDBACK) writeSemanticTarget("BACKGROUND_MENTIONED_FEEDBACK", [formatThemeColor(mc)], false);
                if (mc && !semIn.BACKGROUND_MENTIONED && !semIn.MESSAGE_MENTIONED_BACKGROUND_DEFAULT) {
                    const tint = {hex:mc.hex, opacity:Math.round(Math.min(0.25, mc.opacity * 0.16) * 10000) / 10000};
                    writeSemanticTarget("MESSAGE_MENTIONED_BACKGROUND_DEFAULT", [formatThemeColor(tint)], false);
                }
            }
            if (plus.unreadBadgeColor) {
                writeSemanticTarget("CHANNEL_UNREAD_PILL_CAP_BG", [plus.unreadBadgeColor], false);
                writeSemanticTarget("MOBILE_CHAT_NEW_MESSAGE_BORDER", [plus.unreadBadgeColor], false);
                writeSemanticTarget("MOBILE_CHAT_NEW_MESSAGE_TEXT", [plus.unreadBadgeColor], false);
            }
            if (plus.icons && typeof plus.icons === "object") {
                for (const iconKey in PLUS_STATUS_ICON_MAP) {
                    if (!owns(PLUS_STATUS_ICON_MAP, iconKey)) continue;
                    const arr = plus.icons[iconKey];
                    if (!Array.isArray(arr) || !arr.length) continue;
                    const mapping = PLUS_STATUS_ICON_MAP[iconKey];
                    const first = parseThemeColor(arr[0]);
                    if (first) for (let i = 0; i < mapping.raw.length; i++) setRaw(mapping.raw[i], first.hex);
                    for (let i = 0; i < mapping.sem.length; i++) writeSemanticTarget(mapping.sem[i], arr, false);
                }
            }
        }
        // 5. Apply background color & wallpaper alpha to chat surfaces when background image is enabled.
        if (bg && typeof bg === "object") {
            const showBg = !!settings.customThemesBackground;
            if (bg.color && !semIn.CHAT_BACKGROUND && !semIn.CHANNEL_BACKGROUND_DEFAULT && !semIn.BACKGROUND_PRIMARY && !semIn.BACKGROUND_MOBILE_PRIMARY && !semIn.BG_BASE_PRIMARY) {
                for (let i = 0; i < CHAT_SURFACE_TOKENS.length; i++) writeSemanticTarget(CHAT_SURFACE_TOKENS[i], [bg.color], false);
            }
            if (showBg && bg.url && Number.isFinite(bg.alpha) && bg.alpha < 1) {
                const alpha = Math.max(0, Math.min(1, bg.alpha));
                for (let i = 0; i < CHAT_SURFACE_TOKENS.length; i++) {
                    const entry = sem[CHAT_SURFACE_TOKENS[i]];
                    if (!entry || typeof entry !== "object") continue;
                    touchedSem.add(CHAT_SURFACE_TOKENS[i]);
                    for (let j = 0; j < THEME_SLOTS.length; j++) {
                        const s = entry[THEME_SLOTS[j]];
                        if (s && typeof s === "object") {
                            const cur = Number.isFinite(s.opacity) ? s.opacity : 1;
                            s.opacity = Math.round(cur * alpha * 10000) / 10000;
                        }
                    }
                }
            }
        }
        // 6. An experiment override (590) would win over a themed token, so it follows every token the theme changed.
        // Only tokens in touchedSem can differ from origSem, so index expTable[token] directly instead of walking all ~400 tokens.
        const expTable = customThemes.expTable, expJournal = journal && journal.exp;
        if (expTable && typeof expTable === "object") touchedSem.forEach(token => {
            const byExperiment = expTable[token], semEntry = sem[token], wasEntry = customThemes.origSem && customThemes.origSem[token];
            if (!byExperiment || typeof byExperiment !== "object" || !semEntry || !wasEntry) return;
            for (const experiment in byExperiment) {
                if (!owns(byExperiment, experiment)) continue;
                const byTheme = byExperiment[experiment];
                if (!byTheme || typeof byTheme !== "object") continue;
                for (let i = 0; i < THEME_SLOTS.length; i++) {
                    const theme = THEME_SLOTS[i];
                    const slot = byTheme[theme], themed = semEntry[theme], was = wasEntry[theme];
                    if (slot && typeof slot === "object" && themed && was && (themed.raw !== was.raw || themed.opacity !== was.opacity)) {
                        if (expJournal) expJournal.push(slot, slot.raw, slot.opacity);
                        slot.raw = themed.raw; slot.opacity = themed.opacity;
                    }
                }
            }
        });
    }
    function customThemesActiveEntry() {
        if (!enabled("customThemes") || !customThemes.active) return null;
        return customThemes.list.find(t => t && t.id === customThemes.active) || null;
    }
    function customThemesBumpFallbackContextKey() {
        const mod = customThemes.themeContextMod || (customThemes.themeContextMod = global.__r && global.__r(4831));
        const fb = mod && mod.FALLBACK_THEME_CONTEXT_VALUE;
        if (fb && typeof fb === "object" && typeof fb.key === "string") {
            const base = fb.key.split("#v")[0];
            try { fb.key = customThemes.revision > 0 ? base + "#v" + customThemes.revision : base; } catch (_) {}
        }
    }
    function customThemesApply() {
        if (!customThemes.rawTable || !customThemes.semTable) {
            const m592 = global.__r && global.__r(591);
            const m590 = global.__r && global.__r(589);
            if (m592 && m592._private && m592._private.RawColors) customThemes.rawTable = m592._private.RawColors;
            if (m590 && m590._private && m590._private.SemanticColors) customThemes.semTable = m590._private.SemanticColors;
            const mExp = global.__r && global.__r(590);
            if (!customThemes.expTable && mExp && mExp._private && mExp._private.SemanticColorExperiments) customThemes.expTable = mExp._private.SemanticColorExperiments;
        }
        if (!customThemes.rawTable || !customThemes.semTable) return;
        const active = customThemesActiveEntry();
        const nextKey = active ? active.id + ":" + customThemes.editCounter + ":" + (settings.customThemesBackground ? "1" : "0") : "";
        if (nextKey === customThemes.appliedKey && (nextKey !== "" || customThemes.origRaw)) return;
        customThemes.appliedKey = nextKey;
        compileThemeIntoTables(active);
        customThemes.revision++;
        customThemesBumpFallbackContextKey();
        // Notify ThemeStore (1205) so RootThemeContextProvider re-evaluates createThemedContext (4831) with the new
        // revision key, invalidating createStyles (5092) and useToken (4818) caches once and keeping O(1) lookups.
        const store = customThemes.themeStore || (customThemes.themeStore = inspectedExport(1205, "default"));
        try { if (store && typeof store.emitChange === "function") store.emitChange(); } catch (_) {}
        if (features.iconPacks && enabled("iconPacks")) iconPacksApply();
        notify("customThemes");
    }
    function hookRawColorsModule(exports) {
        const raw = exports && exports._private && exports._private.RawColors;
        if (raw && typeof raw === "object") {
            customThemes.rawTable = raw;
            snapshotColorTables();
            if (customThemes.semTable && enabled("customThemes")) customThemesApply();
        }
        return exports;
    }
    function hookSemanticColorsModule(exports) {
        const sem = exports && exports._private && exports._private.SemanticColors;
        if (sem && typeof sem === "object") {
            customThemes.semTable = sem;
            snapshotColorTables();
            if (customThemes.rawTable && enabled("customThemes")) customThemesApply();
        }
        return exports;
    }
    function hookExperimentColorsModule(exports) {
        const table = exports && exports._private && exports._private.SemanticColorExperiments;
        if (table && typeof table === "object") {
            customThemes.expTable = table;
            if (customThemes.rawTable && customThemes.semTable) {
                snapshotColorTables();
                if (enabled("customThemes")) { customThemes.appliedKey = null; customThemesApply(); }
            }
        }
        return exports;
    }
    // Discord's root providers (11191) build the theme context once and keep it in a memo keyed on theme, flags and
    // so on, never on our revision. Re-keying the value they hand down makes createStyles and useToken read fresh.
    function rootThemeContextProvider(orig, self, args) {
        if (features.customThemes) useSettings("customThemes");
        if (features.iconPacks) useSettings("iconPacks");
        const tree = orig.apply(self, args);
        if (customThemes.revision <= 0 || !tree || !tree.props || !tree.props.value || typeof tree.props.value.key !== "string") return tree;
        const value = tree.props.value, key = value.key.split("#v")[0] + "#v" + customThemes.revision;
        return value.key === key ? tree : React.cloneElement(tree, {value:Object.assign({}, value, {key})});
    }
    function hookCreateThemedContext(exports) {
        if (!exports) return exports;
        customThemes.themeContextMod = exports;
        customThemesBumpFallbackContextKey();
        if (typeof exports.createThemedContext !== "function") return exports;
        return hookExport(exports, "createThemedContext", function (orig, self, args) {
            const ctx = orig.apply(self, args);
            if (customThemes.revision > 0 && ctx && typeof ctx.key === "string")
                ctx.key = ctx.key.split("#v")[0] + "#v" + customThemes.revision;
            return ctx;
        });
    }
    function chatViewWrapperThemeBackground(orig, self, args) {
        useSettings("customThemes");
        const tree = orig.apply(self, args);
        if (!enabled("customThemes") || !settings.customThemesBackground || !React || !RN || !RN.Image || !tree) return tree;
        const active = customThemesActiveEntry();
        const bg = active && active.background;
        if (!bg || !bg.url) return tree;
        const blur = Number.isFinite(bg.blur) && bg.blur > 0 ? Math.round(bg.blur * 25) : 0;
        const bgColor = bg.color ? (parseThemeColor(bg.color) || {}).hex : undefined;
        return el(RN.View, {style:bgColor ? [THEME_BG_WRAP_STYLE, {backgroundColor:bgColor}] : THEME_BG_WRAP_STYLE},
            el(RN.Image, {
                pointerEvents:"none",
                source:{uri:bg.url},
                resizeMode:"cover",
                blurRadius:blur,
                fadeDuration:0,
                style:THEME_BG_LAYER_STYLE
            }),
            tree);
    }
    function customThemesPersist() {
        if (!files || !customThemes.loaded) return;
        const payload = JSON.stringify({version:1, active:customThemes.active || "", themes:customThemes.list.slice(0, THEMES_MAX)});
        if (payload.length > THEMES_MAX_BYTES) return;
        Promise.resolve().then(() => files.writeFile("documents", THEMES_FILE, payload, "utf8")).catch(() => {});
    }
    function customThemesRestore() {
        if (customThemes.loaded || customThemes.loading || !files) return;
        let constants;
        try { constants = typeof files.getConstants === "function" ? files.getConstants() : files; } catch (_) { constants = {}; }
        const dir = constants && constants.DocumentsDirPath;
        if (typeof dir !== "string") { customThemes.loaded = true; return; }
        const path = dir.replace(/\/$/, "") + "/" + THEMES_FILE;
        customThemes.loading = true;
        Promise.resolve().then(() => files.fileExists(path)).then(exists => exists ? files.readFile(path, "utf8") : null).then(text => {
            if (text && text.length <= THEMES_MAX_BYTES) {
                const parsed = JSON.parse(text);
                if (parsed && typeof parsed === "object" && Array.isArray(parsed.themes)) {
                    const loadedList = [];
                    parsed.themes.slice(0, THEMES_MAX).forEach(item => {
                        try {
                            const clean = sanitizeThemeSpec(item, item && typeof item.url === "string" ? item.url : item && typeof item.id === "string" ? item.id : "");
                            if (item && typeof item.id === "string" && item.id) clean.id = item.id;
                            if (!loadedList.some(x => x.id === clean.id)) loadedList.push(clean);
                        } catch (_) {}
                    });
                    if (!customThemes.list.length) customThemes.list = loadedList;
                    if (!customThemes.active && typeof parsed.active === "string" && customThemes.list.some(t => t.id === parsed.active))
                        customThemes.active = parsed.active;
                }
            }
        }).catch(() => {}).then(() => {
            customThemes.loading = false;
            customThemes.loaded = true;
            if (enabled("customThemes")) customThemesApply();
            notify("customThemes");
        });
    }
    function customThemesInstallFromUrl(rawUrl, onDone) {
        const url = normalizeThemeUrl(rawUrl);
        if (!url) {
            customThemes.error = tr("Enter a valid https:// or http:// link to a theme .json file.");
            notify("customThemes");
            return Promise.resolve(false);
        }
        if (typeof global.fetch !== "function") {
            customThemes.error = tr("Can't reach the internet right now. Try again in a moment.");
            notify("customThemes");
            return Promise.resolve(false);
        }
        customThemes.installing = true;
        customThemes.error = "";
        notify("customThemes");
        let timer;
        const timeout = new Promise((_, reject) => {
            timer = later(() => reject(new Error(tr("Theme download timed out."))), THEMES_TIMEOUT_MS, false);
        });
        return Promise.race([
            Promise.resolve().then(() => global.fetch(url, {method:"GET", headers:{Accept:"application/json, text/plain, */*"}})).then(res => {
                if (!res || !res.ok) throw new Error(tr("Couldn't download theme (HTTP {status}).", {status:res && res.status || "error"}));
                return res.text();
            }),
            timeout
        ]).then(text => {
            if (timer !== undefined && typeof global.clearTimeout === "function") global.clearTimeout(timer);
            if (typeof text !== "string" || !text.trim()) throw new Error(tr("The link returned an empty file."));
            if (text.length > THEMES_MAX_BYTES) throw new Error(tr("That theme file is too large."));
            let json;
            try { json = JSON.parse(text); } catch (_) { throw new Error(tr("That link didn't return valid JSON.")); }
            const spec = sanitizeThemeSpec(json, url);
            customThemes.loaded = true;
            customThemes.editCounter++;
            const existingIdx = customThemes.list.findIndex(t => t.id === spec.id || t.url && t.url === spec.url);
            if (existingIdx >= 0) customThemes.list[existingIdx] = spec;
            else {
                if (customThemes.list.length >= THEMES_MAX) customThemes.list.pop();
                customThemes.list.unshift(spec);
            }
            customThemes.active = spec.id;
            customThemes.installing = false;
            customThemes.error = "";
            customThemesPersist();
            customThemesApply();
            reviewToast(reviewUI(), tr("Applied {name}", {name:spec.name}), venusIcon(6868, "CircleCheckIcon"));
            if (typeof onDone === "function") onDone();
            return true;
        }).catch(err => {
            if (timer !== undefined && typeof global.clearTimeout === "function") global.clearTimeout(timer);
            customThemes.installing = false;
            customThemes.error = String(err && err.message || err);
            notify("customThemes");
            return false;
        });
    }
    function customThemesRemove(id) {
        customThemes.loaded = true;
        const idx = customThemes.list.findIndex(t => t.id === id);
        if (idx < 0) return;
        const removed = customThemes.list[idx];
        customThemes.list.splice(idx, 1);
        if (customThemes.active === id) customThemes.active = "";
        customThemesPersist();
        customThemesApply();
        reviewToast(reviewUI(), tr("Removed {name}", {name:removed.name}), venusIcon(5049, "TrashIcon"));
    }
    function customThemesClearAll() {
        customThemes.loaded = true;
        customThemes.list = [];
        customThemes.active = "";
        customThemes.error = "";
        customThemesPersist();
        customThemesApply();
        reviewToast(reviewUI(), "Themes cleared", venusIcon(5049, "TrashIcon"));
    }
    // A theme's own colors: the first key it sets wins, in Discord's newer names first.
    function themeColorOf(item, keys) {
        for (const key of keys) {
            const raw = item.rawColors && item.rawColors[key], sem = item.semanticColors && item.semanticColors[key];
            const value = typeof raw === "string" ? raw : Array.isArray(sem) ? sem[0] : null;
            if (typeof value === "string" && /^#[0-9a-f]{6}/i.test(value)) return value.slice(0, 7);
        }
        return null;
    }
    // Discord's own dark colors, fixed: a theme rewrites the live tokens in place, so they can't be read back here.
    const THEME_DISCORD_COLORS = {bg:"#313338", card:"#2b2d31", accent:"#5865f2", text:"#dbdee1", strong:"#f2f3f5"};
    function themePalette(item) {
        if (!item) return THEME_DISCORD_COLORS;
        const D = THEME_DISCORD_COLORS;
        return {bg:themeColorOf(item, ["BACKGROUND_PRIMARY", "BACKGROUND_BASE_LOWER", "BG_BASE_PRIMARY", "CHAT_BACKGROUND", "PRIMARY_600"]) || D.bg,
            card:themeColorOf(item, ["BACKGROUND_SECONDARY", "BACKGROUND_BASE_LOW", "CARD_PRIMARY_BG", "BACKGROUND_TERTIARY", "PRIMARY_630"]) || D.card,
            accent:themeColorOf(item, ["BRAND_500", "BRAND_EXPERIMENT", "BACKGROUND_BRAND", "TEXT_BRAND", "BLURPLE_50", "BRAND_360"]) || D.accent,
            text:themeColorOf(item, ["TEXT_NORMAL", "TEXT_DEFAULT", "TEXT_PRIMARY", "PRIMARY_230"]) || D.text,
            strong:themeColorOf(item, ["HEADER_PRIMARY", "TEXT_STRONG", "TEXT_PRIMARY", "PRIMARY_100"]) || D.strong};
    }
    // A tiny chat drawn in a theme's own colors: someone's message, your reply bubble and a button in the accent.
    function themeMiniChat(p) {
        const bar = (width, color, opacity) => el(RN.View, {style:{width, height:6, borderRadius:3, backgroundColor:color, opacity}});
        return el(RN.View, {style:{height:84, borderRadius:12, backgroundColor:p.bg, padding:10, gap:6, overflow:"hidden"}},
            el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:6}},
                el(RN.View, {style:{width:16, height:16, borderRadius:8, backgroundColor:p.accent}}), bar("45%", p.strong, 0.95)),
            el(RN.View, {style:{paddingLeft:22, gap:5}}, bar("85%", p.text, 0.6), bar("60%", p.text, 0.6)),
            el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:6, marginTop:"auto"}},
                el(RN.View, {style:{flex:1, height:16, borderRadius:8, backgroundColor:p.card}}),
                el(RN.View, {style:{width:16, height:16, borderRadius:8, backgroundColor:p.accent}})));
    }
    const THEME_TILE_DARK = {tile:{width:"48%", borderRadius:16, padding:4, borderWidth:2, borderColor:"transparent", backgroundColor:"#2b2d31"},
        on:{borderColor:"#5865f2"}, check:{position:"absolute", top:10, right:10, width:22, height:22, borderRadius:11, alignItems:"center", justifyContent:"center", backgroundColor:"#5865f2"},
        add:{width:"48%", borderRadius:16, borderWidth:2, borderStyle:"dashed", borderColor:"#4e5058", alignItems:"center", justifyContent:"center", padding:12, gap:8, minHeight:132},
        addIcon:{width:36, height:36, borderRadius:18, alignItems:"center", justifyContent:"center", backgroundColor:"#4e50584d"}};
    function useThemeTileStyles() {
        return useThemed("themeTile", c => ({tile:Object.assign({}, THEME_TILE_DARK.tile, {backgroundColor:c.CARD_BACKGROUND_DEFAULT}),
            on:{borderColor:c.BACKGROUND_BRAND || "#5865f2"}, check:Object.assign({}, THEME_TILE_DARK.check, {backgroundColor:c.BACKGROUND_BRAND || "#5865f2"}),
            add:Object.assign({}, THEME_TILE_DARK.add, {borderColor:c.BORDER_STRONG || c.BACKGROUND_MOD_STRONG || "#4e5058"}),
            addIcon:Object.assign({}, THEME_TILE_DARK.addIcon, {backgroundColor:c.BACKGROUND_MOD_SUBTLE})}), THEME_TILE_DARK);
    }
    // One theme in the gallery: its mini chat, its name and one short line. The one in use has a ring and a check.
    function themeTile(s, opts) {
        const Text = inspectedExport(5088, "Text"), Press = RN.Pressable || RN.View, Check = venusIcon(6823, "CheckmarkSmallIcon");
        const line = (value, variant, color, fallback) => Text ? el(Text, {variant, color, lineClamp:1, numberOfLines:1}, value) :
            el(RN.Text, {style:fallback, numberOfLines:1}, value);
        return el(Press, {key:opts.key, style:[s.tile, opts.selected ? s.on : null, {opacity:opts.disabled ? 0.5 : 1}],
            accessibilityRole:"radio", accessibilityLabel:opts.name, accessibilityHint:opts.sub || undefined,
            accessibilityState:{selected:!!opts.selected, disabled:!!opts.disabled}, disabled:!!opts.disabled,
            onPress:opts.onPress, onLongPress:opts.onLongPress, delayLongPress:400},
            themeMiniChat(opts.palette),
            opts.selected ? el(RN.View, {style:s.check, pointerEvents:"none"}, popIn("check:" + opts.key, el(Check, {size:"xs", color:"#ffffff"}))) : null,
            el(RN.View, {style:{paddingHorizontal:8, paddingTop:8, paddingBottom:6, gap:1}},
                line(opts.name, "text-sm/semibold", "text-strong", {color:"#f2f3f5", fontSize:14, fontWeight:"600"}),
                opts.sub ? line(opts.sub, "text-xs/medium", "text-muted", {color:"#949ba4", fontSize:12}) : null));
    }
    function customThemesUse(id) {
        if (!enabled("customThemes") || customThemes.installing || customThemes.active === id) return;
        haptic("SELECTION"); animateLayout();
        customThemes.loaded = true;
        customThemes.active = id;
        customThemes.error = "";
        customThemesPersist();
        customThemesApply();
    }
    function CustomThemesSettings() {
        useSettings("customThemes");
        const [urlDraft, setUrlDraft] = React.useState("");
        const ui = reviewUI();
        React.useEffect(() => {
            if (enabled("customThemes")) customThemesRestore();
        }, []);
        if (!React || !RN) return null;
        const s = useThemeTileStyles();
        const Group = ui.TableRowGroup || RN.View, Switch = ui.TableSwitchRow, Text = inspectedExport(5088, "Text"), Press = RN.Pressable || RN.View;
        const on = enabled("customThemes"), busy = customThemes.installing;
        const canInstall = on && !busy && /^https?:\/\/\S+/i.test(urlDraft.trim());
        const onInstall = () => {
            if (!canInstall) return;
            customThemesInstallFromUrl(urlDraft, () => setUrlDraft(""));
        };
        const onPaste = () => {
            if (!on || busy) return;
            const clip = ui.clipboard || RN.Clipboard;
            if (!clip || typeof clip.getString !== "function") return;
            Promise.resolve().then(() => clip.getString()).then(str => {
                if (typeof str === "string" && str.trim()) setUrlDraft(str.trim());
            }).catch(() => {});
        };
        const inputProps = {
            value:urlDraft,
            autoCapitalize:"none",
            autoCorrect:false,
            keyboardType:"url",
            placeholder:tr("https://.../theme.json"),
            onSubmitEditing:onInstall,
            returnKeyType:"go",
            editable:on && !busy,
            isDisabled:!on || busy
        };
        // One field and one button: Paste while the box is empty, Install once it has a link.
        const empty = !urlDraft.trim();
        const urlInput = inputWithButton(ui, "input", Object.assign({label:tr("Theme JSON link")}, inputProps), text => setUrlDraft(String(text || "")),
            busy ? "Installing…" : empty ? "Paste" : "Install", empty ? onPaste : onInstall, empty ? !on || busy : !canInstall);
        const text = (value, variant, color, fallback) => Text ? el(Text, {variant, color}, value) : el(RN.Text, {style:fallback}, value);
        // The gallery: Discord's own colors first, then every installed theme, then a tile to find more.
        const active = customThemesActiveEntry();
        const tiles = [themeTile(s, {key:"discord", name:tr("Discord's colors"), sub:!active ? tr("In use") : tr("Default"), palette:THEME_DISCORD_COLORS,
            selected:on && !active, disabled:!on || busy, onPress:() => customThemesUse("")})];
        customThemes.list.forEach(item => {
            if (!item) return;
            const selected = !!active && active.id === item.id;
            const sub = selected ? tr("In use") : item.authors ? tr("by {author}", {author:item.authors}) : item.background && item.background.url ? tr("Background image") : "";
            tiles.push(themeTile(s, {key:"theme:" + item.id, name:item.name, sub, palette:themePalette(item), selected, disabled:!on || busy,
                onPress:() => customThemesUse(item.id),
                onLongPress:() => confirmAction("Remove theme?", tr("Remove {name} from this phone?", {name:item.name}), "Remove", () => customThemesRemove(item.id))}));
        });
        const Link = venusIcon(7701, "LinkExternalSmallIcon");
        tiles.push(el(Press, {key:"browse", style:s.add, accessibilityRole:"link", accessibilityLabel:tr("Browse Revenge themes"),
            onPress:() => openLink("https://plugins-list.pages.dev/Themes/")},
            el(RN.View, {style:s.addIcon}, el(Link, {size:"sm"})),
            Text ? el(Text, {variant:"text-sm/semibold", color:"text-default", style:{textAlign:"center"}}, tr("Browse Revenge themes")) :
                el(RN.Text, {style:{color:"#dbdee1", fontSize:14, fontWeight:"600", textAlign:"center"}}, tr("Browse Revenge themes"))));
        const gallery = el(RN.View, {key:"themes", style:{gap:8}},
            groupTitle("title", "Themes"),
            el(RN.View, {style:{flexDirection:"row", flexWrap:"wrap", justifyContent:"space-between", rowGap:12}, accessibilityRole:"radiogroup"}, tiles));
        // A failed install is said right under the field it came from, in red, instead of at the top of the page.
        const problem = on && customThemes.error ? el(RN.View, {key:"error", style:{paddingHorizontal:12, paddingBottom:12, gap:2}, accessibilityLiveRegion:"polite"},
            text(tr("Couldn't install the theme"), "text-sm/semibold", "text-feedback-critical", {color:"#f23f43", fontSize:14, fontWeight:"600"}),
            text(customThemes.error, "text-xs/medium", "text-muted", {color:"#949ba4", fontSize:12})) : null;
        const groups = [
            on ? null : offCard("status", venusIcon(15652, "EyeDropperIcon"), "customThemes"),
            gallery,
            el(Group, {key:"install", title:tr("Add from link"), description:tr("Downloads the theme once and keeps it on this phone.")},
                el(RN.View, {key:"input", style:{padding:12}}, urlInput), problem),
            el(Group, {key:"display", title:tr("Display")},
                switchRow(Switch, "customThemesBackground", "Show theme background image", "Shows the wallpaper behind chat, for themes that come with one.", rowIcon(8210, "ImageIcon"))),
            customThemes.list.length ? el(Group, {key:"manage", title:tr("Manage")},
                actionRow(ui, "clear", "Clear installed themes",
                    pl(customThemes.list.length, "Removes {n} saved theme and restores Discord's default colors.", "Removes {n} saved themes and restores Discord's default colors."),
                    () => confirmAction("Clear installed themes?", "Every installed theme will be removed from this phone and Discord's default colors will be restored.", "Clear", customThemesClearAll),
                    !on, true)) : null,
            customThemes.list.length ? footnote("note", "Hold a theme to remove it.") : null];
        return settingsBody(ui, groups, {keyboardShouldPersistTaps:"handled"});
    }
    // Icon packs (#61): replaces Discord's icons across the app with community icon packs (Themes+ / Rosiecord / MD3 /
    // Solar / Deco / Material Two Tone / Iconsax) or any custom icon pack URL, and applies per-icon tint overrides from
    // the active theme's plus.icons table. Instead of building path strings and scanning manifest arrays on every
    // <Image> render, Venus compiles a dense O(1) lookup table indexed by numeric assetId once when the active pack or
    // theme changes, so BaseIconImage (4817), RN.Image (328) and resolveAssetSource (81) do a single array read.
    const ICONPACKS_FILE = "venus-iconpacks.json", ICONPACKS_MAX_CUSTOM = 20, ICONPACKS_MAX_BYTES = 1024 * 1024, ICONPACKS_TIMEOUT_MS = 10000;
    const ICONPACKS_LIST_URL = "https://raw.githubusercontent.com/nexpid/ThemesPlus/main/iconpacks/list.json";
    const ICONPACKS_TREE_BASE = "https://raw.githubusercontent.com/nexpid/ThemesPlus/iconpack-trees/";
    const ICONPACK_REDESIGN_DIR = "design/components/Icon/native/redesign/generated/images";
    const ICONPACK_LEGACY_DIR = "images/native/icons";
    const ICONPACK_TRANSPARENT_URI = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAC0lEQVQI12NgAAIAAAUAAeImBZsAAAAASUVORK5CYII=";
    // Built-in community icon packs from Themes+, embedded so the gallery works straight away offline.
    const BUILTIN_ICONPACKS = [
        {id:"rosiecord-plumpy", name:"Rosiecord Plumpy", description:"Icons8 Plumpy icons", authors:"Rosie & Rairof", load:"https://raw.githubusercontent.com/Rairof/discord-iconpacks/main/Packs/Plumpy/", suffix:""},
        {id:"rosiecord-iconsax", name:"Rosiecord Iconsax", description:"Iconsax linear icons", authors:"Rosie, Lemon & Jay", load:"https://raw.githubusercontent.com/mudrhiod/discord-iconpacks/master/plus/iconsax/", suffix:"@2x"},
        {id:"md3", name:"MD3 (Rounded)", description:"Material Design 3 rounded icons", authors:"Google & Hurricane", load:"https://codeberg.org/panbread/iconpackrepo/raw/branch/main/packs/MaterialDesign3/", suffix:""},
        {id:"md3legacy", name:"MD3 (Legacy)", description:"Classic Material Design 3 icons", authors:"Google & Hurricane", load:"https://codeberg.org/panbread/iconpackrepo/raw/branch/main/packs/MaterialDesign3Legacy/", suffix:""},
        {id:"solar", name:"Solar", description:"Solar bold icons", authors:"480 Design & WalkQuackBack", load:"https://raw.githubusercontent.com/mudrhiod/discord-iconpacks/master/plus/solar/", suffix:""},
        {id:"solarduotone", name:"Solar (Duotone)", description:"Solar two-tone shaded icons", authors:"480 Design & WalkQuackBack", load:"https://raw.githubusercontent.com/mudrhiod/discord-iconpacks/master/plus/solar-duotone/", suffix:""},
        {id:"solarbroken", name:"Solar (Dashed)", description:"Solar broken-line icons", authors:"480 Design & WalkQuackBack", load:"https://raw.githubusercontent.com/mudrhiod/discord-iconpacks/master/plus/solar-broken/", suffix:""},
        {id:"deco", name:"Deco", description:"Clean geometric line icons", authors:"doraa", load:"https://raw.githubusercontent.com/dora727/doraa-pyoncordstuff/master/Packs/Deco/", suffix:""},
        {id:"materialtwotone", name:"Material Two Tone", description:"Two-tone Material icons", authors:"Google & doraa", load:"https://raw.githubusercontent.com/dora727/doraa-pyoncordstuff/master/Packs/MaterialTwoTone/", suffix:""},
        {id:"iconsaxbulk", name:"Iconsax Bulk", description:"Iconsax filled bulk icons", authors:"Iconsax & doraa", load:"https://raw.githubusercontent.com/dora727/doraa-pyoncordstuff/master/Packs/IconsaxBulk/", suffix:""}
    ];
    // Common theme plus.iconpack spellings/typos mapped to canonical pack IDs.
    const ICONPACK_ID_ALIASES = {
        "plumpy":"rosiecord-plumpy", "rosiecord_plumpy":"rosiecord-plumpy",
        "iconsax":"rosiecord-iconsax", "rosiecord_iconsax":"rosiecord-iconsax",
        "md3-rounded":"md3", "md3_rounded":"md3", "materialdesign3":"md3",
        "md3-legacy":"md3legacy", "md3_legacy":"md3legacy", "materialdesign3legacy":"md3legacy",
        "solar-duotone":"solarduotone", "solar_duotone":"solarduotone", "solar-duotune":"solarduotone", "solarduotune":"solarduotone",
        "solar-broken":"solarbroken", "solar_broken":"solarbroken", "solar-dashed":"solarbroken", "solardashed":"solarbroken",
        "material-two-tone":"materialtwotone", "material_two_tone":"materialtwotone",
        "iconsax-bulk":"iconsaxbulk", "iconsax_bulk":"iconsaxbulk"
    };
    // Maps Discord 350.8 redesign icon names to older redesign and legacy icon paths shipped by community icon packs,
    // so icons Discord renamed or split since older builds still match across every pack.
    const ICONPACK_NAME_ALIASES = {
        ArrowAngleRightUpIcon:["LinkExternalSmallIcon", "@ic_open_in_browser"],
        ArrowLargeRightIcon:["ArrowSmallRightIcon", "@ic_arrow_forward_24px"],
        ArrowLargeUpIcon:["ArrowSmallUpIcon", "@ic_chevron_up_24px"],
        ArrowSmallLeftIcon:["ChevronSmallLeftIcon", "@ic_arrow_back_24px"],
        ArrowSmallRightIcon:["ChevronSmallRightIcon", "@ic_arrow_forward_24px"],
        ArrowsLeftRightIcon:["ArrowsUpDownIcon", "@ic_sync_24px"],
        BellZIcon:["BellSlashIcon", "@ic_mute_channel_24px"],
        BillIcon:["ReceiptIcon", "@ic_file_text"],
        BookmarkIcon:["@ic_stamp"],
        BookmarkOutlineIcon:["BookmarkIcon", "@ic_stamp"],
        BoostGemIcon:["@ic_settings_boost_24px", "@ic_nitro_wheel"],
        BoostGemOutlineIcon:["BoostGemIcon", "@ic_settings_boost_24px"],
        BoostGemSlashIcon:["BoostGemSlashIcon-primary", "BoostGemIcon"],
        BugIcon:["@ic_feedback", "WarningIcon"],
        BurgerIcon:["MenuIcon", "@ic_menu_24px"],
        CarIcon:["TravelIcon"],
        ChannelListPlusIcon:["PlusLargeIcon", "@ic_add_24px"],
        ChannelsFollowedIcon:["AnnouncementsIcon", "@ic_megaphone_16px"],
        ChatArrowRightIcon:["ChatIcon", "@ic_chat_bubble_16px"],
        ChatDotsIcon:["ChatIcon", "@ic_chat_bubble_16px"],
        ChatMarkUnreadIcon:["MarkUnreadIcon"],
        ChatSmileIcon:["ChatIcon", "SmileIcon"],
        ChatWarningIcon:["ChatAlertIcon", "WarningIcon"],
        ChatXIcon:["ChatIcon", "@ic_close_24px"],
        CheckmarkLargeBoldIcon:["CheckmarkBoldIcon", "CheckmarkLargeIcon", "@ic_check_24px"],
        ChevronLargeUpIcon:["ChevronSmallUpIcon", "@ic_chevron_up_24px"],
        CircleCheckIcon:["CircleCheckIcon-primary", "@ic_radio_circle_checked"],
        CircleErrorIcon:["CircleWarningIcon", "CircleExclamationPointIcon", "CircleWarningIcon-primary", "CircleExclamationPointIcon-primary", "@ic_warning_24px"],
        "CircleErrorIcon-primary":["CircleWarningIcon-primary", "CircleExclamationPointIcon-primary", "CircleWarningIcon", "CircleExclamationPointIcon"],
        "CircleErrorIcon-secondary":["CircleWarningIcon-secondary", "CircleExclamationPointIcon-secondary"],
        "CirclePlayIcon-primary":["PlayIcon", "@ic_play"],
        ClipboardCheckIcon:["ClipboardListIcon", "CopyIcon"],
        CompassIcon:["@discovery_20px", "GlobeEarthIcon"],
        CreditCardIcon:["TicketDollarIcon", "BillIcon"],
        CrownIcon:["@ic_crown_16px"],
        DenyIcon:["CircleXIcon", "@ic_ban_24px"],
        DiceIcon:["#modules/hang_status/native/images/DiceIcon.png"],
        DoubleCheckmarkIcon:["CheckmarkLargeIcon", "@ic_check_24px"],
        EducationIcon:["BookCheckIcon", "@ic_rulebook"],
        EmbedIcon:["FileIcon", "@ic_file_text"],
        EyeSlashIcon:["@ic_hide_24px", "@ic_hide_password"],
        FileWarningIcon:["FileIcon", "WarningIcon"],
        FlashIcon:["SparklesIcon", "@ic_wand"],
        FolderPlusIcon:["FolderIcon", "@ic_folder_add_24px"],
        FullscreenEnterIcon:["MaximizeIcon", "@ic_pip"],
        GamesIcon:["ActivitiesIcon", "GameControllerIcon", "@ic_controller_24px"],
        GridSquareIcon:["AppsIcon", "@ic_grid_24px"],
        GroupPlusIcon:["GroupIcon", "@ic_new_group"],
        HashmarkIcon:["TextIcon", "ChannelsTextIcon", "@ic_text_channel_16px"],
        HeartOutlineIcon:["HeartIcon"],
        HourglassIcon:["TimerIcon", "@ic_timer_24px"],
        ImageBrokenIcon:["ExperimentalImageBrokenIcon", "ImageWarningIcon"],
        ImagePlusIcon:["ImageIcon", "@ic_image_upload"],
        ImageSparkleIcon:["ImagePlusIcon", "ImageIcon"],
        ImagesIcon:["ImageIcon", "@ic_image"],
        InboxIcon:["@ic_mail", "BellIcon"],
        LettersIcon:["@settings/ic_locale_24px", "LanguageIcon"],
        LinkExternalMediumIcon:["LinkExternalSmallIcon", "@ic_open_in_browser"],
        LinkPlusIcon:["LinkIcon", "@ic_link_24px"],
        ListViewIcon:["MenuIcon", "@ic_forum_channel_list_view_24px"],
        MagicDoorIcon:["DoorEnterIcon", "DoorExitIcon", "@ic_leave_24px"],
        MedalIcon:["TrophyIcon", "@ic_trophy_filled"],
        MenuIcon:["@ic_menu_24px", "MoreHorizontalIcon"],
        MobilePhoneDenyIcon:["MobilePhoneIcon", "@ic_mobile_device"],
        MobilePhoneSettingsIcon:["MobilePhoneIcon", "@settings/ic_phonelink_24px"],
        MobilePhoneShareIcon:["ScreenIcon", "@ic_screen_share_24px"],
        MoreVerticalIcon:["MoreHorizontalIcon", "@ic_more_android", "@ic_overflow_android"],
        NewUserIcon:["NewUserLargeIcon", "UserCircleNewIcon", "UserPlusIcon"],
        OrbsIcon:["SparklesIcon", "@ic_nitro_wheel"],
        PaintbrushThinIcon:["PaintPaletteIcon", "@ic_paint_brush"],
        PaperIcon:["FileIcon", "@ic_file_text"],
        PaperPlusIcon:["FileUpIcon", "FileIcon"],
        PhoneIcon:["PhoneCallIcon", "@voice_calls/voice_bar_phone"],
        PiggyBankIcon:["TicketDollarIcon", "ShopIcon"],
        PollsIcon:["AnalyticsIcon", "@ic_analytics_bubble_24px"],
        QrCodeIcon:["QrCodeCameraIcon", "@settings/ic_qr_code_24px"],
        QuestsIcon:["CompassIcon", "TrophyIcon", "@discovery_20px"],
        QuoteIcon:["ChatIcon", "@ic_reply_24px"],
        ReactionIcon:["SmileIcon", "@ic_emoji_24px"],
        RedoIcon:["RetryIcon", "@ic_sync_24px"],
        RefreshIcon:["RetryIcon", "@ic_sync_24px"],
        ScienceIcon:["ScienceDefaultIcon", "@settings/ic_progress_wrench_24px"],
        ShieldLockIcon:["ShieldIcon", "@ic_shield_24px"],
        ShopIcon:["ShopSparkleIcon", "@ic_gift"],
        SignPostIcon:["@ic_sign_post", "@ic_channel_browse"],
        SlashIcon:["SlashBoxIcon", "@ic_application_command_24px"],
        SpeedometerIcon:["TimerIcon", "@ic_timer_24px"],
        StampXIcon:["StampIcon", "@ic_stamp"],
        StickerIcon:["StickerWinkIcon", "StickerWink2Icon", "@ic_sticker_24px"],
        StickerPlusIcon:["StickerIcon", "StickerWinkIcon", "@ic_sticker_24px"],
        StopIcon:["PauseIcon", "@ic_stop_stream_24px"],
        SuperReactionIcon:["AddSuperReactionIcon", "ReactionIcon", "SmilePlusIcon"],
        TagIcon:["BadgeIcon"],
        TagsIcon:["TagIcon", "BadgeIcon"],
        TextControllerIcon:["GameControllerIcon", "@ic_controller_24px"],
        ThreadLockIcon:["ThreadIcon", "@ic_thread_private_24px"],
        ThreadMinusIcon:["ThreadIcon", "@ic_thread_normal_24px"],
        ThumbsDownIcon:["HandRequestDenyIcon", "ReactionIcon"],
        ThumbsUpIcon:["HandRequestSpeakIcon", "ReactionIcon"],
        TimerIcon:["@ic_timer_24px", "ClockIcon"],
        TvIcon:["ScreenIcon", "@ic_monitor"],
        UndoIcon:["@ic_undo", "RetryIcon"],
        UnknownGameIcon:["GameControllerIcon", "@ic_controller_24px"],
        UnsendIcon:["@ic_undo", "ArrowAngleLeftUpIcon"],
        UserCheckIcon:["UserIcon", "@ic_friend_request_accepted"],
        UserClockIcon:["UserIcon", "@ic_clock_timeout_16px"],
        UserPlatformIcon:["LaptopPhoneIcon", "@settings/ic_phonelink_24px"],
        VideoDenyIcon:["VideoSlashIcon", "VideoIcon", "@user_profile/ic_video_disabled"],
        VideoSelfieIcon:["VideoIcon", "@ic_video"],
        WarningIcon:["TriangleExclamationPointIcon", "@ic_warning_24px"],
        WaveformIcon:["SoundboardIcon", "@ic_soundboard"],
        WebhookPlusIcon:["WebhookIcon", "@ic_webhook_24px"],
        WindowLaunchIcon:["LinkExternalSmallIcon", "@ic_open_in_browser"],
        XLargeBoldIcon:["CloseLargeBoldIcon", "CloseLargeIcon", "@ic_close_24px"],
        XLargeIcon:["CloseLargeIcon", "@ic_close_24px", "@ic_close"],
        XNeutralIcon:["TwitterIcon", "TwitterNeutralIcon"],
        XSmallBoldIcon:["CloseSmallBoldIcon", "CloseSmallIcon", "@ic_close_16px"],
        XSmallIcon:["CloseSmallIcon", "@ic_close_16px", "@ic_close"]
    };
    const iconPacks = {
        registry:null, table:null, ctx:null, hasActive:false, appliedKey:"",
        active:"", custom:[], trees:new Map(), loadingTrees:new Set(), treeTries:new Map(),
        loaded:false, loading:false, installing:false, error:""
    };
    function normalizeIconPackId(raw) {
        if (typeof raw !== "string") return "";
        const id = raw.trim();
        if (!id) return "";
        const lower = id.toLowerCase();
        return ICONPACK_ID_ALIASES[lower] || lower;
    }
    function sanitizeCustomIconPack(item) {
        if (!item || typeof item !== "object" || Array.isArray(item)) return null;
        let load = typeof item.load === "string" ? item.load.trim() : typeof item.url === "string" ? item.url.trim() : "";
        if (!/^https?:\/\/\S+/i.test(load)) return null;
        load = normalizeThemeUrl(load).replace(/\/?$/, "/");
        const suffix = typeof item.suffix === "string" ? item.suffix.trim().slice(0, 16) : "";
        let name = typeof item.name === "string" ? item.name.trim().slice(0, 80) : "";
        if (!name) {
            const parts = load.replace(/\/+$/, "").split("/").filter(Boolean);
            name = decodeURIComponent(parts[parts.length - 1] || "Custom pack").slice(0, 80);
        }
        const id = typeof item.id === "string" && item.id.trim() ? normalizeIconPackId(item.id) : "custom:" + load.toLowerCase();
        const description = typeof item.description === "string" ? item.description.trim().slice(0, 160) : "";
        const authors = Array.isArray(item.authors) ? item.authors.map(a => a && typeof a.name === "string" ? a.name.trim() : typeof a === "string" ? a.trim() : "").filter(Boolean).slice(0, 4).join(", ").slice(0, 80) :
            typeof item.authors === "string" ? item.authors.trim().slice(0, 80) : "";
        const out = {id, name, description, authors, load, suffix, custom:true};
        if (Array.isArray(item.tree) && item.tree.length) {
            const tree = item.tree.filter(p => typeof p === "string" && p.length <= 240).slice(0, 4000);
            if (tree.length) iconPacks.trees.set(id, new Set(tree));
        }
        return out;
    }
    function iconPackCatalog() {
        return BUILTIN_ICONPACKS.concat(iconPacks.custom);
    }
    function iconPackById(id) {
        if (!id) return null;
        const norm = normalizeIconPackId(id);
        return BUILTIN_ICONPACKS.find(p => p.id === norm) || iconPacks.custom.find(p => p.id === norm || p.id === id) || null;
    }
    // Which icon pack is active right now: the one you picked, or the active theme's plus.iconpack when "Follow theme's icon pack" is on.
    function iconPacksActiveEntry() {
        if (!enabled("iconPacks")) return null;
        if (settings.iconPacksTheme && features.customThemes && enabled("customThemes")) {
            const theme = customThemesActiveEntry();
            const themePackId = theme && theme.plus && theme.plus.iconpack;
            if (themePackId) {
                const fromTheme = iconPackById(themePackId);
                if (fromTheme) return fromTheme;
            }
        }
        return iconPackById(iconPacks.active);
    }
    function expandIconAlias(entry) {
        if (entry.charCodeAt(0) === 64) return ICONPACK_LEGACY_DIR + "/" + entry.slice(1) + ".png";
        if (entry.charCodeAt(0) === 35) return entry.slice(1);
        return ICONPACK_REDESIGN_DIR + "/" + entry + ".png";
    }
    function iconPackCandidates(name, relDir, type) {
        const base = relDir ? relDir + "/" + name + "." + type : name + "." + type;
        const list = [base];
        if (type !== "png") return list;
        if (relDir === ICONPACK_REDESIGN_DIR) {
            if (name.endsWith("-primary")) list.push(ICONPACK_REDESIGN_DIR + "/" + name.slice(0, -8) + ".png");
            if (name.endsWith("NeutralIcon")) list.push(ICONPACK_REDESIGN_DIR + "/" + name.slice(0, -11) + "Icon.png");
            if (name === "TiktokNeutralIcon") list.push(ICONPACK_REDESIGN_DIR + "/TikTokIcon.png");
            else if (name === "YoutubeNeutralIcon") list.push(ICONPACK_REDESIGN_DIR + "/YouTubeIcon.png");
            const aliases = ICONPACK_NAME_ALIASES[name];
            if (aliases) for (let i = 0; i < aliases.length; i++) list.push(expandIconAlias(aliases[i]));
        } else if (relDir.startsWith(ICONPACK_LEGACY_DIR)) {
            if (name === "ic_close_24px" || name === "ic_close") list.push(ICONPACK_REDESIGN_DIR + "/XLargeIcon.png", ICONPACK_REDESIGN_DIR + "/CloseLargeIcon.png");
            else if (name === "ic_close_16px") list.push(ICONPACK_REDESIGN_DIR + "/XSmallIcon.png", ICONPACK_REDESIGN_DIR + "/CloseSmallIcon.png");
            else if (name === "ic_check_24px" || name === "ic_checkmark") list.push(ICONPACK_REDESIGN_DIR + "/CheckmarkLargeIcon.png");
            else if (name === "ic_search" || name === "ic_search_24px") list.push(ICONPACK_REDESIGN_DIR + "/MagnifyingGlassIcon.png");
            else if (name === "ic_trash_24px" || name === "ic_trash_filled") list.push(ICONPACK_REDESIGN_DIR + "/TrashIcon.png");
            else if (name === "ic_cog_24px" || name === "ic_gear") list.push(ICONPACK_REDESIGN_DIR + "/SettingsIcon.png");
            else if (name === "ic_add_24px") list.push(ICONPACK_REDESIGN_DIR + "/PlusLargeIcon.png");
        }
        return list;
    }
    function withPackSuffix(path, suffix) {
        if (!suffix) return path;
        const dot = path.lastIndexOf(".");
        return dot > 0 ? path.slice(0, dot) + suffix + path.slice(dot) : path + suffix;
    }
    // Discord registers an asset only when its module first loads (none at launch, ~1.4k images once every screen has
    // been opened), so a one-time scan of AssetRegistry (84) caught a partial list or nothing and most icons never
    // changed. Each asset ID is resolved the first time it's drawn instead, then cached in iconPacks.table.
    const ICONPACK_MISS = Object.freeze({source:null, tint:""});
    function iconPacksAsset(id) {
        const reg = iconPacks.registry || (iconPacks.registry = global.__r && global.__r(84));
        let a = null;
        try { a = reg && typeof reg.getAssetByID === "function" ? reg.getAssetByID(id) : null; } catch (_) {}
        if (!a || a.type !== "png" && a.type !== "jpg" && a.type !== "webp" && a.type !== "gif") return null;
        const name = typeof a.name === "string" ? a.name : "";
        if (!name) return null;
        const loc = typeof a.httpServerLocation === "string" ? a.httpServerLocation : "";
        const rel = loc.split("/").slice(2).join("/").replace(/^\.\.\//, "_/");
        return {id, name, rel, type:a.type, width:a.width || 24, height:a.height || 24, candidates:iconPackCandidates(name, rel, a.type),
            secondaryOf:rel === ICONPACK_REDESIGN_DIR && name.endsWith("-secondary") ? name.slice(0, -10) : ""};
    }
    function iconPacksResolveEntry(id) {
        const ctx = iconPacks.ctx, a = ctx ? iconPacksAsset(id) : null;
        if (!a) return ICONPACK_MISS;
        const uri = ctx.pack ? iconPacksResolveAssetUri(a, ctx.pack, ctx.tree) : "";
        const tint = iconPacksResolvePlusTint(a.name, ctx.plusIcons);
        if (!uri && !tint) return ICONPACK_MISS;
        return Object.freeze({source:uri ? Object.freeze({__venusIcon:true, uri, width:a.width, height:a.height}) : null, tint});
    }
    // O(1) after the first draw of each icon: one array read per render.
    function iconPacksEntry(id) {
        if (typeof id !== "number") return ICONPACK_MISS;
        const table = iconPacks.table, hit = table[id];
        return hit !== undefined ? hit : table[id] = iconPacksResolveEntry(id);
    }
    function iconPacksFetchTree(pack) {
        if (!pack || pack.custom || iconPacks.trees.has(pack.id) || iconPacks.loadingTrees.has(pack.id) || typeof global.fetch !== "function") return;
        const id = pack.id;
        iconPacks.loadingTrees.add(id);
        Promise.resolve().then(() => global.fetch(ICONPACKS_TREE_BASE + encodeURIComponent(id) + ".txt", {method:"GET"}))
            .then(res => res && res.ok ? res.text() : "")
            .then(text => {
                const lines = typeof text === "string" ? text.split(/\r?\n/).map(s => s.trim()).filter(Boolean) : [];
                if (!lines.length) throw new Error("empty");
                iconPacks.trees.set(id, new Set(lines));
                iconPacks.treeTries.delete(id);
                iconPacksPersist();
                if (enabled("iconPacks")) { iconPacks.appliedKey = ""; iconPacksApply(); }
            }).catch(() => {
                // Offline or a GitHub hiccup: try again a little later (3 times) instead of keeping Discord's icons until
                // the pack is picked again.
                const tries = (iconPacks.treeTries.get(id) || 0) + 1;
                iconPacks.treeTries.set(id, tries);
                if (tries <= 3) later(() => { if (enabled("iconPacks") && iconPacksActiveEntry() === pack) iconPacksFetchTree(pack); }, 15000 * tries, false);
            }).then(() => {
                iconPacks.loadingTrees.delete(id);
                notify("iconPacks");
            });
    }
    function iconPacksResolveAssetUri(asset, pack, tree) {
        const load = pack.load, suffix = pack.suffix || "";
        const cands = asset.candidates;
        if (tree && tree.size) {
            for (let i = 0; i < cands.length; i++) {
                const rel = withPackSuffix(cands[i], suffix);
                if (tree.has(rel)) return load + rel;
                if (suffix && tree.has(cands[i])) return load + cands[i];
            }
            // Multi-layer icon (CircleCheckIcon, CircleXIcon, CircleInformationIcon, CircleQuestionIcon, CircleErrorIcon,
            // CirclePlusIcon, CircleMinusIcon, CirclePlayIcon): when a pack provides the primary/base icon without a
            // separate -secondary background layer, replace -secondary with a 1x1 transparent pixel so Discord's stock
            // circle doesn't clash behind the custom icon.
            if (asset.secondaryOf) {
                const primCands = iconPackCandidates(asset.secondaryOf + "-primary", asset.rel, asset.type)
                    .concat(iconPackCandidates(asset.secondaryOf, asset.rel, asset.type));
                for (let i = 0; i < primCands.length; i++) {
                    const rel = withPackSuffix(primCands[i], suffix);
                    if (tree.has(rel) || suffix && tree.has(primCands[i])) return ICONPACK_TRANSPARENT_URI;
                }
            }
            return "";
        }
        // A built-in pack waits for its file list: a guessed path is missing for 31-52% of 349.9's icons in every one of
        // them, and those drew as blank squares. Discord's own icon stays until the list says the pack has one.
        if (!pack.custom) return "";
        // A custom pack without a file list can only be guessed.
        if (asset.rel === ICONPACK_REDESIGN_DIR || asset.rel.startsWith(ICONPACK_LEGACY_DIR)) {
            if (asset.secondaryOf) return "";
            return load + withPackSuffix(cands[0], suffix);
        }
        return "";
    }
    function iconPacksResolvePlusTint(name, plusIcons) {
        if (!plusIcons) return "";
        const direct = plusIcons[name] || (name.endsWith("-primary") ? plusIcons[name.slice(0, -8)] : null);
        const arr = Array.isArray(direct) ? direct : typeof direct === "string" ? [direct] : null;
        if (!arr || !arr.length) return "";
        const p = parseThemeColor(arr[0]);
        return p ? formatThemeColor(p) : "";
    }
    // What every icon is resolved against; a new pack, tint choice or theme starts a fresh cache.
    function iconPacksSetContext(pack, plusIcons) {
        const tree = pack ? iconPacks.trees.get(pack.id) || null : null;
        if (pack && !tree && !pack.custom) iconPacksFetchTree(pack);
        iconPacks.ctx = {pack, tree, plusIcons};
        iconPacks.table = [];
        iconPacks.hasActive = true;
    }
    function iconPacksBumpThemeRevision() {
        customThemes.revision++;
        customThemesBumpFallbackContextKey();
        const store = customThemes.themeStore || (customThemes.themeStore = inspectedExport(1205, "default"));
        try { if (store && typeof store.emitChange === "function") store.emitChange(); } catch (_) {}
    }
    function iconPacksApply() {
        const on = enabled("iconPacks");
        const pack = on ? iconPacksActiveEntry() : null;
        const theme = features.customThemes && enabled("customThemes") ? customThemesActiveEntry() : null;
        const plusIcons = on && theme && theme.plus && theme.plus.icons || null;
        const treeSize = pack && iconPacks.trees.has(pack.id) ? iconPacks.trees.get(pack.id).size : 0;
        const nextKey = on ? (pack ? pack.id + ":" + pack.load + ":" + pack.suffix + ":" + treeSize : "none") +
            "|p:" + (theme && plusIcons ? theme.id + ":" + customThemes.editCounter : "") : "";
        if (nextKey === iconPacks.appliedKey) return;
        iconPacks.appliedKey = nextKey;
        if (!on || (!pack && !plusIcons)) {
            iconPacks.ctx = null;
            iconPacks.table = null;
            iconPacks.hasActive = false;
        } else iconPacksSetContext(pack, plusIcons);
        iconPacksBumpThemeRevision();
        notify("iconPacks");
    }
    // BaseIconImage (4817) is used by all 375 generated design-system icons. Replacing props.source with our frozen
    // {uri, width, height} object invalidates React Compiler's memo slot (c[11] !== source) whenever the pack changes.
    // Previews draw each pack's own icons, so a sample that falls back to Discord's (the "Discord's icons" tile, or an
    // icon a pack lacks) renders inside iconPacksOriginal, which BaseIconImage reads to keep Discord's real icon there.
    let ICONPACK_ORIGINAL_CTX = null;
    function iconPacksOriginalContext() {
        return ICONPACK_ORIGINAL_CTX || (React && React.createContext ? ICONPACK_ORIGINAL_CTX = React.createContext(false) : null);
    }
    function iconPacksKeepOriginal() {
        // useContext only reads a value (it keeps no hook state), so calling it only while a pack is on is safe.
        const ctx = iconPacksOriginalContext();
        if (!ctx || !React.useContext) return false;
        try { return React.useContext(ctx) === true; } catch (_) { return false; }
    }
    // Discord's own image for an icon, already resolved: the Image and resolveAssetSource hooks only swap numeric
    // asset IDs, so this one stays Discord's even while a pack is on.
    function iconPacksOriginalProps(props) {
        const id = props.source, resolve = iconPacks.resolveOriginal;
        if (typeof id !== "number" || typeof resolve !== "function") return props;
        let src = null;
        try { src = resolve(id); } catch (_) {}
        return src && typeof src === "object" ? Object.assign({}, props, {source:src}) : props;
    }
    function baseIconImageHook(orig, self, args) {
        if (!iconPacks.hasActive) return orig.apply(self, args);
        const props = args[0];
        if (!props) return orig.apply(self, args);
        if (iconPacksKeepOriginal()) return orig.call(self, iconPacksOriginalProps(props));
        const entry = iconPacksEntry(props.source);
        if (entry === ICONPACK_MISS) return orig.apply(self, args);
        const next = Object.assign({}, props);
        if (entry.source) next.source = entry.source;
        if (entry.tint) next.color = entry.tint;
        return orig.call(self, next);
    }
    baseIconImageHook.call1 = (orig, self, props) => {
        if (!iconPacks.hasActive || !props) return orig.call(self, props);
        if (iconPacksKeepOriginal()) return orig.call(self, iconPacksOriginalProps(props));
        const entry = iconPacksEntry(props.source);
        if (entry === ICONPACK_MISS) return orig.call(self, props);
        const next = Object.assign({}, props);
        if (entry.source) next.source = entry.source;
        if (entry.tint) next.color = entry.tint;
        return orig.call(self, next);
    };
    // Direct <RN.Image source={assetId} /> and resolveAssetSource(assetId) callers (legacy ic_* icons, illustrations, status icons).
    function resolveAssetSourceHook(orig, self, args) {
        if (iconPacks.hasActive) {
            const entry = iconPacksEntry(args[0]);
            if (entry.source) return entry.source;
        }
        return orig.apply(self, args);
    }
    resolveAssetSourceHook.call1 = (orig, self, srcId) => {
        if (iconPacks.hasActive) {
            const entry = iconPacksEntry(srcId);
            if (entry.source) return entry.source;
        }
        return orig.call(self, srcId);
    };
    // Every <Image> in Discord (avatars, attachments, emojis, icons) renders through this while a pack is on, and most
    // aren't replaced, so the miss path matters. React calls a function component as (props, secondArg): call2 skips
    // passing arguments on, and a hit no longer copies args (2.16x on Hermes).
    function imageHook(orig, self, args) {
        const props = args[0];
        if (!iconPacks.hasActive || !props) return orig.apply(self, args);
        const entry = iconPacksEntry(props.source);
        if (!entry.source) return orig.apply(self, args);
        const nextArgs = Array.from(args);
        nextArgs[0] = iconPacksImageProps(props, entry);
        return orig.apply(self, nextArgs);
    }
    imageHook.call2 = (orig, self, props, second) => {
        if (!iconPacks.hasActive || !props) return orig.call(self, props, second);
        const entry = iconPacksEntry(props.source);
        return entry.source ? orig.call(self, iconPacksImageProps(props, entry), second) : orig.call(self, props, second);
    };
    imageHook.call1 = (orig, self, props) => imageHook.call2(orig, self, props, undefined);
    function iconPacksImageProps(props, entry) {
        const next = Object.assign({}, props, {source:entry.source});
        if (entry.tint) next.style = next.style ? [next.style, {tintColor:entry.tint}] : {tintColor:entry.tint};
        return next;
    }
    function hookImageModule(exports) {
        return exports && exports.default ? hookComponent(exports, imageHook) : exports;
    }
    function hookAssetRegistryModule(exports) {
        if (exports && typeof exports.getAssetByID === "function") {
            iconPacks.registry = exports;
            if (enabled("iconPacks")) { iconPacks.appliedKey = ""; iconPacksApply(); }
        }
        return exports;
    }
    function iconPacksPersist() {
        if (!files || !iconPacks.loaded) return;
        // Only the pack in use keeps its file list on the phone (~40-90 KB); others download again when picked. Keeping
        // every list (558 KB for the 10 built-in packs) neared the 1 MB cap, past which nothing was saved, not even your pick.
        const treesObj = {}, inUse = iconPacksActiveEntry(), keepId = inUse && !inUse.custom ? inUse.id : "", keep = keepId && iconPacks.trees.get(keepId);
        if (keep && keep.size && keep.size <= 4000) treesObj[keepId] = Array.from(keep);
        const payload = JSON.stringify({
            version:1,
            active:iconPacks.active || "",
            custom:iconPacks.custom.slice(0, ICONPACKS_MAX_CUSTOM),
            trees:treesObj
        });
        if (payload.length > ICONPACKS_MAX_BYTES) return;
        Promise.resolve().then(() => files.writeFile("documents", ICONPACKS_FILE, payload, "utf8")).catch(() => {});
    }
    function iconPacksRestore() {
        if (iconPacks.loaded || iconPacks.loading || !files) return;
        let constants;
        try { constants = typeof files.getConstants === "function" ? files.getConstants() : files; } catch (_) { constants = {}; }
        const dir = constants && constants.DocumentsDirPath;
        if (typeof dir !== "string") { iconPacks.loaded = true; return; }
        const path = dir.replace(/\/$/, "") + "/" + ICONPACKS_FILE;
        iconPacks.loading = true;
        Promise.resolve().then(() => files.fileExists(path)).then(exists => exists ? files.readFile(path, "utf8") : null).then(text => {
            if (text && text.length <= ICONPACKS_MAX_BYTES) {
                const parsed = JSON.parse(text);
                if (parsed && typeof parsed === "object") {
                    if (parsed.trees && typeof parsed.trees === "object" && !Array.isArray(parsed.trees)) {
                        for (const id of Object.keys(parsed.trees)) {
                            const arr = parsed.trees[id];
                            if (Array.isArray(arr) && arr.length) iconPacks.trees.set(id, new Set(arr.filter(x => typeof x === "string")));
                        }
                    }
                    if (Array.isArray(parsed.custom) && !iconPacks.custom.length) {
                        const list = [];
                        parsed.custom.slice(0, ICONPACKS_MAX_CUSTOM).forEach(item => {
                            const clean = sanitizeCustomIconPack(item);
                            if (clean && !list.some(x => x.id === clean.id)) list.push(clean);
                        });
                        iconPacks.custom = list;
                    }
                    if (!iconPacks.active && typeof parsed.active === "string" && parsed.active) {
                        iconPacks.active = normalizeIconPackId(parsed.active);
                    }
                }
            }
        }).catch(() => {}).then(() => {
            iconPacks.loading = false;
            iconPacks.loaded = true;
            if (enabled("iconPacks")) { iconPacks.appliedKey = ""; iconPacksApply(); }
            notify("iconPacks");
        });
    }
    function iconPacksInstallFromUrl(rawUrl, onDone) {
        const input = typeof rawUrl === "string" ? rawUrl.trim() : "";
        if (!/^https?:\/\/\S+/i.test(input)) {
            iconPacks.error = tr("Enter a valid https:// or http:// link to an icon pack.");
            notify("iconPacks");
            return Promise.resolve(false);
        }
        const url = normalizeThemeUrl(input);
        // If the link is a folder base URL (doesn't end in .json), add it directly as a custom icon pack base URL.
        if (!/\.json(?:[?#]|$)/i.test(url)) {
            const spec = sanitizeCustomIconPack({load:url});
            if (!spec) {
                iconPacks.error = tr("Enter a valid https:// or http:// link to an icon pack.");
                notify("iconPacks");
                return Promise.resolve(false);
            }
            iconPacks.loaded = true;
            const idx = iconPacks.custom.findIndex(p => p.id === spec.id || p.load === spec.load);
            if (idx >= 0) iconPacks.custom[idx] = spec;
            else {
                if (iconPacks.custom.length >= ICONPACKS_MAX_CUSTOM) iconPacks.custom.pop();
                iconPacks.custom.unshift(spec);
            }
            iconPacks.active = spec.id;
            iconPacks.error = "";
            iconPacksPersist();
            iconPacks.appliedKey = "";
            iconPacksApply();
            reviewToast(reviewUI(), tr("Applied {name}", {name:spec.name}), venusIcon(6868, "CircleCheckIcon"));
            if (typeof onDone === "function") onDone();
            return Promise.resolve(true);
        }
        if (typeof global.fetch !== "function") {
            iconPacks.error = tr("Can't reach the internet right now. Try again in a moment.");
            notify("iconPacks");
            return Promise.resolve(false);
        }
        iconPacks.installing = true;
        iconPacks.error = "";
        notify("iconPacks");
        let timer;
        const timeout = new Promise((_, reject) => {
            timer = later(() => reject(new Error(tr("Icon pack download timed out."))), ICONPACKS_TIMEOUT_MS, false);
        });
        return Promise.race([
            Promise.resolve().then(() => global.fetch(url, {method:"GET", headers:{Accept:"application/json, text/plain, */*"}})).then(res => {
                if (!res || !res.ok) throw new Error(tr("Couldn't download icon pack (HTTP {status}).", {status:res && res.status || "error"}));
                return res.text();
            }),
            timeout
        ]).then(text => {
            if (timer !== undefined && typeof global.clearTimeout === "function") global.clearTimeout(timer);
            if (typeof text !== "string" || !text.trim()) throw new Error(tr("The link returned an empty file."));
            if (text.length > ICONPACKS_MAX_BYTES) throw new Error(tr("That icon pack file is too large."));
            let json;
            try { json = JSON.parse(text); } catch (_) { throw new Error(tr("That link didn't return valid JSON.")); }
            const spec = sanitizeCustomIconPack(Object.assign({url}, json));
            if (!spec) throw new Error(tr("That JSON file has no icon pack load URL."));
            iconPacks.loaded = true;
            const idx = iconPacks.custom.findIndex(p => p.id === spec.id || p.load === spec.load);
            if (idx >= 0) iconPacks.custom[idx] = spec;
            else {
                if (iconPacks.custom.length >= ICONPACKS_MAX_CUSTOM) iconPacks.custom.pop();
                iconPacks.custom.unshift(spec);
            }
            iconPacks.active = spec.id;
            iconPacks.installing = false;
            iconPacks.error = "";
            iconPacksPersist();
            iconPacks.appliedKey = "";
            iconPacksApply();
            reviewToast(reviewUI(), tr("Applied {name}", {name:spec.name}), venusIcon(6868, "CircleCheckIcon"));
            if (typeof onDone === "function") onDone();
            return true;
        }).catch(err => {
            if (timer !== undefined && typeof global.clearTimeout === "function") global.clearTimeout(timer);
            iconPacks.installing = false;
            iconPacks.error = String(err && err.message || err);
            notify("iconPacks");
            return false;
        });
    }
    function iconPacksUse(id) {
        if (!enabled("iconPacks") || iconPacks.installing) return;
        const norm = id ? normalizeIconPackId(id) : "";
        if (iconPacks.active === norm) return;
        haptic("SELECTION"); animateLayout();
        iconPacks.loaded = true;
        iconPacks.active = norm;
        iconPacks.error = "";
        const pack = iconPackById(norm);
        if (pack && !pack.custom && !iconPacks.trees.has(pack.id)) iconPacksFetchTree(pack);
        iconPacksPersist();
        iconPacks.appliedKey = "";
        iconPacksApply();
    }
    function iconPacksRemoveCustom(id) {
        iconPacks.loaded = true;
        const idx = iconPacks.custom.findIndex(p => p.id === id);
        if (idx < 0) return;
        const removed = iconPacks.custom[idx];
        iconPacks.custom.splice(idx, 1);
        iconPacks.trees.delete(id);
        if (iconPacks.active === id) iconPacks.active = "";
        iconPacksPersist();
        iconPacks.appliedKey = "";
        iconPacksApply();
        reviewToast(reviewUI(), tr("Removed {name}", {name:removed.name}), venusIcon(5049, "TrashIcon"));
    }
    function iconPacksClearCustom() {
        iconPacks.loaded = true;
        iconPacks.custom.forEach(p => iconPacks.trees.delete(p.id));
        iconPacks.custom = [];
        if (iconPacks.active && !BUILTIN_ICONPACKS.some(p => p.id === iconPacks.active)) iconPacks.active = "";
        iconPacks.error = "";
        iconPacksPersist();
        iconPacks.appliedKey = "";
        iconPacksApply();
        reviewToast(reviewUI(), "Custom icon packs cleared", venusIcon(5049, "TrashIcon"));
    }
    // Six icons that exist in every built-in pack and represent Discord's core surfaces: Chat, Notifications, Friends,
    // Reactions, Settings and Voice. Each tile in the gallery renders these 6 icons directly from that pack's URLs.
    const ICONPACK_SHOWCASE = [
        [8194, "ChatIcon"],
        [8768, "BellIcon"],
        [4815, "FriendsIcon"],
        [8956, "ReactionIcon"],
        [7092, "SettingsIcon"],
        [11106, "MicrophoneIcon"]
    ];
    // The pack's own image for a design-system icon, or "" when its file list says it has none (then Discord's stays).
    function iconPackSampleUri(pack, iconName) {
        if (!pack) return "";
        const rel = withPackSuffix(ICONPACK_REDESIGN_DIR + "/" + iconName + ".png", pack.suffix || ""), tree = iconPacks.trees.get(pack.id);
        return tree && tree.size && !tree.has(rel) ? "" : pack.load + rel;
    }
    // One icon as it looks with this pack: the pack's image in the given color, or Discord's own icon when the pack
    // doesn't have it or the image fails to load, so a preview never shows an empty box.
    function PackIcon(props) {
        const [failed, setFailed] = React.useState(""), uri = props.pack ? iconPackSampleUri(props.pack, props.name) : "", px = props.px || 22;
        if (uri && uri !== failed && RN.Image) return el(RN.Image, {source:{uri, width:px, height:px}, fadeDuration:0, resizeMode:"contain",
            style:{width:px, height:px, tintColor:props.color || undefined}, onError:() => setFailed(uri)});
        const icon = el(venusIcon(props.id, props.name), {size:px >= 22 ? "sm" : "xs", color:props.color});
        const ctx = iconPacksOriginalContext();
        return ctx ? el(ctx.Provider, {value:true}, icon) : icon;
    }
    // A mini icon showcase inside each gallery tile: 6 icons in a 3x2 grid on a soft themed surface.
    function iconPackMiniGrid(pack, k, tintColor) {
        return el(RN.View, {style:{height:84, borderRadius:12, backgroundColor:k.segTrack.backgroundColor, paddingHorizontal:12, paddingVertical:10,
            flexDirection:"row", flexWrap:"wrap", alignItems:"center", justifyContent:"space-between", rowGap:10}},
            ICONPACK_SHOWCASE.map(([modId, iconName]) => el(RN.View, {key:iconName, style:{width:"30%", alignItems:"center", justifyContent:"center"}},
                el(PackIcon, {pack, id:modId, name:iconName, color:tintColor}))));
    }
    // Live preview at the top of the Icon packs page: shows a channel header, a message with quick actions, a message bar
    // and Discord's bottom tab bar, all using the active icon pack and updating immediately when you tap any pack below.
    function IconPacksPreview(props) {
        useSettings("iconPacks");
        if (features.customThemes) useSettings("customThemes");
        const s = useChatPreviewStyles(), k = usePreviewChrome(), on = !!props.on, active = props.active;
        const packLabel = active ? active.name : tr("Discord's icons");
        // Drawn from the active pack directly, so the preview changes the moment you tap a pack (Discord's own icons only
        // switch once the pack's file list has loaded) and falls back to Discord's icon for one the pack lacks.
        const pack = on ? active : null;
        const TabIcon = (modId, name, selected) => el(RN.View, {key:name, style:{flex:1, alignItems:"center", justifyContent:"center", paddingVertical:8, gap:3}},
            el(PackIcon, {pack, id:modId, name, color:selected ? s.name.color : k.iconMuted.color}),
            el(RN.View, {style:{width:selected ? 16 : 0, height:3, borderRadius:1.5, backgroundColor:k.brandFg.color}}));
        const body = el(RN.View, {key:"body", style:{paddingVertical:2}},
            previewMessage(s, "msg", "Sam", "#5865f2", tr("Today at 4:01 PM"),
                el(RN.View, {style:{gap:6}},
                    el(RN.Text, {style:s.text}, tr("Switched to {pack} — every icon updates at once!", {pack:packLabel})),
                    el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:8, marginTop:2}},
                        [[8956, "ReactionIcon", "3"], [12838, "ArrowAngleLeftUpIcon", tr("Reply")], [5042, "CopyIcon", tr("Copy Text")], [9549, "StarIcon", ""]].map(([id, name, label]) =>
                            el(RN.View, {key:name, style:[k.headerPill, {flexDirection:"row", width:undefined, height:28, paddingHorizontal:9, gap:5}]},
                                el(PackIcon, {pack, id, name, px:16, color:k.icon.color}),
                                label ? el(RN.Text, {style:[s.muted, {fontSize:12, fontWeight:"600"}]}, label) : null))))));
        const tabs = el(RN.View, {key:"tabs", style:[k.strip, {flexDirection:"row", alignItems:"center", paddingHorizontal:8}]},
            TabIcon(8194, "ChatIcon", true),
            TabIcon(4815, "FriendsIcon", false),
            TabIcon(8768, "BellIcon", false),
            TabIcon(7092, "SettingsIcon", false));
        return el(RN.View, {key:"preview"},
            previewScreen(s, "preview", "Icon packs preview", [body], {
                header:previewHeader(k, {title:"design", icons:[[10334, "PinIcon"], [8768, "BellIcon"], [6740, "MagnifyingGlassIcon"]]}),
                footer:el(RN.View, {key:"foot"},
                    previewInput(k, s, {placeholder:tr("Message {channel}", {channel:"#design"})}),
                    tabs,
                    !on ? null : previewCaption(s, active ? tr("{name} is active across Discord.", {name:active.name}) : tr("Tap any icon pack below to try it live.")))
            }));
    }
    function IconPacksSettings() {
        useSettings("iconPacks");
        if (features.customThemes) useSettings("customThemes");
        const [urlDraft, setUrlDraft] = React.useState("");
        const ui = reviewUI();
        React.useEffect(() => {
            if (enabled("iconPacks")) iconPacksRestore();
        }, []);
        if (!React || !RN) return null;
        const s = useThemeTileStyles(), k = usePreviewChrome();
        const Group = ui.TableRowGroup || RN.View, Switch = ui.TableSwitchRow, Text = inspectedExport(5088, "Text"), Press = RN.Pressable || RN.View, Check = venusIcon(6823, "CheckmarkSmallIcon");
        const on = enabled("iconPacks"), busy = iconPacks.installing;
        const canInstall = on && !busy && /^https?:\/\/\S+/i.test(urlDraft.trim());
        const onInstall = () => {
            if (!canInstall) return;
            iconPacksInstallFromUrl(urlDraft, () => setUrlDraft(""));
        };
        const onPaste = () => {
            if (!on || busy) return;
            const clip = ui.clipboard || RN.Clipboard;
            if (!clip || typeof clip.getString !== "function") return;
            Promise.resolve().then(() => clip.getString()).then(str => {
                if (typeof str === "string" && str.trim()) setUrlDraft(str.trim());
            }).catch(() => {});
        };
        const empty = !urlDraft.trim();
        const urlInput = inputWithButton(ui, "input", {
            label:tr("Icon pack link"),
            value:urlDraft,
            autoCapitalize:"none",
            autoCorrect:false,
            keyboardType:"url",
            placeholder:tr("https://.../pack/ or config.json"),
            onSubmitEditing:onInstall,
            returnKeyType:"go",
            editable:on && !busy,
            isDisabled:!on || busy
        }, text => setUrlDraft(String(text || "")), busy ? "Installing…" : empty ? "Paste" : "Install", empty ? onPaste : onInstall, empty ? !on || busy : !canInstall);
        const line = (value, variant, color, fallback) => Text ? el(Text, {variant, color, lineClamp:1, numberOfLines:1}, value) :
            el(RN.Text, {style:fallback, numberOfLines:1}, value);
        const text = (value, variant, color, fallback) => Text ? el(Text, {variant, color}, value) : el(RN.Text, {style:fallback}, value);
        const active = iconPacksActiveEntry();
        const activeTheme = features.customThemes && enabled("customThemes") ? customThemesActiveEntry() : null;
        const themePack = activeTheme && activeTheme.plus && activeTheme.plus.iconpack ? iconPackById(activeTheme.plus.iconpack) : null;
        const followingTheme = !!(on && settings.iconPacksTheme && themePack);
        const makeTile = opts => el(Press, {
            key:opts.key,
            style:[s.tile, opts.selected ? s.on : null, {opacity:opts.disabled ? 0.5 : 1}],
            accessibilityRole:"radio",
            accessibilityLabel:opts.name,
            accessibilityHint:opts.sub || undefined,
            accessibilityState:{selected:!!opts.selected, disabled:!!opts.disabled},
            disabled:!!opts.disabled,
            onPress:opts.onPress,
            onLongPress:opts.onLongPress,
            delayLongPress:400
        },
        iconPackMiniGrid(opts.pack, k, k.icon.color),
        opts.selected ? el(RN.View, {style:s.check, pointerEvents:"none"}, popIn("check:" + opts.key, el(Check, {size:"xs", color:"#ffffff"}))) : null,
        el(RN.View, {style:{paddingHorizontal:8, paddingTop:8, paddingBottom:6, gap:1}},
            line(opts.name, "text-sm/semibold", "text-strong", {color:"#f2f3f5", fontSize:14, fontWeight:"600"}),
            opts.sub ? line(opts.sub, "text-xs/medium", "text-muted", {color:"#949ba4", fontSize:12}) : null));
        const tiles = [makeTile({
            key:"discord",
            pack:null,
            name:tr("Discord's icons"),
            sub:on && !active ? tr("In use") : tr("Default"),
            selected:on && !active,
            disabled:!on || busy,
            onPress:() => { if (followingTheme) setSetting("iconPacksTheme", false); iconPacksUse(""); }
        })];
        iconPackCatalog().forEach(pack => {
            if (!pack) return;
            const selected = !!(on && active && active.id === pack.id);
            const isLoading = iconPacks.loadingTrees.has(pack.id);
            const sub = selected ? (isLoading ? tr("Loading icons…") : followingTheme && themePack && themePack.id === pack.id ? tr("From theme") : tr("In use")) :
                pack.authors ? tr("by {author}", {author:pack.authors}) : pack.description || "";
            tiles.push(makeTile({
                key:"pack:" + pack.id,
                pack,
                name:pack.name,
                sub,
                selected,
                disabled:!on || busy,
                onPress:() => { if (followingTheme && themePack && themePack.id !== pack.id) setSetting("iconPacksTheme", false); iconPacksUse(pack.id); },
                onLongPress:pack.custom ? () => confirmAction("Remove icon pack?", tr("Remove {name} from this phone?", {name:pack.name}), "Remove", () => iconPacksRemoveCustom(pack.id)) : undefined
            }));
        });
        const gallery = el(RN.View, {key:"packs", style:{gap:8}},
            groupTitle("title", "Icon packs"),
            el(RN.View, {style:{flexDirection:"row", flexWrap:"wrap", justifyContent:"space-between", rowGap:12}, accessibilityRole:"radiogroup"}, tiles));
        const problem = on && iconPacks.error ? el(RN.View, {key:"error", style:{paddingHorizontal:12, paddingBottom:12, gap:2}, accessibilityLiveRegion:"polite"},
            text(tr("Couldn't install the icon pack"), "text-sm/semibold", "text-feedback-critical", {color:"#f23f43", fontSize:14, fontWeight:"600"}),
            text(iconPacks.error, "text-xs/medium", "text-muted", {color:"#949ba4", fontSize:12})) : null;
        // A built-in pack whose file list couldn't be downloaded keeps Discord's icons; say why and offer to try again,
        // instead of the pack looking picked but doing nothing.
        const stuck = on && active && !active.custom && !iconPacks.trees.has(active.id) && !iconPacks.loadingTrees.has(active.id) &&
            (iconPacks.treeTries.get(active.id) || 0) > 0;
        const RetryButton = stuck ? inspectedExport(5379, "Button") : null;
        const retry = () => { haptic("SELECTION"); iconPacks.treeTries.delete(active.id); iconPacksFetchTree(active); notify("iconPacks"); };
        const groups = [
            on ? null : offCard("status", venusIcon(11063, "ImageSparkleIcon"), "iconPacks"),
            stuck ? statusCard("status", "Can't reach the internet right now. Try again in a moment.", {title:active.name, IconComponent:venusIcon(11063, "ImageSparkleIcon"),
                trailing:RetryButton ? el(RetryButton, {text:tr("Retry"), size:"sm", variant:"secondary", onPress:retry}) : null}) : null,
            el(IconPacksPreview, {key:"preview", on, active}),
            gallery,
            // Its only row needs Custom themes; without it the group was an empty "Display" title.
            features.customThemes ? el(Group, {key:"display", title:tr("Display")},
                switchRow(Switch, "iconPacksTheme", "Follow theme's icon pack", "Uses the icon pack recommended by your active custom theme, when it sets one.", rowIcon(15652, "EyeDropperIcon"))) : null,
            el(Group, {key:"install", title:tr("Add from link"), description:tr("Paste a custom icon pack folder URL or config.json link.")},
                el(RN.View, {key:"input", style:{padding:12}}, urlInput), problem),
            iconPacks.custom.length ? el(Group, {key:"manage", title:tr("Manage")},
                actionRow(ui, "clear", "Clear custom icon packs",
                    pl(iconPacks.custom.length, "Removes {n} custom icon pack from this phone.", "Removes {n} custom icon packs from this phone."),
                    () => confirmAction("Clear custom icon packs?", "Every custom icon pack you added will be removed from this phone.", "Clear", iconPacksClearCustom),
                    !on, true)) : null,
            footnote("note", iconPacks.custom.length ? "Hold a custom icon pack to remove it. Icons change right away, with no restart." : "Icons change across Discord right away, with no restart.")
        ];
        return settingsBody(ui, groups, {keyboardShouldPersistTaps:"handled"});
    }
    // Message highlights settings: a live chat preview, the bar width as a segmented choice, and a row of color
    // swatches per highlight, with Discord's own color picker (showCustomColorPickerActionSheet 14850) for any color.
    const HIGHLIGHT_PING_CHOICES = [["default", "Yellow", "#f0b232"], ["blurple", "Blurple", "#5865f2"], ["cyan", "Cyan", "#00a8fc"],
        ["green", "Green", "#23a55a"], ["pink", "Pink", "#eb459e"], ["purple", "Purple", "#9b59b6"]];
    const HIGHLIGHT_DELETED_CHOICES = [["default", "Red", "#f23f43"], ["orange", "Orange", "#e67e22"], ["yellow", "Yellow", "#f0b232"],
        ["pink", "Pink", "#eb459e"], ["purple", "Purple", "#9b59b6"], ["cyan", "Cyan", "#00a8fc"]];
    const HIGHLIGHT_DARK = {chat:{borderRadius:16, overflow:"hidden", backgroundColor:"#1a1a1e", borderWidth:1, borderColor:"#ffffff14", paddingVertical:8},
        name:{color:"#f2f3f5", fontSize:15, fontWeight:"600"}, text:{color:"#dbdee1", fontSize:15, lineHeight:20}, muted:{color:"#949ba4", fontSize:12},
        spine:{borderColor:"#4e5058"}, mention:{backgroundColor:"#5865f24d", color:"#c9cdfb", fontWeight:"600"},
        card:{backgroundColor:"#2b2d31", borderRadius:16, paddingHorizontal:16, paddingVertical:16, gap:16}, divider:{height:1, backgroundColor:"#ffffff14"},
        ring:{borderColor:"#f2f3f5"}, dashed:{borderColor:"#949ba4"}};
    // The rounded card the color pickers sit on, in the theme's card color.
    function highlightCardStyle() {
        return useThemed("highlightCard", c => ({card:Object.assign({}, HIGHLIGHT_DARK.card, {backgroundColor:c.CARD_BACKGROUND_DEFAULT}),
            divider:{height:1, backgroundColor:c.BORDER_SUBTLE}}), HIGHLIGHT_DARK).card;
    }
    // Discord's own color picker sheet, the one its role and profile colors use. Returns false when it can't open.
    function highlightPickColor(current, presets, onPick) {
        const show = inspectedExport(14850, "default");
        if (typeof show !== "function") return false;
        try {
            show({color:hexInt(current), suggestedColors:presets.map(choice => choice[2]), onSelect:value => {
                const hex = typeof value === "string" ? (hexInt(value) != null ? intHex(hexInt(value)) : null) : intHex(value);
                if (hex) onPick(hex);
            }});
            return true;
        } catch (_) { return false; }
    }
    // Keyed on the color and width, so it mounts again only when one of them changes. It glows only when the page
    // says that highlight just changed (props.fresh), never on the page's first draw.
    function HighlightGlow(props) {
        const A = motion(), ref = React.useRef(null);
        if (!ref.current && A) ref.current = new A.Value(props.fresh && !reduceMotion ? 1 : 0);
        React.useEffect(() => {
            const value = ref.current;
            if (!value || !props.fresh || reduceMotion) return undefined;
            const run = A.timing(value, {toValue:0, duration:900, easing:easeOut(), useNativeDriver:true});
            run.start();
            return () => run.stop();
        }, []);
        return ref.current ? el(A.View, {pointerEvents:"none", style:{position:"absolute", left:0, right:0, top:0, bottom:0, backgroundColor:props.hex + "40", opacity:ref.current}}) : null;
    }
    function highlightPreview(props) {
        const s = useThemed("highlightPreview", c => ({chat:Object.assign({}, HIGHLIGHT_DARK.chat, {backgroundColor:c.CHANNEL_BACKGROUND_DEFAULT || c.BACKGROUND_BASE_LOWER, borderColor:c.BORDER_SUBTLE}),
            name:Object.assign({}, HIGHLIGHT_DARK.name, {color:c.TEXT_STRONG}), text:Object.assign({}, HIGHLIGHT_DARK.text, {color:c.TEXT_DEFAULT}),
            muted:Object.assign({}, HIGHLIGHT_DARK.muted, {color:c.TEXT_MUTED}), spine:{borderColor:c.INTERACTIVE_MUTED || c.BORDER_STRONG},
            mention:Object.assign({}, HIGHLIGHT_DARK.mention, {backgroundColor:c.MENTION_BACKGROUND, color:c.MENTION_FOREGROUND})}), HIGHLIGHT_DARK);
        const me = props.me, myName = me && (me.globalName || me.global_name || me.username) || tr("you");
        const uri = userNotifAvatarUri(me, 80), bar = props.bar;
        const face = size => uri && RN.Image ? el(RN.Image, {source:{uri}, style:{width:size, height:size, borderRadius:size / 2}}) :
            el(RN.View, {style:{width:size, height:size, borderRadius:size / 2, backgroundColor:"#5865f2", alignItems:"center", justifyContent:"center"}},
                el(RN.Text, {style:{color:"#ffffff", fontSize:Math.round(size * 0.42), fontWeight:"700"}}, myName.slice(0, 1).toUpperCase()));
        const letter = (char, color) => el(RN.View, {style:{width:40, height:40, borderRadius:20, backgroundColor:color, alignItems:"center", justifyContent:"center"}},
            el(RN.Text, {style:{color:"#ffffff", fontSize:16, fontWeight:"700"}}, char));
        const header = (name, time) => el(RN.View, {style:{flexDirection:"row", alignItems:"baseline", marginBottom:2}},
            el(RN.Text, {style:s.name, numberOfLines:1}, name), el(RN.Text, {style:[s.muted, {marginLeft:8}]}, time));
        // A highlight that just changed glows once, like a new mention arriving, then settles to its normal tint.
        // props.count shows only the first few messages (while Watch plays), props.beats replays one's glow, props.ripple
        // marks a tap, and props.onPress makes a highlighted message tappable.
        const Press = RN.Pressable || RN.View, count = props.count == null ? 3 : props.count;
        const message = (key, hex, children) => {
            const beat = props.beats && props.beats[key] || 0;
            const alpha = key === "reply" ? props.pingAlpha || "1a" : key === "deleted" ? props.deletedAlpha || "1a" : "1a";
            const body = el(RN.View, {key, style:{paddingHorizontal:12, paddingVertical:6, backgroundColor:hex ? hex + alpha : undefined}},
                hex ? el(HighlightGlow, {key:"glow:" + hex + ":" + bar + ":" + beat, hex, fresh:!!(props.fresh && props.fresh[key])}) : null,
                hex ? el(RN.View, {style:{position:"absolute", left:0, top:0, bottom:0, width:bar, backgroundColor:hex}}) : null, children,
                props.ripple ? props.ripple(key) : null);
            return hex && props.onPress ? el(Press, {key, onPress:() => props.onPress(key), accessibilityRole:"button", accessibilityHint:tr("Tap to see it light up again")}, body) : body;
        };
        const question = tr("Did everyone see the new update?");
        return el(RN.View, {key:props.key, style:[s.chat, {paddingVertical:0}], accessible:true, accessibilityLabel:tr("Message highlight preview")},
            props.header || null,
            el(RN.View, {style:{paddingVertical:4}},
                message("plain", null, el(RN.View, {style:{flexDirection:"row", gap:12}}, face(40),
                    el(RN.View, {style:{flex:1}}, header(myName, tr("Today at 4:01 PM")), el(RN.Text, {style:s.text}, question)))),
                count < 2 ? null : message("reply", props.ping, el(RN.View, null,
                    el(RN.View, {style:{flexDirection:"row", alignItems:"center", marginBottom:4}},
                        el(RN.View, {style:[{width:28, height:10, marginLeft:19, marginRight:4, marginTop:8, borderLeftWidth:2, borderTopWidth:2, borderTopLeftRadius:6}, s.spine]}),
                        el(RN.View, {style:{marginRight:4}}, face(16)),
                        el(RN.Text, {style:[s.muted, {fontWeight:"600", marginRight:4}], numberOfLines:1}, myName),
                        el(RN.Text, {style:[s.muted, {flex:1}], numberOfLines:1}, question)),
                    el(RN.View, {style:{flexDirection:"row", gap:12}}, letter("S", "#eb459e"),
                        el(RN.View, {style:{flex:1}}, header("Sam", tr("Today at 4:03 PM")),
                            el(RN.Text, {style:s.text}, el(RN.Text, {style:s.mention}, "@" + myName), " " + tr("Yes, it looks great!")))))),
                props.deleted && count >= 3 ? el(RN.View, {style:{height:4}}) : null,
                props.deleted && count >= 3 ? message("deleted", props.pending ? null : props.deleted, el(RN.View, {style:{flexDirection:"row", gap:12}}, letter("A", "#3ba55c"),
                    el(RN.View, {style:{flex:1}}, header("Alex", tr("Today at 4:05 PM")),
                        el(RN.Text, {style:s.text}, tr("Oops, wrong chat. Deleting this."))))) : null,
                props.tip || null),
            props.caption ? previewCaption(s, props.caption) : null, props.footer || null);
    }
    // A live chat preview: your question, Sam's reply mentioning you (highlighted in your reply color), and Alex's kept
    // deleted message (highlighted in your deleted color). Changing the colors or bar width below lights up the matching message right away.
    function HighlightPreview(props) {
        useSettings("messageHighlight");
        const s = useChatPreviewStyles(), k = usePreviewChrome(), given = props.fresh || {};
        return el(RN.View, {key:"preview"},
            highlightPreview({key:"chat", me:props.me, bar:props.bar, ping:props.ping, pingAlpha:props.pingAlpha, deleted:props.deleted, deletedAlpha:props.deletedAlpha,
                fresh:{reply:!!given.reply, deleted:!!given.deleted},
                header:previewHeader(k, {title:"general"}),
                footer:previewInput(k, s, {placeholder:tr("Message {channel}", {channel:"#general"})})}));
    }
    // One highlight's colors: its name and current color, then a row of swatches and a last one for any color.
    function highlightColorPicker(props) {
        const s = useThemed("highlightPicker", c => ({ring:{borderColor:c.TEXT_STRONG}, dashed:{borderColor:c.TEXT_MUTED}}), HIGHLIGHT_DARK);
        const Text = inspectedExport(5088, "Text"), Press = RN.Pressable || RN.View, Check = venusIcon(6823, "CheckmarkSmallIcon"), Dropper = venusIcon(15652, "EyeDropperIcon");
        const value = props.value, on = props.on, custom = typeof value === "string" && value.startsWith("#");
        const active = props.choices.find(choice => choice[0] === value), activeHex = highlightColorHex(value, props.defaultHex);
        const activeName = active ? tr(active[1]) : activeHex.toUpperCase();
        const swatch = (key, label, hex, selected, onPress, inner) => el(RN.View, {key, style:{flex:1, alignItems:"center"}},
            el(Press, {accessible:true, accessibilityRole:"radio", accessibilityLabel:label, accessibilityState:{selected, disabled:!on}, disabled:!on, onPress,
                hitSlop:{top:4, bottom:4, left:2, right:2},
                style:[{width:40, height:40, borderRadius:20, alignItems:"center", justifyContent:"center", borderWidth:2, borderColor:"transparent"}, selected ? s.ring : null, {opacity:on ? 1 : 0.4}]},
                el(RN.View, {style:[{width:30, height:30, borderRadius:15, alignItems:"center", justifyContent:"center", backgroundColor:hex || "transparent"},
                    hex ? null : [{borderWidth:2, borderStyle:"dashed"}, s.dashed]]}, inner)));
        const tick = hex => el(Check, {size:"sm", color:isLightHex(hex) ? "#000000" : "#ffffff"});
        const pickAny = () => { if (on && !highlightPickColor(activeHex, props.choices, hex => setSetting(props.setting, hex)) && props.onNoPicker) props.onNoPicker(); };
        return el(RN.View, {key:props.setting, style:{gap:12}},
            el(RN.View, {style:{flexDirection:"row", alignItems:"center", gap:8}},
                el(RN.View, {style:{flex:1}}, Text ? el(Text, {variant:"text-md/semibold", color:"text-strong"}, tr(props.title)) :
                    el(RN.Text, {style:{color:"#f2f3f5", fontSize:16, fontWeight:"600"}}, tr(props.title))),
                el(RN.View, {style:{width:10, height:10, borderRadius:5, backgroundColor:activeHex}}),
                Text ? el(Text, {variant:"text-sm/medium", color:"text-muted"}, activeName) : el(RN.Text, {style:{color:"#949ba4", fontSize:13}}, activeName)),
            el(RN.View, {style:{flexDirection:"row", alignItems:"center"}, accessibilityRole:"radiogroup"},
                props.choices.map(([choice, label, hex]) => swatch(choice, tr(label), hex, value === choice, () => { if (on && value !== choice) { haptic("SELECTION"); setSetting(props.setting, choice); } },
                    value === choice ? popIn("tick:" + choice, tick(hex)) : null)),
                swatch("custom", tr("Any color"), custom ? value : null, custom, pickAny, custom ? popIn("tick:" + value, tick(value)) : el(Dropper, {size:"xs"}))));
    }
    function MessageHighlightSettings() {
        useSettings("messageHighlight");
        const ui = reviewUI();
        const [hexDraft, setHexDraft] = React.useState(""), [hexOpen, setHexOpen] = React.useState(false);
        // What the preview last showed, so only the highlight you just changed glows.
        const shown = React.useRef(null), card = highlightCardStyle();
        if (!React || !RN) return null;
        const on = enabled("messageHighlight"), showDeleted = !!features.noDelete;
        const pingHex = on ? highlightColorHex(settings.messageHighlightPingColor, "#f0b232") : "#f0b232";
        // Kept deleted messages show here as Keep deleted messages draws them, so the bar width can be judged on both.
        const delHex = highlightColorHex(settings.noDeleteColor, "#f23f43"), delAlpha = highlightAlpha(settings.noDeleteBrightness);
        const barWidth = (on ? settings.messageHighlightThickness : 1) * 2, last = shown.current;
        const pingAlpha = on ? highlightAlpha(settings.messageHighlightBrightness) : "1a";
        const fresh = last ? {reply:last.ping !== pingHex || last.bar !== barWidth || last.alpha !== pingAlpha, deleted:last.bar !== barWidth} : null;
        shown.current = {ping:pingHex, bar:barWidth, alpha:pingAlpha};
        const changed = settings.messageHighlightThickness !== 2 || settings.messageHighlightPingColor !== "default" || settings.messageHighlightBrightness !== 50;
        const resetAll = () => {
            setSetting("messageHighlightThickness", 2); setSetting("messageHighlightPingColor", "default"); setSetting("messageHighlightBrightness", 50);
            setHexOpen(false); reviewToast(ui, "Highlights reset", venusIcon(6868,"CircleCheckIcon"));
        };
        // When Discord's color picker can't open, a hex box opens under the colors instead.
        const cleanHex = String(hexDraft || "").trim(), validHex = /^#?[0-9a-fA-F]{6}$/.test(cleanHex);
        const applyHex = () => {
            if (!on || !validHex) return;
            setSetting("messageHighlightPingColor", (cleanHex.startsWith("#") ? cleanHex : "#" + cleanHex).toLowerCase());
            setHexOpen(false); setHexDraft("");
        };
        const groups = [
            on ? null : offCard("status", venusIcon(16947, "PaintbrushThinIcon"), "messageHighlight"),
            el(HighlightPreview, {key:"preview", on, me:currentUser(), bar:barWidth, ping:pingHex, pingAlpha, deleted:showDeleted ? delHex : null, deletedAlpha:delAlpha, fresh}),
            el(RN.View, {key:"thickness", style:{gap:8}},
                groupTitle("title", "Left bar width"),
                venusSegmented({key:"choice", value:settings.messageHighlightThickness, disabled:!on, onChange:value => setSetting("messageHighlightThickness", value),
                    items:HIGHLIGHT_THICKNESSES.map(n => ({value:n, label:tr("{n} dp", {n:n * 2})}))})),
            el(RN.View, {key:"colors", style:{gap:8}},
                groupTitle("title", "Look"),
                el(RN.View, {style:card},
                    highlightColorPicker({setting:"messageHighlightPingColor", title:"Replies and mentions", choices:HIGHLIGHT_PING_CHOICES, defaultHex:"#f0b232", on,
                        value:settings.messageHighlightPingColor, onNoPicker:() => { setHexOpen(true); setHexDraft(settings.messageHighlightPingColor.startsWith("#") ? settings.messageHighlightPingColor : ""); }}),
                    hexOpen ? inputWithButton(ui, "hex", {value:hexDraft, label:tr("Hex color"), autoCapitalize:"none", autoCorrect:false, maxLength:7, placeholder:"#5865f2",
                        onSubmitEditing:applyHex, returnKeyType:"done", editable:on, isDisabled:!on}, text => setHexDraft(String(text || "")), "Use", applyHex, !on || !validHex) : null)),
            el(PresetOrCustom, {key:"brightness", title:"Brightness", value:settings.messageHighlightBrightness, disabled:!on, min:0, max:100, placeholder:50,
                inputLabel:tr("Brightness, 0 to 100"), format:n => tr("{n}%", {n}), onChange:value => setSetting("messageHighlightBrightness", value),
                presets:BRIGHTNESS_STEPS.map(n => ({value:n, label:tr("{n}%", {n})})), hint:"How strongly a reply or mention is tinted behind its text. 50% is how Discord draws it."}),
            el(ui.TableRowGroup || RN.View, {key:"manage", title:tr("Manage")},
                actionRow(ui, "reset", "Reset to defaults", "A 4 dp bar, yellow at 50% brightness.", resetAll, !on || !changed)),
            footnote("note", showDeleted ? "Changes show in chat right away, with no restart. Deleted messages have their own color in Keep deleted messages." :
                "Changes show in chat right away, with no restart.")
        ];
        return settingsBody(ui, groups, {keyboardShouldPersistTaps:"handled"});
    }
    function activatePlugins(id, exports) {
        switch (id) {
            case 2129:
                if (exports && exports.default && !localeStore) {
                    localeStore = exports.default;
                    // Following Discord's language: switching it there switches Venus too.
                    try { if (typeof localeStore.addChangeListener === "function") localeStore.addChangeListener(() => {
                        if (settings.language === "auto" && uiLanguage() !== i18n.shownIn) { loadLanguage(uiLanguage()); languageChanged(); }
                        if (enabled("translate") && settings.translateTarget === "discord") translateChanged();
                    }); } catch (_) {}
                }
                return exports;
            case 81:
                if (!features.iconPacks) return exports;
                if (exports && typeof exports.default === "function") iconPacks.resolveOriginal = exports.default;
                return hookExport(exports, "default", resolveAssetSourceHook);
            case 84: return features.iconPacks ? hookAssetRegistryModule(exports) : exports;
            case 328: return features.iconPacks ? hookImageModule(exports) : exports;
            case 4817: return features.iconPacks ? hookExport(exports, "BaseIconImage", baseIconImageHook) : exports;
            case 9464: return features.appIcons ? hookAppIconConstants(exports) : exports;
            case 18051: return features.appIcons ? hookAppIconPremiumManager(exports) : exports;
            case 15831: case 15832: case 17697: return features.appIcons ? hookComponent(exports, appIconsScreen) : exports;
            case 4937: return features.nitroThemes ? hookThemeBackgroundStore(exports) : exports;
            case 2046: {
                const creators = features.nitroThemes && exports && exports.PreloadedUserSettingsActionCreators;
                if (creators && typeof creators.updateAsync === "function") hookExport(creators, "updateAsync", nitroThemeUpdateAsync);
                return exports;
            }
            case 15566: return features.nitroThemes ? hookComponent(exports, nitroThemePicker) : exports;
            case 589: return features.customThemes ? hookSemanticColorsModule(exports) : exports;
            case 591: return features.customThemes ? hookRawColorsModule(exports) : exports;
            case 590: return features.customThemes ? hookExperimentColorsModule(exports) : exports;
            case 11191: return (features.customThemes || features.iconPacks) ? hookComponent(exports, rootThemeContextProvider, "RootThemeContextProvider") : exports;
            case 1205: if ((features.customThemes || features.iconPacks) && exports && exports.default) customThemes.themeStore = exports.default; return exports;
            case 4831: return (features.customThemes || features.iconPacks) ? hookCreateThemedContext(exports) : exports;
            case 10368:
                // ChatViewWrapper {channelId, stickyHeader, children}: the theme background behind chat, and the translate bar (#82)
                // in the sticky header slot above the messages, where Discord shows its own New messages bar.
                if (features.translate) exports = hookComponent(exports, translateBarHeader);
                return features.customThemes ? hookComponent(exports, chatViewWrapperThemeBackground) : exports;
            case 12129: return features.accountSwitcher ? hookMultiAccountStore(exports) : exports;
            case 6623: return features.accountSwitcher ? hookComponent(exports, addAccountLogin) : exports;
            case 16840: return features.accountSwitcher ? hookComponent(exports, manageAccountsModalWithRegister) : exports;
            case 16387: return features.accountSwitcher ? hookRegisterForMultiAccount(exports) : exports;
            case 5938: return features.accountSwitcher ? hookTrackedHttpForSignUp(exports) : exports;
            case 12131: return features.accountSwitcher ? hookIsStaffForMultiAccount(exports) : exports;
            case 4760: if (features.userNotif && exports && exports.default) { userNotif.relationships = exports.default; userNotifSeedStatuses(); } return exports;
            case 2087: if (features.userNotif && exports && exports.default) { userNotif.guilds = exports.default; userNotifSubscribeGuilds(); } return exports;
            case 9699: if ((features.quests || features.badges || features.userNotif) && exports && exports.default) { bgKeepAlive.fg = exports.default; backgroundSync(); } return exports;
            case 13933: return (features.quests || features.badges || features.userNotif) ? hookGatewaySocket(exports) : exports;
            case 13968: return (features.quests || features.badges || features.userNotif) ? hookPauseGateway(exports) : exports;
            case 5759: return features.badges ? hookSelfPresenceStore(exports) : exports;
            case 8312: if (features.badges && exports && exports.default) badgesAttachStore(exports.default); return exports;
            case 9675: return features.translate ? hookComponent(exports, translateSheet) : exports;
            case 9255: return features.splitMessages ? maxLengthModule(exports) : exports;
            case 16858: return (features.youBarSettings || features.accountSwitcher) ? hookComponent(exports, youBarButtons) : exports;
            // MurmurHashV3 is CommonJS (module.exports=function), not an ES default export.
            case 1264: if (features.pastelize) pastelHash = typeof exports === "function" ? exports : exports.default; return exports;
            case 2125: if (features.pastelize) guildMembers = exports.default; return exports;
            case 7742:
                if ((features.pastelize || features.noDelete || features.translate || features.messageHighlight) && exports.default && exports.default.prototype)
                    hookExport(exports.default.prototype, "generate", messageRow);
                return exports;
            case 5108: if (features.platformIndicators || features.userNotif) { presenceStore = exports.default; if (features.userNotif) userNotifSeedStatuses(); } return exports;
            case 5112: if (features.platformIndicators) sessionsStore = exports.default; return exports;
            case 10533:
                if (!features.platformIndicators) return exports;
                displayNameType = exports.DisplayName;
                exports = hookExport(exports, "DisplayName", platformName);
                return hookComponent(exports, (orig, self, args) => wrapProfileTree(orig.apply(self, args), displayNameType, platformName, platformWrappers));
            case 12862: return features.platformIndicators ? hookComponent(exports, platformHeader) : exports;
            case 16475: return features.platformIndicators ? hookComponent(exports, platformDmRow) : exports;
            // User list rows (UserRow, default export) and voice panel rows (FormComponents' named MemberRowItem).
            case 10229: return features.platformIndicators ? hookComponent(exports, (orig, self, args) => platformPlacement(orig, self, args, "piUserList")) : exports;
            case 8792: return features.platformIndicators ? hookComponent(exports, (orig, self, args) => platformPlacement(orig, self, args, "piUserList"), "MemberRowItem") : exports;
            // Profile "in voice" users (UserProfileActivityVoiceChannelUsers): private UserRow rows.
            case 13156:
                return features.platformIndicators ? hookComponent(exports, (orig, self, args) => {
                    const tree = orig.apply(self, args);
                    if (!enabled("platformIndicators") || !settings.piUserList || !React || !tree) return tree;
                    return cloneTree(tree, (node, p) => {
                        if (typeof p.renderItem !== "function" || p.__venusPlatforms) return p;
                        const render = p.renderItem;
                        // Same wrapper for the same renderItem, so the list doesn't redraw every row.
                        let renderItem = platformRenderers.get(render);
                        if (!renderItem) platformRenderers.set(render, renderItem = function () { return platformRow(render.apply(this, arguments)); });
                        return Object.assign({}, p, {__venusPlatforms:true, renderItem});
                    }, 0);
                }) : exports;
            // Plain status dot on avatars: avatar Status (design/void/Status,
            // 14419) draws a phone badge when isMobileOnline; show the plain dot instead.
            case 14419: {
                if (!features.platformIndicators) return exports;
                const plain = (orig, self, args) => {
                    const props = args[0];
                    if (!enabled("platformIndicators") || !settings.piHideMobile || !props || !props.isMobileOnline) return orig.apply(self, args);
                    const next = Array.from(args); next[0] = Object.assign({}, props, {isMobileOnline:false}); return orig.apply(self, next);
                };
                plain.call1 = (orig, self, props) => !enabled("platformIndicators") || !settings.piHideMobile || !props || !props.isMobileOnline ?
                    orig.call(self, props) : orig.call(self, Object.assign({}, props, {isMobileOnline:false}));
                return hookExport(hookExport(exports, "default", plain), "StatusWithTyping", plain);
            }
            case 16754: return features.readAll ? hookExport(exports, "default", readAllBarProps) : exports;
            case 16748: return features.serverInfo ? hookExport(exports, "default", serverInfoMenu) : exports;
            case 10725: if (features.reviewDB) oauthModal = exports.default; return exports;
            case 6265: if (features.reviewDB) nativeRowGroup = exports.TableRowGroup; return exports;
            case 6896: if (features.reviewDB) nativeSwitchRow = exports.TableSwitchRow; return exports;
            case 16671:
                if (!features.hiddenChannels) return exports;
                // ChannelInfo can be consumed as default export and as named export
                // (GuildRolesAndChannelsRow reads it by name); hook both.
                exports = hookComponent(exports, hiddenInfo);
                return hookExport(exports, "ChannelInfo", hiddenInfo);
            case 13181: return features.reviewDB ? hookComponent(exports, reviewNote) : exports;
            case 14281: return features.reviewDB ? hookExport(exports, "ContextMenuPopout", reviewMenu) : exports;
            case 14213: return features.reviewDB ? hookComponent(exports, reviewGuild) : exports;
            case 11935: case 12146: return features.hideGift && exports && exports.default ? replaceValue(exports, "default", propsComponent(exports.default, withoutGift)) : exports;
            case 13425: return features.hideCall ? hookComponent(exports, profileButtons) : exports;
            case 9115: return features.hideButtons ? hookComponent(exports, youPillButtons) : exports;
            case 10028: return features.hideButtons && exports && exports.default ? replaceValue(exports, "default", propsComponent(exports.default, attachMenuButtons)) : exports;
            case 15371: return features.hideQuestDock ? hideQuestHooks(exports) : exports;
            case 15465: return features.hideQuestDock ? hideQuestDock(exports) : exports;
            case 6820: return features.systemEmoji && exports && exports.default ? replaceValue(exports, "default", propsComponent(exports.default, systemEmojiProps)) : exports;
            case 14839: exports.SETTING_RENDERER_CONFIG = nativeRegistry(exports.SETTING_RENDERER_CONFIG); return exports;
            case 10664: return hookExport(exports, "createList", settingsSections);
            case 14971: SettingsList = exports.SettingsList; return exports;
            case 10615: return features.copyBios ? hookComponent(exports, copyBio) : exports;
            case 5421:
                if (!features.dashless && !features.hiddenChannels) return exports;
                exports = hookExport(exports, "computeChannelName", channelLabel);
                return hookExport(exports, "default", useChannelLabel);
            case 5412: return features.dashless ? hookExport(exports, "getChannel", mentionChannelInfo) : exports;
            case 7365:
                if (!features.dashless) return exports;
                exports = hookExport(exports, "createParserState", parserStateChannels);
                if (exports && exports.default) exports = replaceValue(exports, "default", hookExport(exports.default, "createParserState", parserStateChannels));
                return exports;
            case 13066: return features.favouriteAnything ? hookComponent(exports, favouriteButton) : exports;
            case 1295: return features.tenorGifs && exports && exports.HTTP ? (hookExport(hookExport(exports.HTTP, "get", tenorGet), "post", tenorPost), exports) : exports;
            case 9733: return features.tenorGifs ? hookExport(exports, "getSearchPlaceholder", tenorPlaceholder) : exports;
            case 9732: return features.favouriteAnything ? hookExport(exports, "addFavoriteGIF", favouriteAdd) : exports;
            case 9735: return features.favouriteAnything ? hookExport(exports, "useFavoriteGIFsMobile", favouriteList) : exports;
            case 2065: channelStore = exports.default; return exports;
            case 11668: return features.noTyping ? replaceValue(exports, "default", hookExport(hookExport(exports.default, "startTyping", typing), "stopTyping", typing)) : exports;
            case 1126: if (features.quickDelete) locale = exports; return exports;
            case 5300: return features.quickDelete ? replaceValue(exports, "default", hookExport(exports.default, "show", quickConfirm)) : exports;
            case 5434: if (features.noDelete) { messageRecords = exports; restoreDeleted(); } return exports;
            case 1390:
                if (exports && exports.default && (features.validUser || features.splitMessages || features.fixEmbeds || features.translate || features.userNotif || features.accountSwitcher || features.appIcons || features.nitroThemes || features.messageHighlight || features.serverInfo || features.noDelete || features.reviewDB || features.platformIndicators || features.hiddenChannels || features.gestures || features.freeNitro || features.badges))
                    userStore = exports.default;
                if (features.noDelete || features.reviewDB || features.platformIndicators || features.hiddenChannels) restoreDeleted();
                return exports;
            case 5432:
                if (features.jumpToTop || features.messageHighlight || features.noDelete || features.translate) msgStore = exports.default;
                if (features.noDelete) {
                    exports = replaceValue(exports, "default", hookExport(hookExport(msgStore, "getMessage", retainedMessage), "getMessages", retainedMessages));
                    restoreDeleted();
                }
                return exports;
            case 7386: if (features.quests) questAttach(exports.default); return exports;
            case 584:
                if (features.userNotif && exports && exports.default) userNotifInit(exports.default);
                if (features.translate && exports && exports.default) translateInit(exports.default);
                if (features.validUser && exports && exports.default) validInit(exports.default);
                if (features.quests) questsInit(exports.default);
                if (features.badges && exports && exports.default) badgesInit(exports.default);
                if (features.nitroThemes && exports && exports.default) nitroThemeAttach(exports.default);
                if (features.messageHighlight && exports && exports.default && !dispatcher)
                    dispatcher = exports.default.dispatch.bind(exports.default);
                if ((features.noDelete || features.reviewDB || features.hiddenChannels) && id === 584) {
                    dispatcher = exports.default.dispatch.bind(exports.default);
                    return replaceValue(exports, "default", hookExport(exports.default, "dispatch", dispatchEvent));
                }
                return exports;
            case 1085: case 1096:
                if (features.hiddenChannels && exports.Permissions) viewPermission = exports.Permissions.VIEW_CHANNEL;
                return exports;
            case 1112:
                if (!features.hiddenChannels) return exports;
                exports = hookExport(exports, "transitionTo", hiddenNavigation);
                exports = hookExport(exports, "replaceWith", hiddenNavigation);
                return hookExport(exports, "transitionToGuild", hiddenGuildNavigation);
            case 4750: {
                if (!features.hiddenChannels) return exports;
                // Lioncat6 finds permissions via findByProps("getChannelPermissions","can");
                // In 350.8 PermissionStore (4750) is the only module exporting both.
                // Candidate may be default export or the exports object itself.
                const candidate = exports && exports.default && typeof exports.default.can === "function" ? exports.default :
                    exports && typeof exports.can === "function" ? exports : null;
                if (candidate) permissions = candidate;
                // Globally reveal VIEW_CHANNEL so Discord builds
                // real channel records (names) instead of obfuscated "hidden" stubs.
                // Message/voice access stays blocked via hiddenFetch/hiddenNavigation guards.
                // Use hookExport so frozen/sealed singletons are still patched via clone.
                try {
                    if (candidate && !permissionsCanOrig) {
                        permissionsCanOrig = candidate.can.bind(candidate);
                        permissions = hookExport(hookExport(candidate, "can", hiddenCan), "canBasicChannel", hiddenCan);
                        return candidate === exports ? permissions : replaceValue(exports, "default", permissions);
                    }
                } catch (_) {}
                return exports;
            }
            case 4748: {
                if (!features.hiddenChannels) return exports;
                const store = hookExport(hookExport(exports.default, "getChannels", hiddenDirectory), "getFirstChannel", hiddenFirstChannel);
                guildChannels = store;
                return replaceValue(exports, "default", store);
            }
            case 2116: return features.hiddenChannels && exports && exports.default ? replaceValue(exports, "default", hookExport(exports.default, "getChannelId", hiddenSelectedChannel)) : exports;
            case 9379: if (features.jumpToTop) chatHeight = exports; return exports;
            case 11969: if (features.jumpToTop) jumpPill = exports.default; return exports;
            // 350.8's arrow is a registered image asset: Metro exports the asset id itself, not a default.
            case 11970: if (features.jumpToTop) jumpIcon = exports && typeof exports === "object" && "default" in exports ? exports.default : exports; return exports;
            case 11968: return features.jumpToTop ? hookComponent(exports, jumpButton) : exports;
            case 7982: return features.gestures ? hookExport(exports, "handleAddDefaultDoubleTapReaction", doubleTapMessage) : exports;
            // Discord's "double-tap to react" tips, reminders and banners would point at a gesture that now replies.
            case 12837: return features.gestures ? hookExport(exports, "DoubleTapEmojiEditNudge", hideWhenGestures) : exports;
            case 9434: return features.gestures ? hookExport(exports, "maybeShowDoubleTapReminderToast", (orig, self, args) => enabled("gestures") ? undefined : orig.apply(self, args)) : exports;
            case 11990: return features.gestures ? hookExport(exports, "DoubleTapToReactChatInputBanner", hideWhenGestures) : exports;
            case 10694: return features.gestures ? hookTapHandlers(exports) : exports;
            case 7174: {
                let actions = exports.default;
                if (!actions) return exports;
                if (features.noDelete) actions = hookExport(actions, "deleteMessage", deleteMessage);
                // Split Large Messages wraps FreeNitro's hook (added below), so every part still gets its emoji links.
                const splitLater = features.splitMessages;
                if (features.hiddenChannels) actions = hookExport(actions, "fetchMessages", hiddenFetch);
                if (features.freeNitro) {
                    actions = hookExport(actions, "sendMessage", sendMessage);
                    actions = hookExport(actions, "_sendMessage", sendMessage);
                    actions = hookExport(actions, "sendStickers", sendStickers);
                }
                if (splitLater) actions = hookExport(actions, "sendMessage", splitSend);
                // Outermost, so Send long messages splits (and Nitro links converts) a message whose links are already fixed.
                if (features.fixEmbeds) {
                    actions = hookExport(actions, "sendMessage", fixEmbedsSend);
                    actions = hookExport(actions, "editMessage", fixEmbedsEdit);
                }
                msgActions = actions;
                return replaceValue(exports, "default", actions);
            }
            case 14299:
                if (!features.freeNitro && !features.appIcons && !features.nitroThemes) return exports;
                emojiCatalog = exports;
                return hookExport(exports, "canUserUse", catalogEligibility);
            case 5987: if (features.freeNitro) emojiStore = exports.default; return exports;
            case 6030: if (features.freeNitro) stickerStore = exports.default; return exports;
            case 4769: {
                if (!features.freeNitro && !features.appIcons && !features.nitroThemes) return exports;
                // The pinned build exports the capabilities on a default singleton;
                // named aliases are not used by its picker. Hook the inspected object.
                let capabilities = exports.default || exports;
                function patchCapability(key, setting) {
                    premiumOriginal[key] = typeof capabilities[key] === "function" ? capabilities[key].bind(capabilities) : undefined;
                    capabilities = hookExport(capabilities, key, premiumOverride(key, setting));
                }
                if (features.freeNitro) {
                    patchCapability("canUseEmojisEverywhere", "emojis");
                    patchCapability("canUseAnimatedEmojis", "emojis");
                    // Keep sticker eligibility stock: only the inspected premium-only sendability result is relaxed.
                    premiumOriginal.canUseCustomStickersEverywhere = typeof capabilities.canUseCustomStickersEverywhere === "function" ? capabilities.canUseCustomStickersEverywhere.bind(capabilities) : undefined;
                }
                if (features.nitroThemes) {
                    patchCapability("canUseClientThemes", "nitroThemes");
                    if (typeof exports.canUseClientThemes === "function" && exports.default)
                        exports = hookExport(exports, "canUseClientThemes", premiumOverride("canUseClientThemes", "nitroThemes"));
                }
                if (features.appIcons) {
                    patchCapability("canUsePremiumAppIcons", "appIcons");
                    if (typeof exports.canUsePremiumAppIcons === "function" && exports.default)
                        exports = hookExport(exports, "canUsePremiumAppIcons", premiumOverride("canUsePremiumAppIcons", "appIcons"));
                }
                return exports.default ? replaceValue(exports, "default", capabilities) : capabilities;
            }
            case 7047:
                if (!features.freeNitro) return exports;
                stickerRules = exports;
                exports = hookExport(exports, "getStickerSendability", sendability);
                exports = hookExport(exports, "isSendableSticker", sendableSticker);
                stickerRules = exports;
                return exports;
            default:
                return exports;
        }
    }

    const INSTRUMENT_HOOK_KEYS = ["getAttachmentPayload", "post"];
    const INSTRUMENT_SUB_KEYS = ["default", "HTTP"];
    function instrument(exports, depth) {
        if (!exports || (typeof exports !== "object" && typeof exports !== "function")) return exports;
        if (owns(exports, "createElement") && owns(exports, "useState")) React = exports;
        if (owns(exports, "View") && owns(exports, "Text") && owns(exports, "Modal")) RN = exports;
        if (typeof data(exports, "getSize") === "function" && typeof data(exports, "readFile") === "function" &&
            typeof data(exports, "writeFile") === "function") initFiles(exports);
        if (features.voice && owns(exports, "CloudUpload")) instrumentCloudUpload(exports.CloudUpload);
        if (features.picker) {
            const patched = pickerComponent(exports);
            if (patched !== exports) return patched;
        }
        let changes = null;
        let proxy = exports;
        // Preserve module identity and cached aliases wherever descriptors allow it,
        // only allocating a Map for non-configurable/accessor exports that require a Proxy.
        function applyOrDefer(key, patched) {
            const descriptor = Object.getOwnPropertyDescriptor(exports, key);
            if (descriptor && descriptor.configurable) {
                Object.defineProperty(exports, key, { value: patched, writable: true,
                    configurable: true, enumerable: descriptor.enumerable });
            } else if (descriptor && "value" in descriptor && descriptor.writable) {
                exports[key] = patched;
            } else if (!descriptor || descriptor.configurable || !("value" in descriptor) || descriptor.writable) {
                if (!changes) changes = new Map();
                changes.set(key, patched);
            }
        }
        // Invocation-scoped captures also work when Hermes eval disables block scoping.
        // The binding check fails fast at hook time (caught as "Hook unavailable",
        // leaving the module stock) instead of crashing the app at call time.
        function replacementFor(operation, orig) {
            if (typeof operation !== "function" || typeof orig !== "function")
                throw new Error("Venus: unusable export binding for hook");
            return function () { return operation(orig, this === proxy ? exports : this, arguments); };
        }
        // Only read explicitly identified export keys, never enumerate or invoke unrelated getters.
        if (features.voice) {
            for (let i = 0; i < INSTRUMENT_HOOK_KEYS.length; i++) {
                const key = INSTRUMENT_HOOK_KEYS[i];
                if (!owns(exports, key)) continue;
                if (key === "post" && (!owns(exports, "get") || !owns(exports, "put"))) continue;
                let orig;
                try { orig = exports[key]; } catch (_) { continue; }
                if (typeof orig !== "function") continue;
                const operation = key === "post" ? postRequest : attachmentPayload;
                const patched = replacementFor(operation, orig);
                applyOrDefer(key, patched);
                if (key === "post") status.request = true;
                else status.attachment = true;
            }
        }
        if (depth < 2) {
            for (let i = 0; i < INSTRUMENT_SUB_KEYS.length; i++) {
                // Data exports only: default getters can be cyclic during module initialization.
                const key = INSTRUMENT_SUB_KEYS[i];
                const candidate = data(exports, key);
                if (!candidate || candidate === exports) continue;
                const patched = instrument(candidate, depth + 1);
                if (patched !== candidate) applyOrDefer(key, patched);
            }
        }
        if (!changes || !changes.size) return exports;
        // Only immutable accessor exports need a proxy; never inspect them during RN initialization.
        proxy = new Proxy(exports, { get(target, key, self) {
            return changes.has(key) ? changes.get(key) : Reflect.get(target, key, self);
        } });
        return proxy;
    }
    const INSTRUMENTED_MODULES = new Set([17, 19, 414, 1162, 1295, 7752, 7755]);
    function activateModule(id, module) {
        try {
            if (id === 1162) {
                const nativeFiles = module.exports.default;
                if (nativeFiles && typeof nativeFiles.getSize === "function" &&
                    typeof nativeFiles.readFile === "function" && typeof nativeFiles.writeFile === "function")
                    initFiles(nativeFiles);
            }
            module.exports = activatePlugins(id, module.exports);
            if (INSTRUMENTED_MODULES.has(id)) module.exports = instrument(module.exports, 0);
        } catch (error) {
            status.audioError = "Hook unavailable: " + String(error);
            if (global.console && typeof global.console.warn === "function")
                global.console.warn("[Venus] Hook unavailable", String(error));
        }
    }
    function decorateDefine(define) {
        if (typeof define !== "function") return define;
        return function (factory, id, dependencies) {
            // Runs for all ~17.7k modules at startup: call define(factory, id, dependencies) directly
            // without checking arguments.length or going through Function.prototype.call.
            if (targetModules[id] !== 1 || typeof factory !== "function")
                return define(factory, id, dependencies);
            const wrappedFactory = function () {
                let result;
                if (features.hiddenChannels && id === 7246) {
                    const factoryArgs = Array.from(arguments);
                    factoryArgs[1] = listImport(factoryArgs[1]);
                    factoryArgs[2] = listImport(factoryArgs[2]);
                    factoryArgs[3] = listImport(factoryArgs[3]);
                    result = factory.apply(this, factoryArgs);
                } else {
                    result = factory.apply(this, arguments);
                }
                const module = arguments[4]; // Verified Metro factory ABI in Discord 350.8.
                if (module && module.exports) {
                    // Before anything reads them: DraftStore keeps its length cap from the moment it loads.
                    if (features.splitMessages && id === 1085) { try { lengthConstants(module.exports); } catch (_) {} }
                    if (features.accountSwitcher && id === 12130) { try { multiAccountConstants(module.exports); } catch (_) {} }
                    if (id === 120) {
                        const initialize = module.exports.default;
                        let initializing = false;
                        if (typeof initialize === "function") module.exports.default = function () {
                            // Original errors propagate unchanged; only the outer successful init is ready.
                            if (initializing) return initialize.apply(this, arguments);
                            initializing = true;
                            let value;
                            try { value = initialize.apply(this, arguments); }
                            finally { initializing = false; }
                            environmentReady = true;
                            for (const [pendingId, pending] of deferred) activateModule(pendingId, pending);
                            deferred.clear();
                            return value;
                        };
                    } else if (!environmentReady) deferred.set(id, module);
                    else activateModule(id, module);
                }
                return result;
            };
            if (arguments.length === 3) return define(wrappedFactory, id, dependencies);
            const args = Array.from(arguments);
            args[0] = wrappedFactory;
            return define.apply(this, args);
        };
    }
    // Discord's bundle reads global __d once per module (~17.7k times at startup). Once Metro has set it,
    // it's a plain value again, so those reads aren't getter calls. Setting it again still decorates it.
    function holdDefine(value) {
        Object.defineProperty(global, "__d", { configurable: true, enumerable: true,
            get: () => value, set: next => { defineValue(decorateDefine(next)); } });
    }
    function defineValue(value) {
        Object.defineProperty(global, "__d", { configurable: true, enumerable: true, writable: true, value });
    }
    const existing = global.__d;
    if (typeof existing === "function") defineValue(decorateDefine(existing));
    else holdDefine(existing);
    // Local diagnostics/test API; not a network endpoint and no client-mod globals.
    global.__venusPatches = Object.freeze({ revision, settings, features, status, setSetting, formatSize, getSize });
})(globalThis);
