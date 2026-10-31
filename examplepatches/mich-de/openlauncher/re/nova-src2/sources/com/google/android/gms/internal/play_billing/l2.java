package com.google.android.gms.internal.play_billing;

import java.io.Serializable;
import java.util.Iterator;
import java.util.Locale;

/* loaded from: classes3.dex */
public abstract class l2 implements Iterable, Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final m2 f33446b = new m2(e3.f33386b);

    /* renamed from: a, reason: collision with root package name */
    public int f33447a = 0;

    static {
        int i5 = i2.f33421a;
    }

    public static int k(int i5, int i11, int i12) {
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

    public static m2 l(int i5, int i11, byte[] bArr) {
        try {
            k(i5, i5 + i11, bArr.length);
            byte[] bArr2 = new byte[i11];
            System.arraycopy(bArr, i5, bArr2, 0, i11);
            return new m2(bArr2);
        } catch (zzgc e3) {
            throw new AssertionError("Expected no InvalidProtocolBufferException as data UTF8 validity is not checked.", e3);
        }
    }

    public static /* bridge */ /* synthetic */ boolean n(byte[] bArr, int i5, byte[] bArr2, int i11, int i12) {
        int i13 = i5 + i12;
        k(i5, i13, bArr.length);
        k(i11, i12 + i11, bArr2.length);
        while (i5 < i13) {
            if (bArr[i5] != bArr2[i11]) {
                return false;
            }
            i5++;
            i11++;
        }
        return true;
    }

    public abstract byte c(int i5);

    public abstract byte d(int i5);

    public abstract int e(int i5, int i11);

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof l2)) {
            return false;
        }
        l2 l2Var = (l2) obj;
        int iF = f();
        if (iF != l2Var.f()) {
            return false;
        }
        if (iF == 0) {
            return true;
        }
        int i5 = this.f33447a;
        int i11 = l2Var.f33447a;
        if (i5 == 0 || i11 == 0 || i5 == i11) {
            return j(l2Var);
        }
        return false;
    }

    public abstract int f();

    public abstract l2 g(int i5, int i11);

    public abstract void h(n2 n2Var);

    public final int hashCode() {
        int iE = this.f33447a;
        if (iE == 0) {
            int iF = f();
            iE = e(iF, iF);
            if (iE == 0) {
                iE = 1;
            }
            this.f33447a = iE;
        }
        return iE;
    }

    @Override // java.lang.Iterable
    public final /* synthetic */ Iterator iterator() {
        return new androidx.datastore.preferences.protobuf.e(this);
    }

    public abstract boolean j(l2 l2Var);

    public final String toString() {
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        return b.c0.q(b.c0.v("<ByteString@", f(), hexString, " size=", " contents=\""), f() <= 50 ? cw.l2.L(this) : cw.l2.L(g(0, 47)).concat("..."), "\">");
    }
}
