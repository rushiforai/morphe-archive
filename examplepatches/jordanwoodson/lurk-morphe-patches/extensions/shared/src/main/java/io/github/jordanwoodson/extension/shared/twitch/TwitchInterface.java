package io.github.jordanwoodson.extension.shared.twitch;

import android.os.Bundle;
import android.view.View;
import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;

/** Small UI-only transforms. No account, playback token or chat-message state is changed. */
public final class TwitchInterface {
    private TwitchInterface() { }

    /**
     * The destination of a plain launch (Twitch's "Default", which opens Home) replaced by the chosen
     * start screen. Every other destination, such as a link's, is kept.
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static Enum<?> startDestination(Enum<?> destination) {
        if (destination == null || !"Default".equals(destination.name())) return destination;
        String chosen;
        switch (Settings.getInt("default_tab")) {
            case 1: chosen = "Browse"; break;
            case 2: chosen = "Following"; break;
            case 3: chosen = "NotificationCenter"; break;
            default: return destination;
        }
        try {
            return Enum.valueOf((Class) destination.getDeclaringClass(), chosen);
        } catch (IllegalArgumentException missing) {
            return destination;
        }
    }

    private static volatile boolean feedBuilt;

    /**
     * Injection point: the React Native Home feed's initial props (signed-in accounts get that Home), with the
     * tab it should open on. Twitch routes the Following destination into this feed but opens its default tab,
     * Live, so for the first feed a plain launch builds, the Following start screen means the feed's own
     * Following tab. Deep links, later feeds and any other tab Twitch asked for are kept.
     */
    public static String feedTab(boolean fromDeepLink, String benchmarkRunId, String benchmarkTrial, String subfeedTab) {
        if (feedBuilt) return subfeedTab;
        feedBuilt = true;
        if (fromDeepLink || Settings.getInt("default_tab") != 2) return subfeedTab;
        if (subfeedTab != null && !"live".equals(subfeedTab)) return subfeedTab;
        return "following";
    }

    private static volatile boolean homeBuilt;

    /**
     * Injection point: the native Home feed's navigation destination is created with the page it opens on.
     * Tablets get that Home instead of the React Native one, and it starts on Live as well (issue 66). For the
     * first one a plain launch creates, the Following start screen replaces the Live page with the Following
     * page. Deep links, notifications, later navigations and any other page are kept.
     */
    public static Object homePage(Object page, boolean fromDeepLink, boolean fromPush) {
        if (homeBuilt) return page;
        homeBuilt = true;
        try {
            if (page == null || fromDeepLink || fromPush || Settings.getInt("default_tab") != 2) return page;
            Class<?> type = page.getClass();
            if (!type.getName().endsWith("DiscoveryFeedPage$FeedLocationPage")) return page;
            Object location = type.getMethod("getFeedLocation").invoke(page);
            if (location == null || !location.getClass().getName().endsWith("FeedLocation$Live")) return page;
            String following = type.getName().replace("$FeedLocationPage", "$FollowingPage");
            Object chosen = Class.forName(following, false, type.getClassLoader()).getField("INSTANCE").get(null);
            return chosen == null ? page : chosen;
        } catch (ReflectiveOperationException | RuntimeException e) {
            return page;
        }
    }

    private static java.text.NumberFormat countFormat;
    private static java.util.Locale countLocale;

    /** Injection point (Show exact counts): a count in full, grouped the device locale's way (12,345). */
    public static synchronized String exactCount(long count) {
        java.util.Locale locale = java.util.Locale.getDefault();
        if (countFormat == null || !locale.equals(countLocale)) {
            countFormat = java.text.NumberFormat.getIntegerInstance(locale);
            countLocale = locale;
        }
        return countFormat.format(count);
    }

    public static boolean bitsVisible(boolean stock) {
        return stock && !Settings.isEnabled("hide_tipping");
    }

    /**
     * A subscription upsell flag, off while Hide subscription upsells is on: the chat header's Upgrade button, and
     * the Subscribe, Gift a Sub and Upgrade buttons under the stream title (issue 92).
     */
    public static boolean subscriptionUpsellVisible(boolean stock) {
        return stock && !Settings.isEnabled("hide_subscription_upsells");
    }

    /**
     * Injection point: Twitch's Turbo offer as it becomes Visible, the state "Try Ad-Free" and "Go Ad-Free" (your own
     * channel page) are shown from (issue 92). While Hide subscription upsells is on it becomes the state Twitch
     * uses when there is no offer.
     */
    public static Object turboIngress(Object visible) {
        if (!Settings.isEnabled("hide_subscription_upsells")) return visible;
        Object hidden = turboIngressHidden();
        if (hidden == null) return visible;
        Logger.d("upsells: hid Twitch's Turbo offer (Try Ad-Free)");
        return hidden;
    }

    /** Twitch's hidden Turbo offer state (a patch-time bridge). */
    private static Object turboIngressHidden() {
        return null;
    }

