// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package com.github.chrisbanes.photoview;

import android.view.MotionEvent;

/** PhotoView's listener for a one-finger fling while the image isn't zoomed in. */
public interface OnSingleFlingListener {
    boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY);
}
