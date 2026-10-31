package com.bytedance.sdk.component.lt.ycx.ycx.ycx;

import android.annotation.SuppressLint;
import android.content.Context;
import com.bytedance.sdk.component.lt.ycx.ycx.ycx.zb;

/* loaded from: classes2.dex */
public class ycx extends zb {

    @SuppressLint({"StaticFieldLeak"})
    private static volatile ycx ycx;

    private ycx(Context context) {
        super(context);
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.ycx.zb
    public /* bridge */ /* synthetic */ zb.C0040zb ycx() {
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
