package semicoloncolonel.mobilestream.extension.yahoonews;

import android.net.Uri;
import android.webkit.WebView;

/**
 * Yahoo News shows most articles as Yahoo web pages in a WebView. Each ad
 * slot on those pages shows an "Advertisement" placeholder until the ad
 * loads, and slots in the article body sit in a wrapper that also holds an
 * "Advertisement" label. Yahoo serves more than one version of the page, and
 * the class names differ between them, so the slots are found by what they
 * hold rather than by their classes.
 *
 * A page can start before its document exists, and it finishes only when
 * every ad frame has loaded, which can take several seconds. So the script
 * also runs at a few times during the first seconds; once it is running on a
 * page, running it again only checks the page once more.
 */
@SuppressWarnings("unused")
public final class ArticleAds {
    // Hides every ad slot: each element with the class ad-container, each
    // Google ad frame, and each "Advertisement" label or placeholder, together
    // with the largest wrapper around it that holds nothing else. A wrapper
    // with text, a heading, a list, or a picture is never hidden, so the
    // article stays whatever the page layout. It runs again whenever the page
    // changes, since slots are added as the page loads.
    private static final String SCRIPT = "(function(){\n"
            + "if (window.__morpheHideAds) { window.__morpheHideAds(); return; }\n"
            + "var STYLE_ID = 'morphe-hide-ads';\n"
            + "var CSS = '.ad-container,[data-morphe-ad]{display:none!important}';\n"
            + "var CONTENT = 'p,h1,h2,h3,h4,h5,h6,article,main,figure,img,picture,video,ul,ol,table,blockquote';\n"
            + "var LABEL = /^\\s*advertisement\\s*$/i;\n"
            + "function text(el) {\n"
            + "  var out = '';\n"
            + "  var walker = document.createTreeWalker(el, NodeFilter.SHOW_TEXT, {\n"
            + "    acceptNode: function(n) {\n"
            + "      for (var a = n.parentNode; a && a !== el; a = a.parentNode) {\n"
            + "        if (/^(STYLE|SCRIPT|NOSCRIPT)$/.test(a.nodeName)) return NodeFilter.FILTER_REJECT;\n"
            + "      }\n"
            + "      return NodeFilter.FILTER_ACCEPT;\n"
            + "    }\n"
            + "  });\n"
            + "  while (walker.nextNode()) out += walker.currentNode.nodeValue;\n"
            + "  return out;\n"
            + "}\n"
            + "function onlyAd(el) {\n"
            + "  return text(el).replace(/advertisement/gi, '').trim() === '' && !el.querySelector(CONTENT);\n"
            + "}\n"
            + "function hide(el) {\n"
            + "  var top = el;\n"
            + "  for (var p = el.parentElement; p && p !== document.body && p !== document.documentElement; p = p.parentElement) {\n"
            + "    if (!onlyAd(p)) break;\n"
            + "    top = p;\n"
            + "  }\n"
            + "  if (!top.hasAttribute('data-morphe-ad')) top.setAttribute('data-morphe-ad', '');\n"
            + "}\n"
            + "function sweep() {\n"
            + "  var root = document.documentElement;\n"
            + "  if (!root) return;\n"
            + "  if (!document.getElementById(STYLE_ID)) {\n"
            + "    var s = document.createElement('style');\n"
            + "    s.id = STYLE_ID;\n"
            + "    s.textContent = CSS;\n"
            + "    (document.head || root).appendChild(s);\n"
            + "  }\n"
            + "  if (!document.body) return;\n"
            + "  var found = document.body.querySelectorAll('.ad-container,[id^=\"google_ads_iframe\"],[data-google-query-id]');\n"
            + "  for (var i = 0; i < found.length; i++) hide(found[i]);\n"
            + "  var all = document.body.getElementsByTagName('div');\n"
            + "  for (var j = 0; j < all.length; j++) {\n"
            + "    var d = all[j];\n"
            + "    if (d.childElementCount === 0 && LABEL.test(d.textContent)) hide(d);\n"
            + "  }\n"
            + "}\n"
            + "var pending = false;\n"
            + "function schedule() {\n"
            + "  if (pending) return;\n"
            + "  pending = true;\n"
            + "  setTimeout(function(){ pending = false; sweep(); }, 50);\n"
            + "}\n"
            + "window.__morpheHideAds = sweep;\n"
            + "sweep();\n"
            + "new MutationObserver(schedule).observe(document.documentElement || document, {childList: true, subtree: true});\n"
            + "})();\n";

    private static final long[] RETRY_DELAYS_MS = {150, 400, 800, 1500, 3000};

    private ArticleAds() {
    }

    /** Called when a page starts and when it finishes loading. */
    public static void hide(WebView view, String url) {
        try {
            if (view == null) return;
            if (!isYahoo(url)) return;
            inject(view);
            for (long delay : RETRY_DELAYS_MS) {
                view.postDelayed(() -> inject(view), delay);
            }
        } catch (Throwable ignored) {
            // Leave the page as it is.
        }
    }

    private static boolean isYahoo(String url) {
        if (url == null) return false;
        String host = Uri.parse(url).getHost();
        return host != null && (host.equals("yahoo.com") || host.endsWith(".yahoo.com"));
    }

    private static void inject(WebView view) {
        try {
            // The WebView may have moved on to another page by now.
            if (!isYahoo(view.getUrl())) return;
            view.evaluateJavascript(SCRIPT, null);
        } catch (Throwable ignored) {
            // Leave the page as it is.
        }
    }
}
