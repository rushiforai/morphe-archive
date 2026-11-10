package app.morphe.extension.twitch.expandchat;

import android.util.Log;
import android.webkit.WebView;

import java.lang.ref.WeakReference;

/**
 * Injects the EXPAND CHAT helper into the Twitch TV web app.
 *
 * <p>Twitch TV renders chat in the remote Next.js page. The chat panel ends
 * with a full-width "Join the conversation" button. The helper finds that
 * footer without relying on its localized text, hides it, and lets the
 * flex-grow message list use the freed height.</p>
 *
 * <p>One preference ({@link ExpandChatPrefs}) controls the feature. The
 * native SEYTTINGS dialog and the script stay in sync through
 * {@link SeyttingsExpandChatBridge}.</p>
 */
public final class ExpandChatInjector {

    private static final String BRIDGE_NAME = "seyttingsChatExpand";

    private static final String TAG = SeyttingsExpandChatBridge.TAG;

    private static WeakReference<WebView> currentWebView;

    private ExpandChatInjector() {
    }

    /** Called from the WebView client constructor before the first page load. */
    public static void attach(WebView webView) {
        if (webView == null) {
            return;
        }
        currentWebView = new WeakReference<>(webView);
        ExpandChatPrefs.init(webView.getContext());
        try {
            webView.addJavascriptInterface(new SeyttingsExpandChatBridge(), BRIDGE_NAME);
            Log.i(TAG, "bridge attached, enabled=" + ExpandChatPrefs.isEnabled());
        } catch (Throwable ignored) {
            // Never let the injected helper break page loading.
        }
    }

    /** Called from WebViewClient.onPageFinished for every loaded page. */
    public static void inject(WebView webView) {
        if (webView == null) {
            return;
        }
        currentWebView = new WeakReference<>(webView);
        Log.i(TAG, "injecting expand chat script into " + webView.getUrl());
        evaluate(webView, SCRIPT);
    }

    /** Applies a toggle change immediately without reloading the page. */
    public static void setEnabled(final boolean enabled) {
        evaluateOnCurrent("window.__seyttingsExpandChatSetEnabled("
                + (enabled ? "true" : "false") + ");");
    }

    private static void evaluateOnCurrent(final String script) {
        WebView webView = currentWebView == null ? null : currentWebView.get();
        if (webView == null) {
            return;
        }
        webView.post(new Runnable() {
            @Override
            public void run() {
                WebView target = currentWebView == null ? null : currentWebView.get();
                if (target != null) {
                    evaluate(target, script);
                }
            }
        });
    }

    private static void evaluate(WebView webView, String script) {
        try {
            webView.evaluateJavascript(script, null);
        } catch (Throwable ignored) {
            // Never let the injected helper break page loading.
        }
    }

