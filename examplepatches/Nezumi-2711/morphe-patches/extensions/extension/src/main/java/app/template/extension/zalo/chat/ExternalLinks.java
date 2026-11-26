package app.template.extension.zalo.chat;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import java.lang.reflect.Method;
import java.util.Locale;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.shared.ZaloEnv;

/**
 * Applies Zalo's own "Chọn cách mở link" choice (Settings > Privacy) to every link surface.
 * Only active when the user picked "Mở bằng trình duyệt web"; with the default "Mở bằng Zalo"
 * every method here reports "not handled" so the original code runs unchanged.
 * Zalo's own hosts (zalo.me, zaloapp.com and their subdomains) always stay in-app.
 */
public final class ExternalLinks {
    /** Zalo's per-account preference key; 0 = web browser, 1 = Zalo (default). */
    private static final String JUMP_LINK_MODE_KEY = "JUMP_LINK_MODE_SETTING_${UserID}";
    private static final int MODE_BROWSER = 0;
    private static final int MODE_ZALO = 1;
    private static final String[] ZALO_HOSTS = { "zalo.me", "zaloapp.com" };

    private ExternalLinks() { }

    /**
     * Patch-generated body: reads the setting exactly like Zalo's link opener
     * (preference-key resolver + int preference getter, using {@code fallback} as default).
     * Do not call with a fallback other than {@link #MODE_ZALO}.
     */
    public static int jumpLinkMode(String key, int fallback) {
        return fallback;
    }

    /** Patch-generated body: Zalo's plain ACTION_VIEW opener (shows its own toast on failure). */
    public static void openInBrowser(Context context, String url) { }

    public static boolean isBrowserMode() {
        try {
            return jumpLinkMode(JUMP_LINK_MODE_KEY, MODE_ZALO) == MODE_BROWSER;
        } catch (Throwable failure) {
            NezumiLog.swallowedOnce("NezumiLinks", "jump link mode unavailable", failure);
            return false;
        }
    }

    /**
     * Replacement result for Zalo's "is this a Zalo-controlled domain" check.
     * Returns -1 to run the original check (setting = Zalo), otherwise 1 for Zalo hosts, 0 for others.
     */
    public static int zaloDomainOverride(String url) {
        if (!isBrowserMode()) return -1;
        return isZaloLink(url) ? 1 : 0;
    }

    /**
     * Opens {@code url} in the external browser when the setting is "web browser", the URL is
     * http(s) and not a Zalo host. Returns false (caller continues with the original code) otherwise.
     *
     * @param host a Context, a View, or a Zalo screen/fragment exposing a public getContext().
     */
    public static boolean openExternally(Object host, String url) {
        try {
            if (url == null) return false;
            String trimmed = url.trim();
            if (!isHttpUrl(trimmed) || isZaloLink(trimmed) || !isBrowserMode()) return false;
            Activity activity = ZaloEnv.activityOf(contextOf(host));
            if (activity == null) return false;
            openInBrowser(activity, trimmed);
            return true;
        } catch (Throwable failure) {
            NezumiLog.swallowedOnce("NezumiLinks", "opening link externally failed, using Zalo", failure);
            return false;
        }
    }

    static boolean isHttpUrl(String url) {
        if (url == null) return false;
        String lower = url.trim().toLowerCase(Locale.ROOT);
        return (lower.startsWith("http://") && lower.length() > 7)
            || (lower.startsWith("https://") && lower.length() > 8);
    }

    static boolean isZaloLink(String url) {
        String host = hostOf(url);
        if (host == null) return false;
        for (String zalo : ZALO_HOSTS) {
            if (host.equals(zalo) || host.endsWith("." + zalo)) return true;
        }
        return false;
    }

    private static String hostOf(String url) {
        if (url == null) return null;
        String rest = url.trim();
        int scheme = rest.indexOf("://");
        if (scheme >= 0) rest = rest.substring(scheme + 3);
        int end = rest.length();
        for (char stop : new char[] { '/', '?', '#', '\\' }) {
            int index = rest.indexOf(stop);
            if (index >= 0 && index < end) end = index;
        }
        String authority = rest.substring(0, end);
        int at = authority.lastIndexOf('@');
        if (at >= 0) authority = authority.substring(at + 1);
        int port = authority.indexOf(':');
        if (port >= 0) authority = authority.substring(0, port);
        while (authority.endsWith(".")) authority = authority.substring(0, authority.length() - 1);
        return authority.isEmpty() ? null : authority.toLowerCase(Locale.ROOT);
    }

    private static Context contextOf(Object host) {
        if (host == null) return null;
        if (host instanceof Context) return (Context) host;
        if (host instanceof View) return ((View) host).getContext();
        try {
            Method getContext = host.getClass().getMethod("getContext");
            Object context = getContext.invoke(host);
            return context instanceof Context ? (Context) context : null;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError failure) {
            NezumiLog.swallowedOnce("NezumiLinks", "host context unavailable", failure);
            return null;
        }
    }
}
