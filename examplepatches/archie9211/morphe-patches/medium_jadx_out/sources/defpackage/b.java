package defpackage;

import java.io.EOFException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class b {
    public static final byte[] a;
    public static final long[] b;

    static {
        byte[] bytes = "0123456789abcdef".getBytes(wk1.a);
        bytes.getClass();
        a = bytes;
        b = new long[]{-1, 9, 99, 999, 9999, 99999, 999999, 9999999, 99999999, 999999999, 9999999999L, 99999999999L, 999999999999L, 9999999999999L, 99999999999999L, 999999999999999L, 9999999999999999L, 99999999999999999L, 999999999999999999L, Long.MAX_VALUE};
    }

    public static final long a(kz0 kz0Var, h21 h21Var, long j, long j2, int i) {
        iwb iwbVar;
        long j3 = j;
        long j4 = j2;
        h21Var.getClass();
        long j5 = i;
        dm2.A(h21Var.e(), 0L, j5);
        if (i <= 0) {
            ay0.e("byteCount == 0");
            return 0L;
        }
        if (j3 < 0) {
            ywb.g(ho2.D(j3, "fromIndex < 0: "));
            return 0L;
        }
        if (j3 > j4) {
            StringBuilder sbD = b09.D("fromIndex > toIndex: ", " > ", j3);
            sbD.append(j4);
            throw new IllegalArgumentException(sbD.toString().toString());
        }
        long j6 = kz0Var.b;
        if (j4 > j6) {
            j4 = j6;
        }
        if (j3 == j4 || (iwbVar = kz0Var.a) == null) {
            return -1L;
        }
        long j7 = 0;
        if (j6 - j3 < j3) {
            while (j6 > j3) {
                iwbVar = iwbVar.g;
                iwbVar.getClass();
                j6 -= (long) (iwbVar.c - iwbVar.b);
            }
            byte[] bArrI = h21Var.i();
            byte b2 = bArrI[0];
            long jMin = Math.min(j4, (kz0Var.b - j5) + 1);
            while (j6 < jMin) {
                byte[] bArr = iwbVar.a;
                int iMin = (int) Math.min(iwbVar.c, (((long) iwbVar.b) + jMin) - j6);
                for (int i2 = (int) ((((long) iwbVar.b) + j3) - j6); i2 < iMin; i2++) {
                    if (bArr[i2] == b2 && b(iwbVar, i2 + 1, bArrI, 1, i)) {
                        return ((long) (i2 - iwbVar.b)) + j6;
                    }
                }
                j6 += (long) (iwbVar.c - iwbVar.b);
                iwbVar = iwbVar.f;
                iwbVar.getClass();
                j3 = j6;
            }
            return -1L;
        }
        while (true) {
            long j8 = j7 + ((long) (iwbVar.c - iwbVar.b));
            if (j8 > j3) {
                break;
            }
            iwbVar = iwbVar.f;
            iwbVar.getClass();
            j7 = j8;
        }
        byte[] bArrI2 = h21Var.i();
        byte b3 = bArrI2[0];
        long jMin2 = Math.min(j4, (kz0Var.b - j5) + 1);
        while (j7 < jMin2) {
            byte[] bArr2 = iwbVar.a;
            int iMin2 = (int) Math.min(iwbVar.c, (((long) iwbVar.b) + jMin2) - j7);
            for (int i3 = (int) ((((long) iwbVar.b) + j3) - j7); i3 < iMin2; i3++) {
                if (bArr2[i3] == b3 && b(iwbVar, i3 + 1, bArrI2, 1, i)) {
                    return ((long) (i3 - iwbVar.b)) + j7;
                }
            }
            j7 += (long) (iwbVar.c - iwbVar.b);
            iwbVar = iwbVar.f;
            iwbVar.getClass();
            j3 = j7;
        }
        return -1L;
    }

    public static final boolean b(iwb iwbVar, int i, byte[] bArr, int i2, int i3) {
        int i4 = iwbVar.c;
        byte[] bArr2 = iwbVar.a;
        while (i2 < i3) {
            if (i == i4) {
                iwbVar = iwbVar.f;
                iwbVar.getClass();
                byte[] bArr3 = iwbVar.a;
                bArr2 = bArr3;
                i = iwbVar.b;
                i4 = iwbVar.c;
            }
            if (bArr2[i] != bArr[i2]) {
                return false;
            }
            i++;
            i2++;
        }
        return true;
    }

    public static final String c(kz0 kz0Var, long j) throws EOFException {
        if (j > 0) {
            long j2 = j - 1;
            if (kz0Var.L(j2) == 13) {
                String strF0 = kz0Var.F0(j2, wk1.a);
                kz0Var.skip(2L);
                return strF0;
            }
        }
        String strF02 = kz0Var.F0(j, wk1.a);
        kz0Var.skip(1L);
        return strF02;
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x005a, code lost:
    
        if (r18 == false) goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x005c, code lost:
    
        return -2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x007c, code lost:
    
        return r9;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final int d(defpackage.kz0 r16, defpackage.dw8 r17, boolean r18) {
        /*
            r17.getClass()
            r0 = r16
            iwb r0 = r0.a
            r1 = -1
            if (r0 != 0) goto Le
            if (r18 == 0) goto Ld
            goto L5c
        Ld:
            return r1
        Le:
            byte[] r2 = r0.a
            int r3 = r0.b
            int r4 = r0.c
            r5 = r17
            int[] r5 = r5.b
            r6 = 0
            r8 = r0
            r9 = r1
            r7 = r6
        L1c:
            int r10 = r7 + 1
            r11 = r5[r7]
            int r7 = r7 + 2
            r10 = r5[r10]
            if (r10 == r1) goto L27
            r9 = r10
        L27:
            if (r8 != 0) goto L2a
            goto L5a
        L2a:
            r10 = 0
            if (r11 >= 0) goto L72
            int r11 = r11 * (-1)
            int r12 = r11 + r7
        L31:
            int r11 = r3 + 1
            r3 = r2[r3]
            r3 = r3 & 255(0xff, float:3.57E-43)
            int r13 = r7 + 1
            r7 = r5[r7]
            if (r3 == r7) goto L3e
            goto L7c
        L3e:
            if (r13 != r12) goto L42
            r3 = 1
            goto L43
        L42:
            r3 = r6
        L43:
            if (r11 != r4) goto L62
            r8.getClass()
            iwb r2 = r8.f
            r2.getClass()
            int r4 = r2.b
            byte[] r7 = r2.a
            int r8 = r2.c
            if (r2 != r0) goto L5e
            if (r3 == 0) goto L5a
            r2 = r7
            r7 = r10
            goto L65
        L5a:
            if (r18 == 0) goto L7c
        L5c:
            r0 = -2
            return r0
        L5e:
            r15 = r7
            r7 = r2
            r2 = r15
            goto L65
        L62:
            r7 = r8
            r8 = r4
            r4 = r11
        L65:
            if (r3 == 0) goto L6d
            r3 = r5[r13]
            r15 = r8
            r8 = r7
            r7 = r15
            goto L9e
        L6d:
            r3 = r4
            r4 = r8
            r8 = r7
            r7 = r13
            goto L31
        L72:
            int r12 = r3 + 1
            r3 = r2[r3]
            r3 = r3 & 255(0xff, float:3.57E-43)
            int r13 = r7 + r11
        L7a:
            if (r7 != r13) goto L7d
        L7c:
            return r9
        L7d:
            r14 = r5[r7]
            if (r3 != r14) goto La8
            int r7 = r7 + r11
            r3 = r5[r7]
            if (r12 != r4) goto L9c
            iwb r8 = r8.f
            r8.getClass()
            int r2 = r8.b
            byte[] r4 = r8.a
            int r7 = r8.c
            if (r8 != r0) goto L98
            r8 = r4
            r4 = r2
            r2 = r8
            r8 = r10
            goto L9e
        L98:
            r15 = r4
            r4 = r2
            r2 = r15
            goto L9e
        L9c:
            r7 = r4
            r4 = r12
        L9e:
            if (r3 < 0) goto La1
            return r3
        La1:
            int r3 = -r3
            r15 = r7
            r7 = r3
            r3 = r4
            r4 = r15
            goto L1c
        La8:
            int r7 = r7 + 1
            goto L7a
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b.d(kz0, dw8, boolean):int");
    }
}
