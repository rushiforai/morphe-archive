package app.morphe.extension.syncforreddit.feed;

import android.os.Bundle;
import android.view.View;

import androidx.annotation.Nullable;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.shared.Logger;

/**
 * Keeping a feed's place when the rows underneath it have been swept away.
 *
 * <p>Sync saves where a feed was as an adapter <i>position</i> and nothing else. That is right
 * until the list it counts into changes, and it does: the app throws a cached post away two days
 * after it was written, from inside the very insert that adds the next page. So a reader who has
 * been working down one feed for a couple of days has rows quietly removed from above their
 * place, and the saved number no longer counts to the same post. Coming back from a post then
 * lands somewhere else entirely, or past the end — where the layout manager finds the pending
 * position is no longer a real row, gives up on it, and lays out from the top.
 *
 * <p>The "Restore position" offer does not appear with it, which is what makes it read as a bug
 * rather than as a scroll: that offer is only ever built by the deliberate jump to the top, and
 * nothing deliberate has happened here.
 *
 * <p>What is remembered instead is the post itself. The feed's adapter already answers
 * {@code getItemId} out of the {@code hash} column, which names a post and does not move when
 * its neighbours are deleted, so a few of those taken at the anchor are enough to find the same
 * place in the new list and go there. Where the post has itself been swept away, nothing is done
 * and the app behaves as it did before.
 */
public final class FeedPosition {
    /**
     * How many posts are noted at the anchor. One is usually enough; a few means the place is
     * still found when the post at the very top has itself aged out.
     */
    private static final int ANCHORS = 8;

    /** How far back to look for the anchor before giving up, in rows. */
    private static final int LOOK_BACK = 4000;

    /**
     * The note is written into the very bundles the app saves the feed's place in, rather than
     * kept beside them. A feed is rebuilt from scratch whenever the screen behind a post is taken
     * apart to free memory — which is exactly the long reading session this goes wrong in — and a
     * note held in memory under the old fragment would be gone by the time the new one asks for
     * it. What travels in the bundle comes back with everything else.
     */
    private static final String ROW = "sync_up_feed_row";

    private static final String OFFSET = "sync_up_feed_offset";

    private static final String IDS = "sync_up_feed_ids";

    private static final String WHEN = "sync_up_feed_when";

    /** Where one feed was, in terms of the posts that were on the screen rather than a count. */
    private static final class Anchor {
        final int position;
        final int offset;
        final long[] ids;

        Anchor(int position, int offset, long[] ids) {
            this.position = position;
            this.offset = offset;
            this.ids = ids;
        }
    }

    /**
     * Keyed on the feed's own fragment, weakly: a feed that has gone takes its note with it, and
     * one that is rebuilt from scratch simply has nothing noted and is left to the app.
     */
    private static final Map<Object, Anchor> noted = new WeakHashMap<>();

    private FeedPosition() {}

    /** Called where the app saves a feed's place into a field of its own. */
    public static void remember(Object feed) {
        remember(feed, null);
    }

    /**
     * Called where the app saves a feed's place into a bundle handed to it, which is the one
     * that comes back when the screen is rebuilt.
     */
    public static void remember(Object feed, @Nullable Bundle into) {
        try {
            // The app saves twice as a screen goes away, and the list has sometimes already been
            // emptied by the second of them. What was worked out the first time is used again
            // rather than nothing being written, since it is the second call that carries the
            // bundle the rebuilt screen reads back.
            Anchor anchor = whereItIs(feed);
            if (anchor == null) {
                anchor = noted.get(feed);
            }
            if (anchor == null) {
                return;
            }
            noted.put(feed, anchor);
            for (Bundle bundle : bundlesOf(feed, into)) {
                bundle.putInt(ROW, anchor.position);
                bundle.putInt(OFFSET, anchor.offset);
                bundle.putLongArray(IDS, anchor.ids);
                bundle.putLong(WHEN, System.currentTimeMillis());
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "feed: could not note where the feed was: " + ex);
        }
    }

