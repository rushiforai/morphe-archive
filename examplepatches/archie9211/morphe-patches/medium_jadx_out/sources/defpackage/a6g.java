package defpackage;

import java.io.ByteArrayInputStream;
import java.io.Serializable;
import java.util.Iterator;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class a6g implements Iterable, Serializable {
    public static final a6g c = new a6g(n6g.a);
    public int a = 0;
    public final byte[] b;

    static {
        int i = u5g.a;
    }

    public a6g(byte[] bArr) {
        bArr.getClass();
        this.b = bArr;
    }

    public static int r(int i, int i2, int i3) {
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

    public static a6g s(int i, byte[] bArr) {
        r(0, i, bArr.length);
        byte[] bArr2 = new byte[i];
        System.arraycopy(bArr, 0, bArr2, 0, i);
        return new a6g(bArr2);
    }

    public byte d(int i) {
        return this.b[i];
    }

    public byte e(int i) {
        return this.b[i];
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if ((obj instanceof a6g) && m() == ((a6g) obj).m()) {
            if (m() == 0) {
                return true;
            }
            if (!(obj instanceof a6g)) {
                return obj.equals(this);
            }
            a6g a6gVar = (a6g) obj;
            int i = this.a;
            int i2 = a6gVar.a;
            if (i == 0 || i2 == 0 || i == i2) {
                int iM = m();
                if (iM > a6gVar.m()) {
                    ygf.h(iM, m());
                    return false;
                }
                if (iM > a6gVar.m()) {
                    ay0.e(ev6.v("Ran off end of other: 0, ", iM, a6gVar.m(), ", "));
                    return false;
                }
                byte[] bArr = a6gVar.b;
                int iF = f() + iM;
                int iF2 = f();
                int iF3 = a6gVar.f();
                while (iF2 < iF) {
                    if (this.b[iF2] == bArr[iF3]) {
                        iF2++;
                        iF3++;
                    }
                }
                return true;
            }
        }
        return false;
    }

    public int f() {
        return 0;
    }

    public final int hashCode() {
        int i = this.a;
        if (i != 0) {
            return i;
        }
        int iM = m();
        int iF = f();
        byte[] bArr = n6g.a;
        int i2 = iM;
        for (int i3 = iF; i3 < iF + iM; i3++) {
            i2 = (i2 * 31) + this.b[i3];
        }
        if (i2 == 0) {
            i2 = 1;
        }
        this.a = i2;
        return i2;
    }

    @Override // java.lang.Iterable
    public final /* synthetic */ Iterator iterator() {
        return new x11(this);
    }

    public int m() {
        return this.b.length;
    }

    public void p(int i, byte[] bArr) {
        System.arraycopy(this.b, 0, bArr, 0, i);
    }

    public final ByteArrayInputStream q() {
        return new ByteArrayInputStream(this.b, f(), m());
    }

    public final byte[] t() {
        int iM = m();
        if (iM == 0) {
            return n6g.a;
        }
        byte[] bArr = new byte[iM];
        p(iM, bArr);
        return bArr;
    }

    public final String toString() {
        a6g y5gVar;
        String strConcat;
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        int iM = m();
        if (m() <= 50) {
            strConcat = yo7.x(this);
        } else {
            int iR = r(0, 47, m());
            if (iR == 0) {
                y5gVar = c;
            } else {
                y5gVar = new y5g(this.b, f(), iR);
            }
            strConcat = yo7.x(y5gVar).concat("...");
        }
        return ka1.v(y30.t(iM, "<ByteString@", hexString, " size=", " contents=\""), strConcat, "\">");
    }
}
