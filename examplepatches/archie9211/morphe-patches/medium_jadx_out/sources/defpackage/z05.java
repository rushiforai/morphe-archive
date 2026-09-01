package defpackage;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class z05 {
    public static final n98 e = n98.g("<root>");
    public final String a;
    public transient y05 b;
    public transient z05 c;
    public transient n98 d;

    static {
        Pattern.compile("\\.").getClass();
    }

    public z05(y05 y05Var, String str) {
        str.getClass();
        this.a = str;
        this.b = y05Var;
    }

    public static final List f(z05 z05Var) {
        if (z05Var.c()) {
            return new ArrayList();
        }
        List listF = f(z05Var.e());
        listF.add(z05Var.g());
        return listF;
    }

    public final z05 a(n98 n98Var) {
        String strB;
        n98Var.getClass();
        if (c()) {
            strB = n98Var.b();
        } else {
            strB = this.a + '.' + n98Var.b();
        }
        strB.getClass();
        return new z05(strB, this, n98Var);
    }

    public final void b() {
        String str = this.a;
        int length = str.length() - 1;
        boolean z = false;
        while (true) {
            if (length < 0) {
                length = -1;
                break;
            }
            char cCharAt = str.charAt(length);
            if (cCharAt == '.' && !z) {
                break;
            }
            if (cCharAt == '`') {
                z = !z;
            } else if (cCharAt == '\\') {
                length--;
            }
            length--;
        }
        if (length >= 0) {
            this.d = n98.d(str.substring(length + 1));
            this.c = new z05(str.substring(0, length));
        } else {
            this.d = n98.d(str);
            this.c = y05.c.a;
        }
    }

    public final boolean c() {
        return this.a.length() == 0;
    }

    public final boolean d() {
        return this.b != null || muc.Y(this.a, '<', 0, 6) < 0;
    }

    public final z05 e() {
        z05 z05Var = this.c;
        if (z05Var != null) {
            return z05Var;
        }
        if (c()) {
            ygf.f("root");
            return null;
        }
        b();
        z05 z05Var2 = this.c;
        z05Var2.getClass();
        return z05Var2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof z05) {
            return g76.L(this.a, ((z05) obj).a);
        }
        return false;
    }

    public final n98 g() {
        n98 n98Var = this.d;
        if (n98Var != null) {
            return n98Var;
        }
        if (c()) {
            ygf.f("root");
            return null;
        }
        b();
        n98 n98Var2 = this.d;
        n98Var2.getClass();
        return n98Var2;
    }

    public final boolean h(n98 n98Var) {
        n98Var.getClass();
        if (!c()) {
            String str = this.a;
            int iY = muc.Y(str, '.', 0, 6);
            if (iY == -1) {
                iY = str.length();
            }
            int i = iY;
            String strB = n98Var.b();
            strB.getClass();
            if (i == strB.length() && tuc.I(0, 0, i, this.a, strB, false)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final y05 i() {
        y05 y05Var = this.b;
        if (y05Var != null) {
            return y05Var;
        }
        y05 y05Var2 = new y05(this);
        this.b = y05Var2;
        return y05Var2;
    }

    public final String toString() {
        if (!c()) {
            return this.a;
        }
        String strB = e.b();
        strB.getClass();
        return strB;
    }

    public z05(String str) {
        this.a = str;
    }

    public z05(String str, z05 z05Var, n98 n98Var) {
        this.a = str;
        this.c = z05Var;
        this.d = n98Var;
    }
}
