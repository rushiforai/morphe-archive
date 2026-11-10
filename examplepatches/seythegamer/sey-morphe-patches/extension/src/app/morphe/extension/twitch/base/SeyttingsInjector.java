package app.morphe.extension.twitch.base;

import android.webkit.WebView;

/**
 * Injects the SEYTTINGS row into the Twitch web settings page.
 *
 * <p>Twitch TV renders its whole UI in a WebView. The settings screen is a
 * virtualised React list, so a plain injected DOM node would not be reachable
 * with the remote. Instead the existing "Cookies and Advertising Choices" row
 * is turned into the SEYTTINGS row and its click is routed to the native
 * dialog through {@link SeyttingsBridge}.</p>
 */
public final class SeyttingsInjector {

    private static final String BRIDGE_NAME = "seyttingsNative";

    private static final String GEAR_PATH =
            "M19.14 12.94c.04-.3.06-.61.06-.94 0-.32-.02-.64-.07-.94l2.03-1.58c.18-.14.23-.41.12-.61"
            + "l-1.92-3.32c-.12-.22-.37-.29-.59-.22l-2.39.96c-.5-.38-1.03-.7-1.62-.94l-.36-2.54c-.04-.24"
            + "-.24-.41-.48-.41h-3.84c-.24 0-.43.17-.47.41l-.36 2.54c-.59.24-1.13.57-1.62.94l-2.39-.96c"
            + "-.22-.08-.47 0-.59.22L2.74 8.87c-.12.21-.08.47.12.61l2.03 1.58c-.05.3-.09.63-.09.94s.02.64"
            + ".07.94l-2.03 1.58c-.18.14-.23.41-.12.61l1.92 3.32c.12.22.37.29.59.22l2.39-.96c.5.38 1.03.7"
            + " 1.62.94l.36 2.54c.05.24.24.41.48.41h3.84c.24 0 .44-.17.47-.41l.36-2.54c.59-.24 1.13-.56 1.62"
            + "-.94l2.39.96c.22.08.47 0 .59-.22l1.92-3.32c.12-.22.07-.47-.12-.61l-2.01-1.58zM12 15.6"
            + "c-1.98 0-3.6-1.62-3.6-3.6s1.62-3.6 3.6-3.6 3.6 1.62 3.6 3.6-1.62 3.6-3.6 3.6z";

    private static final String SCRIPT = String.join("\n",
            "(function () {",
            "  if (window.__seyttingsBooted) {",
            "    try { window.__seyttingsPatch(); } catch (e) {}",
            "    return;",
            "  }",
            "  window.__seyttingsBooted = true;",
            "  var GEAR = '" + GEAR_PATH + "';",
            "  var TITLE = 'SEYTTINGS';",
            "  var SUB = 'Open the patched tweaks menu';",
            "  function findRow() {",
            "    var row = document.querySelector('a[href*=\"cookie-preferences\"]');",
            "    if (row) return row;",
            "    var links = document.querySelectorAll('a');",
            "    for (var i = 0; i < links.length; i++) {",
            "      if ((links[i].textContent || '').indexOf('Cookies and Advertising') !== -1) return links[i];",
            "    }",
            "    return null;",
            "  }",
            "  function patch() {",
            "    try {",
            "      if (location.pathname !== '/settings') return;",
            "      var row = findRow();",
            "      if (!row) return;",
            "      if (row.getAttribute('aria-label') !== TITLE) row.setAttribute('aria-label', TITLE);",
            "      if (row.getAttribute('href') !== '#') row.setAttribute('href', '#');",
            "      var title = row.querySelector('h2');",
            "      if (title && title.textContent !== TITLE) title.textContent = TITLE;",
            "      var text = row.querySelector('p');",
            "      if (text && text.textContent !== SUB) text.textContent = SUB;",
            "      var svgs = row.querySelectorAll('svg');",
            "      for (var s = 0; s < svgs.length; s++) {",
            "        var svg = svgs[s];",
            "        svg.setAttribute('viewBox', '0 0 24 24');",
            "        var paths = svg.querySelectorAll('path');",
            "        for (var q = 0; q < paths.length; q++) {",
            "          var path = paths[q];",
            "          path.setAttribute('d', GEAR);",
            "          path.setAttribute('fill-rule', 'evenodd');",
            "          path.setAttribute('clip-rule', 'evenodd');",
            "          path.style.fill = '#E53935';",
            "        }",
            "      }",
            "      if (row.getAttribute('data-seyclick') !== '1') {",
            "        row.setAttribute('data-seyclick', '1');",
            "        row.addEventListener('click', function (event) {",
            "          event.preventDefault();",
            "          event.stopPropagation();",
            "          try {",
            "            if (window.seyttingsNative && window.seyttingsNative.open) {",
            "              window.seyttingsNative.open();",
            "            }",
            "          } catch (e) {}",
            "        }, true);",
            "      }",
            "    } catch (e) {}",
            "  }",
            "  window.__seyttingsPatch = patch;",
            "  window.setInterval(patch, 400);",
            "  window.addEventListener('popstate', patch);",
            "  patch();",
            "})();");

    private SeyttingsInjector() {
    }

    /** Called from the WebView client constructor before the first page load. */
    public static void attach(WebView webView) {
        if (webView == null) {
            return;
        }
        try {
            webView.addJavascriptInterface(new SeyttingsBridge(webView.getContext()), BRIDGE_NAME);
        } catch (Throwable ignored) {
            // Never let the injected helper break page loading.
        }
    }

    /** Called from WebViewClient.onPageFinished for every loaded page. */
    public static void inject(WebView webView) {
        if (webView == null) {
            return;
        }
        try {
            webView.evaluateJavascript(SCRIPT, null);
        } catch (Throwable ignored) {
            // Never let the injected helper break page loading.
        }
    }
}