    /** @return Where the feed is sitting right now, or nothing where it cannot be worked out. */
    @Nullable
    private static Anchor whereItIs(Object feed) {
        try {
            RecyclerView list = listOf(feed);
            if (list == null) {
                return null;
            }
            RecyclerView.h adapter = list.e0();
            RecyclerView.p manager = list.r0();
            if (adapter == null || manager == null) {
                return null;
            }

            // The topmost laid-out child, which is the row the reader is looking at. Children are
            // not held in visual order, so it is found by the position each was drawn for.
            View top = null;
            int position = -1;
            for (int index = 0; index < list.getChildCount(); index++) {
                View child = list.getChildAt(index);
                if (child == null) {
                    continue;
                }
                int at = manager.n0(child);
                if (at >= 0 && (position < 0 || at < position)) {
                    position = at;
                    top = child;
                }
            }
            if (top == null || position < 0) {
                return null;
            }

            int count = adapter.n();
            int many = Math.min(ANCHORS, Math.max(0, count - position));
            if (many <= 0) {
                return null;
            }
            long[] ids = new long[many];
            for (int index = 0; index < many; index++) {
                ids[index] = adapter.o(position + index);
            }

            return new Anchor(position, top.getTop() - list.getPaddingTop(), ids);
        } catch (Exception ex) {
            Logger.printInfo(() -> "feed: could not work out where the feed is: " + ex);
            return null;
        }
    }

    /**
     * Called as a freshly loaded list of posts is about to be handed to the feed, before the old
     * one is let go of.
     *
     * <p>This is what covers the case the reader meets most: a page is loaded while they are
     * reading, the insert sweeps away everything that has aged out, and the list the feed is
     * counting into gets shorter underneath them. Nothing has been saved and nothing is being
     * restored, so there is no note to go on unless one is taken here.
     */
    public static void before(Object feed) {
        try {
            // A feed being built for the first time has nothing on the screen to read, which is
            // also the case where a note taken before the screen went away is the one that
            // matters, so nothing being found here is not a reason to stop.
            Anchor anchor = whereItIs(feed);
            if (anchor != null) {
                noted.put(feed, anchor);
            }

            // Putting it back is left until the method has finished and the new list is in
            // place. This is the only call the patch makes into the middle of that method, and
            // it sits at the very start where nothing can jump over it — the method holds one
            // return but several ways of reaching it, and a call placed by that return is
            // skipped every time but the first.
            RecyclerView list = listOf(feed);
            if (list != null) {
                list.post(() -> settle(feed));
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "feed: could not note where the feed was: " + ex);
        }
    }

    /** Run once the new list is in place, to put the feed back where it was. */
    private static void settle(Object feed) {
        try {
            Anchor written = fromBundles(feed);
            Anchor held = noted.remove(feed);
            // What was on the screen a moment ago is preferred, since it is the most recent
            // reading of where the feed actually was. The bundle answers the other case, where
            // the screen has just been rebuilt and so had nothing on it to read.
            Anchor anchor = held != null ? held : written;
            if (anchor == null) {
                return;
            }
            RecyclerView list = listOf(feed);
            if (list == null) {
                return;
            }
            RecyclerView.h adapter = list.e0();
            RecyclerView.p manager = list.r0();
            if (adapter == null || manager == null) {
                return;
            }
            int count = adapter.n();
            if (count <= 0) {
                return;
            }

            // Rows are only ever taken out from under the anchor, never added above it, so the
            // post that was at the top is at or before where it was.
            int from = Math.min(anchor.position, count - 1);
            int limit = Math.max(0, from - LOOK_BACK);
            int landed = -1;
            int which = Integer.MAX_VALUE;
            for (int at = from; at >= limit; at--) {
                int index = indexOf(anchor.ids, adapter.o(at));
                if (index < 0) {
                    continue;
                }
                if (index < which) {
                    which = index;
                    landed = at;
                }
                if (which == 0) {
                    break;
                }
                // Anything noted before this one was directly above it, so there is only that
                // much further to look.
                limit = Math.max(limit, at - which);
            }

            if (landed < 0 || landed == anchor.position) {
                // Either nothing noted survived, in which case the app is left to do what it did
                // before, or nothing moved and its own restore is already right.
                return;
            }

            if (manager instanceof LinearLayoutManager) {
                ((LinearLayoutManager) manager).G2(landed, anchor.offset);
            } else {
                manager.D1(landed);
            }
            final int saidLanded = landed;
            final int saidFrom = from;
            Logger.printDebug(() -> "feed: the post at row " + saidFrom + " is now at row "
                    + saidLanded + ", moving the feed back to it");
        } catch (Exception ex) {
            Logger.printInfo(() -> "feed: could not put the feed back: " + ex);
        }
    }