    /**
     * Injection point: the player's "Intended for certain audiences" label is about to show (issue 92). While Hide
     * content label is on, the label's view is hidden and true is returned, so Twitch doesn't show it.
     */
    public static boolean hideContentLabel(View label) {
        if (!Settings.isEnabled("hide_content_label")) return false;
        if (label != null) label.setVisibility(View.GONE);
        return true;
    }

    /**
     * The subscription state the chat header picks its Subscribe and Gift A Sub buttons from. With Hide
     * subscription upsells on it becomes the state that offers neither: {@code SUBSCRIBED} for a subscriber
     * (gifting or not), {@code DISABLED} otherwise. Any other value, or an enum without those names, is kept.
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static Enum<?> subscriptionButtons(Enum<?> state) {
        if (state == null || !Settings.isEnabled("hide_subscription_upsells")) return state;
        String without;
        switch (state.name()) {
            case "SUBSCRIBED":
            case "GIFTING_ENABLED": without = "SUBSCRIBED"; break;
            case "DISABLED":
            case "NOT_SUBSCRIBED":
            case "NOT_SUBSCRIBED_GIFTING_DISABLED": without = "DISABLED"; break;
            default: return state;
        }
        try {
            return Enum.valueOf((Class) state.getDeclaringClass(), without);
        } catch (IllegalArgumentException missing) {
            return state;
        }
    }

    /**
     * The native Home's top tabs without Clips. {@code context} is what Home was opened on: the page
     * itself, the Home fragment (its "DiscoveryFeedPage" argument), or the tab list being replaced.
     * A Home opened on Clips, such as from a shared clip link, keeps its Clips tab.
     */
    public static List<?> homeTabs(List<?> tabs, Object context) {
        if (tabs == null || !Settings.isEnabled("hide_clips")) return tabs;
        if (context instanceof List) {
            for (Object tab : (List<?>) context) if (isClipsPage(tab)) return tabs;
        } else if (isClipsPage(requestedPage(context))) {
            return tabs;
        }
        List<Object> kept = new ArrayList<>();
        for (Object tab : tabs) if (!isClipsPage(tab)) kept.add(tab);
        if (kept.isEmpty() || kept.size() == tabs.size()) return tabs;
        return Collections.unmodifiableList(kept);
    }

    private static Object requestedPage(Object context) {
        if (context == null || context.getClass().getName().startsWith("tv.twitch.android.models.feed.DiscoveryFeedPage")) {
            return context;
        }
        try {
            Object arguments = context.getClass().getMethod("getArguments").invoke(context);
            return arguments instanceof Bundle ? ((Bundle) arguments).get("DiscoveryFeedPage") : null;
        } catch (ReflectiveOperationException | RuntimeException failure) {
            return null;
        }
    }

    private static boolean isClipsPage(Object page) {
        if (page == null || !page.getClass().getName().endsWith("DiscoveryFeedPage$FeedLocationPage")) return false;
        try {
            Object location = page.getClass().getMethod("getFeedLocation").invoke(page);
            String name = location == null ? "" : location.getClass().getName();
            return name.endsWith("FeedLocation$Clips") || name.endsWith("FeedLocation$ClipsCategory");
        } catch (ReflectiveOperationException | RuntimeException failure) {
            return false;
        }
    }

    public static Object clipTabs(Object stock) {
        return clipTabs(stock, null);
    }

    public static Object clipTabs(Object stock, Bundle arguments) {
        if (!Settings.isEnabled("hide_clips") || Settings.isEnabled("hide_clips_keep_channel") ||
                !(stock instanceof List)) return stock;
        // The profile pager also hosts explicitly opened clips. Its caller selects CLIPS for
        // these argument values, so retain the full tab list in that context.
        if (arguments != null && (arguments.getString("clipId") != null ||
                "clips_content".equals(arguments.getString("contentType")) ||
                "CLIPS".equalsIgnoreCase(arguments.getString("profileScope")))) return stock;
        List<?> tabs = (List<?>) stock;
        List<Object> kept = new ArrayList<>();
        for (Object tab : tabs) {
            if (!(tab instanceof Enum)) return stock;
            String name = ((Enum<?>) tab).name();
            if (!"CLIPS".equals(name) && !"Clips".equals(name)) kept.add(tab);
        }
        if (kept.size() == tabs.size() || kept.isEmpty()) return stock;
        try {
            // Kotlin's marker interface is supplied by Twitch, so the extension carries no copy
            // of its stdlib. Both the pager and tab bar receive this same immutable filtered list.
            Class<?> entries = Class.forName("kotlin.enums.EnumEntries", false, stock.getClass().getClassLoader());
            if (!entries.isInstance(stock)) return stock;
            List<?> immutable = Collections.unmodifiableList(kept);
            return Proxy.newProxyInstance(entries.getClassLoader(), new Class<?>[]{entries}, (proxy, method, args) -> {
                try { return method.invoke(immutable, args); }
                catch (InvocationTargetException failure) { throw failure.getCause(); }
            });
        } catch (ReflectiveOperationException | RuntimeException failure) {
            return stock;
        }
    }
}
