package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i68 {
    public long[] a;
    public int[] b;
    public int[] c;
    public int d;
    public int e;
    public int f;

    public i68(int i) {
        this.a = hqb.a;
        int[] iArr = r46.a;
        this.b = iArr;
        this.c = iArr;
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
        this.f = hqb.a(this.d) - this.e;
    }

    public final int b(int i) {
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

    public final int c(int i) {
        int i2 = (-862048943) * i;
        int i3 = i2 ^ (i2 << 16);
        int i4 = i3 & 127;
        int i5 = this.d;
        int i6 = (i3 >>> 7) & i5;
        int i7 = 0;
        while (true) {
            long[] jArr = this.a;
            int i8 = i6 >> 3;
            int i9 = (i6 & 7) << 3;
            long j = ((jArr[i8 + 1] << (64 - i9)) & ((-i9) >> 63)) | (jArr[i8] >>> i9);
            long j2 = (((long) i4) * 72340172838076673L) ^ j;
            for (long j3 = (~j2) & (j2 - 72340172838076673L) & (-9187201950435737472L); j3 != 0; j3 &= j3 - 1) {
                int iNumberOfTrailingZeros = ((Long.numberOfTrailingZeros(j3) >> 3) + i6) & i5;
                if (this.b[iNumberOfTrailingZeros] == i) {
                    return iNumberOfTrailingZeros;
                }
            }
            if ((j & ((~j) << 6) & (-9187201950435737472L)) != 0) {
                return -1;
            }
            i7 += 8;
            i6 = (i6 + i7) & i5;
        }
    }

    public final int d(int i) {
        int iC = c(i);
        if (iC >= 0) {
            return this.c[iC];
        }
        return -1;
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
        this.b = new int[iMax];
        this.c = new int[iMax];
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x005b, code lost:
    
        return false;
     */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0062  */
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
            boolean r3 = r1 instanceof defpackage.i68
            r4 = 0
            if (r3 != 0) goto Le
            return r4
        Le:
            i68 r1 = (defpackage.i68) r1
            int r3 = r1.e
            int r5 = r0.e
            if (r3 == r5) goto L17
            return r4
        L17:
            int[] r3 = r0.b
            int[] r5 = r0.c
            long[] r0 = r0.a
            int r6 = r0.length
            int r6 = r6 + (-2)
            if (r6 < 0) goto L67
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
            if (r10 == 0) goto L62
            int r10 = r7 - r6
            int r10 = ~r10
            int r10 = r10 >>> 31
            r11 = 8
            int r10 = 8 - r10
            r12 = r4
        L3d:
            if (r12 >= r10) goto L60
            r13 = 255(0xff, double:1.26E-321)
            long r13 = r13 & r8
            r15 = 128(0x80, double:6.3E-322)
            int r13 = (r13 > r15 ? 1 : (r13 == r15 ? 0 : -1))
            if (r13 >= 0) goto L5c
            int r13 = r7 << 3
            int r13 = r13 + r12
            r14 = r3[r13]
            r13 = r5[r13]
            int r14 = r1.c(r14)
            if (r14 < 0) goto L5b
            int[] r15 = r1.c
            r14 = r15[r14]
            if (r13 == r14) goto L5c
        L5b:
            return r4
        L5c:
            long r8 = r8 >> r11
            int r12 = r12 + 1
            goto L3d
        L60:
            if (r10 != r11) goto L67
        L62:
            if (r7 == r6) goto L67
            int r7 = r7 + 1
            goto L23
        L67:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.i68.equals(java.lang.Object):boolean");
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x006d, code lost:
    
        r20 = r11;
        r3 = '\b';
     */
    /* JADX WARN: Code restructure failed: missing block: B:11:0x0079, code lost:
    
        if (((((~r7) << 6) & r7) & r20) == 0) goto L61;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x007b, code lost:
    
        r2 = b(r4);
        r11 = 255;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0083, code lost:
    
        if (r36.f != 0) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0097, code lost:
    
        if (((r36.a[r2 >> 3] >> ((r2 & 7) << 3)) & 255) != 254) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0099, code lost:
    
        r22 = r9;
        r28 = 255;
        r26 = 1;
        r16 = 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x00a5, code lost:
    
        r2 = r36.d;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x00a7, code lost:
    
        if (r2 <= 8) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x00a9, code lost:
    
        r16 = 128;
        r22 = r9;
        r5 = 7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x00c4, code lost:
    
        if (java.lang.Long.compare((((long) r36.e) * 32) ^ Long.MIN_VALUE, (((long) r2) * 25) ^ Long.MIN_VALUE) > 0) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x00c6, code lost:
    
        r2 = r36.a;
        r6 = r36.d;
        r7 = r36.b;
        r8 = r36.c;
        r9 = (r6 + 7) >> 3;
        r10 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x00d3, code lost:
    
        if (r10 >= r9) goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x00d5, code lost:
    
        r28 = r11;
        r11 = r2[r10] & r20;
        r2[r10] = (-72340172838076674L) & ((~r11) + (r11 >>> 7));
        r10 = r10 + 1;
        r14 = r14;
        r13 = r13;
        r11 = r28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x00f3, code lost:
    
        r28 = r11;
        r27 = r13;
        r26 = r14;
        r9 = defpackage.k80.w0(r2);
        r10 = r9 - 1;
        r13 = 72057594037927935L;
        r2[r10] = (r2[r10] & 72057594037927935L) | (-72057594037927936L);
        r2[r9] = r2[0];
        r9 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0112, code lost:
    
        if (r9 == r6) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0114, code lost:
    
        r10 = r9 >> 3;
        r20 = (r9 & 7) << 3;
        r11 = (r2[r10] >> r20) & r28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0122, code lost:
    
        if (r11 != 128) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0124, code lost:
    
        r9 = r9 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0129, code lost:
    
        if (r11 == 254) goto L67;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x012c, code lost:
    
        r11 = r7[r9] * r27;
        r11 = r11 ^ (r11 << 16);
        r12 = r11 >>> 7;
        r21 = b(r12);
        r12 = r12 & r6;
        r31 = r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0147, code lost:
    
        if ((((r21 - r12) & r6) / 8) != (((r9 - r12) & r6) / 8)) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0149, code lost:
    
        r2[r10] = (r2[r10] & (~(r28 << r20))) | (((long) (r11 & 127)) << r20);
        r2[r2.length - 1] = (r2[0] & r13) | Long.MIN_VALUE;
        r9 = r9 + 1;
        r5 = r5;
        r6 = r6;
        r3 = r31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x016d, code lost:
    
        r3 = r5;
        r30 = r6;
        r5 = r21 >> 3;
        r32 = r2[r5];
        r6 = (r21 & 7) << 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x017e, code lost:
    
        if (((r32 >> r6) & r28) != 128) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0180, code lost:
    
        r34 = r13;
        r2[r5] = (((long) (r11 & 127)) << r6) | (r32 & (~(r28 << r6)));
        r2[r10] = (r2[r10] & (~(r28 << r20))) | (128 << r20);
        r7[r21] = r7[r9];
        r7[r9] = 0;
        r8[r21] = r8[r9];
        r8[r9] = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x01a6, code lost:
    
        r34 = r13;
        r2[r5] = (((long) (r11 & 127)) << r6) | (r32 & (~(r28 << r6)));
        r5 = r7[r21];
        r7[r21] = r7[r9];
        r7[r9] = r5;
        r5 = r8[r21];
        r8[r21] = r8[r9];
        r8[r9] = r5;
        r9 = r9 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x01c6, code lost:
    
        r2[r2.length - 1] = (r2[0] & r34) | Long.MIN_VALUE;
        r9 = r9 + 1;
        r5 = r3;
        r6 = r30;
        r3 = r31;
        r13 = r34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x01dc, code lost:
    
        r3 = r5;
        r36.f = defpackage.hqb.a(r36.d) - r36.e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x01ec, code lost:
    
        r3 = 7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x01ed, code lost:
    
        r28 = 255;
        r26 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x01f4, code lost:
    
        r22 = r9;
        r3 = 7;
        r16 = 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x01fa, code lost:
    
        r2 = defpackage.hqb.b(r36.d);
        r5 = r36.a;
        r6 = r36.b;
        r7 = r36.c;
        r8 = r36.d;
        e(r2);
        r2 = r36.a;
        r9 = r36.b;
        r10 = r36.c;
        r11 = r36.d;
        r12 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0214, code lost:
    
        if (r12 >= r8) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x0224, code lost:
    
        if (((r5[r12 >> 3] >> ((r12 & 7) << 3)) & 255) >= r16) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0226, code lost:
    
        r13 = r6[r12];
        r14 = r13 * r13;
        r14 = r14 ^ (r14 << 16);
        r18 = r3;
        r3 = b(r14 >>> 7);
        r19 = r2;
        r1 = r14 & 127;
        r14 = r3 >> 3;
        r20 = (r3 & 7) << 3;
        r1 = (r19[r14] & (~(255 << r20))) | (r1 << r20);
        r19[r14] = r1;
        r19[(((r3 - 7) & r11) + (r11 & 7)) >> 3] = r1;
        r9[r3] = r13;
        r10[r3] = r7[r12];
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0262, code lost:
    
        r19 = r2;
        r18 = r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x0266, code lost:
    
        r12 = r12 + 1;
        r3 = r18;
        r2 = r19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x026f, code lost:
    
        r2 = b(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0273, code lost:
    
        r36.e++;
        r1 = r36.f;
        r3 = r36.a;
        r4 = r2 >> 3;
        r5 = r3[r4];
        r7 = (r2 & 7) << 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x028b, code lost:
    
        if (((r5 >> r7) & r28) != r16) goto L56;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x028d, code lost:
    
        r15 = r26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x028f, code lost:
    
        r36.f = r1 - r15;
        r1 = r36.d;
        r5 = (r5 & (~(r28 << r7))) | (r22 << r7);
        r3[r4] = r5;
        r3[(((r2 - 7) & r1) + (r1 & 7)) >> 3] = r5;
        r1 = ~r2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void f(int r37, int r38) {
        /*
            Method dump skipped, instruction units count: 708
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.i68.f(int, int):void");
    }

    public final int hashCode() {
        int[] iArr = this.b;
        int[] iArr2 = this.c;
        long[] jArr = this.a;
        int length = jArr.length - 2;
        if (length < 0) {
            return 0;
        }
        int i = 0;
        int i2 = 0;
        while (true) {
            long j = jArr[i];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i3 = 8 - ((~(i - length)) >>> 31);
                for (int i4 = 0; i4 < i3; i4++) {
                    if ((255 & j) < 128) {
                        int i5 = (i << 3) + i4;
                        i2 += iArr2[i5] ^ iArr[i5];
                    }
                    j >>= 8;
                }
                if (i3 != 8) {
                    return i2;
                }
            }
            if (i == length) {
                return i2;
            }
            i++;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0066 A[PHI: r8
      0x0066: PHI (r8v2 int) = (r8v1 int), (r8v3 int) binds: [B:10:0x002c, B:19:0x0064] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String toString() {
        /*
            r18 = this;
            r0 = r18
            int r1 = r0.e
            if (r1 != 0) goto L9
            java.lang.String r0 = "{}"
            return r0
        L9:
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            java.lang.String r2 = "{"
            r1.<init>(r2)
            int[] r2 = r0.b
            int[] r3 = r0.c
            long[] r4 = r0.a
            int r5 = r4.length
            int r5 = r5 + (-2)
            if (r5 < 0) goto L6b
            r6 = 0
            r7 = r6
            r8 = r7
        L1e:
            r9 = r4[r7]
            long r11 = ~r9
            r13 = 7
            long r11 = r11 << r13
            long r11 = r11 & r9
            r13 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r11 = r11 & r13
            int r11 = (r11 > r13 ? 1 : (r11 == r13 ? 0 : -1))
            if (r11 == 0) goto L66
            int r11 = r7 - r5
            int r11 = ~r11
            int r11 = r11 >>> 31
            r12 = 8
            int r11 = 8 - r11
            r13 = r6
        L38:
            if (r13 >= r11) goto L64
            r14 = 255(0xff, double:1.26E-321)
            long r14 = r14 & r9
            r16 = 128(0x80, double:6.3E-322)
            int r14 = (r14 > r16 ? 1 : (r14 == r16 ? 0 : -1))
            if (r14 >= 0) goto L60
            int r14 = r7 << 3
            int r14 = r14 + r13
            r15 = r2[r14]
            r14 = r3[r14]
            r1.append(r15)
            java.lang.String r15 = "="
            r1.append(r15)
            r1.append(r14)
            int r8 = r8 + 1
            int r14 = r0.e
            if (r8 >= r14) goto L60
            java.lang.String r14 = ", "
            r1.append(r14)
        L60:
            long r9 = r9 >> r12
            int r13 = r13 + 1
            goto L38
        L64:
            if (r11 != r12) goto L6b
        L66:
            if (r7 == r5) goto L6b
            int r7 = r7 + 1
            goto L1e
        L6b:
            r0 = 125(0x7d, float:1.75E-43)
            r1.append(r0)
            java.lang.String r0 = r1.toString()
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.i68.toString():java.lang.String");
    }

    public /* synthetic */ i68() {
        this(6);
    }
}
