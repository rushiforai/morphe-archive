package app.dongmin8350.patches.fmkorea

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch

/**
 * Uses FMKorea's existing WebView custom CSS/JS hooks.
 *
 * This patch is intentionally DOM-scoped to fmkorea.com and does not require
 * AdGuard, a VPN, DNS filtering, or HTTPS interception.
 */
@Suppress("unused")
val collapseFmkoreaAdSpacesPatch = resourcePatch(
    name = "Remove FMKorea ads and spaces",
    description = "Removes FMKorea web ads, suppresses mobile power-link generation, and collapses the remaining ad containers without AdGuard.",
    default = false
) {
    compatibleWith(FMKOREA_COMPATIBILITY)

    execute {
        val scriptFile = get("assets/custom.js", false)
        val cssFile = get("assets/custom.css", false)

        if (!scriptFile.isFile || !cssFile.isFile) {
            throw PatchException(
                "FMKorea custom WebView CSS/JS hooks were not found; this app version needs inspection."
            )
        }

        val originalScript = scriptFile.readText()
        if (!originalScript.contains("FMAppBridge") || !originalScript.contains("fmapp")) {
            throw PatchException(
                "Unrecognized FMKorea custom.js; refusing to replace an unrelated asset."
            )
        }

        // Repatching replaces our previous block instead of stacking observers/styles.
        val previousJsBlock = Regex(
            "// FMKOREA_AD_SPACES_BEGIN[^\\n]*[\\s\\S]*?// FMKOREA_AD_SPACES_END"
        )
        val previousCssBlock = Regex(
            "/\\* FMKOREA_AD_CSS_BEGIN[^*]*\\*/[\\s\\S]*?/\\* FMKOREA_AD_CSS_END \\*/"
        )

        val cleanScript = originalScript.replace(previousJsBlock, "").trimEnd()
        val cleanCss = cssFile.readText().replace(previousCssBlock, "").trimEnd()

        scriptFile.writeText(cleanScript + "\n\n" + FMKOREA_AD_SPACE_SCRIPT + "\n")
        cssFile.writeText(cleanCss + "\n\n" + FMKOREA_AD_CSS + "\n")
    }
}

internal val FMKOREA_AD_CSS = """
/* FMKOREA_AD_CSS_BEGIN v1.2.0 */
[class$="_ad"],
ins.adsbygoogle,
[id^="google_ads_"],
iframe[src*="doubleclick.net"],
iframe[src*="googlesyndication.com"],
iframe[src*="googleadservices.com"],
iframe[src*="adnmore.co.kr"],
iframe[src*="adison.co"],
[data-dongmin-fmkorea-ad-space] {
    display: none !important;
    height: 0 !important;
    min-height: 0 !important;
    max-height: 0 !important;
    margin: 0 !important;
    padding: 0 !important;
    border: 0 !important;
    overflow: hidden !important;
}

/*
 * This is the cosmetic rule that previously removed the user's persistent
 * article-footer ad gap. Keep vote/navigation/button/sign controls intact.
 */
.rd_ft > div:not(.rd_vote):not([class*="vote"]):not([class*="nav"]):not([class*="btn"]):not([class*="sign"]) {
    display: none !important;
    height: 0 !important;
    min-height: 0 !important;
    max-height: 0 !important;
    margin: 0 !important;
    padding: 0 !important;
    border: 0 !important;
    overflow: hidden !important;
}
/* FMKOREA_AD_CSS_END */
""".trimIndent()

