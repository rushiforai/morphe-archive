package app.revanced.extension.rif;

import android.graphics.Rect;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * "Keep reply box above keyboard": rif's reply box is a floating dialog whose window is as
 * tall as its content. With the keyboard open, the dialog's views are never told about the
 * keyboard (the window's own insets stay empty), so the box, centred on the whole screen,
 * grows under the keyboard as you type.
 *
 * Fix: make the window full height (the layout rif inflated is already built for that: a
 * full-size root, the box centred in it, the box's contents in a ScrollView), then keep the
 * bottom padding of the dialog's content equal to how far the keyboard covers it. The box is
 * then centred in the space above the keyboard, its ScrollView is capped there, and the
 * edit text keeps the cursor in view by scrolling. The edit text is also capped so the whole
 * box, buttons included, fits above the keyboard (see capEditHeight).
 *
 * Hooked right after rif's dialog base class sets the window's soft input mode in onStart,
 * which runs for every rif dialog, so only the comment reply box (the one with both the
 * {@code scrollview_frame} and {@code quote_parent} views) is touched; the modmail dialogs
 * share {@code scrollview_frame} and are left alone.
 */
public final class ReplyBoxFix {

    private static final String TAG = "RifReplyBoxFix";

    private ReplyBoxFix() {}

    public static void onDialogStart(Window window) {
        try {
            if (window == null) return;
            View decor = window.peekDecorView();
            if (decor == null) return;
            int id = decor.getResources().getIdentifier(
                    "scrollview_frame", "id", decor.getContext().getPackageName());
            if (id == 0 || decor.findViewById(id) == null) return;
            // The modmail dialogs share scrollview_frame; only the comment reply dialog has the
            // "quote parent" button. Modmail dialogs are left exactly as rif has them.
            if (findById(decor, "quote_parent") == null) return;
            if (decor.getTag(id) != null) return; // onStart runs again after the app was in the background
            decor.setTag(id, Boolean.TRUE);

            WindowManager.LayoutParams lp = window.getAttributes();
            if (lp.height != ViewGroup.LayoutParams.MATCH_PARENT) {
                // Keep the width rif has, so the box looks the same.
                window.setLayout(lp.width, ViewGroup.LayoutParams.MATCH_PARENT);
            }
            final View content = decor.findViewById(android.R.id.content);
            if (content == null) return;
            final View frame = decor.findViewById(id);
            final ScrollView scroll = findScrollView(frame);
            final TextView edit = findById(decor, "reply_body") instanceof TextView
                    ? (TextView) findById(decor, "reply_body") : null;
            final View bar = findById(decor, "markdown_button_bar_floating");
            final int gap = Math.round(8 * decor.getResources().getDisplayMetrics().density);
            final Rect visible = new Rect();
            final int[] loc = new int[2];
            final int[] cap = {-1};
            decor.getViewTreeObserver().addOnGlobalLayoutListener(
                    new ViewTreeObserver.OnGlobalLayoutListener() {
                        @Override
                        public void onGlobalLayout() {
                            try {
                                if (!content.isAttachedToWindow()) return;
                                content.getWindowVisibleDisplayFrame(visible);
                                content.getLocationOnScreen(loc);
                                int overlap = loc[1] + content.getHeight() - visible.bottom;
                                int pad = Math.max(0, overlap);
                                if (pad != content.getPaddingBottom()) {
                                    content.setPadding(content.getPaddingLeft(), content.getPaddingTop(),
                                            content.getPaddingRight(), pad);
                                    return; // the next layout pass sees the new space
                                }
                                capEditHeight(content, scroll, edit, bar, gap, cap);
                            } catch (Throwable t) {
                                Log.w(TAG, "layout pass failed", t);
                            }
                        }
                    });
        } catch (Throwable t) {
            Log.w(TAG, "onDialogStart failed", t);
        }
    }

    /**
     * rif's ScrollView holds the header, the edit text and the Cancel / Save / Send row, so a
     * long reply pushes the buttons out of view, and ScrollView scrolls the cursor line into
     * its own (clipped) bottom padding. Cap the edit text instead, so the whole box fits the
     * space above the keyboard: the text scrolls inside the edit text (which keeps the cursor
     * in view itself) and the header and buttons stay on screen. If even a 3-line edit text
     * wouldn't fit (landscape), leave it to the ScrollView as rif does.
     */
    private static void capEditHeight(View content, ScrollView scroll, TextView edit, View bar,
                                      int gap, int[] cap) {
        if (scroll == null || edit == null || scroll.getChildCount() == 0) return;
        int avail = content.getHeight() - content.getPaddingTop() - content.getPaddingBottom() - gap;
        if (bar != null && bar.getVisibility() == View.VISIBLE) avail -= bar.getHeight();
        int others = scroll.getChildAt(0).getHeight() - edit.getHeight()
                + scroll.getPaddingTop() + scroll.getPaddingBottom();
        int max = avail - others;
        int min = edit.getLineHeight() * 3 + edit.getCompoundPaddingTop() + edit.getCompoundPaddingBottom();
        int want = max >= min ? max : Integer.MAX_VALUE;
        if (want == cap[0]) return;
        cap[0] = want;
        edit.setMaxHeight(want);
        edit.post(() -> {
            try {
                int sel = edit.getSelectionEnd();
                if (sel >= 0 && edit.isAttachedToWindow()) edit.bringPointIntoView(sel);
            } catch (Throwable t) {
                Log.w(TAG, "keeping the cursor in view failed", t);
            }
        });
    }

    private static View findById(View root, String name) {
        int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
        return id == 0 ? null : root.findViewById(id);
    }

    private static ScrollView findScrollView(View v) {
        if (v instanceof ScrollView) return (ScrollView) v;
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) {
                ScrollView s = findScrollView(g.getChildAt(i));
                if (s != null) return s;
            }
        }
        return null;
    }
}
