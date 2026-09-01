package defpackage;

import android.net.http.X509TrustManagerExtensions;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.List;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.X509TrustManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rm extends f49 {
    public final X509TrustManagerExtensions A;
    public final X509TrustManager z;

    public rm(X509TrustManager x509TrustManager, X509TrustManagerExtensions x509TrustManagerExtensions) {
        this.z = x509TrustManager;
        this.A = x509TrustManagerExtensions;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof rm) && ((rm) obj).z == this.z;
    }

    public final int hashCode() {
        return System.identityHashCode(this.z);
    }

    @Override // defpackage.f49
    public final List w(String str, List list) throws SSLPeerUnverifiedException {
        list.getClass();
        str.getClass();
        try {
            List<X509Certificate> listCheckServerTrusted = this.A.checkServerTrusted((X509Certificate[]) list.toArray(new X509Certificate[0]), "RSA", str);
            listCheckServerTrusted.getClass();
            return listCheckServerTrusted;
        } catch (CertificateException e) {
            SSLPeerUnverifiedException sSLPeerUnverifiedException = new SSLPeerUnverifiedException(e.getMessage());
            sSLPeerUnverifiedException.initCause(e);
            throw sSLPeerUnverifiedException;
        }
    }
}
