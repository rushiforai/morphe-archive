package defpackage;

import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class xa6 extends y67 implements yh3, m06 {
    public db6 d;

    @Override // defpackage.yh3
    public final void dispose() {
        xa6 xa6Var;
        Unsafe unsafe;
        long j;
        db6 db6VarK = k();
        while (true) {
            Object objH = db6VarK.H();
            if (objH instanceof xa6) {
                if (objH != this) {
                    return;
                }
                sx3 sx3Var = o7f.o;
                do {
                    unsafe = m80.a;
                    j = db6.b;
                    if (unsafe.compareAndSwapObject(db6VarK, j, objH, sx3Var)) {
                        return;
                    }
                } while (unsafe.getObjectVolatile(db6VarK, j) == objH);
            } else {
                if (!(objH instanceof m06) || ((m06) objH).g() == null) {
                    return;
                }
                while (true) {
                    Object objE = this.e();
                    if (objE instanceof l4b) {
                        return;
                    }
                    if (objE == this) {
                        return;
                    }
                    objE.getClass();
                    y67 y67Var = (y67) objE;
                    Unsafe unsafe2 = m80.a;
                    long j2 = y67.c;
                    l4b l4bVar = (l4b) unsafe2.getObjectVolatile(y67Var, j2);
                    if (l4bVar == null) {
                        l4bVar = new l4b(y67Var);
                        unsafe2.putObjectVolatile(y67Var, j2, l4bVar);
                    }
                    l4b l4bVar2 = l4bVar;
                    while (true) {
                        Unsafe unsafe3 = m80.a;
                        long j3 = y67.a;
                        xa6Var = this;
                        if (unsafe3.compareAndSwapObject(xa6Var, j3, objE, l4bVar2)) {
                            y67Var.c();
                            return;
                        } else if (unsafe3.getObjectVolatile(xa6Var, j3) != objE) {
                            break;
                        } else {
                            this = xa6Var;
                        }
                    }
                    this = xa6Var;
                }
            }
        }
    }

    @Override // defpackage.m06
    public final boolean f() {
        return true;
    }

    @Override // defpackage.m06
    public final gh8 g() {
        return null;
    }

    public va6 getParent() {
        return k();
    }

    public final db6 k() {
        db6 db6Var = this.d;
        if (db6Var != null) {
            return db6Var;
        }
        g76.g0("job");
        throw null;
    }

    public abstract boolean l();

    public abstract void m(Throwable th);

    @Override // defpackage.y67
    public final String toString() {
        return getClass().getSimpleName() + '@' + vv2.I(this) + "[job@" + vv2.I(k()) + ']';
    }
}
