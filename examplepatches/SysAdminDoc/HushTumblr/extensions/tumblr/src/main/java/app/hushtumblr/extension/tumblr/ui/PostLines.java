/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Line between posts. Tumblr's timeline spacing already goes over every gap above a post on each
 * draw, painting it for a debug switch of its own. The patch lets this switch turn that painting on
 * and hands each gap here in place of the canvas, so a thin line goes through the gap's middle.
 * Rows inside a post have no gap, which comes here as an empty one. With this switch off a gap is
 * Tumblr's, painted its own way if its debug switch asked.
 */
public final class PostLines {
    /** Half-see-through gray, which reads as a light line on black and a soft one on white. */
    static final int LINE_COLOR = 0x99808080;

    private static final Paint LINE = new Paint();

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

    /** Stands in for Tumblr's drawRect over one gap, taking what it took. */
    public static void paintGap(Canvas canvas, float left, float top, float right, float bottom, Paint tumblrs) {
        try {
            if (!on()) {
                canvas.drawRect(left, top, right, bottom, tumblrs);
                return;
            }
            if (bottom <= top) return;
            float half = Math.max(1f, Resources.getSystem().getDisplayMetrics().density) / 2f;
            float middle = (top + bottom) / 2f;
            canvas.drawRect(left, middle - half, right, middle + half, LINE);
            HookStatus.counted(FamilyNames.LINE_BETWEEN_POSTS, "line drawn");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LINE_BETWEEN_POSTS, "line", failure);
        }
    }

    private static boolean on() {
        if (!Utils.settingsReady() || !PatchFamily.Capability.POST_LINE.installed()) return false;
        HookStatus.invoked(FamilyNames.LINE_BETWEEN_POSTS);
        return Settings.LINE_BETWEEN_POSTS.get();
    }
}
