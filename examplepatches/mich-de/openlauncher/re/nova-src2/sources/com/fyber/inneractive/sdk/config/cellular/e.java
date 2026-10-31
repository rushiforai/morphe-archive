package com.fyber.inneractive.sdk.config.cellular;

import android.content.Context;
import android.os.Build;

/* loaded from: classes.dex */
public abstract class e {
    public static d a(Context context) {
        return Build.VERSION.SDK_INT >= 31 ? new c(context) : new g(context);
    }
}
