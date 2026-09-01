package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p68 {
    public long[] a = hqb.a;
    public long[] b = za7.a;
    public Object[] c = vc2.h;
    public int d;
    public int e;
    public int f;

    public p68(int i) {
        if (i >= 0) {
            e(hqb.d(i));
        } else {
            ay0.e("Capacity must be a positive value.");
            throw null;
        }
    }

    public final void a() {
        this.e = 0;
        long[] jArr = this.a;
        if (jArr != hqb.a) {
            k80.r0(jArr, -9187201950435737472L);
            long[] jArr2 = this.a;
            int i = this.d;
            int i2 = i >> 3;
            long j = 255 << ((i & 7) << 3);
            jArr2[i2] = (jArr2[i2] & (~j)) | j;
        }
        k80.o0(0, this.d, null, this.c);
        this.f = hqb.a(this.d) - this.e;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0069, code lost:
    
        if (((r6 & ((~r6) << 6)) & (-9187201950435737472L)) == 0) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x006b, code lost:
    
        r10 = -1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean b(long r18) {
        /*
            r17 = this;
            r0 = r17
            r1 = 32
            long r1 = r18 >>> r1
            long r1 = r18 ^ r1
            int r1 = (int) r1
            r2 = -862048943(0xffffffffcc9e2d51, float:-8.293031E7)
            int r1 = r1 * r2
            int r2 = r1 << 16
            r1 = r1 ^ r2
            r2 = r1 & 127(0x7f, float:1.78E-43)
            int r3 = r0.d
            int r1 = r1 >>> 7
            r1 = r1 & r3
            r4 = 0
            r5 = r4
        L19:
            long[] r6 = r0.a
            int r7 = r1 >> 3
            r8 = r1 & 7
            int r8 = r8 << 3
            r9 = r6[r7]
            long r9 = r9 >>> r8
            r11 = 1
            int r7 = r7 + r11
            r12 = r6[r7]
            int r6 = 64 - r8
            long r6 = r12 << r6
            long r12 = (long) r8
            long r12 = -r12
            r8 = 63
            long r12 = r12 >> r8
            long r6 = r6 & r12
            long r6 = r6 | r9
            long r8 = (long) r2
            r12 = 72340172838076673(0x101010101010101, double:7.748604185489348E-304)
            long r8 = r8 * r12
            long r8 = r8 ^ r6
            long r12 = r8 - r12
            long r8 = ~r8
            long r8 = r8 & r12
            r12 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r8 = r8 & r12
        L45:
            r14 = 0
            int r10 = (r8 > r14 ? 1 : (r8 == r14 ? 0 : -1))
            if (r10 == 0) goto L62
            int r10 = java.lang.Long.numberOfTrailingZeros(r8)
            int r10 = r10 >> 3
            int r10 = r10 + r1
            r10 = r10 & r3
            long[] r14 = r0.b
            r15 = r14[r10]
            int r14 = (r15 > r18 ? 1 : (r15 == r18 ? 0 : -1))
            if (r14 != 0) goto L5c
            goto L6c
        L5c:
            r14 = 1
            long r14 = r8 - r14
            long r8 = r8 & r14
            goto L45
        L62:
            long r8 = ~r6
            r10 = 6
            long r8 = r8 << r10
            long r6 = r6 & r8
            long r6 = r6 & r12
            int r6 = (r6 > r14 ? 1 : (r6 == r14 ? 0 : -1))
            if (r6 == 0) goto L70
            r10 = -1
        L6c:
            if (r10 < 0) goto L6f
            return r11
        L6f:
            return r4
        L70:
            int r5 = r5 + 8
            int r1 = r1 + r5
            r1 = r1 & r3
            goto L19
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p68.b(long):boolean");
    }

    public final int c(int i) {
        int i2 = this.d;
        int i3 = i & i2;
        int i4 = 0;
        while (true) {
            long[] jArr = this.a;
            int i5 = i3 >> 3;
            int i6 = (i3 & 7) << 3;
            long j = ((jArr[i5 + 1] << (64 - i6)) & ((-i6) >> 63)) | (jArr[i5] >>> i6);
            long j2 = j & ((~j) << 7) & (-9187201950435737472L);
            if (j2 != 0) {
                return (i3 + (Long.numberOfTrailingZeros(j2) >> 3)) & i2;
            }
            i4 += 8;
            i3 = (i3 + i4) & i2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0065, code lost:
    
        if (((r4 & ((~r4) << 6)) & (-9187201950435737472L)) == 0) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0067, code lost:
    
        r10 = -1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(long r15) {
        /*
            r14 = this;
            r0 = 32
            long r0 = r15 >>> r0
            long r0 = r0 ^ r15
            int r0 = (int) r0
            r1 = -862048943(0xffffffffcc9e2d51, float:-8.293031E7)
            int r0 = r0 * r1
            int r1 = r0 << 16
            r0 = r0 ^ r1
            r1 = r0 & 127(0x7f, float:1.78E-43)
            int r2 = r14.d
            int r0 = r0 >>> 7
            r0 = r0 & r2
            r3 = 0
        L15:
            long[] r4 = r14.a
            int r5 = r0 >> 3
            r6 = r0 & 7
            int r6 = r6 << 3
            r7 = r4[r5]
            long r7 = r7 >>> r6
            int r5 = r5 + 1
            r9 = r4[r5]
            int r4 = 64 - r6
            long r4 = r9 << r4
            long r9 = (long) r6
            long r9 = -r9
            r6 = 63
            long r9 = r9 >> r6
            long r4 = r4 & r9
            long r4 = r4 | r7
            long r6 = (long) r1
            r8 = 72340172838076673(0x101010101010101, double:7.748604185489348E-304)
            long r6 = r6 * r8
            long r6 = r6 ^ r4
            long r8 = r6 - r8
            long r6 = ~r6
            long r6 = r6 & r8
            r8 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r6 = r6 & r8
        L41:
            r10 = 0
            int r12 = (r6 > r10 ? 1 : (r6 == r10 ? 0 : -1))
            if (r12 == 0) goto L5e
            int r10 = java.lang.Long.numberOfTrailingZeros(r6)
            int r10 = r10 >> 3
            int r10 = r10 + r0
            r10 = r10 & r2
            long[] r11 = r14.b
            r12 = r11[r10]
            int r11 = (r12 > r15 ? 1 : (r12 == r15 ? 0 : -1))
            if (r11 != 0) goto L58
            goto L68
        L58:
            r10 = 1
            long r10 = r6 - r10
            long r6 = r6 & r10
            goto L41
        L5e:
            long r6 = ~r4
            r12 = 6
            long r6 = r6 << r12
            long r4 = r4 & r6
            long r4 = r4 & r8
            int r4 = (r4 > r10 ? 1 : (r4 == r10 ? 0 : -1))
            if (r4 == 0) goto L71
            r10 = -1
        L68:
            if (r10 < 0) goto L6f
            java.lang.Object[] r14 = r14.c
            r14 = r14[r10]
            return r14
        L6f:
            r14 = 0
            return r14
        L71:
            int r3 = r3 + 8
            int r0 = r0 + r3
            r0 = r0 & r2
            goto L15
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p68.d(long):java.lang.Object");
    }

    public final void e(int i) {
        long[] jArr;
        int iMax = i > 0 ? Math.max(7, hqb.c(i)) : 0;
        this.d = iMax;
        if (iMax == 0) {
            jArr = hqb.a;
        } else {
            int i2 = ((iMax + 15) & (-8)) >> 3;
            long[] jArr2 = new long[i2];
            Arrays.fill(jArr2, 0, i2, -9187201950435737472L);
            jArr = jArr2;
        }
        this.a = jArr;
        int i3 = iMax >> 3;
        long j = 255 << ((iMax & 7) << 3);
        jArr[i3] = (jArr[i3] & (~j)) | j;
        this.f = hqb.a(this.d) - this.e;
        this.b = new long[iMax];
        this.c = new Object[iMax];
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x005d, code lost:
    
        return false;
     */
    /* JADX WARN: Removed duplicated region for block: B:32:0x006f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r18) {
        /*
            r17 = this;
            r0 = r17
            r1 = r18
            r2 = 1
            if (r1 != r0) goto L8
            return r2
        L8:
            boolean r3 = r1 instanceof defpackage.p68
            r4 = 0
            if (r3 != 0) goto Le
            return r4
        Le:
            p68 r1 = (defpackage.p68) r1
            int r3 = r1.e
            int r5 = r0.e
            if (r3 == r5) goto L17
            return r4
        L17:
            long[] r3 = r0.b
            java.lang.Object[] r5 = r0.c
            long[] r0 = r0.a
            int r6 = r0.length
            int r6 = r6 + (-2)
            if (r6 < 0) goto L74
            r7 = r4
        L23:
            r8 = r0[r7]
            long r10 = ~r8
            r12 = 7
            long r10 = r10 << r12
            long r10 = r10 & r8
            r12 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r10 = r10 & r12
            int r10 = (r10 > r12 ? 1 : (r10 == r12 ? 0 : -1))
            if (r10 == 0) goto L6f
            int r10 = r7 - r6
            int r10 = ~r10
            int r10 = r10 >>> 31
            r11 = 8
            int r10 = 8 - r10
            r12 = r4
        L3d:
            if (r12 >= r10) goto L6d
            r13 = 255(0xff, double:1.26E-321)
            long r13 = r13 & r8
            r15 = 128(0x80, double:6.3E-322)
            int r13 = (r13 > r15 ? 1 : (r13 == r15 ? 0 : -1))
            if (r13 >= 0) goto L69
            int r13 = r7 << 3
            int r13 = r13 + r12
            r14 = r3[r13]
            r13 = r5[r13]
            if (r13 != 0) goto L5e
            java.lang.Object r13 = r1.d(r14)
            if (r13 != 0) goto L5d
            boolean r13 = r1.b(r14)
            if (r13 != 0) goto L69
        L5d:
            return r4
        L5e:
            java.lang.Object r14 = r1.d(r14)
            boolean r13 = r13.equals(r14)
            if (r13 != 0) goto L69
            return r4
        L69:
            long r8 = r8 >> r11
            int r12 = r12 + 1
            goto L3d
        L6d:
            if (r10 != r11) goto L74
        L6f:
            if (r7 == r6) goto L74
            int r7 = r7 + 1
            goto L23
        L74:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p68.equals(java.lang.Object):boolean");
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0065, code lost:
    
        if (((r4 & ((~r4) << 6)) & (-9187201950435737472L)) == 0) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0067, code lost:
    
        r10 = -1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(long r15) {
        /*
            r14 = this;
            r0 = 32
            long r0 = r15 >>> r0
            long r0 = r0 ^ r15
            int r0 = (int) r0
            r1 = -862048943(0xffffffffcc9e2d51, float:-8.293031E7)
            int r0 = r0 * r1
            int r1 = r0 << 16
            r0 = r0 ^ r1
            r1 = r0 & 127(0x7f, float:1.78E-43)
            int r2 = r14.d
            int r0 = r0 >>> 7
            r0 = r0 & r2
            r3 = 0
        L15:
            long[] r4 = r14.a
            int r5 = r0 >> 3
            r6 = r0 & 7
            int r6 = r6 << 3
            r7 = r4[r5]
            long r7 = r7 >>> r6
            int r5 = r5 + 1
            r9 = r4[r5]
            int r4 = 64 - r6
            long r4 = r9 << r4
            long r9 = (long) r6
            long r9 = -r9
            r6 = 63
            long r9 = r9 >> r6
            long r4 = r4 & r9
            long r4 = r4 | r7
            long r6 = (long) r1
            r8 = 72340172838076673(0x101010101010101, double:7.748604185489348E-304)
            long r6 = r6 * r8
            long r6 = r6 ^ r4
            long r8 = r6 - r8
            long r6 = ~r6
            long r6 = r6 & r8
            r8 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r6 = r6 & r8
        L41:
            r10 = 0
            int r12 = (r6 > r10 ? 1 : (r6 == r10 ? 0 : -1))
            if (r12 == 0) goto L5e
            int r10 = java.lang.Long.numberOfTrailingZeros(r6)
            int r10 = r10 >> 3
            int r10 = r10 + r0
            r10 = r10 & r2
            long[] r11 = r14.b
            r12 = r11[r10]
            int r11 = (r12 > r15 ? 1 : (r12 == r15 ? 0 : -1))
            if (r11 != 0) goto L58
            goto L68
        L58:
            r10 = 1
            long r10 = r6 - r10
            long r6 = r6 & r10
            goto L41
        L5e:
            long r6 = ~r4
            r12 = 6
            long r6 = r6 << r12
            long r4 = r4 & r6
            long r4 = r4 & r8
            int r4 = (r4 > r10 ? 1 : (r4 == r10 ? 0 : -1))
            if (r4 == 0) goto L9a
            r10 = -1
        L68:
            r0 = 0
            if (r10 < 0) goto L99
            int r1 = r14.e
            int r1 = r1 + (-1)
            r14.e = r1
            long[] r1 = r14.a
            int r2 = r14.d
            int r3 = r10 >> 3
            r4 = r10 & 7
            int r4 = r4 << 3
            r5 = r1[r3]
            r7 = 255(0xff, double:1.26E-321)
            long r7 = r7 << r4
            long r7 = ~r7
            long r5 = r5 & r7
            r7 = 254(0xfe, double:1.255E-321)
            long r7 = r7 << r4
            long r5 = r5 | r7
            r1[r3] = r5
            int r3 = r10 + (-7)
            r3 = r3 & r2
            r2 = r2 & 7
            int r3 = r3 + r2
            int r2 = r3 >> 3
            r1[r2] = r5
            java.lang.Object[] r14 = r14.c
            r1 = r14[r10]
            r14[r10] = r0
            return r1
        L99:
            return r0
        L9a:
            int r3 = r3 + 8
            int r0 = r0 + r3
            r0 = r0 & r2
            goto L15
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p68.f(long):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0072, code lost:
    
        r20 = r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:11:0x007d, code lost:
    
        if (((((~r7) << 6) & r7) & (-9187201950435737472L)) == 0) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x007f, code lost:
    
        r1 = c(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0089, code lost:
    
        if (r39.f != 0) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x009d, code lost:
    
        if (((r39.a[r1 >> 3] >> ((r1 & 7) << 3)) & 255) != 254) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x009f, code lost:
    
        r29 = 255;
        r33 = 1;
        r25 = 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x00a7, code lost:
    
        r1 = r39.d;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x00a9, code lost:
    
        if (r1 <= 8) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x00ab, code lost:
    
        r25 = 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x00c5, code lost:
    
        if (java.lang.Long.compare((((long) r39.e) * 32) ^ Long.MIN_VALUE, (((long) r1) * 25) ^ Long.MIN_VALUE) > 0) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x00c7, code lost:
    
        r1 = r39.a;
        r2 = r39.d;
        r3 = r39.b;
        r5 = r39.c;
        r6 = (r2 + 7) >> 3;
        r29 = 255;
        r7 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x00d6, code lost:
    
        if (r7 >= r6) goto L62;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x00d8, code lost:
    
        r33 = r11;
        r11 = r1[r7] & r33;
        r1[r7] = (-72340172838076674L) & ((~r11) + (r11 >>> 7));
        r7 = r7 + 1;
        r14 = r14;
        r13 = r13;
        r11 = r33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x00f5, code lost:
    
        r22 = r13;
        r8 = r14;
        r6 = defpackage.k80.w0(r1);
        r7 = r6 - 1;
        r13 = 72057594037927935L;
        r1[r7] = (r1[r7] & 72057594037927935L) | (-72057594037927936L);
        r1[r6] = r1[0];
        r6 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0111, code lost:
    
        if (r6 == r2) goto L63;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0113, code lost:
    
        r7 = r6 >> 3;
        r19 = (r6 & 7) << 3;
        r11 = (r1[r7] >> r19) & 255;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0121, code lost:
    
        if (r11 != 128) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0123, code lost:
    
        r6 = r6 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0128, code lost:
    
        if (r11 == 254) goto L64;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x012b, code lost:
    
        r11 = r3[r6];
        r11 = ((int) (r11 ^ (r11 >>> r22))) * r20;
        r11 = r11 ^ (r11 << 16);
        r12 = r11 >>> 7;
        r31 = c(r12);
        r12 = r12 & r2;
        r33 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x014b, code lost:
    
        if ((((r31 - r12) & r2) / 8) != (((r6 - r12) & r2) / 8)) goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x014d, code lost:
    
        r34 = r13;
        r1[r7] = (((long) (r11 & 127)) << r19) | (r1[r7] & (~(255 << r19)));
        r1[r1.length - 1] = (r1[0] & r34) | Long.MIN_VALUE;
        r6 = r6 + 1;
        r8 = r33;
        r13 = r34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x0170, code lost:
    
        r34 = r13;
        r8 = r31 >> 3;
        r12 = r1[r8];
        r14 = (r31 & 7) << 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0180, code lost:
    
        if (((r12 >> r14) & 255) != 128) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0182, code lost:
    
        r32 = r2;
        r36 = r3;
        r1[r8] = ((~(255 << r14)) & r12) | (((long) (r11 & 127)) << r14);
        r1[r7] = (r1[r7] & (~(255 << r19))) | (128 << r19);
        r36[r31] = r36[r6];
        r36[r6] = 0;
        r5[r31] = r5[r6];
        r5[r6] = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x01ad, code lost:
    
        r32 = r2;
        r36 = r3;
        r1[r8] = ((~(255 << r14)) & r12) | (((long) (r11 & 127)) << r14);
        r2 = r36[r31];
        r36[r31] = r36[r6];
        r36[r6] = r2;
        r2 = r5[r31];
        r5[r31] = r5[r6];
        r5[r6] = r2;
        r6 = r6 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x01d1, code lost:
    
        r1[r1.length - 1] = (r1[0] & r34) | Long.MIN_VALUE;
        r6 = r6 + 1;
        r2 = r32;
        r8 = r33;
        r13 = r34;
        r3 = r36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x01e8, code lost:
    
        r33 = r8;
        r39.f = defpackage.hqb.a(r39.d) - r39.e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x01f7, code lost:
    
        r29 = 255;
        r33 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x01fe, code lost:
    
        r25 = 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0201, code lost:
    
        r1 = defpackage.hqb.b(r39.d);
        r2 = r39.a;
        r3 = r39.b;
        r5 = r39.c;
        r6 = r39.d;
        e(r1);
        r1 = r39.a;
        r7 = r39.b;
        r8 = r39.c;
        r11 = r39.d;
        r12 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x021b, code lost:
    
        if (r12 >= r6) goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x022b, code lost:
    
        if (((r2[r12 >> 3] >> ((r12 & 7) << 3)) & 255) >= r25) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x022d, code lost:
    
        r13 = r3[r12];
        r21 = r1;
        r19 = r2;
        r1 = ((int) (r13 ^ (r13 >>> r13))) * r20;
        r1 = r1 ^ (r1 << 16);
        r2 = c(r1 >>> 7);
        r18 = r2 >> 3;
        r23 = (r2 & 7) << 3;
        r1 = (r21[r18] & (~(255 << r23))) | (((long) (r1 & 127)) << r23);
        r21[r18] = r1;
        r21[(((r2 - 7) & r11) + (r11 & 7)) >> 3] = r1;
        r7[r2] = r13;
        r8[r2] = r5[r12];
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x0270, code lost:
    
        r21 = r1;
        r19 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0274, code lost:
    
        r12 = r12 + 1;
        r2 = r19;
        r1 = r21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x027b, code lost:
    
        r1 = c(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x027f, code lost:
    
        r17 = r1;
        r39.e++;
        r1 = r39.f;
        r2 = r39.a;
        r3 = r17 >> 3;
        r4 = r2[r3];
        r6 = (r17 & 7) << 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0299, code lost:
    
        if (((r4 >> r6) & r29) != r25) goto L54;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x029b, code lost:
    
        r7 = r33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x029e, code lost:
    
        r7 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x029f, code lost:
    
        r39.f = r1 - r7;
        r1 = r39.d;
        r4 = (r4 & (~(r29 << r6))) | (r9 << r6);
        r2[r3] = r4;
        r2[(((r17 - 7) & r1) + (r1 & 7)) >> 3] = r4;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void g(long r40, java.lang.Object r42) {
        /*
            Method dump skipped, instruction units count: 720
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p68.g(long, java.lang.Object):void");
    }

    public final int hashCode() {
        long[] jArr = this.b;
        Object[] objArr = this.c;
        long[] jArr2 = this.a;
        int length = jArr2.length - 2;
        if (length < 0) {
            return 0;
        }
        int i = 0;
        int iHashCode = 0;
        while (true) {
            long j = jArr2[i];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i2 = 8 - ((~(i - length)) >>> 31);
                for (int i3 = 0; i3 < i2; i3++) {
                    if ((255 & j) < 128) {
                        int i4 = (i << 3) + i3;
                        long j2 = jArr[i4];
                        Object obj = objArr[i4];
                        iHashCode += (obj != null ? obj.hashCode() : 0) ^ ((int) (j2 ^ (j2 >>> 32)));
                    }
                    j >>= 8;
                }
                if (i2 != 8) {
                    return iHashCode;
                }
            }
            if (i == length) {
                return iHashCode;
            }
            i++;
        }
    }

    public final String toString() {
        int i;
        int i2;
        if (this.e == 0) {
            return "{}";
        }
        StringBuilder sb = new StringBuilder("{");
        long[] jArr = this.b;
        Object[] objArr = this.c;
        long[] jArr2 = this.a;
        int length = jArr2.length - 2;
        if (length >= 0) {
            int i3 = 0;
            int i4 = 0;
            while (true) {
                long j = jArr2[i3];
                if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i5 = 8 - ((~(i3 - length)) >>> 31);
                    int i6 = 0;
                    while (i6 < i5) {
                        if ((255 & j) < 128) {
                            int i7 = (i3 << 3) + i6;
                            i2 = i3;
                            long j2 = jArr[i7];
                            Object obj = objArr[i7];
                            sb.append(j2);
                            sb.append("=");
                            if (obj == this) {
                                obj = "(this)";
                            }
                            sb.append(obj);
                            i4++;
                            if (i4 < this.e) {
                                sb.append(", ");
                            }
                        } else {
                            i2 = i3;
                        }
                        j >>= 8;
                        i6++;
                        i3 = i2;
                    }
                    int i8 = i3;
                    if (i5 != 8) {
                        break;
                    }
                    i = i8;
                } else {
                    i = i3;
                }
                if (i == length) {
                    break;
                }
                i3 = i + 1;
            }
        }
        sb.append('}');
        return sb.toString();
    }
}
