package eb0;

import java.util.concurrent.CompletableFuture;

/* loaded from: classes5.dex */
public final class j extends CompletableFuture {

    /* renamed from: a, reason: collision with root package name */
    public final y f52569a;

    public j(y yVar) {
        this.f52569a = yVar;
    }

    @Override // java.util.concurrent.CompletableFuture, java.util.concurrent.Future
    public final boolean cancel(boolean z11) {
        if (z11) {
            this.f52569a.cancel();
        }
        return super.cancel(z11);
    }
}
