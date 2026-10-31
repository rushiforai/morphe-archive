package io.branch.search.internal;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class T5 {

    /* renamed from: a, reason: collision with root package name */
    public final int f63378a;

    /* renamed from: b, reason: collision with root package name */
    public final int f63379b;

    public T5(int i5, int i11) {
        this.f63378a = i5;
        this.f63379b = i11;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof T5)) {
            return false;
        }
        T5 t52 = (T5) obj;
        return this.f63378a == t52.f63378a && this.f63379b == t52.f63379b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f63379b) + (Integer.hashCode(this.f63378a) * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("DevicePendingJobs(pendingJobsCount=");
        sb2.append(this.f63378a);
        sb2.append(", pendingPingJobsCount=");
        return a2.c.m(sb2, this.f63379b, ')');
    }
}
