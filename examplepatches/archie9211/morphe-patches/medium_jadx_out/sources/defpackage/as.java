package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class as {
    public static final ii5 a;

    static {
        try {
            ii5 ii5Var = zr.a;
            if (ii5Var == null) {
                throw new NullPointerException("Scheduler Callable returned null");
            }
            a = ii5Var;
        } catch (Throwable th) {
            throw w34.a(th);
        }
    }
}
