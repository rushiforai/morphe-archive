package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui;

import android.content.Context;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class c {
    public static final int a(int i5, @NotNull Context context) {
        Intrinsics.g(context, "context");
        return (int) (i5 * context.getResources().getDisplayMetrics().density);
    }
}
