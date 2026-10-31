package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.i, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2982i {

    /* renamed from: j, reason: collision with root package name */
    public static final int f38838j = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f38839a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String f38840b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f38841c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f38842d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final String f38843e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final Integer f38844f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final C2985l f38845g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public final C2983j f38846h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public final C2989p f38847i;

    public C2982i(@Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable String str4, @Nullable String str5, @Nullable Integer num, @Nullable C2985l c2985l, @Nullable C2983j c2983j, @Nullable C2989p c2989p) {
        this.f38839a = str;
        this.f38840b = str2;
        this.f38841c = str3;
        this.f38842d = str4;
        this.f38843e = str5;
        this.f38844f = num;
        this.f38845g = c2985l;
        this.f38846h = c2983j;
        this.f38847i = c2989p;
    }

    @Nullable
    public final String a() {
        return this.f38839a;
    }

    @Nullable
    public final String b() {
        return this.f38840b;
    }

    @Nullable
    public final String c() {
        return this.f38841c;
    }

    @Nullable
    public final String d() {
        return this.f38842d;
    }

    @Nullable
    public final String e() {
        return this.f38843e;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C2982i)) {
            return false;
        }
        C2982i c2982i = (C2982i) obj;
        return Intrinsics.b(this.f38839a, c2982i.f38839a) && Intrinsics.b(this.f38840b, c2982i.f38840b) && Intrinsics.b(this.f38841c, c2982i.f38841c) && Intrinsics.b(this.f38842d, c2982i.f38842d) && Intrinsics.b(this.f38843e, c2982i.f38843e) && Intrinsics.b(this.f38844f, c2982i.f38844f) && Intrinsics.b(this.f38845g, c2982i.f38845g) && Intrinsics.b(this.f38846h, c2982i.f38846h) && Intrinsics.b(this.f38847i, c2982i.f38847i);
    }

    @Nullable
    public final Integer f() {
        return this.f38844f;
    }

    @Nullable
    public final C2985l g() {
        return this.f38845g;
    }

    @Nullable
    public final C2983j h() {
        return this.f38846h;
    }

    public int hashCode() {
        String str = this.f38839a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f38840b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f38841c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f38842d;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f38843e;
        int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
        Integer num = this.f38844f;
        int iHashCode6 = (iHashCode5 + (num == null ? 0 : num.hashCode())) * 31;
        C2985l c2985l = this.f38845g;
        int iHashCode7 = (iHashCode6 + (c2985l == null ? 0 : c2985l.hashCode())) * 31;
        C2983j c2983j = this.f38846h;
        int iHashCode8 = (iHashCode7 + (c2983j == null ? 0 : c2983j.hashCode())) * 31;
        C2989p c2989p = this.f38847i;
        return iHashCode8 + (c2989p != null ? c2989p.hashCode() : 0);
    }

    @Nullable
    public final C2989p i() {
        return this.f38847i;
    }

    @Nullable
    public final String j() {
        return this.f38839a;
    }

    @Nullable
    public final Integer k() {
        return this.f38844f;
    }

    @Nullable
    public final String l() {
        return this.f38841c;
    }

    @Nullable
    public final String m() {
        return this.f38840b;
    }

    @Nullable
    public final C2983j n() {
        return this.f38846h;
    }

    @Nullable
    public final C2985l o() {
        return this.f38845g;
    }

    @Nullable
    public final C2989p p() {
        return this.f38847i;
    }

    @Nullable
    public final String q() {
        return this.f38842d;
    }

    @Nullable
    public final String r() {
        return this.f38843e;
    }

    @NotNull
    public String toString() {
        return "DEC(appName=" + this.f38839a + ", ctaUrl=" + this.f38840b + ", ctaTrackingUrl=" + this.f38841c + ", impressionTrackingUrl=" + this.f38842d + ", skipToDECTrackingUrl=" + this.f38843e + ", appNameFontSize=" + this.f38844f + ", decCta=" + this.f38845g + ", decAppIcon=" + this.f38846h + ", decRating=" + this.f38847i + ')';
    }

    @NotNull
    public final C2982i a(@Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable String str4, @Nullable String str5, @Nullable Integer num, @Nullable C2985l c2985l, @Nullable C2983j c2983j, @Nullable C2989p c2989p) {
        return new C2982i(str, str2, str3, str4, str5, num, c2985l, c2983j, c2989p);
    }

    public static /* synthetic */ C2982i a(C2982i c2982i, String str, String str2, String str3, String str4, String str5, Integer num, C2985l c2985l, C2983j c2983j, C2989p c2989p, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = c2982i.f38839a;
        }
        if ((i5 & 2) != 0) {
            str2 = c2982i.f38840b;
        }
        if ((i5 & 4) != 0) {
            str3 = c2982i.f38841c;
        }
        if ((i5 & 8) != 0) {
            str4 = c2982i.f38842d;
        }
        if ((i5 & 16) != 0) {
            str5 = c2982i.f38843e;
        }
        if ((i5 & 32) != 0) {
            num = c2982i.f38844f;
        }
        if ((i5 & 64) != 0) {
            c2985l = c2982i.f38845g;
        }
        if ((i5 & 128) != 0) {
            c2983j = c2982i.f38846h;
        }
        if ((i5 & 256) != 0) {
            c2989p = c2982i.f38847i;
        }
        C2983j c2983j2 = c2983j;
        C2989p c2989p2 = c2989p;
        Integer num2 = num;
        C2985l c2985l2 = c2985l;
        String str6 = str5;
        String str7 = str3;
        return c2982i.a(str, str2, str7, str4, str6, num2, c2985l2, c2983j2, c2989p2);
    }
}
