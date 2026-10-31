package com.android.systemui.plugins;

import android.view.ViewGroup;
import com.android.systemui.plugins.annotations.ProvidesInterface;

@ProvidesInterface(action = FirstScreenWidget.ACTION, version = 1)
/* loaded from: classes2.dex */
public interface FirstScreenWidget extends Plugin {
    public static final String ACTION = "com.android.systemui.action.PLUGIN_FIRST_SCREEN_WIDGET";
    public static final int VERSION = 1;

    void onWidgetUpdated(ViewGroup viewGroup);
}
