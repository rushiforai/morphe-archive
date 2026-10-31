package z7;

import com.google.common.util.concurrent.ListenableFuture;

/* loaded from: classes.dex */
public final class j extends h {
    public final boolean j(Object obj) {
        if (obj == null) {
            obj = h.f98295g;
        }
        if (!h.f98294f.c(this, null, obj)) {
            return false;
        }
        h.d(this);
        return true;
    }

    public final boolean k(Throwable th2) {
        if (!h.f98294f.c(this, null, new b(th2))) {
            return false;
        }
        h.d(this);
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0048  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean l(ListenableFuture listenableFuture) {
        b bVar;
        listenableFuture.getClass();
        Object obj = this.f98296a;
        if (obj != null) {
            if (obj instanceof a) {
                listenableFuture.cancel(((a) obj).f98275a);
            }
        } else if (listenableFuture.isDone()) {
            if (h.f98294f.c(this, null, h.g(listenableFuture))) {
                h.d(this);
                return true;
            }
        } else {
            e eVar = new e(this, listenableFuture);
            if (h.f98294f.c(this, null, eVar)) {
                try {
                    listenableFuture.b(eVar, i.f98299a);
                    return true;
                } catch (Throwable th2) {
                    try {
                        bVar = new b(th2);
                    } catch (Throwable unused) {
                        bVar = b.f98277b;
                    }
                    h.f98294f.c(this, eVar, bVar);
                    return true;
                }
            }
            obj = this.f98296a;
            if (obj instanceof a) {
            }
        }
        return false;
    }
}
