package dev.brave.extension.tools;

import dev.brave.extension.core.JsInjectionHub;

public final class ForceCopyPasteJs {
    private static volatile boolean sRegistered = false;

    private ForceCopyPasteJs() {}

    /**
     * Registers Force Copy/Paste into JsInjectionHub so it runs automatically on committed pages
     * whenever the Force Copy/Paste Morphe patch is enabled.
     */
    public static void ensureRegistered() {
        if (sRegistered) return;
        synchronized (ForceCopyPasteJs.class) {
            if (!sRegistered) {
                JsInjectionHub.registerScript(
                        "force_copy_paste",
                        JsInjectionHub.InjectionTiming.ON_NAVIGATION_FINISH,
                        getEnableJs()
                );
                sRegistered = true;
            }
        }
    }

    /**
     * Best-effort unblocking of text selection, copy, cut, paste, and context menus:
     * - Injects user-select: text CSS rule
     * - Registers window capture-phase stopImmediatePropagation() handler
     * - Strips inline on* properties and attributes on window, document, body, and event targets
     * Note: Because injection runs at navigation finish, capture listeners already registered
     * directly on window before injection cannot be retroactively removed.
     */
    public static String getEnableJs() {
        return "(() => {"
                + "  const styleId = '_brave_force_copypaste_style';"
                + "  let st = document.getElementById(styleId);"
                + "  if (!st) {"
                + "    st = document.createElement('style');"
                + "    st.id = styleId;"
                + "    st.textContent = '* { -webkit-user-select: text !important; -moz-user-select: text !important; user-select: text !important; -webkit-touch-callout: default !important; }';"
                + "    (document.head || document.documentElement).appendChild(st);"
                + "  }"
                + "  const events = ['copy', 'cut', 'paste', 'selectstart', 'contextmenu', 'dragstart'];"
                + "  function clearInline(el) {"
                + "    if (!el) return;"
                + "    for (let i = 0; i < events.length; i++) {"
                + "      const prop = 'on' + events[i];"
                + "      try { if (el[prop]) el[prop] = null; } catch (e) {}"
                + "      try { if (el.removeAttribute) el.removeAttribute(prop); } catch (e) {}"
                + "    }"
                + "  }"
                + "  if (!window._brave_unblock_handler) {"
                + "    window._brave_unblock_handler = function(e) {"
                + "      clearInline(e.target);"
                + "      e.stopImmediatePropagation();"
                + "    };"
                + "    events.forEach(evt => {"
                + "      window.addEventListener(evt, window._brave_unblock_handler, true);"
                + "    });"
                + "  }"
                + "  clearInline(window);"
                + "  clearInline(document);"
                + "  clearInline(document.documentElement);"
                + "  clearInline(document.body);"
                + "})();";
    }
}
