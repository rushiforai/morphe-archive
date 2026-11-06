/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import android.view.View;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;
import app.hushtumblr.extension.tumblr.settings.TextSettings;

/**
 * Collapse long posts. Tumblr already cuts a post short where its author put a "Read more", and
 * draws its own Read more row under the cut, whose tap opens the post by itself. A post is drawn as
 * rows, one text block, image row or video each. The patch hands the post's own rows Tumblr is
 * about to draw for a post that wasn't cut to {@link #post}. While the switch is on and the post is
 * long, it answers a new list of the first rows that fit the picked length ({@link #cap}, about a
 * screen until another is picked), which Tumblr draws with its
 * Read more row under them, as if the author had cut it there. The post and Tumblr's lists are
 * never changed, so the post opened by itself, the reblog editor and every other screen still have
 * all of it.
 *
 * <p>Row heights aren't known when the rows are picked, so each row counts as an estimate in lines
 * of text: a text block by its length, an image row by how many images share it, a video as one
 * video. A post is long when its rows past the cap add up to {@link #MIN_HIDDEN} lines or more, so
 * a post that only just runs over stays whole. The first row always stays.
 *
 * <p>A reblog trail entry is cut a different way, see {@link #trail}: Tumblr builds each entry once,
 * with its author's cut, and every screen reads that cut, so the extension answers the cut instead.
 *
 * <p>Read more under a post this switch cut opens the post where it is ({@link #readMore}): the
 * timeline builds the post's rows again, and {@link #post} answers null for it from then on. An
 * author's own cut and a trail entry's Read more still open the post by itself, as does any tap
 * the timeline can't take. A post opened this way stays whole until Tumblr loads it again, on a
 * refresh or a new screen.
 *
 * <p>Tumblr's rows stay while the switch is off, HushTumblr is paused, the settings aren't ready,
 * where Tumblr doesn't draw Read more cuts (the post opened by itself), for a post or entry Tumblr
 * already cut, for an ask, and when anything throws. While the switch is on, each post and trail
 * entry counts its outcome under one of the names below on the diagnostic report's line for this
 * patch.
 */
public final class LongPosts {
    /**
     * About one phone screen of text, in lines of {@link #LINE} characters: the cap until another
     * length is picked ({@link TextSettings#LONG_POST_SIZE}).
     */
    static final int CAP = 40;
    /** The fewest lines a collapse may hide, so a post that runs only a little over stays whole. */
    static final int MIN_HIDDEN = 10;
    /** The characters a line of post text holds on a phone, near enough. */
    static final int LINE = 45;
    /** A full width image: a square one is about this many lines tall. */
    static final int IMAGE = 16;
    /** A video with its controls. */
    static final int VIDEO = 12;
    /** Anything else: a link card, audio, a poll, a row the bridge can't read. */
    static final int OTHER = 4;

    /** The steps a failure is reported under. */
    static final String STEP = "post rows";
    static final String TRAIL_STEP = "trail rows";
    static final String READ_MORE_STEP = "read more";

    // What the diagnostic report counts for each post and trail entry while the switch is on.
    static final String COLLAPSED = "post collapsed";
    static final String SHORT = "post short enough";
    static final String TRAIL_COLLAPSED = "trail entry collapsed";
    static final String TRAIL_SHORT = "trail entry short enough";
    static final String TRAIL_WHOLE = "trail entry left whole";
    static final String OPENED_HERE = "post opened in place";
    static final String KEPT_OPEN = "post kept open";

