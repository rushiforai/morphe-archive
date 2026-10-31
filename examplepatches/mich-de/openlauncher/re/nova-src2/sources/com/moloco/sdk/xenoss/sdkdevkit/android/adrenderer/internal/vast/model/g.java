package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: f, reason: collision with root package name */
    public static final int f40744f = 0;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f40745a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Integer f40746b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f40747c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f40748d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final h f40749e;

    public g(@Nullable String str, @Nullable Integer num, @Nullable String str2, @Nullable String str3, @NotNull h child) {
        Intrinsics.g(child, "child");
        this.f40745a = str;
        this.f40746b = num;
        this.f40747c = str2;
        this.f40748d = str3;
        this.f40749e = child;
    }

    @Nullable
    public final String a() {
        return this.f40745a;
    }

    @Nullable
    public final Integer b() {
        return this.f40746b;
    }

    @Nullable
    public final String c() {
        return this.f40747c;
    }

    @Nullable
    public final String d() {
        return this.f40748d;
    }

    @NotNull
    public final h e() {
        return this.f40749e;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return Intrinsics.b(this.f40745a, gVar.f40745a) && Intrinsics.b(this.f40746b, gVar.f40746b) && Intrinsics.b(this.f40747c, gVar.f40747c) && Intrinsics.b(this.f40748d, gVar.f40748d) && Intrinsics.b(this.f40749e, gVar.f40749e);
    }

    @Nullable
    public final String f() {
        return this.f40747c;
    }

    @Nullable
    public final String g() {
        return this.f40748d;
    }

    @NotNull
    public final h h() {
        return this.f40749e;
    }

    public int hashCode() {
        String str = this.f40745a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        Integer num = this.f40746b;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        String str2 = this.f40747c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f40748d;
        return this.f40749e.hashCode() + ((iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 31);
    }

    @Nullable
    public final String i() {
        return this.f40745a;
    }

    @Nullable
    public final Integer j() {
        return this.f40746b;
    }

    @NotNull
    public String toString() {
        return "Creative(id=" + this.f40745a + ", sequence=" + this.f40746b + ", adId=" + this.f40747c + ", apiFramework=" + this.f40748d + ", child=" + this.f40749e + ')';
    }

    @NotNull
    public final g a(@Nullable String str, @Nullable Integer num, @Nullable String str2, @Nullable String str3, @NotNull h child) {
        Intrinsics.g(child, "child");
        return new g(str, num, str2, str3, child);
    }

    public static /* synthetic */ g a(g gVar, String str, Integer num, String str2, String str3, h hVar, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = gVar.f40745a;
        }
        if ((i5 & 2) != 0) {
            num = gVar.f40746b;
        }
        if ((i5 & 4) != 0) {
            str2 = gVar.f40747c;
        }
        if ((i5 & 8) != 0) {
            str3 = gVar.f40748d;
        }
        if ((i5 & 16) != 0) {
            hVar = gVar.f40749e;
        }
        h hVar2 = hVar;
        String str4 = str2;
        return gVar.a(str, num, str4, str3, hVar2);
    }
}
