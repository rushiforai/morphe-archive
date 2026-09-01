package defpackage;

import androidx.work.impl.yX.VrhD;
import java.io.IOException;
import java.net.ConnectException;
import java.net.Proxy;
import java.net.Socket;
import java.net.UnknownServiceException;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.TimeZone;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.TimeUnit;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x32 implements jmb, a44 {
    public final cgd a;
    public final eva b;
    public final int c;
    public final int d;
    public final int e;
    public final int f;
    public final boolean g;
    public final cva h;
    public final rva i;
    public final hmb j;
    public final List k;
    public final kbb l;
    public final int m;
    public final boolean n;
    public volatile boolean o;
    public Socket p;
    public Socket q;
    public ji5 r;
    public c8a s;
    public m50 t;
    public dva u;

    public x32(cgd cgdVar, eva evaVar, int i, int i2, int i3, int i4, boolean z, cva cvaVar, rva rvaVar, hmb hmbVar, List list, kbb kbbVar, int i5, boolean z2) {
        cgdVar.getClass();
        hmbVar.getClass();
        this.a = cgdVar;
        this.b = evaVar;
        this.c = i;
        this.d = i2;
        this.e = i3;
        this.f = i4;
        this.g = z;
        this.h = cvaVar;
        this.i = rvaVar;
        this.j = hmbVar;
        this.k = list;
        this.l = kbbVar;
        this.m = i5;
        this.n = z2;
    }

    @Override // defpackage.jmb
    public final jmb a() {
        return new x32(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n);
    }

    @Override // defpackage.jmb
    public final dva b() {
        this.h.a.C.u(this.j);
        dva dvaVar = this.u;
        dvaVar.getClass();
        this.j.getClass();
        ujb ujbVarE = this.i.e(this, this.k);
        if (ujbVarE != null) {
            return ujbVarE.a;
        }
        synchronized (dvaVar) {
            eva evaVar = this.b;
            TimeZone timeZone = ggf.a;
            evaVar.d.add(dvaVar);
            evaVar.b.d(evaVar.c, 0L);
            this.h.a(dvaVar);
        }
        return dvaVar;
    }

    @Override // defpackage.jmb
    public final boolean c() {
        return this.s != null;
    }

    @Override // defpackage.jmb
    public final void cancel() {
        this.o = true;
        Socket socket = this.p;
        if (socket != null) {
            ggf.c(socket);
        }
    }

    @Override // defpackage.jmb
    public final imb d() {
        Socket socket;
        Socket socket2;
        hmb hmbVar = this.j;
        CopyOnWriteArrayList copyOnWriteArrayList = this.h.s;
        if (this.p != null) {
            ygf.f("TCP already connected");
            return null;
        }
        copyOnWriteArrayList.add(this);
        boolean z = false;
        try {
            try {
                hmbVar.c.getClass();
                i();
                z = true;
                imb imbVar = new imb(this, (Throwable) null, 6);
                copyOnWriteArrayList.remove(this);
                return imbVar;
            } catch (IOException e) {
                cb cbVar = hmbVar.a;
                if (hmbVar.b.type() != Proxy.Type.DIRECT) {
                    cb cbVar2 = hmbVar.a;
                    cbVar2.g.connectFailed(cbVar2.h.j(), hmbVar.b.address(), e);
                }
                hmbVar.c.getClass();
                imb imbVar2 = new imb(this, e, 2);
                copyOnWriteArrayList.remove(this);
                if (!z && (socket = this.p) != null) {
                    ggf.c(socket);
                }
                return imbVar2;
            }
        } catch (Throwable th) {
            copyOnWriteArrayList.remove(this);
            if (!z && (socket2 = this.p) != null) {
                ggf.c(socket2);
            }
            throw th;
        }
    }

    @Override // defpackage.a44
    public final void e() {
    }

    @Override // defpackage.a44
    public final void f(cva cvaVar, IOException iOException) {
    }

    /* JADX WARN: Removed duplicated region for block: B:85:0x0125  */
    @Override // defpackage.jmb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.imb g() throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 332
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.x32.g():imb");
    }

    @Override // defpackage.a44
    public final hmb h() {
        return this.j;
    }

    public final void i() throws IOException {
        Socket socketCreateSocket;
        Proxy.Type type = this.j.b.type();
        int i = type == null ? -1 : w32.a[type.ordinal()];
        if (i == 1 || i == 2) {
            socketCreateSocket = this.j.a.b.createSocket();
            socketCreateSocket.getClass();
        } else {
            socketCreateSocket = new Socket(this.j.b);
        }
        this.p = socketCreateSocket;
        if (this.o) {
            ik4.g("canceled");
            return;
        }
        socketCreateSocket.setSoTimeout(this.f);
        try {
            ea9 ea9Var = ea9.a;
            ea9.a.e(socketCreateSocket, this.j.c, this.e);
            try {
                this.t = new m50(new n0c(socketCreateSocket));
            } catch (NullPointerException e) {
                if (g76.L(e.getMessage(), "throw with null exception")) {
                    throw new IOException(e);
                }
            }
        } catch (ConnectException e2) {
            ConnectException connectException = new ConnectException("Failed to connect to " + this.j.c);
            connectException.initCause(e2);
            throw connectException;
        }
    }

    public final void j(SSLSocket sSLSocket, j42 j42Var) {
        c8a c8aVarA;
        cb cbVar = this.j.a;
        try {
            if (j42Var.b) {
                ea9 ea9Var = ea9.a;
                ea9.a.d(sSLSocket, cbVar.h.d, cbVar.i);
            }
            sSLSocket.startHandshake();
            SSLSession session = sSLSocket.getSession();
            session.getClass();
            ji5 ji5VarJ0 = flb.j0(session);
            HostnameVerifier hostnameVerifier = cbVar.d;
            hostnameVerifier.getClass();
            if (hostnameVerifier.verify(cbVar.h.d, session)) {
                oj1 oj1Var = cbVar.e;
                oj1Var.getClass();
                this.r = new ji5(ji5VarJ0.a, ji5VarJ0.b, ji5VarJ0.c, new le0(oj1Var, ji5VarJ0, cbVar, 10));
                cbVar.h.d.getClass();
                Iterator it2 = oj1Var.a.iterator();
                String strF = null;
                if (it2.hasNext()) {
                    lv8.z(it2.next());
                    throw null;
                }
                if (j42Var.b) {
                    ea9 ea9Var2 = ea9.a;
                    strF = ea9.a.f(sSLSocket);
                }
                this.q = sSLSocket;
                this.t = new m50(new n0c(sSLSocket));
                if (strF != null) {
                    c8a.Companion.getClass();
                    c8aVarA = b8a.a(strF);
                } else {
                    c8aVarA = c8a.HTTP_1_1;
                }
                this.s = c8aVarA;
                ea9 ea9Var3 = ea9.a;
                ea9.a.getClass();
                return;
            }
            List listA = ji5VarJ0.a();
            if (listA.isEmpty()) {
                throw new SSLPeerUnverifiedException("Hostname " + cbVar.h.d + " not verified (no certificates)");
            }
            Object obj = listA.get(0);
            obj.getClass();
            X509Certificate x509Certificate = (X509Certificate) obj;
            StringBuilder sb = new StringBuilder("\n            |Hostname ");
            sb.append(cbVar.h.d);
            sb.append(" not verified:\n            |    certificate: ");
            oj1 oj1Var2 = oj1.c;
            StringBuilder sb2 = new StringBuilder("sha256/");
            h21 h21Var = h21.d;
            byte[] encoded = x509Certificate.getPublicKey().getEncoded();
            encoded.getClass();
            sb2.append(dq1.D(encoded).d("SHA-256").a());
            sb.append(sb2.toString());
            sb.append("\n            |    DN: ");
            sb.append(x509Certificate.getSubjectDN().getName());
            sb.append("\n            |    subjectAltNames: ");
            sb.append(bu1.Q0(pp8.a(x509Certificate, 2), pp8.a(x509Certificate, 7)));
            sb.append("\n            ");
            throw new SSLPeerUnverifiedException(nuc.C(sb.toString()));
        } catch (Throwable th) {
            ea9 ea9Var4 = ea9.a;
            ea9.a.getClass();
            ggf.c(sSLSocket);
            throw th;
        }
    }

    public final x32 l(List list, SSLSocket sSLSocket) {
        String[] strArr;
        String[] strArr2;
        int i = this.m;
        int size = list.size();
        for (int i2 = i + 1; i2 < size; i2++) {
            j42 j42Var = (j42) list.get(i2);
            j42Var.getClass();
            if (j42Var.a && (((strArr = j42Var.d) == null || egf.h(strArr, sSLSocket.getEnabledProtocols(), y98.b)) && ((strArr2 = j42Var.c) == null || egf.h(strArr2, sSLSocket.getEnabledCipherSuites(), zl1.c)))) {
                return new x32(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, i2, i != -1);
            }
        }
        return null;
    }

    public final x32 m(List list, SSLSocket sSLSocket) throws UnknownServiceException {
        if (this.m != -1) {
            return this;
        }
        x32 x32VarL = l(list, sSLSocket);
        if (x32VarL != null) {
            return x32VarL;
        }
        StringBuilder sb = new StringBuilder("Unable to find acceptable protocols. isFallback=");
        sb.append(this.n);
        sb.append(", modes=");
        sb.append(list);
        String[] enabledProtocols = sSLSocket.getEnabledProtocols();
        enabledProtocols.getClass();
        String string = Arrays.toString(enabledProtocols);
        string.getClass();
        sb.append(", supported protocols=");
        sb.append(string);
        throw new UnknownServiceException(sb.toString());
    }

    public final imb k() throws IOException {
        kbb kbbVar = this.l;
        kbbVar.getClass();
        hmb hmbVar = this.j;
        String str = VrhD.UxNKSbjTS + ggf.i(hmbVar.a.h, true) + " HTTP/1.1";
        m50 m50Var = this.t;
        if (m50Var == null) {
            g76.g0("socket");
            throw null;
        }
        hs5 hs5Var = new hs5(null, this, m50Var);
        m50 m50Var2 = this.t;
        if (m50Var2 == null) {
            g76.g0("socket");
            throw null;
        }
        fmd fmdVarB = ((yua) m50Var2.c).a.b();
        long j = this.c;
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        fmdVarB.g(j, timeUnit);
        m50 m50Var3 = this.t;
        if (m50Var3 == null) {
            g76.g0("socket");
            throw null;
        }
        ((xua) m50Var3.d).a.b().g(this.d, timeUnit);
        hs5Var.l(kbbVar.c, str);
        hs5Var.c();
        ycb ycbVarG = hs5Var.g(false);
        ycbVarG.getClass();
        ycbVarG.a = kbbVar;
        adb adbVarA = ycbVarG.a();
        int i = adbVarA.d;
        long jE = ggf.e(adbVarA);
        if (jE != -1) {
            fs5 fs5VarK = hs5Var.k(adbVarA.a.a, jE);
            ggf.g(fs5VarK, Integer.MAX_VALUE);
            fs5VarK.close();
        }
        if (i == 200) {
            return new imb(this, (Throwable) null, 6);
        }
        if (i != 407) {
            ik4.g(b09.w(i, "Unexpected response code for CONNECT: "));
            return null;
        }
        hmbVar.a.f.getClass();
        ik4.g("Failed to authenticate with proxy");
        return null;
    }
}
