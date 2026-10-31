package gv;

import com.stripe.android.model.StripeIntent;

/* loaded from: classes4.dex */
public final class n0 extends q0 {

    /* renamed from: a, reason: collision with root package name */
    public final StripeIntent.Status f57905a;

    /* renamed from: b, reason: collision with root package name */
    public final String f57906b = "paymentIntentInTerminalState";

    public n0(StripeIntent.Status status) {
        this.f57905a = status;
    }

    @Override // gv.q0
    public final String a() {
        return this.f57906b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof n0) && this.f57905a == ((n0) obj).f57905a;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return r70.f.o0("\n                PaymentSheet cannot set up a PaymentIntent in status '" + this.f57905a + "'.\n                See https://stripe.com/docs/api/payment_intents/object#payment_intent_object-status.\n            ");
    }

    public final int hashCode() {
        StripeIntent.Status status = this.f57905a;
        if (status == null) {
            return 0;
        }
        return status.hashCode();
    }

    @Override // java.lang.Throwable
    public final String toString() {
        return "PaymentIntentInTerminalState(status=" + this.f57905a + ")";
    }
}
