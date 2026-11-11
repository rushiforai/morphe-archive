// Sey Morphe patches - Twitch TV hide pinned messages.
//
// Twitch renders a pinned chat message as a card above the message list. The
// native card uses the `pinned-chat` block (`.pinned-chat__highlight-card` with
// `.pinned-chat__message` as the body) and carries a "Pinned by ..." label plus
// a pin badge. On a TV the card takes a large part of the chat, so this helper
// removes the whole card and every related pinned element (the attribution,
// the pin badge and any pinned highlight in the message list).
//
// The known BEM classes are hidden through one style sheet, so newly rendered
// cards disappear before the next paint. A conservative text fallback covers
// builds that rename the classes: it only looks inside the chat panel and only
// for cards whose text starts with a pinned-message label.
//
// Distributed as part of the Sey Morphe patches under the GNU GPL v3.
(function () {
    'use strict';

    var STYLE_ID = 'sey-pinned-style';
    var MARK = 'data-sey-pinned-hidden';

    // Native pinned card and its derivatives. The attribute selectors are
    // intentionally limited to the `pinned` / `pin-message` names so normal
    // chat rows, author names and the chat panel itself are never matched.
    var SELECTORS = [
        '.pinned-chat',
        '.pinned-chat__highlight-card',
        '.pinned-chat__message',
        '[class*="pinned-chat"]',
        '[class*="pinnedChat"]',
        '[class*="pinned-message"]',
        '[class*="pinnedMessage"]',
        '[class*="message--pinned"]',
        '[class*="pinned__"]',
        '[data-test-selector*="pinned" i]',
        '[data-test-selector*="pin-message" i]',
        '[data-a-target*="pinned" i]',
        '[data-a-target*="pin-message" i]'
    ];

    var SELECTOR = SELECTORS.join(', ');
    var CSS = SELECTOR + ' { display: none !important; }';

    // Text of a pinned card starts with one of these labels. A bare "pinned"
    // is deliberately not accepted, so an ordinary message that happens to
    // contain the word is left alone.
    var TEXT_LABELS = [
        'pinned by ',
        'pinned message',
        'pinned chat',
        'message pinned',
        'pinned by:'
    ];

    // The card is small; anything larger is the chat container, not a card.
    var MAX_CARD_TEXT = 1200;

    var enabled = false;
    var hidden = [];
    var pending = null;

    function notify(message) {
        try {
            if (window.seyttingsPinned && window.seyttingsPinned.report) {
                window.seyttingsPinned.report(String(message));
            }
        } catch (e) { /* bridge unavailable */ }
        try {
            console.log('[SEYTTINGS pinned] ' + message);
        } catch (e) { /* console unavailable */ }
    }

    function norm(text) {
        return String(text == null ? '' : text).replace(/\s+/g, ' ').trim().toLowerCase();
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

    function isChatPanel(el) {
        if (!el || !el.matches) return false;
        return el.matches('aside, [role="log"], [class*="chat-scrollable-area"], [class*="chat-panel"]');
    }

    function hide(el) {
        if (!el || el === document.body || el === document.documentElement) return;
        if (isChatPanel(el)) return;
        if (el.getAttribute(MARK) === '1') return;
        el.setAttribute(MARK, '1');
        el.style.setProperty('display', 'none', 'important');
        hidden.push(el);
    }

    function startsWithPinnedLabel(text) {
        for (var i = 0; i < TEXT_LABELS.length; i++) {
            if (text.indexOf(TEXT_LABELS[i]) === 0) return true;
        }
        return false;
    }

    // Fallback for builds with renamed classes: find the card that starts with
    // a "Pinned by ..." label, then walk up to the largest ancestor that still
    // contains only that card (its text still starts with the same label).
    function hideTextCards() {
        var scope = document.querySelector('aside') ||
            document.querySelector('[class*="chat-scrollable-area"]') ||
            document.querySelector('[class*="chat-panel"]');
        if (!scope) return;

        var all = scope.textContent || '';
        if (all.toLowerCase().indexOf('pinned') === -1) return;

        var nodes = scope.querySelectorAll('div, section, article, li, [role="listitem"]');
        for (var i = 0; i < nodes.length; i++) {
            var node = nodes[i];
            if (node.getAttribute(MARK) === '1') continue;
            if (node.querySelector('[' + MARK + ']')) continue;
            var text = norm(node.innerText);
            if (!text || text.length > MAX_CARD_TEXT) continue;
            if (!startsWithPinnedLabel(text)) continue;

            var card = node;
            var parent = node.parentElement;
            while (parent && parent !== scope && !isChatPanel(parent)) {
                var parentText = norm(parent.innerText);
                if (!parentText || parentText.length > MAX_CARD_TEXT) break;
                if (!startsWithPinnedLabel(parentText)) break;
                if (parent.querySelectorAll('.chat-line__message').length > 1) break;
                card = parent;
                parent = parent.parentElement;
            }
            hide(card);
        }
    }

    // The body class is the most reliable marker: hide the card that wraps it
    // even when the wrapper itself has no pinned class.
    function cardForBody(body) {
        var card = body;
        var node = body.parentElement;
        for (var depth = 0; node && depth < 4; depth++) {
            if (node === document.body || node === document.documentElement) break;
            if (isChatPanel(node)) break;
            var text = norm(node.innerText);
            if (!text || text.length > MAX_CARD_TEXT) break;
            // More than one message row means this is the message list, not
            // the card that contains the pinned message.
            if (node.querySelectorAll('.chat-line__message').length > 1) break;
            card = node;
            node = node.parentElement;
        }
        return card;
    }

    function hidePinnedBodies() {
        var bodies = document.querySelectorAll('.pinned-chat__message, [class*="pinned-message"]');
        for (var i = 0; i < bodies.length; i++) {
            hide(cardForBody(bodies[i]));
        }
    }

    function apply() {
        if (!enabled || !document.body) return;
        styleTag();
        hidePinnedBodies();
        hideTextCards();
    }

    function restore() {
        var tag = document.getElementById(STYLE_ID);
        if (tag && tag.parentNode) tag.parentNode.removeChild(tag);
        for (var i = 0; i < hidden.length; i++) {
            var el = hidden[i];
            try {
                el.style.removeProperty('display');
                el.removeAttribute(MARK);
            } catch (e) { /* element gone */ }
        }
        hidden = [];
    }

    function countHidden() {
        var count = hidden.length;
        try {
            count += document.querySelectorAll(SELECTOR).length;
        } catch (e) { /* selector unavailable */ }
        return count;
    }

    function schedule() {
        if (pending !== null) return;
        pending = window.setTimeout(function () {
            pending = null;
            apply();
        }, 300);
    }

    function setEnabled(on) {
        on = !!on;
        if (on === enabled) return;
        enabled = on;
        if (on) {
            apply();
            notify('hide pinned enabled, hidden=' + countHidden());
        } else {
            restore();
            notify('hide pinned disabled');
        }
    }

    if (typeof window !== 'undefined' && window.top === window && !window.__seyPinned) {
        window.__seyPinned = true;
        try {
            if (window.seyttingsPinned && window.seyttingsPinned.isEnabled) {
                enabled = !!window.seyttingsPinned.isEnabled();
            }
        } catch (e) { /* native bridge unavailable */ }

        window.__seyPinnedApply = apply;
        window.__seyPinnedSetEnabled = setEnabled;
        window.__seyPinnedState = function () {
            return { enabled: enabled, hidden: countHidden() };
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

        notify('hide pinned installed, enabled=' + enabled);
    }
})();
