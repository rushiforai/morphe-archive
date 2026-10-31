package k0;

import kotlin.jvm.internal.Intrinsics;
import p1.s2;

/* loaded from: classes.dex */
public final class e2 implements g2 {

    /* renamed from: a, reason: collision with root package name */
    public final String f70597a;

    /* renamed from: b, reason: collision with root package name */
    public final p1.e1 f70598b;

    public e2(a1 a1Var, String str) {
        this.f70597a = str;
        this.f70598b = androidx.compose.runtime.d.k(a1Var);
    }

    @Override // k0.g2
    public final int a(y3.c cVar, y3.n nVar) {
        return e().f70558a;
    }

    @Override // k0.g2
    public final int b(y3.c cVar, y3.n nVar) {
        return e().f70560c;
    }

    @Override // k0.g2
    public final int c(y3.c cVar) {
        return e().f70561d;
    }

    @Override // k0.g2
    public final int d(y3.c cVar) {
        return e().f70559b;
    }

    public final a1 e() {
        return (a1) ((s2) this.f70598b).getValue();
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof e2) {
            return Intrinsics.b(e(), ((e2) obj).e());
        }
        return false;
    }

    public final void f(a1 a1Var) {
        ((s2) this.f70598b).setValue(a1Var);
    }

    public final int hashCode() {
        return this.f70597a.hashCode();
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f70597a);
        sb2.append("(left=");
        sb2.append(e().f70558a);
        sb2.append(", top=");
        sb2.append(e().f70559b);
        sb2.append(", right=");
        sb2.append(e().f70560c);
        sb2.append(", bottom=");
        return a2.c.m(sb2, e().f70561d, ')');
    }
}
