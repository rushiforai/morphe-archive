package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class P0 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f63031a;

    /* renamed from: b, reason: collision with root package name */
    public final long f63032b;

    /* renamed from: c, reason: collision with root package name */
    public final long f63033c;

    public P0(long j11, long j12, @NotNull String packageName) {
        Intrinsics.g(packageName, "packageName");
        this.f63031a = packageName;
        this.f63032b = j11;
        this.f63033c = j12;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof P0)) {
            return false;
        }
        P0 p02 = (P0) obj;
        return Intrinsics.b(this.f63031a, p02.f63031a) && this.f63032b == p02.f63032b && this.f63033c == p02.f63033c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f63033c) + C3231k8.a(this.f63032b, this.f63031a.hashCode() * 31, 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AppUsageStats(packageName=");
        sb2.append(this.f63031a);
        sb2.append(", screenUptime=");
        sb2.append(this.f63032b);
        sb2.append(", lastUsageTimestamp=");
        return C3380t5.a(sb2, this.f63033c, ')');
    }
}
