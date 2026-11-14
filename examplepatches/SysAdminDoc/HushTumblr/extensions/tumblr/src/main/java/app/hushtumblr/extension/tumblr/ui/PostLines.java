/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.View;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.WeakHashMap;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Line between posts. Tumblr's timeline spacing already goes over every gap above a row on each
 * draw, painting it for a debug switch of its own. The patch lets this switch turn that painting on
 * and hands each gap here in place of the canvas, so a thin line goes through the gap's middle.
 *
 * <p>That spacing also leaves a gap above a heading, a carousel or a button between posts (#15), so
 * the line goes only where a post sits on both sides. The spacing works out each row's gap from the
 * item above it and its own: the patch hands this the row first ({@link #offsetsOf}), then both
 * items' payloads ({@link #between}), and when the draw goes over the rows it says which one it's on
 * ({@link #drawingRow}). Rows inside a post have no gap, which comes here as an empty one. With this
 * switch off a gap is Tumblr's, painted its own way if its debug switch asked.
 */
public final class PostLines {
    /** Half-see-through gray, which reads as a light line on black and a soft one on white. */
    static final int LINE_COLOR = 0x99808080;

    static final String TIMELINEABLE = "com.tumblr.rumblr.model.Timelineable";

    /**
     * Items Tumblr shows as a post card, by the constant names its {@code TimelineObjectType} keeps:
     * a post, a Blaze campaign and the ads that come as sponsored posts. A heading, a carousel, a
     * banner or a button isn't one.
     */
    static final Set<String> POST_CARDS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "POST", "BLAZED_POST", "GEMINI_AD", "FACEBOOK_BIDDAABLE", "NIMBUS_AD", "VUNGLE_AD", "CLIENT_SIDE_AD",
            "CLIENT_SIDE_MEDIATION", "GOOGLE_NATIVE", "DISPLAY_IO_INTERSCROLLER_AD", "DISPLAY_IO_INTERSCROLLER_S2S_ADS")));

    private static final Paint LINE = new Paint();

    /** Rows whose gap sits between two posts. Only the main thread lays out and draws the list. */
    private static final Set<View> BETWEEN_POSTS = Collections.newSetFromMap(new WeakHashMap<>());

    @Nullable private static WeakReference<View> measuring;
    private static boolean drawingBetweenPosts;
    @Nullable private static Method kind;

    static {
        LINE.setColor(LINE_COLOR);
    }

    private PostLines() {}

    /** Whether Tumblr's spacing goes over its gaps: its own answer, or yes with the switch on. */
    public static int paintsGaps(int tumblrs) {
        try {
            return on() ? 1 : tumblrs;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LINE_BETWEEN_POSTS, "switch read", failure);
            return tumblrs;
        }
    }

    /**
     * The spacing starts working out [row]'s gap. Its earlier answer no longer holds. Kept whether
     * the switch is on or not, so turning it on draws the right lines on the next draw.
     */
    public static void offsetsOf(View row) {
        try {
            measuring = null;
            if (!tracking()) return;
            BETWEEN_POSTS.remove(row);
            measuring = new WeakReference<>(row);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LINE_BETWEEN_POSTS, "row offsets", failure);
        }
    }

    /**
     * The payloads of the items above and at the row the spacing is working out, either null at
     * the top of the list. The row gets a line in its gap only with a post on both sides.
     */
    public static void between(@Nullable Object above, @Nullable Object here) {
        try {
            View row = measuring == null ? null : measuring.get();
            measuring = null;
            if (row == null || !tracking()) return;
            if (isPostCard(above) && isPostCard(here)) BETWEEN_POSTS.add(row);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LINE_BETWEEN_POSTS, "row neighbors", failure);
        }
    }

    /**
     * The spacing's draw has come to [row], whose gap the next {@link #paintGap} paints. A build
     * without the hook, or a draw before the settings are ready, marks nothing.
     */
    public static void drawingRow(View row) {
        try {
            drawingBetweenPosts = tracking() && row != null && BETWEEN_POSTS.contains(row);
        } catch (Throwable failure) {
            drawingBetweenPosts = false;
            HookStatus.threw(FamilyNames.LINE_BETWEEN_POSTS, "row draw", failure);
        }
    }

    /** Stands in for Tumblr's drawRect over one gap, taking what it took. */
    public static void paintGap(Canvas canvas, float left, float top, float right, float bottom, Paint tumblrs) {
        try {
            if (!on()) {
                canvas.drawRect(left, top, right, bottom, tumblrs);
                return;
            }
            if (bottom <= top || !drawingBetweenPosts) return;
            float half = Math.max(1f, Resources.getSystem().getDisplayMetrics().density) / 2f;
            float middle = (top + bottom) / 2f;
            canvas.drawRect(left, middle - half, right, middle + half, LINE);
            HookStatus.counted(FamilyNames.LINE_BETWEEN_POSTS, "line drawn");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LINE_BETWEEN_POSTS, "line", failure);
        }
    }

    private static boolean on() {
        if (!tracking()) return false;
        HookStatus.invoked(FamilyNames.LINE_BETWEEN_POSTS);
        return Settings.LINE_BETWEEN_POSTS.get();
    }

    private static boolean tracking() {
        return Utils.settingsReady() && PatchFamily.Capability.POST_LINE.installed();
    }

    /** Whether [payload], a timeline item's {@code Timelineable}, is shown as a post card. */
    static boolean isPostCard(@Nullable Object payload) throws ReflectiveOperationException {
        if (payload == null) return false;
        Method read = kind;
        if (read == null || !read.getDeclaringClass().isInstance(payload)) {
            Class<?> timelineable = Class.forName(TIMELINEABLE, false, PostLines.class.getClassLoader());
            if (!timelineable.isInstance(payload)) return false;
            read = timelineable.getMethod("getTimelineObjectType");
            kind = read;
        }
        Object type = read.invoke(payload);
        return type instanceof Enum && POST_CARDS.contains(((Enum<?>) type).name());
    }
}
