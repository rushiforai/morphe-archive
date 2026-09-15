/*
 * Adapted from piko <https://github.com/crimera/piko>, GPLv3.
 *
 * Simplified: piko's Links gates both features on its settings layer
 * (Pref/SettingsStatus) and delegates sanitising to ShareLinkSanitizer, which is not present
 * in the extension library version this bundle builds against. Both features are always on
 * here and the sanitiser is implemented locally.
 */

package app.ahmedyarub.extension.instagram;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import java.io.IOException;
import java.net.URI;

import java.util.Arrays;
import java.util.List;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

@SuppressWarnings("unused")
public final class Links {

    /** Query parameters Instagram uses to attribute a share back to the sender. */
    private static final List<String> TRACKING_PARAMETERS = Arrays.asList(
            "igsh", "igsi", "utm_source", "utm_medium", "utm_content", "fbclid", "si");

    private Links() {
    }

    /**
     * Injection point. Strips tracking parameters from a share URL.
     *
     * <p>Returns the input unchanged on any failure: a share link that still carries tracking
     * is better than a broken one.
     */
    public static String sanitizeUrl(String url) {
        try {
            if (url == null || url.isEmpty()) return url;

            Uri uri = Uri.parse(url);
            if (uri.isOpaque()) return url;

            java.util.Set<String> names = uri.getQueryParameterNames();
            if (names.isEmpty()) return url;

            boolean changed = false;
            Uri.Builder builder = uri.buildUpon().clearQuery();
            for (String name : names) {
                if (TRACKING_PARAMETERS.contains(name)) {
                    changed = true;
                    continue;
                }
                for (String value : uri.getQueryParameters(name)) {
                    builder.appendQueryParameter(name, value);
                }
            }

            return changed ? builder.build().toString() : url;
        } catch (Exception ex) {
            Logger.printException(() -> "sanitizeUrl failed", ex);
            return url;
        }
    }

    /**
     * Injection point. Opens an in-app browser link in the system browser instead.
     *
     * <p>Instagram wraps outbound links as {@code https://l.instagram.com/?u=<url>&e=<id>},
     * so the real destination is the {@code u} parameter. Returns false when there is none,
     * which leaves the caller on its normal in-app path.
     */
    public static boolean openExternally(String url) {
        try {
            String actualUrl = Uri.parse(url).getQueryParameter("u");
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
