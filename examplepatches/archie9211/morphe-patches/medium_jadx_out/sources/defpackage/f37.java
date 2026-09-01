package defpackage;

import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class f37 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ AtomicBoolean b;
    public final /* synthetic */ q41 c;
    public final /* synthetic */ m45 d;

    public /* synthetic */ f37(AtomicBoolean atomicBoolean, q41 q41Var, m45 m45Var, int i) {
        this.a = i;
        this.b = atomicBoolean;
        this.c = q41Var;
        this.d = m45Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        m45 m45Var = this.d;
        q41 q41Var = this.c;
        AtomicBoolean atomicBoolean = this.b;
        switch (i) {
            case 0:
                if (!atomicBoolean.get()) {
                    try {
                        q41Var.a(m45Var.invoke());
                    } catch (Throwable th) {
                        q41Var.b(th);
                        return;
                    }
                    break;
                }
                break;
            default:
                if (!atomicBoolean.get()) {
                    try {
                        q41Var.a(m45Var.invoke());
                    } catch (Throwable th2) {
                        q41Var.b(th2);
                    }
                    break;
                }
                break;
        }
    }
}
