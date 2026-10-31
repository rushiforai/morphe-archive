// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.tables;

import android.text.Layout;
import android.text.Spanned;
import android.text.style.ClickableSpan;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewParent;
import android.widget.TextView;

/**
 * Touches on tables drawn in a TextView: tap a link in a cell to open it, tap the expand/fit
 * button, drag an expanded table sideways. Everything else goes to the view's own
 * listener (if any) and to the TextView as before.
 */
final class TableTouch implements View.OnTouchListener {
    private static final int TAG_KEY = 0x7E7AB1E5;

    private final View.OnTouchListener delegate;
    private final int touchSlop;
    private TableSpan active;
    private float tableLeft;
    private float tableTop;
    private float downX;
    private float downY;
    private float lastX;
    private boolean dragging;

    private TableTouch(View view, View.OnTouchListener delegate) {
        this.delegate = delegate;
        this.touchSlop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
    }

    /**
     * Called in the CommentHolder constructor right after the app sets its touch listener on the
     * comment body (wrapped, so it keeps working), and called for other text views (no listener).
     */
    static void install(View view, View.OnTouchListener delegate) {
        if (view == null || view.getTag(TAG_KEY) != null) return;
        view.setTag(TAG_KEY, Boolean.TRUE);
        view.setOnTouchListener(new TableTouch(view, delegate));
    }

    @Override
    public boolean onTouch(View view, MotionEvent event) {
        boolean handledByDelegate = delegate != null && delegate.onTouch(view, event);
        if (!(view instanceof TextView)) return handledByDelegate;
        TextView textView = (TextView) view;

        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                active = findTable(textView, event.getX(), event.getY());
                dragging = false;
                downX = lastX = event.getX();
                downY = event.getY();
                return active != null || handledByDelegate;

            case MotionEvent.ACTION_MOVE:
                if (active == null) return handledByDelegate;
                float dx = event.getX() - downX;
                float dy = event.getY() - downY;
                if (!dragging && active.canScroll() && Math.abs(dx) > touchSlop && Math.abs(dx) > Math.abs(dy)) {
                    dragging = true;
                    ViewParent parent = textView.getParent();
                    if (parent != null) parent.requestDisallowInterceptTouchEvent(true);
                }
                if (dragging) {
                    if (active.scrollBy(lastX - event.getX())) textView.invalidate();
                    lastX = event.getX();
                }
                return true;

            case MotionEvent.ACTION_UP:
                if (active == null) return handledByDelegate;
                TableSpan span = active;
                active = null;
                if (!dragging && Math.abs(event.getX() - downX) < touchSlop && Math.abs(event.getY() - downY) < touchSlop) {
                    float x = event.getX() - tableLeft;
                    float y = event.getY() - tableTop;
                    if (!span.toggleRect().isEmpty() && contains(span, x, y)) {
                        span.toggle();
                        TableSpan.relayout(textView);
                    } else if (y <= span.gridHeight()) {
                        ClickableSpan link = span.linkAt(x, y);
                        if (link != null) link.onClick(textView);
                    }
                }
                dragging = false;
                return true;

            case MotionEvent.ACTION_CANCEL:
                active = null;
                dragging = false;
                return handledByDelegate;

            default:
                return active != null || handledByDelegate;
        }
    }

    /** The button with some extra room around it, easier to hit. */
    private boolean contains(TableSpan span, float x, float y) {
        int slack = span.dp(8);
        return x >= span.toggleRect().left - slack && x <= span.toggleRect().right + slack
                && y >= span.toggleRect().top - slack && y <= span.toggleRect().bottom + slack;
    }

    /** The table under a touch, remembering where it is drawn. */
    private TableSpan findTable(TextView textView, float touchX, float touchY) {
        Layout layout = textView.getLayout();
        CharSequence text = textView.getText();
        if (layout == null || !(text instanceof Spanned)) return null;
        Spanned spanned = (Spanned) text;
        float y = touchY - textView.getTotalPaddingTop() + textView.getScrollY();
        int line = layout.getLineForVertical((int) y);
        TableSpan[] spans = spanned.getSpans(layout.getLineStart(line), layout.getLineEnd(line), TableSpan.class);
        for (TableSpan span : spans) {
            int start = spanned.getSpanStart(span);
            if (layout.getLineForOffset(start) != line) continue;
            tableLeft = layout.getPrimaryHorizontal(start) + textView.getTotalPaddingLeft() - textView.getScrollX();
            tableTop = layout.getLineBaseline(line) + textView.getTotalPaddingTop() - textView.getScrollY() - span.height();
            float x = touchX - tableLeft;
            float localY = touchY - tableTop;
            if (x >= 0 && localY >= 0 && localY <= span.height()) return span;
        }
        return null;
    }
}
