package z;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class p0 extends a1 {

    /* renamed from: e, reason: collision with root package name */
    public int f97812e;

    public p0(int i5) {
        this.f97740a = z0.f97875a;
        this.f97741b = a0.a.f56c;
        if (i5 >= 0) {
            h(z0.d(i5));
        } else {
            android.support.v4.media.session.b.k0("Capacity must be a positive value.");
            throw null;
        }
    }

    public final boolean d(Object obj) {
        int i5 = this.f97743d;
        this.f97741b[f(obj)] = obj;
        return this.f97743d != i5;
    }

    public final void e() {
        this.f97743d = 0;
        long[] jArr = this.f97740a;
        if (jArr != z0.f97875a) {
            u90.b.D(jArr, -9187201950435737472L);
            long[] jArr2 = this.f97740a;
            int i5 = this.f97742c;
            int i11 = i5 >> 3;
            long j11 = 255 << ((i5 & 7) << 3);
            jArr2[i11] = (jArr2[i11] & (~j11)) | j11;
        }
        u90.b.B(0, this.f97742c, null, this.f97741b);
        this.f97812e = z0.a(this.f97742c) - this.f97743d;
    }

    public final int f(Object obj) {
        long j11;
        long j12;
        long j13;
        long[] jArr;
        long[] jArr2;
        int i5;
        Object[] objArr;
        int i11;
        int i12 = -862048943;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * (-862048943);
        int i13 = iHashCode ^ (iHashCode << 16);
        int i14 = i13 >>> 7;
        int i15 = i13 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i16 = this.f97742c;
        int i17 = i14 & i16;
        int i18 = 0;
        while (true) {
            long[] jArr3 = this.f97740a;
            int i19 = i17 >> 3;
            int i21 = (i17 & 7) << 3;
            long j14 = ((jArr3[i19 + 1] << (64 - i21)) & ((-i21) >> 63)) | (jArr3[i19] >>> i21);
            long j15 = i15;
            int i22 = i15;
            long j16 = j14 ^ (j15 * 72340172838076673L);
            long j17 = (~j16) & (j16 - 72340172838076673L) & (-9187201950435737472L);
            while (j17 != 0) {
                int iNumberOfTrailingZeros = (i17 + (Long.numberOfTrailingZeros(j17) >> 3)) & i16;
                int i23 = i12;
                if (Intrinsics.b(this.f97741b[iNumberOfTrailingZeros], obj)) {
                    return iNumberOfTrailingZeros;
                }
                j17 &= j17 - 1;
                i12 = i23;
            }
            int i24 = i12;
            if ((((~j14) << 6) & j14 & (-9187201950435737472L)) != 0) {
                int iG = g(i14);
                long j18 = 255;
                if (this.f97812e != 0 || ((this.f97740a[iG >> 3] >> ((iG & 7) << 3)) & 255) == 254) {
                    j11 = 255;
                    j12 = j15;
                    j13 = 128;
                } else {
                    int i25 = this.f97742c;
                    if (i25 > 8) {
                        int i26 = 8;
                        long j19 = this.f97743d;
                        ULong.Companion companion = ULong.f71699b;
                        if (Long.compareUnsigned(j19 * 32, i25 * 25) <= 0) {
                            long[] jArr4 = this.f97740a;
                            int i27 = this.f97742c;
                            Object[] objArr2 = this.f97741b;
                            int i28 = (i27 + 7) >> 3;
                            int i29 = 0;
                            j13 = 128;
                            while (i29 < i28) {
                                long j21 = j18;
                                long j22 = jArr4[i29] & (-9187201950435737472L);
                                jArr4[i29] = (-72340172838076674L) & ((~j22) + (j22 >>> 7));
                                i29++;
                                i26 = i26;
                                j15 = j15;
                                j18 = j21;
                            }
                            j11 = j18;
                            j12 = j15;
                            int i31 = i26;
                            int iB0 = kotlin.collections.c.B0(jArr4);
                            int i32 = iB0 - 1;
                            long j23 = 72057594037927935L;
                            jArr4[i32] = (jArr4[i32] & 72057594037927935L) | (-72057594037927936L);
                            jArr4[iB0] = jArr4[0];
                            int i33 = 0;
                            while (i33 != i27) {
                                int i34 = i33 >> 3;
                                int i35 = (i33 & 7) << 3;
                                long j24 = (jArr4[i34] >> i35) & j11;
                                if (j24 != 128 && j24 == 254) {
                                    Object obj2 = objArr2[i33];
                                    int iHashCode2 = (obj2 != null ? obj2.hashCode() : 0) * i24;
                                    int i36 = (iHashCode2 ^ (iHashCode2 << 16)) >>> 7;
                                    int iG2 = g(i36);
                                    int i37 = i36 & i27;
                                    if (((iG2 - i37) & i27) / i31 == ((i33 - i37) & i27) / i31) {
                                        long j25 = j23;
                                        jArr4[i34] = ((r7 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i35) | ((~(j11 << i35)) & jArr4[i34]);
                                        jArr4[jArr4.length - 1] = (jArr4[0] & j25) | Long.MIN_VALUE;
                                        i33++;
                                        j23 = j25;
                                    } else {
                                        long j26 = j23;
                                        int i38 = iG2 >> 3;
                                        long j27 = jArr4[i38];
                                        int i39 = (iG2 & 7) << 3;
                                        if (((j27 >> i39) & j11) == 128) {
                                            i11 = i31;
                                            i5 = i27;
                                            objArr = objArr2;
                                            jArr4[i38] = ((~(j11 << i39)) & j27) | ((r7 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i39);
                                            jArr4[i34] = (jArr4[i34] & (~(j11 << i35))) | (128 << i35);
                                            objArr[iG2] = objArr[i33];
                                            objArr[i33] = null;
                                        } else {
                                            i5 = i27;
                                            objArr = objArr2;
                                            i11 = i31;
                                            jArr4[i38] = ((r7 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i39) | ((~(j11 << i39)) & j27);
                                            Object obj3 = objArr[iG2];
                                            objArr[iG2] = objArr[i33];
                                            objArr[i33] = obj3;
                                            i33--;
                                        }
                                        jArr4[jArr4.length - 1] = (jArr4[0] & j26) | Long.MIN_VALUE;
                                        i33++;
                                        j23 = j26;
                                        i31 = i11;
                                        i27 = i5;
                                        objArr2 = objArr;
                                    }
                                } else {
                                    i33++;
                                }
                            }
                            this.f97812e = z0.a(this.f97742c) - this.f97743d;
                        }
                        iG = g(i14);
                    }
                    j11 = 255;
                    j12 = j15;
                    j13 = 128;
                    int iB = z0.b(this.f97742c);
                    long[] jArr5 = this.f97740a;
                    Object[] objArr3 = this.f97741b;
                    int i40 = this.f97742c;
                    h(iB);
                    long[] jArr6 = this.f97740a;
                    Object[] objArr4 = this.f97741b;
                    int i41 = this.f97742c;
                    int i42 = 0;
                    while (i42 < i40) {
                        if (((jArr5[i42 >> 3] >> ((i42 & 7) << 3)) & 255) < 128) {
                            Object obj4 = objArr3[i42];
                            int iHashCode3 = (obj4 != null ? obj4.hashCode() : 0) * i24;
                            int i43 = iHashCode3 ^ (iHashCode3 << 16);
                            int iG3 = g(i43 >>> 7);
                            long j28 = i43 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
                            int i44 = iG3 >> 3;
                            int i45 = (iG3 & 7) << 3;
                            jArr = jArr6;
                            jArr2 = jArr5;
                            long j29 = (jArr6[i44] & (~(255 << i45))) | (j28 << i45);
                            jArr[i44] = j29;
                            jArr[(((iG3 - 7) & i41) + (i41 & 7)) >> 3] = j29;
                            objArr4[iG3] = obj4;
                        } else {
                            jArr = jArr6;
                            jArr2 = jArr5;
                        }
                        i42++;
                        jArr5 = jArr2;
                        jArr6 = jArr;
                    }
                    iG = g(i14);
                }
                this.f97743d++;
                int i46 = this.f97812e;
                long[] jArr7 = this.f97740a;
                int i47 = iG >> 3;
                long j31 = jArr7[i47];
                int i48 = (iG & 7) << 3;
                this.f97812e = i46 - (((j31 >> i48) & j11) == j13 ? 1 : 0);
                int i49 = this.f97742c;
                long j32 = (j31 & (~(j11 << i48))) | (j12 << i48);
                jArr7[i47] = j32;
                jArr7[(((iG - 7) & i49) + (i49 & 7)) >> 3] = j32;
                return iG;
            }
            i18 += 8;
            i17 = (i17 + i18) & i16;
            i15 = i22;
            i12 = i24;
        }
    }

    public final int g(int i5) {
        int i11 = this.f97742c;
        int i12 = i5 & i11;
        int i13 = 0;
        while (true) {
            long[] jArr = this.f97740a;
            int i14 = i12 >> 3;
            int i15 = (i12 & 7) << 3;
            long j11 = ((jArr[i14 + 1] << (64 - i15)) & ((-i15) >> 63)) | (jArr[i14] >>> i15);
            long j12 = j11 & ((~j11) << 7) & (-9187201950435737472L);
            if (j12 != 0) {
                return (i12 + (Long.numberOfTrailingZeros(j12) >> 3)) & i11;
            }
            i13 += 8;
            i12 = (i12 + i13) & i11;
        }
    }

    public final void h(int i5) {
        long[] jArr;
        int iMax = i5 > 0 ? Math.max(7, z0.c(i5)) : 0;
        this.f97742c = iMax;
        if (iMax == 0) {
            jArr = z0.f97875a;
        } else {
            jArr = new long[((iMax + 15) & (-8)) >> 3];
            u90.b.D(jArr, -9187201950435737472L);
        }
        this.f97740a = jArr;
        int i11 = iMax >> 3;
        long j11 = 255 << ((iMax & 7) << 3);
        jArr[i11] = (jArr[i11] & (~j11)) | j11;
        this.f97812e = z0.a(this.f97742c) - this.f97743d;
        this.f97741b = iMax == 0 ? a0.a.f56c : new Object[iMax];
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0069, code lost:
    
        if (((r4 & ((~r4) << 6)) & (-9187201950435737472L)) == 0) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x006b, code lost:
    
        r10 = -1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void i(Object obj) {
        int iNumberOfTrailingZeros;
        int i5 = 0;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * (-862048943);
        int i11 = iHashCode ^ (iHashCode << 16);
        int i12 = i11 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i13 = this.f97742c;
        int i14 = i11 >>> 7;
        loop0: while (true) {
            int i15 = i14 & i13;
            long[] jArr = this.f97740a;
            int i16 = i15 >> 3;
            int i17 = (i15 & 7) << 3;
            long j11 = ((jArr[i16 + 1] << (64 - i17)) & ((-i17) >> 63)) | (jArr[i16] >>> i17);
            long j12 = (i12 * 72340172838076673L) ^ j11;
            long j13 = (~j12) & (j12 - 72340172838076673L) & (-9187201950435737472L);
            while (true) {
                if (j13 == 0) {
                    break;
                }
                iNumberOfTrailingZeros = ((Long.numberOfTrailingZeros(j13) >> 3) + i15) & i13;
                if (Intrinsics.b(this.f97741b[iNumberOfTrailingZeros], obj)) {
                    break loop0;
                } else {
                    j13 &= j13 - 1;
                }
            }
            i5 += 8;
            i14 = i15 + i5;
        }
        if (iNumberOfTrailingZeros >= 0) {
            m(iNumberOfTrailingZeros);
        }
    }

    public final void j(Object obj) {
        this.f97741b[f(obj)] = obj;
    }

    public final void k(a1 elements) {
        Intrinsics.g(elements, "elements");
        Object[] objArr = elements.f97741b;
        long[] jArr = elements.f97740a;
        int length = jArr.length - 2;
        if (length < 0) {
            return;
        }
        int i5 = 0;
        while (true) {
            long j11 = jArr[i5];
            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i11 = 8 - ((~(i5 - length)) >>> 31);
                for (int i12 = 0; i12 < i11; i12++) {
                    if ((255 & j11) < 128) {
                        j(objArr[(i5 << 3) + i12]);
                    }
                    j11 >>= 8;
                }
                if (i11 != 8) {
                    return;
                }
            }
            if (i5 == length) {
                return;
            } else {
                i5++;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x006e, code lost:
    
        if (((r7 & ((~r7) << 6)) & (-9187201950435737472L)) == 0) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0070, code lost:
    
        r11 = -1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean l(Object obj) {
        int iNumberOfTrailingZeros;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * (-862048943);
        int i5 = iHashCode ^ (iHashCode << 16);
        int i11 = i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i12 = this.f97742c;
        int i13 = (i5 >>> 7) & i12;
        int i14 = 0;
        loop0: while (true) {
            long[] jArr = this.f97740a;
            int i15 = i13 >> 3;
            int i16 = (i13 & 7) << 3;
            long j11 = ((jArr[i15 + 1] << (64 - i16)) & ((-i16) >> 63)) | (jArr[i15] >>> i16);
            long j12 = (i11 * 72340172838076673L) ^ j11;
            long j13 = (~j12) & (j12 - 72340172838076673L) & (-9187201950435737472L);
            while (true) {
                if (j13 == 0) {
                    break;
                }
                iNumberOfTrailingZeros = ((Long.numberOfTrailingZeros(j13) >> 3) + i13) & i12;
                if (Intrinsics.b(this.f97741b[iNumberOfTrailingZeros], obj)) {
                    break loop0;
                }
                j13 &= j13 - 1;
            }
            i14 += 8;
            i13 = (i13 + i14) & i12;
        }
        boolean z11 = iNumberOfTrailingZeros >= 0;
        if (z11) {
            m(iNumberOfTrailingZeros);
        }
        return z11;
    }

    public final void m(int i5) {
        this.f97743d--;
        long[] jArr = this.f97740a;
        int i11 = this.f97742c;
        int i12 = i5 >> 3;
        int i13 = (i5 & 7) << 3;
        long j11 = (jArr[i12] & (~(255 << i13))) | (254 << i13);
        jArr[i12] = j11;
        jArr[(((i5 - 7) & i11) + (i11 & 7)) >> 3] = j11;
        this.f97741b[i5] = null;
    }

    public /* synthetic */ p0() {
        this(6);
    }
}
