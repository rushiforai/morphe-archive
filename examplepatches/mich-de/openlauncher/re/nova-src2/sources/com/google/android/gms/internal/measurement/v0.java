package com.google.android.gms.internal.measurement;

import java.io.Serializable;
import java.util.Iterator;
import java.util.Locale;

/* loaded from: classes3.dex */
public abstract class v0 implements Iterable, Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final u0 f33120b = new u0(w1.f33176a);

    /* renamed from: a, reason: collision with root package name */
    public int f33121a;

    static {
        int i5 = p0.f32944a;
    }

    public static u0 k(int i5, int i11, byte[] bArr) {
        try {
            return l(i5, i11, bArr);
        } catch (zzaeh e3) {
            throw new AssertionError("Expected no InvalidProtocolBufferException as data UTF8 validity is not checked.", e3);
        }
    }

    public static u0 l(int i5, int i11, byte[] bArr) {
        if (i11 == 0) {
            return f33120b;
        }
        o(i5, i5 + i11, bArr.length);
        byte[] bArr2 = new byte[i11];
        System.arraycopy(bArr, i5, bArr2, 0, i11);
        return new u0(bArr2);
    }

    public static int o(int i5, int i11, int i12) {
        int i13 = i11 - i5;
        if ((i5 | i11 | i13 | (i12 - i11)) >= 0) {
            return i13;
        }
        if (i5 < 0) {
            StringBuilder sb2 = new StringBuilder(String.valueOf(i5).length() + 21);
            sb2.append("Beginning index: ");
            sb2.append(i5);
            sb2.append(" < 0");
            throw new IndexOutOfBoundsException(sb2.toString());
        }
        if (i11 < i5) {
            StringBuilder sb3 = new StringBuilder(String.valueOf(i5).length() + 44 + String.valueOf(i11).length());
            sb3.append("Beginning index larger than ending index: ");
            sb3.append(i5);
            sb3.append(", ");
            sb3.append(i11);
            throw new IndexOutOfBoundsException(sb3.toString());
        }
        StringBuilder sb4 = new StringBuilder(String.valueOf(i11).length() + 15 + String.valueOf(i12).length());
        sb4.append("End index: ");
        sb4.append(i11);
        sb4.append(" >= ");
        sb4.append(i12);
        throw new IndexOutOfBoundsException(sb4.toString());
    }

    public static /* synthetic */ boolean p(byte[] bArr, int i5, byte[] bArr2, int i11, int i12) {
        int i13 = i5 + i12;
        o(i5, i13, bArr.length);
        o(i11, i12 + i11, bArr2.length);
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

    public abstract int d();

    public abstract t0 e(int i5, int i11);

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof v0)) {
            return false;
        }
        v0 v0Var = (v0) obj;
        int iD = d();
        if (iD != v0Var.d()) {
            return false;
        }
        if (iD == 0) {
            return true;
        }
        int i5 = this.f33121a;
        int i11 = v0Var.f33121a;
        if (i5 == 0 || i11 == 0 || i5 == i11) {
            return h(v0Var);
        }
        return false;
    }

    public abstract void f(int i5, byte[] bArr);

    public abstract void g(c1 c1Var);

    public abstract boolean h(v0 v0Var);

    public final int hashCode() {
        int iJ = this.f33121a;
        if (iJ == 0) {
            int iD = d();
            iJ = j(iD, iD);
            if (iJ == 0) {
                iJ = 1;
            }
            this.f33121a = iJ;
        }
        return iJ;
    }

    @Override // java.lang.Iterable
    public final /* synthetic */ Iterator iterator() {
        return new androidx.datastore.preferences.protobuf.e(this);
    }

    public abstract int j(int i5, int i11);

    public final byte[] n() {
        int iD = d();
        if (iD == 0) {
            return w1.f33176a;
        }
        byte[] bArr = new byte[iD];
        f(iD, bArr);
        return bArr;
    }

    public final String toString() {
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        return b.c0.q(b.c0.v("<ByteString@", d(), hexString, " size=", " contents=\""), d() <= 50 ? h.d(n()) : h.d(e(0, 47).n()).concat("..."), "\">");
    }
}
