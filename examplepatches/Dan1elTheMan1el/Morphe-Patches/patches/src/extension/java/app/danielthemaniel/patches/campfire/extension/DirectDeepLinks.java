package app.danielthemaniel.patches.campfire.extension;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * Campfire's "open Pokémon GO" buttons go through AppsFlyer OneLink, e.g.
 *   https://pokemon-go.onelink.me/nBRb?af_dp=pokemongo%3A%2F%2F&af_force_deeplink=true&deep_link_value=...
 * which loads a redirect page in a browser tab and then bounces to
 *   pokemongo://?af_deeplink=true&af_dp=pokemongo%3A%2F%2F&af_force_deeplink=true&campaign=None&deep_link_value=...
 *
 * This builds that final deep link locally and opens it directly. If no app handles it (game
 * not installed), the caller falls back to the original OneLink, which leads to the store.
 */
@SuppressWarnings("unused")
public final class DirectDeepLinks {
    private static final String TAG = "CampfireDirectDeepLinks";

    private DirectDeepLinks() {}

    /**
     * Hooked at the start of Browser.open(Uri, Integer) and Bridge.launchIntent(Uri).
     * Returns true if the deep link was opened and the original call must be skipped.
     */
    public static boolean openDirect(Uri uri) {
        try {
            if (uri == null) return false;
            String deepLink = directLink(uri.toString());
            if (deepLink == null) return false;

            Context context = application();
            if (context == null) return false;
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(deepLink));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
            Log.i(TAG, "Opened " + deepLink);
            return true;
        } catch (ActivityNotFoundException e) {
            Log.i(TAG, "No app for the deep link; falling back to OneLink");
            return false;
        } catch (Throwable t) {
            Log.e(TAG, "Failed to open deep link directly", t);
            return false;
        }
    }

    /**
     * OneLink URL -> the app deep link its redirect page would open, or null if [url] is not a
     * OneLink with an app-scheme af_dp. Pure string handling, no Android APIs.
     */
    public static String directLink(String url) {
        if (url == null) return null;
        String lower = url.toLowerCase(Locale.ROOT);
        int schemeEnd;
        if (lower.startsWith("https://")) schemeEnd = 8;
        else if (lower.startsWith("http://")) schemeEnd = 7;
        else return null;

        int hostEnd = schemeEnd;
        while (hostEnd < url.length() && "/?#".indexOf(url.charAt(hostEnd)) == -1) hostEnd++;
        String host = lower.substring(schemeEnd, hostEnd);
        int port = host.indexOf(':');
        if (port != -1) host = host.substring(0, port);
        if (!host.equals("onelink.me") && !host.endsWith(".onelink.me")) return null;

        int q = url.indexOf('?', hostEnd);
        if (q == -1) return null;
        int hash = url.indexOf('#', q);
        String query = hash == -1 ? url.substring(q + 1) : url.substring(q + 1, hash);

        List<String[]> params = new ArrayList<>();
        String afDp = null;
        boolean hasDeeplinkFlag = false;
        boolean hasCampaign = false;
        for (String pair : query.split("&")) {
            if (pair.isEmpty()) continue;
            int eq = pair.indexOf('=');
            String key = eq == -1 ? pair : pair.substring(0, eq);
            String value = eq == -1 ? "" : pair.substring(eq + 1);
            if (key.equals("af_dp")) afDp = value;
            if (key.equals("af_deeplink")) hasDeeplinkFlag = true;
            if (key.equals("campaign")) hasCampaign = true;
            params.add(new String[] {key, value});
        }
        if (afDp == null || afDp.isEmpty()) return null;

        String base;
        try {
            base = URLDecoder.decode(afDp, "UTF-8");
        } catch (Exception e) {
            return null;
        }
        int colon = base.indexOf(':');
        if (colon == -1) {
            // Bare scheme name (e.g. the check-in popup's af_dp=pokemongo): OneLink opens scheme://
            if (!base.toLowerCase(Locale.ROOT).matches("[a-z][a-z0-9+.-]*")) return null;
            base = base + "://";
            colon = base.indexOf(':');
        }
        if (colon <= 0) return null;
        String scheme = base.substring(0, colon).toLowerCase(Locale.ROOT);
        if (scheme.equals("http") || scheme.equals("https") || !scheme.matches("[a-z][a-z0-9+.-]*")) {
            return null;
        }

        // What the redirect page adds, in its (alphabetical) order.
        if (!hasDeeplinkFlag) params.add(new String[] {"af_deeplink", "true"});
        if (!hasCampaign) params.add(new String[] {"campaign", "None"});
        Collections.sort(params, (a, b) -> a[0].compareTo(b[0])); // stable: keeps duplicates in order

        StringBuilder sb = new StringBuilder(base);
        sb.append(base.indexOf('?') == -1 ? '?' : '&');
        for (int i = 0; i < params.size(); i++) {
            if (i > 0) sb.append('&');
            sb.append(params.get(i)[0]).append('=').append(params.get(i)[1]);
        }
        return sb.toString();
    }

    private static Context application() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication")
                .invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }
}
