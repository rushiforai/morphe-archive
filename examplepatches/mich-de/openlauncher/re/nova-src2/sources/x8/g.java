package x8;

import androidx.lifecycle.DefaultLifecycleObserver;
import h6.z;

/* loaded from: classes.dex */
public final class g extends h6.u {

    /* renamed from: b, reason: collision with root package name */
    public static final g f95302b = new g();

    /* renamed from: c, reason: collision with root package name */
    public static final f f95303c = new f();

    @Override // h6.u
    public final void a(z zVar) {
        if (!(zVar instanceof DefaultLifecycleObserver)) {
            throw new IllegalArgumentException((zVar + " must implement androidx.lifecycle.DefaultLifecycleObserver.").toString());
        }
        DefaultLifecycleObserver defaultLifecycleObserver = (DefaultLifecycleObserver) zVar;
        f fVar = f95303c;
        defaultLifecycleObserver.onCreate(fVar);
        defaultLifecycleObserver.onStart(fVar);
        defaultLifecycleObserver.onResume(fVar);
    }

    @Override // h6.u
    public final h6.t b() {
        return h6.t.f59444e;
    }

    @Override // h6.u
    public final void c(z zVar) {
    }

    public final String toString() {
        return "coil.request.GlobalLifecycle";
    }
}
