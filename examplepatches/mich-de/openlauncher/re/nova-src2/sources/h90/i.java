package h90;

import javax.net.ssl.SSLSocket;
import org.conscrypt.Conscrypt;

/* loaded from: classes.dex */
public final class i implements k {
    @Override // h90.k
    public final boolean a(SSLSocket sSLSocket) {
        boolean z11 = g90.g.f57257d;
        return g90.e.c() && Conscrypt.isConscrypt(sSLSocket);
    }

    @Override // h90.k
    public final m b(SSLSocket sSLSocket) {
        return new j();
    }
}
