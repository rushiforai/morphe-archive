package patches.atv;

import java.net.URI;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Policy for the inspected Mauna KIJK frontend. Content and account URLs pass through. */
public final class KijkPolicy {
    private KijkPolicy() { }

    private static boolean host(String actual, String expected) {
        return actual.equals(expected) || actual.endsWith("." + expected);
    }

    /** 0: original request; 1: empty VMAP; 2: empty JS; 3: no-content measurement response. */
    public static int action(String url, boolean ads, boolean tracking) {
        try {
            URI uri = new URI(url);
            if (!"https".equalsIgnoreCase(uri.getScheme()) || uri.getHost() == null) return 0;
            String h = uri.getHost().toLowerCase(Locale.ROOT), p = uri.getPath();
            if (ads && host(h, "fwmrm.net")) return 1;
            if (tracking) {
                if (h.equals("static.kijk.nl") && p.matches("/(prod|acc|dev)/js/tva\\.min\\.js")) return 2;
                if (host(h, "tiqcdn.com") || host(h, "tealiumiq.com")) return p.endsWith(".js") ? 2 : 3;
                if (host(h, "id5-sync.com") || host(h, "conviva.com") ||
                        host(h, "google-analytics.com") || host(h, "analytics.google.com") ||
                        host(h, "sentry.io")) return 3;
            }
        } catch (Exception ignored) { }
        return 0;
    }

    public static boolean isDocument(String url) {
        try {
            URI uri = new URI(url);
            return "https".equalsIgnoreCase(uri.getScheme()) &&
                    "prd.smarttv.talpavideo.nl".equalsIgnoreCase(uri.getHost()) &&
                    "/android/index.html".equals(uri.getPath());
        } catch (Exception ignored) { return false; }
    }

    public static boolean isPlayerScript(String url) {
        try {
            URI uri = new URI(url);
            return "https".equalsIgnoreCase(uri.getScheme()) &&
                    "prd.smarttv.talpavideo.nl".equalsIgnoreCase(uri.getHost()) &&
                    uri.getPath().matches("/android/assets/theo-player-legacy-[A-Za-z0-9_-]+\\.js");
        } catch (Exception ignored) { return false; }
    }

    public static String bootstrap(boolean ads, boolean tracking) {
        String common = ";(function(){var w=window,e=w.__env;if(!e)return;w.__morpheAtv=true;" +
                "function pin(k,v){try{Object.defineProperty(e,k,{get:function(){return v},set:function(){},configurable:false})}catch(x){e[k]=v}}" +
                // The frontend worker otherwise serves cached, unmodified scripts outside WebViewClient.
                // Streaming, DRM, account storage and unrelated workers retain their original paths.
                "try{var sw=navigator.serviceWorker;if(sw){var register=sw.register;" +
                "function owned(u){try{var a=new URL(u,'https://prd.smarttv.talpavideo.nl/android/index.html');return a.origin==='https://prd.smarttv.talpavideo.nl'&&a.pathname==='/android/sw.js'}catch(x){return false}}" +
                "sw.register=function(u,o){if(owned(u))return Promise.reject(new Error('Morphe cache interception'));return register.call(sw,u,o)};" +
                "if(sw.getRegistrations)sw.getRegistrations().then(function(rs){rs.forEach(function(r){var a=r.active||r.waiting||r.installing;if(a&&owned(a.scriptURL))r.unregister()})}).catch(function(){})}}catch(x){}";
        String ad = "pin('ADS_ENABLED',false);pin('ADS_ALLOW_SKIP',true);" +
                "if(!document.getElementById('morphe-kijk-ads')){var s=document.createElement('style');s.id='morphe-kijk-ads';" +
                "s.textContent='.pause-ad-container{display:none!important}';document.head.appendChild(s)}";
        String privacy = "pin('ID5_ENABLED',false);pin('CONVIVA_CUSTOMER_KEY','');pin('CONVIVA_DPI_DEBUG',false);" +
                "pin('GA_MEASUREMENT_ID','');pin('GA_API_SECRET','');pin('SENTRY_URL','');pin('DEBUG_PERFORMANCE',false);" +
                "try{w.localStorage.removeItem('ID5_CACHE_V1')}catch(x){}" +
                "var sink=[];sink.push=function(){return 0};" +
                "try{Object.defineProperty(w,'TVA',{get:function(){return sink},set:function(){},configurable:false})}catch(x){w.TVA=sink}" +
                "w.utag={data:{},view:function(){},link:function(){},gdpr:{setConsentValue:function(){}}};";
        return common + (ads ? ad : "") + (tracking ? privacy : "") + "})();";
    }

    /** Insert after the publisher's environment declaration and before its executable bundles. */
    public static String rewriteHtml(String html, boolean ads, boolean tracking) {
        if ((!ads && !tracking) || html.contains("__morpheAtv")) return html;
        int environment = html.indexOf("window.__env");
        if (environment < 0) return html;
        int close = html.indexOf("</script>", environment);
        if (close < 0) return html;
        return html.substring(0, close) + bootstrap(ads, tracking) + html.substring(close);
    }

    /** Disable schedule attachment in the inspected web adapter; leave its content source intact. */
    public static String rewriteScript(String url, String script, boolean ads, boolean tracking) {
        if (!ads || !isPlayerScript(url)) return script;
        Pattern guard = Pattern.compile("([A-Za-z_$][A-Za-z0-9_$]*)&&\\1\\.adConfig&&!\\1\\.adConfig\\.disableAds&&\\(");
        Matcher match = guard.matcher(script);
        if (!match.find()) return script;
        int start = match.start(), end = match.end();
        if (match.find()) return script;
        return script.substring(0, start) + "false&&(" + script.substring(end);
    }
}
