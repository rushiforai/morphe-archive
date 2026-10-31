package app.template.extension.extension;
import android.webkit.WebView;
import java.io.*;
import java.net.*;
/** Dark-mode-only helper; adapted from community Amazon patch (GPL-3.0). */
public final class AmazonHelper {
private static final long CACHE_TTL_MS=6*60*60*1000L;
    private static String fetchText(String urlStr) {
        try {
            HttpURLConnection c = (HttpURLConnection) new URL(urlStr).openConnection();
            c.setConnectTimeout(5000); c.setReadTimeout(8000);
            c.setRequestProperty("User-Agent", "AmazonHelper/1.0");
            if (c.getResponseCode() != 200) return null;
            BufferedReader r = new BufferedReader(new InputStreamReader(c.getInputStream()));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = r.readLine()) != null) sb.append(line).append("\n");
            r.close(); c.disconnect();
            return sb.toString();
        } catch (Exception e) { return null; }
    }

    private static final String DARK_MODE_JS_URL =
        "https://raw.githubusercontent.com/hxreborn/amznkiller/main/app/src/main/resources/payload/js/dark_mode.js";

    private static volatile String cachedDarkJs = null;
    private static volatile long lastDarkFetch = 0;

    /** Embedded fallback — mirrors amznkiller dark_mode.js (GPL-3.0, hxreborn) */
    private static final String EMBEDDED_DARK_FIX_CSS =
        "[class*=image-container] img{mix-blend-mode:normal!important}"
        + "img[style*=\"mix-blend-mode\"]{mix-blend-mode:normal!important}"
        + "[class*=asin-metadata]{mix-blend-mode:normal!important}"
        + "html{background-color:#1a1a1a!important}"
        + "body{background-color:#1a1a1a!important}"
        + "[class*=asin-container],[class*=asin-image-wrapper]{background-color:white!important}"
        + "[class*=badgeMessage]{background-color:transparent!important}"
        + ".a-button-primary,.a-button-oneclick{color-scheme:only light!important}";

    private static String getDarkModeJs() {
        long now = System.currentTimeMillis();
        if (cachedDarkJs != null && (now - lastDarkFetch) < CACHE_TTL_MS) return cachedDarkJs;
        String remote = fetchText(DARK_MODE_JS_URL);
        if (remote != null && remote.length() > 100) {
            cachedDarkJs = remote; lastDarkFetch = now;
        } else if (cachedDarkJs == null) {
            cachedDarkJs = "(function(){if(!window.AmznKiller)window.AmznKiller={};"
                + "if(window.AmznKiller.setDarkMode)return;"
                + "var CSS='" + EMBEDDED_DARK_FIX_CSS.replace("'", "\\'") + "';"
                + "window.AmznKiller.setDarkMode=function(a){"
                + "var e=!!a&&a.enabled;var s=document.getElementById('amznkiller-dark');"
                + "if(e){if(!s){s=document.createElement('style');s.id='amznkiller-dark';"
                + "(document.head||document.documentElement).appendChild(s);}s.textContent=CSS;}"
                + "else{if(s)s.remove();}return null;};})();";
            lastDarkFetch = now;
        }
        return cachedDarkJs;
    }

    private static boolean isDarkEnabled(String mode) {
        if ("on".equals(mode)) return true;
        if ("follow_system".equals(mode)) {
            try {
                android.app.Application app = currentApp();
                if (app == null) return false;
                int uiMode = app.getResources().getConfiguration().uiMode;
                return (uiMode & android.content.res.Configuration.UI_MODE_NIGHT_MASK)
                    == android.content.res.Configuration.UI_MODE_NIGHT_YES;
            } catch (Exception e) { return false; }
        }
        return false;
    }

    private static android.app.Application currentApp() {
        try {
            return (android.app.Application) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication").invoke(null);
        } catch (Exception e) { return null; }
    }

    public static void injectDarkMode(final WebView webView, final String mode) {
        if (webView == null || !isDarkEnabled(mode)) return;
        new Thread(new Runnable() {
            @Override public void run() {
                final String js = getDarkModeJs();
                webView.post(new Runnable() {
                    @Override public void run() {
                        webView.evaluateJavascript(js
                            + "\nwindow.AmznKiller.setDarkMode({enabled:true});", null);
                    }
                });
            }
        }).start();
    }

    public static void tintTabIconIfDark(android.widget.ImageView icon, String mode) {
        if (icon == null || !isDarkEnabled(mode)) return;
        icon.setColorFilter(
            android.graphics.Color.WHITE,
            android.graphics.PorterDuff.Mode.SRC_IN
        );
    }
}
