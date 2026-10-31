package g00;

import b.c9;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import u10.e0;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final e0 f56791a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f56792b;

    /* renamed from: c, reason: collision with root package name */
    public final Map f56793c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f56794d;

    public a(e0 e0Var, boolean z11, Map map, boolean z12) {
        this.f56791a = e0Var;
        this.f56792b = z11;
        this.f56793c = map;
        this.f56794d = z12;
    }

    public static a a(a aVar, e0 e0Var, boolean z11, Map map, boolean z12, int i5) {
        if ((i5 & 1) != 0) {
            e0Var = aVar.f56791a;
        }
        if ((i5 & 2) != 0) {
            z11 = aVar.f56792b;
        }
        if ((i5 & 4) != 0) {
            map = aVar.f56793c;
        }
        if ((i5 & 8) != 0) {
            z12 = aVar.f56794d;
        }
        aVar.getClass();
        return new a(e0Var, z11, map, z12);
    }

    public final Map b() {
        return this.f56793c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f56791a, aVar.f56791a) && this.f56792b == aVar.f56792b && Intrinsics.b(this.f56793c, aVar.f56793c) && this.f56794d == aVar.f56794d;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f56794d) + x8.h.c(this.f56793c, c9.f(this.f56791a.hashCode() * 31, 31, this.f56792b), 31);
    }

    public final String toString() {
        return "CardDetails(card=" + this.f56791a + ", conditionsEnabled=" + this.f56792b + ", conditionSets=" + this.f56793c + ", isCardNameValid=" + this.f56794d + ")";
    }
}
