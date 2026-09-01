package defpackage;

import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import java.io.File;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class g59 implements Comparable {
    public static final String b;
    public final h21 a;

    static {
        String str = File.separator;
        str.getClass();
        b = str;
    }

    public g59(h21 h21Var) {
        h21Var.getClass();
        this.a = h21Var;
    }

    public final ArrayList a() {
        ArrayList arrayList = new ArrayList();
        int iC = d.c(this);
        h21 h21Var = this.a;
        if (iC == -1) {
            iC = 0;
        } else if (iC < h21Var.e() && h21Var.j(iC) == 92) {
            iC++;
        }
        int iE = h21Var.e();
        int i = iC;
        while (iC < iE) {
            if (h21Var.j(iC) == 47 || h21Var.j(iC) == 92) {
                arrayList.add(h21Var.p(i, iC));
                i = iC + 1;
            }
            iC++;
        }
        if (i < h21Var.e()) {
            arrayList.add(h21Var.p(i, h21Var.e()));
        }
        return arrayList;
    }

    public final String b() {
        h21 h21Var = d.a;
        h21 h21VarQ = this.a;
        int iL = h21.l(h21VarQ, h21Var);
        if (iL == -1) {
            iL = h21.l(h21VarQ, d.b);
        }
        if (iL != -1) {
            h21VarQ = h21.q(h21VarQ, iL + 1, 0, 2);
        } else if (f() != null && h21VarQ.e() == 2) {
            h21VarQ = h21.d;
        }
        return h21VarQ.t();
    }

    public final g59 c() {
        h21 h21Var = d.d;
        h21 h21Var2 = this.a;
        if (g76.L(h21Var2, h21Var)) {
            return null;
        }
        h21 h21Var3 = d.a;
        if (g76.L(h21Var2, h21Var3)) {
            return null;
        }
        h21 h21Var4 = d.b;
        if (g76.L(h21Var2, h21Var4)) {
            return null;
        }
        h21 h21Var5 = d.e;
        h21Var2.getClass();
        h21Var5.getClass();
        int iE = h21Var2.e();
        byte[] bArr = h21Var5.a;
        if (h21Var2.n(h21Var5, iE - bArr.length, bArr.length) && (h21Var2.e() == 2 || h21Var2.n(h21Var3, h21Var2.e() - 3, 1) || h21Var2.n(h21Var4, h21Var2.e() - 3, 1))) {
            return null;
        }
        int iL = h21.l(h21Var2, h21Var3);
        if (iL == -1) {
            iL = h21.l(h21Var2, h21Var4);
        }
        if (iL == 2 && f() != null) {
            if (h21Var2.e() == 3) {
                return null;
            }
            return new g59(h21.q(h21Var2, 0, 3, 1));
        }
        if (iL == 1) {
            h21Var4.getClass();
            if (h21Var2.n(h21Var4, 0, h21Var4.e())) {
                return null;
            }
        }
        if (iL != -1 || f() == null) {
            return iL == -1 ? new g59(h21Var) : iL == 0 ? new g59(h21.q(h21Var2, 0, 1, 1)) : new g59(h21.q(h21Var2, 0, iL, 1));
        }
        if (h21Var2.e() == 2) {
            return null;
        }
        return new g59(h21.q(h21Var2, 0, 2, 1));
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        g59 g59Var = (g59) obj;
        g59Var.getClass();
        return this.a.compareTo(g59Var.a);
    }

    public final g59 e(String str) {
        str.getClass();
        kz0 kz0Var = new kz0();
        kz0Var.R0(str);
        return d.a(this, d.d(kz0Var, false), false);
    }

    public final boolean equals(Object obj) {
        return (obj instanceof g59) && g76.L(((g59) obj).a, this.a);
    }

    public final Character f() {
        h21 h21Var = d.a;
        h21 h21Var2 = this.a;
        if (h21.h(h21Var2, h21Var) != -1 || h21Var2.e() < 2 || h21Var2.j(1) != 58) {
            return null;
        }
        char cJ = (char) h21Var2.j(0);
        if (('a' > cJ || cJ >= '{') && ('A' > cJ || cJ >= '[')) {
            return null;
        }
        return Character.valueOf(cJ);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final File toFile() {
        return new File(this.a.t());
    }

    public final String toString() {
        return this.a.t();
    }

    public final g59 d(g59 g59Var) {
        g59 g59Var2;
        g59 g59Var3;
        g59Var.getClass();
        h21 h21Var = g59Var.a;
        int iC = d.c(this);
        h21 h21Var2 = this.a;
        if (iC == -1) {
            g59Var2 = null;
        } else {
            g59Var2 = new g59(h21Var2.p(0, iC));
        }
        int iC2 = d.c(g59Var);
        if (iC2 == -1) {
            g59Var3 = null;
        } else {
            g59Var3 = new g59(h21Var.p(0, iC2));
        }
        if (g76.L(g59Var2, g59Var3)) {
            ArrayList arrayListA = a();
            ArrayList arrayListA2 = g59Var.a();
            int iMin = Math.min(arrayListA.size(), arrayListA2.size());
            int i = 0;
            while (i < iMin && g76.L(arrayListA.get(i), arrayListA2.get(i))) {
                i++;
            }
            if (i == iMin && h21Var2.e() == h21Var.e()) {
                return cd7.r(pUlNWdybf.VyDMgM);
            }
            if (arrayListA2.subList(i, arrayListA2.size()).indexOf(d.e) == -1) {
                if (g76.L(h21Var, d.d)) {
                    return this;
                }
                kz0 kz0Var = new kz0();
                h21 h21VarB = d.b(g59Var);
                if (h21VarB == null && (h21VarB = d.b(this)) == null) {
                    h21VarB = d.f(b);
                }
                int size = arrayListA2.size();
                for (int i2 = i; i2 < size; i2++) {
                    kz0Var.J0(d.e);
                    kz0Var.J0(h21VarB);
                }
                int size2 = arrayListA.size();
                while (i < size2) {
                    kz0Var.J0((h21) arrayListA.get(i));
                    kz0Var.J0(h21VarB);
                    i++;
                }
                return d.d(kz0Var, false);
            }
            lg8.o("Impossible relative path to resolve: ", this, " and ", g59Var);
            return null;
        }
        lg8.o("Paths of different roots cannot be relative to each other: ", this, " and ", g59Var);
        return null;
    }
}
