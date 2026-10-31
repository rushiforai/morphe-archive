package com.android.systemui.plugins;

import android.view.View;
import android.view.ViewGroup;
import com.android.systemui.plugins.annotations.ProvidesInterface;

@ProvidesInterface(action = AllAppsRow.ACTION, version = 1)
/* loaded from: classes.dex */
public interface AllAppsRow extends Plugin {
    public static final String ACTION = "com.android.systemui.action.PLUGIN_ALL_APPS_ACTIONS";
    public static final int VERSION = 1;

    public interface OnHeightUpdatedListener {
        void onHeightUpdated();
    }

    int getExpectedHeight();

    void setOnHeightUpdatedListener(OnHeightUpdatedListener onHeightUpdatedListener);

    View setup(ViewGroup viewGroup);
}
