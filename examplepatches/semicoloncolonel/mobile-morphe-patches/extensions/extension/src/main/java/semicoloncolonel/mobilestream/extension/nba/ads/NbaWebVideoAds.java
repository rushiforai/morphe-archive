package semicoloncolonel.mobilestream.extension.nba.ads;

import android.net.Uri;
import android.util.Log;
import android.webkit.WebView;

/**
 * Removes ads from the nba.com video player that runs inside the app's web
 * views (news articles embed it from www.nba.com/watch/embed/...).
 *
 * That player builds a JSON stream request that carries the FreeWheel keys
 * "_fw_ae" and "_fw_h_user_agent". When the request also says "ads":"no", as
 * it does for VIP accounts, the server returns the stream without stitched
 * ads. The script below wraps JSON.stringify in the page and in every
 * same-origin frame so that request always says "ads":"no". Nothing is
 * blocked, so the player does not wait on a missing ad.
 */
@SuppressWarnings("unused")
public final class NbaWebVideoAds {
    private static final String TAG = "MSP-NBA-WEB-ADS";

    private static final String SCRIPT =
        "(function(){" +
        "if(window.__mspNbaAds)return;window.__mspNbaAds=1;" +
        "function patch(w){try{var J=w.JSON;if(!J||J.stringify.__msp)return;var o=J.stringify;" +
        "var f=function(v){try{if(v&&typeof v==='object'&&('_fw_ae' in v||'_fw_h_user_agent' in v)){" +
        "v=Object.assign({},v,{ads:'no'});}}catch(e){}" +
        "var a=Array.prototype.slice.call(arguments);a[0]=v;return o.apply(this,a);};" +
        "f.__msp=1;J.stringify=f;}catch(e){}}" +
        "function scan(w){patch(w);try{for(var i=0;i<w.frames.length;i++)scan(w.frames[i]);}catch(e){}}" +
        "scan(window);setInterval(function(){scan(window);},250);" +
        "})();";

    private NbaWebVideoAds() {
    }

    /** Called from the app's WebViewClient page callbacks. */
    public static void inject(WebView view, String url) {
        try {
            if (view == null || url == null) return;
            String host = Uri.parse(url).getHost();
            if (host == null || !(host.equals("nba.com") || host.endsWith(".nba.com"))) return;
            view.evaluateJavascript(SCRIPT, null);
        } catch (Throwable t) {
            Log.w(TAG, "inject failed", t);
        }
    }
}
