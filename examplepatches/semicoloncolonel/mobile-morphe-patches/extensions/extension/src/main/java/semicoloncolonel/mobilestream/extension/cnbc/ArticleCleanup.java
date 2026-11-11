package semicoloncolonel.mobilestream.extension.cnbc;

import android.webkit.WebView;

/**
 * CNBC articles are cnbc.com pages in a WebView. The patches call these
 * methods when a page finishes loading, and each adds a small script to it.
 * Each script runs once per page and keeps working as the page changes.
 */
@SuppressWarnings("unused")
public final class ArticleCleanup {
    private ArticleCleanup() {
    }

    /** "Skip ads": hides the page's ad slots, such as the banner above the headline. */
    private static final String HIDE_ADS = "(function(){if(window.__mspAds)return;window.__mspAds=1;"
            + "var s=document.createElement('style');"
            + "s.textContent='[id^=\"dart_wrapper\"],[id*=\"AdTopBanner\"],[class*=\"AdWrapper\"],"
            + "[class*=\"BoxInline\"],[class*=\"InlineAd\"],[data-module=\"ad\"]{display:none!important}';"
            + "(document.head||document.documentElement).appendChild(s);})();";

    /**
     * "Hide newsletter pop-ups": hides each box pinned to the screen that asks
     * for an email address, such as the "CNBC Spotlight Newsletter" bar.
     */
    private static final String HIDE_NEWSLETTERS = "(function(){if(window.__mspMail)return;window.__mspMail=1;"
            + "function sweep(){document.querySelectorAll('input[type=email],input[name*=mail i]').forEach(function(i){"
            + "for(var e=i;e&&e!==document.body;e=e.parentElement){var p=getComputedStyle(e).position;"
            + "if(p==='fixed'||p==='sticky'){e.style.setProperty('display','none','important');return;}}});}"
            + "sweep();new MutationObserver(sweep).observe(document.documentElement,{childList:true,subtree:true});})();";

    public static void hideAds(WebView view) {
        run(view, HIDE_ADS);
    }

    public static void hideNewsletters(WebView view) {
        run(view, HIDE_NEWSLETTERS);
    }

    private static void run(WebView view, String script) {
        try {
            if (view != null) view.evaluateJavascript(script, null);
        } catch (Throwable ignored) {
        }
    }
}
