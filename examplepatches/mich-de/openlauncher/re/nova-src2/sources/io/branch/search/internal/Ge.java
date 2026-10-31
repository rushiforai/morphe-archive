package io.branch.search.internal;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Ge implements InterfaceC3432w6 {

    /* renamed from: a, reason: collision with root package name */
    public final int f62545a;

    /* renamed from: b, reason: collision with root package name */
    public final long f62546b;

    /* renamed from: c, reason: collision with root package name */
    public final long f62547c;

    public Ge(int i5, long j11, long j12) {
        this.f62545a = i5;
        this.f62546b = j11;
        this.f62547c = j12;
    }

    @Override // io.branch.search.internal.InterfaceC3432w6
    public final long a() {
        return this.f62547c;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Ge)) {
            return false;
        }
        Ge ge2 = (Ge) obj;
        return this.f62545a == ge2.f62545a && this.f62546b == ge2.f62546b && this.f62547c == ge2.f62547c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f62547c) + C3231k8.a(this.f62546b, Integer.hashCode(this.f62545a) * 31, 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SuggestedAppsAdsRequestData(count=");
        sb2.append(this.f62545a);
        sb2.append(", userId=");
        sb2.append(this.f62546b);
        sb2.append(", timeStamp=");
        return C3380t5.a(sb2, this.f62547c, ')');
    }
}
