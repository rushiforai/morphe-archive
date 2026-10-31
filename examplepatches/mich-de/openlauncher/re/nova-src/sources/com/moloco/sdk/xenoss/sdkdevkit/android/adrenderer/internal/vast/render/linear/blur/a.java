package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.blur;

import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f41727a = new a();

    /* renamed from: b, reason: collision with root package name */
    public static final int f41728b = 0;

    public final float a(int i5, int i11, int i12, int i13) {
        if (i5 <= 0 || i11 <= 0 || i12 <= 0 || i13 <= 0) {
            return 0.0f;
        }
        float f11 = i12;
        float f12 = i5;
        float f13 = i13;
        float f14 = i11;
        float fMin = Math.min(f11 / f12, f13 / f14);
        return kotlin.ranges.a.d0(1.0f - (((f14 * fMin) * (f12 * fMin)) / (f11 * f13)), 0.0f, 1.0f);
    }
}