    /**
     * The posts {@link #post} cut and the ones Read more opened in place since. Tumblr's posts
     * compare as themselves, so these are identity sets that let a post go once Tumblr drops it.
     */
    private static final Set<Object> CUT = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));
    private static final Set<Object> OPENED = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    /** Each Read more button bound under a post this switch cut, with that post and its timeline item. */
    private static final Map<View, Bound> SHOWN = Collections.synchronizedMap(new WeakHashMap<>());

    /** A Read more button's post and timeline item, held weakly so the button doesn't keep them. */
    private static final class Bound {
        final WeakReference<Object> post;
        final WeakReference<Object> item;

        Bound(Object post, Object item) {
            this.post = new WeakReference<>(post);
            this.item = new WeakReference<>(item);
        }
    }

    private LongPosts() {
    }

    /**
     * Injected where Tumblr is about to draw every row of a post it didn't cut, with the post,
     * Tumblr's own answer for whether this screen draws an author's Read more cut (false on the post
     * opened by itself) and the rows. Answers the rows to draw instead, with Tumblr's Read more row
     * to follow, or null to draw Tumblr's own, as it does for a post Read more opened in place.
     * Never throws.
     */
    @Nullable
    public static List<Object> post(@Nullable Object post, boolean drawsCuts, @Nullable List<?> rows) {
        try {
            if (!drawsCuts || rows == null || !on(PatchFamily.Capability.LONG_POST_ROWS)) return null;
            if (post != null && OPENED.contains(post)) {
                HookStatus.counted(FamilyNames.COLLAPSE_LONG_POSTS, KEPT_OPEN);
                return null;
            }
            int keep = keep(rows);
            HookStatus.counted(FamilyNames.COLLAPSE_LONG_POSTS, keep < 0 ? SHORT : COLLAPSED);
            if (keep < 0) return null;
            if (post != null) CUT.add(post);
            return new ArrayList<>(rows.subList(0, keep));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.COLLAPSE_LONG_POSTS, STEP, failure);
            return null;
        }
    }

    /**
     * Injected where Tumblr's Read more binder binds a Read more row in a timeline, with the row's
     * button and the timeline item the row sits under, before the button gets its tap. Forgets what
     * an earlier bind of the button left, since a reused row now sits under something else, and
     * while the switch is on keeps the button for {@link #readMore} when this switch cut the item's
     * post. A trail entry's Read more under that post is kept too, and its tap still opens the post
     * by itself, since its binder has no screen for {@link #readMore}. Never throws.
     */
    public static void readMoreShown(@Nullable View button, @Nullable Object item) {
        try {
            if (button == null) return;
            SHOWN.remove(button);
            if (!(item instanceof HushTimelineItem) || !on(PatchFamily.Capability.LONG_POST_EXPAND)) return;
            Object post = ((HushTimelineItem) item).hushPost();
            if (post != null && CUT.contains(post) && !OPENED.contains(post)) SHOWN.put(button, new Bound(post, item));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.COLLAPSE_LONG_POSTS, READ_MORE_STEP, failure);
        }
    }

    /**
     * Injected first thing in Tumblr's Read more tap, with its binder and the button tapped. When
     * the button is under a post this switch cut, asks the binder's timeline to build the post's
     * rows again where it is, which {@link #post} then leaves whole, and answers true. False lets
     * Tumblr open the post by itself: an author's cut, a trail entry, a screen that isn't a timeline,
     * a post no longer in the list, a capped card, a post the server marked to cut, the switch off,
     * and anything that throws. Never throws.
     */
    public static boolean readMore(@Nullable Object binder, @Nullable View button) {
        Object post = null;
        try {
            if (button == null || !(binder instanceof HushReadMoreBinder)
                    || !on(PatchFamily.Capability.LONG_POST_EXPAND)) return false;
            Bound bound = SHOWN.get(button);
            post = bound == null ? null : bound.post.get();
            Object item = bound == null ? null : bound.item.get();
            Object screen = ((HushReadMoreBinder) binder).hushReadMoreScreen();
            if (post == null || item == null || !(screen instanceof HushExpandingTimeline)) return false;
            OPENED.add(post);
            if (!((HushExpandingTimeline) screen).hushExpandPost(item)) {
                OPENED.remove(post);
                return false;
            }
            SHOWN.remove(button);
            HookStatus.counted(FamilyNames.COLLAPSE_LONG_POSTS, OPENED_HERE);
            return true;
        } catch (Throwable failure) {
            if (post != null) OPENED.remove(post);
            HookStatus.threw(FamilyNames.COLLAPSE_LONG_POSTS, READ_MORE_STEP, failure);
            return false;
        }
    }

    /**
     * Injected where Tumblr builds a reblog trail entry, right before it reads the entry's cut, with
     * that cut (the index in [blocks] of the last block its author kept, null when they didn't cut
     * it), the entry's ask layout (null unless it's an ask), its rows and its blocks. Answers the
     * cut Tumblr goes on with: its own, or for a long uncut entry the index of a block in the last
     * row that fits. Tumblr then keeps every row up to the first one holding a block at that index,
     * so the answer is a block that finds the same row when Tumblr looks for it. Feeds draw the
     * kept rows with Tumblr's Read more row; the post opened by itself still draws every row. The
     * cut is settled once, as a page loads, so turning the switch off reaches the entries of the
     * next load, the way the feed filters do, and Pause reaches them when Tumblr restarts. Never
     * throws.
     */
    @Nullable
    public static Integer trail(@Nullable Integer cut, @Nullable Object ask, @Nullable List<?> rows,
                                @Nullable List<?> blocks) {
        try {
            if (cut != null || ask != null || rows == null || blocks == null
                    || !on(PatchFamily.Capability.LONG_TRAIL_ROWS)) return cut;
            int keep = keep(rows);
            Integer at = keep < 0 ? null : cutAfter(rows, blocks, keep);
            HookStatus.counted(FamilyNames.COLLAPSE_LONG_POSTS,
                    keep < 0 ? TRAIL_SHORT : at == null ? TRAIL_WHOLE : TRAIL_COLLAPSED);
            return at;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.COLLAPSE_LONG_POSTS, TRAIL_STEP, failure);
            return cut;
        }
    }

    /**
     * The cut that makes Tumblr keep the first [keep] of [rows], or failing that the most rows below
     * it that a cut can keep: a block of the last kept row whose index Tumblr finds there first. Null
     * when no row has such a block.
     */
    @Nullable
    static Integer cutAfter(List<?> rows, List<?> blocks, int keep) {
        for (int row = copiedAsTheyAre(rows, keep) - 1; row >= 0; row--) {
            for (Object block : blocksOf(rows.get(row))) {
                int at = blocks.indexOf(block);
                if (at >= 0 && stopsAt(rows, blocks, at) == row) return at;
            }
        }
        return null;
    }

    /**
     * The row Tumblr stops at for cut [at]: the first one holding a block whose index in [blocks]
     * is [at], the way Tumblr compares them, or -1 when none does.
     */
    static int stopsAt(List<?> rows, List<?> blocks, int at) {
        for (int row = 0; row < rows.size(); row++) {
            for (Object block : blocksOf(rows.get(row))) {
                if (blocks.indexOf(block) == at) return row;
            }
        }
        return -1;
    }

    /**
     * How many of the first [keep] rows Tumblr's cut copies as they are. It copies a row into a set
     * as it reaches one of the row's blocks, so a row with no blocks is left out and a row equal to
     * an earlier one is copied once. A cut past either would draw the entry without a row its whole
     * layout shows, so the cut stays above them.
     */
    static int copiedAsTheyAre(List<?> rows, int keep) {
        Set<Object> copied = new HashSet<>();
        for (int row = 0; row < keep; row++) {
            Object at = rows.get(row);
            if (blocksOf(at).isEmpty() || !copied.add(at)) return row;
        }
        return keep;
    }

    /** The blocks [row] holds, or none when the bridge doesn't reach it. */
    private static List<?> blocksOf(@Nullable Object row) {
        List<?> blocks = row instanceof HushBlockRow ? ((HushBlockRow) row).hushBlocks() : null;
        return blocks == null ? Collections.emptyList() : blocks;
    }

    /**
     * How many of [rows] to keep, the first ones up to the {@link #cap} in lines and always at least
     * one, or -1 when the rest would hide fewer than {@link #MIN_HIDDEN} lines or nothing at all.
     */
    static int keep(List<?> rows) {
        int cap = cap();
        int count = rows.size();
        int kept = 0;
        long used = 0;
        while (kept < count) {
            int lines = lines(rows.get(kept));
            if (kept > 0 && used + lines > cap) break;
            used += lines;
            kept++;
        }
        if (kept >= count) return -1;
        long hidden = 0;
        for (int at = kept; at < count && hidden < MIN_HIDDEN; at++) hidden += lines(rows.get(at));
        return hidden < MIN_HIDDEN ? -1 : kept;
    }

    /** The length picked on the Posts page, in lines, or {@link #CAP} for one its row never offers. */
    static int cap() {
        String size = TextSettings.LONG_POST_SIZE.get();
        return TextSettings.LONG_POST_SIZES.contains(size) ? Integer.parseInt(size) : CAP;
    }

    /** About how many lines of text [row] is as tall as. */
    static int lines(@Nullable Object row) {
        List<?> blocks = blocksOf(row);
        if (blocks.isEmpty()) return OTHER;
        int images = 0;
        int most = 0;
        for (Object block : blocks) {
            if (block == null) continue;
            if (block instanceof HushText) {
                String text = ((HushText) block).hushText();
                most = Math.max(most, 1 + (text == null ? 0 : text.length() / LINE));
                continue;
            }
            PostRules.Kind kind = PostRules.blockKind(block.getClass());
            if (kind == PostRules.Kind.VIDEO) most = Math.max(most, VIDEO);
            else if (kind == PostRules.Kind.PHOTO) images++;
            else most = Math.max(most, OTHER);
        }
        // Images in one row share its width, so each is that much shorter.
        if (images > 0) most = Math.max(most, Math.max(OTHER, IMAGE / images));
        return most == 0 ? OTHER : most;
    }

    private static boolean on(PatchFamily.Capability hook) {
        if (!Utils.settingsReady() || !hook.installed()) return false;
        HookStatus.invoked(FamilyNames.COLLAPSE_LONG_POSTS);
        return Settings.COLLAPSE_LONG_POSTS.get();
    }
}
