package h90;

import h6.c1;
import javax.net.ssl.SSLSocket;

/* loaded from: classes.dex */
public final class e implements k {
    @Override // h90.k
    public final boolean a(SSLSocket sSLSocket) {
        return r70.j.I0(sSLSocket.getClass().getName(), "com.google.android.gms.org.conscrypt.", false);
    }

    @Override // h90.k
    public final m b(SSLSocket sSLSocket) {
        Class<?> cls = sSLSocket.getClass();
        Class<?> superclass = cls;
        while (!superclass.getSimpleName().equals("OpenSSLSocketImpl")) {
            superclass = superclass.getSuperclass();
            if (superclass == null) {
                throw new AssertionError(c1.r(cls, "No OpenSSLSocketImpl superclass of socket of type "));
            }
        }
        return new f(superclass);
    }
}
