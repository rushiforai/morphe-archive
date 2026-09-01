package defpackage;

import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mqc extends fv7 {
    public static final /* synthetic */ fj6[] f;
    public final s93 b;
    public final boolean c;
    public final u67 d;
    public final u67 e;

    static {
        u4a u4aVar = new u4a(mqc.class, "functions", "getFunctions()Ljava/util/List;", 0);
        s1b s1bVar = n1b.a;
        f = new fj6[]{s1bVar.g(u4aVar), km4.t(mqc.class, "properties", "getProperties()Ljava/util/List;", 0, s1bVar)};
    }

    public mqc(x67 x67Var, s93 s93Var, boolean z) {
        x67Var.getClass();
        this.b = s93Var;
        this.c = z;
        this.d = new u67(x67Var, new lqc(this, 0));
        this.e = new u67(x67Var, new lqc(this, 1));
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Collection a(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        List list = (List) mk7.z(this.d, f[0]);
        wgc wgcVar = new wgc();
        for (Object obj : list) {
            if (g76.L(((bec) obj).getName(), n98Var)) {
                wgcVar.add(obj);
            }
        }
        return wgcVar;
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final co1 d(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        return null;
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Collection e(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        fj6[] fj6VarArr = f;
        return bu1.Q0((List) mk7.z(this.e, fj6VarArr[1]), (List) mk7.z(this.d, fj6VarArr[0]));
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Collection f(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        List list = (List) mk7.z(this.e, f[1]);
        wgc wgcVar = new wgc();
        for (Object obj : list) {
            if (g76.L(((q4a) obj).getName(), n98Var)) {
                wgcVar.add(obj);
            }
        }
        return wgcVar;
    }
}
