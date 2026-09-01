package defpackage;

import java.io.IOException;
import java.net.Proxy;
import java.net.Socket;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import okhttp3.internal.http2.ConnectionShutdownException;
import okhttp3.internal.http2.StreamResetException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class dva extends ns5 implements a44 {
    public final cgd b;
    public final hmb c;
    public final Socket d;
    public final Socket e;
    public final ji5 f;
    public final c8a g;
    public final m50 h;
    public qs5 i;
    public boolean j;
    public boolean k;
    public int l;
    public int m;
    public int n;
    public int o;
    public final ArrayList p;
    public long q;

    public dva(cgd cgdVar, eva evaVar, hmb hmbVar, Socket socket, Socket socket2, ji5 ji5Var, c8a c8aVar, m50 m50Var) {
        cgdVar.getClass();
        hmbVar.getClass();
        socket.getClass();
        socket2.getClass();
        c8aVar.getClass();
        m50Var.getClass();
        this.b = cgdVar;
        this.c = hmbVar;
        this.d = socket;
        this.e = socket2;
        this.f = ji5Var;
        this.g = c8aVar;
        this.h = m50Var;
        this.o = 1;
        this.p = new ArrayList();
        this.q = Long.MAX_VALUE;
    }

    public static void c(up8 up8Var, hmb hmbVar, IOException iOException) {
        up8Var.getClass();
        hmbVar.getClass();
        iOException.getClass();
        if (hmbVar.b.type() != Proxy.Type.DIRECT) {
            cb cbVar = hmbVar.a;
            cbVar.g.connectFailed(cbVar.h.j(), hmbVar.b.address(), iOException);
        }
        zm7 zm7Var = up8Var.C;
        synchronized (zm7Var) {
            ((LinkedHashSet) zm7Var.b).add(hmbVar);
        }
    }

    @Override // defpackage.ns5
    public final void a(qs5 qs5Var, v1c v1cVar) {
        v1cVar.getClass();
        synchronized (this) {
            this.o = (v1cVar.a & 8) != 0 ? v1cVar.b[3] : Integer.MAX_VALUE;
        }
    }

    @Override // defpackage.ns5
    public final void b(xs5 xs5Var) {
        xs5Var.c(b14.REFUSED_STREAM, null);
    }

    @Override // defpackage.a44
    public final void cancel() {
        ggf.c(this.d);
    }

    public final void d() {
        synchronized (this) {
            this.m++;
        }
    }

    @Override // defpackage.a44
    public final void e() {
        synchronized (this) {
            this.j = true;
        }
    }

    @Override // defpackage.a44
    public final void f(cva cvaVar, IOException iOException) {
        synchronized (this) {
            try {
                if (!(iOException instanceof StreamResetException)) {
                    if (!(this.i != null) || (iOException instanceof ConnectionShutdownException)) {
                        this.j = true;
                        if (this.m == 0) {
                            if (iOException != null) {
                                c(cvaVar.a, this.c, iOException);
                            }
                            this.l++;
                        }
                    }
                } else if (((StreamResetException) iOException).a == b14.REFUSED_STREAM) {
                    int i = this.n + 1;
                    this.n = i;
                    if (i > 1) {
                        this.j = true;
                        this.l++;
                    }
                } else if (((StreamResetException) iOException).a != b14.CANCEL || !cvaVar.q) {
                    this.j = true;
                    this.l++;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:53:0x00a9 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean g(defpackage.cb r9, java.util.List r10) {
        /*
            Method dump skipped, instruction units count: 213
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dva.g(cb, java.util.List):boolean");
    }

    @Override // defpackage.a44
    public final hmb h() {
        return this.c;
    }

    public final boolean i(boolean z) {
        long j;
        TimeZone timeZone = ggf.a;
        long jNanoTime = System.nanoTime();
        if (this.d.isClosed() || this.e.isClosed() || this.e.isInputShutdown() || this.e.isOutputShutdown()) {
            return false;
        }
        qs5 qs5Var = this.i;
        if (qs5Var != null) {
            return qs5Var.p(jNanoTime);
        }
        synchronized (this) {
            j = jNanoTime - this.q;
        }
        if (j < 10000000000L || !z) {
            return true;
        }
        Socket socket = this.e;
        yua yuaVar = (yua) this.h.c;
        socket.getClass();
        try {
            int soTimeout = socket.getSoTimeout();
            try {
                socket.setSoTimeout(1);
                return !yuaVar.H();
            } finally {
                socket.setSoTimeout(soTimeout);
            }
        } catch (SocketTimeoutException unused) {
            return true;
        } catch (IOException unused2) {
            return false;
        }
    }

    public final void j() throws SocketException {
        this.q = System.nanoTime();
        c8a c8aVar = this.g;
        if (c8aVar == c8a.HTTP_2 || c8aVar == c8a.H2_PRIOR_KNOWLEDGE) {
            this.e.setSoTimeout(0);
            z46 z46Var = z46.s;
            eo4 eo4Var = eo4.a;
            iq1 iq1Var = new iq1(this.b);
            m50 m50Var = this.h;
            String str = this.c.a.h.d;
            m50Var.getClass();
            str.getClass();
            iq1Var.c = m50Var;
            iq1Var.d = ggf.b + ' ' + str;
            iq1Var.e = this;
            iq1Var.f = eo4Var;
            qs5 qs5Var = new qs5(iq1Var);
            this.i = qs5Var;
            v1c v1cVar = qs5.z;
            this.o = (v1cVar.a & 8) != 0 ? v1cVar.b[3] : Integer.MAX_VALUE;
            ys5 ys5Var = qs5Var.w;
            synchronized (ys5Var) {
                try {
                    if (ys5Var.d) {
                        throw new IOException("closed");
                    }
                    Logger logger = ys5.f;
                    if (logger.isLoggable(Level.FINE)) {
                        logger.fine(ggf.d(">> CONNECTION " + is5.a.f(), new Object[0]));
                    }
                    ys5Var.a.C0(is5.a);
                    ys5Var.a.flush();
                } catch (Throwable th) {
                    throw th;
                }
            }
            qs5Var.w.N(qs5Var.q);
            if (qs5Var.q.a() != 65535) {
                qs5Var.w.Q(0, r7 - 65535);
            }
            bgd.c(qs5Var.g.d(), qs5Var.c, 0L, qs5Var.x, 6);
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Connection{");
        hmb hmbVar = this.c;
        sb.append(hmbVar.a.h.d);
        sb.append(':');
        sb.append(hmbVar.a.h.e);
        sb.append(", proxy=");
        sb.append(hmbVar.b);
        sb.append(" hostAddress=");
        sb.append(hmbVar.c);
        sb.append(" cipherSuite=");
        ji5 ji5Var = this.f;
        sb.append(ji5Var != null ? ji5Var.b : "none");
        sb.append(" protocol=");
        sb.append(this.g);
        sb.append('}');
        return sb.toString();
    }
}
