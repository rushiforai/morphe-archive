package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rzf extends ur7 {
    @Override // defpackage.ur7
    public final nzf G(h1g h1gVar) {
        nzf nzfVar;
        nzf nzfVar2 = nzf.d;
        synchronized (h1gVar) {
            try {
                nzfVar = h1gVar.b;
                if (nzfVar != nzfVar2) {
                    h1gVar.b = nzfVar2;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return nzfVar;
    }

    @Override // defpackage.ur7
    public final tzf K(h1g h1gVar) {
        tzf tzfVar;
        tzf tzfVar2 = tzf.c;
        synchronized (h1gVar) {
            try {
                tzfVar = h1gVar.c;
                if (tzfVar != tzfVar2) {
                    h1gVar.c = tzfVar2;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return tzfVar;
    }

    @Override // defpackage.ur7
    public final void L(tzf tzfVar, tzf tzfVar2) {
        tzfVar.b = tzfVar2;
    }

    @Override // defpackage.ur7
    public final void M(tzf tzfVar, Thread thread) {
        tzfVar.a = thread;
    }

    @Override // defpackage.ur7
    public final boolean N(h1g h1gVar, nzf nzfVar, nzf nzfVar2) {
        synchronized (h1gVar) {
            try {
                if (h1gVar.b != nzfVar) {
                    return false;
                }
                h1gVar.b = nzfVar2;
                return true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // defpackage.ur7
    public final boolean O(vzf vzfVar, Object obj, Object obj2) {
        synchronized (vzfVar) {
            try {
                if (vzfVar.a != obj) {
                    return false;
                }
                vzfVar.a = obj2;
                return true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // defpackage.ur7
    public final boolean P(vzf vzfVar, tzf tzfVar, tzf tzfVar2) {
        synchronized (vzfVar) {
            try {
                if (vzfVar.c != tzfVar) {
                    return false;
                }
                vzfVar.c = tzfVar2;
                return true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
