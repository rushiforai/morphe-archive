package gv;

import com.stripe.android.model.StripeIntent;

/* loaded from: classes4.dex */
public final class o0 extends q0 {

    /* renamed from: a, reason: collision with root package name */
    public final StripeIntent.Status f57910a;

    /* renamed from: b, reason: collision with root package name */
    public final String f57911b = "setupIntentInTerminalState";

    public o0(StripeIntent.Status status) {
        this.f57910a = status;
    }

    @Override // gv.q0
    public final String a() {
        return this.f57911b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof o0) && this.f57910a == ((o0) obj).f57910a;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return r70.f.o0("\n                PaymentSheet cannot set up a SetupIntent in status '" + this.f57910a + "'.\n                See https://stripe.com/docs/api/setup_intents/object#setup_intent_object-status.\n            ");
    }

    public final int hashCode() {
        StripeIntent.Status status = this.f57910a;
        if (status == null) {
            return 0;
        }
        return status.hashCode();
    }

    @Override // java.lang.Throwable
    public final String toString() {
        return "SetupIntentInTerminalState(status=" + this.f57910a + ")";
    }
}
