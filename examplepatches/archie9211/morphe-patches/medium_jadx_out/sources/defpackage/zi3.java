package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zi3 implements g8a {
    public static final Object c = new Object();
    public volatile g8a a;
    public volatile Object b;

    public static g8a a(g8a g8aVar) {
        if (g8aVar instanceof zi3) {
            return g8aVar;
        }
        zi3 zi3Var = new zi3();
        zi3Var.b = c;
        zi3Var.a = g8aVar;
        return zi3Var;
    }

    @Override // defpackage.g8a
    public final Object get() {
        Object obj;
        Object obj2 = this.b;
        Object obj3 = c;
        if (obj2 != obj3) {
            return obj2;
        }
        synchronized (this) {
            try {
                obj = this.b;
                if (obj == obj3) {
                    obj = this.a.get();
                    Object obj4 = this.b;
                    if (obj4 != obj3 && obj4 != obj) {
                        throw new IllegalStateException("Scoped provider was invoked recursively returning different results: " + obj4 + " & " + obj + ". This is likely due to a circular dependency.");
                    }
                    this.b = obj;
                    this.a = null;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return obj;
    }
}
