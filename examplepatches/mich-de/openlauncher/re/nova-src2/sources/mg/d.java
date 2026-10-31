package mg;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
import b.c0;
import com.google.android.gms.auth.api.signin.internal.SignInHubActivity;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public n6.b f76284a;

    /* renamed from: b, reason: collision with root package name */
    public Context f76285b;

    /* renamed from: g, reason: collision with root package name */
    public Executor f76290g;

    /* renamed from: h, reason: collision with root package name */
    public volatile o6.a f76291h;

    /* renamed from: i, reason: collision with root package name */
    public volatile o6.a f76292i;

    /* renamed from: k, reason: collision with root package name */
    public final Set f76294k;

    /* renamed from: c, reason: collision with root package name */
    public boolean f76286c = false;

    /* renamed from: d, reason: collision with root package name */
    public boolean f76287d = false;

    /* renamed from: e, reason: collision with root package name */
    public boolean f76288e = true;

    /* renamed from: f, reason: collision with root package name */
    public boolean f76289f = false;

    /* renamed from: j, reason: collision with root package name */
    public final Semaphore f76293j = new Semaphore(0);

    public d(SignInHubActivity signInHubActivity, Set set) {
        this.f76285b = signInHubActivity.getApplicationContext();
        this.f76294k = set;
    }

    public final void a() {
        if (this.f76291h != null) {
            boolean z11 = this.f76286c;
            if (!z11) {
                if (z11) {
                    c();
                } else {
                    this.f76289f = true;
                }
            }
            if (this.f76292i != null) {
                this.f76291h.getClass();
                this.f76291h = null;
                return;
            }
            this.f76291h.getClass();
            o6.a aVar = this.f76291h;
            aVar.f79612c.set(true);
            if (aVar.f79610a.cancel(false)) {
                this.f76292i = this.f76291h;
            }
            this.f76291h = null;
        }
    }

    public final void b() {
        if (this.f76292i != null || this.f76291h == null) {
            return;
        }
        this.f76291h.getClass();
        if (this.f76290g == null) {
            this.f76290g = AsyncTask.THREAD_POOL_EXECUTOR;
        }
        o6.a aVar = this.f76291h;
        Executor executor = this.f76290g;
        if (aVar.f79611b == 1) {
            aVar.f79611b = 2;
            executor.execute(aVar.f79610a);
            return;
        }
        int iF = c0.F(aVar.f79611b);
        if (iF == 1) {
            throw new IllegalStateException("Cannot execute task: the task is already running.");
        }
        if (iF == 2) {
            throw new IllegalStateException("Cannot execute task: the task has already been executed (a task can be executed only once)");
        }
        throw new IllegalStateException("We should never reach this state");
    }

    public final void c() {
        a();
        this.f76291h = new o6.a(this);
        b();
    }

    public final void d() throws InterruptedException {
        Iterator it = this.f76294k.iterator();
        if (it.hasNext()) {
            ((qg.i) it.next()).getClass();
            throw new UnsupportedOperationException();
        }
        try {
            this.f76293j.tryAcquire(0, 5L, TimeUnit.SECONDS);
        } catch (InterruptedException e3) {
            Log.i("GACSignInLoader", "Unexpected InterruptedException", e3);
            Thread.currentThread().interrupt();
        }
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder(64);
        Class<?> cls = getClass();
        sb2.append(cls.getSimpleName());
        sb2.append("{");
        sb2.append(Integer.toHexString(System.identityHashCode(cls)));
        sb2.append(" id=0}");
        return sb2.toString();
    }
}
