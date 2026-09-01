package defpackage;

import java.io.Closeable;
import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class fdb implements Closeable {
    public static final edb b;
    public ddb a;

    static {
        h21 h21Var = h21.d;
        h21Var.getClass();
        kz0 kz0Var = new kz0();
        kz0Var.J0(h21Var);
        b = new edb(null, h21Var.a.length, kz0Var);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        egf.b(v0());
    }

    public abstract long f();

    public abstract fn7 m();

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r3v2, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r3v8 */
    public final String p() {
        Charset charsetA;
        zz0 zz0VarV0 = v0();
        String th = null;
        try {
            fn7 fn7VarM = m();
            if (fn7VarM == null || (charsetA = fn7.a(fn7VarM)) == null) {
                charsetA = wk1.a;
            }
            String strB0 = zz0VarV0.b0(ggf.f(zz0VarV0, charsetA));
            try {
                zz0VarV0.close();
            } catch (Throwable th2) {
                th = th2;
            }
            String str = th;
            th = strB0;
            th = str;
        } catch (Throwable th3) {
            th = th3;
            if (zz0VarV0 != null) {
                try {
                    zz0VarV0.close();
                } catch (Throwable th4) {
                    kyd.D(th, th4);
                }
            }
        }
        if (th == 0) {
            return th;
        }
        throw th;
    }

    public abstract zz0 v0();
}
