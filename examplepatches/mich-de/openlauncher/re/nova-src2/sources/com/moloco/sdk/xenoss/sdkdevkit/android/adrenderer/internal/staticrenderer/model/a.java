package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.staticrenderer.model;

import a2.c;
import b.u4;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: g, reason: collision with root package name */
    public static final int f39335g = 0;

    /* renamed from: a, reason: collision with root package name */
    public final int f39336a;

    /* renamed from: b, reason: collision with root package name */
    public final int f39337b;

    /* renamed from: c, reason: collision with root package name */
    public final int f39338c;

    /* renamed from: d, reason: collision with root package name */
    public final int f39339d;

    /* renamed from: e, reason: collision with root package name */
    public final int f39340e;

    /* renamed from: f, reason: collision with root package name */
    public final int f39341f;

    public a(int i5, int i11, int i12, int i13, int i14, int i15) {
        this.f39336a = i5;
        this.f39337b = i11;
        this.f39338c = i12;
        this.f39339d = i13;
        this.f39340e = i14;
        this.f39341f = i15;
    }

    public final int a() {
        return this.f39336a;
    }

    public final int b() {
        return this.f39337b;
    }

    public final int c() {
        return this.f39338c;
    }

    public final int d() {
        return this.f39339d;
    }

    public final int e() {
        return this.f39340e;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f39336a == aVar.f39336a && this.f39337b == aVar.f39337b && this.f39338c == aVar.f39338c && this.f39339d == aVar.f39339d && this.f39340e == aVar.f39340e && this.f39341f == aVar.f39341f;
    }

    public final int f() {
        return this.f39341f;
    }

    public final int g() {
        return this.f39340e;
    }

    public final int h() {
        return this.f39341f;
    }

    public int hashCode() {
        return Integer.hashCode(this.f39341f) + u4.a(this.f39340e, u4.a(this.f39339d, u4.a(this.f39338c, u4.a(this.f39337b, Integer.hashCode(this.f39336a) * 31, 31), 31), 31), 31);
    }

    public final int i() {
        return this.f39336a;
    }

    public final int j() {
        return this.f39337b;
    }

    public final int k() {
        return this.f39338c;
    }

    public final int l() {
        return this.f39339d;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AdTouch(viewPositionX=");
        sb2.append(this.f39336a);
        sb2.append(", viewPositionY=");
        sb2.append(this.f39337b);
        sb2.append(", viewSizeHeight=");
        sb2.append(this.f39338c);
        sb2.append(", viewSizeWidth=");
        sb2.append(this.f39339d);
        sb2.append(", touchX=");
        sb2.append(this.f39340e);
        sb2.append(", touchY=");
        return c.m(sb2, this.f39341f, ')');
    }

    @NotNull
    public final a a(int i5, int i11, int i12, int i13, int i14, int i15) {
        return new a(i5, i11, i12, i13, i14, i15);
    }

    public static /* synthetic */ a a(a aVar, int i5, int i11, int i12, int i13, int i14, int i15, int i16, Object obj) {
        if ((i16 & 1) != 0) {
            i5 = aVar.f39336a;
        }
        if ((i16 & 2) != 0) {
            i11 = aVar.f39337b;
        }
        if ((i16 & 4) != 0) {
            i12 = aVar.f39338c;
        }
        if ((i16 & 8) != 0) {
            i13 = aVar.f39339d;
        }
        if ((i16 & 16) != 0) {
            i14 = aVar.f39340e;
        }
        if ((i16 & 32) != 0) {
            i15 = aVar.f39341f;
        }
        int i17 = i14;
        int i18 = i15;
        return aVar.a(i5, i11, i12, i13, i17, i18);
    }
}
