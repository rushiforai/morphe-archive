package b90;

import androidx.compose.ui.node.LayoutNode;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.google.android.gms.internal.measurement.v6;
import e90.q;
import e90.r;
import e90.y;
import e90.z;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.ConnectException;
import java.net.InetSocketAddress;
import java.net.ProtocolException;
import java.net.Proxy;
import java.net.Socket;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownServiceException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLHandshakeException;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import kotlin.ExceptionsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import m90.c0;
import m90.d0;
import okhttp3.internal.connection.RouteException;
import x80.e0;
import x80.f0;
import x80.g0;
import x80.h0;
import x80.l0;
import x80.m0;
import x80.q0;
import x80.t;
import x80.w;

/* loaded from: classes.dex */
public final class m extends e90.g {

    /* renamed from: b, reason: collision with root package name */
    public final q0 f17703b;

    /* renamed from: c, reason: collision with root package name */
    public Socket f17704c;

    /* renamed from: d, reason: collision with root package name */
    public Socket f17705d;

    /* renamed from: e, reason: collision with root package name */
    public t f17706e;

    /* renamed from: f, reason: collision with root package name */
    public f0 f17707f;

    /* renamed from: g, reason: collision with root package name */
    public q f17708g;

    /* renamed from: h, reason: collision with root package name */
    public d0 f17709h;

    /* renamed from: i, reason: collision with root package name */
    public c0 f17710i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f17711j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f17712k;

    /* renamed from: l, reason: collision with root package name */
    public int f17713l;

    /* renamed from: m, reason: collision with root package name */
    public int f17714m;
    public int n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public final ArrayList f17715p;

    /* renamed from: q, reason: collision with root package name */
    public long f17716q;

    public m(n connectionPool, q0 route) {
        Intrinsics.g(connectionPool, "connectionPool");
        Intrinsics.g(route, "route");
        this.f17703b = route;
        this.o = 1;
        this.f17715p = new ArrayList();
        this.f17716q = Long.MAX_VALUE;
    }

    public static void d(e0 e0Var, q0 failedRoute, IOException failure) {
        Intrinsics.g(failedRoute, "failedRoute");
        Intrinsics.g(failure, "failure");
        if (failedRoute.f95595b.type() != Proxy.Type.DIRECT) {
            x80.a aVar = failedRoute.f95594a;
            aVar.f95392g.connectFailed(aVar.f95393h.l(), failedRoute.f95595b.address(), failure);
        }
        v6 v6Var = e0Var.B;
        synchronized (v6Var) {
            ((LinkedHashSet) v6Var.f33136b).add(failedRoute);
        }
    }

    @Override // e90.g
    public final synchronized void a(q qVar, e90.c0 settings) {
        Intrinsics.g(settings, "settings");
        this.o = (settings.f52309a & 16) != 0 ? settings.f52310b[4] : LayoutNode.NotPlacedPlaceOrder;
    }

    @Override // e90.g
    public final void b(y yVar) {
        yVar.c(8, null);
    }

