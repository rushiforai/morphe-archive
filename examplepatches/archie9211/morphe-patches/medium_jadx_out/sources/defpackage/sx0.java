package defpackage;

import java.util.List;
import javax.net.ssl.SSLSocket;
import org.bouncycastle.jsse.BCSSLParameters;
import org.bouncycastle.jsse.BCSSLSocket;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class sx0 implements yjc {
    public static final qx0 a = new qx0();
    public static final boolean b;

    static {
        boolean z = false;
        try {
            Class.forName("org.bouncycastle.jsse.provider.BouncyCastleJsseProvider", false, rx0.class.getClassLoader());
            z = true;
        } catch (ClassNotFoundException unused) {
        }
        b = z;
    }

    @Override // defpackage.yjc
    public final boolean a(SSLSocket sSLSocket) {
        return false;
    }

    @Override // defpackage.yjc
    public final boolean b() {
        return b;
    }

    @Override // defpackage.yjc
    public final String c(SSLSocket sSLSocket) {
        String applicationProtocol = ((BCSSLSocket) sSLSocket).getApplicationProtocol();
        if (applicationProtocol == null || applicationProtocol.equals("")) {
            return null;
        }
        return applicationProtocol;
    }

    @Override // defpackage.yjc
    public final void d(SSLSocket sSLSocket, String str, List list) {
        if (a(sSLSocket)) {
            BCSSLSocket bCSSLSocket = (BCSSLSocket) sSLSocket;
            BCSSLParameters parameters = bCSSLSocket.getParameters();
            ea9 ea9Var = ea9.a;
            parameters.setApplicationProtocols((String[]) u3b.h(list).toArray(new String[0]));
            bCSSLSocket.setParameters(parameters);
        }
    }
}
