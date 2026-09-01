package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.io.Serializable;
import java.util.Iterator;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class hsf implements Serializable, Iterable {
    public static final rsf b = new rsf(ztf.a);
    public static final tz7 c = new tz7(27, false);
    public int a = 0;

    public static int f(int i, int i2, int i3) {
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

    public static rsf p(byte[] bArr, int i, int i2) {
        try {
            return t(bArr, i, i2);
        } catch (zzale e) {
            throw new AssertionError("Expected no InvalidProtocolBufferException as data UTF8 validity is not checked.", e);
        }
    }

    public static /* synthetic */ boolean r(int i, int i2, int i3, byte[] bArr, byte[] bArr2) {
        int i4 = i + i3;
        f(i, i4, bArr.length);
        f(i2, i3 + i2, bArr2.length);
        while (i < i4) {
            if (bArr[i] != bArr2[i2]) {
                return false;
            }
            i++;
            i2++;
        }
        return true;
    }

    public static rsf t(byte[] bArr, int i, int i2) {
        if (i2 == 0) {
            return b;
        }
        f(i, i + i2, bArr.length);
        c.getClass();
        byte[] bArr2 = new byte[i2];
        System.arraycopy(bArr, i, bArr2, 0, i2);
        return new rsf(bArr2);
    }

    public abstract byte d(int i);

    public abstract int e();

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof hsf)) {
            return false;
        }
        hsf hsfVar = (hsf) obj;
        int iE = e();
        if (iE != hsfVar.e()) {
            return false;
        }
        if (iE == 0) {
            return true;
        }
        int i = this.a;
        int i2 = hsfVar.a;
        if (i == 0 || i2 == 0 || i == i2) {
            return s(hsfVar);
        }
        return false;
    }

    public final int hashCode() {
        int iV = this.a;
        if (iV == 0) {
            int iE = e();
            iV = v(iE, iE);
            if (iV == 0) {
                iV = 1;
            }
            this.a = iV;
        }
        return iV;
    }

    @Override // java.lang.Iterable
    public final /* synthetic */ Iterator iterator() {
        return new x11(this);
    }

    public abstract psf m(int i, int i2);

    public abstract void q(int i, byte[] bArr);

    public abstract boolean s(hsf hsfVar);

    public final String toString() {
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        return ka1.v(y30.t(e(), "<ByteString@", hexString, " size=", " contents=\""), e() <= 50 ? ep7.C(x()) : ep7.C(m(0, 47).x()).concat("..."), "\">");
    }

    public abstract void u(htf htfVar);

    public abstract int v(int i, int i2);

    public abstract xsf w();

    public final byte[] x() {
        int iE = e();
        if (iE == 0) {
            return ztf.a;
        }
        byte[] bArr = new byte[iE];
        q(iE, bArr);
        return bArr;
    }
}
