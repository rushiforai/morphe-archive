package mt;

import com.stripe.android.model.StripeIntent;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h implements i {

    /* renamed from: a, reason: collision with root package name */
    public final StripeIntent f76760a;

    /* renamed from: b, reason: collision with root package name */
    public final vt.f0 f76761b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f76762c;

    public h(StripeIntent intent, vt.f0 f0Var, boolean z11) {
        Intrinsics.g(intent, "intent");
        this.f76760a = intent;
        this.f76761b = f0Var;
        this.f76762c = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h)) {
            return false;
        }
        h hVar = (h) obj;
        return Intrinsics.b(this.f76760a, hVar.f76760a) && this.f76761b == hVar.f76761b && this.f76762c == hVar.f76762c;
    }

    public final int hashCode() {
        int iHashCode = this.f76760a.hashCode() * 31;
        vt.f0 f0Var = this.f76761b;
        return Boolean.hashCode(this.f76762c) + ((iHashCode + (f0Var == null ? 0 : f0Var.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Succeeded(intent=");
        sb2.append(this.f76760a);
        sb2.append(", deferredIntentConfirmationType=");
        sb2.append(this.f76761b);
        sb2.append(", completedFullPaymentFlow=");
        return a80.m.k(sb2, this.f76762c, ")");
    }
}
