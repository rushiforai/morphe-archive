package tl;

import java.util.Arrays;
import sl.d;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f89442a;

    public a(byte[] bArr, int i5) {
        byte[] bArr2 = new byte[i5];
        this.f89442a = bArr2;
        System.arraycopy(bArr, 0, bArr2, 0, i5);
    }

    public static a a(byte[] bArr) {
        if (bArr == null) {
            throw new NullPointerException("data must be non-null");
        }
        int length = bArr.length;
        if (length > bArr.length) {
            length = bArr.length;
        }
        return new a(bArr, length);
    }

    public final byte[] b() {
        byte[] bArr = this.f89442a;
        byte[] bArr2 = new byte[bArr.length];
        System.arraycopy(bArr, 0, bArr2, 0, bArr.length);
        return bArr2;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof a) {
            return Arrays.equals(((a) obj).f89442a, this.f89442a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f89442a);
    }

    public final String toString() {
        return "Bytes(" + d.d(this.f89442a) + ")";
    }
}
