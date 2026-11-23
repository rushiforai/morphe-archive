package app.ftl.extension.videodownloader;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.net.Uri;
import android.os.SystemClock;

import java.util.ArrayList;
import java.util.Locale;

final class PopupUtil {
    private PopupUtil() {
    }

    static Activity activityOf(Context context) {
        Context c = context;
        while (c instanceof ContextWrapper) {
            if (c instanceof Activity) {
                return (Activity) c;
            }
            c = ((ContextWrapper) c).getBaseContext();
        }
        return null;
    }

    static String norm(String host) {
        if (host == null) {
            return null;
        }
        String s = host.toLowerCase(Locale.ROOT);
        return s.startsWith("www.") ? s.substring(4) : s;
    }

    private static final String[] SECOND_LEVEL = {
            "co", "com", "org", "net", "gov", "edu", "ac", "or", "ne", "go"
    };

    private static boolean isSecondLevel(String label) {
        for (String s : SECOND_LEVEL) {
            if (s.equals(label)) {
                return true;
            }
        }
        return false;
    }

    static String base(String host) {
        String h = norm(host);
        if (h == null || h.indexOf(':') >= 0) {
            return h;
        }
        String[] p = h.split("\\.");
        int n = p.length;
        if (n <= 2) {
            return h;
        }
        boolean numeric = true;
        for (String s : p) {
            if (!s.matches("\\d+")) {
                numeric = false;
                break;
            }
        }
        if (numeric) {
            return h;
        }
        int keep = (p[n - 1].length() == 2 && isSecondLevel(p[n - 2])) ? 3 : 2;
        if (n <= keep) {
            return h;
        }
        StringBuilder sb = new StringBuilder();
        for (int i = n - keep; i < n; i++) {
            if (sb.length() > 0) {
                sb.append('.');
            }
            sb.append(p[i]);
        }
        return sb.toString();
    }

    static ArrayList<String> options(String host) {
        ArrayList<String> out = new ArrayList<String>();
        String h = norm(host);
        if (h == null || h.length() == 0) {
            return out;
        }
        out.add(h);
        String base = base(h);
        String cur = h;
        while (base != null && !cur.equals(base)) {
            int dot = cur.indexOf('.');
            if (dot < 0) {
                break;
            }
            cur = cur.substring(dot + 1);
            out.add(cur);
        }
        return out;
    }

    static String hostOf(String url) {
        if (url == null) {
            return null;
        }
        return norm(Uri.parse(url).getHost());
    }

    static boolean sameSite(String a, String b) {
        if (a == null || b == null) {
            return false;
        }
        return a.equals(b) || b.endsWith("." + a) || a.endsWith("." + b);
    }

    private static final int SHORT_MAX = 60;
    private static final long BUSY_TIMEOUT_MS = 60000L;
    private static boolean busy;
    private static long busySince;

    static synchronized boolean tryAcquire() {
        long now = SystemClock.uptimeMillis();
        if (busy && now - busySince < BUSY_TIMEOUT_MS) {
            return false;
        }
        busy = true;
        busySince = now;
        return true;
    }

    static synchronized void release() {
        busy = false;
    }

    static String shorten(String url) {
        if (url == null) {
            return null;
        }
        String s = url;
        if (s.startsWith("https://")) {
            s = s.substring(8);
        } else if (s.startsWith("http://")) {
            s = s.substring(7);
        }
        return s.length() > SHORT_MAX ? s.substring(0, SHORT_MAX) + "\u2026" : s;
    }

    static void openUrl(Context ctx, String url) {
        if (url == null) {
            return;
        }
        Activity activity = activityOf(ctx);
        if (activity instanceof PopupTabOpener) {
            ((PopupTabOpener) activity).openPopupTab(url);
        }
    }
}
