/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.pinedrama.blockauthor;

import app.morphe.extension.shared.Logger;

import app.morphe.extension.pinedrama.wellbeing.SessionBudget;
import app.morphe.extension.pinedrama.wellbeing.SessionBudgetNotice;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;

/**
 * Holds the author of the video that is on screen.
 *
 * Two signals feed this, and the difference between them matters.
 *
 * {@code VideoAuthorInfoVM.paramSync2StateAccept} runs when PineDrama <em>binds</em> an item,
 * which a paging feed does for the neighbours you have not reached yet. Taking the most
 * recent bind as the current video is therefore wrong: by the time you tap, it is usually
 * the video below the one you are watching. That is only a cache here.
 *
 * {@code PlayerController.onPlayProgressChange} reports the id of the video that is
 * actually <em>playing</em>, several times a second. That is what selects the current item
 * out of the cache. When the player names a video that has not been bound yet, nothing is
 * current and the button hides rather than arming the wrong creator.
 */
public final class CurrentVideoAuthor {
    /**
     * How many bound items to remember. The feed binds a couple either side of the current
     * one, so this is generous; it exists to bound the map, not to tune behaviour.
     */
    private static final int RECENT_LIMIT = 16;

    private static final Map<String, Item> RECENT = Collections.synchronizedMap(
            new LinkedHashMap<String, Item>(32, 0.75f, false) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Item> eldest) {
                    return size() > RECENT_LIMIT;
                }
            });

    /**
     * Items that were current, most recent last, so the player naming one again finds it. A
     * creator's grid or a story binds more videos than {@link #RECENT_LIMIT}, and the feed video
     * the reader came back to was no longer bound anywhere the player's lookup could see: the
     * controls went until the next swipe. Only selections land here, so it stays small.
     */
    private static final int SELECTED_LIMIT = 8;

    private static final Map<String, Item> SELECTED = Collections.synchronizedMap(
            new LinkedHashMap<String, Item>(16, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Item> eldest) {
                    return size() > SELECTED_LIMIT;
                }
            });

    private static volatile Item current;
    private static volatile String playingAwemeId;

    /**
     * The LIVE preview on screen, or null. A LIVE is never named by the player and binds with no
     * author, so without this the previous video's creator stayed current under it. While set, it
     * is what {@link #get()} answers, with the host as the author (null when the host can't be
     * blocked, which hides the button instead of arming the video before).
     */
    private static volatile Item liveItem;

    /**
     * Held while one of the two signals decides what is current and applies it. They arrive on
     * different threads: a bind on the main thread, the player's id on its own. The player
     * could find nothing bound, the bind could then land and select the video, and the
     * player's "nothing" was written last, leaving no current video until the next one,
     * because every later tick of the same id returns early.
     */
    private static final Object SELECTING = new Object();

    /** Runs between the player's lookup and its select, so a test can land a bind there. */
    private static volatile Runnable betweenLookupAndSelectForTests;
    private static volatile long lastClaimAskedAt = Long.MIN_VALUE / 2;

    private CurrentVideoAuthor() {
    }

    /** One bound feed item. {@code author} is null for a card with nobody to block. */
    private static final class Item {
        final String awemeId;
        final VideoAuthor author;
        final Object aweme;

        Item(String awemeId, VideoAuthor author, Object aweme) {
            this.awemeId = awemeId;
            this.author = author;
            this.aweme = aweme;
        }
    }

    /**
     * Called as PineDrama binds a feed item, which happens ahead of the item being reached.
     *
     * @param videoItemParams a {@code com.ss.android.ugc.aweme.feed.model.VideoItemParams}
     */
    static void update(Object videoItemParams) {
        Item item = parse(videoItemParams);
        // Ahead of the reader, as PineDrama prepares the item's engine ahead: muted then, a feed
        // video starts silent instead of for the moment before it becomes current.
        if (item != null && item.aweme != null) {
            app.morphe.extension.pinedrama.playback.FeedMute.onFeedBind(item.aweme);
        }
        synchronized (SELECTING) {
            if (item != null && item.awemeId != null) {
                RECENT.put(item.awemeId, item);
            }

            // A bind may fill an empty selection but never replace one. That covers the first
            // video of a fresh process, where nothing has played yet, and the moment after the
            // player names a video the feed had not bound. Replacing a live selection is the
            // player's job alone, which is what keeps a prefetched neighbour from arming the
            // button.
            if (current == null || (item != null && item.awemeId != null
                    && item.awemeId.equals(playingAwemeId))) {
                select(item);
            }
        }
    }

    /** The author the button acts on for {@code item}: the LIVE's host while one is on screen. */
    private static VideoAuthor effectiveAuthor(Item item) {
        Item live = liveItem;
        if (live != null) return live.author;
        return item == null ? null : item.author;
    }

    /**
     * A LIVE preview is on screen.
     *
     * @param awemeId the LIVE item's id
     * @param host the room owner, or one with no identifiers when the room names nobody
     * @param aweme the LIVE item
     */
    static void selectLive(String awemeId, VideoAuthor host, Object aweme) {
        synchronized (SELECTING) {
            Item previous = liveItem;
            if (previous != null && Objects.equals(previous.awemeId, awemeId)
                    && previous.aweme == aweme) {
                return;
            }
            VideoAuthor before = effectiveAuthor(current);
            liveItem = new Item(awemeId, host != null && host.isUsable() ? host : null, aweme);
            announce(before, effectiveAuthor(current));
        }
    }

    /** No LIVE is on screen any more: the current video's author is current again. */
    static void releaseLive() {
        synchronized (SELECTING) {
            if (liveItem == null) return;
            VideoAuthor before = effectiveAuthor(current);
            liveItem = null;
            announce(before, effectiveAuthor(current));
        }
    }

    /** True while the current item is a LIVE preview rather than a video. */
    static boolean isLive() {
        return liveItem != null;
    }

    private static void announce(VideoAuthor before, VideoAuthor after) {
        if (Objects.equals(before, after)) return;
        if (after == null) {
            Logger.printDebug(() -> "Current item has no blockable author");
        } else {
            Logger.printDebug(() -> "Current video: " + after.reference() + " aweme=" + after.awemeId);
        }
        BlockAuthorOverlay.onAuthorChanged(after);
    }

    private static void select(Item item) {
        select(item, false);
    }

    /** Applies a new current item and tells everything that tracks the current video. */
    private static void select(Item item, boolean releaseLive) {
        Item previous = current;
        VideoAuthor previousAuthor = effectiveAuthor(previous);
        if (releaseLive) liveItem = null;
        current = item;
        if (item != null && item.awemeId != null) SELECTED.put(item.awemeId, item);

        String previousId = previous == null ? null : previous.awemeId;
        String newId = item == null ? null : item.awemeId;

        if (!Objects.equals(previousId, newId)) {
            SessionBudget.noteVideo(newId);
            // Before the budget is asked: a last video being finished ends when another comes
            // up, and the one that just came up may be the one that spends the budget.
            app.morphe.extension.pinedrama.wellbeing.FinishLastVideo.onVideoChanged(newId);
            if (SessionBudget.claimNotice()) SessionBudgetNotice.show(newId);
            // Checked where the day's own notice is checked, on the video change rather than on
            // the progress callback: the reminder is measured in watched minutes but it should
            // arrive between videos rather than over one.
            SessionBudgetNotice.showIntervalNoticeIfDue();
            app.morphe.extension.pinedrama.interaction.TapConfirmation.onVideoChanged();
            app.morphe.extension.pinedrama.captions.CaptionTools.onVideoChanged(newId);
            // Latest first on Following sorts only below the video the reader has reached.
            app.morphe.extension.pinedrama.feedfilter.FollowingLatestFirst.onCurrentVideo(newId);

            if (item != null && item.aweme != null) {
                app.morphe.extension.pinedrama.feed.AuthorRegion.rememberVideo(item.aweme);
                CurrentVideoSound.update(item.aweme);
                // Mute feed videos hears only one of the routes PineDrama starts a feed video by;
                // this change is the one every route passes.
                app.morphe.extension.pinedrama.playback.FeedMute.onCurrentVideo(item.aweme);
            } else {
                CurrentVideoSound.clear();
            }
        }

        // "Current video:" rather than "author:" in the log, which the export's credential rule
        // reads as a name to omit the value of, taking the pseudonym's first word with it.
        announce(previousAuthor, effectiveAuthor(item));
    }

    /**
     * @return the author of the video that is playing, or null when there is nobody to
     *         block on it. There is deliberately no expiry: a video can run for minutes,
     *         and the player keeps naming the same id throughout. Keeping the button off
     *         other screens is {@link FeedVisibility}'s job, not this one's.
     */
    public static VideoAuthor get() {
        return effectiveAuthor(current);
    }

    public static Object getAweme() {
        Item item = liveItem;
        if (item == null) item = current;
        return item == null ? null : item.aweme;
    }

    static void setBetweenLookupAndSelectForTests(Runnable hook) {
        betweenLookupAndSelectForTests = hook;
    }

    static void resetForTests() {
        betweenLookupAndSelectForTests = null;
        lastClaimAskedAt = Long.MIN_VALUE / 2;
        RECENT.clear();
        SELECTED.clear();
        current = null;
        liveItem = null;
        playingAwemeId = null;
        LiveFeedCells.resetForTests();
        CurrentVideoSound.clear();
    }

    /** Reads the item without touching anything that tracks the current video. */
    private static Item parse(Object videoItemParams) {
        try {
            Object aweme = Reflect.property(videoItemParams, "getAweme", "aweme");
            if (aweme == null) {
                return null;
            }

            String awemeId = Reflect.string(aweme, "getAid", "aid");
            Object user = Reflect.property(aweme, "getAuthor", "author");
            if (user == null) {
                // A LIVE preview, a promo or an end of feed card: real item, nobody to block.
                return new Item(awemeId, null, aweme);
            }

            String uid = Reflect.firstNonBlank(
                    Reflect.string(user, "getUid", "uid"),
                    Reflect.string(aweme, "getAuthorUid", "authorUid")
            );
            String secUid = Reflect.string(user, "getSecUid", "secUid");
            String displayName = Reflect.firstNonBlank(
                    Reflect.string(user, "getUniqueId", "uniqueId"),
                    Reflect.string(user, "getNickname", "nickname")
            );

            VideoAuthor author = new VideoAuthor(uid, secUid, displayName, awemeId);
            return new Item(awemeId, author.isUsable() ? author : null, aweme);
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not read the current video author", ex);
            return null;
        }
    }
}
