package com.android.systemui.plugins;

import com.android.systemui.plugins.annotations.ProvidesInterface;

@ProvidesInterface(action = ResourceProvider.ACTION, version = 1)
/* loaded from: classes.dex */
public interface ResourceProvider extends Plugin {
    public static final String ACTION = "com.android.launcher3.action.PLUGIN_DYNAMIC_RESOURCE";
    public static final int VERSION = 1;

    int getColor(int i5);

    float getDimension(int i5);

    float getFloat(int i5);

    float getFraction(int i5);

    int getInt(int i5);
}
