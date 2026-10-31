package mh;

import java.io.ByteArrayInputStream;
import java.io.Serializable;
import java.util.Iterator;
import java.util.Locale;

/* loaded from: classes3.dex */
public class k0 implements Iterable, Serializable {

    /* renamed from: c, reason: collision with root package name */
    public static final k0 f76351c = new k0(l0.f76356a);

    /* renamed from: a, reason: collision with root package name */
    public int f76352a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f76353b;

    static {
        int i5 = i0.f76345a;
    }

    public k0(byte[] bArr) {
        bArr.getClass();
        this.f76353b = bArr;
    }

    public static int j(int i5, int i11, int i12) {
        int i13 = i11 - i5;
        if ((i5 | i11 | i13 | (i12 - i11)) >= 0) {
            return i13;
        }
        if (i5 < 0) {
            throw new IndexOutOfBoundsException(b.c0.i(i5, "Beginning index: ", " < 0"));
        }
        if (i11 < i5) {
            throw new IndexOutOfBoundsException(b.c0.g(i5, i11, "Beginning index larger than ending index: ", ", "));
        }
        throw new IndexOutOfBoundsException(b.c0.g(i11, i12, "End index: ", " >= "));
    }

    public static k0 k(int i5, byte[] bArr) {
        j(0, i5, bArr.length);
        byte[] bArr2 = new byte[i5];
        System.arraycopy(bArr, 0, bArr2, 0, i5);
        return new k0(bArr2);
    }

    public byte c(int i5) {
        return this.f76353b[i5];
    }

    public byte d(int i5) {
        return this.f76353b[i5];
    }

    public int e() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof k0) || f() != ((k0) obj).f()) {
            return false;
        }
        if (f() == 0) {
            return true;
        }
        if (!(obj instanceof k0)) {
            return obj.equals(this);
        }
        k0 k0Var = (k0) obj;
        int i5 = this.f76352a;
        int i11 = k0Var.f76352a;
        if (i5 != 0 && i11 != 0 && i5 != i11) {
            return false;
        }
        int iF = f();
        if (iF > k0Var.f()) {
            throw new IllegalArgumentException("Length too large: " + iF + f());
        }
        if (iF > k0Var.f()) {
            throw new IllegalArgumentException(b.c0.g(iF, k0Var.f(), "Ran off end of other: 0, ", ", "));
        }
        byte[] bArr = k0Var.f76353b;
        int iE = e() + iF;
        int iE2 = e();
        int iE3 = k0Var.e();
        while (iE2 < iE) {
            if (this.f76353b[iE2] != bArr[iE3]) {
                return false;
            }
            iE2++;
            iE3++;
        }
        return true;
    }

    public int f() {
        return this.f76353b.length;
    }

    public void g(int i5, byte[] bArr) {
        System.arraycopy(this.f76353b, 0, bArr, 0, i5);
    }

    public final ByteArrayInputStream h() {
        return new ByteArrayInputStream(this.f76353b, e(), f());
    }

    public final int hashCode() {
        int i5 = this.f76352a;
        if (i5 != 0) {
            return i5;
        }
        int iF = f();
        int iE = e();
        byte[] bArr = l0.f76356a;
        int i11 = iF;
        for (int i12 = iE; i12 < iE + iF; i12++) {
            i11 = (i11 * 31) + this.f76353b[i12];
        }
        if (i11 == 0) {
            i11 = 1;
        }
        this.f76352a = i11;
        return i11;
    }

    @Override // java.lang.Iterable
    public final /* synthetic */ Iterator iterator() {
        return new androidx.datastore.preferences.protobuf.e(this);
    }

    public final byte[] l() {
        int iF = f();
        if (iF == 0) {
            return l0.f76356a;
        }
        byte[] bArr = new byte[iF];
        g(iF, bArr);
        return bArr;
    }

    public final String toString() {
        k0 j0Var;
        String strConcat;
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        int iF = f();
        if (f() <= 50) {
            strConcat = a.d(this);
        } else {
            int iJ = j(0, 47, f());
            if (iJ == 0) {
                j0Var = f76351c;
            } else {
                j0Var = new j0(this.f76353b, e(), iJ);
            }
            strConcat = a.d(j0Var).concat("...");
        }
        return b.c0.q(b.c0.v("<ByteString@", iF, hexString, " size=", " contents=\""), strConcat, "\">");
    }
}
