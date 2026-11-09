package com.anderson.applemusic.one.widget;

import android.view.View;
import android.view.ViewGroup;

/**
 * View-tree size of a screen, logged by the screens so the on-device measurements in
 * {@code README-one.md} ("views" before/after the recycled lists) can be reproduced with
 * {@code adb logcat -s AppleMusicOne | grep "perf "}.
 */
public final class Perf {

    private Perf() {
    }

    public static int views(View view) {
        if (view == null) return 0;
        int total = 1;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                total += views(group.getChildAt(i));
            }
        }
        return total;
    }
}
