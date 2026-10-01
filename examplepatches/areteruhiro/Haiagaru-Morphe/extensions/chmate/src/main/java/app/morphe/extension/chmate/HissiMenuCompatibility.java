package app.morphe.extension.chmate;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

/** Repairs the stock Hissi host filter before ChMate expands menu templates. */
public final class HissiMenuCompatibility {
    private static final String CHMATE_WEB_VIEW_ACTIVITY =
            "jp.syoboi.a2chMate.activity.WebViewActivity";
    private static final String EDDI_ARCHIVE_HOST = "eddiarchive3rd.boy.jp";
    private static final String EDDI_SCHEME = "haiagaru-eddi";
    private HissiMenuCompatibility() {}

    public static String rewriteTemplate(String template) {
        // The long-press action is not identical to the settings-menu action
        // on every ChMate generation.  Some builds omit the slash after the
        // host, use a protocol-relative URL, or already contain an expanded
        // URL.  Match the stable Hissi path instead of one exact spelling.
        if (template == null || !template.contains("hissi.org/read.php")) {
            return template;
        }
        boolean dedicatedViewer = Haiagaru.dedicatedCheckerViewerAvailable();
        String stockFilter = "{$host[match:[25]ch.net$]}";
        String oldFilter = "{$host[match:(^|\\.)(2ch\\.net|5ch\\.(net|io))$]}";
        // Observed in the stock 242 menu provider (not a user-defined filter).
        String modernFilter = "{$host[match:(?:2ch\\.net|5ch\\.(?:net|io))$]}";
        template = template.replace(modernFilter, oldFilter);
        String supportedFilter = "{$host[match:(?:^|\\.)(?:2ch\\.net|5ch\\.(?:net|io)|"
                + "bbspink\\.com|open2ch\\.net|machi\\.to|vip2ch\\.com|5chan\\.jp)$|"
                + "^(?:jbbs\\.shitaraba\\.net|bbs\\.eddibb\\.cc|bbs\\.punipuni\\.eu|"
                + "bbs\\.kamemushi\\.com|bbs\\.jpnkn\\.com|bbs\\.3chan\\.cc|"
                + "refugee-chan\\.mobi|yaruozatsudan\\.com|yaruoshelter\\.com|"
                + "yarumakai\\.com|v1ch\\.cc|pinkdarker\\.com)$]}";
        if (!template.contains(stockFilter) && !template.contains(oldFilter)
                && !template.contains("haiagaru_mode=")) {
            return template;
        }
        // Keep the expanded long-press menu on all supported boards even when
        // the optional viewer is absent. Only its destination changes.
        if (!dedicatedViewer) {
            return template.replace(stockFilter, supportedFilter)
                    .replace(oldFilter, supportedFilter)
                    .replace("haiagaru-hissi://", "http://")
                    .replace("haiagaru-hissis://", "https://");
        }
        // Keep the old hosts working, including when domain conversion is disabled.
        // Do not change the destination, ID/date expansion, or the menu preference.
        boolean protocolRelative = template.contains("//hissi.org/read.php/")
                && !template.contains("://hissi.org/read.php/");
        String rewritten = template.replace("http://hissi.org/read.php/",
                "haiagaru-hissi://hissi.org/read.php/")
                .replace("https://hissi.org/read.php/",
                        "haiagaru-hissis://hissi.org/read.php/");
        if (protocolRelative) {
            rewritten = rewritten.replace("//hissi.org/read.php/",
                    "haiagaru-hissi://hissi.org/read.php/");
        }
        rewritten = addSelectedIdParameter(rewritten);
        String sourceFilter = rewritten.contains(stockFilter) ? stockFilter : oldFilter;
        if (!rewritten.contains(sourceFilter)) {
            // A previously rewritten template only needs its selected mode refreshed.
            return rewritten.replaceAll("&haiagaru_mode=[0-9]+", "&haiagaru_mode="
                    + Haiagaru.hissiCheckerMode());
        }
        return rewritten.replace(sourceFilter,
                "?haiagaru_host={$host}&haiagaru_key={$key}&haiagaru_id={$id}&haiagaru_mode="
                        + Haiagaru.hissiCheckerMode() + supportedFilter);
    }

