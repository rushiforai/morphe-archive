package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t68 {
    public long[] a;
    public Object[] b;
    public int[] c;
    public int d;
    public int e;
    public int f;

    public t68(int i) {
        this.a = hqb.a;
        this.b = vc2.h;
        this.c = r46.a;
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
        k80.o0(0, this.d, null, this.b);
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

    public final int c(Object obj) {
        long j;
        long j2;
        long j3;
        long[] jArr;
        long[] jArr2;
        int i;
        Object[] objArr;
        int i2 = -862048943;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * (-862048943);
        int i3 = iHashCode ^ (iHashCode << 16);
        int i4 = i3 >>> 7;
        int i5 = i3 & 127;
        int i6 = this.d;
        int i7 = i4 & i6;
        int i8 = 0;
        while (true) {
            long[] jArr3 = this.a;
            int i9 = i7 >> 3;
            int i10 = (i7 & 7) << 3;
            long j4 = ((jArr3[i9 + 1] << (64 - i10)) & ((-i10) >> 63)) | (jArr3[i9] >>> i10);
            long j5 = i5;
            int i11 = i5;
            long j6 = j4 ^ (j5 * 72340172838076673L);
            long j7 = (~j6) & (j6 - 72340172838076673L) & (-9187201950435737472L);
            while (j7 != 0) {
                int iNumberOfTrailingZeros = (i7 + (Long.numberOfTrailingZeros(j7) >> 3)) & i6;
                int i12 = i2;
                if (g76.L(this.b[iNumberOfTrailingZeros], obj)) {
                    return iNumberOfTrailingZeros;
                }
                j7 &= j7 - 1;
                i2 = i12;
            }
            int i13 = i2;
            if ((((~j4) << 6) & j4 & (-9187201950435737472L)) != 0) {
                int iB = b(i4);
                long j8 = 255;
                if (this.f != 0 || ((this.a[iB >> 3] >> ((iB & 7) << 3)) & 255) == 254) {
                    j = 255;
                    j2 = j5;
                    j3 = 128;
                } else {
                    int i14 = this.d;
                    if (i14 > 8) {
                        int i15 = 8;
                        if (Long.compare((((long) this.e) * 32) ^ Long.MIN_VALUE, (((long) i14) * 25) ^ Long.MIN_VALUE) <= 0) {
                            long[] jArr4 = this.a;
                            int i16 = this.d;
                            Object[] objArr2 = this.b;
                            int[] iArr = this.c;
                            j3 = 128;
                            int i17 = (i16 + 7) >> 3;
                            int i18 = 0;
                            while (i18 < i17) {
                                long j9 = j8;
                                long j10 = jArr4[i18] & (-9187201950435737472L);
                                jArr4[i18] = (-72340172838076674L) & ((~j10) + (j10 >>> 7));
                                i18++;
                                i15 = i15;
                                j5 = j5;
                                j8 = j9;
                            }
                            j = j8;
                            j2 = j5;
                            int i19 = i15;
                            int iW0 = k80.w0(jArr4);
                            int i20 = iW0 - 1;
                            long j11 = 72057594037927935L;
                            jArr4[i20] = (jArr4[i20] & 72057594037927935L) | (-72057594037927936L);
                            jArr4[iW0] = jArr4[0];
                            int i21 = 0;
                            while (i21 != i16) {
                                int i22 = i21 >> 3;
                                int i23 = (i21 & 7) << 3;
                                long j12 = (jArr4[i22] >> i23) & j;
                                if (j12 != 128 && j12 == 254) {
                                    Object obj2 = objArr2[i21];
                                    int iHashCode2 = (obj2 != null ? obj2.hashCode() : 0) * i13;
                                    int i24 = iHashCode2 ^ (iHashCode2 << 16);
                                    int i25 = i24 >>> 7;
                                    int iB2 = b(i25);
                                    int i26 = i25 & i16;
                                    long j13 = j11;
                                    if (((iB2 - i26) & i16) / 8 == ((i21 - i26) & i16) / i19) {
                                        jArr4[i22] = (((long) (i24 & 127)) << i23) | (jArr4[i22] & (~(j << i23)));
                                        jArr4[jArr4.length - 1] = (jArr4[0] & j13) | Long.MIN_VALUE;
                                        i21++;
                                        j11 = j13;
                                        i19 = i19;
                                    } else {
                                        int i27 = i19;
                                        int i28 = iB2 >> 3;
                                        long j14 = jArr4[i28];
                                        int i29 = (iB2 & 7) << 3;
                                        if (((j14 >> i29) & j) == 128) {
                                            i = i16;
                                            objArr = objArr2;
                                            jArr4[i28] = ((~(j << i29)) & j14) | (((long) (i24 & 127)) << i29);
                                            jArr4[i22] = (jArr4[i22] & (~(j << i23))) | (128 << i23);
                                            objArr[iB2] = objArr[i21];
                                            objArr[i21] = null;
                                            iArr[iB2] = iArr[i21];
                                            iArr[i21] = 0;
                                        } else {
                                            i = i16;
                                            objArr = objArr2;
                                            jArr4[i28] = (((long) (i24 & 127)) << i29) | ((~(j << i29)) & j14);
                                            Object obj3 = objArr[iB2];
                                            objArr[iB2] = objArr[i21];
                                            objArr[i21] = obj3;
                                            int i30 = iArr[iB2];
                                            iArr[iB2] = iArr[i21];
                                            iArr[i21] = i30;
                                            i21--;
                                        }
                                        jArr4[jArr4.length - 1] = (jArr4[0] & j13) | Long.MIN_VALUE;
                                        i21++;
                                        i16 = i;
                                        j11 = j13;
                                        i19 = i27;
                                        objArr2 = objArr;
                                    }
                                } else {
                                    i21++;
                                }
                            }
                            this.f = hqb.a(this.d) - this.e;
                        }
                        iB = b(i4);
                    }
                    j = 255;
                    j2 = j5;
                    j3 = 128;
                    int iB3 = hqb.b(this.d);
                    long[] jArr5 = this.a;
                    Object[] objArr3 = this.b;
                    int[] iArr2 = this.c;
                    int i31 = this.d;
                    e(iB3);
                    long[] jArr6 = this.a;
                    Object[] objArr4 = this.b;
                    int[] iArr3 = this.c;
                    int i32 = this.d;
                    int i33 = 0;
                    while (i33 < i31) {
                        if (((jArr5[i33 >> 3] >> ((i33 & 7) << 3)) & 255) < 128) {
                            Object obj4 = objArr3[i33];
                            int iHashCode3 = (obj4 != null ? obj4.hashCode() : 0) * i13;
                            int i34 = iHashCode3 ^ (iHashCode3 << 16);
                            int iB4 = b(i34 >>> 7);
                            jArr = jArr6;
                            jArr2 = jArr5;
                            long j15 = i34 & 127;
                            int i35 = iB4 >> 3;
                            int i36 = (iB4 & 7) << 3;
                            long j16 = (jArr[i35] & (~(255 << i36))) | (j15 << i36);
                            jArr[i35] = j16;
                            jArr[(((iB4 - 7) & i32) + (i32 & 7)) >> 3] = j16;
                            objArr4[iB4] = obj4;
                            iArr3[iB4] = iArr2[i33];
                        } else {
                            jArr = jArr6;
                            jArr2 = jArr5;
                        }
                        i33++;
                        jArr5 = jArr2;
                        jArr6 = jArr;
                    }
                    iB = b(i4);
                }
                this.e++;
                int i37 = this.f;
                long[] jArr7 = this.a;
                int i38 = iB >> 3;
                long j17 = jArr7[i38];
                int i39 = (iB & 7) << 3;
                this.f = i37 - (((j17 >> i39) & j) == j3 ? 1 : 0);
                int i40 = this.d;
                long j18 = (j17 & (~(j << i39))) | (j2 << i39);
                jArr7[i38] = j18;
                jArr7[(((iB - 7) & i40) + (i40 & 7)) >> 3] = j18;
                return ~iB;
            }
            i8 += 8;
            i7 = (i7 + i8) & i6;
            i5 = i11;
            i2 = i13;
        }
    }

    public final int d(Object obj) {
        int i = 0;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * (-862048943);
        int i2 = iHashCode ^ (iHashCode << 16);
        int i3 = i2 & 127;
        int i4 = this.d;
        int i5 = i2 >>> 7;
        while (true) {
            int i6 = i5 & i4;
            long[] jArr = this.a;
            int i7 = i6 >> 3;
            int i8 = (i6 & 7) << 3;
            long j = ((jArr[i7 + 1] << (64 - i8)) & ((-i8) >> 63)) | (jArr[i7] >>> i8);
            long j2 = (((long) i3) * 72340172838076673L) ^ j;
            for (long j3 = (~j2) & (j2 - 72340172838076673L) & (-9187201950435737472L); j3 != 0; j3 &= j3 - 1) {
                int iNumberOfTrailingZeros = ((Long.numberOfTrailingZeros(j3) >> 3) + i6) & i4;
                if (g76.L(this.b[iNumberOfTrailingZeros], obj)) {
                    return iNumberOfTrailingZeros;
                }
            }
            if ((j & ((~j) << 6) & (-9187201950435737472L)) != 0) {
                return -1;
            }
            i += 8;
            i5 = i6 + i;
        }
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
        this.b = new Object[iMax];
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
            boolean r3 = r1 instanceof defpackage.t68
            r4 = 0
            if (r3 != 0) goto Le
            return r4
        Le:
            t68 r1 = (defpackage.t68) r1
            int r3 = r1.e
            int r5 = r0.e
            if (r3 == r5) goto L17
            return r4
        L17:
            java.lang.Object[] r3 = r0.b
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
            int r14 = r1.d(r14)
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.t68.equals(java.lang.Object):boolean");
    }

    public final void f(int i) {
        this.e--;
        long[] jArr = this.a;
        int i2 = this.d;
        int i3 = i >> 3;
        int i4 = (i & 7) << 3;
        long j = (jArr[i3] & (~(255 << i4))) | (254 << i4);
        jArr[i3] = j;
        jArr[(((i - 7) & i2) + (i2 & 7)) >> 3] = j;
        this.b[i] = null;
    }

    public final void g(int i, Object obj) {
        int iC = c(obj);
        if (iC < 0) {
            iC = ~iC;
        }
        this.b[iC] = obj;
        this.c[iC] = i;
    }

    public final int hashCode() {
        Object[] objArr = this.b;
        int[] iArr = this.c;
        long[] jArr = this.a;
        int length = jArr.length - 2;
        if (length < 0) {
            return 0;
        }
        int i = 0;
        int iHashCode = 0;
        while (true) {
            long j = jArr[i];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i2 = 8 - ((~(i - length)) >>> 31);
                for (int i3 = 0; i3 < i2; i3++) {
                    if ((255 & j) < 128) {
                        int i4 = (i << 3) + i3;
                        Object obj = objArr[i4];
                        iHashCode += iArr[i4] ^ (obj != null ? obj.hashCode() : 0);
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

    /* JADX WARN: Removed duplicated region for block: B:23:0x006a A[PHI: r8
      0x006a: PHI (r8v2 int) = (r8v1 int), (r8v3 int) binds: [B:10:0x002c, B:22:0x0068] A[DONT_GENERATE, DONT_INLINE]] */
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
            java.lang.Object[] r2 = r0.b
            int[] r3 = r0.c
            long[] r4 = r0.a
            int r5 = r4.length
            int r5 = r5 + (-2)
            if (r5 < 0) goto L6f
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
            if (r11 == 0) goto L6a
            int r11 = r7 - r5
            int r11 = ~r11
            int r11 = r11 >>> 31
            r12 = 8
            int r11 = 8 - r11
            r13 = r6
        L38:
            if (r13 >= r11) goto L68
            r14 = 255(0xff, double:1.26E-321)
            long r14 = r14 & r9
            r16 = 128(0x80, double:6.3E-322)
            int r14 = (r14 > r16 ? 1 : (r14 == r16 ? 0 : -1))
            if (r14 >= 0) goto L64
            int r14 = r7 << 3
            int r14 = r14 + r13
            r15 = r2[r14]
            r14 = r3[r14]
            if (r15 != r0) goto L4e
            java.lang.String r15 = "(this)"
        L4e:
            r1.append(r15)
            java.lang.String r15 = "="
            r1.append(r15)
            r1.append(r14)
            int r8 = r8 + 1
            int r14 = r0.e
            if (r8 >= r14) goto L64
            java.lang.String r14 = ", "
            r1.append(r14)
        L64:
            long r9 = r9 >> r12
            int r13 = r13 + 1
            goto L38
        L68:
            if (r11 != r12) goto L6f
        L6a:
            if (r7 == r5) goto L6f
            int r7 = r7 + 1
            goto L1e
        L6f:
            r0 = 125(0x7d, float:1.75E-43)
            r1.append(r0)
            java.lang.String r0 = r1.toString()
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.t68.toString():java.lang.String");
    }

    public /* synthetic */ t68() {
        this(6);
    }
}
