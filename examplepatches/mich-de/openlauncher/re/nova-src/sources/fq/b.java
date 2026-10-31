package fq;

import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f55568a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f55569b;

    public b(String publishableKey, Set productUsage) {
        Intrinsics.g(publishableKey, "publishableKey");
        Intrinsics.g(productUsage, "productUsage");
        this.f55568a = publishableKey;
        this.f55569b = productUsage;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f55568a, bVar.f55568a) && Intrinsics.b(this.f55569b, bVar.f55569b);
    }

    public final int hashCode() {
        return this.f55569b.hashCode() + (this.f55568a.hashCode() * 31);
    }

    public final String toString() {
        return "Args(publishableKey=" + this.f55568a + ", productUsage=" + this.f55569b + ")";
    }
}
