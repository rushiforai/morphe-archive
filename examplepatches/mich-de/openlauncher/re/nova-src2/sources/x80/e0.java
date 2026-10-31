package x80;

import com.google.android.gms.internal.measurement.v6;
import java.net.ProxySelector;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import javax.net.SocketFactory;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.X509TrustManager;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public class e0 implements Cloneable, h {
    public static final List C = y80.c.j(f0.HTTP_2, f0.HTTP_1_1);
    public static final List D = y80.c.j(o.f95575e, o.f95576f);
    public final long A;
    public final v6 B;

    /* renamed from: a, reason: collision with root package name */
    public final r f95458a;

    /* renamed from: b, reason: collision with root package name */
    public final v6 f95459b;

    /* renamed from: c, reason: collision with root package name */
    public final List f95460c;

    /* renamed from: d, reason: collision with root package name */
    public final List f95461d;

    /* renamed from: e, reason: collision with root package name */
    public final ll.i f95462e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f95463f;

    /* renamed from: g, reason: collision with root package name */
    public final b f95464g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f95465h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f95466i;

    /* renamed from: j, reason: collision with root package name */
    public final b f95467j;

    /* renamed from: k, reason: collision with root package name */
    public final f f95468k;

    /* renamed from: l, reason: collision with root package name */
    public final b f95469l;

    /* renamed from: m, reason: collision with root package name */
    public final ProxySelector f95470m;
    public final b n;
    public final SocketFactory o;

    /* renamed from: p, reason: collision with root package name */
    public final SSLSocketFactory f95471p;

    /* renamed from: q, reason: collision with root package name */
    public final X509TrustManager f95472q;

    /* renamed from: r, reason: collision with root package name */
    public final List f95473r;

    /* renamed from: s, reason: collision with root package name */
    public final List f95474s;

    /* renamed from: t, reason: collision with root package name */
    public final k90.c f95475t;

    /* renamed from: u, reason: collision with root package name */
    public final k f95476u;

    /* renamed from: v, reason: collision with root package name */
    public final u90.b f95477v;

    /* renamed from: w, reason: collision with root package name */
    public final int f95478w;

    /* renamed from: x, reason: collision with root package name */
    public final int f95479x;

    /* renamed from: y, reason: collision with root package name */
    public final int f95480y;

    /* renamed from: z, reason: collision with root package name */
    public final int f95481z;

    public e0(d0 d0Var) throws NoSuchAlgorithmException, KeyStoreException {
        this.f95458a = d0Var.f95432a;
        this.f95459b = d0Var.f95433b;
        this.f95460c = y80.c.v(d0Var.f95434c);
        this.f95461d = y80.c.v(d0Var.f95435d);
        this.f95462e = d0Var.f95436e;
        this.f95463f = d0Var.f95437f;
        this.f95464g = d0Var.f95438g;
        this.f95465h = d0Var.f95439h;
        this.f95466i = d0Var.f95440i;
        this.f95467j = d0Var.f95441j;
        this.f95468k = d0Var.f95442k;
        this.f95469l = d0Var.f95443l;
        ProxySelector proxySelector = d0Var.f95444m;
        proxySelector = proxySelector == null ? ProxySelector.getDefault() : proxySelector;
        this.f95470m = proxySelector == null ? i90.a.f61460a : proxySelector;
        this.n = d0Var.n;
        this.o = d0Var.o;
        List list = d0Var.f95447r;
        this.f95473r = list;
        this.f95474s = d0Var.f95448s;
        this.f95475t = d0Var.f95449t;
        this.f95478w = d0Var.f95452w;
        this.f95479x = d0Var.f95453x;
        this.f95480y = d0Var.f95454y;
        this.f95481z = d0Var.f95455z;
        this.A = d0Var.A;
        v6 v6Var = d0Var.B;
        this.B = v6Var == null ? new v6(3) : v6Var;
        List list2 = list;
        if ((list2 instanceof Collection) && list2.isEmpty()) {
            this.f95471p = null;
            this.f95477v = null;
            this.f95472q = null;
            this.f95476u = k.f95519c;
        } else {
            Iterator it = list2.iterator();
            while (it.hasNext()) {
                if (((o) it.next()).f95577a) {
                    SSLSocketFactory sSLSocketFactory = d0Var.f95445p;
                    if (sSLSocketFactory != null) {
                        this.f95471p = sSLSocketFactory;
                        u90.b bVar = d0Var.f95451v;
                        Intrinsics.d(bVar);
                        this.f95477v = bVar;
                        X509TrustManager x509TrustManager = d0Var.f95446q;
                        Intrinsics.d(x509TrustManager);
                        this.f95472q = x509TrustManager;
                        k kVar = d0Var.f95450u;
                        kVar.getClass();
                        this.f95476u = Intrinsics.b(kVar.f95521b, bVar) ? kVar : new k(kVar.f95520a, bVar);
                    } else {
                        g90.m mVar = g90.m.f57276a;
                        X509TrustManager x509TrustManagerN = g90.m.f57276a.n();
                        this.f95472q = x509TrustManagerN;
                        this.f95471p = g90.m.f57276a.m(x509TrustManagerN);
                        u90.b bVarB = g90.m.f57276a.b(x509TrustManagerN);
                        this.f95477v = bVarB;
                        k kVar2 = d0Var.f95450u;
                        kVar2.getClass();
                        this.f95476u = Intrinsics.b(kVar2.f95521b, bVarB) ? kVar2 : new k(kVar2.f95520a, bVarB);
                    }
                }
            }
            this.f95471p = null;
            this.f95477v = null;
            this.f95472q = null;
            this.f95476u = k.f95519c;
        }
        X509TrustManager x509TrustManager2 = this.f95472q;
        u90.b bVar2 = this.f95477v;
        SSLSocketFactory sSLSocketFactory2 = this.f95471p;
        List list3 = this.f95461d;
        List list4 = this.f95460c;
        Intrinsics.e(list4, "null cannot be cast to non-null type kotlin.collections.List<okhttp3.Interceptor?>");
        if (list4.contains(null)) {
            throw new IllegalStateException(("Null interceptor: " + list4).toString());
        }
        Intrinsics.e(list3, "null cannot be cast to non-null type kotlin.collections.List<okhttp3.Interceptor?>");
        if (list3.contains(null)) {
            throw new IllegalStateException(("Null network interceptor: " + list3).toString());
        }
        List list5 = this.f95473r;
        if (!(list5 instanceof Collection) || !list5.isEmpty()) {
            Iterator it2 = list5.iterator();
            while (it2.hasNext()) {
                if (((o) it2.next()).f95577a) {
                    if (sSLSocketFactory2 == null) {
                        throw new IllegalStateException("sslSocketFactory == null");
                    }
                    if (bVar2 == null) {
                        throw new IllegalStateException("certificateChainCleaner == null");
                    }
                    if (x509TrustManager2 == null) {
                        throw new IllegalStateException("x509TrustManager == null");
                    }
                    return;
                }
            }
        }
        if (sSLSocketFactory2 != null) {
            throw new IllegalStateException("Check failed.");
        }
        if (bVar2 != null) {
            throw new IllegalStateException("Check failed.");
        }
        if (x509TrustManager2 != null) {
            throw new IllegalStateException("Check failed.");
        }
        if (!Intrinsics.b(this.f95476u, k.f95519c)) {
            throw new IllegalStateException("Check failed.");
        }
    }

    public final d0 a() {
        d0 d0Var = new d0();
        d0Var.f95432a = this.f95458a;
        d0Var.f95433b = this.f95459b;
        b70.d.z0(this.f95460c, d0Var.f95434c);
        b70.d.z0(this.f95461d, d0Var.f95435d);
        d0Var.f95436e = this.f95462e;
        d0Var.f95437f = this.f95463f;
        d0Var.f95438g = this.f95464g;
        d0Var.f95439h = this.f95465h;
        d0Var.f95440i = this.f95466i;
        d0Var.f95441j = this.f95467j;
        d0Var.f95442k = this.f95468k;
        d0Var.f95443l = this.f95469l;
        d0Var.f95444m = this.f95470m;
        d0Var.n = this.n;
        d0Var.o = this.o;
        d0Var.f95445p = this.f95471p;
        d0Var.f95446q = this.f95472q;
        d0Var.f95447r = this.f95473r;
        d0Var.f95448s = this.f95474s;
        d0Var.f95449t = this.f95475t;
        d0Var.f95450u = this.f95476u;
        d0Var.f95451v = this.f95477v;
        d0Var.f95452w = this.f95478w;
        d0Var.f95453x = this.f95479x;
        d0Var.f95454y = this.f95480y;
        d0Var.f95455z = this.f95481z;
        d0Var.A = this.A;
        d0Var.B = this.B;
        return d0Var;
    }

    public final b90.j c(h0 request) {
        Intrinsics.g(request, "request");
        return new b90.j(this, request);
    }

    public final Object clone() {
        return super.clone();
    }

    public e0() {
        this(new d0());
    }
}
