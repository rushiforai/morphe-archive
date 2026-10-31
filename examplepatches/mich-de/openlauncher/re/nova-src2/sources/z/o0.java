package z;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class o0 extends y0 {

    /* renamed from: f, reason: collision with root package name */
    public int f97810f;

    public o0(int i5) {
        this.f97866a = z0.f97875a;
        Object[] objArr = a0.a.f56c;
        this.f97867b = objArr;
        this.f97868c = objArr;
        if (i5 >= 0) {
            j(z0.d(i5));
        } else {
            android.support.v4.media.session.b.k0("Capacity must be a positive value.");
            throw null;
        }
    }

    public final void g() {
        this.f97870e = 0;
        long[] jArr = this.f97866a;
        if (jArr != z0.f97875a) {
            u90.b.D(jArr, -9187201950435737472L);
            long[] jArr2 = this.f97866a;
            int i5 = this.f97869d;
            int i11 = i5 >> 3;
            long j11 = 255 << ((i5 & 7) << 3);
            jArr2[i11] = (jArr2[i11] & (~j11)) | j11;
        }
        u90.b.B(0, this.f97869d, null, this.f97868c);
        u90.b.B(0, this.f97869d, null, this.f97867b);
        this.f97810f = z0.a(this.f97869d) - this.f97870e;
    }

    public final int h(int i5) {
        int i11 = this.f97869d;
        int i12 = i5 & i11;
        int i13 = 0;
        while (true) {
            long[] jArr = this.f97866a;
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

    public final int i(Object obj) {
        long j11;
        long j12;
        long j13;
        long[] jArr;
        long[] jArr2;
        int i5;
        Object[] objArr;
        int i11 = -862048943;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * (-862048943);
        int i12 = iHashCode ^ (iHashCode << 16);
        int i13 = i12 >>> 7;
        int i14 = i12 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i15 = this.f97869d;
        int i16 = i13 & i15;
        int i17 = 0;
        while (true) {
            long[] jArr3 = this.f97866a;
            int i18 = i16 >> 3;
            int i19 = (i16 & 7) << 3;
            long j14 = ((jArr3[i18 + 1] << (64 - i19)) & ((-i19) >> 63)) | (jArr3[i18] >>> i19);
            long j15 = i14;
            int i21 = i14;
            long j16 = j14 ^ (j15 * 72340172838076673L);
            long j17 = (~j16) & (j16 - 72340172838076673L) & (-9187201950435737472L);
            while (j17 != 0) {
                int iNumberOfTrailingZeros = (i16 + (Long.numberOfTrailingZeros(j17) >> 3)) & i15;
                int i22 = i11;
                if (Intrinsics.b(this.f97867b[iNumberOfTrailingZeros], obj)) {
                    return iNumberOfTrailingZeros;
                }
                j17 &= j17 - 1;
                i11 = i22;
            }
            int i23 = i11;
            if ((((~j14) << 6) & j14 & (-9187201950435737472L)) != 0) {
                int iH = h(i13);
                long j18 = 255;
                if (this.f97810f != 0 || ((this.f97866a[iH >> 3] >> ((iH & 7) << 3)) & 255) == 254) {
                    j11 = 255;
                    j12 = j15;
                    j13 = 128;
                } else {
                    int i24 = this.f97869d;
                    if (i24 > 8) {
                        int i25 = 8;
                        long j19 = this.f97870e;
                        ULong.Companion companion = ULong.f71699b;
                        if (Long.compareUnsigned(j19 * 32, i24 * 25) <= 0) {
                            long[] jArr4 = this.f97866a;
                            int i26 = this.f97869d;
                            Object[] objArr2 = this.f97867b;
                            Object[] objArr3 = this.f97868c;
                            j13 = 128;
                            int i27 = (i26 + 7) >> 3;
                            int i28 = 0;
                            while (i28 < i27) {
                                long j21 = j18;
                                long j22 = jArr4[i28] & (-9187201950435737472L);
                                jArr4[i28] = (-72340172838076674L) & ((~j22) + (j22 >>> 7));
                                i28++;
                                i25 = i25;
                                j15 = j15;
                                j18 = j21;
                            }
                            j11 = j18;
                            j12 = j15;
                            int i29 = i25;
                            int iB0 = kotlin.collections.c.B0(jArr4);
                            int i31 = iB0 - 1;
                            jArr4[i31] = (jArr4[i31] & 72057594037927935L) | (-72057594037927936L);
                            jArr4[iB0] = jArr4[0];
                            int i32 = 0;
                            while (i32 != i26) {
                                int i33 = i32 >> 3;
                                int i34 = (i32 & 7) << 3;
                                long j23 = (jArr4[i33] >> i34) & j11;
                                if (j23 != 128 && j23 == 254) {
                                    Object obj2 = objArr2[i32];
                                    int iHashCode2 = (obj2 != null ? obj2.hashCode() : 0) * i23;
                                    int i35 = (iHashCode2 ^ (iHashCode2 << 16)) >>> 7;
                                    int iH2 = h(i35);
                                    int i36 = i35 & i26;
                                    if (((iH2 - i36) & i26) / i29 == ((i32 - i36) & i26) / i29) {
                                        jArr4[i33] = ((r8 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i34) | (jArr4[i33] & (~(j11 << i34)));
                                        jArr4[jArr4.length - 1] = jArr4[0];
                                        i32++;
                                        i29 = i29;
                                    } else {
                                        int i37 = i29;
                                        int i38 = iH2 >> 3;
                                        long j24 = jArr4[i38];
                                        int i39 = (iH2 & 7) << 3;
                                        if (((j24 >> i39) & j11) == 128) {
                                            i5 = i26;
                                            objArr = objArr2;
                                            jArr4[i38] = ((~(j11 << i39)) & j24) | ((r8 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i39);
                                            jArr4[i33] = (jArr4[i33] & (~(j11 << i34))) | (128 << i34);
                                            objArr[iH2] = objArr[i32];
                                            objArr[i32] = null;
                                            objArr3[iH2] = objArr3[i32];
                                            objArr3[i32] = null;
                                        } else {
                                            i5 = i26;
                                            objArr = objArr2;
                                            jArr4[i38] = ((r8 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i39) | ((~(j11 << i39)) & j24);
                                            Object obj3 = objArr[iH2];
                                            objArr[iH2] = objArr[i32];
                                            objArr[i32] = obj3;
                                            Object obj4 = objArr3[iH2];
                                            objArr3[iH2] = objArr3[i32];
                                            objArr3[i32] = obj4;
                                            i32--;
                                        }
                                        jArr4[jArr4.length - 1] = jArr4[0];
                                        i32++;
                                        i29 = i37;
                                        i26 = i5;
                                        objArr2 = objArr;
                                    }
                                } else {
                                    i32++;
                                }
                            }
                            this.f97810f = z0.a(this.f97869d) - this.f97870e;
                        }
                        iH = h(i13);
                    }
                    j11 = 255;
                    j12 = j15;
                    j13 = 128;
                    int iB = z0.b(this.f97869d);
                    long[] jArr5 = this.f97866a;
                    Object[] objArr4 = this.f97867b;
                    Object[] objArr5 = this.f97868c;
                    int i40 = this.f97869d;
                    j(iB);
                    long[] jArr6 = this.f97866a;
                    Object[] objArr6 = this.f97867b;
                    Object[] objArr7 = this.f97868c;
                    int i41 = this.f97869d;
                    int i42 = 0;
                    while (i42 < i40) {
                        if (((jArr5[i42 >> 3] >> ((i42 & 7) << 3)) & 255) < 128) {
                            Object obj5 = objArr4[i42];
                            int iHashCode3 = (obj5 != null ? obj5.hashCode() : 0) * i23;
                            int i43 = iHashCode3 ^ (iHashCode3 << 16);
                            int iH3 = h(i43 >>> 7);
                            jArr = jArr6;
                            jArr2 = jArr5;
                            long j25 = i43 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
                            int i44 = iH3 >> 3;
                            int i45 = (iH3 & 7) << 3;
                            long j26 = (jArr[i44] & (~(255 << i45))) | (j25 << i45);
                            jArr[i44] = j26;
                            jArr[(((iH3 - 7) & i41) + (i41 & 7)) >> 3] = j26;
                            objArr6[iH3] = obj5;
                            objArr7[iH3] = objArr5[i42];
                        } else {
                            jArr = jArr6;
                            jArr2 = jArr5;
                        }
                        i42++;
                        jArr5 = jArr2;
                        jArr6 = jArr;
                    }
                    iH = h(i13);
                }
                this.f97870e++;
                int i46 = this.f97810f;
                long[] jArr7 = this.f97866a;
                int i47 = iH >> 3;
                long j27 = jArr7[i47];
                int i48 = (iH & 7) << 3;
                this.f97810f = i46 - (((j27 >> i48) & j11) == j13 ? 1 : 0);
                int i49 = this.f97869d;
                long j28 = (j27 & (~(j11 << i48))) | (j12 << i48);
                jArr7[i47] = j28;
                jArr7[(((iH - 7) & i49) + (i49 & 7)) >> 3] = j28;
                return ~iH;
            }
            i17 += 8;
            i16 = (i16 + i17) & i15;
            i14 = i21;
            i11 = i23;
        }
    }

    public final void j(int i5) {
        long[] jArr;
        int iMax = i5 > 0 ? Math.max(7, z0.c(i5)) : 0;
        this.f97869d = iMax;
        if (iMax == 0) {
            jArr = z0.f97875a;
        } else {
            jArr = new long[((iMax + 15) & (-8)) >> 3];
            u90.b.D(jArr, -9187201950435737472L);
            int i11 = iMax >> 3;
            long j11 = 255 << ((iMax & 7) << 3);
            jArr[i11] = (jArr[i11] & (~j11)) | j11;
        }
        this.f97866a = jArr;
        this.f97810f = z0.a(this.f97869d) - this.f97870e;
        Object[] objArr = a0.a.f56c;
        this.f97867b = iMax == 0 ? objArr : new Object[iMax];
        if (iMax != 0) {
            objArr = new Object[iMax];
        }
        this.f97868c = objArr;
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0069, code lost:
    
        if (((r4 & ((~r4) << 6)) & (-9187201950435737472L)) == 0) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x006b, code lost:
    
        r10 = -1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object k(Object obj) {
        int iNumberOfTrailingZeros;
        int i5 = 0;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * (-862048943);
        int i11 = iHashCode ^ (iHashCode << 16);
        int i12 = i11 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i13 = this.f97869d;
        int i14 = i11 >>> 7;
        loop0: while (true) {
            int i15 = i14 & i13;
            long[] jArr = this.f97866a;
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
                if (Intrinsics.b(this.f97867b[iNumberOfTrailingZeros], obj)) {
                    break loop0;
                }
                j13 &= j13 - 1;
            }
            i5 += 8;
            i14 = i15 + i5;
        }
        if (iNumberOfTrailingZeros >= 0) {
            return l(iNumberOfTrailingZeros);
        }
        return null;
    }

    public final Object l(int i5) {
        this.f97870e--;
        long[] jArr = this.f97866a;
        int i11 = this.f97869d;
        int i12 = i5 >> 3;
        int i13 = (i5 & 7) << 3;
        long j11 = (jArr[i12] & (~(255 << i13))) | (254 << i13);
        jArr[i12] = j11;
        jArr[(((i5 - 7) & i11) + (i11 & 7)) >> 3] = j11;
        this.f97867b[i5] = null;
        Object[] objArr = this.f97868c;
        Object obj = objArr[i5];
        objArr[i5] = null;
        return obj;
    }

    public final void m(Object obj, Object obj2) {
        int i5 = i(obj);
        if (i5 < 0) {
            i5 = ~i5;
        }
        this.f97867b[i5] = obj;
        this.f97868c[i5] = obj2;
    }

    public /* synthetic */ o0() {
        this(6);
    }
}
