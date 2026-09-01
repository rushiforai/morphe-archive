package defpackage;

import java.util.List;
import javax.net.ssl.SSLSocket;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class u33 implements yjc {
    public final t33 a;
    public yjc b;

    public u33(t33 t33Var) {
        this.a = t33Var;
    }

    @Override // defpackage.yjc
    public final boolean a(SSLSocket sSLSocket) {
        return this.a.a(sSLSocket);
    }

    @Override // defpackage.yjc
    public final boolean b() {
        return true;
    }

    @Override // defpackage.yjc
    public final String c(SSLSocket sSLSocket) {
        yjc yjcVarE = e(sSLSocket);
        if (yjcVarE != null) {
            return yjcVarE.c(sSLSocket);
        }
        return null;
    }

    @Override // defpackage.yjc
    public final void d(SSLSocket sSLSocket, String str, List list) {
        yjc yjcVarE = e(sSLSocket);
        if (yjcVarE != null) {
            yjcVarE.d(sSLSocket, str, list);
        }
    }

    public final synchronized yjc e(SSLSocket sSLSocket) {
        try {
            if (this.b == null && this.a.a(sSLSocket)) {
                this.b = this.a.c(sSLSocket);
            }
        } catch (Throwable th) {
            throw th;
        }
        return this.b;
    }
}
