package com.bytedance.android.live.design.resource.theme;

import android.content.Context;


/**
 * Test stand-in for LIVE's themed dialog base; only its name, getThemeOverlay, getContext and
 * getParentFragment are read. Its overlay answers the way PineDrama's does with the provider hook in:
 * the dark one while the hook says dark, else the light one PineDrama picks in a LIVE room. It keeps
 * the context it was last asked with.
 */
public class LiveThemeAwareDialogFragment {
    public int overlay;
    public int lightOverlay;
    public Context context;
    public Object parent;
    public Context asked;

    public Context getContext() {
        return context;
    }

    public Object getParentFragment() {
        return parent;
    }
}
