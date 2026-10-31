package ku;

import com.stripe.android.auth.PaymentBrowserAuthContract;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g extends h {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentBrowserAuthContract.Args f72236a;

    public g(PaymentBrowserAuthContract.Args args) {
        this.f72236a = args;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof g) && Intrinsics.b(this.f72236a, ((g) obj).f72236a);
    }

    public final int hashCode() {
        return this.f72236a.hashCode();
    }

    public final String toString() {
        return "StartFallback(args=" + this.f72236a + ")";
    }
}
