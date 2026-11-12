// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package com.github.chrisbanes.photoview;

import android.content.Context;
import android.widget.ImageView;

/** PhotoView, the zoomable image view BaconReader bundles. */
public class PhotoView extends ImageView {
    public PhotoView(Context context) {
        super(context);
    }

    /** Called on a one-finger fling while the image isn't zoomed in. */
    public void setOnSingleFlingListener(OnSingleFlingListener listener) {
    }
}
