package z;

import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes.dex */
public final class a0 extends h {

    /* renamed from: f, reason: collision with root package name */
    public int f97739f;

    public a0(int i5) {
        this.f97774a = z0.f97875a;
        int[] iArr = p.f97811a;
        this.f97775b = iArr;
        this.f97776c = iArr;
        if (i5 >= 0) {
            e(z0.d(i5));
        } else {
            android.support.v4.media.session.b.k0("Capacity must be a positive value.");
            throw null;
        }
    }

    public final void c() {
        this.f97778e = 0;
        long[] jArr = this.f97774a;
        if (jArr != z0.f97875a) {
            u90.b.D(jArr, -9187201950435737472L);
            long[] jArr2 = this.f97774a;
            int i5 = this.f97777d;
            int i11 = i5 >> 3;
            long j11 = 255 << ((i5 & 7) << 3);
            jArr2[i11] = (jArr2[i11] & (~j11)) | j11;
        }
        this.f97739f = z0.a(this.f97777d) - this.f97778e;
    }

    public final int d(int i5) {
        int i11 = this.f97777d;
        int i12 = i5 & i11;
        int i13 = 0;
        while (true) {
            long[] jArr = this.f97774a;
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

    public final void e(int i5) {
        long[] jArr;
        int iMax = i5 > 0 ? Math.max(7, z0.c(i5)) : 0;
        this.f97777d = iMax;
        if (iMax == 0) {
            jArr = z0.f97875a;
        } else {
            jArr = new long[((iMax + 15) & (-8)) >> 3];
            u90.b.D(jArr, -9187201950435737472L);
        }
        this.f97774a = jArr;
        int i11 = iMax >> 3;
        long j11 = 255 << ((iMax & 7) << 3);
        jArr[i11] = (jArr[i11] & (~j11)) | j11;
        this.f97739f = z0.a(this.f97777d) - this.f97778e;
        this.f97775b = new int[iMax];
        this.f97776c = new int[iMax];
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x006e, code lost:
    
        r21 = r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:11:0x007a, code lost:
    
        if (((r7 & ((~r7) << 6)) & (-9187201950435737472L)) == 0) goto L59;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x007c, code lost:
    
        r2 = d(r4);
        r11 = 255;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0084, code lost:
    
        if (r37.f97739f != 0) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0098, code lost:
    
        if (((r37.f97774a[r2 >> 3] >> ((r2 & 7) << 3)) & 255) != 254) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x009a, code lost:
    
        r27 = r9;
        r25 = 255;
        r18 = 1;
        r32 = 0;
        r19 = 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x00a8, code lost:
    
        r2 = r37.f97777d;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x00aa, code lost:
    
        if (r2 <= 8) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x00ac, code lost:
    
        r19 = 128;
        r5 = r37.f97778e;
        r3 = kotlin.ULong.f71699b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x00c0, code lost:
    
        if (java.lang.Long.compareUnsigned(r5 * 32, r2 * 25) > 0) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x00c2, code lost:
    
        r2 = r37.f97774a;
        r3 = r37.f97777d;
        r5 = r37.f97775b;
        r6 = r37.f97776c;
        r13 = (r3 + 7) >> 3;
        r7 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x00d1, code lost:
    
        if (r7 >= r13) goto L63;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x00d3, code lost:
    
        r8 = r2[r7] & (-9187201950435737472L);
        r2[r7] = (-72340172838076674L) & ((~r8) + (r8 >>> 7));
        r7 = r7 + 1;
        r11 = r11;
        r9 = r9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x00ef, code lost:
    
        r27 = r9;
        r25 = r11;
        r12 = 7;
        r7 = kotlin.collections.c.B0(r2);
        r8 = r7 - 1;
        r2[r8] = (r2[r8] & 72057594037927935L) | (-72057594037927936L);
        r2[r7] = r2[0];
        r7 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x010e, code lost:
    
        if (r7 == r3) goto L64;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0110, code lost:
    
        r8 = r7 >> 3;
        r11 = (r7 & 7) << 3;
        r9 = (r2[r8] >> r11) & r25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x011d, code lost:
    
        if (r9 != 128) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x011f, code lost:
    
        r7 = r7 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0124, code lost:
    
        if (r9 == 254) goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x0127, code lost:
    
        r9 = java.lang.Integer.hashCode(r5[r7]) * r21;
        r10 = (r9 ^ (r9 << 16)) >>> 7;
        r13 = d(r10);
        r10 = r10 & r3;
        r29 = r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0148, code lost:
    
        if ((((r13 - r10) & r3) / 8) != (((r7 - r10) & r3) / 8)) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x014a, code lost:
    
        r32 = r15;
        r2[r8] = ((r9 & com.vungle.ads.internal.protos.Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << r11) | (r2[r8] & (~(r25 << r11)));
        r2[r2.length - 1] = (r2[r32] & 72057594037927935L) | Long.MIN_VALUE;
        r7 = r7 + 1;
        r14 = r14;
        r12 = r29;
        r15 = r32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x016f, code lost:
    
        r18 = r14;
        r32 = r15;
        r10 = r13 >> 3;
        r14 = r2[r10];
        r12 = (r13 & 7) << 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0181, code lost:
    
        if (((r14 >> r12) & r25) != 128) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0183, code lost:
    
        r33 = r5;
        r34 = r6;
        r2[r10] = ((~(r25 << r12)) & r14) | ((r9 & com.vungle.ads.internal.protos.Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << r12);
        r2[r8] = (r2[r8] & (~(r25 << r11))) | (128 << r11);
        r33[r13] = r33[r7];
        r33[r7] = r32;
        r34[r13] = r34[r7];
        r34[r7] = r32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x01ad, code lost:
    
        r33 = r5;
        r34 = r6;
        r2[r10] = ((r9 & com.vungle.ads.internal.protos.Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << r12) | ((~(r25 << r12)) & r14);
        r5 = r33[r13];
        r33[r13] = r33[r7];
        r33[r7] = r5;
        r5 = r34[r13];
        r34[r13] = r34[r7];
        r34[r7] = r5;
        r7 = r7 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x01ce, code lost:
    
        r2[r2.length - 1] = (r2[r32] & 72057594037927935L) | Long.MIN_VALUE;
        r7 = r7 + 1;
        r14 = r18;
        r12 = r29;
        r15 = r32;
        r5 = r33;
        r6 = r34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x01e7, code lost:
    
        r18 = r14;
        r32 = r15;
        r37.f97739f = z.z0.a(r37.f97777d) - r37.f97778e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x01fa, code lost:
    
        r27 = r9;
        r25 = 255;
        r18 = 1;
        r32 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x0205, code lost:
    
        r19 = 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0208, code lost:
    
        r2 = z.z0.b(r37.f97777d);
        r3 = r37.f97774a;
        r5 = r37.f97775b;
        r6 = r37.f97776c;
        r7 = r37.f97777d;
        e(r2);
        r2 = r37.f97774a;
        r8 = r37.f97775b;
        r9 = r37.f97776c;
        r10 = r37.f97777d;
        r11 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0223, code lost:
    
        if (r11 >= r7) goto L74;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0232, code lost:
    
        if (((r3[r11 >> 3] >> ((r11 & 7) << 3)) & 255) >= r19) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x0234, code lost:
    
        r12 = r5[r11];
        r13 = java.lang.Integer.hashCode(r12) * r21;
        r13 = r13 ^ (r13 << 16);
        r14 = d(r13 >>> 7);
        r15 = r2;
        r1 = r13 & com.vungle.ads.internal.protos.Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        r13 = r14 >> 3;
        r16 = (r14 & 7) << 3;
        r1 = (r15[r13] & (~(255 << r16))) | (r1 << r16);
        r15[r13] = r1;
        r15[(((r14 - 7) & r10) + (r10 & 7)) >> 3] = r1;
        r8[r14] = r12;
        r9[r14] = r6[r11];
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x0270, code lost:
    
        r15 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0271, code lost:
    
        r11 = r11 + 1;
        r2 = r15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0277, code lost:
    
        r2 = d(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x027b, code lost:
    
        r37.f97778e++;
        r1 = r37.f97739f;
        r3 = r37.f97774a;
        r4 = r2 >> 3;
        r5 = r3[r4];
        r7 = (r2 & 7) << 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0293, code lost:
    
        if (((r5 >> r7) & r25) != r19) goto L54;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0295, code lost:
    
        r32 = r18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0297, code lost:
    
        r37.f97739f = r1 - r32;
        r1 = r37.f97777d;
        r5 = (r5 & (~(r25 << r7))) | (r27 << r7);
        r3[r4] = r5;
        r3[(((r2 - 7) & r1) + (r1 & 7)) >> 3] = r5;
        r13 = ~r2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void f(int i5, int i11) {
        int i12;
        int iNumberOfTrailingZeros;
        int i13 = i5;
        int i14 = -862048943;
        int iHashCode = Integer.hashCode(i13) * (-862048943);
        int i15 = iHashCode ^ (iHashCode << 16);
        int i16 = i15 >>> 7;
        int i17 = i15 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i18 = this.f97777d;
        int i19 = i16 & i18;
        int i21 = 0;
        loop0: while (true) {
            long[] jArr = this.f97774a;
            int i22 = i19 >> 3;
            int i23 = (i19 & 7) << 3;
            int i24 = 1;
            int i25 = i21;
            int i26 = 0;
            long j11 = (((-i23) >> 63) & (jArr[i22 + 1] << (64 - i23))) | (jArr[i22] >>> i23);
            long j12 = i17;
            long j13 = j11 ^ (j12 * 72340172838076673L);
            long j14 = (j13 - 72340172838076673L) & (~j13) & (-9187201950435737472L);
            while (true) {
                if (j14 == 0) {
                    break;
                }
                iNumberOfTrailingZeros = ((Long.numberOfTrailingZeros(j14) >> 3) + i19) & i18;
                int i27 = i14;
                if (this.f97775b[iNumberOfTrailingZeros] == i13) {
                    break loop0;
                }
                j14 &= j14 - 1;
                i14 = i27;
            }
            i21 = i25 + 8;
            i19 = (i19 + i21) & i18;
            i13 = i5;
            i14 = i12;
        }
        if (iNumberOfTrailingZeros < 0) {
            iNumberOfTrailingZeros = ~iNumberOfTrailingZeros;
        }
        this.f97775b[iNumberOfTrailingZeros] = i5;
        this.f97776c[iNumberOfTrailingZeros] = i11;
    }

    public /* synthetic */ a0() {
        this(6);
    }
}
