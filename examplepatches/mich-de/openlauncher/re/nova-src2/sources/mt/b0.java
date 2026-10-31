package mt;

import com.stripe.android.model.StripeIntent;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b0 implements e0 {

    /* renamed from: a, reason: collision with root package name */
    public final StripeIntent f76732a;

    /* renamed from: b, reason: collision with root package name */
    public final vt.f0 f76733b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f76734c;

    public b0(StripeIntent intent, vt.f0 f0Var, boolean z11) {
        Intrinsics.g(intent, "intent");
        this.f76732a = intent;
        this.f76733b = f0Var;
        this.f76734c = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b0)) {
            return false;
        }
        b0 b0Var = (b0) obj;
        return Intrinsics.b(this.f76732a, b0Var.f76732a) && this.f76733b == b0Var.f76733b && this.f76734c == b0Var.f76734c;
    }

    public final int hashCode() {
        int iHashCode = this.f76732a.hashCode() * 31;
        vt.f0 f0Var = this.f76733b;
        return Boolean.hashCode(this.f76734c) + ((iHashCode + (f0Var == null ? 0 : f0Var.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Complete(intent=");
        sb2.append(this.f76732a);
        sb2.append(", deferredIntentConfirmationType=");
        sb2.append(this.f76733b);
        sb2.append(", completedFullPaymentFlow=");
        return a80.m.k(sb2, this.f76734c, ")");
    }
}
