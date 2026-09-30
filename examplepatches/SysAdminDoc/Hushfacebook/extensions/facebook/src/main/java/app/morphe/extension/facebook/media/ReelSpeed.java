/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import android.os.SystemClock;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Keep the reel speed: the playback speed picked in a reel's menu stays for the next reels.
 *
 * <p>The Reels menu offers its speeds in two pickers, and a pick in either sets the speed on the
 * reel's own FbGrootPlayer and shows Facebook's speed toast a moment later; nothing else shows that
 * toast. Facebook remembers a speed per video, so the next reel's player starts at normal speed.
 * The patch hands this class every speed set on a player ({@link #speedSet}), the toast's speed
 * ({@link #picked}) and each start of playback ({@link #started}).
 *
 * <p>A picked speed is kept for the viewer the reel was playing in, its PlayerOrigin's origin:
 * fb_shorts_viewer for the Reels viewer, video_home where an account's Reels live in the Video
 * tab, fb_shorts_native_in_feed_unit for reels in the feed, and so on. A pick in one viewer never
 * changes another's. When a player of that viewer starts a video it hasn't started since the pick,
 * which it tells by the VideoPlayerParams object each video brings, the speed goes on if the video
 * is a reel (isFbShorts) that isn't an ad (isSponsored) or live (isLiveNow): Facebook's menu may
 * not offer a speed on an ad, a live video sped up runs into its live edge, and other videos keep
 * Facebook's speed. A reel that started before the pick, such as the next one Facebook readies in
 * advance, gets it when it starts again. A reel paused and started again after that, a reel held at
 * 2x and anything else set on the reel you're watching stay as they are until the next reel.
 * Picking normal speed goes back to Facebook's reset for that viewer. The speeds live in memory
 * only, so they're gone when Facebook restarts, and nothing is kept or applied while the switch is
 * off, Hushfacebook is paused, the settings aren't ready, or anything here fails.
 */
public final class ReelSpeed {
    static final float NORMAL = 1f;

    /** Two speeds this close are the same one, as Facebook's own speed toast and cache compare them. */
    static final float SAME = 0.01f;

    /** How long after a player's speed changed the toast still names that change. Facebook waits 150 ms. */
    static final long PICK_WINDOW_MS = 2000;

    /** Counted under the patch's name for each reel started at the kept speed. */
    static final String APPLIED = "reel started at the kept speed";

    private static final String FAMILY = FamilyNames.KEEP_REEL_SPEED;

    /** What this class reads from a player and does to it. {@link #PATCHED} is the patch's; tests stand in. */
    interface Player {
        /** Sets the player's speed through Facebook's own setter. */
        void setSpeed(Object player, float speed);

        /** The player's PlayerOrigin, or null when there's none or the patch didn't fill it in. */
        @Nullable
        Object origin(Object player);

        /** The player's VideoPlayerParams, one object per video it binds, or null before the first. */
        @Nullable
        Object params(Object player);

        /** Whether [params]' video is a reel, by its isFbShorts. */
        boolean reel(Object params);

        /** Whether [params]' video is an ad, by its isSponsored. */
        boolean ad(Object params);

        /** Whether [params]' video is live now, by its isLiveNow. */
        boolean live(Object params);
    }

    static final Player PATCHED = new Player() {
        @Override
        public void setSpeed(Object player, float speed) {
            setPlayerSpeed(player, speed);
        }

        @Override
        public Object origin(Object player) {
            return playerOrigin(player);
        }

        @Override
        public Object params(Object player) {
            return playerParams(player);
        }

        @Override
        public boolean reel(Object params) {
            return fbShorts(params);
        }

        @Override
        public boolean ad(Object params) {
            return sponsored(params);
        }

        @Override
        public boolean live(Object params) {
            return liveNow(params);
        }
    };

    static volatile Player access = PATCHED;

    private static final Object LOCK = new Object();

    /** The speed kept for each viewer, by its origin. */
    private static final Map<String, Float> KEPT = new HashMap<>();

    /** The params each player last started with a speed kept for its viewer, weakly. Players don't override equals. */
    private static final Map<Object, WeakReference<Object>> HANDLED = new WeakHashMap<>();

    @Nullable
    private static WeakReference<Object> lastSetPlayer;
    private static float lastSetSpeed = NORMAL;
    private static long lastSetAt = Long.MIN_VALUE;

    /** The player that last started playing, weakly: the reel on screen when its menu opens. */
    @Nullable
    private static WeakReference<Object> lastStartedPlayer;

    private ReelSpeed() {
    }

    // ------------------------------------------------------------------ what the patch fills in

    /** Filled in by the patch: FbGrootPlayer's speed setter. Only a player may be passed. */
    public static void setPlayerSpeed(Object player, float speed) {
    }

    /** Filled in by the patch: FbGrootPlayer's PlayerOrigin getter. Only a player may be passed. */
    @Nullable
    public static Object playerOrigin(Object player) {
        return null;
    }

    /** Filled in by the patch: FbGrootPlayer's VideoPlayerParams getter. Only a player may be passed. */
    @Nullable
    public static Object playerParams(Object player) {
        return null;
    }

    /** Filled in by the patch: the field VideoPlayerParams' debug dump reports as isFbShorts. Only params may be passed. */
    public static boolean fbShorts(Object params) {
        return false;
    }

    /** Filled in by the patch: the field the params' debug dump reports as isSponsored. Only params may be passed. */
    public static boolean sponsored(Object params) {
        return false;
    }

    /** Filled in by the patch: the field the params' debug dump reports as isLiveNow. Only params may be passed. */
    public static boolean liveNow(Object params) {
        return false;
    }

    // ------------------------------------------------------------------ hooks

    /**
     * The hook, first thing in FbGrootPlayer's speed setter, whoever calls it. With debug logging on,
     * it logs the speed the player really gets, whatever its menu shows.
     */
    public static void speedSet(Object player, float speed) {
        try {
            HookStatus.invoked(FAMILY);
            if (player == null || !on()) return;
            synchronized (LOCK) {
                lastSetPlayer = new WeakReference<>(player);
                lastSetSpeed = speed;
                lastSetAt = SystemClock.uptimeMillis();
            }
            Logger.printDebug(() -> "Reel speed: a player in " + viewerForLog(player) + " set to " + speed + "x");
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "speed set", failure);
        }
    }

    /**
     * The hook, first thing in the Reels menu's speed toast, which follows a pick. Keeps [speed] for
     * the viewer of the player the pick just set it on; normal speed forgets that viewer's speed.
     */
    public static void picked(float speed) {
        try {
            HookStatus.invoked(FAMILY);
            if (!on()) return;
            HookStatus.bound(FAMILY, "speed picked");
            Object player = pickedPlayer(speed, SystemClock.uptimeMillis());
            String origin = player == null ? null : originName(player);
            if (origin == null) {
                if (same(speed, NORMAL)) {
                    // Normal picked on a reel already at normal sets nothing, so no player names the
                    // viewer. The reel on screen is the one that started last: only its viewer forgets.
                    Object onScreen;
                    synchronized (LOCK) {
                        onScreen = lastStartedPlayer == null ? null : lastStartedPlayer.get();
                    }
                    String viewer = onScreen == null ? null : originName(onScreen);
                    if (viewer != null) {
                        synchronized (LOCK) {
                            KEPT.remove(viewer);
                        }
                    }
                    Logger.printDebug(() -> viewer != null
                            ? "Reel speed: normal speed picked, reels in " + viewer + " start as Facebook starts them"
                            : "Reel speed: normal speed picked, but no reel is known to be on screen; kept speeds stay");
                } else {
                    Logger.printDebug(() -> "Reel speed: " + speed + "x picked, but no reel player took it");
                }
                return;
            }
            Object params = access.params(player);
            synchronized (LOCK) {
                if (same(speed, NORMAL)) {
                    KEPT.remove(origin);
                } else {
                    KEPT.put(origin, speed);
                }
                // The reel picked on already plays at the speed.
                if (params != null) HANDLED.put(player, new WeakReference<>(params));
            }
            Logger.printDebug(() -> same(speed, NORMAL)
                    ? "Reel speed: normal speed picked, reels in " + origin + " start as Facebook starts them"
                    : "Reel speed: keeping " + speed + "x for " + origin);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "speed picked", failure);
        }
    }

    /**
     * The hook, first thing in FbGrootPlayer's maybeTrackVideoStart, which runs once the player has
     * started playing. The first start of each video after a pick in the player's viewer gets the
     * kept speed when the video is a reel that's neither an ad nor live.
     */
    public static void started(Object player) {
        try {
            HookStatus.invoked(FAMILY);
            if (player == null || !on()) return;
            String origin = originName(player);
            Float kept;
            synchronized (LOCK) {
                lastStartedPlayer = new WeakReference<>(player);
                kept = origin == null ? null : KEPT.get(origin);
            }
            // Nothing kept for this viewer yet: a later start of the same video can still get a pick.
            if (kept == null) return;
            Object params = access.params(player);
            if (params == null) return;
            synchronized (LOCK) {
                WeakReference<Object> handled = HANDLED.get(player);
                if (handled != null && handled.get() == params) return;
                HANDLED.put(player, new WeakReference<>(params));
            }
            float speed = kept;
            String skip = !access.reel(params) ? "not a reel" : access.ad(params) ? "an ad" : access.live(params) ? "live" : null;
            if (skip != null) {
                Logger.printDebug(() -> "Reel speed: a video in " + origin + " started at Facebook's speed, it's " + skip);
                return;
            }
            HookStatus.bound(FAMILY, "player start");
            access.setSpeed(player, speed);
            HookStatus.counted(FAMILY, APPLIED);
            Logger.printDebug(() -> "Reel speed: a reel in " + origin + " started, set to the kept " + speed + "x");
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "player start", failure);
        }
    }

    // ------------------------------------------------------------------ the rule

    private static boolean on() {
        return Utils.settingsReady() && Settings.KEEP_REEL_SPEED.get();
    }

    private static boolean same(float a, float b) {
        return Math.abs(a - b) < SAME;
    }

    /** The player a pick of [speed] at [now] set its speed on, or null when none did just before. */
    @Nullable
    static Object pickedPlayer(float speed, long now) {
        synchronized (LOCK) {
            Object player = lastSetPlayer == null ? null : lastSetPlayer.get();
            if (player == null || !same(lastSetSpeed, speed) || now < lastSetAt || now - lastSetAt > PICK_WINDOW_MS) {
                return null;
            }
            return player;
        }
    }

    /**
     * The viewer a player plays in: its PlayerOrigin's origin, what its toString() writes before
     * "::" (the part after names where in the viewer it started, which can differ from reel to reel).
     */
    @Nullable
    static String originName(Object player) {
        Object origin = access.origin(player);
        if (origin == null) return null;
        String name = origin.toString();
        int cut = name.indexOf("::");
        name = cut < 0 ? name : name.substring(0, cut);
        return name.isEmpty() ? null : name;
    }

    /** [player]'s viewer for a log line. Facebook's getter throws before the player's first bind. */
    private static String viewerForLog(Object player) {
        try {
            String origin = originName(player);
            return origin == null ? "no viewer" : origin;
        } catch (Throwable failure) {
            return "no viewer yet";
        }
    }

    /** The speed kept for [origin], or {@link #NORMAL} when none is. For tests. */
    static float kept(String origin) {
        synchronized (LOCK) {
            Float kept = KEPT.get(origin);
            return kept == null ? NORMAL : kept;
        }
    }

    /** Forgets every kept speed, the last speed set and every started video. For tests. */
    static void forget() {
        synchronized (LOCK) {
            lastSetPlayer = null;
            lastSetSpeed = NORMAL;
            lastSetAt = Long.MIN_VALUE;
            lastStartedPlayer = null;
            KEPT.clear();
            HANDLED.clear();
        }
        access = PATCHED;
    }
}
