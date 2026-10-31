package com.amplitude;

import android.os.Build;
import android.view.MotionEvent;

/* renamed from: com.amplitude.g1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public abstract class AbstractC0441g1 {
    public static float a(MotionEvent motionEvent) {
        return Build.VERSION.SDK_INT >= 29 ? motionEvent.getRawX(0) : motionEvent.getRawX();
    }

    public static float b(MotionEvent motionEvent) {
        return Build.VERSION.SDK_INT >= 29 ? motionEvent.getRawY(0) : motionEvent.getRawY();
    }
}
