package z7;

import com.google.common.util.concurrent.ListenableFuture;

/* loaded from: classes.dex */
public final class e implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final j f98287a;

    /* renamed from: b, reason: collision with root package name */
    public final ListenableFuture f98288b;

    public e(j jVar, ListenableFuture listenableFuture) {
        this.f98287a = jVar;
        this.f98288b = listenableFuture;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.f98287a.f98296a != this) {
            return;
        }
        if (h.f98294f.c(this.f98287a, this, h.g(this.f98288b))) {
            h.d(this.f98287a);
        }
    }
}