    private static final String SCRIPT = String.join("\n",
            "(function () {",
            "  if (window.__seyttingsExpandChat) {",
            "    try { window.__seyttingsExpandChat.apply(); } catch (e) {}",
            "    return;",
            "  }",
            "",
            "  var state = {enabled: true, hidden: 0};",
            "",
            "  try {",
            "    if (window.seyttingsChatExpand && window.seyttingsChatExpand.isEnabled) {",
            "      state.enabled = !!window.seyttingsChatExpand.isEnabled();",
            "    }",
            "  } catch (e) {}",
            "",
            "  function report(message) {",
            "    try {",
            "      if (window.seyttingsChatExpand && window.seyttingsChatExpand.report) {",
            "        window.seyttingsChatExpand.report(String(message));",
            "      }",
            "    } catch (e) {}",
            "  }",
            "",
            "  function injectStyle() {",
            "    if (document.getElementById('seyttings-expand-chat-style')) return;",
            "    var style = document.createElement('style');",
            "    style.id = 'seyttings-expand-chat-style';",
            "    style.textContent = '[data-sey-expand-chat=\"hidden\"]{display:none!important}';",
            "    (document.head || document.documentElement).appendChild(style);",
            "  }",
            "",
            "  function isChatAside(aside) {",
            "    if (!aside) return false;",
            "    if (aside.querySelector('div[dir=\"auto\"]')) return true;",
            "    return !!aside.querySelector('[data-a-target=\"tw-core-button-label-text\"]');",
            "  }",
            "",
            "  function growingSibling(parent, exclude) {",
            "    for (var i = 0; i < parent.children.length; i++) {",
            "      var child = parent.children[i];",
            "      if (child === exclude) continue;",
            "      try {",
            "        if (parseFloat(window.getComputedStyle(child).flexGrow) > 0) return true;",
            "      } catch (e) {}",
            "    }",
            "    return false;",
            "  }",
            "",
            "  function footerContainer(button, aside) {",
            "    var node = button;",
            "    for (var depth = 0; depth < 4; depth++) {",
            "      if (!node || node === aside) return null;",
            "      var parent = node.parentElement;",
            "      if (!parent || parent === aside) return null;",
            "      if (parent.lastElementChild === node && parent.children.length >= 2",
            "          && growingSibling(parent, node)) {",
            "        return node;",
            "      }",
            "      node = parent;",
            "    }",
            "    return null;",
            "  }",
            "",
            "  function collect() {",
            "    var result = [];",
            "    var asides = document.querySelectorAll('aside');",
            "    for (var i = 0; i < asides.length; i++) {",
            "      var aside = asides[i];",
            "      if (!isChatAside(aside)) continue;",
            "      var buttons = aside.querySelectorAll('button');",
            "      for (var j = 0; j < buttons.length; j++) {",
            "        var button = buttons[j];",
            "        var label = button.querySelector('[data-a-target=\"tw-core-button-label-text\"]');",
            "        if (!label) continue;",
            "        if (!(label.textContent || '').replace(/\\s+/g, ' ').trim()) continue;",
            "        var container = footerContainer(button, aside);",
            "        if (container && result.indexOf(container) === -1) result.push(container);",
            "      }",
            "    }",
            "    return result;",
            "  }",
            "",
            "  function restoreAll() {",
            "    var marked = document.querySelectorAll('[data-sey-expand-chat=\"hidden\"]');",
            "    for (var i = 0; i < marked.length; i++) {",
            "      marked[i].removeAttribute('data-sey-expand-chat');",
            "    }",
            "  }",
            "",
            "  function apply() {",
            "    injectStyle();",
            "    if (!state.enabled) {",
            "      restoreAll();",
            "      state.hidden = 0;",
            "      return;",
            "    }",
            "    var footers = collect();",
            "    var changed = false;",
            "    for (var i = 0; i < footers.length; i++) {",
            "      if (footers[i].getAttribute('data-sey-expand-chat') !== 'hidden') {",
            "        footers[i].setAttribute('data-sey-expand-chat', 'hidden');",
            "        changed = true;",
            "      }",
            "    }",
            "    var marked = document.querySelectorAll('[data-sey-expand-chat=\"hidden\"]');",
            "    for (var j = 0; j < marked.length; j++) {",
            "      if (footers.indexOf(marked[j]) === -1) {",
            "        marked[j].removeAttribute('data-sey-expand-chat');",
            "        changed = true;",
            "      }",
            "    }",
            "    state.hidden = footers.length;",
            "    if (changed) report('footer hidden=' + footers.length);",
            "  }",
            "",
            "  function setEnabled(on) {",
            "    state.enabled = !!on;",
            "    report('toggle ' + state.enabled);",
            "    apply();",
            "  }",
            "",
            "  window.__seyttingsExpandChat = {",
            "    apply: apply,",
            "    setEnabled: setEnabled,",
            "    state: state",
            "  };",
            "  window.__seyttingsExpandChatSetEnabled = setEnabled;",
            "",
            "  injectStyle();",
            "  report('boot enabled=' + state.enabled);",
            "  apply();",
            "  window.setInterval(apply, 900);",
            "  window.addEventListener('popstate', apply);",
            "})();");
}
