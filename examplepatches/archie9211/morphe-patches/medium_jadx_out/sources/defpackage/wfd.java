package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wfd {
    public final jrg a = new jrg();

    public wfd(ujf ujfVar) {
        ((jrg) ujfVar.b).e(yfd.a, new eoc(ujfVar, new ujf(25, this)));
    }

    public final void a(Exception exc) {
        this.a.o(exc);
    }

    public final void b(Object obj) {
        this.a.m(obj);
    }

    public final boolean c(Exception exc) {
        jrg jrgVar = this.a;
        jrgVar.getClass();
        vp7.q("Exception must not be null", exc);
        synchronized (jrgVar.a) {
            try {
                if (jrgVar.c) {
                    return false;
                }
                jrgVar.c = true;
                jrgVar.f = exc;
                jrgVar.b.i(jrgVar);
                return true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void d(Object obj) {
        this.a.n(obj);
    }

    public wfd() {
    }
}
