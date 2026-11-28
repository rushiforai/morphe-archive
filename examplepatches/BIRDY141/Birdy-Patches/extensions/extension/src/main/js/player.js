// Player: hide buttons of the playback screen and the related videos row.
// The /next response (7.32.300) has transportControls.transportControlsRenderer with three lists:
// promotedActions, engagementActions and settingActions; each item is
// { type: "TRANSPORT_CONTROLS_BUTTON_TYPE_...", button: { <type>Renderer } }.
// Buttons are matched by that type (language independent), with the icon as a fallback.
(function () {
    if (!window.youtv) return;

    var P = "TRANSPORT_CONTROLS_BUTTON_TYPE_";
    var BUTTONS = [
        { key: "channel", titleKey: "player.channel.title", types: ["CHANNEL_BUTTON"] },
        { key: "description", titleKey: "player.description.title", types: ["ABOUT_BUTTON"] },
        { key: "subscribe", titleKey: "player.subscribe.title", types: ["SUBSCRIBE", "SUBSCRIBE_BUTTON"] },
        { key: "join", titleKey: "player.join.title", types: ["SPONSORSHIPS", "JOIN", "MEMBERSHIP", "CHANNEL_MEMBERSHIP"], icons: ["LOYALTY", "MEMBERSHIP", "MONETIZATION_ON"] },
        { key: "like", titleKey: "player.like.title", types: ["LIKE_BUTTON"] },
        { key: "comments", titleKey: "player.comments.title", types: ["COMMENTS"], icons: ["COMMENT"] },
        { key: "ask", titleKey: "player.ask.title", icons: ["SPARK"] },
        { key: "save", titleKey: "player.save.title", types: ["ADD_TO_PLAYLIST"], icons: ["BOOKMARK_BORDER", "BOOKMARK"] },
        { key: "thanks", titleKey: "player.thanks.title", types: ["SUPER_THANKS"], icons: ["MONEY_HEART"] },
        { key: "report", titleKey: "player.report.title", types: ["REPORT_VIDEO", "FEEDBACK"], icons: ["FLAG", "FEEDBACK"] },
        { key: "stats", titleKey: "player.stats.title", types: ["STATS_FOR_NERDS"], icons: ["BUG_REPORT"] }
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
        var button = item.button || {};
        if (spec.key === "subscribe" && button.subscribeButtonRenderer) return true;
        if (spec.key === "join" && (button.sponsorshipsOfferButtonRenderer || /sponsorship/i.test(JSON.stringify(button)))) return true;
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
    var relatedHidden = null;
    function setRelatedHidden(hidden) {
        try {
            if (!sheet) {
                sheet = new CSSStyleSheet();
                document.adoptedStyleSheets = document.adoptedStyleSheets.concat([sheet]);
            }
            if (relatedHidden === hidden) return;
            sheet.replaceSync(hidden ? "ytlr-pivot { display: none !important; }" : "");
            relatedHidden = hidden;
        } catch (e) {
            youtv.report("player: stylesheet failed: " + e);
        }
    }

    function injectPipButton(controls) {
        var targetList = Array.isArray(controls.engagementActions) ? controls.engagementActions
            : (Array.isArray(controls.settingActions) ? controls.settingActions : null);
        if (!targetList) return;
        for (var i = 0; i < targetList.length; i++) {
            var br = targetList[i] && targetList[i].button && targetList[i].button.buttonRenderer;
            if (br && br.itemId === "BIRDY_PIP_BUTTON") return;
        }
        var pipAction = {
            setClientSettingEndpoint: {
                settingDatas: [{ clientSettingEnum: { item: "BIRDY_ENTER_PIP_REQUEST" }, boolValue: true }]
            }
        };
        targetList.push({
            type: "TRANSPORT_CONTROLS_BUTTON_TYPE_UNKNOWN",
            button: {
                buttonRenderer: {
                    itemId: "BIRDY_PIP_BUTTON",
                    icon: { iconType: "OPEN_IN_NEW" },
                    text: { runs: [{ text: "PiP" }] },
                    tooltip: "Picture-in-Picture",
                    accessibility: { label: "Picture-in-Picture" },
                    accessibilityData: { accessibilityData: { label: "Picture-in-Picture" } },
                    serviceEndpoint: pipAction,
                    command: pipAction
                }
            }
        });
    }

    function isPipElement(el) {
        var cur = el;
        while (cur && cur !== document.documentElement) {
            if (cur.getAttribute && cur.getAttribute("aria-label") === "Picture-in-Picture") return true;
            cur = cur.parentElement;
        }
        return false;
    }

    if (typeof document !== "undefined" && typeof document.addEventListener === "function") {
        document.addEventListener("click", function (e) {
            if (isPipElement(e.target)) {
                youtv.report("@enterpip");
            }
        }, true);
        document.addEventListener("keydown", function (e) {
            var code = e.keyCode || e.which;
            if (code === 13 || code === 23) {
                var focusedPip = document.querySelector("[aria-label='Picture-in-Picture'].focused, .focused [aria-label='Picture-in-Picture']");
                if (isPipElement(document.activeElement) || focusedPip) {
                    youtv.report("@enterpip");
                }
            }
        }, true);
    }

    function unlockSpeedButton(controls) {
        LISTS.forEach(function (list) {
            var items = controls[list];
            if (!Array.isArray(items)) return;
            for (var i = 0; i < items.length; i++) {
                var item = items[i];
                if (!item || !item.button) continue;
                var type = item.type || "";
                var br = item.button.buttonRenderer || item.button[Object.keys(item.button)[0]];
                if (!br) continue;
                if (/SPEED|PLAYBACK_RATE/i.test(type) || /SPEED|SLOW_MOTION/i.test(iconOf(item))) {
                    if (br.isDisabled) br.isDisabled = false;
                    if (br.disabledServiceEndpoint) delete br.disabledServiceEndpoint;
                }
            }
        });
    }

    youtv.feature({
        id: "player",
        nameKey: "feature.player.name",
        summaryKey: "feature.player.summary",
        defaultEnabled: true,
        settings: BUTTONS.map(function (b) { return { key: b.key, titleKey: b.titleKey, default: false }; }).concat([
            { key: "related", titleKey: "player.related.title", summaryKey: "player.related.summary", default: false },
            { key: "show_pip", titleKey: "player.show_pip.title", summaryKey: "player.show_pip.summary", default: false }
        ]),
        onResponse: function (response, settings) {
            var controls = response.transportControls && response.transportControls.transportControlsRenderer;
            if (!controls) return;
            var removed = filterControls(controls, settings);
            unlockSpeedButton(controls);
            if (settings.get("show_pip")) injectPipButton(controls);
            setRelatedHidden(!!settings.get("related"));
            if (removed) youtv.report("player: removed " + removed + " button(s)");
        }
    });
})();
