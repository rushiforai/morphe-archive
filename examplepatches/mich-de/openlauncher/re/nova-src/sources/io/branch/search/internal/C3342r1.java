package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.r1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3342r1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f65584a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f65585b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f65586c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f65587d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final String f65588e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final String f65589f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final String f65590g;

    /* renamed from: h, reason: collision with root package name */
    public final int f65591h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final String f65592i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final String f65593j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final String f65594k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f65595l;

    /* renamed from: m, reason: collision with root package name */
    @NotNull
    public final String f65596m;
    public final boolean n;
    public final boolean o;

    /* renamed from: p, reason: collision with root package name */
    @Nullable
    public final String f65597p;

    /* renamed from: q, reason: collision with root package name */
    @Nullable
    public final Integer f65598q;

    /* renamed from: r, reason: collision with root package name */
    @Nullable
    public final Integer f65599r;

    /* renamed from: s, reason: collision with root package name */
    @Nullable
    public final Integer f65600s;

    /* renamed from: t, reason: collision with root package name */
    @Nullable
    public final Double f65601t;

    /* renamed from: u, reason: collision with root package name */
    @Nullable
    public final Double f65602u;

    /* renamed from: v, reason: collision with root package name */
    public final boolean f65603v;

    /* renamed from: w, reason: collision with root package name */
    @Nullable
    public final String f65604w;

    /* renamed from: x, reason: collision with root package name */
    @Nullable
    public final String f65605x;

    public C3342r1() {
        this(0);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3342r1)) {
            return false;
        }
        C3342r1 c3342r1 = (C3342r1) obj;
        return Intrinsics.b(this.f65584a, c3342r1.f65584a) && Intrinsics.b(this.f65585b, c3342r1.f65585b) && Intrinsics.b(this.f65586c, c3342r1.f65586c) && Intrinsics.b(this.f65587d, c3342r1.f65587d) && Intrinsics.b(this.f65588e, c3342r1.f65588e) && Intrinsics.b(this.f65589f, c3342r1.f65589f) && Intrinsics.b(this.f65590g, c3342r1.f65590g) && this.f65591h == c3342r1.f65591h && Intrinsics.b(this.f65592i, c3342r1.f65592i) && Intrinsics.b(this.f65593j, c3342r1.f65593j) && Intrinsics.b(this.f65594k, c3342r1.f65594k) && this.f65595l == c3342r1.f65595l && Intrinsics.b(this.f65596m, c3342r1.f65596m) && this.n == c3342r1.n && this.o == c3342r1.o && Intrinsics.b(this.f65597p, c3342r1.f65597p) && Intrinsics.b(this.f65598q, c3342r1.f65598q) && Intrinsics.b(this.f65599r, c3342r1.f65599r) && Intrinsics.b(this.f65600s, c3342r1.f65600s) && Intrinsics.b(this.f65601t, c3342r1.f65601t) && Intrinsics.b(this.f65602u, c3342r1.f65602u) && this.f65603v == c3342r1.f65603v && Intrinsics.b(this.f65604w, c3342r1.f65604w) && Intrinsics.b(this.f65605x, c3342r1.f65605x);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iA = C3248l8.a(this.f65594k, C3248l8.a(this.f65593j, C3248l8.a(this.f65592i, C3214j8.a(this.f65591h, C3248l8.a(this.f65590g, C3248l8.a(this.f65589f, C3248l8.a(this.f65588e, C3248l8.a(this.f65587d, C3248l8.a(this.f65586c, C3248l8.a(this.f65585b, this.f65584a.hashCode() * 31, 31), 31), 31), 31), 31), 31), 31), 31), 31), 31);
        boolean z11 = this.f65595l;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int iA2 = C3248l8.a(this.f65596m, (iA + i5) * 31, 31);
        boolean z12 = this.n;
        int i11 = z12;
        if (z12 != 0) {
            i11 = 1;
        }
        int i12 = (iA2 + i11) * 31;
        boolean z13 = this.o;
        int i13 = z13;
        if (z13 != 0) {
            i13 = 1;
        }
        int i14 = (i12 + i13) * 31;
        String str = this.f65597p;
        int iHashCode = (i14 + (str == null ? 0 : str.hashCode())) * 31;
        Integer num = this.f65598q;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.f65599r;
        int iHashCode3 = (iHashCode2 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Integer num3 = this.f65600s;
        int iHashCode4 = (iHashCode3 + (num3 == null ? 0 : num3.hashCode())) * 31;
        Double d5 = this.f65601t;
        int iHashCode5 = (iHashCode4 + (d5 == null ? 0 : d5.hashCode())) * 31;
        Double d11 = this.f65602u;
        int iHashCode6 = (iHashCode5 + (d11 == null ? 0 : d11.hashCode())) * 31;
        boolean z14 = this.f65603v;
        int i15 = (iHashCode6 + (z14 ? 1 : z14 ? 1 : 0)) * 31;
        String str2 = this.f65604w;
        int iHashCode7 = (i15 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f65605x;
        return iHashCode7 + (str3 != null ? str3.hashCode() : 0);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BasicDeviceData(brand=");
        sb2.append(this.f65584a);
        sb2.append(", carrier=");
        sb2.append(this.f65585b);
        sb2.append(", carrierSim=");
        sb2.append(this.f65586c);
        sb2.append(", locale=");
        sb2.append(this.f65587d);
        sb2.append(", initialLocale=");
        sb2.append(this.f65588e);
        sb2.append(", currentLocale=");
        sb2.append(this.f65589f);
        sb2.append(", model=");
        sb2.append(this.f65590g);
        sb2.append(", osVersion=");
        sb2.append(this.f65591h);
        sb2.append(", os=");
        sb2.append(this.f65592i);
        sb2.append(", sdk=");
        sb2.append(this.f65593j);
        sb2.append(", sdkVersion=");
        sb2.append(this.f65594k);
        sb2.append(", appUsageAllowed=");
        sb2.append(this.f65595l);
        sb2.append(", appUsageAllowedStatus=");
        sb2.append(this.f65596m);
        sb2.append(", defaultLauncher=");
        sb2.append(this.n);
        sb2.append(", isOnVpn=");
        sb2.append(this.o);
        sb2.append(", userAgent=");
        sb2.append(this.f65597p);
        sb2.append(", screenDpi=");
        sb2.append(this.f65598q);
        sb2.append(", screenWidth=");
        sb2.append(this.f65599r);
        sb2.append(", screenHeight=");
        sb2.append(this.f65600s);
        sb2.append(", latitude=");
        sb2.append(this.f65601t);
        sb2.append(", longitude=");
        sb2.append(this.f65602u);
        sb2.append(", isLowRamDevice=");
        sb2.append(this.f65603v);
        sb2.append(", appPackage=");
        sb2.append(this.f65604w);
        sb2.append(", appVersion=");
        return h6.c1.t(sb2, this.f65605x, ')');
    }

    public /* synthetic */ C3342r1(int i5) {
        this(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, -1, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false, false, null, null, null, null, null, null, false, null, null);
    }

    public C3342r1(@NotNull String brand, @NotNull String carrier, @NotNull String carrierSim, @NotNull String locale, @NotNull String initialLocale, @NotNull String currentLocale, @NotNull String model, int i5, @NotNull String os2, @NotNull String sdk, @NotNull String sdkVersion, boolean z11, @NotNull String appUsageAllowedStatus, boolean z12, boolean z13, @Nullable String str, @Nullable Integer num, @Nullable Integer num2, @Nullable Integer num3, @Nullable Double d5, @Nullable Double d11, boolean z14, @Nullable String str2, @Nullable String str3) {
        Intrinsics.g(brand, "brand");
        Intrinsics.g(carrier, "carrier");
        Intrinsics.g(carrierSim, "carrierSim");
        Intrinsics.g(locale, "locale");
        Intrinsics.g(initialLocale, "initialLocale");
        Intrinsics.g(currentLocale, "currentLocale");
        Intrinsics.g(model, "model");
        Intrinsics.g(os2, "os");
        Intrinsics.g(sdk, "sdk");
        Intrinsics.g(sdkVersion, "sdkVersion");
        Intrinsics.g(appUsageAllowedStatus, "appUsageAllowedStatus");
        this.f65584a = brand;
        this.f65585b = carrier;
        this.f65586c = carrierSim;
        this.f65587d = locale;
        this.f65588e = initialLocale;
        this.f65589f = currentLocale;
        this.f65590g = model;
        this.f65591h = i5;
        this.f65592i = os2;
        this.f65593j = sdk;
        this.f65594k = sdkVersion;
        this.f65595l = z11;
        this.f65596m = appUsageAllowedStatus;
        this.n = z12;
        this.o = z13;
        this.f65597p = str;
        this.f65598q = num;
        this.f65599r = num2;
        this.f65600s = num3;
        this.f65601t = d5;
        this.f65602u = d11;
        this.f65603v = z14;
        this.f65604w = str2;
        this.f65605x = str3;
    }
}
