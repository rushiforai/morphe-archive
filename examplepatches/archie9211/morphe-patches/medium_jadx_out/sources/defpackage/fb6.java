package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fb6 {
    public static final fb6 d = new fb6();
    public final ku3 a;
    public final fa4 b;
    public final c93 c;

    public fb6() {
        ku3 ku3Var = new ku3(14);
        fa4 fa4Var = gx1.n;
        this.a = ku3Var;
        this.b = fa4Var;
        this.c = new c93(0);
    }

    public final Object a(pj6 pj6Var, String str) {
        pj6Var.getClass();
        jl1 jl1Var = new jl1(str);
        Object objA = new vtc(this, g9f.OBJ, jl1Var, pj6Var.a()).a(pj6Var);
        if (jl1Var.i() == 10) {
            return objA;
        }
        jl1.q(jl1Var, "Expected EOF after parsing, but had " + str.charAt(jl1Var.c - 1) + " instead", 0, null, 6);
        throw null;
    }

    public final String b(pj6 pj6Var, Object obj) {
        char[] cArr;
        pj6Var.getClass();
        ad adVar = new ad((char) 0, 8);
        nk1 nk1Var = nk1.c;
        synchronized (nk1Var) {
            m70 m70Var = nk1Var.a;
            cArr = null;
            char[] cArr2 = (char[]) (m70Var.isEmpty() ? null : m70Var.removeLast());
            if (cArr2 != null) {
                nk1Var.b -= cArr2.length;
                cArr = cArr2;
            }
        }
        if (cArr == null) {
            cArr = new char[128];
        }
        adVar.c = cArr;
        try {
            g9f g9fVar = g9f.OBJ;
            xtc[] xtcVarArr = new xtc[((t0) g9f.getEntries()).getSize()];
            g9fVar.getClass();
            new xtc(new sv0(1, adVar), this, g9fVar, xtcVarArr).p(pj6Var, obj);
            return adVar.toString();
        } finally {
            adVar.t();
        }
    }
}
