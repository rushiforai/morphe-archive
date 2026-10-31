package com.google.protobuf;

/* loaded from: classes3.dex */
public final class x {

    /* renamed from: a, reason: collision with root package name */
    public final Object f34997a;

    /* renamed from: b, reason: collision with root package name */
    public final int f34998b;

    public x(int i5, o1 o1Var) {
        this.f34997a = o1Var;
        this.f34998b = i5;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof x)) {
            return false;
        }
        x xVar = (x) obj;
        return this.f34997a == xVar.f34997a && this.f34998b == xVar.f34998b;
    }

    public final int hashCode() {
        return (System.identityHashCode(this.f34997a) * 65535) + this.f34998b;
    }
}
