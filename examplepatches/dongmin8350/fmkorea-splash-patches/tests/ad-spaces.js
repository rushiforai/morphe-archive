// FMKOREA_AD_SPACES_BEGIN v1.3.4
(function () {
    'use strict';

    if (!/(^|\.)fmkorea\.com$/.test(location.hostname)) return;
    if (window.__dongminFmkoreaAdsV134) return;
    window.__dongminFmkoreaAdsV134 = true;

    var marker = 'data-dongmin-fmkorea-ad-space';
    var styleId = 'dongmin-fmkorea-ad-spaces-style-v134';
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
        'div[class^="ad"]',
        'div[id^="ad"]',
        '.fmad_wrapper',
        'div[id^="fmad_"] + div[style^="height:"][class]',
        'div[id^="fm_read_vote_sq_"]',
        '.adpost',
        'ins.adsbygoogle',
        '[id^="google_ads_"]',
        'iframe[src*="doubleclick.net"]',
        'iframe[src*="googlesyndication.com"]',
        'iframe[src*="googleadservices.com"]',
        'iframe[src*="adnmore.co.kr"]',
        'iframe[src*="adison.co"]',
        'iframe[src*="m.fmkorea.com/_adpage/"]',
        'iframe[src*="loader.fmkorea.com/"][src*="_loader/"]',
        'iframe[src*="loader2.fmkorea.com/_myphp/adpost/content_new.php"]',
        '.fm_vote ~ div[style*="max-width:"]',
        '.rd_ft > div[style^="margin:"][style*="max-width:"]'
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

    function isAdOnlyWrapper(node) {
        if (!node || containsProtectedContent(node)) return false;

        var meaningful = Array.prototype.filter.call(node.children || [], function (child) {
            return child.tagName !== 'SCRIPT' && child.tagName !== 'STYLE' && child.tagName !== 'LINK';
        });

        if (!meaningful.length) return true;

        return meaningful.every(function (child) {
            return child.hasAttribute(marker) ||
                (child.matches && child.matches(hardAdSelector));
        });
    }

    function collapseAdAndWrapper(node) {
        collapse(node);

        var parent = node.parentElement;
        var depth = 0;
        while (parent && parent !== document.body && depth++ < 4) {
            if (containsProtectedContent(parent)) break;

            var className = typeof parent.className === 'string' ? parent.className : '';
            var knownWrapper =
                /(^|\s)bd_mobile(\s|$)/.test(className) ||
                /(^|[_-])(ad|ads)([_-]|$)/i.test(className) ||
                /(^|[_-])(ad|ads)([_-]|$)/i.test(parent.id || '') ||
                isAdOnlyWrapper(parent);

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

    function hasListKrSpacerPadding(node) {
        var c = window.getComputedStyle(node);
        var h = parseFloat(c.height);
        return c.paddingTop === '5px' &&
            c.paddingRight === '10px' &&
            c.paddingBottom === '20px' &&
            c.paddingLeft === '10px' &&
            Number.isFinite(h) && h >= 10 && h < 1000;
    }

    function collapseListKrFmkoreaSpacers() {
        document.querySelectorAll(
            'body[class*="mac_os"] div.hd ~ *[id][class*=" "], ' +
            'header.hd ~ .fmad_wrapper ~ *[class], ' +
            'body div.bd div[style] > *[class*=" "], ' +
            'body div.hd div[style] > *[class*=" "]'
        ).forEach(function (node) {
            if (!containsProtectedContent(node) && hasListKrSpacerPadding(node)) collapse(node);
        });

        document.querySelectorAll('.bd.bd_mobile').forEach(function (node) {
            if (!node.children.length && !node.textContent.trim()) collapse(node);
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
        collapseListKrFmkoreaSpacers();
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
