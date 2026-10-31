package m3;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class l extends n {

    /* renamed from: a, reason: collision with root package name */
    public final String f75924a;

    /* renamed from: b, reason: collision with root package name */
    public final m0 f75925b;

    /* renamed from: c, reason: collision with root package name */
    public final o f75926c;

    public l(String str, m0 m0Var, o oVar) {
        this.f75924a = str;
        this.f75925b = m0Var;
        this.f75926c = oVar;
    }

    @Override // m3.n
    public final o a() {
        return this.f75926c;
    }

    @Override // m3.n
    public final m0 b() {
        return this.f75925b;
    }

    public final String c() {
        return this.f75924a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l)) {
            return false;
        }
        l lVar = (l) obj;
        return Intrinsics.b(this.f75924a, lVar.f75924a) && Intrinsics.b(this.f75925b, lVar.f75925b) && Intrinsics.b(this.f75926c, lVar.f75926c);
    }

    public final int hashCode() {
        int iHashCode = this.f75924a.hashCode() * 31;
        m0 m0Var = this.f75925b;
        int iHashCode2 = (iHashCode + (m0Var != null ? m0Var.hashCode() : 0)) * 31;
        o oVar = this.f75926c;
        return iHashCode2 + (oVar != null ? oVar.hashCode() : 0);
    }

    public final String toString() {
        return c1.t(new StringBuilder("LinkAnnotation.Clickable(tag="), this.f75924a, ')');
    }
}
