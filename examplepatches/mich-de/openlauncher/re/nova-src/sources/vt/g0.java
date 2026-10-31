package vt;

import com.stripe.android.model.ConfirmStripeIntentParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g0 implements i0 {

    /* renamed from: a, reason: collision with root package name */
    public final ConfirmStripeIntentParams f93049a;

    public g0(ConfirmStripeIntentParams confirmNextParams) {
        Intrinsics.g(confirmNextParams, "confirmNextParams");
        this.f93049a = confirmNextParams;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof g0) && Intrinsics.b(this.f93049a, ((g0) obj).f93049a);
    }

    public final int hashCode() {
        return this.f93049a.hashCode();
    }

    public final String toString() {
        return "Confirm(confirmNextParams=" + this.f93049a + ")";
    }
}
