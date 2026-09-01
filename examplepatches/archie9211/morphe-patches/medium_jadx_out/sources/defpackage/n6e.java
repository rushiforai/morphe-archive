package defpackage;

import java.util.LinkedList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n6e implements Runnable {
    public final LinkedList a;
    public final l66 b;
    public final ysb c;

    public n6e(LinkedList linkedList, l66 l66Var, ysb ysbVar) {
        ysbVar.getClass();
        this.a = linkedList;
        this.b = l66Var;
        this.c = ysbVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        ny3 ny3Var = ny3.a;
        l66 l66Var = this.b;
        vu2 vu2VarF = l66Var.f(ny3Var);
        if (vu2VarF == null) {
            return;
        }
        ysb ysbVar = this.c;
        asc ascVar = ysbVar.g;
        qu2 qu2Var = ysbVar.h;
        sp0 sp0VarH = ascVar.h();
        if (sp0VarH != null) {
            yp0 yp0Var = sp0VarH.a;
            m6e m6eVarK = qu2Var.k(vu2VarF, sp0VarH.b, sp0VarH.c, yp0Var);
            ascVar.c(yp0Var, new d4b(m6eVarK.b), !m6eVarK.a);
            if (m6eVarK instanceof h6e) {
                LinkedList linkedList = this.a;
                linkedList.offer(new n6e(linkedList, l66Var, ysbVar));
            }
        }
    }
}
