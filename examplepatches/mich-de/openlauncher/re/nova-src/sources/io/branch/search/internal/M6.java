package io.branch.search.internal;

import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class M6 {

    /* renamed from: a, reason: collision with root package name */
    public final long f62914a;

    /* renamed from: b, reason: collision with root package name */
    public final long f62915b;

    /* renamed from: c, reason: collision with root package name */
    public final long f62916c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final List<C3162g6> f62917d;

    public M6(long j11, long j12, long j13, @NotNull ArrayList branchDirectories) {
        Intrinsics.g(branchDirectories, "branchDirectories");
        this.f62914a = j11;
        this.f62915b = j12;
        this.f62916c = j13;
        this.f62917d = branchDirectories;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof M6)) {
            return false;
        }
        M6 m62 = (M6) obj;
        return this.f62914a == m62.f62914a && this.f62915b == m62.f62915b && this.f62916c == m62.f62916c && Intrinsics.b(this.f62917d, m62.f62917d);
    }

    public final int hashCode() {
        return this.f62917d.hashCode() + C3231k8.a(this.f62916c, C3231k8.a(this.f62915b, Long.hashCode(this.f62914a) * 31, 31), 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("FileDiagnostics(totalBytes=");
        sb2.append(this.f62914a);
        sb2.append(", availableBytes=");
        sb2.append(this.f62915b);
        sb2.append(", busyBytes=");
        sb2.append(this.f62916c);
        sb2.append(", branchDirectories=");
        return Ob.a(sb2, this.f62917d, ')');
    }
}
