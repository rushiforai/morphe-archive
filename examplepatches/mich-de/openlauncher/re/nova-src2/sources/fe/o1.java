package fe;

import android.os.Looper;
import android.os.SystemClock;
import java.util.concurrent.TimeoutException;

/* loaded from: classes3.dex */
public final class o1 {

    /* renamed from: a, reason: collision with root package name */
    public final n1 f54939a;

    /* renamed from: b, reason: collision with root package name */
    public final m1 f54940b;

    /* renamed from: c, reason: collision with root package name */
    public final wf.q f54941c;

    /* renamed from: d, reason: collision with root package name */
    public int f54942d;

    /* renamed from: e, reason: collision with root package name */
    public Object f54943e;

    /* renamed from: f, reason: collision with root package name */
    public final Looper f54944f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f54945g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f54946h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f54947i;

    public o1(m1 m1Var, n1 n1Var, z1 z1Var, int i5, wf.q qVar, Looper looper) {
        this.f54940b = m1Var;
        this.f54939a = n1Var;
        this.f54944f = looper;
        this.f54941c = qVar;
    }

    public final synchronized void a(long j11) {
        boolean z11;
        wf.a.i(this.f54945g);
        wf.a.i(this.f54944f.getThread() != Thread.currentThread());
        this.f54941c.getClass();
        long jElapsedRealtime = SystemClock.elapsedRealtime() + j11;
        while (true) {
            z11 = this.f54947i;
            if (z11 || j11 <= 0) {
                break;
            }
            this.f54941c.getClass();
            wait(j11);
            this.f54941c.getClass();
            j11 = jElapsedRealtime - SystemClock.elapsedRealtime();
        }
        if (!z11) {
            throw new TimeoutException("Message delivery timed out.");
        }
    }

    public final synchronized void b(boolean z11) {
        this.f54946h = z11 | this.f54946h;
        this.f54947i = true;
        notifyAll();
    }

    public final void c() {
        wf.a.i(!this.f54945g);
        this.f54945g = true;
        h0 h0Var = (h0) this.f54940b;
        synchronized (h0Var) {
            if (!h0Var.f54831y && h0Var.f54817i.isAlive()) {
                h0Var.f54816h.a(14, this).b();
                return;
            }
            wf.a.D("ExoPlayerImplInternal", "Ignoring messages sent after release.");
            b(false);
        }
    }
}
