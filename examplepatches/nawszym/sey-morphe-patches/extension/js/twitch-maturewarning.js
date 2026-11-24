// Sey Morphe patches - Twitch TV mature content warning auto-accept.
//
// Twitch's TV web app occasionally gates a stream behind an "18+ / mature
// content" confirmation overlay. The overlay is rendered by the remote
// Next.js bundle, so the only reliable way to dismiss it is to click the
// confirmation button it draws ("Start watching", "Watch now", "Continue",
// "I understand", ...). This helper finds that button, verifies that it sits
// inside the warning (so a normal "Watch" tile in the catalogue is never
// clicked), and clicks it once per dialog.
//
// Distributed as part of the Sey Morphe patches under the GNU GPL v3.
(function () {
    'use strict';

    // Labels Twitch puts on the confirmation button of the mature warning.
    // Only specific labels are listed; a bare "Watch" tile in the catalogue is
    // deliberately not matched.
    var ACCEPT_LABELS = [
        'start watching',
        'start stream',
        'watch now',
        'watch anyway',
        'continue watching',
        'continue',
        'i understand',
        'i agree',
        'proceed',
        'enter',
        'accept',
        'ok',
        'okay'
    ];

    // Words that identify the mature content warning itself.
    var MATURE_WORDS = [
        'mature',
        '18+',
        'age-restricted',
        'age restricted',
        'content warning',
        'mature content',
        'adult content',
        'sensitive content'
    ];

    var CLICK_COOLDOWN_MS = 2500;
    // The warning is a small overlay; anything with this much text is the page
    // itself and must not be treated as the warning.
    var MAX_WARNING_TEXT = 900;

    // Extra labels that are only safe inside an element already identified as a
    // mature dialog, where a plain "Watch" cannot be a catalogue tile.
    var DIALOG_ACCEPT_LABELS = ACCEPT_LABELS.concat(['watch', 'start', 'yes']);

    var enabled = true;
    var lastClick = 0;
    var accepted = 0;
    var clicked = typeof WeakSet === 'function' ? new WeakSet() : null;
    var pending = null;

    function notify(message) {
        try {
            if (window.seyttingsMature && window.seyttingsMature.report) {
                window.seyttingsMature.report(String(message));
            }
        } catch (e) { /* bridge unavailable */ }
        try {
            console.log('[SEYTTINGS mature] ' + message);
        } catch (e) { /* console unavailable */ }
    }

    function norm(text) {
        return String(text == null ? '' : text).replace(/\s+/g, ' ').trim().toLowerCase();
    }

    function isVisible(el) {
        if (!el || !el.getBoundingClientRect) return false;
        var rect = el.getBoundingClientRect();
        if (rect.width <= 0 || rect.height <= 0) return false;
        var style = null;
        try {
            style = window.getComputedStyle(el);
        } catch (e) {
            return true;
        }
        if (!style) return true;
        if (style.display === 'none' || style.visibility === 'hidden') return false;
        if (parseFloat(style.opacity) === 0) return false;
        return true;
    }

    function elementText(el) {
        if (!el) return '';
        var text = el.innerText || el.textContent || '';
        var label = el.getAttribute ? el.getAttribute('aria-label') : '';
        return norm(text + ' ' + (label || ''));
    }

    function hasMatureWord(text) {
        for (var i = 0; i < MATURE_WORDS.length; i++) {
            if (text.indexOf(MATURE_WORDS[i]) !== -1) return true;
        }
        return false;
    }

    function matchesLabel(text, labels) {
        if (!text || text.length > 40) return false;
        for (var i = 0; i < labels.length; i++) {
            var label = labels[i];
            if (text === label) return true;
            // "Start watching now", "Continue to stream" and similar.
            if (text.indexOf(label) === 0 && text.length <= label.length + 18) return true;
        }
        return false;
    }

    function isAcceptLabel(text) {
        return matchesLabel(text, ACCEPT_LABELS);
    }

    function isDialogAcceptLabel(text) {
        return matchesLabel(text, DIALOG_ACCEPT_LABELS);
    }

    function clickElement(el) {
        try {
            el.click();
            return true;
        } catch (e) { /* not a plain HTMLElement */ }
        try {
            el.dispatchEvent(new MouseEvent('click', {
                bubbles: true,
                cancelable: true,
                view: window
            }));
            return true;
        } catch (e) { /* give up on this element */ }
        return false;
    }

    // Walks up from a candidate button and returns the smallest ancestor that
    // still contains the mature warning text, or null when there is none.
    function warningAncestor(button) {
        var node = button.parentElement;
        var best = null;
        for (var depth = 0; node && depth < 7; depth++) {
            if (node === document.body || node === document.documentElement) break;
            var text = elementText(node);
            if (text.length > MAX_WARNING_TEXT) break;
            if (hasMatureWord(text)) {
                best = node;
                break;
            }
            node = node.parentElement;
        }
        return best;
    }

    function acceptWarning() {
        if (!enabled || !document.body) return false;

        var now = Date.now();
        if (now - lastClick < CLICK_COOLDOWN_MS) return false;

        var candidates = document.querySelectorAll(
            '[role="dialog"] button, [role="dialog"] [role="button"], [role="dialog"] a,' +
            ' [aria-modal="true"] button, [aria-modal="true"] [role="button"], [aria-modal="true"] a'
        );
        var button = null;
        var root = null;
        var i;

        for (i = 0; i < candidates.length; i++) {
            var dialogButton = candidates[i];
            if (clicked && clicked.has(dialogButton)) continue;
            if (!isVisible(dialogButton)) continue;
            if (!isDialogAcceptLabel(elementText(dialogButton))) continue;
            var dialog = dialogButton.closest('[role="dialog"], [aria-modal="true"]');
            if (!dialog || !hasMatureWord(elementText(dialog))) continue;
            button = dialogButton;
            root = dialog;
            break;
        }

        if (!button) {
            // Some builds draw the warning as a plain fixed overlay without a
            // dialog role. Walk the confirmation buttons and verify their
            // nearest ancestors, keeping the check strict enough that a
            // catalogue tile cannot match.
            candidates = document.querySelectorAll('button, [role="button"], a');
            for (i = 0; i < candidates.length; i++) {
                var candidate = candidates[i];
                if (clicked && clicked.has(candidate)) continue;
                if (!isVisible(candidate)) continue;
                if (!isAcceptLabel(elementText(candidate))) continue;
                var ancestor = warningAncestor(candidate);
                if (!ancestor) continue;
                button = candidate;
                root = ancestor;
                break;
            }
        }

        if (!button) return false;

        if (clicked) clicked.add(button);
        lastClick = now;
        if (clickElement(button)) {
            accepted++;
            notify('accepted mature warning (' + elementText(button) + '), total=' + accepted);
            return true;
        }
        return false;
    }

    function schedule() {
        if (pending !== null) return;
        pending = window.setTimeout(function () {
            pending = null;
            acceptWarning();
        }, 300);
    }

    function setEnabled(on) {
        on = !!on;
        if (on === enabled) return;
        enabled = on;
        notify(on ? 'mature warning auto-accept enabled' : 'mature warning auto-accept disabled');
        if (on) schedule();
    }

    if (typeof window !== 'undefined' && window.top === window && !window.__seyMature) {
        window.__seyMature = true;
        try {
            if (window.seyttingsMature && window.seyttingsMature.isEnabled) {
                enabled = !!window.seyttingsMature.isEnabled();
            }
        } catch (e) { /* native bridge unavailable */ }

        window.__seyMatureAccept = acceptWarning;
        window.__seyMatureSetEnabled = setEnabled;
        window.__seyMatureState = function () {
            return { enabled: enabled, accepted: accepted };
        };

        schedule();

        try {
            new MutationObserver(schedule).observe(document.documentElement, {
                childList: true,
                subtree: true
            });
        } catch (e) { /* observer unavailable */ }
        window.addEventListener('popstate', schedule);
        window.setInterval(schedule, 2000);

        notify('mature warning auto-accept installed, enabled=' + enabled);
    }
})();
