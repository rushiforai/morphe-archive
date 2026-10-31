package com.bytedance.sdk.component.adexpress.dj;

import android.content.Context;
import android.text.TextUtils;

/* loaded from: classes2.dex */
public class zb {
    public static boolean ycx(Context context) {
        return context != null && TextUtils.getLayoutDirectionFromLocale(context.getResources().getConfiguration().locale) == 1 && (context.getApplicationInfo().flags & 4194304) == 4194304;
    }
}
