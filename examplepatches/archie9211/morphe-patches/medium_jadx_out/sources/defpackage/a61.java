package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a61 {
    public boolean a;
    public z51 b;
    public boolean c;

    public final void a(z51 z51Var) {
        synchronized (this) {
            while (this.c) {
                try {
                    try {
                        wait();
                    } catch (InterruptedException unused) {
                    }
                } finally {
                }
            }
            if (this.b == z51Var) {
                return;
            }
            this.b = z51Var;
            if (this.a) {
                z51Var.onCancel();
            }
        }
    }
}
