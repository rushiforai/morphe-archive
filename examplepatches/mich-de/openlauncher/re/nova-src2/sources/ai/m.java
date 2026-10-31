package ai;

import android.os.Handler;
import com.google.android.gms.internal.measurement.z6;

/* loaded from: classes3.dex */
public abstract class m {

    /* renamed from: d, reason: collision with root package name */
    public static volatile z6 f13125d;

    /* renamed from: a, reason: collision with root package name */
    public final w1 f13126a;

    /* renamed from: b, reason: collision with root package name */
    public final ab.z f13127b;

    /* renamed from: c, reason: collision with root package name */
    public volatile long f13128c;

    public m(w1 w1Var) {
        sg.w.h(w1Var);
        this.f13126a = w1Var;
        this.f13127b = new ab.z(1, this, w1Var);
    }

    public abstract void a();

    public final void b(long j11) {
        c();
        if (j11 >= 0) {
            w1 w1Var = this.f13126a;
            w1Var.e().getClass();
            this.f13128c = System.currentTimeMillis();
            if (d().postDelayed(this.f13127b, j11)) {
                return;
            }
            w1Var.b().f13190f.b(Long.valueOf(j11), "Failed to schedule delayed post. time");
        }
    }

    public final void c() {
        this.f13128c = 0L;
        d().removeCallbacks(this.f13127b);
    }

    public final Handler d() {
        z6 z6Var;
        if (f13125d != null) {
            return f13125d;
        }
        synchronized (m.class) {
            try {
                if (f13125d == null) {
                    f13125d = new z6(this.f13126a.d().getMainLooper(), 0);
                }
                z6Var = f13125d;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return z6Var;
    }
}
