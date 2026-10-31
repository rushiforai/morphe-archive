package io.branch.search.internal;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Bc {

    /* renamed from: a, reason: collision with root package name */
    public final long f62149a;

    /* renamed from: b, reason: collision with root package name */
    public final long f62150b;

    public Bc(long j11, long j12) {
        this.f62149a = j11;
        this.f62150b = j12;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Bc)) {
            return false;
        }
        Bc bc2 = (Bc) obj;
        return this.f62149a == bc2.f62149a && this.f62150b == bc2.f62150b;
    }

    public final int hashCode() {
        return Long.hashCode(this.f62150b) + (Long.hashCode(this.f62149a) * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ScheduledBundleJobDetails(scheduleTimestamp=");
        sb2.append(this.f62149a);
        sb2.append(", minDelay=");
        return C3380t5.a(sb2, this.f62150b, ')');
    }
}
