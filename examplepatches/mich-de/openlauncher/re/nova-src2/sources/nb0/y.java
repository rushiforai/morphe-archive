package nb0;

import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes5.dex */
public final class y implements mb0.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ z f78173a;

    public y(z zVar) {
        this.f78173a = zVar;
    }

    @Override // mb0.a
    public final void call() {
        z zVar = this.f78173a;
        zVar.f78179h.getAndSet(z.f78175m);
        AtomicReference atomicReference = zVar.f78177f;
        while (!atomicReference.compareAndSet(zVar, null) && atomicReference.get() == zVar) {
        }
    }
}
