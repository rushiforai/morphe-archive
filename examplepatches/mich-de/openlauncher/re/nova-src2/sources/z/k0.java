package z;

import androidx.compose.ui.node.LayoutNode;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Collection;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class k0 extends w0 {

    /* renamed from: h, reason: collision with root package name */
    public int f97785h;

    public k0(int i5) {
        this.f97850a = z0.f97875a;
        this.f97851b = a0.a.f56c;
        this.f97852c = w.f97849b;
        this.f97853d = LayoutNode.NotPlacedPlaceOrder;
        this.f97854e = LayoutNode.NotPlacedPlaceOrder;
        if (i5 >= 0) {
            f(z0.d(i5));
        } else {
            android.support.v4.media.session.b.k0("Capacity must be a positive value.");
            throw null;
        }
    }

    public final boolean b(Object obj) {
        int i5 = this.f97856g;
        int iD = d(obj);
        this.f97851b[iD] = obj;
        long[] jArr = this.f97852c;
        int i11 = this.f97853d;
        jArr[iD] = (i11 & 2147483647L) | 4611686016279904256L;
        if (i11 != Integer.MAX_VALUE) {
            jArr[i11] = ((iD & 2147483647L) << 31) | (jArr[i11] & (-4611686016279904257L));
        }
        this.f97853d = iD;
        if (this.f97854e == Integer.MAX_VALUE) {
            this.f97854e = iD;
        }
        return this.f97856g != i5;
    }

    public final void c() {
        this.f97856g = 0;
        long[] jArr = this.f97850a;
        if (jArr != z0.f97875a) {
            u90.b.D(jArr, -9187201950435737472L);
            long[] jArr2 = this.f97850a;
            int i5 = this.f97855f;
            int i11 = i5 >> 3;
            long j11 = 255 << ((i5 & 7) << 3);
            jArr2[i11] = (jArr2[i11] & (~j11)) | j11;
        }
        u90.b.B(0, this.f97855f, null, this.f97851b);
        u90.b.D(this.f97852c, 4611686018427387903L);
        this.f97853d = LayoutNode.NotPlacedPlaceOrder;
        this.f97854e = LayoutNode.NotPlacedPlaceOrder;
        this.f97785h = z0.a(this.f97855f) - this.f97856g;
    }

    public final int d(Object obj) {
        int i5;
        long j11;
        long j12;
        long j13;
        char c11;
        long[] jArr;
        long[] jArr2;
        long j14;
        int i11 = -862048943;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * (-862048943);
        int i12 = iHashCode ^ (iHashCode << 16);
        int i13 = i12 >>> 7;
        int i14 = i12 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i15 = this.f97855f;
        int i16 = i13 & i15;
        int i17 = 0;
        while (true) {
            long[] jArr3 = this.f97850a;
            int i18 = i16 >> 3;
            int i19 = (i16 & 7) << 3;
            long j15 = ((jArr3[i18 + 1] << (64 - i19)) & ((-i19) >> 63)) | (jArr3[i18] >>> i19);
            long j16 = i14;
            long j17 = j15 ^ (j16 * 72340172838076673L);
            long j18 = (j17 - 72340172838076673L) & (~j17) & (-9187201950435737472L);
            while (j18 != 0) {
                int iNumberOfTrailingZeros = ((Long.numberOfTrailingZeros(j18) >> 3) + i16) & i15;
                int i21 = i11;
                if (Intrinsics.b(this.f97851b[iNumberOfTrailingZeros], obj)) {
                    return iNumberOfTrailingZeros;
                }
                j18 &= j18 - 1;
                i11 = i21;
            }
            int i22 = i11;
            if ((j15 & ((~j15) << 6) & (-9187201950435737472L)) != 0) {
                int iE = e(i13);
                long j19 = 255;
                if (this.f97785h != 0 || ((this.f97850a[iE >> 3] >> ((iE & 7) << 3)) & 255) == 254) {
                    i5 = 0;
                    j11 = j16;
                    j12 = 255;
                    j13 = 128;
                } else {
                    int i23 = this.f97855f;
                    if (i23 > 8) {
                        c11 = 31;
                        long j21 = this.f97856g;
                        ULong.Companion companion = ULong.f71699b;
                        j13 = 128;
                        if (Long.compareUnsigned(j21 * 32, i23 * 25) <= 0) {
                            long[] jArr4 = this.f97850a;
                            if (jArr4 == null) {
                                i5 = 0;
                                j11 = j16;
                                j12 = 255;
                            } else {
                                int i24 = this.f97855f;
                                Object[] objArr = this.f97851b;
                                long[] jArr5 = this.f97852c;
                                long[] jArr6 = new long[i24];
                                Arrays.fill(jArr6, 0, i24, 9223372034707292159L);
                                i5 = 0;
                                int i25 = (i24 + 7) >> 3;
                                int i26 = 0;
                                while (i26 < i25) {
                                    long j22 = j19;
                                    long j23 = jArr4[i26] & (-9187201950435737472L);
                                    int i27 = i26;
                                    jArr4[i27] = ((~j23) + (j23 >>> 7)) & (-72340172838076674L);
                                    i26 = i27 + 1;
                                    j19 = j22;
                                }
                                j12 = j19;
                                int length = jArr4.length;
                                int i28 = length - 1;
                                int i29 = length - 2;
                                jArr4[i29] = (jArr4[i29] & 72057594037927935L) | (-72057594037927936L);
                                jArr4[i28] = jArr4[0];
                                int i31 = 0;
                                while (i31 != i24) {
                                    int i32 = i31 >> 3;
                                    int i33 = (i31 & 7) << 3;
                                    long j24 = (jArr4[i32] >> i33) & j12;
                                    if (j24 != 128 && j24 == 254) {
                                        Object obj2 = objArr[i31];
                                        int iHashCode2 = (obj2 != null ? obj2.hashCode() : 0) * i22;
                                        int i34 = (iHashCode2 ^ (iHashCode2 << 16)) >>> 7;
                                        int iE2 = e(i34);
                                        int i35 = i34 & i24;
                                        if (((iE2 - i35) & i24) / 8 == ((i31 - i35) & i24) / 8) {
                                            int i36 = i24;
                                            Object[] objArr2 = objArr;
                                            jArr4[i32] = (jArr4[i32] & (~(j12 << i33))) | ((r17 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i33);
                                            if (jArr6[i31] == 9223372034707292159L) {
                                                long j25 = i31;
                                                jArr6[i31] = j25 | (j25 << 32);
                                            }
                                            jArr4[jArr4.length - 1] = jArr4[0];
                                            i31++;
                                            i24 = i36;
                                            objArr = objArr2;
                                        } else {
                                            int i37 = i24;
                                            Object[] objArr3 = objArr;
                                            int i38 = iE2 >> 3;
                                            long j26 = jArr4[i38];
                                            int i39 = (iE2 & 7) << 3;
                                            if (((j26 >> i39) & j12) == 128) {
                                                jArr4[i38] = (j26 & (~(j12 << i39))) | ((r17 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i39);
                                                jArr4[i32] = (jArr4[i32] & (~(j12 << i33))) | (128 << i33);
                                                objArr3[iE2] = objArr3[i31];
                                                objArr3[i31] = null;
                                                jArr5[iE2] = jArr5[i31];
                                                jArr5[i31] = 4611686018427387903L;
                                                int i40 = (int) ((jArr6[i31] >> 32) & 4294967295L);
                                                int i41 = LayoutNode.NotPlacedPlaceOrder;
                                                if (i40 != Integer.MAX_VALUE) {
                                                    j14 = j16;
                                                    jArr6[i40] = iE2 | (jArr6[i40] & (-4294967296L));
                                                    jArr6[i31] = (jArr6[i31] & 4294967295L) | (-4294967296L);
                                                    i41 = LayoutNode.NotPlacedPlaceOrder;
                                                } else {
                                                    j14 = j16;
                                                    jArr6[i31] = (LayoutNode.NotPlacedPlaceOrder << 32) | iE2;
                                                }
                                                jArr6[iE2] = (i31 << 32) | i41;
                                            } else {
                                                j14 = j16;
                                                jArr4[i38] = ((r17 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i39) | (j26 & (~(j12 << i39)));
                                                Object obj3 = objArr3[iE2];
                                                objArr3[iE2] = objArr3[i31];
                                                objArr3[i31] = obj3;
                                                long j27 = jArr5[iE2];
                                                jArr5[iE2] = jArr5[i31];
                                                jArr5[i31] = j27;
                                                int i42 = (int) ((jArr6[i31] >> 32) & 4294967295L);
                                                if (i42 != Integer.MAX_VALUE) {
                                                    long j28 = iE2;
                                                    jArr6[i42] = (jArr6[i42] & (-4294967296L)) | j28;
                                                    jArr6[i31] = (jArr6[i31] & 4294967295L) | (j28 << 32);
                                                } else {
                                                    long j29 = iE2;
                                                    jArr6[i31] = j29 | (j29 << 32);
                                                    i42 = i31;
                                                }
                                                jArr6[iE2] = (i42 << 32) | i31;
                                                i31--;
                                            }
                                            jArr4[jArr4.length - 1] = jArr4[0];
                                            i31++;
                                            i24 = i37;
                                            objArr = objArr3;
                                            j16 = j14;
                                        }
                                    } else {
                                        i31++;
                                    }
                                }
                                j11 = j16;
                                this.f97785h = z0.a(this.f97855f) - this.f97856g;
                                long[] jArr7 = this.f97852c;
                                int length2 = jArr7.length;
                                for (int i43 = 0; i43 < length2; i43++) {
                                    long j31 = jArr7[i43];
                                    jArr7[i43] = (((j31 & (-4611686018427387904L)) | (((int) ((j31 >> 31) & 2147483647L)) == Integer.MAX_VALUE ? Integer.MAX_VALUE : (int) (jArr6[r4] & 4294967295L))) << 31) | (((int) (j31 & 2147483647L)) == Integer.MAX_VALUE ? LayoutNode.NotPlacedPlaceOrder : (int) (jArr6[r6] & 4294967295L));
                                }
                                int i44 = this.f97853d;
                                if (i44 != Integer.MAX_VALUE) {
                                    this.f97853d = (int) (jArr6[i44] & 4294967295L);
                                }
                                int i45 = this.f97854e;
                                if (i45 != Integer.MAX_VALUE) {
                                    this.f97854e = (int) (jArr6[i45] & 4294967295L);
                                }
                            }
                        }
                        iE = e(i13);
                    } else {
                        c11 = 31;
                        j13 = 128;
                    }
                    i5 = 0;
                    j11 = j16;
                    j12 = 255;
                    int iB = z0.b(this.f97855f);
                    long[] jArr8 = this.f97850a;
                    Object[] objArr4 = this.f97851b;
                    long[] jArr9 = this.f97852c;
                    int i46 = this.f97855f;
                    int[] iArr = new int[i46];
                    f(iB);
                    long[] jArr10 = this.f97850a;
                    Object[] objArr5 = this.f97851b;
                    long[] jArr11 = this.f97852c;
                    int i47 = this.f97855f;
                    int i48 = 0;
                    while (i48 < i46) {
                        if (((jArr8[i48 >> 3] >> ((i48 & 7) << 3)) & 255) < j13) {
                            Object obj4 = objArr4[i48];
                            int iHashCode3 = (obj4 != null ? obj4.hashCode() : 0) * i22;
                            int i49 = iHashCode3 ^ (iHashCode3 << 16);
                            int iE3 = e(i49 >>> 7);
                            jArr = jArr10;
                            jArr2 = jArr8;
                            long j32 = i49 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
                            int i51 = iE3 >> 3;
                            int i52 = (iE3 & 7) << 3;
                            long j33 = (jArr[i51] & (~(255 << i52))) | (j32 << i52);
                            jArr[i51] = j33;
                            jArr[(((iE3 - 7) & i47) + (i47 & 7)) >> 3] = j33;
                            objArr5[iE3] = obj4;
                            jArr11[iE3] = jArr9[i48];
                            iArr[i48] = iE3;
                        } else {
                            jArr = jArr10;
                            jArr2 = jArr8;
                        }
                        i48++;
                        jArr8 = jArr2;
                        jArr10 = jArr;
                    }
                    long[] jArr12 = this.f97852c;
                    int length3 = jArr12.length;
                    for (int i53 = 0; i53 < length3; i53++) {
                        long j34 = jArr12[i53];
                        jArr12[i53] = (((j34 & (-4611686018427387904L)) | (((int) ((j34 >> c11) & 2147483647L)) == Integer.MAX_VALUE ? Integer.MAX_VALUE : iArr[r4])) << c11) | (((int) (j34 & 2147483647L)) == Integer.MAX_VALUE ? Integer.MAX_VALUE : iArr[r6]);
                    }
                    int i54 = this.f97853d;
                    if (i54 != Integer.MAX_VALUE) {
                        this.f97853d = iArr[i54];
                    }
                    int i55 = this.f97854e;
                    if (i55 != Integer.MAX_VALUE) {
                        this.f97854e = iArr[i55];
                    }
                    iE = e(i13);
                }
                this.f97856g++;
                int i56 = this.f97785h;
                long[] jArr13 = this.f97850a;
                int i57 = iE >> 3;
                long j35 = jArr13[i57];
                int i58 = (iE & 7) << 3;
                if (((j35 >> i58) & j12) == j13) {
                    i5 = 1;
                }
                this.f97785h = i56 - i5;
                int i59 = this.f97855f;
                long j36 = (j35 & (~(j12 << i58))) | (j11 << i58);
                jArr13[i57] = j36;
                jArr13[(((iE - 7) & i59) + (i59 & 7)) >> 3] = j36;
                return iE;
            }
            i17 += 8;
            i16 = (i16 + i17) & i15;
            i11 = i22;
        }
    }

    public final int e(int i5) {
        int i11 = this.f97855f;
        int i12 = i5 & i11;
        int i13 = 0;
        while (true) {
            long[] jArr = this.f97850a;
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
        long[] jArr2;
        int iMax = i5 > 0 ? Math.max(7, z0.c(i5)) : 0;
        this.f97855f = iMax;
        if (iMax == 0) {
            jArr = z0.f97875a;
        } else {
            jArr = new long[((iMax + 15) & (-8)) >> 3];
            u90.b.D(jArr, -9187201950435737472L);
        }
        this.f97850a = jArr;
        int i11 = iMax >> 3;
        long j11 = 255 << ((iMax & 7) << 3);
        jArr[i11] = (jArr[i11] & (~j11)) | j11;
        this.f97785h = z0.a(this.f97855f) - this.f97856g;
        this.f97851b = iMax == 0 ? a0.a.f56c : new Object[iMax];
        if (iMax == 0) {
            jArr2 = w.f97849b;
        } else {
            jArr2 = new long[iMax];
            u90.b.D(jArr2, 4611686018427387903L);
        }
        this.f97852c = jArr2;
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
    public final boolean g(Object obj) {
        int iNumberOfTrailingZeros;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * (-862048943);
        int i5 = iHashCode ^ (iHashCode << 16);
        int i11 = i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i12 = this.f97855f;
        int i13 = (i5 >>> 7) & i12;
        int i14 = 0;
        loop0: while (true) {
            long[] jArr = this.f97850a;
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
                if (Intrinsics.b(this.f97851b[iNumberOfTrailingZeros], obj)) {
                    break loop0;
                }
                j13 &= j13 - 1;
            }
            i14 += 8;
            i13 = (i13 + i14) & i12;
        }
        boolean z11 = iNumberOfTrailingZeros >= 0;
        if (z11) {
            h(iNumberOfTrailingZeros);
        }
        return z11;
    }

    public final void h(int i5) {
        this.f97856g--;
        long[] jArr = this.f97850a;
        int i11 = this.f97855f;
        int i12 = i5 >> 3;
        int i13 = (i5 & 7) << 3;
        long j11 = (jArr[i12] & (~(255 << i13))) | (254 << i13);
        jArr[i12] = j11;
        jArr[(((i5 - 7) & i11) + (i11 & 7)) >> 3] = j11;
        this.f97851b[i5] = null;
        long[] jArr2 = this.f97852c;
        long j12 = jArr2[i5];
        int i14 = (int) ((j12 >> 31) & 2147483647L);
        int i15 = (int) (j12 & 2147483647L);
        if (i14 != Integer.MAX_VALUE) {
            jArr2[i14] = (jArr2[i14] & (-2147483648L)) | (i15 & 2147483647L);
        } else {
            this.f97853d = i15;
        }
        if (i15 != Integer.MAX_VALUE) {
            jArr2[i15] = ((i14 & 2147483647L) << 31) | (jArr2[i15] & (-4611686016279904257L));
        } else {
            this.f97854e = i14;
        }
        jArr2[i5] = 4611686018427387903L;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0052  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean i(Collection elements) {
        Intrinsics.g(elements, "elements");
        Object[] objArr = this.f97851b;
        int i5 = this.f97856g;
        long[] jArr = this.f97850a;
        int length = jArr.length - 2;
        if (length >= 0) {
            int i11 = 0;
            while (true) {
                long j11 = jArr[i11];
                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i12 = 8 - ((~(i11 - length)) >>> 31);
                    for (int i13 = 0; i13 < i12; i13++) {
                        if ((255 & j11) < 128) {
                            int i14 = (i11 << 3) + i13;
                            if (!b70.g.O0(elements, objArr[i14])) {
                                h(i14);
                            }
                        }
                        j11 >>= 8;
                    }
                    if (i12 != 8) {
                        break;
                    }
                    if (i11 == length) {
                        break;
                    }
                    i11++;
                }
            }
        }
        return i5 != this.f97856g;
    }
}
