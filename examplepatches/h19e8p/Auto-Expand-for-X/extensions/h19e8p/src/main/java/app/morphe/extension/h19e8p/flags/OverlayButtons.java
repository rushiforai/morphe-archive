/*
 * h19e8p Patches
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.morphe.extension.h19e8p.flags;

import android.content.Context;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;

/**
 * 要素ピッカーと読み取りの記録が、X の画面の上に重ねて出す部品。重ねた部品は、調べたい
 * ものを隠してしまうことがあるので、どれもドラッグで動かせるようにする。
 */
final class OverlayButtons {

    private OverlayButtons() {
    }

    /**
     * 大きさが決まった後で、部品を右下に置く。
     *
     * @param bottomOffsetDp 下の端からの距離。X の下のナビゲーションバーを避けるため。
     */
    static void park(Context context, FrameLayout root, View child, int bottomOffsetDp) {
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.gravity = Gravity.TOP | Gravity.START;
        child.setLayoutParams(lp);

        root.post(() -> {
            FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) child.getLayoutParams();
            params.leftMargin = Math.max(0, root.getWidth() - child.getWidth() - dp(context, 16));
            params.topMargin = Math.max(0, root.getHeight() - child.getHeight() - dp(context, bottomOffsetDp));
            child.setLayoutParams(params);
        });
    }

    /**
     * handle をドラッグすると panel が動くようにする。ほとんど動かさずに離した時はタップとして
     * onTap を呼ぶので、handle はボタンを兼ねられる。
     *
     * @param onTap ドラッグだけの時は null。
     */
    static void attachDragHandle(Context context, View handle, View panel, Runnable onTap) {
        int touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        handle.setOnTouchListener(new View.OnTouchListener() {
            private float grabX, grabY;
            /** 押し始めの指の位置。ドラッグかどうかは、ここからの合計の移動で決める。 */
            private float downX, downY;
            private boolean dragged;

            @Override
            public boolean onTouch(View view, MotionEvent event) {
                FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) panel.getLayoutParams();
                switch (event.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        grabX = event.getRawX() - params.leftMargin;
                        grabY = event.getRawY() - params.topMargin;
                        downX = event.getRawX();
                        downY = event.getRawY();
                        dragged = false;
                        return true;
                    case MotionEvent.ACTION_MOVE:
                        int x = (int) (event.getRawX() - grabX);
                        int y = (int) (event.getRawY() - grabY);
                        if (Math.abs(event.getRawX() - downX) > touchSlop
                                || Math.abs(event.getRawY() - downY) > touchSlop) {
                            dragged = true;
                        }
                        // 遊びの内側の動きでは帯を動かさない (タップでずれないように)。
                        if (!dragged) return true;
                        params.leftMargin = Math.max(0, x);
                        params.topMargin = Math.max(0, y);
                        panel.setLayoutParams(params);
                        return true;
                    case MotionEvent.ACTION_UP:
                        if (!dragged && onTap != null) onTap.run();
                        return true;
                    default:
                        return false;
                }
            }
        });
    }

    /** ドラッグで動かせて、タップもできるボタンを1つ作る。 */
    static Button createDraggable(Context context, FrameLayout root, int bottomOffsetDp, Runnable onTap) {
        Button button = new Button(context);
        button.setAllCaps(false);
        park(context, root, button, bottomOffsetDp);
        attachDragHandle(context, button, button, onTap);
        return button;
    }

    static int dp(Context context, int value) {
        return (int) (value * context.getResources().getDisplayMetrics().density);
    }
}
