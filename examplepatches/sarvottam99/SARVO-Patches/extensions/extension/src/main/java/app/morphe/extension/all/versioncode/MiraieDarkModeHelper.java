package app.morphe.extension.all.versioncode;

import android.app.UiModeManager;
import android.content.Context;
import android.os.Build;
import android.webkit.WebSettings;
import android.webkit.WebView;

import java.lang.reflect.Method;

/** Generic dark-mode runtime helpers adapted from the Morphe patch collection. */
@SuppressWarnings({"unused", "deprecation"})
public final class MiraieDarkModeHelper {
    private static final String GENERIC_DARK_CSS =
            "html,body{background:#121212!important;color:#e8eaed!important;color-scheme:dark!important;}"
            + "body *{border-color:#303134!important;}"
            + "input,textarea,select,button{background:#1f1f1f!important;color:#e8eaed!important;border-color:#3c4043!important;}"
            + "a{color:#8ab4f8!important;}"
            + "table,thead,tbody,tr,td,th{background-color:transparent!important;color:#e8eaed!important;}"
            + "pre,code{background:#1f1f1f!important;color:#f1f3f4!important;}"
            + "dialog,[role=dialog],.modal,.popup,.popover{background:#1f1f1f!important;color:#e8eaed!important;}"
            + "img,video,canvas,svg,picture{filter:none!important;background:transparent!important;}";

    private MiraieDarkModeHelper() {}

    /** Force AppCompat and, on Android 12+, the app-specific UiModeManager mode to dark. */
    public static void forceDarkTheme(Context context) {
        try {
            Class<?> appCompatDelegate = Class.forName("androidx.appcompat.app.AppCompatDelegate");
            Method setDefaultNightMode = appCompatDelegate.getMethod("setDefaultNightMode", int.class);
            setDefaultNightMode.invoke(null, 2); // MODE_NIGHT_YES
        } catch (Throwable ignored) {
        }

        if (context == null || Build.VERSION.SDK_INT < 31) return;
        try {
            UiModeManager manager = (UiModeManager) context.getSystemService(Context.UI_MODE_SERVICE);
            if (manager != null) {
                Method setApplicationNightMode = UiModeManager.class.getMethod("setApplicationNightMode", int.class);
                setApplicationNightMode.invoke(manager, 2); // MODE_NIGHT_YES
            }
        } catch (Throwable ignored) {
        }
    }

    /** Enable platform WebView darkening and apply a small, static CSS fallback. */
    public static void enableWebViewDarkMode(final WebView webView) {
        if (webView == null) return;

        try {
            WebSettings settings = webView.getSettings();
            if (settings != null) {
                if (Build.VERSION.SDK_INT >= 29 && Build.VERSION.SDK_INT < 33) {
                    try {
                        WebSettings.class.getMethod("setForceDark", int.class).invoke(settings, 2);
                    } catch (Throwable ignored) {
                    }
                }
                if (Build.VERSION.SDK_INT >= 33) {
                    try {
                        WebSettings.class.getMethod("setAlgorithmicDarkeningAllowed", boolean.class)
                                .invoke(settings, true);
                    } catch (Throwable ignored) {
                    }
                }
            }
        } catch (Throwable ignored) {
        }

        try {
            webView.post(new Runnable() {
                @Override
                public void run() {
                    String css = GENERIC_DARK_CSS.replace("\\", "\\\\").replace("'", "\\'");
                    webView.evaluateJavascript(
                            "(function(){var id='morphe-universal-dark';var s=document.getElementById(id);"
                                    + "if(!s){s=document.createElement('style');s.id=id;"
                                    + "(document.head||document.documentElement).appendChild(s);}"
                                    + "s.textContent='" + css + "';})();",
                            null
                    );
                }
            });
        } catch (Throwable ignored) {
        }
    }

    /** Replacement helper for call sites that return a night-mode integer. */
    public static int forceNightMode(int original) {
        return 2;
    }

    /** Preserve non-night uiMode bits while forcing UI_MODE_NIGHT_YES. */
    public static int forceUiModeNightYes(int original) {
        return (original & ~0x30) | 0x20;
    }
}
