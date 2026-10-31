package cy;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final int f48466a;

    /* renamed from: b, reason: collision with root package name */
    public final List f48467b;

    public f(int i5, List list) {
        this.f48466a = i5;
        this.f48467b = list;
    }

    public final List a() {
        return this.f48467b;
    }

    public final int b() {
        return this.f48466a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return this.f48466a == fVar.f48466a && Intrinsics.b(this.f48467b, fVar.f48467b);
    }

    public final int hashCode() {
        return this.f48467b.hashCode() + (Integer.hashCode(this.f48466a) * 31);
    }

    public final String toString() {
        return "PurchasesQueryResult(responseCode=" + this.f48466a + ", purchases=" + this.f48467b + ")";
    }
}
