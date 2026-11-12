// YouTV runtime: loaded first into https://www.youtube.com/tv, on every page load.
// Feature scripts (the other .js files) register themselves with youtv.feature().
//
// Based on the runtime core of DylanDuff/utv-runtime (MIT License, Copyright (c) 2026 Dylan Duff):
// JSON.parse hook for InnerTube responses and settings registered as YouTube client settings.
//
// youtv.feature({
//     id: "shorts",                     // [a-z0-9-]+, unique; becomes the client setting YOUTV_SHORTS
//     name: "Ocultar Shorts",           // switch title in Ajustes > YouTV
//     summary: "...",                   // switch description
//     defaultEnabled: true,             // true if omitted
//     restart: false,                   // true: changing it shows the "restart needed" dialog
//     settings: [{ key: "x", title: "...", summary: "...", default: false }],  // optional extra switches
//     onResponse: function (response, settings) { ... }  // every parsed InnerTube response, only while
// });                                                    // enabled; settings.get("x") reads an extra
(function () {
    if (location.hostname !== "www.youtube.com" || window.youtv) return;

    var parse = JSON.parse;

    // ---- log ----------------------------------------------------------------------------------
    // Console output of injected code never reaches logcat. report() briefly sets document.title to
    // "tvp:<message>"; the patched navigation observer (titleWasSet) logs it under the tag TvPatches.
    var reportQueue = [];
    var savedTitle = null;
    function report(message) {
        reportQueue.push(message);
        if (reportQueue.length === 1 && savedTitle === null) setTimeout(flushReports, 0);
    }
    function flushReports() {
        if (savedTitle === null) savedTitle = document.title;
        if (reportQueue.length === 0) {
            document.title = savedTitle;
            savedTitle = null;
            return;
        }
        document.title = "tvp:" + reportQueue.shift();
        setTimeout(flushReports, 0);
    }

    // ---- settings -----------------------------------------------------------------------------
    // Registered as YouTube client settings, so the app draws, toggles and stores them itself:
    // localStorage "yt.leanback.default::<key>" = {"data": <bool>}.
    var STORAGE_PREFIX = "yt.leanback.default::";
    var CATEGORY_ID = "SETTING_CAT_YOUTV";
    var RESTART_SETTING = { key: "YOUTV_RESTART_REQUEST", defaultValue: false };  // see restart dialog
    var settings = [];          // { key, title, summary, defaultValue } in display order
    var registry = null;        // YouTube's known client settings ({ KEY: true })
    var defaults = null;        // YouTube's client setting defaults (Map)

    function readSetting(setting) {
        try {
            var stored = parse(localStorage.getItem(STORAGE_PREFIX + setting.key));
            if (stored && typeof stored.data === "boolean") return stored.data;
        } catch (e) {}
        return setting.defaultValue;
    }

    function registerSetting(setting) {
        registry[setting.key] = true;
        defaults.set(setting.key, setting.defaultValue);
    }

    // Both objects are minified, so find them by content: the registry is the plain object holding
    // ENABLE_PREVIEWS_WITH_SOUND: true, the defaults are the Map with that key.
    function findRegistry() {
        var namespace = window._yttv;
        if (!namespace) return false;
        var names = Object.keys(namespace);
        for (var i = 0; i < names.length && !(registry && defaults); i++) {
            var value;
            try { value = namespace[names[i]]; } catch (e) { continue; }
            if (!value || typeof value !== "object") continue;
            if (value instanceof Map) {
                if (!defaults && value.has("ENABLE_PREVIEWS_WITH_SOUND")) defaults = value;
            } else if (!registry && !Array.isArray(value) && value.ENABLE_PREVIEWS_WITH_SOUND === true) {
                registry = value;
            }
        }
        if (!registry || !defaults) {
            registry = defaults = null;
            return false;
        }
        settings.forEach(registerSetting);
        registerSetting(RESTART_SETTING);
        report("settings: registered " + settings.length + " setting(s)");
        return true;
    }

    // ---- restart dialog -----------------------------------------------------------------------
    // Switches marked restart: true open YouTube's own confirmation dialog. Its "Reiniciar" button
    // stores the hidden client setting YOUTV_RESTART_REQUEST; the storage hook below sees that write
    // and reloads youtube.com/tv, which fetches the menu (guide) again, like a fresh start.
    var CLOSE_POPUP = { signalAction: { signal: "CLOSE_POPUP" } };

    function restartDialogCommand() {
        var restart = { commandExecutorCommand: { commands: [CLOSE_POPUP, clientSettingEndpoint(RESTART_SETTING.key, true)] } };
        return { confirmDialogEndpoint: { content: { confirmDialogRenderer: {
            title: runs("Reinicio necesario"),
            dialogMessages: [runs("Este cambio se aplica al reiniciar YouTube. ¿Quieres reiniciar ahora?")],
            confirmButton: { buttonRenderer: {
                style: "STYLE_PRIMARY",
                text: runs("Reiniciar"),
                serviceEndpoint: restart,
                command: restart
            } },
            cancelButton: { buttonRenderer: {
                style: "STYLE_DEFAULT",
                text: runs("Más tarde"),
                serviceEndpoint: CLOSE_POPUP,
                command: CLOSE_POPUP
            } },
            primaryIsCancel: false
        } } } };
    }

    // The switch reads its on/off state from enableServiceEndpoint.setClientSettingEndpoint, so that
    // key has to stay at the top level. The dialog goes in a commandExecutorCommand next to it.
    function settingCommand(setting, value) {
        var save = clientSettingEndpoint(setting.key, value);
        if (!setting.restart) return save;
        save.commandExecutorCommand = { commands: [clientSettingEndpoint(setting.key, value), restartDialogCommand()] };
        return save;
    }

    function isRestartRequest(key, value) {
        return key === STORAGE_PREFIX + RESTART_SETTING.key && String(value).indexOf("true") !== -1;
    }

    var restarting = false;
    function restartApp() {
        if (restarting) return;
        restarting = true;
        report("restart requested");
        try { localStorage.removeItem(STORAGE_PREFIX + RESTART_SETTING.key); } catch (e) {}
        setTimeout(function () { location.reload(); }, 300);
    }

    try {
        var setItem = Storage.prototype.setItem;
        Storage.prototype.setItem = function (key, value) {
            var result = setItem.apply(this, arguments);
            try { if (this === localStorage && isRestartRequest(key, value)) restartApp(); } catch (e) {}
            return result;
        };
        // A leftover request (for example the app was closed before the reload) is dropped.
        localStorage.removeItem(STORAGE_PREFIX + RESTART_SETTING.key);
    } catch (e) {
        report("restart hook failed: " + e);
    }

    (function pollRegistry(attempt) {
        if (findRegistry()) return;
        if (attempt >= 600) {
            report("settings: client setting registry not found, YouTV menu disabled");
            return;
        }
        setTimeout(function () { pollRegistry(attempt + 1); }, 100);
    })(0);

    function runs(text) { return { runs: [{ text: text }] }; }
    function clientSettingEndpoint(key, value) {
        return { setClientSettingEndpoint: { settingDatas: [{ clientSettingEnum: { item: key }, boolValue: value }] } };
    }

    // The Settings response is items[] of settingCategoryCollectionRenderer. Ours goes right after
    // the first category, and only once the registry is patched (so every switch can be stored).
    // Title of our settings section: "<app name> Parches" ("FaroTV Parches").
    function sectionTitle() {
        return (window.__youtvBranding || "FaroTV") + " Parches";
    }

    // Changes to YouTube's own first settings category (sent by the server):
    // - "Compras y membresias" (itemId MANAGE_PURCHASES_AND_MEMBERSHIPS*) is removed;
    // - the "Obtener YouTube Premium" card (itemId PREMIUM_LANDING_PAGE*) is removed.
    // "Acerca de": "Ayuda" (ABOUT_HELP) and "Enviar comentarios" (the action item whose command
    // is a feedback one) are removed, and two items about the bundle and its author go first.
    var GSTATIC_PICTURE = "https://www.gstatic.com/ytlr/img/autoplay.png?farotv=";

    // Built every time the Settings page loads: the YouTube version comes from the installed app
    // (TvScripts sets window.__youtubeVersion), the list from the features that are switched on.
    var FEATURE_LABELS = [
        ["ads", "sin anuncios"], ["shorts", "sin Shorts"], ["sponsorblock", "SponsorBlock"],
        ["ryd", "Return YouTube Dislike"], ["premium-promos", "sin promociones de Premium"]
    ];

    function aboutSummary() {
        var on = FEATURE_LABELS.filter(function (pair) {
            for (var i = 0; i < features.length; i++) {
                if (features[i].id === pair[0]) return features[i].enabled();
            }
            return false;
        }).map(function (pair) { return pair[1]; });
        var list = on.length > 1 ? on.slice(0, -1).join(", ") + " y " + on[on.length - 1] : (on[0] || "");
        var youtube = window.__youtubeVersion ? "YouTube " + window.__youtubeVersion : "YouTube";
        return "Android TV · Parches de Morphe para " + youtube + (list ? ": " + list + "." : ".") +
            " Creado por Gabriel Jair. YouTube, los videos, imágenes y marcas pertenecen a Google" +
            " y a sus respectivos titulares.";
    }

    function adjustAbout(category) {
        var items = category.items;
        for (var i = items.length - 1; i >= 0; i--) {
            var item = items[i] || {};
            var readOnly = item.settingReadOnlyItemRenderer;
            var action = item.settingActionRenderer;
            if ((readOnly && readOnly.itemId === "ABOUT_HELP") ||
                (action && !action.itemId && /feedback/i.test(JSON.stringify(action.serviceEndpoint || action)))) {
                items.splice(i, 1);
            }
        }
        for (var k = items.length - 1; k >= 0; k--) {
            var own = items[k] && items[k].settingActionRenderer;
            if (own && /^FAROTV_/.test(own.itemId || "")) items.splice(k, 1);
        }
        var section = sectionTitle();
        var version = window.__farotvVersion ? " " + window.__farotvVersion : "";
        var repository = { confirmDialogEndpoint: { content: { confirmDialogRenderer: {
            title: runs(section + version),
            dialogMessages: [
                runs("Código, novedades y descargas:"),
                runs("github.com/jair1c/farotv-patches"),
                runs("También está en morphe-patches.software, para instalarlo con Morphe Manager.")
            ],
            confirmButton: { buttonRenderer: { style: "STYLE_PRIMARY", text: runs("Cerrar"),
                serviceEndpoint: CLOSE_POPUP, command: CLOSE_POPUP } }
        } } } };
        function button(text) {
            return { buttonRenderer: { text: runs(text), serviceEndpoint: repository, command: repository } };
        }
        items.unshift(
            { settingActionRenderer: {
                itemId: "FAROTV_CREATOR",
                title: runs("Gabriel Jair"),
                summary: runs("Creador de " + section + ". YouTube. A tu manera."),
                thumbnail: { thumbnails: [{ url: GSTATIC_PICTURE + "creator" }] },
                serviceEndpoint: repository,
                actionButton: button("github.com/jair1c")
            } },
            { settingActionRenderer: {
                itemId: "FAROTV_ABOUT",
                title: runs(section + version),
                summary: runs(aboutSummary()),
                thumbnail: { thumbnails: [{ url: GSTATIC_PICTURE + "brand" }] },
                serviceEndpoint: repository,
                actionButton: button("Ver el repositorio")
            } });
    }

    function adjustYouTubeCategories(items) {
        for (var i = 0; i < items.length; i++) {
            var category = items[i] && items[i].settingCategoryCollectionRenderer;
            if (!category || !Array.isArray(category.items)) continue;
            if (category.categoryId === "SETTING_CAT_TVHTML5_ABOUT") {
                adjustAbout(category);
                continue;
            }
            for (var j = category.items.length - 1; j >= 0; j--) {
                // Signed out these are settingActionRenderer; signed in, "Compras y membresias"
                // is a settingsPaneRenderer (QR code). The itemId is the same in both.
                var item = category.items[j];
                var card = item && item[Object.keys(item)[0]];
                if (!card || typeof card !== "object") continue;
                var itemId = card.itemId || "";
                if (/^MANAGE_PURCHASES_AND_MEMBERSHIPS/.test(itemId)) {
                    category.items.splice(j, 1);
                    report("settings: purchases and memberships hidden");
                    continue;
                }
                if (/^PREMIUM_/.test(itemId)) {
                    category.items.splice(j, 1);
                    report("settings: premium card hidden");
                }
            }
        }
    }

    // Pictures of our switches (icons.js): a gstatic picture tagged "?farotv=<icon>" that a
    // stylesheet replaces. Sub-switches use their feature's icon unless they have their own.
    var icons = {};
    function setIcons(map) { icons = map || {}; }
    function settingThumbnail(setting) {
        var icon = (setting.extra && icons[setting.feature + "." + setting.extra]) || icons[setting.feature];
        if (!icon) return undefined;
        return { thumbnails: [{ url: GSTATIC_PICTURE + icon }] };
    }

    function injectSettingsCategory(response) {
        var items = response.items;
        if (Array.isArray(items)) adjustYouTubeCategories(items);
        if (!registry || !settings.length || !Array.isArray(items)) return;
        var isSettings = false;
        for (var i = 0; i < items.length; i++) {
            var category = items[i] && items[i].settingCategoryCollectionRenderer;
            if (!category) continue;
            if (category.categoryId === CATEGORY_ID) return;
            isSettings = true;
        }
        if (!isSettings) return;
        items.splice(1, 0, { settingCategoryCollectionRenderer: {
            title: runs(sectionTitle()),
            categoryId: CATEGORY_ID,
            focused: false,
            items: settings.map(function (setting) {
                return { settingBooleanRenderer: {
                    thumbnail: settingThumbnail(setting),
                    title: runs(setting.title),
                    summary: runs(setting.summary || ""),
                    enableServiceEndpoint: settingCommand(setting, true),
                    disableServiceEndpoint: settingCommand(setting, false),
                    itemId: setting.key
                } };
            })
        } });
    }

    // ---- features -----------------------------------------------------------------------------
    var features = [];

    function settingKey(id, key) {
        return ("YOUTV_" + id + (key ? "_" + key : "")).toUpperCase().replace(/[^A-Z0-9]/g, "_");
    }

    function defineFeature(definition) {
        var id = definition && definition.id;
        if (!/^[a-z0-9-]+$/.test(id || "")) return report("feature rejected: invalid id " + id);
        for (var i = 0; i < features.length; i++) {
            if (features[i].id === id) return;
        }

        var master = {
            feature: id,
            key: settingKey(id),
            title: definition.name || id,
            summary: definition.summary,
            defaultValue: definition.defaultEnabled !== false,
            restart: !!definition.restart
        };
        var extras = {};
        var own = [master];
        (definition.settings || []).forEach(function (extra) {
            var setting = {
                feature: id,
                extra: extra.key,
                key: settingKey(id, extra.key),
                title: extra.title || extra.key,
                summary: extra.summary,
                defaultValue: !!extra.default,
                restart: !!extra.restart
            };
            extras[extra.key] = setting;
            own.push(setting);
        });
        own.forEach(function (setting) {
            settings.push(setting);
            if (registry) registerSetting(setting);
        });

        var feature = {
            id: id,
            definition: definition,
            enabled: function () { return readSetting(master); },
            settings: {
                get: function (key) { return extras[key] ? readSetting(extras[key]) : undefined; }
            }
        };
        features.push(feature);
        return feature;
    }

    // ---- network ------------------------------------------------------------------------------
    // The page's Content Security Policy blocks requests to other sites, so the app's Java side
    // makes them (TvScripts.onTitle sees "@req <id> <url>", only for an allow-list of hosts) and
    // hands the answer back through youtv.deliver(id, status, body).
    var pending = {};
    var nextRequest = 1;

    function request(url, callback) {
        var id = nextRequest++;
        pending[id] = callback;
        report("@req " + id + " " + url);
        setTimeout(function () { delete pending[id]; }, 60000);
    }

    function deliver(id, status, body) {
        var callback = pending[id];
        delete pending[id];
        if (!callback) return;
        try {
            callback(status, body);
        } catch (e) {
            report("request " + id + " callback failed: " + e);
        }
    }

    // ---- response hook ------------------------------------------------------------------------
    JSON.parse = function () {
        var result = parse.apply(this, arguments);
        if (!result || typeof result !== "object") return result;
        try {
            injectSettingsCategory(result);
        } catch (e) {
            report("settings: inject failed: " + e);
        }
        for (var i = 0; i < features.length; i++) {
            var feature = features[i];
            if (typeof feature.definition.onResponse !== "function" || !feature.enabled()) continue;
            try {
                feature.definition.onResponse(result, feature.settings);
            } catch (e) {
                report(feature.id + ": failed: " + e);
            }
        }
        return result;
    };

    window.youtv = {
        report: report,
        rawParse: parse,
        feature: defineFeature,
        request: request,
        setIcons: setIcons,
        deliver: deliver,
        status: function () {
            return {
                registry: !!registry,
                features: features.map(function (f) { return f.id + (f.enabled() ? " (on)" : " (off)"); })
            };
        }
    };
    report("runtime loaded on " + location.href);
})();
