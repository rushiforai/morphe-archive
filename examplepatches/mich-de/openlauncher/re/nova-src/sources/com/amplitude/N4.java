package com.amplitude;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class N4 {

    /* renamed from: a, reason: collision with root package name */
    public final O4 f20336a;

    /* renamed from: b, reason: collision with root package name */
    public final W1 f20337b;

    public N4(O4 type, W1 w12) {
        Intrinsics.g(type, "type");
        this.f20336a = type;
        this.f20337b = w12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof N4)) {
            return false;
        }
        N4 n42 = (N4) obj;
        return this.f20336a == n42.f20336a && Intrinsics.b(this.f20337b, n42.f20337b);
    }

    public final int hashCode() {
        int iHashCode = this.f20336a.hashCode() * 31;
        W1 w12 = this.f20337b;
        return iHashCode + (w12 == null ? 0 : w12.hashCode());
    }

    public final String toString() {
        return "WriteQueueMessage(type=" + this.f20336a + ", data=" + this.f20337b + ")";
    }
}
