package com.amplitude;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class K2 {

    /* renamed from: a, reason: collision with root package name */
    public final long f20304a;

    /* renamed from: b, reason: collision with root package name */
    public final String f20305b;

    public K2(long j11, String deviceId) {
        Intrinsics.g(deviceId, "deviceId");
        this.f20304a = j11;
        this.f20305b = deviceId;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof K2)) {
            return false;
        }
        K2 k22 = (K2) obj;
        return this.f20304a == k22.f20304a && Intrinsics.b(this.f20305b, k22.f20305b);
    }

    public final int hashCode() {
        return this.f20305b.hashCode() + (Long.hashCode(this.f20304a) * 31);
    }

    public final String toString() {
        StringBuilder sbL = a80.m.l(this.f20304a, "RecordLogIdentifier(sessionId=", ", deviceId=", this.f20305b);
        sbL.append(")");
        return sbL.toString();
    }
}
