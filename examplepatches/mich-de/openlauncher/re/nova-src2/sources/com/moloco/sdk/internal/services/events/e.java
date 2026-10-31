package com.moloco.sdk.internal.services.events;

import b.c0;
import b.c9;
import h6.c1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f37986a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f37987b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f37988c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f37989d;

    public e(boolean z11, boolean z12, @NotNull String appForegroundUrl, @NotNull String appBackgroundUrl) {
        Intrinsics.g(appForegroundUrl, "appForegroundUrl");
        Intrinsics.g(appBackgroundUrl, "appBackgroundUrl");
        this.f37986a = z11;
        this.f37987b = z12;
        this.f37988c = appForegroundUrl;
        this.f37989d = appBackgroundUrl;
    }

    public final boolean a() {
        return this.f37986a;
    }

    public final boolean b() {
        return this.f37987b;
    }

    @NotNull
    public final String c() {
        return this.f37988c;
    }

    @NotNull
    public final String d() {
        return this.f37989d;
    }

    @NotNull
    public final String e() {
        return this.f37989d;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return this.f37986a == eVar.f37986a && this.f37987b == eVar.f37987b && Intrinsics.b(this.f37988c, eVar.f37988c) && Intrinsics.b(this.f37989d, eVar.f37989d);
    }

    @NotNull
    public final String f() {
        return this.f37988c;
    }

    public final boolean g() {
        return this.f37986a;
    }

    public final boolean h() {
        return this.f37987b;
    }

    public int hashCode() {
        return this.f37989d.hashCode() + c0.e(c9.f(Boolean.hashCode(this.f37986a) * 31, 31, this.f37987b), 31, this.f37988c);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("UserEventConfig(eventReportingEnabled=");
        sb2.append(this.f37986a);
        sb2.append(", userTrackingEnabled=");
        sb2.append(this.f37987b);
        sb2.append(", appForegroundUrl=");
        sb2.append(this.f37988c);
        sb2.append(", appBackgroundUrl=");
        return c1.t(sb2, this.f37989d, ')');
    }

    @NotNull
    public final e a(boolean z11, boolean z12, @NotNull String appForegroundUrl, @NotNull String appBackgroundUrl) {
        Intrinsics.g(appForegroundUrl, "appForegroundUrl");
        Intrinsics.g(appBackgroundUrl, "appBackgroundUrl");
        return new e(z11, z12, appForegroundUrl, appBackgroundUrl);
    }

    public static /* synthetic */ e a(e eVar, boolean z11, boolean z12, String str, String str2, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = eVar.f37986a;
        }
        if ((i5 & 2) != 0) {
            z12 = eVar.f37987b;
        }
        if ((i5 & 4) != 0) {
            str = eVar.f37988c;
        }
        if ((i5 & 8) != 0) {
            str2 = eVar.f37989d;
        }
        return eVar.a(z11, z12, str, str2);
    }
}
