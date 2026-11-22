// Shared offline catalogs are embedded by Gradle from src/main/locales/*.json.
(function () {
    if (window.farotvI18n) return;
    var catalogs = window.__farotvTranslations || {};
    var listener = null;
    var lastLanguage = null;

    function configuredLanguage() {
        // YouTube's explicit UI language takes precedence over the device/browser language.
        try {
            if (window.ytcfg && typeof window.ytcfg.get === "function") {
                var hl = window.ytcfg.get("HL");
                var context = window.ytcfg.get("INNERTUBE_CONTEXT");
                if (hl) return hl;
                if (context && context.client && context.client.hl) return context.client.hl;
            }
        } catch (ignored) {}
        var html = document.documentElement;
        return (html && html.lang) || navigator.language || "en";
    }

    function locale() {
        var requested = String(configuredLanguage()).toLowerCase().replace(/_/g, "-");
        var language = Object.prototype.hasOwnProperty.call(catalogs, requested) ? requested : requested.split("-")[0];
        if (!Object.prototype.hasOwnProperty.call(catalogs, language)) language = "en";
        if (lastLanguage !== language) {
            lastLanguage = language;
            if (listener) listener(language);
        }
        return language;
    }

    function t(key, values) {
        var selected = catalogs[locale()] || {};
        var fallback = catalogs.en || {};
        var value = Object.prototype.hasOwnProperty.call(selected, key) ? selected[key] : fallback[key];
        if (typeof value !== "string") return key;
        return value.replace(/\{([A-Za-z0-9_]+)\}/g, function (token, name) {
            return values && Object.prototype.hasOwnProperty.call(values, name) ? String(values[name]) : token;
        });
    }

    window.farotvI18n = {
        t: t,
        locale: locale,
        direction: function () { return locale() === "ar" ? "rtl" : "ltr"; },
        onChange: function (callback) { listener = callback; lastLanguage = null; locale(); }
    };
})();
