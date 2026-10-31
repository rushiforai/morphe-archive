package vt;

import com.stripe.android.model.StripeIntent;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h0 implements i0 {

    /* renamed from: a, reason: collision with root package name */
    public final StripeIntent f93053a;

    public h0(StripeIntent intent) {
        Intrinsics.g(intent, "intent");
        this.f93053a = intent;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof h0) && Intrinsics.b(this.f93053a, ((h0) obj).f93053a);
    }

    public final int hashCode() {
        return this.f93053a.hashCode();
    }

    public final String toString() {
        return "NextAction(intent=" + this.f93053a + ")";
    }
}
