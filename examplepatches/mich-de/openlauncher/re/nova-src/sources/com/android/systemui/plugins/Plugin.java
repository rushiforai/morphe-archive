package com.android.systemui.plugins;

import android.content.Context;

/* loaded from: classes.dex */
public interface Plugin {
    default int getVersion() {
        return -1;
    }

    default void onCreate(Context context, Context context2) {
    }

    default void onDestroy() {
    }
}
