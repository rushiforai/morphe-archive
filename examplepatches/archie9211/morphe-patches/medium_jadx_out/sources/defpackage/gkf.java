package defpackage;

import android.os.AsyncTask;
import android.util.Log;
import com.google.android.gms.auth.api.signin.internal.SignInHubActivity;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gkf {
    public o57 a;
    public boolean b = false;
    public boolean c = false;
    public boolean d = true;
    public boolean e = false;
    public Executor f;
    public volatile o90 g;
    public volatile o90 h;
    public final Semaphore i;
    public final Set j;

    public gkf(SignInHubActivity signInHubActivity, Set set) {
        signInHubActivity.getApplicationContext();
        this.i = new Semaphore(0);
        this.j = set;
    }

    public final void a() {
        if (this.h != null || this.g == null) {
            return;
        }
        this.g.getClass();
        if (this.f == null) {
            this.f = AsyncTask.THREAD_POOL_EXECUTOR;
        }
        o90 o90Var = this.g;
        Executor executor = this.f;
        if (o90Var.b == n28.PENDING) {
            o90Var.b = n28.RUNNING;
            executor.execute(o90Var.a);
            return;
        }
        int i = m28.a[o90Var.b.ordinal()];
        if (i == 1) {
            ygf.f("Cannot execute task: the task is already running.");
        } else if (i != 2) {
            ygf.f("We should never reach this state");
        } else {
            ygf.f("Cannot execute task: the task has already been executed (a task can be executed only once)");
        }
    }

    public final void b() {
        Iterator it2 = this.j.iterator();
        if (it2.hasNext()) {
            ((wif) it2.next()).getClass();
            rd6.b();
            return;
        }
        try {
            this.i.tryAcquire(0, 5L, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            Log.i("GACSignInLoader", "Unexpected InterruptedException", e);
            Thread.currentThread().interrupt();
        }
    }

    public final boolean c() {
        if (this.g == null) {
            return false;
        }
        boolean z = this.b;
        if (!z) {
            if (z) {
                d();
            } else {
                this.e = true;
            }
        }
        o90 o90Var = this.h;
        o90 o90Var2 = this.g;
        if (o90Var != null) {
            o90Var2.getClass();
            this.g = null;
            return false;
        }
        o90Var2.getClass();
        o90 o90Var3 = this.g;
        o90Var3.c.set(true);
        boolean zCancel = o90Var3.a.cancel(false);
        if (zCancel) {
            this.h = this.g;
        }
        this.g = null;
        return zCancel;
    }

    public final void d() {
        c();
        this.g = new o90(this);
        a();
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(64);
        Class<?> cls = getClass();
        sb.append(cls.getSimpleName());
        sb.append("{");
        sb.append(Integer.toHexString(System.identityHashCode(cls)));
        sb.append(" id=0}");
        return sb.toString();
    }
}
