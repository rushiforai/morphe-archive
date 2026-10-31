package m3;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class m extends n {

    /* renamed from: a, reason: collision with root package name */
    public final String f75933a;

    /* renamed from: b, reason: collision with root package name */
    public final m0 f75934b;

    /* renamed from: c, reason: collision with root package name */
    public final o f75935c;

    public m(String str, m0 m0Var, o oVar) {
        this.f75933a = str;
        this.f75934b = m0Var;
        this.f75935c = oVar;
    }

    @Override // m3.n
    public final o a() {
        return this.f75935c;
    }

    @Override // m3.n
    public final m0 b() {
        return this.f75934b;
    }

    public final String c() {
        return this.f75933a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return Intrinsics.b(this.f75933a, mVar.f75933a) && Intrinsics.b(this.f75934b, mVar.f75934b) && Intrinsics.b(this.f75935c, mVar.f75935c);
    }

    public final int hashCode() {
        int iHashCode = this.f75933a.hashCode() * 31;
        m0 m0Var = this.f75934b;
        int iHashCode2 = (iHashCode + (m0Var != null ? m0Var.hashCode() : 0)) * 31;
        o oVar = this.f75935c;
        return iHashCode2 + (oVar != null ? oVar.hashCode() : 0);
    }

    public final String toString() {
        return c1.t(new StringBuilder("LinkAnnotation.Url(url="), this.f75933a, ')');
    }

    public /* synthetic */ m(String str, m0 m0Var) {
        this(str, m0Var, null);
    }
}
