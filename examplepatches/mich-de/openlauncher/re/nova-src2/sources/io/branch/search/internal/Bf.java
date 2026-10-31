package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Bf {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f62152a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f62153b;

    /* renamed from: c, reason: collision with root package name */
    public final int f62154c;

    /* renamed from: d, reason: collision with root package name */
    public final int f62155d;

    /* renamed from: e, reason: collision with root package name */
    public final int f62156e;

    /* renamed from: f, reason: collision with root package name */
    public final int f62157f;

    /* renamed from: g, reason: collision with root package name */
    public final int f62158g;

    /* renamed from: h, reason: collision with root package name */
    public final int f62159h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public final Long f62160i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final String f62161j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f62162k;

    public Bf(@NotNull String requestId, int i5, int i11, int i12, int i13, int i14, int i15, @Nullable Long l9, @NotNull String sessionId, boolean z11) {
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(sessionId, "sessionId");
        this.f62152a = requestId;
        this.f62153b = "ads_zero_state";
        this.f62154c = i5;
        this.f62155d = i11;
        this.f62156e = i12;
        this.f62157f = i13;
        this.f62158g = i14;
        this.f62159h = i15;
        this.f62160i = l9;
        this.f62161j = sessionId;
        this.f62162k = z11;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Bf)) {
            return false;
        }
        Bf bf2 = (Bf) obj;
        return Intrinsics.b(this.f62152a, bf2.f62152a) && Intrinsics.b(this.f62153b, bf2.f62153b) && this.f62154c == bf2.f62154c && this.f62155d == bf2.f62155d && this.f62156e == bf2.f62156e && this.f62157f == bf2.f62157f && this.f62158g == bf2.f62158g && this.f62159h == bf2.f62159h && Intrinsics.b(this.f62160i, bf2.f62160i) && Intrinsics.b(this.f62161j, bf2.f62161j) && this.f62162k == bf2.f62162k;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iA = C3214j8.a(this.f62159h, C3214j8.a(this.f62158g, C3214j8.a(this.f62157f, C3214j8.a(this.f62156e, C3214j8.a(this.f62155d, C3214j8.a(this.f62154c, C3248l8.a(this.f62153b, this.f62152a.hashCode() * 31, 31), 31), 31), 31), 31), 31), 31);
        Long l9 = this.f62160i;
        int iA2 = C3248l8.a(this.f62161j, (iA + (l9 == null ? 0 : l9.hashCode())) * 31, 31);
        boolean z11 = this.f62162k;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iA2 + i5;
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ZeroStateAdsExtras(requestId=");
        sb2.append(this.f62152a);
        sb2.append(", api=");
        sb2.append(this.f62153b);
        sb2.append(", saRowCount=");
        sb2.append(this.f62154c);
        sb2.append(", saRowSize=");
        sb2.append(this.f62155d);
        sb2.append(", slRowCount=");
        sb2.append(this.f62156e);
        sb2.append(", slRowSize=");
        sb2.append(this.f62157f);
        sb2.append(", siRowCount=");
        sb2.append(this.f62158g);
        sb2.append(", siRowSize=");
        sb2.append(this.f62159h);
        sb2.append(", userId=");
        sb2.append(this.f62160i);
        sb2.append(", sessionId=");
        sb2.append(this.f62161j);
        sb2.append(", isUserFacing=");
        return a2.c.p(sb2, this.f62162k, ')');
    }
}
