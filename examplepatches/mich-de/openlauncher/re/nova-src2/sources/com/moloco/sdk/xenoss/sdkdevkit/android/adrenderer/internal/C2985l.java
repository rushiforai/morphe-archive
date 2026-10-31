package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.l, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2985l {

    /* renamed from: h, reason: collision with root package name */
    public static final int f38855h = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final Integer f38856a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String f38857b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final Integer f38858c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final Integer f38859d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final C2984k f38860e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final String f38861f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final String f38862g;

    public C2985l(@Nullable Integer num, @Nullable String str, @Nullable Integer num2, @Nullable Integer num3, @Nullable C2984k c2984k, @Nullable String str2, @Nullable String str3) {
        this.f38856a = num;
        this.f38857b = str;
        this.f38858c = num2;
        this.f38859d = num3;
        this.f38860e = c2984k;
        this.f38861f = str2;
        this.f38862g = str3;
    }

    @Nullable
    public final Integer a() {
        return this.f38856a;
    }

    @Nullable
    public final String b() {
        return this.f38857b;
    }

    @Nullable
    public final Integer c() {
        return this.f38858c;
    }

    @Nullable
    public final Integer d() {
        return this.f38859d;
    }

    @Nullable
    public final C2984k e() {
        return this.f38860e;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C2985l)) {
            return false;
        }
        C2985l c2985l = (C2985l) obj;
        return Intrinsics.b(this.f38856a, c2985l.f38856a) && Intrinsics.b(this.f38857b, c2985l.f38857b) && Intrinsics.b(this.f38858c, c2985l.f38858c) && Intrinsics.b(this.f38859d, c2985l.f38859d) && Intrinsics.b(this.f38860e, c2985l.f38860e) && Intrinsics.b(this.f38861f, c2985l.f38861f) && Intrinsics.b(this.f38862g, c2985l.f38862g);
    }

    @Nullable
    public final String f() {
        return this.f38861f;
    }

    @Nullable
    public final String g() {
        return this.f38862g;
    }

    @Nullable
    public final String h() {
        return this.f38862g;
    }

    public int hashCode() {
        Integer num = this.f38856a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        String str = this.f38857b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        Integer num2 = this.f38858c;
        int iHashCode3 = (iHashCode2 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Integer num3 = this.f38859d;
        int iHashCode4 = (iHashCode3 + (num3 == null ? 0 : num3.hashCode())) * 31;
        C2984k c2984k = this.f38860e;
        int iHashCode5 = (iHashCode4 + (c2984k == null ? 0 : c2984k.hashCode())) * 31;
        String str2 = this.f38861f;
        int iHashCode6 = (iHashCode5 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f38862g;
        return iHashCode6 + (str3 != null ? str3.hashCode() : 0);
    }

    @Nullable
    public final C2984k i() {
        return this.f38860e;
    }

    @Nullable
    public final Integer j() {
        return this.f38858c;
    }

    @Nullable
    public final String k() {
        return this.f38857b;
    }

    @Nullable
    public final Integer l() {
        return this.f38859d;
    }

    @Nullable
    public final String m() {
        return this.f38861f;
    }

    @Nullable
    public final Integer n() {
        return this.f38856a;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("DECCta(verticalSpacing=");
        sb2.append(this.f38856a);
        sb2.append(", ctaText=");
        sb2.append(this.f38857b);
        sb2.append(", buttonWidth=");
        sb2.append(this.f38858c);
        sb2.append(", fontSize=");
        sb2.append(this.f38859d);
        sb2.append(", border=");
        sb2.append(this.f38860e);
        sb2.append(", foregroundColor=");
        sb2.append(this.f38861f);
        sb2.append(", backgroundColor=");
        return c1.t(sb2, this.f38862g, ')');
    }

    @NotNull
    public final C2985l a(@Nullable Integer num, @Nullable String str, @Nullable Integer num2, @Nullable Integer num3, @Nullable C2984k c2984k, @Nullable String str2, @Nullable String str3) {
        return new C2985l(num, str, num2, num3, c2984k, str2, str3);
    }

    public static /* synthetic */ C2985l a(C2985l c2985l, Integer num, String str, Integer num2, Integer num3, C2984k c2984k, String str2, String str3, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            num = c2985l.f38856a;
        }
        if ((i5 & 2) != 0) {
            str = c2985l.f38857b;
        }
        if ((i5 & 4) != 0) {
            num2 = c2985l.f38858c;
        }
        if ((i5 & 8) != 0) {
            num3 = c2985l.f38859d;
        }
        if ((i5 & 16) != 0) {
            c2984k = c2985l.f38860e;
        }
        if ((i5 & 32) != 0) {
            str2 = c2985l.f38861f;
        }
        if ((i5 & 64) != 0) {
            str3 = c2985l.f38862g;
        }
        String str4 = str2;
        String str5 = str3;
        C2984k c2984k2 = c2984k;
        Integer num4 = num2;
        return c2985l.a(num, str, num4, num3, c2984k2, str4, str5);
    }
}
