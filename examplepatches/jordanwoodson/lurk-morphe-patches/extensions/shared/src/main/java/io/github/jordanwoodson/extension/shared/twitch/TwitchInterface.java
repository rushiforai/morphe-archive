package io.github.jordanwoodson.extension.shared.twitch;

import android.os.Bundle;
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

    public static boolean bitsVisible(boolean stock) {
        return stock && !Settings.isEnabled("hide_tipping");
    }

    /** A subscription upsell flag (the chat header's Upgrade button), off while Hide subscription upsells is on. */
    public static boolean subscriptionUpsellVisible(boolean stock) {
        return stock && !Settings.isEnabled("hide_subscription_upsells");
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
        if (!Settings.isEnabled("hide_clips") || !(stock instanceof List)) return stock;
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
