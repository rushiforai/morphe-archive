package jv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x0 implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public final ou.j f70186a;

    public x0(ou.j savedPaymentMethod) {
        Intrinsics.g(savedPaymentMethod, "savedPaymentMethod");
        this.f70186a = savedPaymentMethod;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof x0) && Intrinsics.b(this.f70186a, ((x0) obj).f70186a);
    }

    public final int hashCode() {
        return this.f70186a.hashCode();
    }

    public final String toString() {
        return "OnManageOneSavedPaymentMethod(savedPaymentMethod=" + this.f70186a + ")";
    }
}
