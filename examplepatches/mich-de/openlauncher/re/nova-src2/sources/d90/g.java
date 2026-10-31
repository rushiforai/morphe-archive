package d90;

import ai.k0;
import androidx.compose.ui.node.LayoutNode;
import b90.m;
import java.io.EOFException;
import java.io.IOException;
import java.net.ProtocolException;
import java.net.Proxy;
import java.net.Socket;
import java.util.concurrent.TimeUnit;
import kotlin.jvm.internal.Intrinsics;
import m90.c0;
import m90.d0;
import m90.h;
import m90.i;
import m90.j0;
import x80.e0;
import x80.f0;
import x80.h0;
import x80.l0;
import x80.m0;
import x80.u;
import x80.v;
import x80.w;

/* loaded from: classes5.dex */
public final class g implements c90.d {

    /* renamed from: a, reason: collision with root package name */
    public final e0 f49091a;

    /* renamed from: b, reason: collision with root package name */
    public final m f49092b;

    /* renamed from: c, reason: collision with root package name */
    public final i f49093c;

    /* renamed from: d, reason: collision with root package name */
    public final h f49094d;

    /* renamed from: e, reason: collision with root package name */
    public int f49095e;

    /* renamed from: f, reason: collision with root package name */
    public final k0 f49096f;

    /* renamed from: g, reason: collision with root package name */
    public u f49097g;

    public g(e0 e0Var, m mVar, d0 source, c0 sink) {
        Intrinsics.g(source, "source");
        Intrinsics.g(sink, "sink");
        this.f49091a = e0Var;
        this.f49092b = mVar;
        this.f49093c = source;
        this.f49094d = sink;
        this.f49096f = new k0(source);
    }

    @Override // c90.d
    public final void a() {
        this.f49094d.flush();
    }

    @Override // c90.d
    public final void b(h0 request) {
        Intrinsics.g(request, "request");
        Proxy.Type type = this.f49092b.f17703b.f95595b.type();
        Intrinsics.f(type, "connection.route().proxy.type()");
        StringBuilder sb2 = new StringBuilder();
        sb2.append(request.f95510b);
        sb2.append(' ');
        w wVar = request.f95509a;
        if (wVar.f95634j || type != Proxy.Type.HTTP) {
            String strC = wVar.c();
            String strE = wVar.e();
            if (strE != null) {
                strC = a2.c.g('?', strC, strE);
            }
            sb2.append(strC);
        } else {
            sb2.append(wVar);
        }
        sb2.append(" HTTP/1.1");
        String string = sb2.toString();
        Intrinsics.f(string, "StringBuilder().apply(builderAction).toString()");
        k(request.f95511c, string);
    }

    @Override // c90.d
    public final long c(m0 m0Var) {
        if (!c90.e.a(m0Var)) {
            return 0L;
        }
        String strB = m0Var.f95558f.b("Transfer-Encoding");
        if (strB == null) {
            strB = null;
        }
        if ("chunked".equalsIgnoreCase(strB)) {
            return -1L;
        }
        return y80.c.i(m0Var);
    }

    @Override // c90.d
    public final void cancel() throws IOException {
        Socket socket = this.f49092b.f17704c;
        if (socket != null) {
            y80.c.d(socket);
        }
    }

    @Override // c90.d
    public final j0 d(m0 m0Var) {
        if (!c90.e.a(m0Var)) {
            return i(0L);
        }
        String strB = m0Var.f95558f.b("Transfer-Encoding");
        if (strB == null) {
            strB = null;
        }
        if ("chunked".equalsIgnoreCase(strB)) {
            w wVar = m0Var.f95553a.f95509a;
            if (this.f49095e == 4) {
                this.f49095e = 5;
                return new c(this, wVar);
            }
            throw new IllegalStateException(("state: " + this.f49095e).toString());
        }
        long jI = y80.c.i(m0Var);
        if (jI != -1) {
            return i(jI);
        }
        if (this.f49095e == 4) {
            this.f49095e = 5;
            this.f49092b.k();
            return new f(this);
        }
        throw new IllegalStateException(("state: " + this.f49095e).toString());
    }

