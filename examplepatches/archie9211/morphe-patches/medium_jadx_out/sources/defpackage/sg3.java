package defpackage;

import kotlinx.coroutines.DispatchException;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class sg3 extends frb {
    public static final /* synthetic */ long e = m80.a.objectFieldOffset(sg3.class.getDeclaredField("_decision$volatile"));
    private volatile /* synthetic */ int _decision$volatile;

    @Override // defpackage.frb, defpackage.db6
    public final void g(Object obj) throws DispatchException {
        h(obj);
    }

    @Override // defpackage.frb, defpackage.db6
    public final void h(Object obj) throws DispatchException {
        while (true) {
            Unsafe unsafe = m80.a;
            long j = e;
            int intVolatile = unsafe.getIntVolatile(this, j);
            if (intVolatile != 0) {
                if (intVolatile == 1) {
                    op8.k0(pwd.Q(this.d), bgf.H(obj));
                    return;
                } else {
                    ygf.f("Already resumed");
                    return;
                }
            }
            sg3 sg3Var = this;
            if (unsafe.compareAndSwapInt(sg3Var, j, 0, 2)) {
                return;
            } else {
                this = sg3Var;
            }
        }
    }
}
