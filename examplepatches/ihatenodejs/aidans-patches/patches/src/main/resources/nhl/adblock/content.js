(function() {
    'use strict';
    if (window.__aidanAdBlockInjected) return;
    window.__aidanAdBlockInjected = true;

    var STATIC_SELECTORS = [
        '.nhl-o-adv[data-adv-container]',
        '.nhl-o-adv__slot[data-plugin="google-adv"]',
        '[data-ad-story-part][data-ad-position]',
        '.nhl-o-adv',
        '.nhl-c-adv',
        '.nhl-o-adv__slot',
        'div[id^="google_ads_iframe_"]'
    ];

    function applyStyle(id, css) {
        var el = document.getElementById(id);
        if (!el) {
            el = document.createElement('style');
            el.id = id;
            var target = document.head || document.documentElement;
            if (target) {
                target.appendChild(el);
            }
        }
        if (el) {
            el.textContent = css;
        }
    }

    // Immediately hide known static ad containers without waiting for JS evaluation or network
    applyStyle('aidan-nhl-static-cosmetics', STATIC_SELECTORS.join(',\n') + ' {\n    display: none !important;\n}');

    // Dynamic generic selector discovery via token batching
    var seenTokens = new Set();
    var pendingClasses = new Set();
    var pendingIds = new Set();
    var MAX_TOKENS_PER_NAV = 8192;
    var BATCH_LIMIT = 256;
    var batchScheduled = false;
    var batchTimer = null;
    function processElement(el) {
        if (!el || seenTokens.size >= MAX_TOKENS_PER_NAV) return;
        if (el.id && !seenTokens.has('#' + el.id)) {
            seenTokens.add('#' + el.id);
            pendingIds.add(el.id);
        }
        if (el.classList && el.classList.length > 0) {
            for (var i = 0; i < el.classList.length; i++) {
                var cls = el.classList[i];
                if (!seenTokens.has('.' + cls)) {
                    seenTokens.add('.' + cls);
                    pendingClasses.add(cls);
                }
            }
        }
    }

    function scheduleBatch() {
        if (batchScheduled || seenTokens.size >= MAX_TOKENS_PER_NAV) return;
        batchScheduled = true;
        batchTimer = setTimeout(function() {
            batchScheduled = false;
            batchTimer = null;
            if (pendingClasses.size === 0 && pendingIds.size === 0) return;

            var classesArray = Array.from(pendingClasses).slice(0, BATCH_LIMIT);
            var idsArray = Array.from(pendingIds).slice(0, BATCH_LIMIT);
            for (var i = 0; i < classesArray.length; i++) pendingClasses.delete(classesArray[i]);
            for (var j = 0; j < idsArray.length; j++) pendingIds.delete(idsArray[j]);

            if (window.aidanAdBlockPort && typeof window.aidanAdBlockPort.postMessage === 'function') {
                window.aidanAdBlockPort.postMessage(JSON.stringify({
                    classes: classesArray,
                    ids: idsArray
                }));
            }
            if (pendingClasses.size > 0 || pendingIds.size > 0) {
                scheduleBatch();
            }
        }, 200);
    }
    function scanSubtree(node) {
        if (!node || node.nodeType !== 1) return;
        processElement(node);
        var descendants = node.querySelectorAll ? node.querySelectorAll('*') : [];
        for (var i = 0; i < descendants.length; i++) {
            processElement(descendants[i]);
        }
        scheduleBatch();
    }

    var domLoadedListener = null;
    if (document.body) {
        scanSubtree(document.body);
    } else {
        domLoadedListener = function() {
            scanSubtree(document.body);
        };
        document.addEventListener('DOMContentLoaded', domLoadedListener);
    }
    // Observe subsequent DOM additions
    var observer = new MutationObserver(function(mutations) {
        for (var i = 0; i < mutations.length; i++) {
            var mutation = mutations[i];
            if (mutation.type === 'childList') {
                for (var j = 0; j < mutation.addedNodes.length; j++) {
                    var added = mutation.addedNodes[j];
                    if (added.nodeType === 1) {
                        scanSubtree(added);
                    }
                }
            } else if (mutation.type === 'attributes') {
                processElement(mutation.target);
                scheduleBatch();
            }
        }
    });

    observer.observe(document.documentElement || document, {
        childList: true,
        subtree: true,
        attributes: true,
        attributeFilter: ['class', 'id']
    });

    // Expose message receiver for native generic CSS updates
    window.__aidanAdBlockUpdateGenericCss = function(cssText) {
        applyStyle('aidan-nhl-generic-cosmetics', cssText);
    };

    // Expose message receiver for full teardown on protection pause
    window.__aidanAdBlockDisable = function() {
        try {
            if (observer) {
                observer.disconnect();
                observer = null;
            }
            if (batchTimer) {
                clearTimeout(batchTimer);
                batchTimer = null;
            }
            batchScheduled = false;
            if (domLoadedListener) {
                document.removeEventListener('DOMContentLoaded', domLoadedListener);
                domLoadedListener = null;
            }
            var s1 = document.getElementById('aidan-nhl-static-cosmetics');
            if (s1 && s1.parentNode) s1.parentNode.removeChild(s1);
            var s2 = document.getElementById('aidan-nhl-generic-cosmetics');
            if (s2 && s2.parentNode) s2.parentNode.removeChild(s2);
            delete window.__aidanAdBlockInjected;
            delete window.__aidanAdBlockUpdateGenericCss;
            delete window.__aidanAdBlockDisable;
        } catch (e) {}
    };
})();