    public final void c(int i5, int i11, int i12, boolean z11, x80.i iVar) throws Throwable {
        q0 q0Var;
        if (this.f17707f != null) {
            throw new IllegalStateException("already connected");
        }
        List list = this.f17703b.f95594a.f95395j;
        b bVar = new b(list);
        x80.a aVar = this.f17703b.f95594a;
        if (aVar.f95388c == null) {
            if (!list.contains(x80.o.f95576f)) {
                throw new RouteException(new UnknownServiceException("CLEARTEXT communication not enabled for client"));
            }
            String str = this.f17703b.f95594a.f95393h.f95628d;
            g90.m mVar = g90.m.f57276a;
            if (!g90.m.f57276a.h(str)) {
                throw new RouteException(new UnknownServiceException(b.c0.l("CLEARTEXT communication to ", str, " not permitted by network security policy")));
            }
        } else if (aVar.f95394i.contains(f0.H2_PRIOR_KNOWLEDGE)) {
            throw new RouteException(new UnknownServiceException("H2_PRIOR_KNOWLEDGE cannot be used with HTTPS"));
        }
        RouteException routeException = null;
        do {
            try {
                q0 q0Var2 = this.f17703b;
                if (q0Var2.f95594a.f95388c != null && q0Var2.f95595b.type() == Proxy.Type.HTTP) {
                    f(i5, i11, i12, iVar);
                    if (this.f17704c == null) {
                    }
                    q0Var = this.f17703b;
                    if (q0Var.f95594a.f95388c == null && q0Var.f95595b.type() == Proxy.Type.HTTP && this.f17704c == null) {
                        throw new RouteException(new ProtocolException("Too many tunnel connections attempted: 21"));
                    }
                    this.f17716q = System.nanoTime();
                    return;
                }
                e(i5, i11, iVar);
                g(bVar, iVar);
                InetSocketAddress inetSocketAddress = this.f17703b.f95596c;
                Intrinsics.g(inetSocketAddress, "inetSocketAddress");
                q0Var = this.f17703b;
                if (q0Var.f95594a.f95388c == null) {
                }
                this.f17716q = System.nanoTime();
                return;
            } catch (IOException e3) {
                Socket socket = this.f17705d;
                if (socket != null) {
                    y80.c.d(socket);
                }
                Socket socket2 = this.f17704c;
                if (socket2 != null) {
                    y80.c.d(socket2);
                }
                this.f17705d = null;
                this.f17704c = null;
                this.f17709h = null;
                this.f17710i = null;
                this.f17706e = null;
                this.f17707f = null;
                this.f17708g = null;
                this.o = 1;
                InetSocketAddress inetSocketAddress2 = this.f17703b.f95596c;
                Intrinsics.g(inetSocketAddress2, "inetSocketAddress");
                if (routeException == null) {
                    routeException = new RouteException(e3);
                } else {
                    ExceptionsKt.a(routeException.f80489a, e3);
                    routeException.f80490b = e3;
                }
                if (!z11) {
                    throw routeException;
                }
                bVar.f17652d = true;
                if (!bVar.f17651c) {
                    throw routeException;
                }
                if (e3 instanceof ProtocolException) {
                    throw routeException;
                }
                if (e3 instanceof InterruptedIOException) {
                    throw routeException;
                }
                if ((e3 instanceof SSLHandshakeException) && (e3.getCause() instanceof CertificateException)) {
                    throw routeException;
                }
                if (e3 instanceof SSLPeerUnverifiedException) {
                    throw routeException;
                }
            }
        } while (e3 instanceof SSLException);
        throw routeException;
    }

    public final void e(int i5, int i11, x80.i iVar) throws IOException {
        Socket socketCreateSocket;
        q0 q0Var = this.f17703b;
        Proxy proxy = q0Var.f95595b;
        x80.a aVar = q0Var.f95594a;
        Proxy.Type type = proxy.type();
        int i12 = type == null ? -1 : k.f17698a[type.ordinal()];
        if (i12 == 1 || i12 == 2) {
            socketCreateSocket = aVar.f95387b.createSocket();
            Intrinsics.d(socketCreateSocket);
        } else {
            socketCreateSocket = new Socket(proxy);
        }
        this.f17704c = socketCreateSocket;
        InetSocketAddress inetSocketAddress = this.f17703b.f95596c;
        Intrinsics.g(inetSocketAddress, "inetSocketAddress");
        socketCreateSocket.setSoTimeout(i11);
        try {
            g90.m mVar = g90.m.f57276a;
            g90.m.f57276a.e(socketCreateSocket, this.f17703b.f95596c, i5);
            try {
                this.f17709h = x7.f.r(x7.f.W(socketCreateSocket));
                this.f17710i = x7.f.q(x7.f.S(socketCreateSocket));
            } catch (NullPointerException e3) {
                if (Intrinsics.b(e3.getMessage(), "throw with null exception")) {
                    throw new IOException(e3);
                }
            }
        } catch (ConnectException e11) {
            ConnectException connectException = new ConnectException("Failed to connect to " + this.f17703b.f95596c);
            connectException.initCause(e11);
            throw connectException;
        }
    }

