// Sey Morphe patches - Twitch TV AMOLED theme.
//
// Twitch's TV web app paints its surfaces #0e0e10 (page and the letterbox bars
// above/below the video) and #18181b (chat panel), and fades the chat edges in
// the same grey. This helper turns those surfaces pure black so they match an
// AMOLED panel. Nothing else changes: the layout, text colours and the player
// scrim stay exactly as Twitch draws them.
//
// Distributed as part of the Sey Morphe patches under the GNU GPL v3.
(function () {
    'use strict';

    var STYLE_ID = 'sey-amoled-style';
    var MARK = 'data-sey-amoled';
    var CHAT_GREY = /rgb\(24,\s*24,\s*27\)/g;
    var CSS = [
        'html, body { background-color: #000 !important; }',
        '.tw-root--theme-dark { background-color: #000 !important; }',
        'aside { background-color: #000 !important; }'
    ].join('\n');

    var enabled = true;
    var processed = typeof WeakSet === 'function' ? new WeakSet() : null;
    var patched = [];

    function notify(message) {
        try {
            if (window.seyttingsAmoled && window.seyttingsAmoled.report) {
                window.seyttingsAmoled.report(String(message));
            }
        } catch (e) { /* bridge unavailable */ }
        try {
            console.log('[SEYTTINGS amoled] ' + message);
        } catch (e) { /* console unavailable */ }
    }

    function styleTag() {
        var tag = document.getElementById(STYLE_ID);
        if (!tag) {
            tag = document.createElement('style');
            tag.id = STYLE_ID;
            tag.textContent = CSS;
            (document.head || document.documentElement).appendChild(tag);
        }
        return tag;
    }

    // Rewrites one gradient (chat fade) or the page background to black.
    function paint(el, image) {
        if (el.getAttribute(MARK) === '1') return;
        el.setAttribute(MARK, '1');
        el.style.setProperty('background-image', image, 'important');
        patched.push(el);
    }

    // Chat panel: Twitch fades the top (and, with the footer visible, the
    // bottom) edge from transparent to #18181b. The gradient is computed by
    // the app, so it is copied and only the grey stop is replaced.
    function paintChat() {
        var aside = document.querySelector('aside');
        if (!aside) return;
        var nodes = aside.querySelectorAll('div');
        for (var i = 0; i < nodes.length; i++) {
            var el = nodes[i];
            if (processed && processed.has(el)) continue;
            var image = '';
            try {
                image = window.getComputedStyle(el).backgroundImage || '';
            } catch (e) {
                continue;
            }
            if (image.indexOf('gradient') === -1) continue;
            if (image.indexOf('rgb(24, 24, 27)') === -1) continue;
            if (processed) processed.add(el);
            paint(el, image.replace(CHAT_GREY, '#000'));
        }
    }

    function apply() {
        if (!enabled || !document.body) return;
        styleTag();
        paintChat();
    }

    function restore() {
        var tag = document.getElementById(STYLE_ID);
        if (tag && tag.parentNode) tag.parentNode.removeChild(tag);
        for (var i = 0; i < patched.length; i++) {
            var el = patched[i];
            try {
                el.style.removeProperty('background-image');
                el.removeAttribute(MARK);
            } catch (e) { /* element gone */ }
        }
        patched = [];
        if (processed) processed = new WeakSet();
    }

    var pending = null;
    function schedule() {
        if (pending !== null) return;
        pending = window.setTimeout(function () {
            pending = null;
            apply();
        }, 120);
    }

    function setEnabled(on) {
        on = !!on;
        if (on === enabled) return;
        enabled = on;
        if (on) {
            apply();
            notify('AMOLED theme enabled');
        } else {
            restore();
            notify('AMOLED theme disabled');
        }
    }

    if (typeof window !== 'undefined' && window.top === window && !window.__seyAmoled) {
        window.__seyAmoled = true;
        try {
            if (window.seyttingsAmoled && window.seyttingsAmoled.isEnabled) {
                enabled = !!window.seyttingsAmoled.isEnabled();
            }
        } catch (e) { /* native bridge unavailable */ }

        window.__seyAmoledApply = apply;
        window.__seyAmoledSetEnabled = setEnabled;
        window.__seyAmoledState = function () {
            return { enabled: enabled, gradients: patched.length };
        };

        if (enabled) {
            apply();
        }

        try {
            new MutationObserver(schedule).observe(document.documentElement, {
                childList: true,
                subtree: true
            });
        } catch (e) { /* observer unavailable */ }
        window.addEventListener('popstate', schedule);
        window.setInterval(schedule, 2000);

        notify('AMOLED theme installed, enabled=' + enabled);
    }
})();
