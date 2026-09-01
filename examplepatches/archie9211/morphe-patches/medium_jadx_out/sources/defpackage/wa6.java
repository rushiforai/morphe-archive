package defpackage;

import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class wa6 extends db6 {
    public final boolean c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wa6(va6 va6Var) {
        super(true);
        boolean z = true;
        M(va6Var);
        Unsafe unsafe = m80.a;
        long j = db6.a;
        gl1 gl1Var = (gl1) unsafe.getObjectVolatile(this, j);
        hl1 hl1Var = gl1Var instanceof hl1 ? (hl1) gl1Var : null;
        if (hl1Var == null) {
            z = false;
            break;
        }
        db6 db6VarK = hl1Var.k();
        while (!db6VarK.E()) {
            gl1 gl1Var2 = (gl1) m80.a.getObjectVolatile(db6VarK, j);
            hl1 hl1Var2 = gl1Var2 instanceof hl1 ? (hl1) gl1Var2 : null;
            if (hl1Var2 == null) {
                z = false;
                break;
            }
            db6VarK = hl1Var2.k();
        }
        this.c = z;
    }

    @Override // defpackage.db6
    public final boolean E() {
        return this.c;
    }

    @Override // defpackage.db6
    public final boolean F() {
        return true;
    }
}