    /**
     * @return Every bundle the note should be written into: the one handed over, if there is
     *         one, and whatever the fragment is holding, since which of those the app will read
     *         back depends on how the screen came to be rebuilt.
     */
    private static List<Bundle> bundlesOf(Object feed, @Nullable Bundle into) {
        List<Bundle> found = new ArrayList<>();
        if (into != null) {
            found.add(into);
        }
        for (Field field : bundleFieldsOf(feed)) {
            try {
                Object held = field.get(feed);
                if (held instanceof Bundle && !found.contains(held)) {
                    found.add((Bundle) held);
                }
            } catch (Exception ex) {
                Logger.printDebug(() -> "feed: could not read " + field.getName() + ": " + ex);
            }
        }
        return found;
    }

    /** @return What was written down, newest first, taken back out as it is read. */
    @Nullable
    private static Anchor fromBundles(Object feed) {
        Anchor newest = null;
        long latest = Long.MIN_VALUE;
        for (Bundle bundle : bundlesOf(feed, null)) {
            long[] ids = bundle.getLongArray(IDS);
            if (ids == null || ids.length == 0 || !bundle.containsKey(ROW)) {
                continue;
            }
            long when = bundle.getLong(WHEN, 0L);
            if (when >= latest) {
                latest = when;
                newest = new Anchor(bundle.getInt(ROW), bundle.getInt(OFFSET), ids);
            }
            // One note answers one restore, exactly as the app takes its own back out.
            bundle.remove(ROW);
            bundle.remove(OFFSET);
            bundle.remove(IDS);
            bundle.remove(WHEN);
        }
        return newest;
    }

    private static List<Field> bundleFieldsOf(Object feed) {
        List<Field> found = new ArrayList<>();
        for (Class<?> at = feed.getClass(); at != null; at = at.getSuperclass()) {
            for (Field field : at.getDeclaredFields()) {
                if (Bundle.class.equals(field.getType())) {
                    field.setAccessible(true);
                    found.add(field);
                }
            }
        }
        return found;
    }

    private static int indexOf(long[] ids, long id) {
        for (int index = 0; index < ids.length; index++) {
            if (ids[index] == id) {
                return index;
            }
        }
        return -1;
    }

    /** @return The feed's list, which the fragment holds under a name the minifier kept. */
    @Nullable
    private static RecyclerView listOf(Object feed) {
        for (Class<?> at = feed.getClass(); at != null; at = at.getSuperclass()) {
            for (Field field : at.getDeclaredFields()) {
                if (!RecyclerView.class.isAssignableFrom(field.getType())) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                    Object held = field.get(feed);
                    if (held instanceof RecyclerView) {
                        return (RecyclerView) held;
                    }
                } catch (Exception ex) {
                    // Another field of the same kind may still answer.
                    Logger.printDebug(() -> "feed: could not read " + field.getName() + ": " + ex);
                }
            }
        }
        return null;
    }
}
