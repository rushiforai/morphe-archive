package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.q, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2990q {

    /* renamed from: e, reason: collision with root package name */
    public static final int f39270e = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final Integer f39271a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final C2985l f39272b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final C2983j f39273c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final C2989p f39274d;

    public C2990q(@Nullable Integer num, @Nullable C2985l c2985l, @Nullable C2983j c2983j, @Nullable C2989p c2989p) {
        this.f39271a = num;
        this.f39272b = c2985l;
        this.f39273c = c2983j;
        this.f39274d = c2989p;
    }

    @Nullable
    public final Integer a() {
        return this.f39271a;
    }

    @Nullable
    public final C2985l b() {
        return this.f39272b;
    }

    @Nullable
    public final C2983j c() {
        return this.f39273c;
    }

    @Nullable
    public final C2989p d() {
        return this.f39274d;
    }

    @Nullable
    public final Integer e() {
        return this.f39271a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C2990q)) {
            return false;
        }
        C2990q c2990q = (C2990q) obj;
        return Intrinsics.b(this.f39271a, c2990q.f39271a) && Intrinsics.b(this.f39272b, c2990q.f39272b) && Intrinsics.b(this.f39273c, c2990q.f39273c) && Intrinsics.b(this.f39274d, c2990q.f39274d);
    }

    @Nullable
    public final C2983j f() {
        return this.f39273c;
    }

    @Nullable
    public final C2985l g() {
        return this.f39272b;
    }

    @Nullable
    public final C2989p h() {
        return this.f39274d;
    }

    public int hashCode() {
        Integer num = this.f39271a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        C2985l c2985l = this.f39272b;
        int iHashCode2 = (iHashCode + (c2985l == null ? 0 : c2985l.hashCode())) * 31;
        C2983j c2983j = this.f39273c;
        int iHashCode3 = (iHashCode2 + (c2983j == null ? 0 : c2983j.hashCode())) * 31;
        C2989p c2989p = this.f39274d;
        return iHashCode3 + (c2989p != null ? c2989p.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        return "DECRenderingData(appNameFontSize=" + this.f39271a + ", decCTA=" + this.f39272b + ", decAppIcon=" + this.f39273c + ", decRating=" + this.f39274d + ')';
    }

    @NotNull
    public final C2990q a(@Nullable Integer num, @Nullable C2985l c2985l, @Nullable C2983j c2983j, @Nullable C2989p c2989p) {
        return new C2990q(num, c2985l, c2983j, c2989p);
    }

    public static /* synthetic */ C2990q a(C2990q c2990q, Integer num, C2985l c2985l, C2983j c2983j, C2989p c2989p, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            num = c2990q.f39271a;
        }
        if ((i5 & 2) != 0) {
            c2985l = c2990q.f39272b;
        }
        if ((i5 & 4) != 0) {
            c2983j = c2990q.f39273c;
        }
        if ((i5 & 8) != 0) {
            c2989p = c2990q.f39274d;
        }
        return c2990q.a(num, c2985l, c2983j, c2989p);
    }
}
