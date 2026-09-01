package defpackage;

import javax.net.ssl.SSLSocket;
import org.conscrypt.Conscrypt;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x42 implements t33 {
    @Override // defpackage.t33
    public final boolean a(SSLSocket sSLSocket) {
        return z42.b && Conscrypt.isConscrypt(sSLSocket);
    }

    @Override // defpackage.t33
    public final yjc c(SSLSocket sSLSocket) {
        return new z42();
    }
}
