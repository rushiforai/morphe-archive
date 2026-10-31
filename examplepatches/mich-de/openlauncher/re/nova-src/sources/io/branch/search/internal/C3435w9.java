package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.w9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3435w9 {

    /* renamed from: a, reason: collision with root package name */
    public final long f66225a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3384t9 f66226b;

    public C3435w9(long j11, @NotNull C3384t9 networks) {
        Intrinsics.g(networks, "networks");
        this.f66225a = j11;
        this.f66226b = networks;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3435w9)) {
            return false;
        }
        C3435w9 c3435w9 = (C3435w9) obj;
        return this.f66225a == c3435w9.f66225a && Intrinsics.b(this.f66226b, c3435w9.f66226b);
    }

    public final int hashCode() {
        return this.f66226b.hashCode() + (Long.hashCode(this.f66225a) * 31);
    }

    @NotNull
    public final String toString() {
        return "NetworkDiagnostic(interval=" + this.f66225a + ", networks=" + this.f66226b + ')';
    }
}
