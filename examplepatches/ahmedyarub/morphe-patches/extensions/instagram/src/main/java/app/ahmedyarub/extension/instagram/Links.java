/*
 * Adapted from piko <https://github.com/crimera/piko>, GPLv3.
 *
 * Simplified: piko's Links gates both features on its settings layer (Pref/SettingsStatus).
 * Both features are always on here.
 */

package app.ahmedyarub.extension.instagram;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import java.io.IOException;
import java.net.URI;
import java.util.Arrays;
import java.util.Collections;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ShareLinkSanitizer;
import app.morphe.extension.shared.Utils;

@SuppressWarnings("unused")
public final class Links {

    /**
     * Instagram's links keep only the parameters that change what the link opens; anything else
     * on them attributes the share to the sender. Links to other sites lose only known trackers.
     */
    private static final ShareLinkSanitizer SANITIZER = new ShareLinkSanitizer(
            "instagram.com",
            // The carousel slide a post link opens on.
            Collections.singletonList("img_index"),
            Arrays.asList("igsh", "igsi", "utm_source", "utm_medium", "utm_content", "fbclid", "si"));

    /** The hosts Instagram routes outbound links through, with the destination in "u". */
    private static final java.util.Set<String> LINK_REDIRECT_HOSTS =
            new java.util.HashSet<>(Arrays.asList("l.instagram.com", "lm.instagram.com"));

    private Links() {
    }

    /**
     * Injection point. Strips tracking parameters from a share URL.
     *
     * <p>Returns the input unchanged on any failure: a share link that still carries tracking
     * is better than a broken one.
     */
    public static String sanitizeUrl(String url) {
        return SANITIZER.sanitize(url, true);
    }

    /**
     * Injection point. Opens an in-app browser link in the system browser instead.
     *
     * <p>Instagram wraps outbound links as {@code https://l.instagram.com/?u=<url>&e=<id>},
     * so the real destination is the {@code u} parameter. Only those redirects are unwrapped:
     * another site's own {@code u} parameter means something else. Returns false for anything
     * else, which leaves the caller on its normal in-app path.
     */
    public static boolean openExternally(String url) {
        try {
            Uri uri = Uri.parse(url);
            String host = uri.getHost();
            if (host == null || !LINK_REDIRECT_HOSTS.contains(host.toLowerCase(java.util.Locale.ROOT))) return false;

            String actualUrl = uri.getQueryParameter("u");
            if (actualUrl == null) return false;

            Context context = Utils.getContext();
            if (context == null) return false;

            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(sanitizeUrl(actualUrl)));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
            return true;
        } catch (Exception ex) {
            Logger.printException(() -> "openExternally failed", ex);
            return false;
        }
    }

    /**
     * Injection point. Called with every outbound request URI, and throws to block one.
     *
     * <p>piko routes many features through here, each behind its own setting. Only the
     * analytics rules are ported, and they are always on.
     *
     * <p>The caller already handles {@link IOException}, which is how piko cancels a request.
     */
    public static void interceptUri(URI uri) throws IOException {
        boolean block = false;

        try {
            if (uri != null && uri.getPath() != null) {
                // Only the dedicated telemetry endpoint is blocked.
                //
                // piko also blocks the graph.instagram.com and graph.facebook.com hosts
                // outright, but those serve the GraphQL API the app runs on - feed, direct
                // messages, profiles - not just analytics. piko can afford that because the
                // rule sits behind an opt-in setting; with the setting removed it applies to
                // everyone, and it breaks the app.
                block = uri.getPath().contains("/logging_client_events");
            }
        } catch (Exception ex) {
            Logger.printException(() -> "interceptUri failed", ex);
        }

        if (block) throw new IOException("Blocked analytics request");
    }
}
