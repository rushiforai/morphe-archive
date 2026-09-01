package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wc6 implements pj6 {
    public static final wc6 a = new wc6();
    public static final vc6 b = vc6.b;

    @Override // defpackage.pj6
    public final xzb a() {
        return b;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        tc6 tc6Var = (tc6) obj;
        tc6Var.getClass();
        k40.L(xtcVar);
        juc jucVar = juc.a;
        new r07(gc6.a).b(xtcVar, tc6Var);
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        k40.K(kw2Var);
        juc jucVar = juc.a;
        return new tc6((Map) new r07(gc6.a).i(kw2Var));
    }
}
