package cl;

import com.google.common.util.concurrent.ListenableFuture;

/* loaded from: classes3.dex */
public final class v0 extends l implements Runnable {

    /* renamed from: h, reason: collision with root package name */
    public ListenableFuture f20080h;

    public v0(ListenableFuture listenableFuture) {
        this.f20080h = listenableFuture;
    }

    @Override // cl.s
    public final void e() {
        this.f20080h = null;
    }

    @Override // cl.s
    public final String l() {
        ListenableFuture listenableFuture = this.f20080h;
        if (listenableFuture == null) {
            return null;
        }
        return "delegate=[" + listenableFuture + "]";
    }

    @Override // java.lang.Runnable
    public final void run() {
        ListenableFuture listenableFuture = this.f20080h;
        if (listenableFuture != null) {
            p(listenableFuture);
        }
    }
}
