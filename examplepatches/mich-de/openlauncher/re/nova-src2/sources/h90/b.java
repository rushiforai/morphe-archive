package h90;

import android.net.http.X509TrustManagerExtensions;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.List;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.X509TrustManager;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b extends u90.b {

    /* renamed from: b, reason: collision with root package name */
    public final X509TrustManager f59546b;

    /* renamed from: c, reason: collision with root package name */
    public final X509TrustManagerExtensions f59547c;

    public b(X509TrustManager x509TrustManager, X509TrustManagerExtensions x509TrustManagerExtensions) {
        this.f59546b = x509TrustManager;
        this.f59547c = x509TrustManagerExtensions;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof b) && ((b) obj).f59546b == this.f59546b;
    }

    public final int hashCode() {
        return System.identityHashCode(this.f59546b);
    }

    @Override // u90.b
    public final List k(String hostname, List chain) throws CertificateException, SSLPeerUnverifiedException {
        Intrinsics.g(chain, "chain");
        Intrinsics.g(hostname, "hostname");
        try {
            List<X509Certificate> listCheckServerTrusted = this.f59547c.checkServerTrusted((X509Certificate[]) chain.toArray(new X509Certificate[0]), "RSA", hostname);
            Intrinsics.f(listCheckServerTrusted, "x509TrustManagerExtensio…ficates, \"RSA\", hostname)");
            return listCheckServerTrusted;
        } catch (CertificateException e3) {
            SSLPeerUnverifiedException sSLPeerUnverifiedException = new SSLPeerUnverifiedException(e3.getMessage());
            sSLPeerUnverifiedException.initCause(e3);
            throw sSLPeerUnverifiedException;
        }
    }
}
