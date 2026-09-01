package defpackage;

import java.lang.ref.WeakReference;
import java.util.Set;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d1f extends t76 {
    public final v76 b;
    public final WeakReference c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d1f(v76 v76Var, jlb jlbVar) {
        super(jlbVar.a);
        jlbVar.getClass();
        this.b = v76Var;
        this.c = new WeakReference(jlbVar);
    }

    @Override // defpackage.t76
    public final void a(Set set) {
        set.getClass();
        t76 t76Var = (t76) this.c.get();
        if (t76Var != null) {
            t76Var.a(set);
            return;
        }
        v76 v76Var = this.b;
        ReentrantLock reentrantLock = v76Var.d;
        reentrantLock.lock();
        try {
            nn8 nn8Var = (nn8) v76Var.c.remove(this);
            if (nn8Var != null) {
                mtd mtdVar = v76Var.b;
                int[] iArr = nn8Var.b;
                mtdVar.getClass();
                iArr.getClass();
                if (((hn8) mtdVar.h).b(iArr)) {
                    lk7.E(new u76(v76Var, null, 1));
                }
            }
        } finally {
            reentrantLock.unlock();
        }
    }
}