    @Override // c90.d
    public final m e() {
        return this.f49092b;
    }

    @Override // c90.d
    public final m90.h0 f(h0 request, long j11) throws ProtocolException {
        Intrinsics.g(request, "request");
        x80.k0 k0Var = request.f95512d;
        if (k0Var != null && k0Var.isDuplex()) {
            throw new ProtocolException("Duplex connections are not supported for HTTP/1");
        }
        if ("chunked".equalsIgnoreCase(request.f95511c.b("Transfer-Encoding"))) {
            if (this.f49095e == 1) {
                this.f49095e = 2;
                return new b(this);
            }
            throw new IllegalStateException(("state: " + this.f49095e).toString());
        }
        if (j11 == -1) {
            throw new IllegalStateException("Cannot stream a request body without chunked encoding or a known content length!");
        }
        if (this.f49095e == 1) {
            this.f49095e = 2;
            return new e(this);
        }
        throw new IllegalStateException(("state: " + this.f49095e).toString());
    }

    @Override // c90.d
    public final l0 g(boolean z11) {
        k0 k0Var = this.f49096f;
        int i5 = this.f49095e;
        if (i5 != 1 && i5 != 2 && i5 != 3) {
            throw new IllegalStateException(("state: " + this.f49095e).toString());
        }
        try {
            String strR = ((i) k0Var.f13067c).r(k0Var.f13066b);
            k0Var.f13066b -= strR.length();
            c30.c cVarL = ab.e0.L(strR);
            int i11 = cVarL.f19532b;
            l0 l0Var = new l0();
            l0Var.f95523b = (f0) cVarL.f19533c;
            l0Var.f95524c = i11;
            l0Var.f95525d = (String) cVarL.f19534d;
            o2.h hVar = new o2.h(1);
            while (true) {
                String strR2 = ((i) k0Var.f13067c).r(k0Var.f13066b);
                k0Var.f13066b -= strR2.length();
                if (strR2.length() == 0) {
                    break;
                }
                hVar.b(strR2);
            }
            l0Var.c(hVar.f());
            if (z11 && i11 == 100) {
                return null;
            }
            if (i11 == 100) {
                this.f49095e = 3;
                return l0Var;
            }
            if (102 > i11 || i11 >= 200) {
                this.f49095e = 4;
                return l0Var;
            }
            this.f49095e = 3;
            return l0Var;
        } catch (EOFException e3) {
            v vVarH = this.f49092b.f17703b.f95594a.f95393h.h("/...");
            Intrinsics.d(vVarH);
            vVarH.h(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            vVarH.f(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            throw new IOException("unexpected end of stream on ".concat(vVarH.b().f95633i), e3);
        }
    }

    @Override // c90.d
    public final void h() {
        this.f49094d.flush();
    }

    public final d i(long j11) {
        if (this.f49095e == 4) {
            this.f49095e = 5;
            return new d(this, j11);
        }
        throw new IllegalStateException(("state: " + this.f49095e).toString());
    }

    public final void j(m0 m0Var) {
        long jI = y80.c.i(m0Var);
        if (jI == -1) {
            return;
        }
        d dVarI = i(jI);
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        y80.c.s(dVarI, LayoutNode.NotPlacedPlaceOrder);
        dVarI.close();
    }

    public final void k(u uVar, String requestLine) {
        Intrinsics.g(requestLine, "requestLine");
        if (this.f49095e != 0) {
            throw new IllegalStateException(("state: " + this.f49095e).toString());
        }
        h hVar = this.f49094d;
        hVar.u(requestLine).u("\r\n");
        int size = uVar.size();
        for (int i5 = 0; i5 < size; i5++) {
            hVar.u(uVar.c(i5)).u(": ").u(uVar.e(i5)).u("\r\n");
        }
        hVar.u("\r\n");
        this.f49095e = 1;
    }
}