internal val FMKOREA_AD_SPACE_SCRIPT = """
// FMKOREA_AD_SPACES_BEGIN v1.2.0
(function () {
    'use strict';

    if (!/(^|\.)fmkorea\.com$/.test(location.hostname)) return;
    if (window.__dongminFmkoreaAdsV12) return;
    window.__dongminFmkoreaAdsV12 = true;

    var marker = 'data-dongmin-fmkorea-ad-space';
    var styleId = 'dongmin-fmkorea-ad-spaces-style-v12';
    var queued = false;

    var collapsedStyle = {
        'display': 'none',
        'height': '0px',
        'min-height': '0px',
        'max-height': '0px',
        'margin': '0px',
        'padding': '0px',
        'border': '0px',
        'overflow': 'hidden'
    };

    var hardAdSelector = [
        '[class$="_ad"]',
        'ins.adsbygoogle',
        '[id^="google_ads_"]',
        'iframe[src*="doubleclick.net"]',
        'iframe[src*="googlesyndication.com"]',
        'iframe[src*="googleadservices.com"]',
        'iframe[src*="adnmore.co.kr"]',
        'iframe[src*="adison.co"]'
    ].join(',');

    var protectedSelector = [
        '#comment',
        '#bd_capture',
        'form[action="./"]',
        '.rd_vote',
        '[class*="vote"]',
        '[class*="nav"]',
        '[class*="btn"]',
        '[class*="sign"]'
    ].join(',');

    function collapse(node) {
        if (!node || node.nodeType !== 1) return;
        if (!node.hasAttribute(marker)) node.setAttribute(marker, '');

        Object.keys(collapsedStyle).forEach(function (property) {
            var value = collapsedStyle[property];
            if (node.style.getPropertyValue(property) !== value ||
                node.style.getPropertyPriority(property) !== 'important') {
                node.style.setProperty(property, value, 'important');
            }
        });
    }

    function pxAtMostFive(value) {
        var n = parseFloat(value);
        return Number.isFinite(n) && n >= 0 && n <= 5;
    }

    function hasSmallMarginPadding(node) {
        var c = window.getComputedStyle(node);
        return [
            c.marginTop, c.marginRight, c.marginBottom, c.marginLeft,
            c.paddingTop, c.paddingRight, c.paddingBottom, c.paddingLeft
        ].every(pxAtMostFive);
    }

    function containsProtectedContent(node) {
        return !!node.querySelector(protectedSelector);
    }

    function collapseAdAndWrapper(node) {
        collapse(node);

        var parent = node.parentElement;
        var depth = 0;
        while (parent && parent !== document.body && depth++ < 3) {
            if (containsProtectedContent(parent)) break;

            var className = typeof parent.className === 'string' ? parent.className : '';
            var knownWrapper =
                /(^|\s)bd_mobile(\s|$)/.test(className) ||
                /(^|[_-])(ad|ads)([_-]|$)/i.test(className) ||
                /(^|[_-])(ad|ads)([_-]|$)/i.test(parent.id || '');

            if (!knownWrapper) break;
            collapse(parent);
            parent = parent.parentElement;
        }
    }

    function suppressPowerLinkFactory() {
        var noop = function () {};
        try {
            Object.defineProperty(window, '_make_power_link_identifier', {
                configurable: true,
                enumerable: false,
                get: function () { return noop; },
                set: function () {}
            });
        } catch (e) {
            try { window._make_power_link_identifier = noop; } catch (_) {}
        }
    }

    function collapseKnownMobileContainers() {
        document.querySelectorAll('section.fmWidgetStyle2019.bd_mobile.bd').forEach(function (node) {
            if (!containsProtectedContent(node) && hasSmallMarginPadding(node)) collapse(node);
        });

        document.querySelectorAll('script ~ div.bd_mobile.bd').forEach(function (node) {
            if (!containsProtectedContent(node) && hasSmallMarginPadding(node)) collapse(node);
        });
    }

    function collapseLegacyFooterGaps() {
        document.querySelectorAll(
            '.rd_ft > div:not(.rd_vote):not([class*="vote"]):not([class*="nav"]):not([class*="btn"]):not([class*="sign"])'
        ).forEach(function (node) {
            if (!containsProtectedContent(node)) collapse(node);
        });
    }

    function sweep() {
        queued = false;
        if (!document.documentElement) return;

        suppressPowerLinkFactory();

        if (!document.getElementById(styleId)) {
            var style = document.createElement('style');
            style.id = styleId;
            style.textContent =
                '[' + marker + '],' + hardAdSelector + '{' +
                'display:none!important;height:0!important;min-height:0!important;' +
                'max-height:0!important;margin:0!important;padding:0!important;' +
                'border:0!important;overflow:hidden!important;}';
            (document.head || document.documentElement).appendChild(style);
        }

        document.querySelectorAll(hardAdSelector).forEach(collapseAdAndWrapper);

        document.querySelectorAll('div[style], [' + marker + ']').forEach(function (node) {
            var s = node.style;
            var isSpacer = node.tagName === 'DIV' &&
                s.getPropertyValue('display') === 'block' &&
                s.getPropertyPriority('display') === 'important' &&
                s.getPropertyValue('visibility') === 'hidden' &&
                parseFloat(s.getPropertyValue('height')) > 0;

            if (isSpacer || node.hasAttribute(marker)) collapse(node);
        });

        collapseKnownMobileContainers();
        collapseLegacyFooterGaps();
    }

    function schedule() {
        if (!queued) {
            queued = true;
            (window.requestAnimationFrame || function (fn) {
                return setTimeout(fn, 16);
            })(sweep);
        }
    }

    function start() {
        if (!document.documentElement) return;

        suppressPowerLinkFactory();
        sweep();

        new MutationObserver(schedule).observe(document.documentElement, {
            childList: true,
            subtree: true,
            attributes: true,
            attributeFilter: ['style', 'class', 'id', 'src']
        });

        window.addEventListener('pageshow', schedule);
    }

    if (document.documentElement) start();
    else document.addEventListener('DOMContentLoaded', start, { once: true });
})();
// FMKOREA_AD_SPACES_END
""".trimIndent()
