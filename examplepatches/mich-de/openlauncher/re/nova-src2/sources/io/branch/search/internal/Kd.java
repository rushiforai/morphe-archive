package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Kd {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final EnumC3234kb f62798a;

    /* renamed from: b, reason: collision with root package name */
    public final int f62799b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f62800c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f62801d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f62802e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final AbstractC3393u1 f62803f;

    public Kd(@NotNull EnumC3234kb phase, int i5, @NotNull String query, @NotNull String binds, boolean z11, @Nullable AbstractC3393u1 abstractC3393u1) {
        Intrinsics.g(phase, "phase");
        Intrinsics.g(query, "query");
        Intrinsics.g(binds, "binds");
        this.f62798a = phase;
        this.f62799b = i5;
        this.f62800c = query;
        this.f62801d = binds;
        this.f62802e = z11;
        this.f62803f = abstractC3393u1;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Kd)) {
            return false;
        }
        Kd kd2 = (Kd) obj;
        return this.f62798a == kd2.f62798a && this.f62799b == kd2.f62799b && Intrinsics.b(this.f62800c, kd2.f62800c) && Intrinsics.b(this.f62801d, kd2.f62801d) && this.f62802e == kd2.f62802e && Intrinsics.b(this.f62803f, kd2.f62803f);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iA = C3248l8.a(this.f62801d, C3248l8.a(this.f62800c, C3214j8.a(this.f62799b, this.f62798a.hashCode() * 31, 31), 31), 31);
        boolean z11 = this.f62802e;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int i11 = (iA + i5) * 31;
        AbstractC3393u1 abstractC3393u1 = this.f62803f;
        return i11 + (abstractC3393u1 == null ? 0 : abstractC3393u1.hashCode());
    }

    @NotNull
    public final String toString() {
        return "SetupTeardownRow(phase=" + this.f62798a + ", order=" + this.f62799b + ", query=" + this.f62800c + ", binds=" + this.f62801d + ", repeatBinds=" + this.f62802e + ", explicitBinding=" + this.f62803f + ')';
    }
}
