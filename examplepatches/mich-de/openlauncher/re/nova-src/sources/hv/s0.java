package hv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s0 implements w0 {

    /* renamed from: a, reason: collision with root package name */
    public final m f60580a;

    public s0(m billingDetailsFormState) {
        Intrinsics.g(billingDetailsFormState, "billingDetailsFormState");
        this.f60580a = billingDetailsFormState;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof s0) && Intrinsics.b(this.f60580a, ((s0) obj).f60580a);
    }

    public final int hashCode() {
        return this.f60580a.hashCode();
    }

    public final String toString() {
        return "BillingDetailsChanged(billingDetailsFormState=" + this.f60580a + ")";
    }
}
