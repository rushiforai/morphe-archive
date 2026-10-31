/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import android.net.Uri;
import android.os.SystemClock;

import androidx.annotation.Nullable;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Opens a Page's Events link on that Page's Events tab (#319).
 *
 * <p>Facebook has no native screen for a link like facebook.com/facebook/events, so it loads the
 * address in its web view, and Facebook's server answers every Page events address with a redirect
 * to fb://feed/. The tap lands on Home. The Page itself, facebook.com/facebook, comes back as
 * fb://profile/&lt;id&gt;, and the native Page opens on its Events tab when that link carries
 * initial_tab=events. The server drops any query on the way, so the tab can't ride along in the
 * address.
 *
 * <p>The patch hands every address Facebook's link mapper is asked about to {@link #route} first.
 * A Page events address with a numeric id or a profile.php id becomes fb://profile/&lt;id&gt; with
 * the Events tab right away. One with a Page's username becomes the Page's own address, and the
 * next fb://profile/&lt;id&gt; the mapper sees in the following seconds, the server's answer for it,
 * gets the Events tab added. Every other address, and any error, goes through unchanged.
 */
@SuppressWarnings("unused")
public final class PageEventsLink {
    private PageEventsLink() {
    }

    static final String TAB = "initial_tab=events";

    /** How long the Page's own address has to come back from the server as fb://profile/. */
    static final long WINDOW_MILLIS = 15_000;

    /** The last part of a Page address that means its events: the old tab and the two newer ones. */
    private static final Set<String> EVENT_TABS = new HashSet<>(Arrays.asList(
            "events", "upcoming_hosted_events", "past_hosted_events"));

    /** First parts of facebook.com addresses that aren't a Page or a person. */
    private static final Set<String> NOT_A_PAGE = new HashSet<>(Arrays.asList(
            "events", "groups", "pages", "pg", "watch", "marketplace", "gaming", "hashtag", "search",
            "settings", "friends", "messages", "notifications", "help", "people", "business", "ads",
            "saved", "bookmarks", "memories", "fundraisers", "jobs", "media", "reel", "reels",
            "stories", "share", "photo", "photos", "video", "videos", "story", "permalink", "l"));

    private static final Pattern NUMERIC = Pattern.compile("[0-9]+");
    private static final Pattern USERNAME = Pattern.compile("[A-Za-z0-9.]+");
    private static final Pattern PROFILE_LINK = Pattern.compile("fb://profile/[0-9]+(\\?.*)?");

    /** Until when the next fb://profile/ link gets the Events tab, on the elapsed-time clock. */
    private static volatile long eventsTabUntil;

    /** The address Facebook's link mapper works on instead of [url]. */
    @Nullable
    public static String route(@Nullable String url) {
        try {
            return route(url, SystemClock.elapsedRealtime());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.EXTERNAL_BROWSER, "page events link", failure);
            Logger.printException(() -> "Could not route a Page events link", failure);
            return url;
        }
    }

    @Nullable
    static String route(@Nullable String url, long now) {
        if (url == null) return null;
        if (url.startsWith("fb://")) return withEventsTab(url, now);

        Uri link = Uri.parse(url);
        String scheme = link.getScheme();
        if (!"https".equalsIgnoreCase(scheme) && !"http".equalsIgnoreCase(scheme)) return url;
        String host = link.getHost();
        if (host == null) return url;
        String name = host.toLowerCase(Locale.ROOT);
        if (!name.equals("facebook.com") && !name.endsWith(".facebook.com")) return url;

        List<String> parts = link.getPathSegments();
        if (parts.size() == 1 && parts.get(0).equalsIgnoreCase("profile.php")) {
            String id = link.getQueryParameter("id");
            String tab = link.getQueryParameter("sk");
            if (id == null || tab == null || !NUMERIC.matcher(id).matches()) return url;
            if (!EVENT_TABS.contains(tab.toLowerCase(Locale.ROOT))) return url;
            return opened(profileWithEvents(id));
        }

        String page;
        if (parts.size() == 2 && EVENT_TABS.contains(parts.get(1).toLowerCase(Locale.ROOT))) {
            page = parts.get(0);
        } else if (parts.size() == 3 && parts.get(0).equalsIgnoreCase("pg")
                && EVENT_TABS.contains(parts.get(2).toLowerCase(Locale.ROOT))) {
            page = parts.get(1);
        } else {
            return url;
        }

        if (NUMERIC.matcher(page).matches()) return opened(profileWithEvents(page));
        String lower = page.toLowerCase(Locale.ROOT);
        if (!USERNAME.matcher(page).matches() || NOT_A_PAGE.contains(lower) || lower.endsWith(".php")) return url;

        eventsTabUntil = now + WINDOW_MILLIS;
        HookStatus.invoked(FamilyNames.EXTERNAL_BROWSER);
        HookStatus.counted(FamilyNames.EXTERNAL_BROWSER, "page events link by username");
        Logger.printDebug(() -> "Page events link: opening " + page + " first");
        return scheme.toLowerCase(Locale.ROOT) + "://" + host + "/" + page;
    }

    /** [url] with the Events tab when it's the Page link the server answered for a username in time. */
    private static String withEventsTab(String url, long now) {
        long until = eventsTabUntil;
        if (until == 0 || now > until || !PROFILE_LINK.matcher(url).matches()) return url;
        eventsTabUntil = 0;
        if (url.contains("initial_tab=")) return url;
        HookStatus.counted(FamilyNames.EXTERNAL_BROWSER, "page events tab added");
        return url + (url.indexOf('?') < 0 ? "?" : "&") + TAB;
    }

    private static String profileWithEvents(String id) {
        return "fb://profile/" + id + "?" + TAB;
    }

    private static String opened(String link) {
        HookStatus.invoked(FamilyNames.EXTERNAL_BROWSER);
        HookStatus.counted(FamilyNames.EXTERNAL_BROWSER, "page events link by id");
        return link;
    }
}
