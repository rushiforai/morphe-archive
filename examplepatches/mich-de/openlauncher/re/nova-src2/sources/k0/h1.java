package k0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class h1 implements g2 {

    /* renamed from: a, reason: collision with root package name */
    public final g2 f70615a;

    /* renamed from: b, reason: collision with root package name */
    public final int f70616b;

    public h1(g2 g2Var, int i5) {
        this.f70615a = g2Var;
        this.f70616b = i5;
    }

    @Override // k0.g2
    public final int a(y3.c cVar, y3.n nVar) {
        if (((nVar == y3.n.f96612a ? 8 : 2) & this.f70616b) != 0) {
            return this.f70615a.a(cVar, nVar);
        }
        return 0;
    }

    @Override // k0.g2
    public final int b(y3.c cVar, y3.n nVar) {
        if (((nVar == y3.n.f96612a ? 4 : 1) & this.f70616b) != 0) {
            return this.f70615a.b(cVar, nVar);
        }
        return 0;
    }

    @Override // k0.g2
    public final int c(y3.c cVar) {
        if ((this.f70616b & 32) != 0) {
            return this.f70615a.c(cVar);
        }
        return 0;
    }

    @Override // k0.g2
    public final int d(y3.c cVar) {
        if ((this.f70616b & 16) != 0) {
            return this.f70615a.d(cVar);
        }
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h1)) {
            return false;
        }
        h1 h1Var = (h1) obj;
        return Intrinsics.b(this.f70615a, h1Var.f70615a) && this.f70616b == h1Var.f70616b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f70616b) + (this.f70615a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("(");
        sb2.append(this.f70615a);
        sb2.append(" only ");
        StringBuilder sb3 = new StringBuilder("WindowInsetsSides(");
        StringBuilder sb4 = new StringBuilder();
        int i5 = d.f70585d;
        int i11 = this.f70616b;
        if ((i11 & i5) == i5) {
            d.o("Start", sb4);
        }
        int i12 = d.f70587f;
        if ((i11 & i12) == i12) {
            d.o("Left", sb4);
        }
        if ((i11 & 16) == 16) {
            d.o("Top", sb4);
        }
        int i13 = d.f70586e;
        if ((i11 & i13) == i13) {
            d.o("End", sb4);
        }
        int i14 = d.f70588g;
        if ((i11 & i14) == i14) {
            d.o("Right", sb4);
        }
        if ((i11 & 32) == 32) {
            d.o("Bottom", sb4);
        }
        String string = sb4.toString();
        Intrinsics.f(string, "toString(...)");
        sb3.append(string);
        sb3.append(')');
        sb2.append((Object) sb3.toString());
        sb2.append(')');
        return sb2.toString();
    }
}
