package com.amplitude;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class L1 {

    /* renamed from: a, reason: collision with root package name */
    public final long f20314a;

    /* renamed from: b, reason: collision with root package name */
    public final int f20315b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f20316c;

    public L1(long j11, int i5, Integer num) {
        this.f20314a = j11;
        this.f20315b = i5;
        this.f20316c = num;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof L1)) {
            return false;
        }
        L1 l12 = (L1) obj;
        return this.f20314a == l12.f20314a && this.f20315b == l12.f20315b && Intrinsics.b(this.f20316c, l12.f20316c);
    }

    public final int hashCode() {
        return this.f20316c.hashCode() + b.u4.a(this.f20315b, Long.hashCode(this.f20314a) * 31, 31);
    }

    public final String toString() {
        return "TierCutoff(minRamBytes=" + this.f20314a + ", minCores=" + this.f20315b + ", minFreqMHz=" + this.f20316c + ")";
    }
}
