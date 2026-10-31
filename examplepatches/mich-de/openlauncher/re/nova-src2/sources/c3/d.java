package c3;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class d extends b {

    /* renamed from: h, reason: collision with root package name */
    public static d f19246h;

    /* renamed from: i, reason: collision with root package name */
    public static final x3.j f19247i = x3.j.f95017b;

    /* renamed from: j, reason: collision with root package name */
    public static final x3.j f19248j = x3.j.f95016a;

    /* renamed from: g, reason: collision with root package name */
    public m3.l0 f19249g;

    public final int E(int i5, x3.j jVar) {
        m3.l0 l0Var = this.f19249g;
        if (l0Var == null) {
            Intrinsics.m("layoutResult");
            throw null;
        }
        int iF = l0Var.f(i5);
        m3.l0 l0Var2 = this.f19249g;
        if (l0Var2 == null) {
            Intrinsics.m("layoutResult");
            throw null;
        }
        if (jVar != l0Var2.g(iF)) {
            m3.l0 l0Var3 = this.f19249g;
            if (l0Var3 != null) {
                return l0Var3.f(i5);
            }
            Intrinsics.m("layoutResult");
            throw null;
        }
        if (this.f19249g != null) {
            return r6.f75928b.c(i5, false) - 1;
        }
        Intrinsics.m("layoutResult");
        throw null;
    }

    public final void F(String str, m3.l0 l0Var) {
        this.f19222a = str;
        this.f19249g = l0Var;
    }

    @Override // c3.b
    public final int[] k(int i5) {
        int iD;
        if (p().length() <= 0 || i5 >= p().length()) {
            return null;
        }
        x3.j jVar = f19247i;
        if (i5 < 0) {
            m3.l0 l0Var = this.f19249g;
            if (l0Var == null) {
                Intrinsics.m("layoutResult");
                throw null;
            }
            iD = l0Var.f75928b.d(0);
        } else {
            m3.l0 l0Var2 = this.f19249g;
            if (l0Var2 == null) {
                Intrinsics.m("layoutResult");
                throw null;
            }
            int iD2 = l0Var2.f75928b.d(i5);
            iD = E(iD2, jVar) == i5 ? iD2 : iD2 + 1;
        }
        m3.l0 l0Var3 = this.f19249g;
        if (l0Var3 == null) {
            Intrinsics.m("layoutResult");
            throw null;
        }
        if (iD >= l0Var3.f75928b.f75952f) {
            return null;
        }
        return o(E(iD, jVar), E(iD, f19248j) + 1);
    }

    @Override // c3.b
    public final int[] y(int i5) {
        int iD;
        if (p().length() <= 0 || i5 <= 0) {
            return null;
        }
        int length = p().length();
        x3.j jVar = f19248j;
        if (i5 > length) {
            m3.l0 l0Var = this.f19249g;
            if (l0Var == null) {
                Intrinsics.m("layoutResult");
                throw null;
            }
            iD = l0Var.f75928b.d(p().length());
        } else {
            m3.l0 l0Var2 = this.f19249g;
            if (l0Var2 == null) {
                Intrinsics.m("layoutResult");
                throw null;
            }
            int iD2 = l0Var2.f75928b.d(i5);
            iD = E(iD2, jVar) + 1 == i5 ? iD2 : iD2 - 1;
        }
        if (iD < 0) {
            return null;
        }
        return o(E(iD, f19247i), E(iD, jVar) + 1);
    }
}
