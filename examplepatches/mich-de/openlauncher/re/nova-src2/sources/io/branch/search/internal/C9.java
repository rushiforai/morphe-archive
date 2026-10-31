package io.branch.search.internal;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class C9 {

    /* renamed from: a, reason: collision with root package name */
    public final long f62303a;

    /* renamed from: b, reason: collision with root package name */
    public final long f62304b;

    /* renamed from: c, reason: collision with root package name */
    public final long f62305c;

    /* renamed from: d, reason: collision with root package name */
    public final long f62306d;

    public C9(long j11, long j12, long j13, long j14) {
        this.f62303a = j11;
        this.f62304b = j12;
        this.f62305c = j13;
        this.f62306d = j14;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C9)) {
            return false;
        }
        C9 c92 = (C9) obj;
        return this.f62303a == c92.f62303a && this.f62304b == c92.f62304b && this.f62305c == c92.f62305c && this.f62306d == c92.f62306d;
    }

    public final int hashCode() {
        return Long.hashCode(this.f62306d) + C3231k8.a(this.f62305c, C3231k8.a(this.f62304b, Long.hashCode(this.f62303a) * 31, 31), 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("NetworkStatsData(byteReceived=");
        sb2.append(this.f62303a);
        sb2.append(", byteTransmitted=");
        sb2.append(this.f62304b);
        sb2.append(", packetsReceived=");
        sb2.append(this.f62305c);
        sb2.append(", packetsTransmitted=");
        return C3380t5.a(sb2, this.f62306d, ')');
    }
}
