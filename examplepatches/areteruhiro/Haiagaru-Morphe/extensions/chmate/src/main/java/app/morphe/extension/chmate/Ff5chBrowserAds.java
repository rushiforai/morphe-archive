package app.morphe.extension.chmate;

import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import java.io.ByteArrayInputStream;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/** Limit filtering to ff5ch documents in ChMate's own browser. */
public final class Ff5chBrowserAds {
    private static final Map<WebView,Boolean> SEARCH_PAGES=Collections.synchronizedMap(new WeakHashMap<>());
    private static final String CSS="(function(){if(location.hostname!=='ff5ch.syoboi.jp'||"
        +"document.getElementById('haiagaru-ff5ch-ads'))return;"
        +"var style=document.createElement('style');style.id='haiagaru-ff5ch-ads';"
        +"style.textContent='#ad_5ch_inline,#ad_5ch_header,[id^=ad_5ch_],.inlineAd,.adsbygoogle,[id^=adstir],[id^=aswift_],"
        +"iframe[src*=\"ad-stir.com\"],iframe[src*=\"googlesyndication.com\"],iframe[src*=\"doubleclick.net\"]"
        +"{display:none!important;visibility:hidden!important;height:0!important;min-height:0!important;margin:0!important;padding:0!important}';"
        +"(document.head||document.documentElement).appendChild(style);})()";
    public static void started(WebView view,String url){
        if(view==null)return;
        if(Ff5chAdRules.searchPage(url))SEARCH_PAGES.put(view,true);else SEARCH_PAGES.remove(view);
    }
    public static void finished(WebView view,String url){
        if(view!=null&&Boolean.TRUE.equals(SEARCH_PAGES.get(view))&&Ff5chAdRules.searchPage(url))
            view.evaluateJavascript(CSS,null);
    }
    public static WebResourceResponse intercept(WebView view,WebResourceRequest request){
        if(view==null||request==null)return null;
        if(request.isForMainFrame()){
            // This callback can precede the UI-thread onPageStarted callback.
            // Seed the document scope before its first ad requests arrive.
            started(view,request.getUrl().toString());return null;
        }
        return interceptLegacy(view,request.getUrl().toString());
    }
    public static WebResourceResponse interceptLegacy(WebView view,String url){
        if(view==null||!Boolean.TRUE.equals(SEARCH_PAGES.get(view))||!Ff5chAdRules.adResource(url))return null;
        return new WebResourceResponse("text/plain","UTF-8",204,"No Content",
            Collections.emptyMap(),new ByteArrayInputStream(new byte[0]));
    }
    private Ff5chBrowserAds(){}
}
