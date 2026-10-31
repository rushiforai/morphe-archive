package gv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k0 extends q0 {

    /* renamed from: a, reason: collision with root package name */
    public final ft.n0 f57881a;

    /* renamed from: b, reason: collision with root package name */
    public final String f57882b;

    /* renamed from: c, reason: collision with root package name */
    public final String f57883c;

    public k0(ft.n0 confirmationMethod) {
        Intrinsics.g(confirmationMethod, "confirmationMethod");
        this.f57881a = confirmationMethod;
        this.f57882b = "invalidConfirmationMethod";
        this.f57883c = r70.f.o0("\n            PaymentIntent with confirmation_method='automatic' is required.\n            The current PaymentIntent has confirmation_method '" + confirmationMethod + "'.\n            See https://stripe.com/docs/api/payment_intents/object#payment_intent_object-confirmation_method.\n        ");
    }

    @Override // gv.q0
    public final String a() {
        return this.f57882b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof k0) && this.f57881a == ((k0) obj).f57881a;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return this.f57883c;
    }

    public final int hashCode() {
        return this.f57881a.hashCode();
    }

    @Override // java.lang.Throwable
    public final String toString() {
        return "InvalidConfirmationMethod(confirmationMethod=" + this.f57881a + ")";
    }
}
