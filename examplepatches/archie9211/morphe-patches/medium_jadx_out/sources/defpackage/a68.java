package defpackage;

import java.io.EOFException;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a68 extends sbb {
    public static final fn7 f;
    public static final fn7 g;
    public static final byte[] h;
    public static final byte[] i;
    public static final byte[] j;
    public final h21 b;
    public final List c;
    public final fn7 d;
    public long e;

    static {
        x2b x2bVar = fn7.d;
        f = en7.x("multipart/mixed");
        en7.x("multipart/alternative");
        en7.x("multipart/digest");
        en7.x("multipart/parallel");
        g = en7.x("multipart/form-data");
        h = new byte[]{58, 32};
        i = new byte[]{13, 10};
        j = new byte[]{45, 45};
    }

    public a68(h21 h21Var, fn7 fn7Var, List list) {
        fn7Var.getClass();
        this.b = h21Var;
        this.c = list;
        x2b x2bVar = fn7.d;
        this.d = en7.x(fn7Var + "; boundary=" + h21Var.t());
        this.e = -1L;
    }

    @Override // defpackage.sbb
    public final long a() throws EOFException {
        long j2 = this.e;
        if (j2 != -1) {
            return j2;
        }
        long jE = e(null, true);
        this.e = jE;
        return jE;
    }

    @Override // defpackage.sbb
    public final fn7 b() {
        return this.d;
    }

    @Override // defpackage.sbb
    public final boolean c() {
        List list = this.c;
        if (list.isEmpty()) {
            return false;
        }
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            if (((z58) it2.next()).b.c()) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.sbb
    public final void d(xz0 xz0Var) throws EOFException {
        e(xz0Var, false);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final long e(xz0 xz0Var, boolean z) throws EOFException {
        kz0 kz0Var;
        xz0 kz0Var2;
        if (z) {
            kz0Var2 = new kz0();
            kz0Var = kz0Var2;
        } else {
            kz0Var = 0;
            kz0Var2 = xz0Var;
        }
        List list = this.c;
        int size = list.size();
        long j2 = 0;
        int i2 = 0;
        while (true) {
            h21 h21Var = this.b;
            byte[] bArr = j;
            byte[] bArr2 = i;
            if (i2 >= size) {
                kz0Var2.getClass();
                kz0Var2.write(bArr);
                kz0Var2.C0(h21Var);
                kz0Var2.write(bArr);
                kz0Var2.write(bArr2);
                if (!z) {
                    return j2;
                }
                kz0Var.getClass();
                long j3 = j2 + kz0Var.b;
                kz0Var.B();
                return j3;
            }
            z58 z58Var = (z58) list.get(i2);
            yi5 yi5Var = z58Var.a;
            sbb sbbVar = z58Var.b;
            kz0Var2.getClass();
            kz0Var2.write(bArr);
            kz0Var2.C0(h21Var);
            kz0Var2.write(bArr2);
            int size2 = yi5Var.size();
            for (int i3 = 0; i3 < size2; i3++) {
                kz0Var2.Y(iq7.D(yi5Var, i3)).write(h).Y(iq7.F(yi5Var, i3)).write(bArr2);
            }
            fn7 fn7VarB = sbbVar.b();
            if (fn7VarB != null) {
                kz0Var2.Y("Content-Type: ").Y(fn7VarB.a).write(bArr2);
            }
            long jA = sbbVar.a();
            if (jA == -1 && z) {
                kz0Var.getClass();
                kz0Var.B();
                return -1L;
            }
            kz0Var2.write(bArr2);
            if (z) {
                j2 += jA;
            } else {
                sbbVar.d(kz0Var2);
            }
            kz0Var2.write(bArr2);
            i2++;
        }
    }
}
