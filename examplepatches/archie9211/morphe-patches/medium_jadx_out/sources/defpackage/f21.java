package defpackage;

import java.io.Serializable;
import java.nio.charset.Charset;
import java.util.Iterator;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class f21 implements Iterable, Serializable {
    public static final c21 b = new c21(v56.b);
    public static final a21 c;
    public int a;

    static {
        c = zl.a() ? new fa4(13) : new xsa(12);
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

    public static c21 f(byte[] bArr, int i, int i2) {
        e(i, i + i2, bArr.length);
        return new c21(c.a(bArr, i, i2));
    }

    public abstract byte d(int i);

    public final int hashCode() {
        int iR = this.a;
        if (iR == 0) {
            int size = size();
            iR = r(size, size);
            if (iR == 0) {
                iR = 1;
            }
            this.a = iR;
        }
        return iR;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new x11(this);
    }

    public abstract byte m(int i);

    public abstract boolean p();

    public abstract sp1 q();

    public abstract int r(int i, int i2);

    public abstract f21 s(int i);

    public abstract int size();

    public abstract String t(Charset charset);

    public final String toString() {
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        return ka1.v(y30.t(size(), "<ByteString@", hexString, " size=", " contents=\""), size() <= 50 ? rr7.y(this) : rr7.y(s(47)).concat("..."), "\">");
    }

    public final String u() {
        return size() == 0 ? "" : t(v56.a);
    }

    public abstract void v(aq1 aq1Var);
}
