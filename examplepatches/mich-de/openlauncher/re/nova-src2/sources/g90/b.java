package g90;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.security.cert.TrustAnchor;
import java.security.cert.X509Certificate;
import javax.net.ssl.X509TrustManager;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class b implements k90.d {

    /* renamed from: a, reason: collision with root package name */
    public final X509TrustManager f57249a;

    /* renamed from: b, reason: collision with root package name */
    public final Method f57250b;

    public b(X509TrustManager x509TrustManager, Method method) {
        this.f57249a = x509TrustManager;
        this.f57250b = method;
    }

    @Override // k90.d
    public final X509Certificate a(X509Certificate x509Certificate) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        try {
            Object objInvoke = this.f57250b.invoke(this.f57249a, x509Certificate);
            Intrinsics.e(objInvoke, "null cannot be cast to non-null type java.security.cert.TrustAnchor");
            return ((TrustAnchor) objInvoke).getTrustedCert();
        } catch (IllegalAccessException e3) {
            throw new AssertionError("unable to get issues and signature", e3);
        } catch (InvocationTargetException unused) {
            return null;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f57249a, bVar.f57249a) && Intrinsics.b(this.f57250b, bVar.f57250b);
    }

    public final int hashCode() {
        return this.f57250b.hashCode() + (this.f57249a.hashCode() * 31);
    }

    public final String toString() {
        return "CustomTrustRootIndex(trustManager=" + this.f57249a + ", findByIssuerAndSignatureMethod=" + this.f57250b + ')';
    }
}