    public final void f(int i5, int i11, int i12, x80.i iVar) throws IOException {
        g0 g0Var = new g0();
        q0 q0Var = this.f17703b;
        w url = q0Var.f95594a.f95393h;
        Intrinsics.g(url, "url");
        g0Var.f95504a = url;
        g0Var.g(null, "CONNECT");
        x80.a aVar = q0Var.f95594a;
        g0Var.e("Host", y80.c.u(aVar.f95393h, true));
        g0Var.e("Proxy-Connection", "Keep-Alive");
        g0Var.e("User-Agent", "okhttp/4.12.0");
        h0 h0VarB = g0Var.b();
        o2.h hVar = new o2.h(1);
        c90.g gVar = y80.c.f96855c;
        v4.a.c("Proxy-Authenticate");
        v4.a.d("OkHttp-Preemptive", "Proxy-Authenticate");
        hVar.s("Proxy-Authenticate");
        hVar.c("Proxy-Authenticate", "OkHttp-Preemptive");
        new m0(h0VarB, f0.HTTP_1_1, "Preemptive Authenticate", TTAdConstant.DOWNLOAD_APP_INFO_CODE, null, hVar.f(), gVar, null, null, null, -1L, -1L, null);
        aVar.f95391f.getClass();
        w wVar = h0VarB.f95509a;
        e(i5, i11, iVar);
        String str = "CONNECT " + y80.c.u(wVar, true) + " HTTP/1.1";
        d0 d0Var = this.f17709h;
        Intrinsics.d(d0Var);
        c0 c0Var = this.f17710i;
        Intrinsics.d(c0Var);
        d90.g gVar2 = new d90.g(null, this, d0Var, c0Var);
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        d0Var.f76104a.timeout().g(i11, timeUnit);
        c0Var.f76098a.timeout().g(i12, timeUnit);
        gVar2.k(h0VarB.f95511c, str);
        gVar2.a();
        l0 l0VarG = gVar2.g(false);
        Intrinsics.d(l0VarG);
        l0VarG.f95522a = h0VarB;
        m0 m0VarA = l0VarG.a();
        gVar2.j(m0VarA);
        int i13 = m0VarA.f95556d;
        if (i13 != 200) {
            if (i13 != 407) {
                throw new IOException(b.c0.h(i13, "Unexpected response code for CONNECT: "));
            }
            aVar.f95391f.getClass();
            throw new IOException("Failed to authenticate with proxy");
        }
        if (!d0Var.f76105b.N() || !c0Var.f76099b.N()) {
            throw new IOException("TLS tunnel buffered too many bytes!");
        }
    }

