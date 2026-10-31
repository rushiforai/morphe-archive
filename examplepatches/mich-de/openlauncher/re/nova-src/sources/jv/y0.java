package jv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class y0 implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f70187a;

    public y0(String selectedPaymentMethodCode) {
        Intrinsics.g(selectedPaymentMethodCode, "selectedPaymentMethodCode");
        this.f70187a = selectedPaymentMethodCode;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof y0) && Intrinsics.b(this.f70187a, ((y0) obj).f70187a);
    }

    public final int hashCode() {
        return this.f70187a.hashCode();
    }

    public final String toString() {
        return b.c0.l("PaymentMethodSelected(selectedPaymentMethodCode=", this.f70187a, ")");
    }
}
