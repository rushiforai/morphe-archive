package com.moloco.sdk.internal.services;

import b.c9;
import b.u4;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class E {

    /* renamed from: i, reason: collision with root package name */
    public static final int f37620i = 0;

    /* renamed from: a, reason: collision with root package name */
    public final int f37621a;

    /* renamed from: b, reason: collision with root package name */
    public final float f37622b;

    /* renamed from: c, reason: collision with root package name */
    public final int f37623c;

    /* renamed from: d, reason: collision with root package name */
    public final float f37624d;

    /* renamed from: e, reason: collision with root package name */
    public final float f37625e;

    /* renamed from: f, reason: collision with root package name */
    public final int f37626f;

    /* renamed from: g, reason: collision with root package name */
    public final float f37627g;

    /* renamed from: h, reason: collision with root package name */
    public final float f37628h;

    public E(int i5, float f11, int i11, float f12, float f13, int i12, float f14, float f15) {
        this.f37621a = i5;
        this.f37622b = f11;
        this.f37623c = i11;
        this.f37624d = f12;
        this.f37625e = f13;
        this.f37626f = i12;
        this.f37627g = f14;
        this.f37628h = f15;
    }

    public final int a() {
        return this.f37621a;
    }

    public final float b() {
        return this.f37622b;
    }

    public final int c() {
        return this.f37623c;
    }

    public final float d() {
        return this.f37624d;
    }

    public final float e() {
        return this.f37625e;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof E)) {
            return false;
        }
        E e3 = (E) obj;
        return this.f37621a == e3.f37621a && Float.compare(this.f37622b, e3.f37622b) == 0 && this.f37623c == e3.f37623c && Float.compare(this.f37624d, e3.f37624d) == 0 && Float.compare(this.f37625e, e3.f37625e) == 0 && this.f37626f == e3.f37626f && Float.compare(this.f37627g, e3.f37627g) == 0 && Float.compare(this.f37628h, e3.f37628h) == 0;
    }

    public final int f() {
        return this.f37626f;
    }

    public final float g() {
        return this.f37627g;
    }

    public final float h() {
        return this.f37628h;
    }

    public int hashCode() {
        return Float.hashCode(this.f37628h) + a80.m.d(this.f37627g, u4.a(this.f37626f, a80.m.d(this.f37625e, a80.m.d(this.f37624d, u4.a(this.f37623c, a80.m.d(this.f37622b, Integer.hashCode(this.f37621a) * 31, 31), 31), 31), 31), 31), 31);
    }

    public final float i() {
        return this.f37625e;
    }

    public final int j() {
        return this.f37626f;
    }

    public final float k() {
        return this.f37624d;
    }

    public final int l() {
        return this.f37623c;
    }

    public final float m() {
        return this.f37622b;
    }

    public final int n() {
        return this.f37621a;
    }

    public final float o() {
        return this.f37627g;
    }

    public final float p() {
        return this.f37628h;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ScreenInfo(screenWidthPx=");
        sb2.append(this.f37621a);
        sb2.append(", screenWidthDp=");
        sb2.append(this.f37622b);
        sb2.append(", screenHeightPx=");
        sb2.append(this.f37623c);
        sb2.append(", screenHeightDp=");
        sb2.append(this.f37624d);
        sb2.append(", density=");
        sb2.append(this.f37625e);
        sb2.append(", dpi=");
        sb2.append(this.f37626f);
        sb2.append(", xdpi=");
        sb2.append(this.f37627g);
        sb2.append(", ydpi=");
        return c9.k(sb2, this.f37628h, ')');
    }

    @NotNull
    public final E a(int i5, float f11, int i11, float f12, float f13, int i12, float f14, float f15) {
        return new E(i5, f11, i11, f12, f13, i12, f14, f15);
    }

    public static /* synthetic */ E a(E e3, int i5, float f11, int i11, float f12, float f13, int i12, float f14, float f15, int i13, Object obj) {
        if ((i13 & 1) != 0) {
            i5 = e3.f37621a;
        }
        if ((i13 & 2) != 0) {
            f11 = e3.f37622b;
        }
        if ((i13 & 4) != 0) {
            i11 = e3.f37623c;
        }
        if ((i13 & 8) != 0) {
            f12 = e3.f37624d;
        }
        if ((i13 & 16) != 0) {
            f13 = e3.f37625e;
        }
        if ((i13 & 32) != 0) {
            i12 = e3.f37626f;
        }
        if ((i13 & 64) != 0) {
            f14 = e3.f37627g;
        }
        if ((i13 & 128) != 0) {
            f15 = e3.f37628h;
        }
        float f16 = f14;
        float f17 = f15;
        float f18 = f13;
        int i14 = i12;
        return e3.a(i5, f11, i11, f12, f18, i14, f16, f17);
    }
}
