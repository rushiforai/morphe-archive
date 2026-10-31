package h90;

import android.net.ssl.SSLSockets;
import android.os.Build;
import java.io.IOException;
import java.util.List;
import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLSocket;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a implements m {
    @Override // h90.m
    public final boolean a(SSLSocket sSLSocket) {
        return SSLSockets.isSupportedSocket(sSLSocket);
    }

    @Override // h90.m
    public final boolean b() {
        g90.m mVar = g90.m.f57276a;
        return lm.e.u() && Build.VERSION.SDK_INT >= 29;
    }

    @Override // h90.m
    public final String c(SSLSocket sSLSocket) {
        String applicationProtocol = sSLSocket.getApplicationProtocol();
        if (applicationProtocol == null ? true : applicationProtocol.equals(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) {
            return null;
        }
        return applicationProtocol;
    }

    @Override // h90.m
    public final void d(SSLSocket sSLSocket, String str, List protocols) throws IOException {
        Intrinsics.g(protocols, "protocols");
        try {
            SSLSockets.setUseSessionTickets(sSLSocket, true);
            SSLParameters sSLParameters = sSLSocket.getSSLParameters();
            g90.m mVar = g90.m.f57276a;
            sSLParameters.setApplicationProtocols((String[]) lm.e.j(protocols).toArray(new String[0]));
            sSLSocket.setSSLParameters(sSLParameters);
        } catch (IllegalArgumentException e3) {
            throw new IOException("Android internal error", e3);
        }
    }
}
