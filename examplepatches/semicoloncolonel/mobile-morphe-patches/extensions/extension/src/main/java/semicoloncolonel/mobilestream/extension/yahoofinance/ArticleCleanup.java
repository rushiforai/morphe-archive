package semicoloncolonel.mobilestream.extension.yahoofinance;

import android.webkit.WebView;

/**
 * Yahoo Finance: article pages are finance.yahoo.com pages in a WebView. The
 * patches call these methods when a page finishes loading, and each adds a
 * small script to it. Each script runs once per page and keeps working as the
 * page changes. Pages on other sites are left alone.
 */
@SuppressWarnings("unused")
public final class ArticleCleanup {
    private ArticleCleanup() {
    }

    /**
     * "Skip ads": hides the page's ad slots and the space they keep: Yahoo's
     * display slots (sda-*), the native and Taboola slots, and every element
     * Yahoo marks as an ad container.
     */
    private static final String HIDE_ADS = "(function(){if(window.__mspAds)return;window.__mspAds=1;"
            + "var s=document.createElement('style');"
            + "s.textContent='[data-testid=\"ad-container\"],.sdaContainer,.native-ad,[id^=\"sda-\"],[id^=\"ntv-\"],"
            + "[id^=\"taboola-\"],[data-ad-placement],[data-ad-unit],[data-ad-region]{display:none!important;"
            + "height:0!important;min-height:0!important;margin:0!important;padding:0!important}';"
            + "(document.head||document.documentElement).appendChild(s);})();";

    /**
     * "Hide Plus upsells": hides the "Trade on Coinbase" referral link and the
     * trading disclosure next to it.
     */
    private static final String HIDE_REFERRALS = "(function(){if(window.__mspRef)return;window.__mspRef=1;"
            + "function sweep(){document.querySelectorAll('a[href*=\"coinbase.com\"]').forEach(function(a){"
            + "var e=a.parentElement;for(var i=0;e&&i<3;i++,e=e.parentElement){"
            + "if(/disclosure/i.test(e.textContent||'')){e.style.setProperty('display','none','important');return;}}"
            + "a.style.setProperty('display','none','important');});}"
            + "sweep();new MutationObserver(sweep).observe(document.documentElement,{childList:true,subtree:true});})();";

    public static void hideAds(WebView view, String url) {
        run(view, url, HIDE_ADS);
    }

    public static void hideReferrals(WebView view, String url) {
        run(view, url, HIDE_REFERRALS);
    }

    private static void run(WebView view, String url, String script) {
        try {
            if (view == null || url == null) return;
            String host = android.net.Uri.parse(url).getHost();
            if (host == null || !(host.equals("yahoo.com") || host.endsWith(".yahoo.com"))) return;
            view.evaluateJavascript(script, null);
        } catch (Throwable ignored) {
        }
    }
}
