package com.amplitude;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class R1 {

    /* renamed from: a, reason: collision with root package name */
    @gn.c("tag")
    private final String f20376a;

    /* renamed from: b, reason: collision with root package name */
    @gn.c("payload")
    private final Object f20377b;

    public R1(C0459j0 payload) {
        Intrinsics.g(payload, "payload");
        this.f20376a = "debug-info";
        this.f20377b = payload;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof R1)) {
            return false;
        }
        R1 r12 = (R1) obj;
        return Intrinsics.b(this.f20376a, r12.f20376a) && Intrinsics.b(this.f20377b, r12.f20377b);
    }

    public final int hashCode() {
        return this.f20377b.hashCode() + (this.f20376a.hashCode() * 31);
    }

    public final String toString() {
        return "RRCustomData(tag=" + this.f20376a + ", payload=" + this.f20377b + ")";
    }
}
