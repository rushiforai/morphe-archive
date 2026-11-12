// Player: hide buttons of the playback screen and the related videos row.
// The /next response (7.32.300) has transportControls.transportControlsRenderer with three lists:
// promotedActions, engagementActions and settingActions; each item is
// { type: "TRANSPORT_CONTROLS_BUTTON_TYPE_...", button: { <type>Renderer } }.
// Buttons are matched by that type (language independent), with the icon as a fallback.
(function () {
    if (!window.youtv) return;

    var P = "TRANSPORT_CONTROLS_BUTTON_TYPE_";
    var BUTTONS = [
        { key: "channel", title: "Ocultar botón Canal", types: ["CHANNEL_BUTTON"] },
        { key: "description", title: "Ocultar botón Descripción", types: ["ABOUT_BUTTON"] },
        { key: "subscribe", title: "Ocultar botón Suscribirse", types: ["SUBSCRIBE"] },
        { key: "like", title: "Ocultar Me gusta / No me gusta", types: ["LIKE_BUTTON"] },
        { key: "comments", title: "Ocultar botón Comentarios", types: ["COMMENTS"], icons: ["COMMENT"] },
        { key: "ask", title: "Ocultar botón Preguntar (IA)", icons: ["SPARK"] },
        { key: "save", title: "Ocultar botón Guardar", types: ["ADD_TO_PLAYLIST"], icons: ["BOOKMARK_BORDER", "BOOKMARK"] },
        { key: "thanks", title: "Ocultar botón Súper gracias", types: ["SUPER_THANKS"], icons: ["MONEY_HEART"] },
        { key: "report", title: "Ocultar Denunciar y Enviar comentarios", types: ["REPORT_VIDEO", "FEEDBACK"], icons: ["FLAG", "FEEDBACK"] },
        { key: "stats", title: "Ocultar Estadísticas para nerds", types: ["STATS_FOR_NERDS"], icons: ["BUG_REPORT"] }
    ];
    var LISTS = ["promotedActions", "engagementActions", "settingActions"];

    function iconOf(item) {
        var button = item.button || {};
        var renderer = button[Object.keys(button)[0]] || {};
        return (renderer.icon && renderer.icon.iconType) || (renderer.defaultIcon && renderer.defaultIcon.iconType) || "";
    }

    function matches(spec, item) {
        var type = item.type || "";
        if (spec.types && spec.types.some(function (t) { return type === P + t; })) return true;
        var icon = iconOf(item);
        return !!icon && !!spec.icons && spec.icons.indexOf(icon) !== -1;
    }

    function filterControls(controls, settings) {
        var removed = 0;
        LISTS.forEach(function (list) {
            var items = controls[list];
            if (!Array.isArray(items)) return;
            controls[list] = items.filter(function (item) {
                if (!item || !item.button) return true;
                for (var i = 0; i < BUTTONS.length; i++) {
                    if (settings.get(BUTTONS[i].key) && matches(BUTTONS[i], item)) {
                        removed++;
                        return false;
                    }
                }
                return true;
            });
        });
        return removed;
    }

    // The related videos row is the <ytlr-pivot> element. Removing its data leaves grey
    // placeholders, so it is hidden with CSS instead. The page's Content Security Policy blocks
    // <style> elements without a nonce, so a constructed stylesheet (CSSOM) is used.
    var sheet = null;
    function setRelatedHidden(hidden) {
        try {
            if (!sheet) {
                sheet = new CSSStyleSheet();
                document.adoptedStyleSheets = document.adoptedStyleSheets.concat([sheet]);
            }
            sheet.replaceSync(hidden ? "ytlr-pivot { display: none !important; }" : "");
        } catch (e) {
            youtv.report("player: stylesheet failed: " + e);
        }
    }

    youtv.feature({
        id: "player",
        name: "Personalizar el reproductor",
        summary: "Activa las opciones de abajo para ocultar botones y la fila de videos relacionados",
        defaultEnabled: true,
        settings: BUTTONS.map(function (b) { return { key: b.key, title: b.title, default: false }; }).concat([
            { key: "related", title: "Ocultar videos relacionados", summary: "Oculta la fila de videos bajo el reproductor", default: false }
        ]),
        onResponse: function (response, settings) {
            var controls = response.transportControls && response.transportControls.transportControlsRenderer;
            if (!controls) return;
            var removed = filterControls(controls, settings);
            setRelatedHidden(!!settings.get("related"));
            if (removed) youtv.report("player: removed " + removed + " button(s)");
        }
    });
})();
