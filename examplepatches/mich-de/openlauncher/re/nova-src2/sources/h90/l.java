package h90;

import java.util.List;
import javax.net.ssl.SSLSocket;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class l implements m {

    /* renamed from: a, reason: collision with root package name */
    public final k f59559a;

    /* renamed from: b, reason: collision with root package name */
    public m f59560b;

    public l(k kVar) {
        this.f59559a = kVar;
    }

    @Override // h90.m
    public final boolean a(SSLSocket sSLSocket) {
        return this.f59559a.a(sSLSocket);
    }

    @Override // h90.m
    public final boolean b() {
        return true;
    }

    @Override // h90.m
    public final String c(SSLSocket sSLSocket) {
        m mVarE = e(sSLSocket);
        if (mVarE != null) {
            return mVarE.c(sSLSocket);
        }
        return null;
    }

    @Override // h90.m
    public final void d(SSLSocket sSLSocket, String str, List protocols) {
        Intrinsics.g(protocols, "protocols");
        m mVarE = e(sSLSocket);
        if (mVarE != null) {
            mVarE.d(sSLSocket, str, protocols);
        }
    }

    public final synchronized m e(SSLSocket sSLSocket) {
        try {
            if (this.f59560b == null && this.f59559a.a(sSLSocket)) {
                this.f59560b = this.f59559a.b(sSLSocket);
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return this.f59560b;
    }
}
