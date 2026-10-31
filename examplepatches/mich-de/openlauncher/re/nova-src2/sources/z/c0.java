package z;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.ULong;

/* loaded from: classes.dex */
public final class c0 extends m {

    /* renamed from: f, reason: collision with root package name */
    public int f97750f;

    public c0(int i5) {
        this.f97794a = z0.f97875a;
        this.f97795b = p.f97811a;
        this.f97796c = a0.a.f56c;
        if (i5 >= 0) {
            f(z0.d(i5));
        } else {
            android.support.v4.media.session.b.k0("Capacity must be a positive value.");
            throw null;
        }
    }

    public final void c() {
        this.f97798e = 0;
        long[] jArr = this.f97794a;
        if (jArr != z0.f97875a) {
            u90.b.D(jArr, -9187201950435737472L);
            long[] jArr2 = this.f97794a;
            int i5 = this.f97797d;
            int i11 = i5 >> 3;
            long j11 = 255 << ((i5 & 7) << 3);
            jArr2[i11] = (jArr2[i11] & (~j11)) | j11;
        }
        u90.b.B(0, this.f97797d, null, this.f97796c);
        this.f97750f = z0.a(this.f97797d) - this.f97798e;
    }

    public final int d(int i5) {
        long j11;
        long j12;
        int i11;
        long j13;
        long[] jArr;
        long[] jArr2;
        int[] iArr;
        Object[] objArr;
        int i12;
        int i13 = -862048943;
        int iHashCode = Integer.hashCode(i5) * (-862048943);
        int i14 = iHashCode ^ (iHashCode << 16);
        int i15 = i14 >>> 7;
        int i16 = i14 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i17 = this.f97797d;
        int i18 = i15 & i17;
        int i19 = 0;
        while (true) {
            long[] jArr3 = this.f97794a;
            int i21 = i18 >> 3;
            int i22 = (i18 & 7) << 3;
            int i23 = 1;
            long j14 = ((jArr3[i21 + 1] << (64 - i22)) & ((-i22) >> 63)) | (jArr3[i21] >>> i22);
            long j15 = i16;
            int i24 = i19;
            int i25 = 0;
            long j16 = j14 ^ (j15 * 72340172838076673L);
            long j17 = (~j16) & (j16 - 72340172838076673L) & (-9187201950435737472L);
            while (j17 != 0) {
                int iNumberOfTrailingZeros = (i18 + (Long.numberOfTrailingZeros(j17) >> 3)) & i17;
                int i26 = i13;
                int i27 = i25;
                if (this.f97795b[iNumberOfTrailingZeros] == i5) {
                    return iNumberOfTrailingZeros;
                }
                j17 &= j17 - 1;
                i13 = i26;
                i25 = i27;
            }
            int i28 = i13;
            int i29 = i25;
            if ((((~j14) << 6) & j14 & (-9187201950435737472L)) != 0) {
                int iE = e(i15);
                long j18 = 255;
                if (this.f97750f != 0 || ((this.f97794a[iE >> 3] >> ((iE & 7) << 3)) & 255) == 254) {
                    j11 = 255;
                    j12 = j15;
                    i11 = 1;
                    j13 = 128;
                } else {
                    int i31 = this.f97797d;
                    if (i31 > 8) {
                        j13 = 128;
                        long j19 = this.f97798e;
                        ULong.Companion companion = ULong.f71699b;
                        if (Long.compareUnsigned(j19 * 32, i31 * 25) <= 0) {
                            long[] jArr4 = this.f97794a;
                            int i32 = this.f97797d;
                            int[] iArr2 = this.f97795b;
                            Object[] objArr2 = this.f97796c;
                            int i33 = (i32 + 7) >> 3;
                            int i34 = i29;
                            while (i34 < i33) {
                                long j21 = j18;
                                long j22 = jArr4[i34] & (-9187201950435737472L);
                                jArr4[i34] = (-72340172838076674L) & ((~j22) + (j22 >>> 7));
                                i34++;
                                j15 = j15;
                                j18 = j21;
                            }
                            j11 = j18;
                            j12 = j15;
                            int iB0 = kotlin.collections.c.B0(jArr4);
                            int i35 = iB0 - 1;
                            long j23 = 72057594037927935L;
                            jArr4[i35] = (jArr4[i35] & 72057594037927935L) | (-72057594037927936L);
                            jArr4[iB0] = jArr4[i29];
                            int i36 = i29;
                            while (i36 != i32) {
                                int i37 = i36 >> 3;
                                int i38 = (i36 & 7) << 3;
                                long j24 = (jArr4[i37] >> i38) & j11;
                                if (j24 != 128 && j24 == 254) {
                                    int iHashCode2 = Integer.hashCode(iArr2[i36]) * i28;
                                    int i39 = iHashCode2 ^ (iHashCode2 << 16);
                                    int i40 = i39 >>> 7;
                                    int iE2 = e(i40);
                                    int i41 = i40 & i32;
                                    if (((iE2 - i41) & i32) / 8 == ((i36 - i41) & i32) / 8) {
                                        long j25 = j23;
                                        jArr4[i37] = ((i39 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i38) | ((~(j11 << i38)) & jArr4[i37]);
                                        jArr4[jArr4.length - i23] = (jArr4[i29] & j25) | Long.MIN_VALUE;
                                        i36++;
                                        j23 = j25;
                                    } else {
                                        long j26 = j23;
                                        int i42 = iE2 >> 3;
                                        long j27 = jArr4[i42];
                                        int i43 = (iE2 & 7) << 3;
                                        if (((j27 >> i43) & j11) == 128) {
                                            i12 = i23;
                                            iArr = iArr2;
                                            objArr = objArr2;
                                            jArr4[i42] = ((~(j11 << i43)) & j27) | ((i39 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i43);
                                            jArr4[i37] = (jArr4[i37] & (~(j11 << i38))) | (128 << i38);
                                            iArr[iE2] = iArr[i36];
                                            iArr[i36] = i29;
                                            objArr[iE2] = objArr[i36];
                                            objArr[i36] = null;
                                        } else {
                                            iArr = iArr2;
                                            objArr = objArr2;
                                            i12 = i23;
                                            jArr4[i42] = ((i39 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i43) | ((~(j11 << i43)) & j27);
                                            int i44 = iArr[iE2];
                                            iArr[iE2] = iArr[i36];
                                            iArr[i36] = i44;
                                            Object obj = objArr[iE2];
                                            objArr[iE2] = objArr[i36];
                                            objArr[i36] = obj;
                                            i36--;
                                        }
                                        jArr4[jArr4.length - 1] = (jArr4[i29] & j26) | Long.MIN_VALUE;
                                        i36++;
                                        j23 = j26;
                                        i23 = i12;
                                        iArr2 = iArr;
                                        objArr2 = objArr;
                                    }
                                } else {
                                    i36++;
                                }
                            }
                            i11 = i23;
                            this.f97750f = z0.a(this.f97797d) - this.f97798e;
                        }
                        iE = e(i15);
                    } else {
                        j13 = 128;
                    }
                    j11 = 255;
                    j12 = j15;
                    i11 = 1;
                    int iB = z0.b(this.f97797d);
                    long[] jArr5 = this.f97794a;
                    int[] iArr3 = this.f97795b;
                    Object[] objArr3 = this.f97796c;
                    int i45 = this.f97797d;
                    f(iB);
                    long[] jArr6 = this.f97794a;
                    int[] iArr4 = this.f97795b;
                    Object[] objArr4 = this.f97796c;
                    int i46 = this.f97797d;
                    int i47 = i29;
                    while (i47 < i45) {
                        if (((jArr5[i47 >> 3] >> ((i47 & 7) << 3)) & 255) < j13) {
                            int i48 = iArr3[i47];
                            int iHashCode3 = Integer.hashCode(i48) * i28;
                            int i49 = iHashCode3 ^ (iHashCode3 << 16);
                            int iE3 = e(i49 >>> 7);
                            long j28 = i49 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
                            int i51 = iE3 >> 3;
                            int i52 = (iE3 & 7) << 3;
                            jArr = jArr6;
                            jArr2 = jArr5;
                            long j29 = (jArr6[i51] & (~(255 << i52))) | (j28 << i52);
                            jArr[i51] = j29;
                            jArr[(((iE3 - 7) & i46) + (i46 & 7)) >> 3] = j29;
                            iArr4[iE3] = i48;
                            objArr4[iE3] = objArr3[i47];
                        } else {
                            jArr = jArr6;
                            jArr2 = jArr5;
                        }
                        i47++;
                        jArr5 = jArr2;
                        jArr6 = jArr;
                    }
                    iE = e(i15);
                }
                this.f97798e++;
                int i53 = this.f97750f;
                long[] jArr7 = this.f97794a;
                int i54 = iE >> 3;
                long j31 = jArr7[i54];
                int i55 = (iE & 7) << 3;
                if (((j31 >> i55) & j11) != j13) {
                    i11 = i29;
                }
                this.f97750f = i53 - i11;
                int i56 = this.f97797d;
                long j32 = (j31 & (~(j11 << i55))) | (j12 << i55);
                jArr7[i54] = j32;
                jArr7[(((iE - 7) & i56) + (i56 & 7)) >> 3] = j32;
                return iE;
            }
            i19 = i24 + 8;
            i18 = (i18 + i19) & i17;
            i13 = i28;
        }
    }

    public final int e(int i5) {
        int i11 = this.f97797d;
        int i12 = i5 & i11;
        int i13 = 0;
        while (true) {
            long[] jArr = this.f97794a;
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

    public final void f(int i5) {
        long[] jArr;
        int iMax = i5 > 0 ? Math.max(7, z0.c(i5)) : 0;
        this.f97797d = iMax;
        if (iMax == 0) {
            jArr = z0.f97875a;
        } else {
            jArr = new long[((iMax + 15) & (-8)) >> 3];
            u90.b.D(jArr, -9187201950435737472L);
        }
        this.f97794a = jArr;
        int i11 = iMax >> 3;
        long j11 = 255 << ((iMax & 7) << 3);
        jArr[i11] = (jArr[i11] & (~j11)) | j11;
        this.f97750f = z0.a(this.f97797d) - this.f97798e;
        this.f97795b = new int[iMax];
        this.f97796c = new Object[iMax];
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0061, code lost:
    
        if (((r4 & ((~r4) << 6)) & (-9187201950435737472L)) == 0) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0063, code lost:
    
        r10 = -1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(int i5) {
        int iNumberOfTrailingZeros;
        int iHashCode = Integer.hashCode(i5) * (-862048943);
        int i11 = iHashCode ^ (iHashCode << 16);
        int i12 = i11 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i13 = this.f97797d;
        int i14 = (i11 >>> 7) & i13;
        int i15 = 0;
        loop0: while (true) {
            long[] jArr = this.f97794a;
            int i16 = i14 >> 3;
            int i17 = (i14 & 7) << 3;
            long j11 = ((jArr[i16 + 1] << (64 - i17)) & ((-i17) >> 63)) | (jArr[i16] >>> i17);
            long j12 = (i12 * 72340172838076673L) ^ j11;
            long j13 = (~j12) & (j12 - 72340172838076673L) & (-9187201950435737472L);
            while (true) {
                if (j13 == 0) {
                    break;
                }
                iNumberOfTrailingZeros = ((Long.numberOfTrailingZeros(j13) >> 3) + i14) & i13;
                if (this.f97795b[iNumberOfTrailingZeros] == i5) {
                    break loop0;
                }
                j13 &= j13 - 1;
            }
            i15 += 8;
            i14 = (i14 + i15) & i13;
        }
        if (iNumberOfTrailingZeros < 0) {
            return null;
        }
        this.f97798e--;
        long[] jArr2 = this.f97794a;
        int i18 = this.f97797d;
        int i19 = iNumberOfTrailingZeros >> 3;
        int i21 = (iNumberOfTrailingZeros & 7) << 3;
        long j14 = (jArr2[i19] & (~(255 << i21))) | (254 << i21);
        jArr2[i19] = j14;
        jArr2[(((iNumberOfTrailingZeros - 7) & i18) + (i18 & 7)) >> 3] = j14;
        Object[] objArr = this.f97796c;
        Object obj = objArr[iNumberOfTrailingZeros];
        objArr[iNumberOfTrailingZeros] = null;
        return obj;
    }

    public final void h(int i5, Object obj) {
        int iD = d(i5);
        this.f97795b[iD] = i5;
        this.f97796c[iD] = obj;
    }

    public /* synthetic */ c0() {
        this(6);
    }
}
