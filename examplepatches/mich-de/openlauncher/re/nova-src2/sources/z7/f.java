package z7;

/* loaded from: classes2.dex */
public final class f extends w.b {
    @Override // w.b
    public final boolean b(h hVar, c cVar, c cVar2) {
        synchronized (hVar) {
            try {
                if (hVar.f98297b != cVar) {
                    return false;
                }
                hVar.f98297b = cVar2;
                return true;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // w.b
    public final boolean c(h hVar, Object obj, Object obj2) {
        synchronized (hVar) {
            try {
                if (hVar.f98296a != obj) {
                    return false;
                }
                hVar.f98296a = obj2;
                return true;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // w.b
    public final boolean d(h hVar, g gVar, g gVar2) {
        synchronized (hVar) {
            try {
                if (hVar.f98298c != gVar) {
                    return false;
                }
                hVar.f98298c = gVar2;
                return true;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // w.b
    public final void l(g gVar, g gVar2) {
        gVar.f98291b = gVar2;
    }

    @Override // w.b
    public final void m(g gVar, Thread thread) {
        gVar.f98290a = thread;
    }
}
