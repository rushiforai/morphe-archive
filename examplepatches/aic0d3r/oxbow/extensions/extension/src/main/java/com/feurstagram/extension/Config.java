package com.feurstagram.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;
import android.view.Window;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

/**
 * Runtime configuration backed by SharedPreferences ("feurstagram_prefs").
 *
 * Independent block toggles (feed, explore, reels, stories, instants, notes,
 * suggested, ads) plus the permanent "hardcore" lock. The application Context
 * is resolved reflectively so no patched class needs to hand us one.
 */
public final class Config {

    private static final String PREFS = "feurstagram_prefs";

    /**
     * Set once any setting changes in this process. While true, leaving the
     * settings page forces a clean restart instead of returning to a stale UI.
     * Cleared implicitly on every process start.
     */
    private static boolean sNeedsRestart;

    /**
     * Snapshot of every block_* toggle captured when the settings page opens.
     * The permanent lock only freezes surfaces that were already blocked at this
     * snapshot, so a mis-toggle made during the current session can still be
     * undone until Done restarts the app. Null until captureBaseline() runs.
     */
    private static HashMap<String, Boolean> sBaseline;

    private Config() {}

    /** Resolve the process Application context via ActivityThread, or null. */
    public static Context getAppContext() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Object app = activityThread.getMethod("currentApplication").invoke(null);
            return (Context) app;
        } catch (Throwable t) {
            return null;
        }
    }

    private static SharedPreferences prefs() {
        Context context = getAppContext();
        return context == null ? null : context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    public static boolean getBlocked(String key, boolean defaultValue) {
        SharedPreferences prefs = prefs();
        return prefs == null ? defaultValue : prefs.getBoolean(key, defaultValue);
    }

    public static void setBlocked(String key, boolean value) {
        // Hardcore lock only forbids *revealing* a surface. Hiding one is always
        // allowed so users can still tighten. A surface may be revealed only when
        // it was already visible at the start of the current settings session
        // (undo of a mis-toggle); one hidden at session open stays frozen until a
        // reinstall.
        if (isHardcoreMode()
                && isLockable(key)
                && !hidesSurface(key, value)
                && wasHiddenAtBaseline(key)) {
            return;
        }
        // The cooldown lock turns the same loosening into a request that waits.
        if (needsCooldown(key, value)) {
            startCooldown(key);
            return;
        }
        SharedPreferences prefs = prefs();
        if (prefs == null) return;
        prefs.edit().putBoolean(key, value).apply();
    }

    /**
     * Toggles the permanent lock can freeze: the content blocks ({@link #BLOCK_KEYS}), the
     * navigation-bar icons and "Following feed only". The nav icons are cosmetic, but hiding
     * one is how people cut off a surface they keep falling back into (the Direct tab's
     * search behaves like Explore), so leaving them freely re-enabled defeated the lock —
     * issue #93. "Following feed only" counts too: it is what keeps the ranked feed away for
     * people who keep the feed itself — issue #150.
     */
    public static boolean isLockable(String key) {
        if (key == null) return false;
        if (key.startsWith("nav_show_") || "limit_following_feed".equals(key)) return true;
        for (String blockKey : BLOCK_KEYS) {
            if (blockKey.equals(key)) return true;
        }
        return false;
    }

    /**
     * Whether this value leaves the surface hidden. The two families store
     * opposite polarities: {@code block_*} (and {@code limit_following_feed}, which
     * hides the ranked feed) is true when hidden, {@code nav_show_*} is true when
     * shown.
     */
    public static boolean hidesSurface(String key, boolean value) {
        if (key == null) return false;
        return key.startsWith("nav_show_") ? !value : value;
    }

    public static boolean isHardcoreMode() {
        return getBlocked("hardcore_mode", false);
    }

    public static void enableHardcoreMode() {
        SharedPreferences prefs = prefs();
        if (prefs == null) return;
        prefs.edit().putBoolean("hardcore_mode", true).apply();
    }

    // --- Cooldown lock: a softer, time-delayed alternative to the permanent lock ---

    public static final int[] COOLDOWN_HOURS = {1, 6, 24, 48, 72};
    private static final String PENDING = "pending_";

    /** Whether the cooldown was already on when the settings page opened (see captureBaseline). */
    private static boolean sCooldownOnAtOpen;

    /** Off by default. The permanent lock wins when both are on. */
    public static boolean isCooldownEnabled() { return getBlocked("cooldown_enabled", false); }

    public static int getCooldownHours() {
        SharedPreferences prefs = prefs();
        return prefs == null ? 24 : prefs.getInt("cooldown_hours", 24);
    }

    public static void setCooldownHours(int hours) {
        SharedPreferences prefs = prefs();
        if (prefs != null) prefs.edit().putInt("cooldown_hours", hours).apply();
    }

    /**
     * The cooldown's own switch and length stay fixed in a session that opened with it on, or it
     * would be a way around itself. Switched on in the current session, both can still be changed.
     */
    public static boolean isCooldownSticky() { return isCooldownEnabled() && sCooldownOnAtOpen; }

    /** Loosening a lockable surface that was hidden when settings opened waits instead. */
    public static boolean needsCooldown(String key, boolean value) {
        return !isHardcoreMode() && isCooldownEnabled() && isLockable(key)
                && !hidesSurface(key, value) && wasHiddenAtBaseline(key);
    }

    /**
     * Stored per key as "elapsedRealtime|wall clock|duration ms|boot count", so it survives restarts
     * length is fixed when the request is made. No-op if the key is already waiting.
     */
    public static void startCooldown(String key) {
        SharedPreferences prefs = prefs();
        if (prefs == null || prefs.contains(PENDING + key)) return;
        prefs.edit().putString(PENDING + key, SystemClock.elapsedRealtime() + "|" + System.currentTimeMillis()
                + "|" + getCooldownHours() * 3_600_000L + "|" + bootCount()).apply();
    }

    /** Boots since the device was made, or -1 when Android won't say (it needs API 24). */
    private static int bootCount() {
        Context context = getAppContext();
        if (context == null) return -1;
        try {
            return android.provider.Settings.Global.getInt(context.getContentResolver(),
                    android.provider.Settings.Global.BOOT_COUNT);
        } catch (Throwable t) {
            return -1;
        }
    }

    public static void cancelCooldown(String key) {
        SharedPreferences prefs = prefs();
        if (prefs != null) prefs.edit().remove(PENDING + key).apply();
    }

    /** Keys with a pending request, in a stable order; a lapsed one is dropped on the way. */
    public static java.util.List<String> pendingKeys() {
        java.util.List<String> keys = new java.util.ArrayList<>();
        SharedPreferences prefs = prefs();
        if (prefs != null) {
            for (String k : prefs.getAll().keySet()) {
                if (k.startsWith(PENDING) && cooldownLeft(k.substring(PENDING.length())) >= 0) {
                    keys.add(k.substring(PENDING.length()));
                }
            }
        }
        java.util.Collections.sort(keys);
        return keys;
    }

    /**
     * Milliseconds left for a pending key (0 = ready), or -1 when none is pending or the request
     * lapsed: a ready one stays applicable for as long as its wait was, and is then dropped.
     */
    public static long cooldownLeft(String key) {
        SharedPreferences prefs = prefs();
        String stored = prefs == null ? null : prefs.getString(PENDING + key, null);
        if (stored == null) return -1;
        long left = cooldownLeft(stored, SystemClock.elapsedRealtime(), System.currentTimeMillis(), bootCount());
        if (left < 0 && prefs != null) prefs.edit().remove(PENDING + key).apply();
        return left;
    }

    /**
     * {@link #cooldownLeft(String)} over one stored entry, clocks passed in so it runs on a plain JVM.
     * Within the boot the request was made in, elapsedRealtime alone counts the wait. shortcut:
     * across a reboot only the wall clock spans it, so setting that forward skips the wait; the
     * boot count is what stops the restarted elapsed clock from un-counting the wait. Entries from
     * before the boot count was stored keep that older three-field heuristic.
     */
    static long cooldownLeft(String stored, long elapsed, long wall, int boot) {
        try {
            String[] p = stored.split("\\|");
            long sinceBoot = Long.parseLong(p[0]);
            long started = Long.parseLong(p[1]);
            long duration = Long.parseLong(p[2]);
            long passed;
            if (p.length > 3 && boot >= 0) {
                passed = Integer.parseInt(p[3]) == boot ? elapsed - sinceBoot : Math.max(0, wall - started);
            } else {
                passed = elapsed >= sinceBoot ? elapsed - sinceBoot : Math.max(0, wall - started);
            }
            if (passed >= duration * 2) return -1; // lapsed: it was ready for as long as its wait was
            return Math.max(0, duration - passed);
        } catch (RuntimeException e) {
            return Integer.MAX_VALUE; // unreadable: never ready, can still be cancelled
        }
    }

    /** Applies a request whose wait is over. False while it is still waiting. */
    public static boolean applyCooldown(String key) {
        if (isHardcoreMode() || cooldownLeft(key) != 0) return false; // the permanent lock wins
        SharedPreferences prefs = prefs();
        if (prefs == null) return false;
        // Loosened: block_* off, nav_show_* on, and the cooldown itself off.
        prefs.edit().putBoolean(key, key.startsWith("nav_show_")).remove(PENDING + key).apply();
        setNeedsRestart();
        return true;
    }

    /** Whether to check GitHub for a newer release on launch. On by default. */
    public static boolean isAutoUpdateEnabled() {
        return getBlocked("auto_update", true);
    }

    /**
     * Whether Instagram's window is pinned to SDR (COLOR_MODE_DEFAULT) instead of
     * the HDR mode Instagram forces on some accounts. On by default: the HDR
     * window mode only lifts the black floor of the dark UI (washed-out fond) with
     * no visible benefit. Not a block_* surface, so the permanent lock ignores it.
     */
    public static boolean isForceSdr() { return getBlocked("force_sdr", true); }

    /**
     * Whether the home feed is restricted to accounts you follow (chronological
     * "Following" feed) instead of the recommended feed. Off by default. The
     * permanent lock freezes it once it is on (see {@link #isLockable}).
     */
    public static boolean isFollowingFeedOnly() {
        return getBlocked("limit_following_feed", false);
    }

    // --- Oxbow: keep, privacy and scroll toggles ---

    /** Download row in post, reel, story and highlight menus; long-press avatar for the HD picture. */
    public static boolean isDownloadEnabled() { return getBlocked("download_enabled", true); }
    /** "Copy caption" row beside Download in post and reel menus. */
    public static boolean isCopyCaptionEnabled() { return getBlocked("copy_caption", true); }
    /** Downloading a carousel post saves every slide, not just the one on screen. */
    public static boolean isDownloadAllSlides() { return getBlocked("download_all_slides", false); }
    /** Ghost mode: stories you watch are not reported as seen. */
    public static boolean isStorySeenHidden() { return getBlocked("ghost_story_seen", false); }
    /** Ghost mode: opening a chat does not send a read receipt. */
    public static boolean isDmSeenHidden() { return getBlocked("ghost_dm_seen", false); }
    /** Ghost mode: typing in a chat does not show "typing…" to the other side. */
    public static boolean isTypingHidden() { return getBlocked("ghost_typing", false); }
    /**
     * Ghost mode: screenshots of disappearing photos and videos never reach the chat, so the
     * sender isn't told. Asked from Instagram's screenshot detectors; fails open (stock) on error.
     */
    public static boolean isScreenshotHidden() {
        try {
            return getBlocked("ghost_screenshot", false);
        } catch (Throwable ignored) {
            return false;
        }
    }
    /** Long-pressing New message in the inbox flips the Ghost switches together. */
    public static boolean isGhostShortcut() { return getBlocked("ghost_shortcut", true); }

    /**
     * Message ids Instagram reported as seen while Ghost mode held the receipt back. The inbox is
     * rebuilt from the server, which never learns about them, so without this a chat you read comes
     * back bold after a sync or a restart. shortcut: no eviction order, the whole set is dropped
     * past {@link #SEEN_ITEM_LIMIT}; version bump if a session ever needs more ids than that.
     */
    private static final String SEEN_ITEMS = "ghost_seen_items";
    private static final int SEEN_ITEM_LIMIT = 500;
    private static final Object SEEN_LOCK = new Object();

    /** Remember a message id as read on this phone (called where Ghost mode queues a receipt). */
    public static void rememberSeenItem(String messageId) {
        if (messageId == null || messageId.isEmpty()) return;
        synchronized (SEEN_LOCK) {
            SharedPreferences prefs = prefs();
            if (prefs == null) return;
            Set<String> seen = new HashSet<>(prefs.getStringSet(SEEN_ITEMS, Collections.emptySet()));
            if (!seen.add(messageId)) return;
            if (seen.size() > SEEN_ITEM_LIMIT) seen.clear();
            prefs.edit().putStringSet(SEEN_ITEMS, seen).apply();
        }
    }

    /** Whether Ghost mode kept this message's receipt back and it was read on this phone. */
    public static boolean isItemSeen(String messageId) {
        if (messageId == null || !isDmSeenHidden()) return false;
        synchronized (SEEN_LOCK) {
            SharedPreferences prefs = prefs();
            return prefs != null && prefs.getStringSet(SEEN_ITEMS, Collections.emptySet()).contains(messageId);
        }
    }

    /** Any Ghost switch on turns all off, otherwise all on. Returns the new state. */
    public static boolean toggleGhostMode() {
        SharedPreferences prefs = prefs();
        if (prefs == null) return false;
        boolean on = !(isStorySeenHidden() || isDmSeenHidden() || isTypingHidden() || isScreenshotHidden());
        prefs.edit().putBoolean("ghost_story_seen", on).putBoolean("ghost_dm_seen", on)
                .putBoolean("ghost_typing", on).putBoolean("ghost_screenshot", on).apply();
        return on;
    }

    /** Copied and shared links lose Instagram's tracking parameters (igsh, utm_*...). */
    public static boolean isCleanLinks() { return getBlocked("clean_links", true); }
    /** Comments: no comment buttons, no comment sheets. Lockable like every block_*. */
    public static boolean isCommentsBlocked() { return getBlocked("block_comments", false); }

    /** WindowManager.LayoutParams.FLAG_SECURE: the window shows black in screenshots and recordings. */
    private static final int FLAG_SECURE = 0x2000;

    /**
     * Asked when Instagram is about to mark a window secure (Hide screenshots). True leaves the
     * window capturable. A failed switch read keeps stock behaviour; this never throws.
     */
    public static boolean liftScreenshotBlock() { return isScreenshotHidden(); }

    /** Stand-in for Window.setFlags: with Hide screenshots on, FLAG_SECURE never turns on. */
    public static void setFlags(Window window, int flags, int mask) {
        if ((flags & mask & FLAG_SECURE) != 0 && isScreenshotHidden()) {
            flags &= ~FLAG_SECURE;
            mask &= ~FLAG_SECURE;
        }
        window.setFlags(flags, mask);
    }

    /** Stand-in for Window.addFlags: with Hide screenshots on, FLAG_SECURE stays off. */
    public static void addFlags(Window window, int flags) {
        if ((flags & FLAG_SECURE) != 0 && isScreenshotHidden()) flags &= ~FLAG_SECURE;
        window.addFlags(flags);
    }
    /**
     * Endless scrolling outside the (blocked) feed and Reels tab: swiping to the next reel in
     * any reel viewer, and the "more like this" feeds under a search/explore result.
     */
    public static boolean isEndlessScrollBlocked() { return getBlocked("block_endless_scroll", true); }
    /**
     * Story viewer: the swipe-up gesture does nothing. No reply bar, no quick reactions,
     * no keyboard — the accidental swipe instead of left/right stays a no-op. Swipe-down
     * to dismiss and taps keep working.
     */
    public static boolean isStorySwipeUpBlocked() { return getBlocked("block_story_swipe_up", true); }

    /** Every block_* surface toggle, in the settings page's display order. A toggle here is lockable and snapshotted by {@link #captureBaseline()}. */
    public static final String[] BLOCK_KEYS = {
            "block_feed", "block_explore", "block_reels", "block_friends_lane", "block_stories",
            "block_instants", "block_notes", "block_suggested", "block_ads", "block_meta_ai", "block_notifications",
            "block_comments", "block_endless_scroll", "block_story_swipe_up",
    };

    /** Whether a surface is hidden, with that key's own default. */
    public static boolean isSurfaceHidden(String key) {
        switch (key) {
            case "block_feed": return isFeedBlocked();
            case "block_explore": return isExploreBlocked();
            case "block_reels": return isReelsBlocked();
            case "block_friends_lane": return isFriendsLaneBlocked();
            case "block_stories": return isStoriesBlocked();
            case "block_instants": return isInstantsBlocked();
            case "block_notes": return isNotesBlocked();
            case "block_suggested": return isSuggestedBlocked();
            case "block_ads": return isAdsBlocked();
            case "block_meta_ai": return isMetaAiBlocked();
            case "block_notifications": return isNotificationsButtonBlocked();
            case "block_comments": return isCommentsBlocked();
            case "block_endless_scroll": return isEndlessScrollBlocked();
            case "block_story_swipe_up": return isStorySwipeUpBlocked();
            default: return getBlocked(key, false);
        }
    }

    public static boolean isFeedBlocked()      { return getBlocked("block_feed", true); }
    public static boolean isExploreBlocked()   { return getBlocked("block_explore", true); }
    public static boolean isReelsBlocked()     { return getBlocked("block_reels", true); }
    /**
     * Whether the "Friends" tab and its avatar facepile are hidden from the Reels
     * viewer's header. On by default: Instagram gates that entry point behind a
     * server flag ({@code friends_lane_floating_pogs_entrypoint_enabled}) only
     * reachable from an internal developer menu, so the only way out is to drop
     * it from the view tree — issue #94.
     */
    public static boolean isFriendsLaneBlocked() { return getBlocked("block_friends_lane", true); }
    public static boolean isStoriesBlocked()   { return getBlocked("block_stories", false); }
    public static boolean isInstantsBlocked()  { return getBlocked("block_instants", true); }
    public static boolean isNotesBlocked()     { return getBlocked("block_notes", true); }
    public static boolean isSuggestedBlocked() { return getBlocked("block_suggested", true); }
    public static boolean isAdsBlocked()       { return getBlocked("block_ads", true); }
    /** Meta AI and Muse: share-sheet target, promo cards, Vibes / Meta AI / Imagine feed units. */
    public static boolean isMetaAiBlocked()    { return getBlocked("block_meta_ai", true); }

    /**
     * Whether the notifications ("heart") button in the feed header is hidden.
     * Off by default: it's an opt-in distraction cut, and people expect their
     * notifications entry-point to still be there after an update.
     */
    public static boolean isNotificationsButtonBlocked() { return getBlocked("block_notifications", false); }

    /**
     * Whether Instagram's popups (its own toasts: "Couldn't refresh feed",
     * "Impossible d'actualiser le fil", ...) are dropped. On by default: blocking
     * a surface makes Instagram see a failed request and raise one every time, so
     * they are noise the mod creates itself. All of them go, not just the errors —
     * see {@link Toasts}. Deliberately not a {@code block_*} key: it is not a
     * content surface, so the permanent lock must not freeze it.
     */
    public static boolean arePopupsHidden() { return getBlocked("hide_toasts", true); }

    /**
     * Bottom-navigation icon visibility, stored per tab as {@code nav_show_<tab>}
     * (true = shown). Independent of the content blocks, so hiding the Reels
     * *icon* is decoupled from blocking Reels *content*. Home is deliberately not
     * configurable: long-pressing it is the only Settings entry point, so it must
     * stay present and tappable. Reels defaults to hidden to preserve the previous
     * behaviour (blocking reels used to also hide the tab).
     */
    public static boolean isReelsTabShown() { return getBlocked("nav_show_reels", false); }

    /**
     * Whether the first-run coach mark (long-press Home to open settings) has
     * already been shown on this installation. Set once, never cleared: the guide
     * is a one-time thing, not a setting.
     */
    public static boolean isOnboardingDone() { return getBlocked("onboarding_done", false); }

    public static void setOnboardingDone() { setBlocked("onboarding_done", true); }

    /** Navigation-bar icons, with the default the getters use (true = shown). */
    private static final String[] NAV_KEYS = {
            "nav_show_home", "nav_show_search", "nav_show_reels", "nav_show_create",
            "nav_show_direct", "nav_show_profile",
    };

    /**
     * Long-pressing Home or Messages opens the settings, so at least one of them must stay
     * in the bar: true when this change would hide the last one whose button this window has.
     */
    public static boolean wouldLockOutSettings(String key, boolean value) {
        if (value) return false;
        if ("nav_show_home".equals(key)) return !isNavTabShown("nav_show_direct") || !HomeTabWatcher.hasDirectTab();
        if ("nav_show_direct".equals(key)) return !isNavTabShown("nav_show_home");
        return false;
    }

    /** Only Reels defaults to hidden; see {@link #isReelsTabShown()}. */
    public static boolean navDefault(String key) {
        return !"nav_show_reels".equals(key);
    }

    /** Whether the bottom-bar icon for a {@code nav_show_*} key is currently shown. */
    public static boolean isNavTabShown(String navKey) {
        return getBlocked(navKey, navDefault(navKey));
    }

    /**
     * The {@code nav_show_*} key whose icon a landing page rides on, or null for
     * "home" (whose tab is never configurable) and for anything unrecognised.
     */
    public static String navKeyForLanding(String landing) {
        if ("home".equals(landing)) return "nav_show_home";
        if ("search".equals(landing)) return "nav_show_search";
        if ("direct".equals(landing)) return "nav_show_direct";
        if ("profile".equals(landing)) return "nav_show_profile";
        return null;
    }

    /**
     * Whether a surface may be used as the landing page. Landing on a tab that was
     * hidden from the bottom bar would hand back the very surface the user removed —
     * and under the permanent lock it was a way around a frozen toggle, since the
     * landing picker was never locked (issue #116). So a hidden tab is not a
     * candidate, lock or no lock.
     */
    public static boolean isLandingAvailable(String landing) {
        String navKey = navKeyForLanding(landing);
        return navKey == null || isNavTabShown(navKey);
    }

    /** Snapshot every lockable toggle's current value for the permanent lock. */
    public static void captureBaseline() {
        HashMap<String, Boolean> baseline = new HashMap<>();
        for (String key : BLOCK_KEYS) baseline.put(key, isSurfaceHidden(key));
        baseline.put("limit_following_feed", isFollowingFeedOnly());
        for (String key : NAV_KEYS) {
            baseline.put(key, getBlocked(key, navDefault(key)));
        }
        sBaseline = baseline;
        sCooldownOnAtOpen = isCooldownEnabled();
    }

    /**
     * True if the given key's surface was already hidden at the start of the
     * current settings session. Falls back to the live persisted value when no
     * baseline was captured (calls outside the settings page).
     */
    public static boolean wasHiddenAtBaseline(String key) {
        Boolean captured = sBaseline == null ? null : sBaseline.get(key);
        boolean value = captured != null ? captured : getBlocked(key, lockableDefault(key));
        return hidesSurface(key, value);
    }

    /**
     * Default for a lockable key, used only when no baseline was captured (a write
     * from outside the settings page). block_* falls back to false — "not blocked
     * at baseline" — which errs on the permissive side rather than freezing a
     * surface the user never locked.
     */
    private static boolean lockableDefault(String key) {
        if (key == null) return false;
        if (key.startsWith("nav_show_")) return navDefault(key);
        return false;
    }

    /**
     * The surface the app should jump to on cold start: one of "home" (default),
     * "search", "direct", "profile".
     */
    public static String getLandingPage() {
        SharedPreferences prefs = prefs();
        String stored = prefs == null ? "home" : prefs.getString("landing_page", "home");
        // The stored choice is kept as-is so re-showing the tab restores it, but a
        // landing page whose tab is hidden right now falls back to the home feed.
        if (isLandingAvailable(stored)) return stored;
        // Oxbow: with Home hidden, Messages is always shown (see wouldLockOutSettings).
        return isNavTabShown("nav_show_home") ? "home" : "direct";
    }

    public static void setLandingPage(String value) {
        if (!isLandingAvailable(value)) return;
        SharedPreferences prefs = prefs();
        if (prefs == null) return;
        prefs.edit().putString("landing_page", value).apply();
    }

    /**
     * The app version whose release notes have already been shown, or null on a
     * fresh install. Compared against the installed version on launch so the
     * "What's new" card appears exactly once after an update.
     */
    public static String getLastSeenVersion() {
        SharedPreferences prefs = prefs();
        return prefs == null ? null : prefs.getString("last_seen_version", null);
    }

    public static void setLastSeenVersion(String value) {
        SharedPreferences prefs = prefs();
        if (prefs == null || value == null) return;
        prefs.edit().putString("last_seen_version", value).apply();
    }

    public static void setNeedsRestart() { sNeedsRestart = true; }

    public static boolean isRestartPending() { return sNeedsRestart; }
}
