package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t46 {
    public int[] a;
    public int b;

    public t46(int i, int[] iArr) {
        int length = iArr.length;
        if (length == 4) {
            this.b = i;
            this.a = iArr;
            return;
        }
        StringBuilder sb = new StringBuilder(String.valueOf(length).length() + 44);
        String strA = cmg.a("Ake3rgkWMjm+UlOd1Tg3PHccqBbIRJQk3bhyKj5k");
        String strA2 = cmg.a("a0CvvBEaN339T0zNlXk=");
        sb.append(strA);
        sb.append(length);
        sb.append(strA2);
        throw new IllegalArgumentException(sb.toString());
    }

    public int a(int i) {
        int i2 = this.b - 1;
        return i2 >= 0 ? this.a[i2] : i;
    }

    public int b() {
        int[] iArr = this.a;
        int i = this.b - 1;
        this.b = i;
        return iArr[i];
    }

    public void c(int i) {
        int[] iArrCopyOf = this.a;
        if (this.b >= iArrCopyOf.length) {
            iArrCopyOf = Arrays.copyOf(iArrCopyOf, iArrCopyOf.length * 2);
            this.a = iArrCopyOf;
        }
        int i2 = this.b;
        this.b = i2 + 1;
        iArrCopyOf[i2] = i;
    }

    public void d(int i, int i2, int i3) {
        int i4 = this.b;
        int[] iArrCopyOf = this.a;
        int i5 = i4 + 3;
        if (i5 >= iArrCopyOf.length) {
            iArrCopyOf = Arrays.copyOf(iArrCopyOf, iArrCopyOf.length * 2);
            this.a = iArrCopyOf;
        }
        iArrCopyOf[i4] = i + i3;
        iArrCopyOf[i4 + 1] = i2 + i3;
        iArrCopyOf[i4 + 2] = i3;
        this.b = i5;
    }

    public void e(int i, int i2, int i3, int i4) {
        int i5 = this.b;
        int[] iArrCopyOf = this.a;
        int i6 = i5 + 4;
        if (i6 >= iArrCopyOf.length) {
            iArrCopyOf = Arrays.copyOf(iArrCopyOf, iArrCopyOf.length * 2);
            this.a = iArrCopyOf;
        }
        iArrCopyOf[i5] = i;
        iArrCopyOf[i5 + 1] = i2;
        iArrCopyOf[i5 + 2] = i3;
        iArrCopyOf[i5 + 3] = i4;
        this.b = i6;
    }

    public void f(int i, int i2) {
        if (i < i2) {
            int i3 = i - 3;
            for (int i4 = i; i4 < i2; i4 += 3) {
                int[] iArr = this.a;
                int i5 = iArr[i4];
                int i6 = iArr[i2];
                if (i5 < i6 || (i5 == i6 && iArr[i4 + 1] <= iArr[i2 + 1])) {
                    i3 += 3;
                    g(i3, i4);
                }
            }
            g(i3 + 3, i2);
            f(i, i3);
            f(i3 + 6, i2);
        }
    }

    public void g(int i, int i2) {
        int[] iArr = this.a;
        int i3 = iArr[i];
        iArr[i] = iArr[i2];
        iArr[i2] = i3;
        int i4 = i + 1;
        int i5 = i2 + 1;
        int i6 = iArr[i4];
        iArr[i4] = iArr[i5];
        iArr[i5] = i6;
        int i7 = i + 2;
        int i8 = i2 + 2;
        int i9 = iArr[i7];
        iArr[i7] = iArr[i8];
        iArr[i8] = i9;
    }

    public void h(int i, byte[] bArr) {
        t46 t46Var = this;
        int i2 = 0;
        int i3 = 2055825325;
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        int i7 = 0;
        char c = 0;
        int i8 = 0;
        int i9 = 0;
        int i10 = 0;
        int i11 = 0;
        int i12 = 0;
        char c2 = 0;
        char c3 = 0;
        int i13 = 0;
        int i14 = 0;
        int i15 = 0;
        while (i3 != 1173404700) {
            if (i3 == 1523783727) {
                int i16 = (-350379027) + i3;
                i3 += 370337140;
                if (i2 == i13) {
                    i3 = i16;
                }
                t46Var = this;
            } else if (i3 != 2055825325) {
                int[] iArr = t46Var.a;
                i4 += (((i11 << i10) ^ (i11 >>> i12)) + i11) ^ (i2 + iArr[i2 & i9]);
                i2 += i14;
                i11 += (((i4 << i10) ^ (i4 >>> i12)) + i4) ^ (iArr[(i2 >>> i15) & i9] + i2);
                i3 -= 370337140;
            } else {
                i4 = t46Var.b;
                i3 -= 532041598;
                i9 = 3;
                i7 = 255;
                c3 = 7;
                c2 = 6;
                c = 2;
                i5 = 24;
                i15 = 11;
                i14 = 1340169305;
                i12 = 5;
                i10 = 4;
                i13 = -64255200;
                i6 = 16;
                i8 = 8;
                i11 = i;
                i2 = 0;
            }
        }
        bArr[0] = (byte) (i4 >> i5);
        bArr[1] = (byte) ((((i4 >> i6) & i7) << i5) >> i5);
        bArr[c] = (byte) ((((i4 >> i8) & i7) << i5) >> i5);
        bArr[i9] = (byte) (((i4 & i7) << i5) >> i5);
        bArr[i10] = (byte) (i11 >> i5);
        bArr[i12] = (byte) ((((i11 >> i6) & i7) << i5) >> i5);
        bArr[c2] = (byte) ((((i11 >> i8) & i7) << i5) >> i5);
        bArr[c3] = (byte) (((i11 & i7) << i5) >> i5);
    }

    public t46() {
        this.a = new int[10];
    }

    public t46(int i) {
        this.a = new int[i];
    }
}
