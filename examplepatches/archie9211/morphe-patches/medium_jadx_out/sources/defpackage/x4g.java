package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x4g {
    public final String a;
    public final char[] b;
    public final int c;
    public final int d;
    public final int e;
    public final int f;
    public final byte[] g;
    public final boolean h;

    /* JADX WARN: Removed duplicated region for block: B:18:0x0061 A[LOOP:0: B:16:0x005d->B:18:0x0061, LOOP_END] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public x4g(java.lang.String r4, char[] r5, byte[] r6, boolean r7) {
        /*
            r3 = this;
            r3.<init>()
            r3.a = r4
            r5.getClass()
            r3.b = r5
            int r4 = r5.length     // Catch: java.lang.ArithmeticException -> L73
            java.math.RoundingMode r0 = java.math.RoundingMode.UNNECESSARY     // Catch: java.lang.ArithmeticException -> L73
            if (r4 <= 0) goto L7d
            int[] r1 = defpackage.i5g.a     // Catch: java.lang.ArithmeticException -> L73
            int r0 = r0.ordinal()     // Catch: java.lang.ArithmeticException -> L73
            r0 = r1[r0]     // Catch: java.lang.ArithmeticException -> L73
            switch(r0) {
                case 1: goto L38;
                case 2: goto L3d;
                case 3: goto L3d;
                case 4: goto L2f;
                case 5: goto L2f;
                case 6: goto L20;
                case 7: goto L20;
                case 8: goto L20;
                default: goto L1a;
            }     // Catch: java.lang.ArithmeticException -> L73
        L1a:
            java.lang.AssertionError r3 = new java.lang.AssertionError     // Catch: java.lang.ArithmeticException -> L73
            r3.<init>()     // Catch: java.lang.ArithmeticException -> L73
            throw r3     // Catch: java.lang.ArithmeticException -> L73
        L20:
            int r0 = java.lang.Integer.numberOfLeadingZeros(r4)     // Catch: java.lang.ArithmeticException -> L73
            r1 = -1257966797(0xffffffffb504f333, float:-4.9527733E-7)
            int r1 = r1 >>> r0
            int r0 = 31 - r0
            int r1 = r1 - r4
            int r1 = r1 >>> 31
            int r0 = r0 + r1
            goto L43
        L2f:
            int r0 = r4 + (-1)
            int r0 = java.lang.Integer.numberOfLeadingZeros(r0)     // Catch: java.lang.ArithmeticException -> L73
            int r0 = 32 - r0
            goto L43
        L38:
            int r0 = r4 + (-1)
            r0 = r0 & r4
            if (r0 != 0) goto L75
        L3d:
            int r0 = java.lang.Integer.numberOfLeadingZeros(r4)     // Catch: java.lang.ArithmeticException -> L73
            int r0 = 31 - r0
        L43:
            r3.d = r0     // Catch: java.lang.ArithmeticException -> L73
            int r5 = java.lang.Integer.numberOfTrailingZeros(r0)
            int r1 = 3 - r5
            r2 = 1
            int r1 = r2 << r1
            r3.e = r1
            int r5 = r0 >> r5
            r3.f = r5
            int r4 = r4 + (-1)
            r3.c = r4
            r3.g = r6
            boolean[] r4 = new boolean[r1]
            r5 = 0
        L5d:
            int r6 = r3.f
            if (r5 >= r6) goto L70
            int r6 = r5 * 8
            int r0 = r3.d
            java.math.RoundingMode r1 = java.math.RoundingMode.CEILING
            int r6 = defpackage.qo7.F(r6, r0)
            r4[r6] = r2
            int r5 = r5 + 1
            goto L5d
        L70:
            r3.h = r7
            return
        L73:
            r3 = move-exception
            goto L85
        L75:
            java.lang.ArithmeticException r3 = new java.lang.ArithmeticException     // Catch: java.lang.ArithmeticException -> L73
            java.lang.String r4 = "mode was UNNECESSARY, but rounding was necessary"
            r3.<init>(r4)     // Catch: java.lang.ArithmeticException -> L73
            throw r3     // Catch: java.lang.ArithmeticException -> L73
        L7d:
            java.lang.IllegalArgumentException r3 = new java.lang.IllegalArgumentException     // Catch: java.lang.ArithmeticException -> L73
            java.lang.String r4 = "x (0) must be > 0"
            r3.<init>(r4)     // Catch: java.lang.ArithmeticException -> L73
            throw r3     // Catch: java.lang.ArithmeticException -> L73
        L85:
            int r4 = r5.length
            java.lang.IllegalArgumentException r5 = new java.lang.IllegalArgumentException
            java.lang.String r6 = "Illegal alphabet length "
            java.lang.String r4 = defpackage.b09.w(r4, r6)
            r5.<init>(r4, r3)
            throw r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.x4g.<init>(java.lang.String, char[], byte[], boolean):void");
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof x4g)) {
            return false;
        }
        x4g x4gVar = (x4g) obj;
        return this.h == x4gVar.h && Arrays.equals(this.b, x4gVar.b);
    }

    public final int hashCode() {
        return Arrays.hashCode(this.b) + (true != this.h ? 1237 : 1231);
    }

    public final String toString() {
        return this.a;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public x4g(String str, char[] cArr) {
        byte[] bArr = new byte[128];
        Arrays.fill(bArr, (byte) -1);
        for (int i = 0; i < cArr.length; i++) {
            char c = cArr[i];
            if (!(c < 128)) {
                ay0.e(qq7.H("Non-ASCII character: %s", Character.valueOf(c)));
                throw null;
            }
            if (!(bArr[c] == -1)) {
                ay0.e(qq7.H("Duplicate character: %s", Character.valueOf(c)));
                throw null;
            }
            bArr[c] = (byte) i;
        }
        this(str, cArr, bArr, false);
    }
}
