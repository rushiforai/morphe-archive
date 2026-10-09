package app.aidan.extension.sidelineswap;

import android.graphics.Color;
import android.os.Build;
import android.webkit.WebSettings;
import android.webkit.WebView;
import java.lang.reflect.Method;

public final class DarkWebViewBridge {
    private DarkWebViewBridge() {
    }

    public static void applyDarkMode(WebView webView) {
        if (webView == null) {
            return;
        }

        try {
            webView.setBackgroundColor(Color.BLACK);
            WebSettings settings = webView.getSettings();
            if (settings == null) {
                return;
            }

            // Android 10+ (API 29+): FORCE_DARK_ON = 2
            if (Build.VERSION.SDK_INT >= 29) {
                try {
                    Method setForceDarkMethod = settings.getClass().getMethod("setForceDark", int.class);
                    setForceDarkMethod.invoke(settings, 2);
                } catch (Throwable ignored) {
                }
            }

            // Android 13+ (API 33+): setAlgorithmicDarkeningAllowed(true)
            if (Build.VERSION.SDK_INT >= 33) {
                try {
                    Method setAlgorithmicDarkeningMethod = settings.getClass().getMethod("setAlgorithmicDarkeningAllowed", boolean.class);
                    setAlgorithmicDarkeningMethod.invoke(settings, true);
                } catch (Throwable ignored) {
                }
            }

            // Inject dark stylesheet so Next.js server-rendered pages conform to pure AMOLED black (#000000)
            String js = "javascript:(function() {" +
                    "var style = document.getElementById('morphe-dark-mode');" +
                    "if (!style) {" +
                    "  style = document.createElement('style');" +
                    "  style.id = 'morphe-dark-mode';" +
                    "  document.head.appendChild(style);" +
                    "}" +
                    "style.innerHTML = 'html, body, #__next, div, main, section, form, header, footer, [class*=\"container\"], [class*=\"page\"], [class*=\"wrapper\"], [class*=\"layout\"] { background: #000000 !important; background-color: #000000 !important; color: #ffffff !important; } ' +" +
                    "'h1, h2, h3, h4, h5, h6, p, span, label, strong, b, em { color: #ffffff !important; } ' +" +
                    "'input, select, textarea { background-color: #000000 !important; color: #ffffff !important; border: 1px solid #333333 !important; } ' +" +
                    "'div[class*=\"card\"], fieldset { background-color: #000000 !important; border-color: #222222 !important; }';" +
                    "})()";
            webView.evaluateJavascript(js, null);
        } catch (Throwable ignored) {
        }
    }
}
