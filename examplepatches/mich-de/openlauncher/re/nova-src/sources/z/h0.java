package z;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class h0 extends s0 {

    /* renamed from: f, reason: collision with root package name */
    public int f97779f;

    public h0(int i5) {
        this.f97829a = z0.f97875a;
        this.f97830b = a0.a.f56c;
        this.f97831c = p.f97811a;
        if (i5 >= 0) {
            f(z0.d(i5));
        } else {
            android.support.v4.media.session.b.k0("Capacity must be a positive value.");
            throw null;
        }
    }

    public final void c() {
        this.f97833e = 0;
        long[] jArr = this.f97829a;
        if (jArr != z0.f97875a) {
            u90.b.D(jArr, -9187201950435737472L);
            long[] jArr2 = this.f97829a;
            int i5 = this.f97832d;
            int i11 = i5 >> 3;
            long j11 = 255 << ((i5 & 7) << 3);
            jArr2[i11] = (jArr2[i11] & (~j11)) | j11;
        }
        u90.b.B(0, this.f97832d, null, this.f97830b);
        this.f97779f = z0.a(this.f97832d) - this.f97833e;
    }

    public final int d(int i5) {
        int i11 = this.f97832d;
        int i12 = i5 & i11;
        int i13 = 0;
        while (true) {
            long[] jArr = this.f97829a;
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

    public final int e(Object obj) {
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
        int i15 = this.f97832d;
        int i16 = i13 & i15;
        int i17 = 0;
        while (true) {
            long[] jArr3 = this.f97829a;
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
                if (Intrinsics.b(this.f97830b[iNumberOfTrailingZeros], obj)) {
                    return iNumberOfTrailingZeros;
                }
                j17 &= j17 - 1;
                i11 = i22;
            }
            int i23 = i11;
            if ((((~j14) << 6) & j14 & (-9187201950435737472L)) != 0) {
                int iD = d(i13);
                long j18 = 255;
                if (this.f97779f != 0 || ((this.f97829a[iD >> 3] >> ((iD & 7) << 3)) & 255) == 254) {
                    j11 = 255;
                    j12 = j15;
                    j13 = 128;
                } else {
                    int i24 = this.f97832d;
                    if (i24 > 8) {
                        int i25 = 8;
                        long j19 = this.f97833e;
                        ULong.Companion companion = ULong.f71699b;
                        if (Long.compareUnsigned(j19 * 32, i24 * 25) <= 0) {
                            long[] jArr4 = this.f97829a;
                            int i26 = this.f97832d;
                            Object[] objArr2 = this.f97830b;
                            int[] iArr = this.f97831c;
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
                            long j23 = 72057594037927935L;
                            jArr4[i31] = (jArr4[i31] & 72057594037927935L) | (-72057594037927936L);
                            jArr4[iB0] = jArr4[0];
                            int i32 = 0;
                            while (i32 != i26) {
                                int i33 = i32 >> 3;
                                int i34 = (i32 & 7) << 3;
                                long j24 = (jArr4[i33] >> i34) & j11;
                                if (j24 != 128 && j24 == 254) {
                                    Object obj2 = objArr2[i32];
                                    int iHashCode2 = (obj2 != null ? obj2.hashCode() : 0) * i23;
                                    int i35 = (iHashCode2 ^ (iHashCode2 << 16)) >>> 7;
                                    int iD2 = d(i35);
                                    int i36 = i35 & i26;
                                    long j25 = j23;
                                    if (((iD2 - i36) & i26) / 8 == ((i32 - i36) & i26) / i29) {
                                        jArr4[i33] = ((r8 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i34) | (jArr4[i33] & (~(j11 << i34)));
                                        jArr4[jArr4.length - 1] = (jArr4[0] & j25) | Long.MIN_VALUE;
                                        i32++;
                                        i29 = i29;
                                        j23 = j25;
                                    } else {
                                        int i37 = i29;
                                        int i38 = iD2 >> 3;
                                        long j26 = jArr4[i38];
                                        int i39 = (iD2 & 7) << 3;
                                        if (((j26 >> i39) & j11) == 128) {
                                            i5 = i26;
                                            objArr = objArr2;
                                            jArr4[i38] = ((~(j11 << i39)) & j26) | ((r8 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i39);
                                            jArr4[i33] = (jArr4[i33] & (~(j11 << i34))) | (128 << i34);
                                            objArr[iD2] = objArr[i32];
                                            objArr[i32] = null;
                                            iArr[iD2] = iArr[i32];
                                            iArr[i32] = 0;
                                        } else {
                                            i5 = i26;
                                            objArr = objArr2;
                                            jArr4[i38] = ((r8 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i39) | ((~(j11 << i39)) & j26);
                                            Object obj3 = objArr[iD2];
                                            objArr[iD2] = objArr[i32];
                                            objArr[i32] = obj3;
                                            int i40 = iArr[iD2];
                                            iArr[iD2] = iArr[i32];
                                            iArr[i32] = i40;
                                            i32--;
                                        }
                                        jArr4[jArr4.length - 1] = (jArr4[0] & j25) | Long.MIN_VALUE;
                                        i32++;
                                        i26 = i5;
                                        i29 = i37;
                                        j23 = j25;
                                        objArr2 = objArr;
                                    }
                                } else {
                                    i32++;
                                }
                            }
                            this.f97779f = z0.a(this.f97832d) - this.f97833e;
                        }
                        iD = d(i13);
                    }
                    j11 = 255;
                    j12 = j15;
                    j13 = 128;
                    int iB = z0.b(this.f97832d);
                    long[] jArr5 = this.f97829a;
                    Object[] objArr3 = this.f97830b;
                    int[] iArr2 = this.f97831c;
                    int i41 = this.f97832d;
                    f(iB);
                    long[] jArr6 = this.f97829a;
                    Object[] objArr4 = this.f97830b;
                    int[] iArr3 = this.f97831c;
                    int i42 = this.f97832d;
                    int i43 = 0;
                    while (i43 < i41) {
                        if (((jArr5[i43 >> 3] >> ((i43 & 7) << 3)) & 255) < 128) {
                            Object obj4 = objArr3[i43];
                            int iHashCode3 = (obj4 != null ? obj4.hashCode() : 0) * i23;
                            int i44 = iHashCode3 ^ (iHashCode3 << 16);
                            int iD3 = d(i44 >>> 7);
                            jArr = jArr6;
                            jArr2 = jArr5;
                            long j27 = i44 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
                            int i45 = iD3 >> 3;
                            int i46 = (iD3 & 7) << 3;
                            long j28 = (jArr[i45] & (~(255 << i46))) | (j27 << i46);
                            jArr[i45] = j28;
                            jArr[(((iD3 - 7) & i42) + (i42 & 7)) >> 3] = j28;
                            objArr4[iD3] = obj4;
                            iArr3[iD3] = iArr2[i43];
                        } else {
                            jArr = jArr6;
                            jArr2 = jArr5;
                        }
                        i43++;
                        jArr5 = jArr2;
                        jArr6 = jArr;
                    }
                    iD = d(i13);
                }
                this.f97833e++;
                int i47 = this.f97779f;
                long[] jArr7 = this.f97829a;
                int i48 = iD >> 3;
                long j29 = jArr7[i48];
                int i49 = (iD & 7) << 3;
                this.f97779f = i47 - (((j29 >> i49) & j11) == j13 ? 1 : 0);
                int i51 = this.f97832d;
                long j31 = (j29 & (~(j11 << i49))) | (j12 << i49);
                jArr7[i48] = j31;
                jArr7[(((iD - 7) & i51) + (i51 & 7)) >> 3] = j31;
                return ~iD;
            }
            i17 += 8;
            i16 = (i16 + i17) & i15;
            i14 = i21;
            i11 = i23;
        }
    }

    public final void f(int i5) {
        long[] jArr;
        int iMax = i5 > 0 ? Math.max(7, z0.c(i5)) : 0;
        this.f97832d = iMax;
        if (iMax == 0) {
            jArr = z0.f97875a;
        } else {
            jArr = new long[((iMax + 15) & (-8)) >> 3];
            u90.b.D(jArr, -9187201950435737472L);
        }
        this.f97829a = jArr;
        int i11 = iMax >> 3;
        long j11 = 255 << ((iMax & 7) << 3);
        jArr[i11] = (jArr[i11] & (~j11)) | j11;
        this.f97779f = z0.a(this.f97832d) - this.f97833e;
        this.f97830b = new Object[iMax];
        this.f97831c = new int[iMax];
    }

    public final void g(int i5) {
        this.f97833e--;
        long[] jArr = this.f97829a;
        int i11 = this.f97832d;
        int i12 = i5 >> 3;
        int i13 = (i5 & 7) << 3;
        long j11 = (jArr[i12] & (~(255 << i13))) | (254 << i13);
        jArr[i12] = j11;
        jArr[(((i5 - 7) & i11) + (i11 & 7)) >> 3] = j11;
        this.f97830b[i5] = null;
    }

    public final void h(int i5, Object obj) {
        int iE = e(obj);
        if (iE < 0) {
            iE = ~iE;
        }
        this.f97830b[iE] = obj;
        this.f97831c[iE] = i5;
    }

    public /* synthetic */ h0() {
        this(6);
    }
}
