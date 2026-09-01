package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sr0 implements Cloneable {
    public final int a;
    public final int b;
    public final int c;
    public final int[] d;

    public sr0(int i, int i2) {
        if (i <= 0 || i2 <= 0) {
            ay0.e("Both dimensions must be greater than 0");
            throw null;
        }
        this.a = i;
        this.b = i2;
        int i3 = (i + 31) / 32;
        this.c = i3;
        this.d = new int[i3 * i2];
    }

    public final boolean a(int i, int i2) {
        return ((this.d[(i / 32) + (i2 * this.c)] >>> (i & 31)) & 1) != 0;
    }

    public final void b(int i, int i2) {
        int i3 = (i / 32) + (i2 * this.c);
        int[] iArr = this.d;
        iArr[i3] = (1 << (i & 31)) | iArr[i3];
    }

    public final void c(int i, int i2, int i3, int i4) {
        if (i2 < 0 || i < 0) {
            ay0.e("Left and top must be nonnegative");
            return;
        }
        if (i4 <= 0 || i3 <= 0) {
            ay0.e("Height and width must be at least 1");
            return;
        }
        int i5 = i3 + i;
        int i6 = i4 + i2;
        if (i6 > this.b || i5 > this.a) {
            ay0.e("The region must fit inside the matrix");
            return;
        }
        while (i2 < i6) {
            int i7 = this.c * i2;
            for (int i8 = i; i8 < i5; i8++) {
                int i9 = (i8 / 32) + i7;
                int[] iArr = this.d;
                iArr[i9] = iArr[i9] | (1 << (i8 & 31));
            }
            i2++;
        }
    }

    public final Object clone() {
        return new sr0(this.a, this.b, this.c, (int[]) this.d.clone());
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof sr0)) {
            return false;
        }
        sr0 sr0Var = (sr0) obj;
        return this.a == sr0Var.a && this.b == sr0Var.b && this.c == sr0Var.c && Arrays.equals(this.d, sr0Var.d);
    }

    public final int hashCode() {
        int i = this.a;
        return Arrays.hashCode(this.d) + (((((((i * 31) + i) * 31) + this.b) * 31) + this.c) * 31);
    }

    public final String toString() {
        int i = this.a;
        int i2 = this.b;
        StringBuilder sb = new StringBuilder((i + 1) * i2);
        for (int i3 = 0; i3 < i2; i3++) {
            for (int i4 = 0; i4 < i; i4++) {
                sb.append(a(i4, i3) ? "X " : "  ");
            }
            sb.append("\n");
        }
        return sb.toString();
    }

    public sr0(int i, int i2, int i3, int[] iArr) {
        this.a = i;
        this.b = i2;
        this.c = i3;
        this.d = iArr;
    }
}
