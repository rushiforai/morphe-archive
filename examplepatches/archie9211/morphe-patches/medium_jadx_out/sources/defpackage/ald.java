package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class ald {
    public static final ThreadLocal a = new ThreadLocal();

    public static k34 a() {
        ThreadLocal threadLocal = a;
        k34 k34Var = (k34) threadLocal.get();
        if (k34Var != null) {
            return k34Var;
        }
        rs0 rs0Var = new rs0(Thread.currentThread());
        threadLocal.set(rs0Var);
        return rs0Var;
    }
}
