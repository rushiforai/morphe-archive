package com.moloco.sdk.internal.android_context;

import android.content.Context;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class b {
    public static /* synthetic */ Context a(Context context, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            context = null;
        }
        return a(context);
    }

    @NotNull
    public static final Context a(@Nullable Context context) {
        if (context != null) {
            a.f36216a.a(context);
        }
        return a.f36216a.a();
    }
}
