package mt;

import com.stripe.android.model.StripeIntent;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u implements v {

    /* renamed from: a, reason: collision with root package name */
    public final StripeIntent f76808a;

    /* renamed from: b, reason: collision with root package name */
    public final vt.f0 f76809b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f76810c;

    public u(StripeIntent intent, vt.f0 f0Var, boolean z11) {
        Intrinsics.g(intent, "intent");
        this.f76808a = intent;
        this.f76809b = f0Var;
        this.f76810c = z11;
    }

    @Override // mt.v
    public final void a(xq.c logger) {
        Intrinsics.g(logger, "logger");
        logger.c("ConfirmationHandler.Result.Succeeded");
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u)) {
            return false;
        }
        u uVar = (u) obj;
        return Intrinsics.b(this.f76808a, uVar.f76808a) && this.f76809b == uVar.f76809b && this.f76810c == uVar.f76810c;
    }

    public final int hashCode() {
        int iHashCode = this.f76808a.hashCode() * 31;
        vt.f0 f0Var = this.f76809b;
        return Boolean.hashCode(this.f76810c) + ((iHashCode + (f0Var == null ? 0 : f0Var.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Succeeded(intent=");
        sb2.append(this.f76808a);
        sb2.append(", deferredIntentConfirmationType=");
        sb2.append(this.f76809b);
        sb2.append(", completedFullPaymentFlow=");
        return a80.m.k(sb2, this.f76810c, ")");
    }
}
