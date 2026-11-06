package semicoloncolonel.mobilestream.extension.npr;

import android.webkit.WebView;

/**
 * NPR — scripts for the npr.org pages the app opens in its own web views
 * (articles, modules, sign-in). Every one of those web views calls
 * OTWebViewClient.sendConsentToWebView on page start, page finish, and link
 * taps; the patches call into here from the top of that method.
 */
@SuppressWarnings("unused")
public final class NprWebCleanup {
    private NprWebCleanup() {
    }

    /** "Skip ads": collapse npr.org's ad slots (aside.ad-wrap, labeled "advertisement"). */
    private static final String HIDE_ADS =
            "(function(){if(document.getElementById('msp-npr-ads'))return;"
                    + "var s=document.createElement('style');s.id='msp-npr-ads';"
                    + "s.textContent='aside.ad-wrap,aside[aria-label=\"advertisement\"]{display:none!important}';"
                    + "(document.head||document.documentElement).appendChild(s);})();";

    /**
     * "Opt out of data sale &amp; sharing": hide the OneTrust banner and, once
     * OneTrust loads, choose Reject All. OneTrust saves that choice under the
     * rule for your state, so later pages do not ask again.
     */
    private static final String REJECT_COOKIES =
            "(function(){if(!document.getElementById('msp-npr-ot')){"
                    + "var s=document.createElement('style');s.id='msp-npr-ot';"
                    + "s.textContent='#onetrust-banner-sdk,.onetrust-pc-dark-filter{display:none!important}';"
                    + "(document.head||document.documentElement).appendChild(s);}"
                    + "if(window.__mspNprOt)return;window.__mspNprOt=1;"
                    + "var n=0,t=setInterval(function(){"
                    + "if(window.OneTrust&&typeof OneTrust.RejectAll==='function'){clearInterval(t);"
                    + "try{if(!(OneTrust.IsAlertBoxClosed&&OneTrust.IsAlertBoxClosed()))OneTrust.RejectAll();}catch(e){}}"
                    + "else if(++n>60)clearInterval(t);},250);})();";

    public static void hideAds(WebView view) {
        run(view, HIDE_ADS);
    }

    public static void rejectCookies(WebView view) {
        run(view, REJECT_COOKIES);
    }

    private static void run(WebView view, String script) {
        if (view == null) return;
        try {
            view.evaluateJavascript(script, null);
        } catch (Throwable ignored) {
        }
    }
}
