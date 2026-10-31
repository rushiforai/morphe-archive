package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.cf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3103cf {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64190a;

    /* renamed from: b, reason: collision with root package name */
    public final int f64191b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f64192c;

    /* renamed from: d, reason: collision with root package name */
    public final float f64193d;

    /* renamed from: e, reason: collision with root package name */
    public final long f64194e;

    /* renamed from: f, reason: collision with root package name */
    public final long f64195f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final String f64196g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public final String f64197h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f64198i;

    public C3103cf(@NotNull String requestId, int i5, @Nullable String str, float f11, long j11, long j12, @Nullable String str2, @Nullable String str3, boolean z11) {
        Intrinsics.g(requestId, "requestId");
        this.f64190a = requestId;
        this.f64191b = i5;
        this.f64192c = str;
        this.f64193d = f11;
        this.f64194e = j11;
        this.f64195f = j12;
        this.f64196g = str2;
        this.f64197h = str3;
        this.f64198i = z11;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3103cf)) {
            return false;
        }
        C3103cf c3103cf = (C3103cf) obj;
        return Intrinsics.b(this.f64190a, c3103cf.f64190a) && this.f64191b == c3103cf.f64191b && Intrinsics.b(this.f64192c, c3103cf.f64192c) && Float.valueOf(this.f64193d).equals(Float.valueOf(c3103cf.f64193d)) && this.f64194e == c3103cf.f64194e && this.f64195f == c3103cf.f64195f && Intrinsics.b(this.f64196g, c3103cf.f64196g) && Intrinsics.b(this.f64197h, c3103cf.f64197h) && this.f64198i == c3103cf.f64198i;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iA = C3214j8.a(this.f64191b, this.f64190a.hashCode() * 31, 31);
        String str = this.f64192c;
        int iA2 = C3231k8.a(this.f64195f, C3231k8.a(this.f64194e, a80.m.d(this.f64193d, (iA + (str == null ? 0 : str.hashCode())) * 31, 31), 31), 31);
        String str2 = this.f64196g;
        int iHashCode = (iA2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f64197h;
        int iHashCode2 = (iHashCode + (str3 != null ? str3.hashCode() : 0)) * 31;
        boolean z11 = this.f64198i;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iHashCode2 + i5;
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("UnifiedImpression(requestId=");
        sb2.append(this.f64190a);
        sb2.append(", resultId=");
        sb2.append(this.f64191b);
        sb2.append(", entityId=");
        sb2.append(this.f64192c);
        sb2.append(", area=");
        sb2.append(this.f64193d);
        sb2.append(", startTime=");
        sb2.append(this.f64194e);
        sb2.append(", duration=");
        sb2.append(this.f64195f);
        sb2.append(", analyticsWindowId=");
        sb2.append(this.f64196g);
        sb2.append(", callerId=");
        sb2.append(this.f64197h);
        sb2.append(", externalOrganic=");
        return a2.c.p(sb2, this.f64198i, ')');
    }
}
