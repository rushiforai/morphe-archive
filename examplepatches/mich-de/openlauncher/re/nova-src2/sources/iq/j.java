package iq;

import com.stripe.android.model.StripeIntent;
import h6.c1;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final String f67976a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f67977b;

    /* renamed from: c, reason: collision with root package name */
    public final StripeIntent f67978c;

    public j(String publishableKey, Set productUsage, StripeIntent intent) {
        Intrinsics.g(publishableKey, "publishableKey");
        Intrinsics.g(productUsage, "productUsage");
        Intrinsics.g(intent, "intent");
        this.f67976a = publishableKey;
        this.f67977b = productUsage;
        this.f67978c = intent;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Intrinsics.b(this.f67976a, jVar.f67976a) && Intrinsics.b(this.f67977b, jVar.f67977b) && Intrinsics.b(this.f67978c, jVar.f67978c);
    }

    public final int hashCode() {
        return this.f67978c.hashCode() + c1.k(this.f67977b, this.f67976a.hashCode() * 31, 31);
    }

    public final String toString() {
        return "Args(publishableKey=" + this.f67976a + ", productUsage=" + this.f67977b + ", intent=" + this.f67978c + ")";
    }
}
