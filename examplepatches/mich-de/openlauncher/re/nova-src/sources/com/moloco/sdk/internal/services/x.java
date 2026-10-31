package com.moloco.sdk.internal.services;

import b.c0;
import b.c9;
import b.u4;
import h6.c1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class x {
    public static final int n = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f38163a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f38164b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f38165c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f38166d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final String f38167e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final String f38168f;

    /* renamed from: g, reason: collision with root package name */
    public final int f38169g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f38170h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final String f38171i;

    /* renamed from: j, reason: collision with root package name */
    public final float f38172j;

    /* renamed from: k, reason: collision with root package name */
    public final long f38173k;

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public final String f38174l;

    /* renamed from: m, reason: collision with root package name */
    @NotNull
    public final String f38175m;

    public x(@NotNull String manufacturer, @NotNull String model, @NotNull String hwVersion, boolean z11, @NotNull String os2, @NotNull String osVersion, int i5, @NotNull String language, @NotNull String mobileCarrier, float f11, long j11, @NotNull String hardware, @NotNull String brand) {
        Intrinsics.g(manufacturer, "manufacturer");
        Intrinsics.g(model, "model");
        Intrinsics.g(hwVersion, "hwVersion");
        Intrinsics.g(os2, "os");
        Intrinsics.g(osVersion, "osVersion");
        Intrinsics.g(language, "language");
        Intrinsics.g(mobileCarrier, "mobileCarrier");
        Intrinsics.g(hardware, "hardware");
        Intrinsics.g(brand, "brand");
        this.f38163a = manufacturer;
        this.f38164b = model;
        this.f38165c = hwVersion;
        this.f38166d = z11;
        this.f38167e = os2;
        this.f38168f = osVersion;
        this.f38169g = i5;
        this.f38170h = language;
        this.f38171i = mobileCarrier;
        this.f38172j = f11;
        this.f38173k = j11;
        this.f38174l = hardware;
        this.f38175m = brand;
    }

    @NotNull
    public final String a() {
        return this.f38163a;
    }

    public final float b() {
        return this.f38172j;
    }

    public final long c() {
        return this.f38173k;
    }

    @NotNull
    public final String d() {
        return this.f38174l;
    }

    @NotNull
    public final String e() {
        return this.f38175m;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x)) {
            return false;
        }
        x xVar = (x) obj;
        return Intrinsics.b(this.f38163a, xVar.f38163a) && Intrinsics.b(this.f38164b, xVar.f38164b) && Intrinsics.b(this.f38165c, xVar.f38165c) && this.f38166d == xVar.f38166d && Intrinsics.b(this.f38167e, xVar.f38167e) && Intrinsics.b(this.f38168f, xVar.f38168f) && this.f38169g == xVar.f38169g && Intrinsics.b(this.f38170h, xVar.f38170h) && Intrinsics.b(this.f38171i, xVar.f38171i) && Float.compare(this.f38172j, xVar.f38172j) == 0 && this.f38173k == xVar.f38173k && Intrinsics.b(this.f38174l, xVar.f38174l) && Intrinsics.b(this.f38175m, xVar.f38175m);
    }

    @NotNull
    public final String f() {
        return this.f38164b;
    }

    @NotNull
    public final String g() {
        return this.f38165c;
    }

    public final boolean h() {
        return this.f38166d;
    }

    public int hashCode() {
        return this.f38175m.hashCode() + c0.e(c0.d(a80.m.d(this.f38172j, c0.e(c0.e(u4.a(this.f38169g, c0.e(c0.e(c9.f(c0.e(c0.e(this.f38163a.hashCode() * 31, 31, this.f38164b), 31, this.f38165c), 31, this.f38166d), 31, this.f38167e), 31, this.f38168f), 31), 31, this.f38170h), 31, this.f38171i), 31), 31, this.f38173k), 31, this.f38174l);
    }

    @NotNull
    public final String i() {
        return this.f38167e;
    }

    @NotNull
    public final String j() {
        return this.f38168f;
    }

    public final int k() {
        return this.f38169g;
    }

    @NotNull
    public final String l() {
        return this.f38170h;
    }

    @NotNull
    public final String m() {
        return this.f38171i;
    }

    public final int n() {
        return this.f38169g;
    }

    @NotNull
    public final String o() {
        return this.f38175m;
    }

    public final long p() {
        return this.f38173k;
    }

    @NotNull
    public final String q() {
        return this.f38174l;
    }

    @NotNull
    public final String r() {
        return this.f38165c;
    }

    @NotNull
    public final String s() {
        return this.f38170h;
    }

    @NotNull
    public final String t() {
        return this.f38163a;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("DeviceInfo(manufacturer=");
        sb2.append(this.f38163a);
        sb2.append(", model=");
        sb2.append(this.f38164b);
        sb2.append(", hwVersion=");
        sb2.append(this.f38165c);
        sb2.append(", isTablet=");
        sb2.append(this.f38166d);
        sb2.append(", os=");
        sb2.append(this.f38167e);
        sb2.append(", osVersion=");
        sb2.append(this.f38168f);
        sb2.append(", apiLevel=");
        sb2.append(this.f38169g);
        sb2.append(", language=");
        sb2.append(this.f38170h);
        sb2.append(", mobileCarrier=");
        sb2.append(this.f38171i);
        sb2.append(", screenDensity=");
        sb2.append(this.f38172j);
        sb2.append(", dbtMs=");
        sb2.append(this.f38173k);
        sb2.append(", hardware=");
        sb2.append(this.f38174l);
        sb2.append(", brand=");
        return c1.t(sb2, this.f38175m, ')');
    }

    @NotNull
    public final String u() {
        return this.f38171i;
    }

    @NotNull
    public final String v() {
        return this.f38164b;
    }

    @NotNull
    public final String w() {
        return this.f38167e;
    }

    @NotNull
    public final String x() {
        return this.f38168f;
    }

    public final float y() {
        return this.f38172j;
    }

    public final boolean z() {
        return this.f38166d;
    }

    @NotNull
    public final x a(@NotNull String manufacturer, @NotNull String model, @NotNull String hwVersion, boolean z11, @NotNull String os2, @NotNull String osVersion, int i5, @NotNull String language, @NotNull String mobileCarrier, float f11, long j11, @NotNull String hardware, @NotNull String brand) {
        Intrinsics.g(manufacturer, "manufacturer");
        Intrinsics.g(model, "model");
        Intrinsics.g(hwVersion, "hwVersion");
        Intrinsics.g(os2, "os");
        Intrinsics.g(osVersion, "osVersion");
        Intrinsics.g(language, "language");
        Intrinsics.g(mobileCarrier, "mobileCarrier");
        Intrinsics.g(hardware, "hardware");
        Intrinsics.g(brand, "brand");
        return new x(manufacturer, model, hwVersion, z11, os2, osVersion, i5, language, mobileCarrier, f11, j11, hardware, brand);
    }
}
