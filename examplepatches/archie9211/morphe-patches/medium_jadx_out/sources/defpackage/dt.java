package defpackage;

import android.os.Handler;
import android.view.Choreographer;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dt extends kb2 {
    public static final w5d m = new w5d(co.k);
    public static final bt n = new bt(0);
    public final Choreographer c;
    public final Handler d;
    public boolean i;
    public boolean j;
    public final ft l;
    public final Object e = new Object();
    public final m70 f = new m70();
    public ArrayList g = new ArrayList();
    public ArrayList h = new ArrayList();
    public final ct k = new ct(this);

    public dt(Choreographer choreographer, Handler handler) {
        this.c = choreographer;
        this.d = handler;
        this.l = new ft(choreographer, this);
    }

    @Override // defpackage.kb2
    public final void E0(ib2 ib2Var, Runnable runnable) {
        synchronized (this.e) {
            this.f.addLast(runnable);
            if (!this.i) {
                this.i = true;
                this.d.post(this.k);
                if (!this.j) {
                    this.j = true;
                    this.c.postFrameCallback(this.k);
                }
            }
        }
    }

    public final Runnable I0() {
        Runnable runnable;
        synchronized (this.e) {
            m70 m70Var = this.f;
            runnable = (Runnable) (m70Var.isEmpty() ? null : m70Var.removeFirst());
        }
        return runnable;
    }

    public final void J0() {
        boolean z;
        do {
            Runnable runnableI0 = I0();
            while (runnableI0 != null) {
                runnableI0.run();
                runnableI0 = I0();
            }
            synchronized (this.e) {
                if (this.f.isEmpty()) {
                    z = false;
                    this.i = false;
                } else {
                    z = true;
                }
            }
        } while (z);
    }
}
