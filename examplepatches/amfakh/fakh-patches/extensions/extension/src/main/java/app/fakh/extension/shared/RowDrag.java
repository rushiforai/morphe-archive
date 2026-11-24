/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.shared;

import android.graphics.drawable.Drawable;
import android.view.MotionEvent;
import android.view.View;
import android.widget.LinearLayout;

/**
 * Drags a row of a {@link TabSheet} by its handle. The rows it passes slide out of its way while it moves, and on
 * release it is moved to that place. The first row is Home, which stays first. Views are only moved on release,
 * since removing the touched row from its parent would cancel the drag.
 */
public final class RowDrag implements View.OnTouchListener {
    private final LinearLayout rows;
    private final View row;
    private final int background;
    private final Runnable onDrop;
    private float startY;
    private int target;
    private Drawable rest;
    /** Removing the touched row makes the view system cancel the touch, which must not move the row again. */
    private boolean moving;

    /**
     * @param rows       the column of rows
     * @param row        the row this handle drags
     * @param background the color under the lifted row, so the rows it passes do not show through
     * @param onDrop     runs after the row moved to another place; the rows are then in their new order
     */
    public RowDrag(LinearLayout rows, View row, int background, Runnable onDrop) {
        this.rows = rows;
        this.row = row;
        this.background = background;
        this.onDrop = onDrop;
    }

    @Override
    public boolean onTouch(View handle, MotionEvent event) {
        int index = rows.indexOfChild(row);
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                handle.getParent().requestDisallowInterceptTouchEvent(true);
                startY = event.getRawY();
                target = index;
                rest = row.getBackground();
                row.setBackgroundColor(background);
                row.setElevation(4 * row.getResources().getDisplayMetrics().density);
                return true;
            case MotionEvent.ACTION_MOVE: {
                float dy = event.getRawY() - startY;
                row.setTranslationY(dy);
                target = Math.max(1, Math.min(rows.getChildCount() - 1,
                        index + Math.round(dy / Math.max(1, row.getHeight()))));
                for (int i = 1; i < rows.getChildCount(); i++) {
                    View other = rows.getChildAt(i);
                    if (other == row) continue;
                    float shift = 0;
                    if (i > index && i <= target) shift = -row.getHeight();
                    if (i < index && i >= target) shift = row.getHeight();
                    other.setTranslationY(shift);
                }
                return true;
            }
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                if (moving) return true;
                for (int i = 0; i < rows.getChildCount(); i++) rows.getChildAt(i).setTranslationY(0);
                row.setElevation(0);
                row.setBackground(rest);
                if (target != index) {
                    moving = true;
                    rows.removeView(row);
                    rows.addView(row, target);
                    moving = false;
                    onDrop.run();
                }
                return true;
            default:
                return false;
        }
    }
}
