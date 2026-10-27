/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.function.ToLongFunction;

import app.morphe.extension.facebook.download.PostDetails;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Puts the newest reels Facebook has loaded first in the Reels tab, for Newest reels first (#134).
 *
 * <p>The Reels tab is ranked on the phone. Facebook loads a pool of reels, and each time it places
 * the next one it reranks what's left of the pool and takes the first. The ranking signal it builds
 * for each reel carries no posting time, but the reel's own model does: the edge's {@code node} is
 * the reel's story, and its {@code creation_time} is when it was posted, in seconds. So the patch
 * hands each new signal here with its model's feed type and edge, and a reel from one of the Reels
 * feeds has its posting time kept by its signal. At the end of every rerank the list comes here,
 * and the reels with a time are put in their own slots newest first. Anything without one, such as
 * an item Facebook drops in for what you just did, keeps its place. Ties keep Facebook's order.
 *
 * <p>Only reels already loaded can move, so this is the newest of what Facebook picked for you,
 * never the newest on Facebook. Off, paused, before the settings are ready, or when anything here
 * fails, the ranking is Facebook's own.
 */
public final class NewestReels {
    /** Counted under the patch's name each time a rerank's order changed here. */
    static final String SORTED = "Reels put newest first";

    /** Counted for a reel whose edge Facebook hadn't loaded, which keeps Facebook's place. */
    static final String UNLOADED = "Reels with no loaded edge";

    /** Facebook's own message when a model's lazy edge isn't there yet. */
    private static final String EDGE_NOT_LOADED = "Inflated edge is null";

    private static final String FAMILY = FamilyNames.NEWEST_REELS_FIRST;

    /** The Reels tab's feed type is fb_shorts_tab, and its other feeds start the same way. */
    private static final String REELS_FEEDS = "fb_shorts";

    /** The field of a reel's edge that holds its story, as the Java hash of its GraphQL name. */
    private static final int NODE = "node".hashCode();

    /** Past this many kept times the oldest go, since a long session keeps making signals. */
    private static final int MOST = 4000;

    /** Each reel's posting time in seconds, by its ranking signal. A signal dropped by Facebook drops out. */
    private static final Map<Object, Long> posted = Collections.synchronizedMap(new WeakHashMap<>());

    /** Stands in for {@link #postedSeconds} when a test sets it. */
    @Nullable
    static volatile ToLongFunction<Object> timeForTests;

    private static volatile boolean logged;

    private NewestReels() {
    }

    /**
     * Injection point, as Facebook's ranker makes a signal: whether the hook should read the model's
     * edge and hand it on. Only for one of the Reels feeds with the switch on. Never throws.
     *
     * @param feedType the model's FeedType, whose string is the feed's name.
     */
    public static boolean records(@Nullable Object feedType) {
        try {
            HookStatus.invoked(FAMILY);
            // Settings mustn't load before the extension has its context.
            if (!Utils.settingsReady() || !Settings.NEWEST_REELS_FIRST.get()) return false;
            return reelsFeed(feedType);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "reel signal", failure);
            return false;
        }
    }

    /**
     * Records an edge read that failed, without interrupting Facebook's signal creation. Facebook
     * throws "Inflated edge is null" for a reel whose edge it hasn't loaded yet, which some feeds
     * serve on every cold start (#234, #246). That reel only goes untimed, so it is counted rather
     * than reported as a broken hook. Anything else still is.
     */
    public static void edgeFailed(@Nullable Throwable failure) {
        String message = failure == null ? null : failure.getMessage();
        if (message != null && message.contains(EDGE_NOT_LOADED)) {
            HookStatus.counted(FAMILY, UNLOADED);
            return;
        }
        HookStatus.threw(FAMILY, "reel edge", failure);
    }

    /**
     * Injection point, as Facebook's ranker makes a reel's signal. Keeps the reel's posting time
     * when its feed is one of the Reels feeds. Never throws.
     *
     * @param feedType the model's FeedType, whose string is the feed's name.
     * @param edge     the model's edge, a GraphQL tree.
     * @param signal   the signal Facebook made, which the rerank's list holds.
     */
    public static void posted(@Nullable Object feedType, @Nullable Object edge, @Nullable Object signal) {
        try {
            if (feedType == null || edge == null || signal == null) return;
            if (!Utils.settingsReady() || !Settings.NEWEST_REELS_FIRST.get()) return;
            if (!reelsFeed(feedType)) return;
            long seconds = timeOf(edge);
            if (seconds <= 0) return;
            HookStatus.bound(FAMILY, "reel posting time");
            synchronized (posted) {
                if (posted.size() >= MOST) posted.clear();
                // An equal signal made again for the same reel becomes the one kept.
                posted.remove(signal);
                posted.put(signal, seconds);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "reel signal", failure);
        }
    }

    /**
     * Injection point, as Facebook's Reels ranker returns: puts the reels with a posting time in
     * their own slots, newest first. Never throws, and leaves the list as it was when it can't
     * finish.
     *
     * @param candidates the rerank's list, which Facebook takes the next reel from.
     */
    public static void sort(@Nullable List<Object> candidates) {
        try {
            HookStatus.invoked(FAMILY);
            if (candidates == null || !Utils.settingsReady() || !Settings.NEWEST_REELS_FIRST.get()) return;
            HookStatus.bound(FAMILY, "reels ranker");
            int size = candidates.size();
            if (size < 2) return;
            List<Integer> slots = new ArrayList<>();
            List<Object> reels = new ArrayList<>();
            List<Long> times = new ArrayList<>();
            for (int at = 0; at < size; at++) {
                Object item = candidates.get(at);
                Long seconds = item == null ? null : posted.get(item);
                if (seconds == null) continue;
                slots.add(at);
                reels.add(item);
                times.add(seconds);
            }
            if (reels.size() < 2) return;
            List<Integer> order = new ArrayList<>();
            for (int at = 0; at < reels.size(); at++) order.add(at);
            // A List sort is a stable merge sort, so reels posted in the same second keep Facebook's order.
            order.sort((a, b) -> Long.compare(times.get(b), times.get(a)));
            boolean moved = false;
            for (int at = 0; at < order.size(); at++) {
                if (order.get(at) != at) {
                    moved = true;
                    break;
                }
            }
            if (!moved) return;
            for (int at = 0; at < order.size(); at++) candidates.set(slots.get(at), reels.get(order.get(at)));
            HookStatus.counted(FAMILY, SORTED);
            logOnce(size, reels.size());
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "reels sort", failure);
        }
    }

    private static boolean reelsFeed(@Nullable Object feedType) {
        return feedType != null && String.valueOf(feedType).startsWith(REELS_FEEDS);
    }

    private static long timeOf(Object edge) {
        ToLongFunction<Object> forced = timeForTests;
        return forced != null ? forced.applyAsLong(edge) : postedSeconds(edge);
    }

    /** When the story [edge] holds as its node was posted, in seconds, or 0 when it doesn't say. */
    static long postedSeconds(Object edge) {
        return PostDetails.postedSecondsOf(edge, NODE);
    }

    private static void logOnce(int size, int timed) {
        if (logged) return;
        logged = true;
        Logger.printDebug(() -> "Newest reels first: put " + timed + " of " + size + " loaded reels newest first");
    }

    /** Forgets the kept times, the one-time log line and any stand-in time. Tests only. */
    static void forgetForTests() {
        posted.clear();
        logged = false;
        timeForTests = null;
    }
}
