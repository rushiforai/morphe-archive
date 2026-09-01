package defpackage;

import java.net.ProxySelector;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import javax.net.SocketFactory;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class up8 implements u31 {
    public static final List F = ggf.k(new c8a[]{c8a.HTTP_2, c8a.HTTP_1_1});
    public static final List G = ggf.k(new j42[]{j42.f, j42.g});
    public final int A;
    public final long B;
    public final zm7 C;
    public final cgd D;
    public final zg7 E;
    public final n0c a;
    public final List b;
    public final List c;
    public final ywb d;
    public final boolean e;
    public final boolean f;
    public final wz7 g;
    public final boolean h;
    public final boolean i;
    public final ba2 j;
    public final x21 k;
    public final oi3 l;
    public final ProxySelector m;
    public final wz7 n;
    public final SocketFactory o;
    public final SSLSocketFactory p;
    public final X509TrustManager q;
    public final List r;
    public final List s;
    public final HostnameVerifier t;
    public final oj1 u;
    public final f49 v;
    public final int w;
    public final int x;
    public final int y;
    public final int z;

    public up8(tp8 tp8Var) throws NoSuchAlgorithmException, KeyStoreException {
        SSLSocketFactory sSLSocketFactory;
        X509TrustManager x509TrustManager;
        f49 f49Var;
        this.a = tp8Var.a;
        this.b = ggf.j(tp8Var.c);
        this.c = ggf.j(tp8Var.d);
        this.d = tp8Var.e;
        this.e = tp8Var.f;
        this.f = tp8Var.g;
        this.g = tp8Var.h;
        this.h = tp8Var.i;
        this.i = tp8Var.j;
        this.j = tp8Var.k;
        this.k = tp8Var.l;
        this.l = tp8Var.m;
        ProxySelector proxySelector = tp8Var.n;
        if (proxySelector == null && (proxySelector = ProxySelector.getDefault()) == null) {
            proxySelector = pl8.a;
        }
        this.m = proxySelector;
        this.n = tp8Var.o;
        this.o = tp8Var.p;
        List list = tp8Var.s;
        this.r = list;
        this.s = tp8Var.t;
        this.t = tp8Var.u;
        this.w = tp8Var.x;
        this.x = tp8Var.y;
        this.y = tp8Var.z;
        this.z = tp8Var.A;
        this.A = tp8Var.B;
        this.B = tp8Var.C;
        zm7 zm7Var = tp8Var.D;
        this.C = zm7Var == null ? new zm7(27) : zm7Var;
        cgd cgdVar = tp8Var.E;
        this.D = cgdVar == null ? cgd.l : cgdVar;
        zg7 zg7Var = tp8Var.b;
        if (zg7Var == null) {
            zg7Var = new zg7(21);
            tp8Var.b = zg7Var;
        }
        this.E = zg7Var;
        if (list == null || !list.isEmpty()) {
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                if (((j42) it2.next()).a) {
                    sSLSocketFactory = tp8Var.q;
                    if (sSLSocketFactory == null) {
                        ea9 ea9Var = ea9.a;
                        ea9.a.getClass();
                        TrustManagerFactory trustManagerFactory = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
                        trustManagerFactory.init((KeyStore) null);
                        TrustManager[] trustManagers = trustManagerFactory.getTrustManagers();
                        trustManagers.getClass();
                        if (trustManagers.length == 1) {
                            TrustManager trustManager = trustManagers[0];
                            if (trustManager instanceof X509TrustManager) {
                                X509TrustManager x509TrustManager2 = (X509TrustManager) trustManager;
                                this.q = x509TrustManager2;
                                ea9 ea9Var2 = ea9.a;
                                ea9Var2.getClass();
                                try {
                                    SSLContext sSLContextK = ea9Var2.k();
                                    sSLContextK.init(null, new TrustManager[]{x509TrustManager2}, null);
                                    SSLSocketFactory socketFactory = sSLContextK.getSocketFactory();
                                    socketFactory.getClass();
                                    this.p = socketFactory;
                                    f49 f49VarC = ea9.a.c(x509TrustManager2);
                                    this.v = f49VarC;
                                    oj1 oj1Var = tp8Var.v;
                                    oj1Var.getClass();
                                    this.u = g76.L(oj1Var.b, f49VarC) ? oj1Var : new oj1(oj1Var.a, f49VarC);
                                    x509TrustManager = x509TrustManager2;
                                    sSLSocketFactory = socketFactory;
                                    f49Var = f49VarC;
                                } catch (GeneralSecurityException e) {
                                    throw new AssertionError("No System TLS: " + e, e);
                                }
                            }
                        }
                        String string = Arrays.toString(trustManagers);
                        string.getClass();
                        lg8.i("Unexpected default trust managers: ".concat(string));
                        throw null;
                    }
                    this.p = sSLSocketFactory;
                    f49Var = tp8Var.w;
                    f49Var.getClass();
                    this.v = f49Var;
                    x509TrustManager = tp8Var.r;
                    x509TrustManager.getClass();
                    this.q = x509TrustManager;
                    oj1 oj1Var2 = tp8Var.v;
                    oj1Var2.getClass();
                    this.u = g76.L(oj1Var2.b, f49Var) ? oj1Var2 : new oj1(oj1Var2.a, f49Var);
                }
            }
            this.p = null;
            this.v = null;
            this.q = null;
            this.u = oj1.c;
            sSLSocketFactory = null;
            f49Var = null;
            x509TrustManager = null;
        } else {
            this.p = null;
            this.v = null;
            this.q = null;
            this.u = oj1.c;
            sSLSocketFactory = null;
            f49Var = null;
            x509TrustManager = null;
        }
        List list2 = this.c;
        List list3 = this.b;
        list3.getClass();
        if (list3.contains(null)) {
            lg8.m("Null interceptor: ", list3);
            throw null;
        }
        list2.getClass();
        if (list2.contains(null)) {
            lg8.m("Null network interceptor: ", list2);
            throw null;
        }
        List list4 = this.r;
        if (list4 == null || !list4.isEmpty()) {
            Iterator it3 = list4.iterator();
            while (it3.hasNext()) {
                if (((j42) it3.next()).a) {
                    if (sSLSocketFactory == null) {
                        ygf.f("sslSocketFactory == null");
                        throw null;
                    }
                    if (f49Var == null) {
                        ygf.f("certificateChainCleaner == null");
                        throw null;
                    }
                    if (x509TrustManager != null) {
                        return;
                    }
                    ygf.f("x509TrustManager == null");
                    throw null;
                }
            }
        }
        if (sSLSocketFactory != null) {
            ygf.f("Check failed.");
            throw null;
        }
        if (f49Var != null) {
            ygf.f("Check failed.");
            throw null;
        }
        if (x509TrustManager != null) {
            ygf.f("Check failed.");
            throw null;
        }
        if (g76.L(this.u, oj1.c)) {
            return;
        }
        ygf.f("Check failed.");
        throw null;
    }

    @Override // defpackage.u31
    public final cva a(kbb kbbVar) {
        kbbVar.getClass();
        return new cva(this, kbbVar, false);
    }

    public final tp8 b() {
        tp8 tp8Var = new tp8();
        tp8Var.a = this.a;
        tp8Var.b = this.E;
        bu1.n0(this.b, tp8Var.c);
        bu1.n0(this.c, tp8Var.d);
        tp8Var.e = this.d;
        tp8Var.f = this.e;
        tp8Var.g = this.f;
        tp8Var.h = this.g;
        tp8Var.i = this.h;
        tp8Var.j = this.i;
        tp8Var.k = this.j;
        tp8Var.l = this.k;
        tp8Var.m = this.l;
        tp8Var.n = this.m;
        tp8Var.o = this.n;
        tp8Var.p = this.o;
        tp8Var.q = this.p;
        tp8Var.r = this.q;
        tp8Var.s = this.r;
        tp8Var.t = this.s;
        tp8Var.u = this.t;
        tp8Var.v = this.u;
        tp8Var.w = this.v;
        tp8Var.x = this.w;
        tp8Var.y = this.x;
        tp8Var.z = this.y;
        tp8Var.A = this.z;
        tp8Var.B = this.A;
        tp8Var.C = this.B;
        tp8Var.D = this.C;
        tp8Var.E = this.D;
        return tp8Var;
    }

    public up8() {
        this(new tp8());
    }
}
