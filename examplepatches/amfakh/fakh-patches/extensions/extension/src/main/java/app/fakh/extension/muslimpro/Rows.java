/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.muslimpro;

import android.view.View;

/** Fixes for the profile screen's list. */
public final class Rows {
    private Rows() {
    }

    /** Collapses the row so it takes no space. */
    public static void hide(View row) {
        row.setVisibility(View.GONE);
    }

    /** Replaces `setPaddingRelative` on the profile list: the bottom padding it reserves for the ad strip is dropped. */
    public static void padRelative(View view, int start, int top, int end, int bottom) {
        view.setPaddingRelative(start, top, end, 0);
    }
}
