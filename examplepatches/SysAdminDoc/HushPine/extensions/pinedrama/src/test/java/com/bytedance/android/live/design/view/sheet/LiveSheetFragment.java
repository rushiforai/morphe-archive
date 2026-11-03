package com.bytedance.android.live.design.view.sheet;

import android.content.Context;

import com.bytedance.android.live.design.resource.theme.LiveThemeAwareFragment;

/** Test stand-in for LIVE's sheet page, built on the themed fragment base as PineDrama's is; only its name and getThemeOverlay are read. */
public class LiveSheetFragment extends LiveThemeAwareFragment {
    public int overlay;

    public int getThemeOverlay(Context context) {
        return overlay;
    }
}
