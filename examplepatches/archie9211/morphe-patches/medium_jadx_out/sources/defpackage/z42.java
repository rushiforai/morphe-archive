package defpackage;

import java.util.List;
import javax.net.ssl.SSLSocket;
import org.conscrypt.Conscrypt;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class z42 implements yjc {
    public static final x42 a = new x42();
    public static final boolean b;

    static {
        boolean z = false;
        try {
            Class.forName("org.conscrypt.Conscrypt$Version", false, y42.class.getClassLoader());
            if (Conscrypt.isAvailable()) {
                if (y42.a()) {
                    z = true;
                }
            }
        } catch (ClassNotFoundException | NoClassDefFoundError unused) {
        }
        b = z;
    }

    @Override // defpackage.yjc
    public final boolean a(SSLSocket sSLSocket) {
        return Conscrypt.isConscrypt(sSLSocket);
    }

    @Override // defpackage.yjc
    public final boolean b() {
        return b;
    }

    @Override // defpackage.yjc
    public final String c(SSLSocket sSLSocket) {
        if (a(sSLSocket)) {
            return Conscrypt.getApplicationProtocol(sSLSocket);
        }
        return null;
    }

    @Override // defpackage.yjc
    public final void d(SSLSocket sSLSocket, String str, List list) {
        if (a(sSLSocket)) {
            Conscrypt.setUseSessionTickets(sSLSocket, true);
            ea9 ea9Var = ea9.a;
            Conscrypt.setApplicationProtocols(sSLSocket, (String[]) u3b.h(list).toArray(new String[0]));
        }
    }
}
