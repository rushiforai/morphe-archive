/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;

import app.morphe.extension.facebook.download.PostDetails;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Recently watched (#183): a list on the phone of the reels, videos and stories you watched, newest
 * first, so one a feed refresh took away can be found and opened again. Nothing on it leaves the
 * phone; it's kept in {@link WatchedList}.
 *
 * <p>It adds no hook of its own. Reels and videos come from Resume long videos' hook first thing
 * in FbGrootPlayer's maybeTrackVideoStart ({@link #started}), which a start runs once the video is
 * playing. The player's VideoPlayerParams give the video's id and say whether it's a reel. A start
 * counts as a watch when the same player still has that video {@link #WATCHED_AFTER_MS} later and
 * has played on by {@link #MIN_PLAYED_MS}, so a video you scroll straight past isn't listed. Ads,
 * GIFs and sound-only players never are. Stories come from View stories anonymously's hook in the
 * story viewer's queue of the cards you viewed ({@link #storyViewed}), with the card's poster when
 * the card names one. The params say nothing of a video's poster or caption, so a reel or video is
 * listed by its kind, length and time.
 *
 * <p>Off, paused, before the settings are ready, or when anything here throws, nothing is added and
 * the player and the story viewer go on as Facebook runs them. What's listed stays until it's
 * cleared on its page, and the oldest goes once there are {@link WatchedList#MAX_ENTRIES}.
 */
public final class RecentlyWatched {
    public static final String REEL = "reel";
    public static final String VIDEO = "video";
    public static final String STORY = "story";

    /** How long after a start the player has to still have the video for it to count as watched. */
    static final long WATCHED_AFTER_MS = 3_000;

    /** How far the video has to have played on by then. A pause or a stalled start stays put. */
    static final int MIN_PLAYED_MS = 2_000;

    /** The Hook status names: a failure under each, and the count of entries kept. */
    static final String PLAYER_HOOK = "recently watched video";
    static final String STORY_HOOK = "recently watched story";
    static final String KEPT = "recently watched";

    private static final String FAMILY = FamilyNames.RESUME_LONG_VIDEOS;
    private static final String WEB = "https://www.facebook.com/";

    /** One reel, video or story on the list. */
    public static final class Entry {
        /** {@link #REEL}, {@link #VIDEO} or {@link #STORY}. */
        public final String kind;
        /** The video's id, or the story card's. */
        public final String id;
        /** Who posted it, when that's known. */
        @Nullable public final String owner;
        /** The start of its caption, when that's known. */
        @Nullable public final String caption;
        /** A story's bucket, the person's or Page's stories, which its link needs. Null otherwise. */
        @Nullable public final String parent;
        /** When it was last watched, in milliseconds since the epoch. */
        public final long watchedAt;
        /** Its length, or 0 when unknown. */
        public final int durationMs;

        Entry(String kind, String id, @Nullable String owner, @Nullable String caption, @Nullable String parent,
              long watchedAt, int durationMs) {
            this.kind = kind;
            this.id = id;
            this.owner = owner;
            this.caption = caption;
            this.parent = parent;
            this.watchedAt = watchedAt;
            this.durationMs = durationMs;
        }

        /** This watch of what [earlier] was too, keeping what [earlier] knew and this one doesn't. */
        Entry over(Entry earlier) {
            return new Entry(kind, id, owner != null ? owner : earlier.owner,
                    caption != null ? caption : earlier.caption, parent != null ? parent : earlier.parent,
                    watchedAt, durationMs > 0 ? durationMs : earlier.durationMs);
        }

        /**
         * The facebook.com address it opens at: a reel's, a video's watch link, or a story's under
         * its bucket. Null for a story with no bucket.
         */
        @Nullable
        public String link() {
            switch (kind) {
                case REEL:
                    return WEB + "reel/" + Uri.encode(id);
                case VIDEO:
                    return WEB + "watch/?v=" + Uri.encode(id);
                case STORY:
                    return parent == null ? null : WEB + "stories/" + Uri.encode(parent) + "/" + Uri.encode(id) + "/";
                default:
                    return null;
            }
        }
    }

    /** Runs the watch check later. {@link #ON_THIS_LOOPER} is the app's; tests stand in. */
    interface Timer {
        /** False when it can't run [task]. */
        boolean after(long delayMs, Runnable task);
    }

    /** On the looper of the thread that started the player, which is the player's own. */
    static final Timer ON_THIS_LOOPER = (delayMs, task) -> {
        Looper looper = Looper.myLooper();
        return new Handler(looper != null ? looper : Looper.getMainLooper()).postDelayed(task, delayMs);
    };

    /** Writes the list off the player's thread, since the whole array goes out on each change. */
    static final Executor IN_THE_BACKGROUND = Utils::runOnBackgroundThread;

    static volatile Timer timer = ON_THIS_LOOPER;
    static volatile Executor writer = IN_THE_BACKGROUND;
    @Nullable
    static volatile WatchedList listForTests;

    private static final Object LIST_LOCK = new Object();
    /** Clear and recording changes retire every event captured before them. Guarded by LIST_LOCK. */
    private static long generation;
    @Nullable
    private static WatchedList list;

    private RecentlyWatched() {
    }

    /** Whether watches are kept: the switch on, not paused, and the settings ready. */
    public static boolean keeping() {
        return Utils.settingsReady() && Settings.RECENTLY_WATCHED.get();
    }

    /** From every live recording-setting write path, including imports and preference binding. */
    public static void recordingChanged() {
        synchronized (LIST_LOCK) {
            generation++;
        }
    }

    // ------------------------------------------------------------------ what the hooks hand over

    /**
     * From {@link ResumePlayback#started}: [player] started playing its video. The check
     * {@link #WATCHED_AFTER_MS} later keeps it. Never throws.
     */
    static void started(@Nullable Object player) {
        try {
            if (player == null) return;
            final long observedGeneration;
            synchronized (LIST_LOCK) {
                if (!keeping()) return;
                observedGeneration = generation;
            }
            ResumePlayback.Facts facts = ResumePlayback.facts(player);
            if (facts == null || facts.ad || facts.gif || facts.audioOnly) return;
            String kind = facts.reel ? REEL : VIDEO;
            String videoId = facts.videoId;
            int length = facts.durationMs;
            int startedAt = ResumePlayback.access.position(player);
            WeakReference<Object> held = new WeakReference<>(player);
            timer.after(WATCHED_AFTER_MS, () -> stillPlaying(held, kind, videoId, length, startedAt, observedGeneration));
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, PLAYER_HOOK, failure);
        }
    }

    /**
     * The check after a start: the player still has [videoId] and has played on since [startedAt],
     * or wrapped around to an earlier point the way a looping reel does. A position the patch
     * can't read counts as played on. Never throws.
     */
    static void stillPlaying(WeakReference<Object> held, String kind, String videoId, int length, int startedAt,
                             long observedGeneration) {
        try {
            synchronized (LIST_LOCK) {
                if (generation != observedGeneration || !keeping()) return;
            }
            Object player = held.get();
            if (player == null || !keeping()) return;
            ResumePlayback.Facts facts = ResumePlayback.facts(player);
            if (facts == null || !videoId.equals(facts.videoId)) return;
            int now = ResumePlayback.access.position(player);
            boolean known = now != ResumePlayback.NOT_PATCHED_TIME && startedAt != ResumePlayback.NOT_PATCHED_TIME;
            if (known && now >= startedAt && now - startedAt < MIN_PLAYED_MS) return;
            keep(new Entry(kind, videoId, null, null, null, System.currentTimeMillis(), Math.max(0, length)), observedGeneration);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, PLAYER_HOOK, failure);
        }
    }

    /**
     * From the story viewer's queue of viewed cards: card [storyId] of bucket [bucketId] was viewed
     * (a peek isn't). Kept with its poster when [card] names one. Never throws.
     */
    public static void storyViewed(@Nullable String storyId, @Nullable String bucketId, @Nullable Object card) {
        try {
            if (storyId == null || storyId.isEmpty() || bucketId == null || bucketId.isEmpty()) return;
            final long observedGeneration;
            synchronized (LIST_LOCK) {
                if (!keeping()) return;
                observedGeneration = generation;
            }
            keep(new Entry(STORY, storyId, posterOf(card), null, bucketId, System.currentTimeMillis(), 0), observedGeneration);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, STORY_HOOK, failure);
        }
    }

    /** Who posted the story [card] holds, or null when it doesn't say or can't be read. */
    @Nullable
    static String posterOf(@Nullable Object card) {
        if (card == null) return null;
        try {
            return PostDetails.ofCard(null, card).owner;
        } catch (Throwable unreadable) {
            // A card of another shape: the story is still listed, by its kind.
            return null;
        }
    }

    private static void keep(Entry entry, long observedGeneration) {
        writer.execute(() -> {
            try {
                final boolean added;
                synchronized (LIST_LOCK) {
                    if (generation != observedGeneration || !keeping()) return;
                    WatchedList kept = list();
                    if (kept == null) return;
                    added = kept.add(entry);
                }
                HookStatus.counted(FAMILY, KEPT);
                Logger.printDebug(() -> "Recently watched: " + (added ? "added a " : "moved up a ") + entry.kind);
            } catch (Throwable failure) {
                HookStatus.threw(FAMILY, STORY.equals(entry.kind) ? STORY_HOOK : PLAYER_HOOK, failure);
            }
        });
    }

    // ------------------------------------------------------------------ what the page reads

    /** Every entry, the one watched last first. Empty outside Facebook's main process. */
    public static List<Entry> entries() {
        WatchedList kept = list();
        return kept == null ? Collections.emptyList() : kept.newestFirst();
    }

    /** Forgets every entry. */
    public static void clear() {
        synchronized (LIST_LOCK) {
            generation++;
            WatchedList kept = list();
            if (kept != null) kept.clear();
        }
        Logger.printDebug(() -> "Recently watched: cleared");
    }

    static boolean isKind(String kind) {
        return REEL.equals(kind) || VIDEO.equals(kind) || STORY.equals(kind);
    }

    /** The list, read the first time it's needed. Null outside the main process. */
    @Nullable
    private static WatchedList list() {
        WatchedList forTests = listForTests;
        if (forTests != null) return forTests;
        synchronized (LIST_LOCK) {
            if (list == null) {
                Context context = Utils.getContext();
                if (context == null || !Utils.isMainProcess()) return null;
                list = new WatchedList(context.getSharedPreferences(WatchedList.FILE, Context.MODE_PRIVATE));
            }
            return list;
        }
    }

    /** Puts the app's own timer, writer and list back. */
    static void forget() {
        synchronized (LIST_LOCK) {
            generation++;
            list = null;
        }
        listForTests = null;
        timer = ON_THIS_LOOPER;
        writer = IN_THE_BACKGROUND;
    }
}
