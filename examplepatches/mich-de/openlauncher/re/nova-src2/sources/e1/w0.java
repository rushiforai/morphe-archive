package e1;

import com.google.android.gms.tasks.Task;
import java.util.ArrayDeque;

/* loaded from: classes.dex */
public final class w0 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f51405a;

    /* renamed from: b, reason: collision with root package name */
    public Object f51406b;

    /* renamed from: c, reason: collision with root package name */
    public Object f51407c;

    public void a() {
        if (this.f51405a) {
            a1.a((a1) this.f51407c, (m3.o0) this.f51406b);
        }
    }

    public long b(r3.z zVar, long j11, boolean z11, a5.i iVar) {
        a1 a1Var = (a1) this.f51407c;
        long jE = a1.e(a1Var, zVar, j11, z11, false, iVar, false);
        if (!m3.o0.a(jE, (m3.o0) this.f51406b)) {
            this.f51405a = false;
        }
        a1Var.r(m3.o0.c(jE) ? t0.k0.f88060c : t0.k0.f88059b);
        return jE;
    }

    public void c(fi.q qVar) {
        synchronized (this.f51406b) {
            try {
                if (((ArrayDeque) this.f51407c) == null) {
                    this.f51407c = new ArrayDeque();
                }
                ((ArrayDeque) this.f51407c).add(qVar);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public void d(Task task) {
        fi.q qVar;
        synchronized (this.f51406b) {
            if (((ArrayDeque) this.f51407c) != null && !this.f51405a) {
                this.f51405a = true;
                while (true) {
                    synchronized (this.f51406b) {
                        try {
                            qVar = (fi.q) ((ArrayDeque) this.f51407c).poll();
                            if (qVar == null) {
                                this.f51405a = false;
                                return;
                            }
                        } finally {
                        }
                    }
                    qVar.a(task);
                }
            }
        }
    }
}
