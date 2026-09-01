package defpackage;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import java.io.EOFException;
import java.io.IOException;
import java.net.Proxy;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hs5 implements b44 {
    public static final yi5 f;
    public final up8 a;
    public final a44 b;
    public final m50 c;
    public int d;
    public final il1 e;

    static {
        yi5 yi5Var = yi5.b;
        f = pwd.U("OkHttp-Response-Body", "Truncated");
    }

    public hs5(up8 up8Var, a44 a44Var, m50 m50Var) {
        m50Var.getClass();
        this.a = up8Var;
        this.b = a44Var;
        this.c = m50Var;
        this.e = new il1((yua) m50Var.c);
    }

    @Override // defpackage.b44
    public final ikc a(adb adbVar) {
        kbb kbbVar = adbVar.a;
        if (!bt5.a(adbVar)) {
            return k(kbbVar.a, 0L);
        }
        String strD = adbVar.f.d("Transfer-Encoding");
        if (strD == null) {
            strD = null;
        }
        if ("chunked".equalsIgnoreCase(strD)) {
            qt5 qt5Var = kbbVar.a;
            if (this.d == 4) {
                this.d = 5;
                return new es5(this, qt5Var);
            }
            lg8.s(this.d, "state: ");
            return null;
        }
        long jE = ggf.e(adbVar);
        if (jE != -1) {
            return k(kbbVar.a, jE);
        }
        qt5 qt5Var2 = kbbVar.a;
        if (this.d != 4) {
            lg8.s(this.d, "state: ");
            return null;
        }
        this.d = 5;
        this.b.e();
        qt5Var2.getClass();
        return new gs5(this, qt5Var2);
    }

    @Override // defpackage.b44
    public final void b(kbb kbbVar) {
        kbbVar.getClass();
        Proxy.Type type = this.b.h().b.type();
        type.getClass();
        StringBuilder sb = new StringBuilder();
        sb.append(kbbVar.b);
        sb.append(' ');
        qt5 qt5Var = kbbVar.a;
        if (qt5Var.f() || type != Proxy.Type.HTTP) {
            String strB = qt5Var.b();
            String strD = qt5Var.d();
            if (strD != null) {
                strB = ev6.r('?', strB, strD);
            }
            sb.append(strB);
        } else {
            sb.append(qt5Var);
        }
        sb.append(" HTTP/1.1");
        l(kbbVar.c, sb.toString());
    }

    @Override // defpackage.b44
    public final void c() {
        ((xua) this.c.d).flush();
    }

    @Override // defpackage.b44
    public final void cancel() {
        this.b.cancel();
    }

    @Override // defpackage.b44
    public final boolean d() {
        return this.d == 6;
    }

    @Override // defpackage.b44
    public final bfc f(kbb kbbVar, long j) {
        kbbVar.getClass();
        if ("chunked".equalsIgnoreCase(kbbVar.c.d("Transfer-Encoding"))) {
            if (this.d == 1) {
                this.d = 2;
                return new ds5(this);
            }
            lg8.s(this.d, "state: ");
            return null;
        }
        if (j == -1) {
            ygf.f("Cannot stream a request body without chunked encoding or a known content length!");
            return null;
        }
        if (this.d == 1) {
            this.d = 2;
            return new w33(this);
        }
        lg8.s(this.d, "state: ");
        return null;
    }

    @Override // defpackage.b44
    public final ycb g(boolean z) throws IOException {
        il1 il1Var = this.e;
        yua yuaVar = (yua) il1Var.c;
        int i = this.d;
        if (i != 0 && i != 1 && i != 2 && i != 3) {
            lg8.s(this.d, "state: ");
            return null;
        }
        try {
            String strI = yuaVar.I(il1Var.b);
            il1Var.b -= (long) strI.length();
            xp xpVarY = lk7.y(strI);
            int i2 = xpVarY.b;
            ycb ycbVar = new ycb();
            c8a c8aVar = (c8a) xpVarY.c;
            c8aVar.getClass();
            ycbVar.b = c8aVar;
            ycbVar.c = i2;
            ycbVar.d = (String) xpVarY.d;
            ru ruVar = new ru(3);
            while (true) {
                String strI2 = yuaVar.I(il1Var.b);
                il1Var.b -= (long) strI2.length();
                if (strI2.length() == 0) {
                    break;
                }
                ruVar.d(strI2);
            }
            ycbVar.f = iq7.E(iq7.C(ruVar));
            if (z && i2 == 100) {
                return null;
            }
            if (i2 == 100) {
                this.d = 3;
                return ycbVar;
            }
            if (102 > i2 || i2 >= 200) {
                this.d = 4;
                return ycbVar;
            }
            this.d = 3;
            return ycbVar;
        } catch (EOFException e) {
            throw new IOException("unexpected end of stream on ".concat(this.b.h().a.h.h()), e);
        }
    }

    @Override // defpackage.b44
    public final void h() {
        ((xua) this.c.d).flush();
    }

    @Override // defpackage.b44
    public final xjc i() {
        return this.c;
    }

    @Override // defpackage.b44
    public final a44 j() {
        return this.b;
    }

    public final fs5 k(qt5 qt5Var, long j) {
        if (this.d == 4) {
            this.d = 5;
            return new fs5(this, qt5Var, j);
        }
        lg8.s(this.d, "state: ");
        return null;
    }

    public final void l(yi5 yi5Var, String str) {
        if (this.d != 0) {
            lg8.s(this.d, "state: ");
            return;
        }
        m50 m50Var = this.c;
        xua xuaVar = (xua) m50Var.d;
        xuaVar.Y(str);
        xuaVar.Y("\r\n");
        int size = yi5Var.size();
        int i = 0;
        while (true) {
            xua xuaVar2 = (xua) m50Var.d;
            if (i >= size) {
                xuaVar2.Y("\r\n");
                this.d = 1;
                return;
            } else {
                xuaVar2.Y(iq7.D(yi5Var, i));
                xuaVar2.Y(": ");
                xuaVar2.Y(iq7.F(yi5Var, i));
                xuaVar2.Y("\r\n");
                i++;
            }
        }
    }

    @Override // defpackage.b44
    public final long e(adb adbVar) {
        if (!bt5.a(adbVar)) {
            return 0L;
        }
        String strD = adbVar.f.d(ZVsviyDAr.EZMCPeOv);
        if (strD == null) {
            strD = null;
        }
        if ("chunked".equalsIgnoreCase(strD)) {
            return -1L;
        }
        return ggf.e(adbVar);
    }
}
