package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class iq4 {
    public static final int a = Math.max(1, Integer.getInteger("rx2.buffer-size", 128).intValue());

    public final void a(uq4 uq4Var) {
        try {
            b(uq4Var);
        } catch (NullPointerException e) {
            throw e;
        } catch (Throwable th) {
            pwd.c0(th);
            ok7.H(th);
            NullPointerException nullPointerException = new NullPointerException("Actually not, but can't throw other exceptions due to RS");
            nullPointerException.initCause(th);
            throw nullPointerException;
        }
    }

    public abstract void b(ywc ywcVar);
}
