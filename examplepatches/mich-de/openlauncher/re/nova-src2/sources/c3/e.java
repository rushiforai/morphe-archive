package c3;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class e extends b {

    /* renamed from: i, reason: collision with root package name */
    public static e f19261i;

    /* renamed from: j, reason: collision with root package name */
    public static final x3.j f19262j = x3.j.f95017b;

    /* renamed from: k, reason: collision with root package name */
    public static final x3.j f19263k = x3.j.f95016a;

    /* renamed from: g, reason: collision with root package name */
    public m3.l0 f19264g;

    /* renamed from: h, reason: collision with root package name */
    public j3.q f19265h;

    public final int E(int i5, x3.j jVar) {
        m3.l0 l0Var = this.f19264g;
        if (l0Var == null) {
            Intrinsics.m("layoutResult");
            throw null;
        }
        int iF = l0Var.f(i5);
        m3.l0 l0Var2 = this.f19264g;
        if (l0Var2 == null) {
            Intrinsics.m("layoutResult");
            throw null;
        }
        if (jVar != l0Var2.g(iF)) {
            m3.l0 l0Var3 = this.f19264g;
            if (l0Var3 != null) {
                return l0Var3.f(i5);
            }
            Intrinsics.m("layoutResult");
            throw null;
        }
        if (this.f19264g != null) {
            return r6.f75928b.c(i5, false) - 1;
        }
        Intrinsics.m("layoutResult");
        throw null;
    }

    public final void F(String str, m3.l0 l0Var, j3.q qVar) {
        this.f19222a = str;
        this.f19264g = l0Var;
        this.f19265h = qVar;
    }

    @Override // c3.b
    public final int[] k(int i5) {
        int iE;
        if (p().length() <= 0 || i5 >= p().length()) {
            return null;
        }
        try {
            j3.q qVar = this.f19265h;
            if (qVar == null) {
                Intrinsics.m("node");
                throw null;
            }
            h2.c cVarG = qVar.g();
            int iRound = Math.round(cVarG.f59021d - cVarG.f59019b);
            if (i5 <= 0) {
                i5 = 0;
            }
            m3.l0 l0Var = this.f19264g;
            if (l0Var == null) {
                Intrinsics.m("layoutResult");
                throw null;
            }
            int iD = l0Var.f75928b.d(i5);
            m3.l0 l0Var2 = this.f19264g;
            if (l0Var2 == null) {
                Intrinsics.m("layoutResult");
                throw null;
            }
            float f11 = l0Var2.f75928b.f(iD) + iRound;
            m3.l0 l0Var3 = this.f19264g;
            if (l0Var3 == null) {
                Intrinsics.m("layoutResult");
                throw null;
            }
            if (l0Var3 == null) {
                Intrinsics.m("layoutResult");
                throw null;
            }
            if (f11 < l0Var3.f75928b.f(r0.f75952f - 1)) {
                m3.l0 l0Var4 = this.f19264g;
                if (l0Var4 == null) {
                    Intrinsics.m("layoutResult");
                    throw null;
                }
                iE = l0Var4.f75928b.e(f11);
            } else {
                m3.l0 l0Var5 = this.f19264g;
                if (l0Var5 == null) {
                    Intrinsics.m("layoutResult");
                    throw null;
                }
                iE = l0Var5.f75928b.f75952f;
            }
            return o(i5, E(iE - 1, f19263k) + 1);
        } catch (IllegalStateException unused) {
            return null;
        }
    }

    @Override // c3.b
    public final int[] y(int i5) {
        int iE;
        if (p().length() <= 0 || i5 <= 0) {
            return null;
        }
        try {
            j3.q qVar = this.f19265h;
            if (qVar == null) {
                Intrinsics.m("node");
                throw null;
            }
            h2.c cVarG = qVar.g();
            int iRound = Math.round(cVarG.f59021d - cVarG.f59019b);
            int length = p().length();
            if (length <= i5) {
                i5 = length;
            }
            m3.l0 l0Var = this.f19264g;
            if (l0Var == null) {
                Intrinsics.m("layoutResult");
                throw null;
            }
            int iD = l0Var.f75928b.d(i5);
            m3.l0 l0Var2 = this.f19264g;
            if (l0Var2 == null) {
                Intrinsics.m("layoutResult");
                throw null;
            }
            float f11 = l0Var2.f75928b.f(iD) - iRound;
            if (f11 > 0.0f) {
                m3.l0 l0Var3 = this.f19264g;
                if (l0Var3 == null) {
                    Intrinsics.m("layoutResult");
                    throw null;
                }
                iE = l0Var3.f75928b.e(f11);
            } else {
                iE = 0;
            }
            if (i5 == p().length() && iE < iD) {
                iE++;
            }
            return o(E(iE, f19262j), i5);
        } catch (IllegalStateException unused) {
            return null;
        }
    }
}
