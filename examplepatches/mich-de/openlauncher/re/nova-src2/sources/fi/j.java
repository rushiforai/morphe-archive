package fi;

import sg.w;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final t f55135a = new t();

    public j() {
    }

    public final void a(Object obj) {
        this.f55135a.t(obj);
    }

    public final boolean b(Exception exc) {
        t tVar = this.f55135a;
        tVar.getClass();
        w.i(exc, "Exception must not be null");
        synchronized (tVar.f55159a) {
            try {
                if (tVar.f55161c) {
                    return false;
                }
                tVar.f55161c = true;
                tVar.f55164f = exc;
                tVar.f55160b.d(tVar);
                return true;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void c(Object obj) {
        this.f55135a.u(obj);
    }

    public j(a aVar) {
        aVar.a(new r(this));
    }
}
