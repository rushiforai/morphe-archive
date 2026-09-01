package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class gn0 {
    public static final en0 f;
    public static final byte[] g;
    public final boolean a;
    public final boolean b;
    public final int c;
    public final fn0 d;
    public final int e;

    static {
        fn0 fn0Var = fn0.PRESENT;
        f = new en0(false, false, -1, fn0Var);
        g = new byte[]{13, 10};
        new gn0(true, false, -1, fn0Var);
        new gn0(false, true, 76, fn0Var);
        new gn0(false, true, 64, fn0Var);
    }

    public gn0(boolean z, boolean z2, int i, fn0 fn0Var) {
        this.a = z;
        this.b = z2;
        this.c = i;
        this.d = fn0Var;
        if (z && z2) {
            ay0.e("Failed requirement.");
            throw null;
        }
        this.e = i / 4;
    }

    public static String b(gn0 gn0Var, byte[] bArr) {
        int i;
        int length = bArr.length;
        gn0Var.getClass();
        fn0 fn0Var = gn0Var.d;
        int length2 = bArr.length;
        g1 g1Var = k1.Companion;
        g1Var.getClass();
        g1.a(0, length, length2);
        int iC = gn0Var.c(length);
        byte[] bArr2 = new byte[iC];
        int length3 = bArr.length;
        g1Var.getClass();
        g1.a(0, length, length3);
        int iC2 = gn0Var.c(length);
        if (iC < 0) {
            z10.i(b09.w(iC, "destination offset: 0, destination size: "));
            return null;
        }
        if (iC2 < 0 || iC2 > iC) {
            z10.i(ev6.v("The destination array does not have enough capacity, destination offset: 0, destination size: ", iC, iC2, ", capacity needed: "));
            return null;
        }
        byte[] bArr3 = gn0Var.a ? hn0.c : hn0.a;
        int i2 = gn0Var.b ? gn0Var.e : Integer.MAX_VALUE;
        int i3 = 0;
        int i4 = 0;
        while (true) {
            i = i3 + 2;
            if (i >= length) {
                break;
            }
            int iMin = Math.min((length - i3) / 3, i2);
            for (int i5 = 0; i5 < iMin; i5++) {
                int i6 = bArr[i3] & 255;
                int i7 = i3 + 2;
                int i8 = bArr[i3 + 1] & 255;
                i3 += 3;
                int i9 = (i8 << 8) | (i6 << 16) | (bArr[i7] & 255);
                bArr2[i4] = bArr3[i9 >>> 18];
                bArr2[i4 + 1] = bArr3[(i9 >>> 12) & 63];
                int i10 = i4 + 3;
                bArr2[i4 + 2] = bArr3[(i9 >>> 6) & 63];
                i4 += 4;
                bArr2[i10] = bArr3[i9 & 63];
            }
            if (iMin == i2 && i3 != length) {
                int i11 = i4 + 1;
                byte[] bArr4 = g;
                bArr2[i4] = bArr4[0];
                i4 += 2;
                bArr2[i11] = bArr4[1];
            }
        }
        int i12 = length - i3;
        if (i12 == 1) {
            int i13 = i3 + 1;
            int i14 = (bArr[i3] & 255) << 4;
            bArr2[i4] = bArr3[i14 >>> 6];
            int i15 = i4 + 2;
            bArr2[i4 + 1] = bArr3[i14 & 63];
            if (fn0Var == fn0.PRESENT || fn0Var == fn0.PRESENT_OPTIONAL) {
                bArr2[i15] = 61;
                bArr2[i4 + 3] = 61;
            }
            i3 = i13;
        } else if (i12 == 2) {
            int i16 = ((bArr[i3 + 1] & 255) << 2) | ((bArr[i3] & 255) << 10);
            bArr2[i4] = bArr3[i16 >>> 12];
            int i17 = i4 + 2;
            bArr2[i4 + 1] = bArr3[(i16 >>> 6) & 63];
            int i18 = i4 + 3;
            bArr2[i17] = bArr3[i16 & 63];
            if (fn0Var == fn0.PRESENT || fn0Var == fn0.PRESENT_OPTIONAL) {
                bArr2[i18] = 61;
            }
            i3 = i;
        }
        if (i3 == length) {
            return new String(bArr2, wk1.e);
        }
        ygf.f("Check failed.");
        return null;
    }

    public final int c(int i) {
        int i2 = i / 3;
        int i3 = i % 3;
        int i4 = 4;
        int i5 = i2 * 4;
        if (i3 != 0) {
            fn0 fn0Var = fn0.PRESENT;
            fn0 fn0Var2 = this.d;
            if (fn0Var2 != fn0Var && fn0Var2 != fn0.PRESENT_OPTIONAL) {
                i4 = i3 + 1;
            }
            i5 += i4;
        }
        if (i5 < 0) {
            ay0.e("Input is too big");
            return 0;
        }
        if (this.b) {
            i5 += ((i5 - 1) / this.c) * 2;
        }
        if (i5 >= 0) {
            return i5;
        }
        ay0.e("Input is too big");
        return 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:55:0x0121  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x01c7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static byte[] a(defpackage.gn0 r20, java.lang.CharSequence r21, int r22, int r23) {
        /*
            Method dump skipped, instruction units count: 612
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gn0.a(gn0, java.lang.CharSequence, int, int):byte[]");
    }
}
