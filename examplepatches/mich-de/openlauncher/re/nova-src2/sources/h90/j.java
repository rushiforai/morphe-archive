package h90;

import java.util.List;
import javax.net.ssl.SSLSocket;
import kotlin.jvm.internal.Intrinsics;
import org.conscrypt.Conscrypt;

/* loaded from: classes.dex */
public final class j implements m {

    /* renamed from: a, reason: collision with root package name */
    public static final i f59558a = new i();

    @Override // h90.m
    public final boolean a(SSLSocket sSLSocket) {
        return Conscrypt.isConscrypt(sSLSocket);
    }

    @Override // h90.m
    public final boolean b() {
        boolean z11 = g90.g.f57257d;
        return g90.e.c();
    }

    @Override // h90.m
    public final String c(SSLSocket sSLSocket) {
        if (a(sSLSocket)) {
            return Conscrypt.getApplicationProtocol(sSLSocket);
        }
        return null;
    }

    @Override // h90.m
    public final void d(SSLSocket sSLSocket, String str, List protocols) {
        Intrinsics.g(protocols, "protocols");
        if (a(sSLSocket)) {
            Conscrypt.setUseSessionTickets(sSLSocket, true);
            g90.m mVar = g90.m.f57276a;
            Conscrypt.setApplicationProtocols(sSLSocket, (String[]) lm.e.j(protocols).toArray(new String[0]));
        }
    }
}
