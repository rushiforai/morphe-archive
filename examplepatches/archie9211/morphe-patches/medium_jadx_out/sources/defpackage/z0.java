package defpackage;

import kotlinx.coroutines.CompletionHandlerException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class z0 extends db6 implements n92, sb2 {
    public final ib2 c;

    public z0(ib2 ib2Var, boolean z) {
        super(z);
        M((va6) ib2Var.o0(cd7.g));
        this.c = ib2Var.j0(this);
    }

    @Override // defpackage.db6
    public final void K(CompletionHandlerException completionHandlerException) {
        kyd.Y(this.c, completionHandlerException);
    }

    @Override // defpackage.sb2
    public final ib2 Q() {
        return this.c;
    }

    @Override // defpackage.db6
    public final void a0(Object obj) {
        if (!(obj instanceof cy1)) {
            k0(obj);
        } else {
            cy1 cy1Var = (cy1) obj;
            i0(cy1Var.a, m80.a.getIntVolatile(cy1Var, cy1.b) == 1);
        }
    }

    @Override // defpackage.n92
    public final ib2 getContext() {
        return this.c;
    }

    @Override // defpackage.n92
    public final void resumeWith(Object obj) {
        Throwable thB = bjb.b(obj);
        if (thB != null) {
            obj = new cy1(thB, false);
        }
        Object objW = W(obj);
        if (objW == o7f.j) {
            return;
        }
        h(objW);
    }

    @Override // defpackage.db6
    public final String v() {
        return getClass().getSimpleName().concat(" was cancelled");
    }

    public void k0(Object obj) {
    }

    public void i0(Throwable th, boolean z) {
    }
}
