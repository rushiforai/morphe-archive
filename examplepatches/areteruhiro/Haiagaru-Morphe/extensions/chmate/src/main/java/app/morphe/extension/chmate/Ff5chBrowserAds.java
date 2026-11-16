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
        +"style.textContent='.inlineAd,.adsbygoogle,[id^=adstir],[id^=aswift_],"
        +"iframe[src*=\"ad-stir.com\"],iframe[src*=\"googlesyndication.com\"]{display:none!important}';"
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
        if(request==null||request.isForMainFrame()||!Boolean.TRUE.equals(SEARCH_PAGES.get(view))
                ||!Ff5chAdRules.adResource(request.getUrl().toString()))return null;
        return new WebResourceResponse("text/plain","UTF-8",204,"No Content",
            Collections.emptyMap(),new ByteArrayInputStream(new byte[0]));
    }
    private Ff5chBrowserAds(){}
}
