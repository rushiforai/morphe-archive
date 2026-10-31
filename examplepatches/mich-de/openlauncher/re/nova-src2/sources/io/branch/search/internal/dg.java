package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class dg {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64349a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f64350b;

    /* renamed from: c, reason: collision with root package name */
    public final int f64351c;

    /* renamed from: d, reason: collision with root package name */
    public final int f64352d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final String f64353e;

    public dg(@NotNull String requestId, int i5, int i11, @NotNull String sessionId) {
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(sessionId, "sessionId");
        this.f64349a = requestId;
        this.f64350b = "demo_mode";
        this.f64351c = i5;
        this.f64352d = i11;
        this.f64353e = sessionId;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof dg)) {
            return false;
        }
        dg dgVar = (dg) obj;
        return Intrinsics.b(this.f64349a, dgVar.f64349a) && Intrinsics.b(this.f64350b, dgVar.f64350b) && this.f64351c == dgVar.f64351c && this.f64352d == dgVar.f64352d && Intrinsics.b(this.f64353e, dgVar.f64353e);
    }

    public final int hashCode() {
        return this.f64353e.hashCode() + C3214j8.a(this.f64352d, C3214j8.a(this.f64351c, C3248l8.a(this.f64350b, this.f64349a.hashCode() * 31, 31), 31), 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ZeroStateDemoAdsExtras(requestId=");
        sb2.append(this.f64349a);
        sb2.append(", api=");
        sb2.append(this.f64350b);
        sb2.append(", slRowCount=");
        sb2.append(this.f64351c);
        sb2.append(", saRowCount=");
        sb2.append(this.f64352d);
        sb2.append(", sessionId=");
        return Z.a(sb2, this.f64353e, ')');
    }
}
