package com.fyber.inneractive.sdk.protobuf;

/* loaded from: classes3.dex */
public final class g0 {

    /* renamed from: a, reason: collision with root package name */
    public final Object f30803a;

    /* renamed from: b, reason: collision with root package name */
    public final int f30804b;

    public g0(int i5, Object obj) {
        this.f30803a = obj;
        this.f30804b = i5;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof g0)) {
            return false;
        }
        g0 g0Var = (g0) obj;
        return this.f30803a == g0Var.f30803a && this.f30804b == g0Var.f30804b;
    }

    public final int hashCode() {
        return (System.identityHashCode(this.f30803a) * 65535) + this.f30804b;
    }
}
