package com.bytedance.sdk.openadsdk.core.ul;

import android.annotation.SuppressLint;
import android.content.Context;
import com.bytedance.sdk.openadsdk.core.ul.sya;

/* loaded from: classes2.dex */
public class ycx extends sya {

    @SuppressLint({"StaticFieldLeak"})
    private static volatile ycx ycx;

    private ycx(Context context) {
        super(context);
    }

    @Override // com.bytedance.sdk.openadsdk.core.ul.sya
    public /* bridge */ /* synthetic */ sya.C0089sya ycx() {
        return super.ycx();
    }

    public static ycx ycx(Context context) {
        if (ycx == null) {
            synchronized (ycx.class) {
                try {
                    if (ycx == null) {
                        ycx = new ycx(context);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }
}
