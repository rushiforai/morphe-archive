package mt;

import com.stripe.android.model.StripeIntent;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements d {

    /* renamed from: a, reason: collision with root package name */
    public final StripeIntent f76726a;

    /* renamed from: b, reason: collision with root package name */
    public final vt.f0 f76727b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f76728c;

    public a(StripeIntent intent, vt.f0 f0Var, boolean z11) {
        Intrinsics.g(intent, "intent");
        this.f76726a = intent;
        this.f76727b = f0Var;
        this.f76728c = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f76726a, aVar.f76726a) && this.f76727b == aVar.f76727b && this.f76728c == aVar.f76728c;
    }

    public final int hashCode() {
        int iHashCode = this.f76726a.hashCode() * 31;
        vt.f0 f0Var = this.f76727b;
        return Boolean.hashCode(this.f76728c) + ((iHashCode + (f0Var == null ? 0 : f0Var.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Complete(intent=");
        sb2.append(this.f76726a);
        sb2.append(", deferredIntentConfirmationType=");
        sb2.append(this.f76727b);
        sb2.append(", completedFullPaymentFlow=");
        return a80.m.k(sb2, this.f76728c, ")");
    }
}
