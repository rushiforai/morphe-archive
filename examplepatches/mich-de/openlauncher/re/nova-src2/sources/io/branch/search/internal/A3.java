package io.branch.search.internal;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class A3 {

    /* renamed from: a, reason: collision with root package name */
    public final long f61921a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f61922b;

    public A3(long j11, boolean z11) {
        this.f61921a = j11;
        this.f61922b = z11;
    }

    public final boolean a() {
        return this.f61922b;
    }

    public final long b() {
        return this.f61921a;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof A3)) {
            return false;
        }
        A3 a32 = (A3) obj;
        return this.f61921a == a32.f61921a && this.f61922b == a32.f61922b;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = Long.hashCode(this.f61921a) * 31;
        boolean z11 = this.f61922b;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iHashCode + i5;
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("CacheRemoteConfig(maxDefaultKeepAlive=");
        sb2.append(this.f61921a);
        sb2.append(", automaticClearCache=");
        return a2.c.p(sb2, this.f61922b, ')');
    }
}
