// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.tables;

import android.text.SpannableStringBuilder;
import android.view.View;
import android.widget.TextView;

/**
 * Shows Reddit tables as a grid in comments and posts, instead of the app's "header: value" lines.
 * Wide tables can be expanded and scrolled sideways, and links in cells can be tapped.
 *
 * @noinspection unused
 */
public final class ShowTablesPatch {
    private ShowTablesPatch() {
    }

    /**
     * Injected at the start of RedditSpannerBase.appendTable(SpannableStringBuilder, RedditParser$Element).
     *
     * @return The start of the appended table, or -1 to let the app flatten the table as before.
     */
    public static int appendTable(Object spanner, SpannableStringBuilder builder, Object element) {
        return TableSpan.appendTable(spanner, builder, element);
    }

    /**
     * Injected right after the app sets the text of a comment (CommentHolder.updateView)
     * or of a post (DetailLinkFragment.updateSelftext): fits the tables to the view's width.
     */
    public static void onTextSet(TextView textView) {
        TableSpan.fitToView(textView);
    }

    /**
     * Injected in the CommentHolder constructor right after the app sets the touch listener of
     * the comment body, which is kept and called for every touch.
     */
    public static void installTouch(View view, View.OnTouchListener appListener) {
        TableTouch.install(view, appListener);
    }
}