    private static String addSelectedIdParameter(String template) {
        if (template.contains("haiagaru_id=")) return template;
        int mode = template.indexOf("&haiagaru_mode=");
        if (mode < 0) return template;
        return template.substring(0, mode) + "&haiagaru_id={$id}"
                + template.substring(mode);
    }

    /**
     * Rewrites a fully expanded URL immediately before ChMate hands it to
     * ACTION_VIEW.  The ID long-press action in some releases bypasses the
     * menu-template expansion hook, so this second boundary is required for
     * that route as well.
     */
    public static String rewriteExternalUrl(String url) {
        if (url == null || !Haiagaru.dedicatedCheckerViewerAvailable()) return url;
        if (url.startsWith("http://hissi.org/read.php/")) {
            return "haiagaru-hissi://hissi.org/read.php/" + url.substring(
                    "http://hissi.org/read.php/".length());
        }
        if (url.startsWith("https://hissi.org/read.php/")) {
            return "haiagaru-hissis://hissi.org/read.php/" + url.substring(
                    "https://hissi.org/read.php/".length());
        }
        if (url.startsWith("//hissi.org/read.php/")) {
            return "haiagaru-hissi://hissi.org/read.php/" + url.substring(
                    "//hissi.org/read.php/".length());
        }
        if (isEddiArchiveUrl(url)) {
            Uri uri = Uri.parse(url);
            if ("http".equalsIgnoreCase(uri.getScheme())
                    || "https".equalsIgnoreCase(uri.getScheme())) {
                return uri.buildUpon().scheme(EDDI_SCHEME).build().toString();
            }
        }
        return url;
    }

    /** Keep the checker inside this installed ChMate, even if browsers or old test builds also match. */
    public static void prepareExternalIntent(Intent intent) {
        if (intent == null || !Intent.ACTION_VIEW.equals(intent.getAction())) return;
        Uri uri = intent.getData();
        if (isEddiArchiveUri(uri)) {
            Context context = Haiagaru.applicationContextForExtension();
            if (context != null) {
                intent.setClassName(context, HissiMenuActivity.class.getName());
            }
            return;
        }
        if (uri == null || !"hissi.org".equalsIgnoreCase(uri.getHost())
                || uri.getPath() == null || !uri.getPath().startsWith("/read.php/")) return;
        String scheme = uri.getScheme();
        if (!"http".equalsIgnoreCase(scheme) && !"https".equalsIgnoreCase(scheme)
                && !"haiagaru-hissi".equalsIgnoreCase(scheme)
                && !"haiagaru-hissis".equalsIgnoreCase(scheme)) return;
        Context context = Haiagaru.applicationContextForExtension();
        if (context == null) return;
        if (Haiagaru.dedicatedCheckerViewerAvailable()) {
            intent.setClassName(context, HissiMenuActivity.class.getName());
        } else {
            // dedicatedCheckerViewer=false deliberately uses ChMate's own
            // WebViewActivity rather than the Haiagaru viewer. This keeps the
            // result in the app and avoids handing the checker to a browser.
            if ("haiagaru-hissi".equalsIgnoreCase(scheme)
                    || "haiagaru-hissis".equalsIgnoreCase(scheme)) {
                intent.setData(uri.buildUpon().scheme("haiagaru-hissis".equalsIgnoreCase(scheme)
                        ? "https" : "http").build());
            }
            intent.setClassName(context, CHMATE_WEB_VIEW_ACTIVITY);
        }
    }

    private static boolean isEddiArchiveUrl(String value) {
        if (value == null) return false;
        try {
            return isEddiArchiveUri(Uri.parse(value));
        } catch (RuntimeException ignored) {
            return false;
        }
    }

    private static boolean isEddiArchiveUri(Uri uri) {
        if (uri == null) return false;
        String scheme = uri.getScheme();
        if (!"http".equalsIgnoreCase(scheme) && !"https".equalsIgnoreCase(scheme)
                && !EDDI_SCHEME.equalsIgnoreCase(scheme)) return false;
        String host = uri.getHost();
        return host != null && (EDDI_ARCHIVE_HOST.equalsIgnoreCase(host)
                || host.toLowerCase(java.util.Locale.ROOT).endsWith("." + EDDI_ARCHIVE_HOST));
    }
}
