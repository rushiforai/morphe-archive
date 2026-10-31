package com.bytedance.sdk.openadsdk.core;

import android.annotation.SuppressLint;
import android.content.Context;
import com.bytedance.sdk.openadsdk.core.ul;

/* loaded from: classes2.dex */
public class lt extends ul {

    @SuppressLint({"StaticFieldLeak"})
    private static volatile lt ycx;

    private lt(Context context) {
        super(context);
    }

    @Override // com.bytedance.sdk.openadsdk.core.ul
    public /* bridge */ /* synthetic */ ul.sya ycx() {
        return super.ycx();
    }

    public static lt ycx(Context context) {
        if (ycx == null) {
            synchronized (lt.class) {
                try {
                    if (ycx == null) {
                        ycx = new lt(context);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }
}
