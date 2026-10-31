package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer;

import b.u4;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: e, reason: collision with root package name */
    public static final int f38365e = 0;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f38366a;

    /* renamed from: b, reason: collision with root package name */
    public final float f38367b;

    /* renamed from: c, reason: collision with root package name */
    public final int f38368c;

    /* renamed from: d, reason: collision with root package name */
    public final int f38369d;

    public g() {
        this(false, 0.0f, 0, 0, 15, null);
    }

    public final boolean a() {
        return this.f38366a;
    }

    public final float b() {
        return this.f38367b;
    }

    public final int c() {
        return this.f38368c;
    }

    public final int d() {
        return this.f38369d;
    }

    public final int e() {
        return this.f38369d;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return this.f38366a == gVar.f38366a && Float.compare(this.f38367b, gVar.f38367b) == 0 && this.f38368c == gVar.f38368c && this.f38369d == gVar.f38369d;
    }

    public final int f() {
        return this.f38368c;
    }

    public final boolean g() {
        return this.f38366a;
    }

    public final float h() {
        return this.f38367b;
    }

    public int hashCode() {
        return Integer.hashCode(this.f38369d) + u4.a(this.f38368c, a80.m.d(this.f38367b, Boolean.hashCode(this.f38366a) * 31, 31), 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AdaptiveBlurConfig(enabled=");
        sb2.append(this.f38366a);
        sb2.append(", gapThresholdFraction=");
        sb2.append(this.f38367b);
        sb2.append(", creativeWidthPx=");
        sb2.append(this.f38368c);
        sb2.append(", creativeHeightPx=");
        return a2.c.m(sb2, this.f38369d, ')');
    }

    public g(boolean z11, float f11, int i5, int i11) {
        this.f38366a = z11;
        this.f38367b = f11;
        this.f38368c = i5;
        this.f38369d = i11;
    }

    @NotNull
    public final g a(boolean z11, float f11, int i5, int i11) {
        return new g(z11, f11, i5, i11);
    }

    public static /* synthetic */ g a(g gVar, boolean z11, float f11, int i5, int i11, int i12, Object obj) {
        if ((i12 & 1) != 0) {
            z11 = gVar.f38366a;
        }
        if ((i12 & 2) != 0) {
            f11 = gVar.f38367b;
        }
        if ((i12 & 4) != 0) {
            i5 = gVar.f38368c;
        }
        if ((i12 & 8) != 0) {
            i11 = gVar.f38369d;
        }
        return gVar.a(z11, f11, i5, i11);
    }

    public /* synthetic */ g(boolean z11, float f11, int i5, int i11, int i12, DefaultConstructorMarker defaultConstructorMarker) {
        this((i12 & 1) != 0 ? false : z11, (i12 & 2) != 0 ? 0.1f : f11, (i12 & 4) != 0 ? 0 : i5, (i12 & 8) != 0 ? 0 : i11);
    }
}
