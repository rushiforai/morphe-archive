package defpackage;

import android.os.Handler;
import android.os.Looper;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xc7 {
    public static final Executor e;
    public final LinkedHashSet a = new LinkedHashSet(1);
    public final LinkedHashSet b = new LinkedHashSet(1);
    public final Handler c = new Handler(Looper.getMainLooper());
    public volatile vc7 d = null;

    static {
        if ("true".equals(System.getProperty("lottie.testing.directExecutor"))) {
            e = new b70(1);
        } else {
            e = Executors.newCachedThreadPool(new yc7());
        }
    }

    public xc7(Callable callable) {
        Executor executor = e;
        wc7 wc7Var = new wc7(callable);
        wc7Var.b = this;
        executor.execute(wc7Var);
    }

    public final synchronized void a(uc7 uc7Var) {
        Throwable th;
        try {
            vc7 vc7Var = this.d;
            if (vc7Var != null && (th = vc7Var.b) != null) {
                uc7Var.onResult(th);
            }
            this.b.add(uc7Var);
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized void b(uc7 uc7Var) {
        bc7 bc7Var;
        try {
            vc7 vc7Var = this.d;
            if (vc7Var != null && (bc7Var = vc7Var.a) != null) {
                uc7Var.onResult(bc7Var);
            }
            this.a.add(uc7Var);
        } catch (Throwable th) {
            throw th;
        }
    }

    public final synchronized void c(Throwable th) {
        ArrayList arrayList = new ArrayList(this.b);
        if (arrayList.isEmpty()) {
            h87.b("Lottie encountered an error but no failure listener was added:", th);
            return;
        }
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            ((uc7) it2.next()).onResult(th);
        }
    }

    public final void d() {
        vc7 vc7Var = this.d;
        if (vc7Var == null) {
            return;
        }
        bc7 bc7Var = vc7Var.a;
        if (bc7Var == null) {
            c(vc7Var.b);
            return;
        }
        synchronized (this) {
            Iterator it2 = new ArrayList(this.a).iterator();
            while (it2.hasNext()) {
                ((uc7) it2.next()).onResult(bc7Var);
            }
        }
    }

    public final void e(vc7 vc7Var) {
        if (this.d != null) {
            ygf.f("A task may only be set once.");
            return;
        }
        this.d = vc7Var;
        if (Looper.myLooper() == Looper.getMainLooper()) {
            d();
        } else {
            this.c.post(new v0(28, this));
        }
    }

    public xc7(bc7 bc7Var) {
        e(new vc7(bc7Var));
    }
}
