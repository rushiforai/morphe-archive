package app.morphed.extension.twitch.dns;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;

/**
 * Ad and tracking servers the Twitch app is not allowed to reach. Banner, display and in-feed ads
 * come from Twitch's own ad server, edge.ads.twitch.tv.
 */
public final class HostBlocklist {
    /** Blocked with every subdomain. */
    private static final List<String> BLOCKED_DOMAINS = Arrays.asList(
            "ads.twitch.tv",
            "spade.twitch.tv",
            "countess.twitch.tv",
            "trowel.twitch.tv",
            "science.twitch.tv",
            "client-event-reporter.twitch.tv",
            "player.stats.live-video.net",
            "scorecardresearch.com",
            "adsafeprotected.com",
            "amazon-adsystem.com",
            "doubleclick.net",
            "googlesyndication.com",
            "googleadservices.com",
            "moatads.com",
            "imasdk.googleapis.com",
            "app-measurement.com");

    private HostBlocklist() {
    }

    public static boolean isBlocked(String host) {
        if (host == null) return false;
        String name = host.toLowerCase(Locale.ROOT);
        if (name.endsWith(".")) name = name.substring(0, name.length() - 1);
        for (String domain : BLOCKED_DOMAINS) {
            if (name.equals(domain) || name.endsWith("." + domain)) return true;
        }
        return false;
    }
}
