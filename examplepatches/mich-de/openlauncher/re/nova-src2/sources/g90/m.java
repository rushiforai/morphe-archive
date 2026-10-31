package g90;

import android.util.Log;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.security.GeneralSecurityException;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.Security;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;
import kotlin.jvm.internal.Intrinsics;
import mk.v;
import p10.c0;
import x80.e0;

/* loaded from: classes.dex */
public class m {

    /* renamed from: a, reason: collision with root package name */
    public static volatile m f57276a;

    /* renamed from: b, reason: collision with root package name */
    public static final Logger f57277b;

    /* JADX WARN: Removed duplicated region for block: B:28:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00bf  */
    static {
        m mVarY;
        if (lm.e.u()) {
            for (Map.Entry entry : h90.c.f59549b.entrySet()) {
                String str = (String) entry.getKey();
                String str2 = (String) entry.getValue();
                Logger logger = Logger.getLogger(str);
                if (h90.c.f59548a.add(logger)) {
                    logger.setUseParentHandlers(false);
                    logger.setLevel(Log.isLoggable(str2, 3) ? Level.FINE : Log.isLoggable(str2, 4) ? Level.INFO : Level.WARNING);
                    logger.addHandler(h90.d.f59550a);
                }
            }
            mVarY = a.f57247d ? new a() : null;
            if (mVarY == null) {
                boolean z11 = c.f57251e;
                mVarY = jk.b.q();
                Intrinsics.d(mVarY);
            }
        } else if ("Conscrypt".equals(Security.getProviders()[0].getName())) {
            boolean z12 = g.f57257d;
            mVarY = e.b();
            if (mVarY == null) {
                if ("BC".equals(Security.getProviders()[0].getName())) {
                    boolean z13 = d.f57254d;
                    mVarY = lb0.b.q();
                    if (mVarY == null) {
                        if ("OpenJSSE".equals(Security.getProviders()[0].getName())) {
                            boolean z14 = l.f57274d;
                            mVarY = k.G();
                            if (mVarY == null) {
                                boolean z15 = j.f57267c;
                                mVarY = c0.y();
                                if (mVarY == null && (mVarY = v.y()) == null) {
                                    mVarY = new m();
                                }
                            }
                        }
                    }
                }
            }
        }
        f57276a = mVarY;
        f57277b = Logger.getLogger(e0.class.getName());
    }

    public static void i(int i5, String message, Throwable th2) {
        Intrinsics.g(message, "message");
        f57277b.log(i5 == 5 ? Level.WARNING : Level.INFO, message, th2);
    }

    public static /* synthetic */ void j(m mVar, String str, int i5) {
        int i11 = (i5 & 2) != 0 ? 4 : 5;
        mVar.getClass();
        i(i11, str, null);
    }

    public void a(SSLSocket sSLSocket) {
    }

    public u90.b b(X509TrustManager x509TrustManager) {
        return new k90.a(c(x509TrustManager));
    }

    public k90.d c(X509TrustManager x509TrustManager) {
        X509Certificate[] acceptedIssuers = x509TrustManager.getAcceptedIssuers();
        Intrinsics.f(acceptedIssuers, "trustManager.acceptedIssuers");
        return new k90.b((X509Certificate[]) Arrays.copyOf(acceptedIssuers, acceptedIssuers.length));
    }

    public void d(SSLSocket sSLSocket, String str, List protocols) {
        Intrinsics.g(protocols, "protocols");
    }

    public void e(Socket socket, InetSocketAddress address, int i5) throws IOException {
        Intrinsics.g(address, "address");
        socket.connect(address, i5);
    }

    public String f(SSLSocket sSLSocket) {
        return null;
    }

    public Object g() {
        if (f57277b.isLoggable(Level.FINE)) {
            return new Throwable("response.body().close()");
        }
        return null;
    }

    public boolean h(String hostname) {
        Intrinsics.g(hostname, "hostname");
        return true;
    }

    public void k(Object obj, String message) {
        Intrinsics.g(message, "message");
        if (obj == null) {
            message = message.concat(" To see where this was allocated, set the OkHttpClient logger level to FINE: Logger.getLogger(OkHttpClient.class.getName()).setLevel(Level.FINE);");
        }
        i(5, message, (Throwable) obj);
    }

    public SSLContext l() throws NoSuchAlgorithmException {
        SSLContext sSLContext = SSLContext.getInstance("TLS");
        Intrinsics.f(sSLContext, "getInstance(\"TLS\")");
        return sSLContext;
    }

    public SSLSocketFactory m(X509TrustManager x509TrustManager) throws KeyManagementException {
        try {
            SSLContext sSLContextL = l();
            sSLContextL.init(null, new TrustManager[]{x509TrustManager}, null);
            SSLSocketFactory socketFactory = sSLContextL.getSocketFactory();
            Intrinsics.f(socketFactory, "newSSLContext().apply {\n…ll)\n      }.socketFactory");
            return socketFactory;
        } catch (GeneralSecurityException e3) {
            throw new AssertionError("No System TLS: " + e3, e3);
        }
    }

    public X509TrustManager n() throws NoSuchAlgorithmException, KeyStoreException {
        TrustManagerFactory trustManagerFactory = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
        trustManagerFactory.init((KeyStore) null);
        TrustManager[] trustManagers = trustManagerFactory.getTrustManagers();
        Intrinsics.d(trustManagers);
        if (trustManagers.length == 1) {
            TrustManager trustManager = trustManagers[0];
            if (trustManager instanceof X509TrustManager) {
                Intrinsics.e(trustManager, "null cannot be cast to non-null type javax.net.ssl.X509TrustManager");
                return (X509TrustManager) trustManager;
            }
        }
        String string = Arrays.toString(trustManagers);
        Intrinsics.f(string, "toString(this)");
        throw new IllegalStateException("Unexpected default trust managers: ".concat(string).toString());
    }

    public final String toString() {
        return getClass().getSimpleName();
    }
}
