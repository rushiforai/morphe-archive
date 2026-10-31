package com.bytedance.sdk.openadsdk.oty.zb;

import android.view.View;
import com.bytedance.sdk.openadsdk.core.ifb;

/* loaded from: classes2.dex */
public class lt {
    public static boolean ycx(View view, int i5) {
        return ycx(view, false, i5);
    }

    public static boolean ycx(View view, boolean z11, int i5) {
        if (view == null) {
            return false;
        }
        return ifb.ycx(view, z11 ? 30 : 50, i5, false);
    }
}
