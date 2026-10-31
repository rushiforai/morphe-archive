package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.j, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2983j {

    /* renamed from: d, reason: collision with root package name */
    public static final int f38848d = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final Integer f38849a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String f38850b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final C2984k f38851c;

    public C2983j(@Nullable Integer num, @Nullable String str, @Nullable C2984k c2984k) {
        this.f38849a = num;
        this.f38850b = str;
        this.f38851c = c2984k;
    }

    @Nullable
    public final Integer a() {
        return this.f38849a;
    }

    @Nullable
    public final String b() {
        return this.f38850b;
    }

    @Nullable
    public final C2984k c() {
        return this.f38851c;
    }

    @Nullable
    public final String d() {
        return this.f38850b;
    }

    @Nullable
    public final C2984k e() {
        return this.f38851c;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C2983j)) {
            return false;
        }
        C2983j c2983j = (C2983j) obj;
        return Intrinsics.b(this.f38849a, c2983j.f38849a) && Intrinsics.b(this.f38850b, c2983j.f38850b) && Intrinsics.b(this.f38851c, c2983j.f38851c);
    }

    @Nullable
    public final Integer f() {
        return this.f38849a;
    }

    public int hashCode() {
        Integer num = this.f38849a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        String str = this.f38850b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        C2984k c2984k = this.f38851c;
        return iHashCode2 + (c2984k != null ? c2984k.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        return "DECAppIcon(size=" + this.f38849a + ", appIconUri=" + this.f38850b + ", border=" + this.f38851c + ')';
    }

    @NotNull
    public final C2983j a(@Nullable Integer num, @Nullable String str, @Nullable C2984k c2984k) {
        return new C2983j(num, str, c2984k);
    }

    public static /* synthetic */ C2983j a(C2983j c2983j, Integer num, String str, C2984k c2984k, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            num = c2983j.f38849a;
        }
        if ((i5 & 2) != 0) {
            str = c2983j.f38850b;
        }
        if ((i5 & 4) != 0) {
            c2984k = c2983j.f38851c;
        }
        return c2983j.a(num, str, c2984k);
    }
}
