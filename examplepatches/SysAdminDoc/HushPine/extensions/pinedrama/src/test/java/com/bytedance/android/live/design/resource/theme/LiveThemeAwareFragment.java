package com.bytedance.android.live.design.resource.theme;

import android.content.Context;
import android.view.View;

/**
 * Test stand-in for LIVE's themed fragment base, the base of sheet pages, the room's own fragments
 * and the daily ranking's pages; only its name, getContext, getView and getParentFragment are read.
 */
public class LiveThemeAwareFragment {
    public Object parent;
    public Context context;
    public View view;

    public Context getContext() {
        return context;
    }

    public View getView() {
        return view;
    }

    public Object getParentFragment() {
        return parent;
    }
}
