package defpackage;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlinx.coroutines.DispatchException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class z88 implements w51, xwe {
    public final x51 a;
    public final Object b;
    public final /* synthetic */ a98 c;

    public z88(a98 a98Var, x51 x51Var, Object obj) {
        this.c = a98Var;
        this.a = x51Var;
        this.b = obj;
    }

    @Override // defpackage.xwe
    public final void a(jwb jwbVar, int i) {
        this.a.a(jwbVar, i);
    }

    @Override // defpackage.w51
    public final d1g d(Object obj, c55 c55Var) {
        a98 a98Var = this.c;
        g64 g64Var = new g64(a98Var, 25, this);
        d1g d1gVarF = this.a.F((c1e) obj, g64Var);
        if (d1gVarF != null) {
            a98.i.set(a98Var, this.b);
        }
        return d1gVarF;
    }

    @Override // defpackage.n92
    public final ib2 getContext() {
        return this.a.e;
    }

    @Override // defpackage.w51
    public final void j(Object obj, c55 c55Var) throws DispatchException {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = a98.i;
        Object obj2 = this.b;
        a98 a98Var = this.c;
        atomicReferenceFieldUpdater.set(a98Var, obj2);
        q58 q58Var = new q58(a98Var, 2, this);
        x51 x51Var = this.a;
        x51Var.C(c1e.a, x51Var.c, new so1(4, q58Var));
    }

    @Override // defpackage.w51
    public final boolean l(Throwable th) {
        return this.a.l(th);
    }

    @Override // defpackage.n92
    public final void resumeWith(Object obj) {
        this.a.resumeWith(obj);
    }

    @Override // defpackage.w51
    public final void t(Object obj) throws DispatchException {
        this.a.t(obj);
    }
}
