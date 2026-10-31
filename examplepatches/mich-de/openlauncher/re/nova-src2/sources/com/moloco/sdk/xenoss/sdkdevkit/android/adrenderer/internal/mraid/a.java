package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid;

import android.content.Context;
import android.util.TypedValue;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f39055a = new a();

    /* renamed from: b, reason: collision with root package name */
    public static final int f39056b = 0;

    public final float a(Context context) {
        return context.getResources().getDisplayMetrics().density;
    }

    public final int b(float f11, @NotNull Context context) {
        Intrinsics.g(context, "context");
        return (int) (a(f11, context) + 0.5f);
    }

    public final float c(float f11, @NotNull Context context) {
        Intrinsics.g(context, "context");
        return a(context) * f11;
    }

    public final int d(float f11, @NotNull Context context) {
        Intrinsics.g(context, "context");
        return (int) (c(f11, context) + 0.5f);
    }

    public final float e(float f11, @NotNull Context context) {
        Intrinsics.g(context, "context");
        return f11 / a(context);
    }

    public final int f(float f11, @NotNull Context context) {
        Intrinsics.g(context, "context");
        return (int) (e(f11, context) + 0.5f);
    }

    public final float a(float f11, @NotNull Context context) {
        Intrinsics.g(context, "context");
        return TypedValue.applyDimension(1, f11, context.getResources().getDisplayMetrics());
    }

    public final int b(@NotNull Context context) {
        Intrinsics.g(context, "context");
        return f(context.getResources().getDisplayMetrics().heightPixels, context);
    }

    public final int c(@NotNull Context context) {
        Intrinsics.g(context, "context");
        return f(context.getResources().getDisplayMetrics().widthPixels, context);
    }
}
