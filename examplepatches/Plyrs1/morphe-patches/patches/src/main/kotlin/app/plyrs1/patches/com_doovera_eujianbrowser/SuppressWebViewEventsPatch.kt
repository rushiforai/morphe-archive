package app.plyrs1.patches.com_doovera_eujianbrowser

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_EUJIANBROWSER

// Language=JS
private val EVENT_SUPPRESSION_SCRIPT = """
(function() {
    if (window.__ejGuardInstalled) return;
    window.__ejGuardInstalled = true;

    // ── 1. Freeze visibility API ──────────────────────────────────────────────
    // The exam page commonly listens for 'visibilitychange' and checks
    // document.hidden / document.visibilityState to detect tab switches.
    // We hard-wire both to "visible" / false so the page always thinks it
    // is in the foreground.
    try {
        Object.defineProperty(document, 'hidden', {
            get: function() { return false; },
            configurable: true
        });
        Object.defineProperty(document, 'visibilityState', {
            get: function() { return 'visible'; },
            configurable: true
        });
        Object.defineProperty(document, 'webkitHidden', {
            get: function() { return false; },
            configurable: true
        });
        Object.defineProperty(document, 'webkitVisibilityState', {
            get: function() { return 'visible'; },
            configurable: true
        });
    } catch(e) {}

    // ── 2. Swallow focus/blur/visibilitychange event listeners ───────────────
    // Intercept EventTarget.addEventListener at the prototype level so every
    // element (document, window, body, …) is covered without enumerating them.
    var _origAdd = EventTarget.prototype.addEventListener;
    var _blocked = ['visibilitychange', 'webkitvisibilitychange',
                    'blur', 'focusout', 'pagehide'];

    EventTarget.prototype.addEventListener = function(type, listener, options) {
        if (_blocked.indexOf(type.toLowerCase()) !== -1) {
            // Drop the listener — never registered.
            return;
        }
        return _origAdd.call(this, type, listener, options);
    };

    // ── 3. Neutralise inline onblur / onfocus / onvisibilitychange setters ───
    // Some pages assign window.onblur = function() {...} directly.
    try {
        Object.defineProperty(window, 'onblur', {
            set: function() {},
            get: function() { return null; },
            configurable: true
        });
        Object.defineProperty(document, 'onvisibilitychange', {
            set: function() {},
            get: function() { return null; },
            configurable: true
        });
    } catch(e) {}

    // ── 4. Freeze document.hasFocus() to always return true ──────────────────
    try {
        document.hasFocus = function() { return true; };
    } catch(e) {}

    // ── 5. Page Visibility API: suppress any already-registered handlers ──────
    // For pages that call dispatchEvent(new Event('visibilitychange')) internally,
    // intercept dispatchEvent too.
    var _origDispatch = EventTarget.prototype.dispatchEvent;
    EventTarget.prototype.dispatchEvent = function(event) {
        if (_blocked.indexOf(event.type.toLowerCase()) !== -1) {
            return true; // pretend the event was dispatched with no listeners cancelling
        }
        return _origDispatch.call(this, event);
    };

})();
""".trimIndent().replace("\"", "\\\"").replace("\n", "\\n")

@Suppress("unused")
val suppressWebViewEventsPatch = bytecodePatch(
    name = "Suppress WebView Exam Events",
    description = "Injects a JavaScript monkeypatch into the exam WebView on every page load " +
            "that freezes the Page Visibility API (document.hidden, document.visibilityState, " +
            "document.hasFocus) and silently drops blur/visibilitychange/focusout event listeners. " +
            "This prevents the web-side exam platform from detecting when the browser loses focus " +
            "or is backgrounded.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        // Inject into onPageStarted of the WebViewClient (q0.p).
        //
        // Register layout:
        //   p0 = this (q0.p)
        //   p1 = WebView
        //   p2 = String url
        //   p3 = Bitmap favicon (may be null)
        //
        // We call p1.evaluateJavascript(script, null) as the very first
        // instruction — before the existing body runs — so our script lands
        // on the page before any <script> tags or DOMContentLoaded handlers.
        //
        // Smali note: evaluateJavascript needs .locals >= 2 in the patched
        // method (v0 for the script string, v1 for null callback).
        // The original method declares .locals 3, so we have headroom.
        OnPageStartedFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "$EVENT_SUPPRESSION_SCRIPT"
                const/4 v1, 0x0
                invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
            """
        )
    }
}
