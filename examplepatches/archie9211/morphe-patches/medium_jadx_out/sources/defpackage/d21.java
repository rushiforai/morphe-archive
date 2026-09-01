package defpackage;

import java.io.Serializable;
import java.util.Iterator;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class d21 implements Iterable, Serializable {
    public static final d21 c = new d21(x56.b);
    public static final b21 d;
    public int a = 0;
    public final byte[] b;

    static {
        d = am.a() ? new rz5(13) : new uob(12);
    }

    public d21(byte[] bArr) {
        bArr.getClass();
        this.b = bArr;
    }

    public static int e(int i, int i2, int i3) {
        int i4 = i2 - i;
        if ((i | i2 | i4 | (i3 - i2)) >= 0) {
            return i4;
        }
        if (i < 0) {
            z10.i(ev6.w("Beginning index: ", i, " < 0"));
            return 0;
        }
        if (i2 < i) {
            z10.i(ev6.v("Beginning index larger than ending index: ", i, i2, ", "));
            return 0;
        }
        z10.i(ev6.v("End index: ", i2, i3, " >= "));
        return 0;
    }

    public static d21 f(byte[] bArr, int i, int i2) {
        e(i, i + i2, bArr.length);
        return new d21(d.a(bArr, i, i2));
    }

    public byte d(int i) {
        return this.b[i];
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if ((obj instanceof d21) && size() == ((d21) obj).size()) {
            if (size() == 0) {
                return true;
            }
            if (!(obj instanceof d21)) {
                return obj.equals(this);
            }
            d21 d21Var = (d21) obj;
            int i = this.a;
            int i2 = d21Var.a;
            if (i == 0 || i2 == 0 || i == i2) {
                int size = size();
                if (size > d21Var.size()) {
                    ygf.h(size, size());
                    return false;
                }
                if (size > d21Var.size()) {
                    StringBuilder sbC = ev6.C("Ran off end of other: 0, ", size, ", ");
                    sbC.append(d21Var.size());
                    throw new IllegalArgumentException(sbC.toString());
                }
                byte[] bArr = d21Var.b;
                int iP = p() + size;
                int iP2 = p();
                int iP3 = d21Var.p();
                while (iP2 < iP) {
                    if (this.b[iP2] == bArr[iP3]) {
                        iP2++;
                        iP3++;
                    }
                }
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int i = this.a;
        if (i != 0) {
            return i;
        }
        int size = size();
        int iP = p();
        int i2 = size;
        for (int i3 = iP; i3 < iP + size; i3++) {
            i2 = (i2 * 31) + this.b[i3];
        }
        if (i2 == 0) {
            i2 = 1;
        }
        this.a = i2;
        return i2;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new x11(this);
    }

    public void m(int i, byte[] bArr) {
        System.arraycopy(this.b, 0, bArr, 0, i);
    }

    public int p() {
        return 0;
    }

    public byte q(int i) {
        return this.b[i];
    }

    public int size() {
        return this.b.length;
    }

    public final String toString() {
        String strConcat;
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        int size = size();
        if (size() <= 50) {
            strConcat = tr7.r(this);
        } else {
            int iE = e(0, 47, size());
            strConcat = tr7.r(iE == 0 ? c : new z11(this.b, p(), iE)).concat("...");
        }
        return ka1.v(y30.t(size, "<ByteString@", hexString, " size=", " contents=\""), strConcat, "\">");
    }
}
