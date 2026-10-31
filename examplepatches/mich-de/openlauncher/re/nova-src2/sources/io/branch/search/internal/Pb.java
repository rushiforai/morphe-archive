package io.branch.search.internal;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Pb {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f63086a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final List<Tb> f63087b;

    public Pb() {
        this(0);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Pb)) {
            return false;
        }
        Pb pb2 = (Pb) obj;
        return this.f63086a == pb2.f63086a && Intrinsics.b(this.f63087b, pb2.f63087b);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [int] */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v5 */
    public final int hashCode() {
        boolean z11 = this.f63086a;
        ?? r02 = z11;
        if (z11) {
            r02 = 1;
        }
        int i5 = r02 * 31;
        List<Tb> list = this.f63087b;
        return i5 + (list == null ? 0 : list.hashCode());
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("RetryConfig(enabled=");
        sb2.append(this.f63086a);
        sb2.append(", retryPolicies=");
        return Ob.a(sb2, this.f63087b, ')');
    }

    public /* synthetic */ Pb(int i5) {
        this(null, true);
    }

    public Pb(@Nullable List list, boolean z11) {
        this.f63086a = z11;
        this.f63087b = list;
    }
}
