package io.github.sabopura.morphe.extension.twitch.player;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;
import android.content.SharedPreferences;
import android.net.Uri;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

public final class LiveProxy {
    private LiveProxy() {}

    /** After the proxy fails, streams go straight to Twitch for this long. */
    static final long DIRECT_AFTER_FAILURE_MS = TimeUnit.MINUTES.toMillis(5);
    private static final int REMEMBERED = 8;

    private static volatile Uri lastOriginal, lastRouted;
    private static volatile long directUntil;
    /** Original usher URL by proxy URL, for every stream opened recently, not only the last one. */
    private static final Map<String, String> ROUTES =
            new LinkedHashMap<String, String>() {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
                    return size() > REMEMBERED;
                }
            };

    public static Uri forReload(String path) {
        Uri original = lastOriginal, routed = lastRouted;
        return original != null
                        && (path.equals(original.toString())
                                || routed != null && path.equals(routed.toString()))
                ? rewrite(original)
                : Uri.parse(path);
    }

    /** Build from the public channel name only. Never copy a query, token, device ID or header. */
    public static Uri rewrite(Uri original) {
        if (!Features.has(Feature.STREAM_PROXY)) return original;
        try {
            SharedPreferences p = PlayerTools.preferences();
            String base = p == null ? "" : p.getString("live_proxy", "");
            if (!"usher.ttvnw.net".equals(original.getHost())
                    || !original.getPath().contains("/channel/hls/")) return original;
            lastOriginal = original;
            if (base.isEmpty() || !proxyAvailable()) {
                lastRouted = original;
                return original;
            }
            Uri endpoint = Uri.parse(base);
            if (!validBase(base)) return original;
            String channel = original.getLastPathSegment();
            if (channel == null || !channel.endsWith(".m3u8")) return original;
            channel = channel.substring(0, channel.length() - 5);
            if (!channel.matches("[A-Za-z0-9_]{1,25}")) return original;
            Uri routed =
                    endpoint.buildUpon()
                            .appendPath(channel)
                            .appendQueryParameter("allow_source", "true")
                            .appendQueryParameter("allow_audio_only", "true")
                            .appendQueryParameter("fast_bread", "true")
                            .appendQueryParameter("type", "any")
                            .appendQueryParameter("player", "twitchweb")
                            .build();
            lastRouted = routed;
            synchronized (ROUTES) {
                ROUTES.put(routed.toString(), original.toString());
            }
            return routed;
        } catch (Exception e) {
            Diagnostics.note("player.stream-proxy", e);
            return original;
        }
    }

    /** The usher URL that a proxied playlist URL replaced, or null. */
    public static String originalOf(String url) {
        synchronized (ROUTES) {
            return ROUTES.isEmpty() ? null : ROUTES.get(url);
        }
    }

    /**
     * Records a proxied request's result. {@code status} is -1 for a connection failure. True when
     * the proxy failed, meaning Twitch directly should be used for a while; 404 only says the
     * channel is offline.
     */
    public static boolean proxyFailed(int status) {
        if (status >= 200 && status < 400 || status == 404) return false;
        directUntil = System.currentTimeMillis() + DIRECT_AFTER_FAILURE_MS;
        return true;
    }

    public static boolean proxyAvailable() {
        return System.currentTimeMillis() >= directUntil;
    }

    /** The proxy's playlist URL for a channel, in the same form as {@link #rewrite}, or null. */
    public static String proxyUrl(String base, String channel) {
        if (base == null || !validBase(base) || channel == null || !channel.matches("[A-Za-z0-9_]{1,25}")) return null;
        return base + channel + "?allow_source=true&allow_audio_only=true&fast_bread=true&type=any&player=twitchweb";
    }

    public static boolean validBase(String base) {
        try {
            java.net.URI u = new java.net.URI(base);
            return "https".equals(u.getScheme())
                    && u.getHost() != null
                    && u.getUserInfo() == null
                    && u.getQuery() == null
                    && u.getFragment() == null
                    && (u.getPort() == -1 || u.getPort() == 443)
                    && u.getPath().endsWith("/");
        } catch (Exception e) {
            return false;
        }
    }
}
