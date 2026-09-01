package defpackage;

import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fl1 extends xa6 {
    public final x51 e;

    public fl1(x51 x51Var) {
        this.e = x51Var;
    }

    @Override // defpackage.xa6
    public final boolean l() {
        return true;
    }

    @Override // defpackage.xa6
    public final void m(Throwable th) {
        Unsafe unsafe;
        Unsafe unsafe2;
        db6 db6VarK = k();
        x51 x51Var = this.e;
        Throwable thP = x51Var.p(db6VarK);
        if (x51Var.y()) {
            rg3 rg3Var = (rg3) x51Var.d;
            long j = rg3.h;
            loop0: while (true) {
                Object objectVolatile = m80.a.getObjectVolatile(rg3Var, j);
                d1g d1gVar = op8.f;
                if (g76.L(objectVolatile, d1gVar)) {
                    do {
                        unsafe = m80.a;
                        if (unsafe.compareAndSwapObject(rg3Var, rg3.h, d1gVar, thP)) {
                            return;
                        }
                    } while (unsafe.getObjectVolatile(rg3Var, j) == d1gVar);
                } else {
                    if (objectVolatile instanceof Throwable) {
                        return;
                    }
                    do {
                        unsafe2 = m80.a;
                        if (unsafe2.compareAndSwapObject(rg3Var, rg3.h, objectVolatile, (Object) null)) {
                            break loop0;
                        }
                    } while (unsafe2.getObjectVolatile(rg3Var, j) == objectVolatile);
                }
            }
        }
        x51Var.l(thP);
        if (x51Var.y()) {
            return;
        }
        x51Var.n();
    }
}
