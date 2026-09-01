package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class kbb {
    public final qt5 a;
    public final String b;
    public final yi5 c;
    public final sbb d;
    public final ep7 e;
    public b31 f;

    public kbb(iq1 iq1Var) {
        qt5 qt5Var = (qt5) iq1Var.b;
        if (qt5Var == null) {
            ygf.f("url == null");
            throw null;
        }
        this.a = qt5Var;
        this.b = (String) iq1Var.c;
        ru ruVar = (ru) iq1Var.d;
        ruVar.getClass();
        this.c = iq7.C(ruVar);
        this.d = (sbb) iq1Var.e;
        this.e = (ep7) iq1Var.f;
    }

    public final iq1 a() {
        iq1 iq1Var = new iq1(false);
        iq1Var.b = this.a;
        iq1Var.c = this.b;
        iq1Var.e = this.d;
        iq1Var.f = this.e;
        iq1Var.d = iq7.E(this.c);
        return iq1Var;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(32);
        sb.append("Request{method=");
        sb.append(this.b);
        sb.append(", url=");
        sb.append(this.a);
        yi5 yi5Var = this.c;
        if (yi5Var.size() != 0) {
            sb.append(", headers=[");
            Iterator it2 = yi5Var.iterator();
            int i = 0;
            while (true) {
                h1 h1Var = (h1) it2;
                if (!h1Var.hasNext()) {
                    sb.append(']');
                    break;
                }
                Object next = h1Var.next();
                int i2 = i + 1;
                if (i < 0) {
                    d46.i0();
                    throw null;
                }
                f09 f09Var = (f09) next;
                String str = (String) f09Var.a;
                String str2 = (String) f09Var.b;
                if (i > 0) {
                    sb.append(", ");
                }
                sb.append(str);
                sb.append(':');
                if (egf.m(str)) {
                    str2 = "██";
                }
                sb.append(str2);
                i = i2;
            }
        }
        oy3 oy3Var = oy3.e;
        ep7 ep7Var = this.e;
        if (!g76.L(ep7Var, oy3Var)) {
            sb.append(", tags=");
            sb.append(ep7Var);
        }
        sb.append('}');
        return sb.toString();
    }
}
