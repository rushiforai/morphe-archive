package defpackage;

import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class b52 implements qg4 {
    public static final cd7 g = new cd7();
    public final xp0 a;
    public final xp0 b;
    public final m50 c;
    public final dm0 d;
    public final f66 e;
    public volatile qg4 f;

    public b52(e52 e52Var, xp0 xp0Var, xp0 xp0Var2, m50 m50Var, dm0 dm0Var, f66 f66Var) {
        e52Var.getClass();
        f66Var.getClass();
        this.a = xp0Var;
        this.b = xp0Var2;
        this.c = m50Var;
        this.d = dm0Var;
        this.e = f66Var;
        tqd tqdVarD = e52Var.d();
        r40.C(dm0Var, "Data migration", f66Var, new ep0(this, null, b(null), tqdVarD, b(tqdVarD), 1));
        e52Var.e(this);
    }

    @Override // defpackage.qg4
    public final File a() {
        qg4 qg4Var = this.f;
        if (qg4Var != null) {
            return qg4Var.a();
        }
        g76.g0("delegateOrchestrator");
        throw null;
    }

    public final qg4 b(tqd tqdVar) {
        int i = tqdVar == null ? -1 : a52.a[tqdVar.ordinal()];
        if (i == -1 || i == 1) {
            return this.a;
        }
        if (i == 2) {
            return this.b;
        }
        if (i == 3) {
            return g;
        }
        ygf.a();
        return null;
    }

    @Override // defpackage.qg4
    public final File d(File file) {
        qg4 qg4Var = this.f;
        if (qg4Var != null) {
            return qg4Var.d(file);
        }
        g76.g0("delegateOrchestrator");
        throw null;
    }

    @Override // defpackage.qg4
    public final File g() {
        return null;
    }
}