    public final void g(b bVar, x80.i iVar) throws Throwable {
        SSLSocket sSLSocket;
        f0 f0VarD = f0.HTTP_1_1;
        x80.a aVar = this.f17703b.f95594a;
        SSLSocketFactory sSLSocketFactory = aVar.f95388c;
        if (sSLSocketFactory == null) {
            List list = aVar.f95394i;
            f0 f0Var = f0.H2_PRIOR_KNOWLEDGE;
            if (!list.contains(f0Var)) {
                this.f17705d = this.f17704c;
                this.f17707f = f0VarD;
                return;
            } else {
                this.f17705d = this.f17704c;
                this.f17707f = f0Var;
                l();
                return;
            }
        }
        SSLSocket sSLSocket2 = null;
        String strF = null;
        try {
            Intrinsics.d(sSLSocketFactory);
            Socket socket = this.f17704c;
            w wVar = aVar.f95393h;
            Socket socketCreateSocket = sSLSocketFactory.createSocket(socket, wVar.f95628d, wVar.f95629e, true);
            Intrinsics.e(socketCreateSocket, "null cannot be cast to non-null type javax.net.ssl.SSLSocket");
            sSLSocket = (SSLSocket) socketCreateSocket;
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            x80.o oVarA = bVar.a(sSLSocket);
            if (oVarA.f95578b) {
                g90.m mVar = g90.m.f57276a;
                g90.m.f57276a.d(sSLSocket, aVar.f95393h.f95628d, aVar.f95394i);
            }
            sSLSocket.startHandshake();
            SSLSession sslSocketSession = sSLSocket.getSession();
            Intrinsics.f(sslSocketSession, "sslSocketSession");
            t tVarK = v30.e.k(sslSocketSession);
            HostnameVerifier hostnameVerifier = aVar.f95389d;
            Intrinsics.d(hostnameVerifier);
            boolean zVerify = hostnameVerifier.verify(aVar.f95393h.f95628d, sslSocketSession);
            int i5 = 0;
            if (zVerify) {
                x80.k kVar = aVar.f95390e;
                Intrinsics.d(kVar);
                this.f17706e = new t(tVarK.f95611a, tVarK.f95612b, tVarK.f95613c, new l(i5, kVar, tVarK, aVar));
                kVar.a(aVar.f95393h.f95628d, new a3.e(this, 15));
                if (oVarA.f95578b) {
                    g90.m mVar2 = g90.m.f57276a;
                    strF = g90.m.f57276a.f(sSLSocket);
                }
                this.f17705d = sSLSocket;
                this.f17709h = x7.f.r(x7.f.W(sSLSocket));
                this.f17710i = x7.f.q(x7.f.S(sSLSocket));
                if (strF != null) {
                    f0VarD = v70.o.d(strF);
                }
                this.f17707f = f0VarD;
                g90.m mVar3 = g90.m.f57276a;
                g90.m.f57276a.a(sSLSocket);
                if (this.f17707f == f0.HTTP_2) {
                    l();
                    return;
                }
                return;
            }
            List listA = tVarK.a();
            if (listA.isEmpty()) {
                throw new SSLPeerUnverifiedException("Hostname " + aVar.f95393h.f95628d + " not verified (no certificates)");
            }
            Object obj = listA.get(0);
            Intrinsics.e(obj, "null cannot be cast to non-null type java.security.cert.X509Certificate");
            X509Certificate x509Certificate = (X509Certificate) obj;
            StringBuilder sb2 = new StringBuilder("\n              |Hostname ");
            sb2.append(aVar.f95393h.f95628d);
            sb2.append(" not verified:\n              |    certificate: ");
            x80.k kVar2 = x80.k.f95519c;
            m90.j jVar = m90.j.f76130d;
            byte[] encoded = x509Certificate.getPublicKey().getEncoded();
            Intrinsics.f(encoded, "publicKey.encoded");
            sb2.append("sha256/".concat(m90.a.b(lm.e.v(encoded).b("SHA-256").f76131a)));
            sb2.append("\n              |    DN: ");
            sb2.append(x509Certificate.getSubjectDN().getName());
            sb2.append("\n              |    subjectAltNames: ");
            sb2.append(b70.g.t1(k90.c.a(x509Certificate, 2), k90.c.a(x509Certificate, 7)));
            sb2.append("\n              ");
            throw new SSLPeerUnverifiedException(r70.f.p0(sb2.toString()));
        } catch (Throwable th3) {
            th = th3;
            sSLSocket2 = sSLSocket;
            if (sSLSocket2 != null) {
                g90.m mVar4 = g90.m.f57276a;
                g90.m.f57276a.a(sSLSocket2);
            }
            if (sSLSocket2 != null) {
                y80.c.d(sSLSocket2);
            }
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x00b9 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean h(x80.a aVar, List list) {
        t tVar;
        w wVar = aVar.f95393h;
        byte[] bArr = y80.c.f96853a;
        if (this.f17715p.size() < this.o && !this.f17711j) {
            q0 q0Var = this.f17703b;
            x80.a aVar2 = q0Var.f95594a;
            x80.a aVar3 = q0Var.f95594a;
            if (aVar2.a(aVar)) {
                String str = wVar.f95628d;
                String hostname = wVar.f95628d;
                if (Intrinsics.b(str, aVar3.f95393h.f95628d)) {
                    return true;
                }
                if (this.f17708g != null && list != null) {
                    List list2 = list;
                    if (!(list2 instanceof Collection) || !list2.isEmpty()) {
                        Iterator it = list2.iterator();
                        while (true) {
                            if (!it.hasNext()) {
                                break;
                            }
                            q0 q0Var2 = (q0) it.next();
                            Proxy.Type type = q0Var2.f95595b.type();
                            Proxy.Type type2 = Proxy.Type.DIRECT;
                            if (type == type2 && q0Var.f95595b.type() == type2 && Intrinsics.b(q0Var.f95596c, q0Var2.f95596c)) {
                                if (aVar.f95389d == k90.c.f71242a) {
                                    byte[] bArr2 = y80.c.f96853a;
                                    w wVar2 = aVar3.f95393h;
                                    if (wVar.f95629e == wVar2.f95629e) {
                                        if (!Intrinsics.b(hostname, wVar2.f95628d)) {
                                            if (!this.f17712k && (tVar = this.f17706e) != null) {
                                                List listA = tVar.a();
                                                if (!listA.isEmpty()) {
                                                    Object obj = listA.get(0);
                                                    Intrinsics.e(obj, "null cannot be cast to non-null type java.security.cert.X509Certificate");
                                                    if (k90.c.c(hostname, (X509Certificate) obj)) {
                                                        try {
                                                            x80.k kVar = aVar.f95390e;
                                                            Intrinsics.d(kVar);
                                                            t tVar2 = this.f17706e;
                                                            Intrinsics.d(tVar2);
                                                            List peerCertificates = tVar2.a();
                                                            Intrinsics.g(hostname, "hostname");
                                                            Intrinsics.g(peerCertificates, "peerCertificates");
                                                            kVar.a(hostname, new l(3, kVar, peerCertificates, hostname));
                                                            return true;
                                                        } catch (SSLPeerUnverifiedException unused) {
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    public final boolean i(boolean z11) throws SocketException {
        long j11;
        byte[] bArr = y80.c.f96853a;
        long jNanoTime = System.nanoTime();
        Socket socket = this.f17704c;
        Intrinsics.d(socket);
        Socket socket2 = this.f17705d;
        Intrinsics.d(socket2);
        Intrinsics.d(this.f17709h);
        if (socket.isClosed() || socket2.isClosed() || socket2.isInputShutdown() || socket2.isOutputShutdown()) {
            return false;
        }
        q qVar = this.f17708g;
        if (qVar != null) {
            synchronized (qVar) {
                if (qVar.f52351f) {
                    return false;
                }
                if (qVar.n < qVar.f52358m) {
                    if (jNanoTime >= qVar.o) {
                        return false;
                    }
                }
                return true;
            }
        }
        synchronized (this) {
            j11 = jNanoTime - this.f17716q;
        }
        if (j11 < 10000000000L || !z11) {
            return true;
        }
        try {
            int soTimeout = socket2.getSoTimeout();
            try {
                socket2.setSoTimeout(1);
                return !r4.N();
            } finally {
                socket2.setSoTimeout(soTimeout);
            }
        } catch (SocketTimeoutException unused) {
            return true;
        } catch (IOException unused2) {
            return false;
        }
    }

    public final c90.d j(e0 e0Var, c90.f fVar) throws SocketException {
        int i5 = fVar.f19894g;
        Socket socket = this.f17705d;
        Intrinsics.d(socket);
        d0 d0Var = this.f17709h;
        Intrinsics.d(d0Var);
        c0 c0Var = this.f17710i;
        Intrinsics.d(c0Var);
        q qVar = this.f17708g;
        if (qVar != null) {
            return new r(e0Var, this, fVar, qVar);
        }
        socket.setSoTimeout(i5);
        m90.l0 l0VarTimeout = d0Var.f76104a.timeout();
        long j11 = i5;
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        l0VarTimeout.g(j11, timeUnit);
        c0Var.f76098a.timeout().g(fVar.f19895h, timeUnit);
        return new d90.g(e0Var, this, d0Var, c0Var);
    }

    public final synchronized void k() {
        this.f17711j = true;
    }

    public final void l() throws SocketException {
        Socket socket = this.f17705d;
        Intrinsics.d(socket);
        d0 d0Var = this.f17709h;
        Intrinsics.d(d0Var);
        c0 c0Var = this.f17710i;
        Intrinsics.d(c0Var);
        socket.setSoTimeout(0);
        a90.e eVar = a90.e.f524i;
        bm.t tVar = new bm.t(eVar);
        String peerName = this.f17703b.f95594a.f95393h.f95628d;
        Intrinsics.g(peerName, "peerName");
        tVar.f18111c = socket;
        String str = y80.c.f96859g + ' ' + peerName;
        Intrinsics.g(str, "<set-?>");
        tVar.f18112d = str;
        tVar.f18113e = d0Var;
        tVar.f18114f = c0Var;
        tVar.f18115g = this;
        q qVar = new q(tVar);
        this.f17708g = qVar;
        e90.c0 c0Var2 = q.f52345z;
        this.o = (c0Var2.f52309a & 16) != 0 ? c0Var2.f52310b[4] : LayoutNode.NotPlacedPlaceOrder;
        z zVar = qVar.f52366w;
        synchronized (zVar) {
            try {
                if (zVar.f52415d) {
                    throw new IOException("closed");
                }
                Logger logger = z.f52411f;
                if (logger.isLoggable(Level.FINE)) {
                    logger.fine(y80.c.g(">> CONNECTION " + e90.e.f52313a.d(), new Object[0]));
                }
                zVar.f52412a.C(e90.e.f52313a);
                zVar.f52412a.flush();
            } finally {
            }
        }
        z zVar2 = qVar.f52366w;
        e90.c0 settings = qVar.f52359p;
        synchronized (zVar2) {
            try {
                Intrinsics.g(settings, "settings");
                if (zVar2.f52415d) {
                    throw new IOException("closed");
                }
                zVar2.c(0, Integer.bitCount(settings.f52309a) * 6, 4, 0);
                int i5 = 0;
                while (i5 < 10) {
                    boolean z11 = true;
                    if (((1 << i5) & settings.f52309a) == 0) {
                        z11 = false;
                    }
                    if (z11) {
                        zVar2.f52412a.writeShort(i5 != 4 ? i5 != 7 ? i5 : 4 : 3);
                        zVar2.f52412a.writeInt(settings.f52310b[i5]);
                    }
                    i5++;
                }
                zVar2.f52412a.flush();
            } finally {
            }
        }
        if (qVar.f52359p.a() != 65535) {
            qVar.f52366w.l(0, r1 - 65535);
        }
        eVar.e().c(new a90.b(qVar.f52348c, qVar.f52367x), 0L);
    }

    public final String toString() {
        Object obj;
        StringBuilder sb2 = new StringBuilder("Connection{");
        q0 q0Var = this.f17703b;
        sb2.append(q0Var.f95594a.f95393h.f95628d);
        sb2.append(AbstractJsonLexerKt.COLON);
        sb2.append(q0Var.f95594a.f95393h.f95629e);
        sb2.append(", proxy=");
        sb2.append(q0Var.f95595b);
        sb2.append(" hostAddress=");
        sb2.append(q0Var.f95596c);
        sb2.append(" cipherSuite=");
        t tVar = this.f17706e;
        if (tVar == null || (obj = tVar.f95612b) == null) {
            obj = "none";
        }
        sb2.append(obj);
        sb2.append(" protocol=");
        sb2.append(this.f17707f);
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        return sb2.toString();
    }
}
