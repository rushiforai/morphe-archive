package app.linkedin.extension;

import android.net.Uri;
import android.util.Log;

/**
 * LinkedIn routes external links through https://www.linkedin.com/safety/go/?url=<target>,
 * which shows a warning page first. These hooks open the target directly.
 */
@SuppressWarnings("unused")
public final class OpenLinksDirectlyPatch {

    /** Injected at the start of the SDUI NavigateToUrlActionViewData constructor (feed, profiles, ...). */
    public static Uri unwrap(Uri uri) {
        try {
            if (uri == null || !Settings.openLinksDirectly()) return uri;
            return expandShortLink(unwrapSafetyPage(uri));
        } catch (Throwable t) {
            Log.e(Settings.TAG, "unwrap failed", t);
            return uri;
        }
    }

    /** https://www.linkedin.com/safety/go/?url=target -> target */
    private static Uri unwrapSafetyPage(Uri uri) {
        String host = uri.getHost();
        String path = uri.getPath();
        if (host == null || path == null) return uri;
        if (!(host.equals("linkedin.com") || host.endsWith(".linkedin.com"))) return uri;
        if (!path.startsWith("/safety/go")) return uri;

        String target = uri.getQueryParameter("url");
        if (target == null) return uri;
        Uri targetUri = Uri.parse(target);
        if (!isWebLink(targetUri)) return uri;
        Settings.debugLog("open link directly: " + targetUri.getHost());
        return targetUri;
    }

    /**
     * https://lnkd.in/xyz -> its target, when already resolved in the background. Otherwise the link
     * opens as usual (LinkedIn's own warning page) and resolving starts for next time.
     */
    private static Uri expandShortLink(Uri uri) {
        if (!"lnkd.in".equalsIgnoreCase(uri.getHost()) || !Settings.resolveShortLinks()) return uri;
        String link = uri.toString();
        String target = ShortLinkResolver.cached(link);
        if (target == null) {
            ShortLinkResolver.prefetch(link);
            return uri;
        }
        Uri targetUri = Uri.parse(target);
        if (!isWebLink(targetUri)) return uri;
        Settings.debugLog("short link expanded: " + targetUri.getHost());
        return targetUri;
    }

    private static boolean isWebLink(Uri uri) {
        String scheme = uri.getScheme();
        return "https".equalsIgnoreCase(scheme) || "http".equalsIgnoreCase(scheme);
    }

    /** Called with feed payload text: resolves the lnkd.in links a user is likely to tap. */
    static void prefetchShortLinks(String text) {
        if (Settings.resolveShortLinks() && text.contains(ShortLinkResolver.PREFIX)) {
            ShortLinkResolver.prefetchAll(text);
        }
    }

    /** Injected at the start of RichTextUtils.getLinkShimmingLink(String), which wraps links in chats. */
    public static boolean skipMessagingShim() {
        return Settings.openLinksDirectly();
    }
}
