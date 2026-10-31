package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall;

import b.c9;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: f, reason: collision with root package name */
    public static final int f39817f = 0;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f39818a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f39819b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f39820c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f39821d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f39822e;

    public a(boolean z11, boolean z12, @Nullable String str, @Nullable String str2, boolean z13) {
        this.f39818a = z11;
        this.f39819b = z12;
        this.f39820c = str;
        this.f39821d = str2;
        this.f39822e = z13;
    }

    public final boolean a() {
        return this.f39818a;
    }

    public final boolean b() {
        return this.f39819b;
    }

    @Nullable
    public final String c() {
        return this.f39820c;
    }

    @Nullable
    public final String d() {
        return this.f39821d;
    }

    public final boolean e() {
        return this.f39822e;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f39818a == aVar.f39818a && this.f39819b == aVar.f39819b && Intrinsics.b(this.f39820c, aVar.f39820c) && Intrinsics.b(this.f39821d, aVar.f39821d) && this.f39822e == aVar.f39822e;
    }

    @Nullable
    public final String f() {
        return this.f39821d;
    }

    public final boolean g() {
        return this.f39818a;
    }

    @Nullable
    public final String h() {
        return this.f39820c;
    }

    public int hashCode() {
        int iF = c9.f(Boolean.hashCode(this.f39818a) * 31, 31, this.f39819b);
        String str = this.f39820c;
        int iHashCode = (iF + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f39821d;
        return Boolean.hashCode(this.f39822e) + ((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    public final boolean i() {
        return this.f39822e;
    }

    public final boolean j() {
        return this.f39819b;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AndroidAutoInlineControllerData(enabled=");
        sb2.append(this.f39818a);
        sb2.append(", onSkip=");
        sb2.append(this.f39819b);
        sb2.append(", eventLink=");
        sb2.append(this.f39820c);
        sb2.append(", clickthroughUrl=");
        sb2.append(this.f39821d);
        sb2.append(", forceFullscreen=");
        return a2.c.p(sb2, this.f39822e, ')');
    }

    @NotNull
    public final a a(boolean z11, boolean z12, @Nullable String str, @Nullable String str2, boolean z13) {
        return new a(z11, z12, str, str2, z13);
    }

    public static /* synthetic */ a a(a aVar, boolean z11, boolean z12, String str, String str2, boolean z13, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = aVar.f39818a;
        }
        if ((i5 & 2) != 0) {
            z12 = aVar.f39819b;
        }
        if ((i5 & 4) != 0) {
            str = aVar.f39820c;
        }
        if ((i5 & 8) != 0) {
            str2 = aVar.f39821d;
        }
        if ((i5 & 16) != 0) {
            z13 = aVar.f39822e;
        }
        boolean z14 = z13;
        String str3 = str;
        return aVar.a(z11, z12, str3, str2, z14);
    }
}
