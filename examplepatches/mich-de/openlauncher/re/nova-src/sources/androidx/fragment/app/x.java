package androidx.fragment.app;

import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes2.dex */
public final class x extends j.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AtomicReference f14707a;

    public x(AtomicReference atomicReference) {
        this.f14707a = atomicReference;
    }

    @Override // j.c
    public final void a(Object obj, n4.c cVar) {
        j.c cVar2 = (j.c) this.f14707a.get();
        if (cVar2 == null) {
            throw new IllegalStateException("Operation cannot be started before fragment is in created state");
        }
        cVar2.a(obj, cVar);
    }

    @Override // j.c
    public final void b() {
        j.c cVar = (j.c) this.f14707a.getAndSet(null);
        if (cVar != null) {
            cVar.b();
        }
    }
}
