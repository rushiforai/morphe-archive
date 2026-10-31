package com.moloco.sdk.internal.services.bidtoken;

import b.c0;
import h6.c1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: f, reason: collision with root package name */
    public static final int f37698f = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f37699a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f37700b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f37701c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f37702d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final String f37703e;

    public g(@NotNull String language, @NotNull String osVersion, @NotNull String make, @NotNull String model, @NotNull String hardwareVersion) {
        Intrinsics.g(language, "language");
        Intrinsics.g(osVersion, "osVersion");
        Intrinsics.g(make, "make");
        Intrinsics.g(model, "model");
        Intrinsics.g(hardwareVersion, "hardwareVersion");
        this.f37699a = language;
        this.f37700b = osVersion;
        this.f37701c = make;
        this.f37702d = model;
        this.f37703e = hardwareVersion;
    }

    @NotNull
    public final String a() {
        return this.f37699a;
    }

    @NotNull
    public final String b() {
        return this.f37700b;
    }

    @NotNull
    public final String c() {
        return this.f37701c;
    }

    @NotNull
    public final String d() {
        return this.f37702d;
    }

    @NotNull
    public final String e() {
        return this.f37703e;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return Intrinsics.b(this.f37699a, gVar.f37699a) && Intrinsics.b(this.f37700b, gVar.f37700b) && Intrinsics.b(this.f37701c, gVar.f37701c) && Intrinsics.b(this.f37702d, gVar.f37702d) && Intrinsics.b(this.f37703e, gVar.f37703e);
    }

    @NotNull
    public final String f() {
        return this.f37703e;
    }

    @NotNull
    public final String g() {
        return this.f37699a;
    }

    @NotNull
    public final String h() {
        return this.f37701c;
    }

    public int hashCode() {
        return this.f37703e.hashCode() + c0.e(c0.e(c0.e(this.f37699a.hashCode() * 31, 31, this.f37700b), 31, this.f37701c), 31, this.f37702d);
    }

    @NotNull
    public final String i() {
        return this.f37702d;
    }

    @NotNull
    public final String j() {
        return this.f37700b;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("BidTokenDeviceRequestInfo(language=");
        sb2.append(this.f37699a);
        sb2.append(", osVersion=");
        sb2.append(this.f37700b);
        sb2.append(", make=");
        sb2.append(this.f37701c);
        sb2.append(", model=");
        sb2.append(this.f37702d);
        sb2.append(", hardwareVersion=");
        return c1.t(sb2, this.f37703e, ')');
    }

    @NotNull
    public final g a(@NotNull String language, @NotNull String osVersion, @NotNull String make, @NotNull String model, @NotNull String hardwareVersion) {
        Intrinsics.g(language, "language");
        Intrinsics.g(osVersion, "osVersion");
        Intrinsics.g(make, "make");
        Intrinsics.g(model, "model");
        Intrinsics.g(hardwareVersion, "hardwareVersion");
        return new g(language, osVersion, make, model, hardwareVersion);
    }

    public static /* synthetic */ g a(g gVar, String str, String str2, String str3, String str4, String str5, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = gVar.f37699a;
        }
        if ((i5 & 2) != 0) {
            str2 = gVar.f37700b;
        }
        if ((i5 & 4) != 0) {
            str3 = gVar.f37701c;
        }
        if ((i5 & 8) != 0) {
            str4 = gVar.f37702d;
        }
        if ((i5 & 16) != 0) {
            str5 = gVar.f37703e;
        }
        String str6 = str5;
        String str7 = str3;
        return gVar.a(str, str2, str7, str4, str6);
    }
}
