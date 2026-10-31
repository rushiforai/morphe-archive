package zu;

import b.c0;
import com.stripe.android.model.StripeIntent;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p implements r {

    /* renamed from: a, reason: collision with root package name */
    public final String f98654a;

    /* renamed from: b, reason: collision with root package name */
    public final String f98655b;

    /* renamed from: c, reason: collision with root package name */
    public final StripeIntent f98656c;

    public p(String str, String str2, StripeIntent stripeIntent) {
        this.f98654a = str;
        this.f98655b = str2;
        this.f98656c = stripeIntent;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return Intrinsics.b(this.f98654a, pVar.f98654a) && Intrinsics.b(this.f98655b, pVar.f98655b) && Intrinsics.b(this.f98656c, pVar.f98656c);
    }

    public final int hashCode() {
        int iHashCode = this.f98654a.hashCode() * 31;
        String str = this.f98655b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        StripeIntent stripeIntent = this.f98656c;
        return iHashCode2 + (stripeIntent != null ? stripeIntent.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("Finished(result=", this.f98654a, ", linkAccountSessionId=", this.f98655b, ", intent=");
        sbW.append(this.f98656c);
        sbW.append(")");
        return sbW.toString();
    }
}
