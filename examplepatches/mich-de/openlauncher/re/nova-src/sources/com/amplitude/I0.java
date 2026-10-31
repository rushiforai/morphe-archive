package com.amplitude;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class I0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f20267a;

    /* renamed from: b, reason: collision with root package name */
    public final int f20268b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f20269c;

    /* renamed from: d, reason: collision with root package name */
    public final Integer f20270d;

    public I0(long j11, int i5, Integer num, Integer num2) {
        this.f20267a = j11;
        this.f20268b = i5;
        this.f20269c = num;
        this.f20270d = num2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof I0)) {
            return false;
        }
        I0 i02 = (I0) obj;
        return this.f20267a == i02.f20267a && this.f20268b == i02.f20268b && Intrinsics.b(this.f20269c, i02.f20269c) && Intrinsics.b(this.f20270d, i02.f20270d);
    }

    public final int hashCode() {
        int iA = b.u4.a(this.f20268b, Long.hashCode(this.f20267a) * 31, 31);
        Integer num = this.f20269c;
        int iHashCode = (iA + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.f20270d;
        return iHashCode + (num2 != null ? num2.hashCode() : 0);
    }

    public final String toString() {
        return "HardwareInfo(totalRamBytes=" + this.f20267a + ", cpuCoreCount=" + this.f20268b + ", cpuMaxFreqMHz=" + this.f20269c + ", memoryClassMB=" + this.f20270d + ")";
    }
}
