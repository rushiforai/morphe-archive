package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.v0, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3409v0 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f66073a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f66074b;

    /* renamed from: c, reason: collision with root package name */
    public final long f66075c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f66076d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f66077e;

    public C3409v0(@NotNull String sessionId, @NotNull String requestId, long j11, @NotNull String packageName, boolean z11) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(packageName, "packageName");
        this.f66073a = sessionId;
        this.f66074b = requestId;
        this.f66075c = j11;
        this.f66076d = packageName;
        this.f66077e = z11;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3409v0)) {
            return false;
        }
        C3409v0 c3409v0 = (C3409v0) obj;
        return Intrinsics.b(this.f66073a, c3409v0.f66073a) && Intrinsics.b(this.f66074b, c3409v0.f66074b) && this.f66075c == c3409v0.f66075c && Intrinsics.b(this.f66076d, c3409v0.f66076d) && this.f66077e == c3409v0.f66077e;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iA = C3248l8.a(this.f66076d, C3231k8.a(this.f66075c, C3248l8.a(this.f66074b, this.f66073a.hashCode() * 31, 31), 31), 31);
        boolean z11 = this.f66077e;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iA + i5;
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AppClick(sessionId=");
        sb2.append(this.f66073a);
        sb2.append(", requestId=");
        sb2.append(this.f66074b);
        sb2.append(", timestamp=");
        sb2.append(this.f66075c);
        sb2.append(", packageName=");
        sb2.append(this.f66076d);
        sb2.append(", externalOrganic=");
        return a2.c.p(sb2, this.f66077e, ')');
    }
}
