package defpackage;

import com.google.android.gms.internal.play_billing.zzgs;
import java.io.Serializable;
import java.util.Iterator;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class t3g implements Iterable, Serializable {
    public static final u3g b = new u3g(s5g.a);
    public int a = 0;

    static {
        int i = g3g.a;
    }

    public static int s(int i, int i2, int i3) {
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

    public static u3g t(byte[] bArr, int i, int i2) {
        try {
            s(i, i + i2, bArr.length);
            byte[] bArr2 = new byte[i2];
            System.arraycopy(bArr, i, bArr2, 0, i2);
            return new u3g(bArr2);
        } catch (zzgs e) {
            throw new AssertionError("Expected no InvalidProtocolBufferException as data UTF8 validity is not checked.", e);
        }
    }

    public static /* bridge */ /* synthetic */ boolean u(int i, int i2, int i3, byte[] bArr, byte[] bArr2) {
        int i4 = i + i3;
        s(i, i4, bArr.length);
        s(i2, i3 + i2, bArr2.length);
        while (i < i4) {
            if (bArr[i] != bArr2[i2]) {
                return false;
            }
            i++;
            i2++;
        }
        return true;
    }

    public abstract byte d(int i);

    public abstract int e(int i, int i2);

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof t3g)) {
            return false;
        }
        t3g t3gVar = (t3g) obj;
        int iF = f();
        if (iF != t3gVar.f()) {
            return false;
        }
        if (iF == 0) {
            return true;
        }
        int i = this.a;
        int i2 = t3gVar.a;
        if (i == 0 || i2 == 0 || i == i2) {
            return r(t3gVar);
        }
        return false;
    }

    public abstract int f();

    public final int hashCode() {
        int iE = this.a;
        if (iE == 0) {
            int iF = f();
            iE = e(iF, iF);
            if (iE == 0) {
                iE = 1;
            }
            this.a = iE;
        }
        return iE;
    }

    @Override // java.lang.Iterable
    public final /* synthetic */ Iterator iterator() {
        return new x11(this);
    }

    public abstract t3g m(int i, int i2);

    public abstract void p(int i, byte[] bArr);

    public abstract void q(c4g c4gVar);

    public abstract boolean r(t3g t3gVar);

    public final String toString() {
        byte[] bArr;
        String strConcat;
        byte[] bArr2;
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        int iF = f();
        if (f() <= 50) {
            int iF2 = f();
            if (iF2 == 0) {
                bArr2 = s5g.a;
            } else {
                byte[] bArr3 = new byte[iF2];
                p(iF2, bArr3);
                bArr2 = bArr3;
            }
            strConcat = hp7.M(bArr2);
        } else {
            t3g t3gVarM = m(0, 47);
            int iF3 = t3gVarM.f();
            if (iF3 == 0) {
                bArr = s5g.a;
            } else {
                byte[] bArr4 = new byte[iF3];
                t3gVarM.p(iF3, bArr4);
                bArr = bArr4;
            }
            strConcat = hp7.M(bArr).concat("...");
        }
        return ka1.v(y30.t(iF, "<ByteString@", hexString, " size=", " contents=\""), strConcat, "\">");
    }
}
