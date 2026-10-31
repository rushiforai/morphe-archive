package rg;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentCallbacks2;
import android.content.res.Configuration;
import android.os.Bundle;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes.dex */
public final class c implements Application.ActivityLifecycleCallbacks, ComponentCallbacks2 {

    /* renamed from: e, reason: collision with root package name */
    public static final c f85862e = new c();

    /* renamed from: a, reason: collision with root package name */
    public final AtomicBoolean f85863a = new AtomicBoolean();

    /* renamed from: b, reason: collision with root package name */
    public final AtomicBoolean f85864b = new AtomicBoolean();

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f85865c = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    public boolean f85866d = false;

    public static void b(Application application) {
        c cVar = f85862e;
        synchronized (cVar) {
            try {
                if (!cVar.f85866d) {
                    application.registerActivityLifecycleCallbacks(cVar);
                    application.registerComponentCallbacks(cVar);
                    cVar.f85866d = true;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void a(b bVar) {
        synchronized (f85862e) {
            this.f85865c.add(bVar);
        }
    }

    public final void c(boolean z11) {
        synchronized (f85862e) {
            try {
                Iterator it = this.f85865c.iterator();
                while (it.hasNext()) {
                    ((b) it.next()).a(z11);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
        boolean zCompareAndSet = this.f85863a.compareAndSet(true, false);
        this.f85864b.set(true);
        if (zCompareAndSet) {
            c(false);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityDestroyed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPaused(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityResumed(Activity activity) {
        boolean zCompareAndSet = this.f85863a.compareAndSet(true, false);
        this.f85864b.set(true);
        if (zCompareAndSet) {
            c(false);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStarted(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStopped(Activity activity) {
    }

    @Override // android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
    }

    @Override // android.content.ComponentCallbacks
    public final void onLowMemory() {
    }

    @Override // android.content.ComponentCallbacks2
    public final void onTrimMemory(int i5) {
        if (i5 == 20 && this.f85863a.compareAndSet(false, true)) {
            this.f85864b.set(true);
            c(true);
        }
    }
}
