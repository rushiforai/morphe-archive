package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s17 extends t17 {
    @Override // defpackage.t17
    public final void a(long j, Object obj) {
        ((a2) ((t56) r2e.j(j, obj))).a = false;
    }

    @Override // defpackage.t17
    public final void b(long j, Object obj, Object obj2) {
        t56 t56VarH = (t56) r2e.j(j, obj);
        t56 t56Var = (t56) r2e.j(j, obj2);
        int size = t56VarH.size();
        int size2 = t56Var.size();
        if (size > 0 && size2 > 0) {
            if (!((a2) t56VarH).a) {
                t56VarH = t56VarH.h(size2 + size);
            }
            t56VarH.addAll(t56Var);
        }
        if (size > 0) {
            t56Var = t56VarH;
        }
        r2e.q(j, obj, t56Var);
    }

    @Override // defpackage.t17
    public final List c(long j, Object obj) {
        t56 t56Var = (t56) r2e.j(j, obj);
        if (((a2) t56Var).a) {
            return t56Var;
        }
        int size = t56Var.size();
        t56 t56VarH = t56Var.h(size == 0 ? 10 : size * 2);
        r2e.q(j, obj, t56VarH);
        return t56VarH;
    }
}
