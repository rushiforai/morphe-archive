package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media;

import b.c9;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class l {

    /* renamed from: e, reason: collision with root package name */
    public static final int f39001e = 0;

    /* renamed from: a, reason: collision with root package name */
    public final int f39002a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f39003b;

    /* renamed from: c, reason: collision with root package name */
    public final double f39004c;

    /* renamed from: d, reason: collision with root package name */
    public final int f39005d;

    public l(int i5, boolean z11, double d5, int i11) {
        this.f39002a = i5;
        this.f39003b = z11;
        this.f39004c = d5;
        this.f39005d = i11;
    }

    public final int a() {
        return this.f39002a;
    }

    public final boolean b() {
        return this.f39003b;
    }

    public final double c() {
        return this.f39004c;
    }

    public final int d() {
        return this.f39005d;
    }

    public final int e() {
        return this.f39002a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l)) {
            return false;
        }
        l lVar = (l) obj;
        return this.f39002a == lVar.f39002a && this.f39003b == lVar.f39003b && Double.compare(this.f39004c, lVar.f39004c) == 0 && this.f39005d == lVar.f39005d;
    }

    public final int f() {
        return this.f39005d;
    }

    public final double g() {
        return this.f39004c;
    }

    public final boolean h() {
        return this.f39003b;
    }

    public int hashCode() {
        return Integer.hashCode(this.f39005d) + c9.c(this.f39004c, c9.f(Integer.hashCode(this.f39002a) * 31, 31, this.f39003b), 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("MediaConfig(chunkSize=");
        sb2.append(this.f39002a);
        sb2.append(", isStreamingEnabled=");
        sb2.append(this.f39003b);
        sb2.append(", minStreamingPlayableDurationOnTimeoutSecs=");
        sb2.append(this.f39004c);
        sb2.append(", mediaCacheDiskCleanUpLimit=");
        return a2.c.m(sb2, this.f39005d, ')');
    }

    @NotNull
    public final l a(int i5, boolean z11, double d5, int i11) {
        return new l(i5, z11, d5, i11);
    }

    public static /* synthetic */ l a(l lVar, int i5, boolean z11, double d5, int i11, int i12, Object obj) {
        if ((i12 & 1) != 0) {
            i5 = lVar.f39002a;
        }
        if ((i12 & 2) != 0) {
            z11 = lVar.f39003b;
        }
        if ((i12 & 4) != 0) {
            d5 = lVar.f39004c;
        }
        if ((i12 & 8) != 0) {
            i11 = lVar.f39005d;
        }
        int i13 = i11;
        return lVar.a(i5, z11, d5, i13);
    }
}
