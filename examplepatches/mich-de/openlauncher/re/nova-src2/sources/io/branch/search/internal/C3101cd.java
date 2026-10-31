package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.cd, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3101cd {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64180a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f64181b;

    /* renamed from: c, reason: collision with root package name */
    public final long f64182c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f64183d;

    /* renamed from: e, reason: collision with root package name */
    public final int f64184e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final String f64185f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f64186g;

    public C3101cd(int i5, long j11, @NotNull String sessionId, @NotNull String requestId, @NotNull String packageName, @NotNull String entityId, boolean z11) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(entityId, "entityId");
        this.f64180a = sessionId;
        this.f64181b = requestId;
        this.f64182c = j11;
        this.f64183d = packageName;
        this.f64184e = i5;
        this.f64185f = entityId;
        this.f64186g = z11;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3101cd)) {
            return false;
        }
        C3101cd c3101cd = (C3101cd) obj;
        return Intrinsics.b(this.f64180a, c3101cd.f64180a) && Intrinsics.b(this.f64181b, c3101cd.f64181b) && this.f64182c == c3101cd.f64182c && Intrinsics.b(this.f64183d, c3101cd.f64183d) && this.f64184e == c3101cd.f64184e && Intrinsics.b(this.f64185f, c3101cd.f64185f) && this.f64186g == c3101cd.f64186g;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iA = C3248l8.a(this.f64185f, C3214j8.a(this.f64184e, C3248l8.a(this.f64183d, C3231k8.a(this.f64182c, C3248l8.a(this.f64181b, this.f64180a.hashCode() * 31, 31), 31), 31), 31), 31);
        boolean z11 = this.f64186g;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iA + i5;
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SearchClick(sessionId=");
        sb2.append(this.f64180a);
        sb2.append(", requestId=");
        sb2.append(this.f64181b);
        sb2.append(", timestamp=");
        sb2.append(this.f64182c);
        sb2.append(", packageName=");
        sb2.append(this.f64183d);
        sb2.append(", resultId=");
        sb2.append(this.f64184e);
        sb2.append(", entityId=");
        sb2.append(this.f64185f);
        sb2.append(", externalOrganic=");
        return a2.c.p(sb2, this.f64186g, ')');
    }
}
