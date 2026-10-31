package ja;

import ya.j0;

/* loaded from: classes.dex */
public final /* synthetic */ class g implements j0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ h f69292a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Runnable f69293b;

    public /* synthetic */ g(h hVar, Runnable runnable) {
        this.f69292a = hVar;
        this.f69293b = runnable;
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        h hVar = this.f69292a;
        Runnable runnable = this.f69293b;
        synchronized (hVar) {
            try {
                hVar.f69297c.remove(runnable);
                if (hVar.f69297c.isEmpty()) {
                    hVar.f69295a.unregisterReceiver(hVar.f69298d);
                    hVar.f69299e = null;
                    hVar.f69300f = null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
