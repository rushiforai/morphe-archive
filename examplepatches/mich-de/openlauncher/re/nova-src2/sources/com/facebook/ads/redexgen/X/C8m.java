package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.facebook.ads.androidx.media3.common.Timeline;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.8m, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C8m extends Timeline {
    public static byte[] A0D;
    public static final C1273Ug A0E;
    public static final Object A0F;
    public final long A00;
    public final long A01;
    public final long A02;
    public final long A03;
    public final long A04;
    public final long A05;
    public final long A06;
    public final C1277Uk A07;
    public final C1273Ug A08;
    public final Object A09;
    public final boolean A0A;
    public final boolean A0B;
    public final boolean A0C;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0D, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 48);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A0D = new byte[]{-93, -71, -66, -73, -68, -75, -96, -75, -62, -71, -65, -76, -92, -71, -67, -75, -68, -71, -66, -75};
    }

    static {
        A01();
        A0F = new Object();
        A0E = new C1034Kj().A03(A00(0, 20, 32)).A00(Uri.EMPTY).A05();
    }

    public C8m(long j11, long j12, long j13, long j14, long j15, long j16, long j17, boolean z11, boolean z12, boolean z13, Object obj, C1273Ug c1273Ug, C1277Uk c1277Uk) {
        this.A02 = j11;
        this.A06 = j12;
        this.A00 = j13;
        this.A01 = j14;
        this.A04 = j15;
        this.A05 = j16;
        this.A03 = j17;
        this.A0B = z11;
        this.A0A = z12;
        this.A0C = z13;
        this.A09 = obj;
        this.A08 = (C1273Ug) AbstractC1062Ln.A01(c1273Ug);
        this.A07 = c1277Uk;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public C8m(long j11, long j12, long j13, long j14, boolean z11, boolean z12, boolean z13, Object obj, C1273Ug c1273Ug) {
        C1277Uk c1277Uk;
        if (z13) {
            c1277Uk = c1273Ug.A02;
        } else {
            c1277Uk = null;
        }
        this(-9223372036854775807L, -9223372036854775807L, -9223372036854775807L, j11, j12, j13, j14, z11, z12, false, obj, c1273Ug, c1277Uk);
    }

    public C8m(long j11, boolean z11, boolean z12, boolean z13, Object obj, C1273Ug c1273Ug) {
        this(j11, j11, 0L, 0L, z11, z12, z13, obj, c1273Ug);
    }

    @Override // com.facebook.ads.androidx.media3.common.Timeline
    public final int A06() {
        return 1;
    }

    @Override // com.facebook.ads.androidx.media3.common.Timeline
    public final int A07() {
        return 1;
    }

    @Override // com.facebook.ads.androidx.media3.common.Timeline
    public final int A0A(Object obj) {
        return A0F.equals(obj) ? 0 : -1;
    }

    @Override // com.facebook.ads.androidx.media3.common.Timeline
    public final UM A0I(int i5, UM um2, boolean z11) {
        AbstractC1062Ln.A00(i5, 0, 1);
        return um2.A0F(null, z11 ? A0F : null, 0, this.A01, -this.A05);
    }

    @Override // com.facebook.ads.androidx.media3.common.Timeline
    public final UK A0L(int i5, UK uk2, long j11) {
        AbstractC1062Ln.A00(i5, 0, 1);
        long j12 = this.A03;
        if (this.A0A && !this.A0C && j11 != 0) {
            if (this.A04 == -9223372036854775807L) {
                j12 = -9223372036854775807L;
            } else {
                j12 += j11;
                if (j12 > this.A04) {
                    j12 = -9223372036854775807L;
                }
            }
        }
        return uk2.A07(UK.A0K, this.A08, this.A09, this.A02, this.A06, -9223372036854775807L, this.A0B, this.A0A, null, j12, this.A04, 0, 0, this.A05);
    }

    @Override // com.facebook.ads.androidx.media3.common.Timeline
    public final Object A0M(int i5) {
        AbstractC1062Ln.A00(i5, 0, 1);
        return A0F;
    }
}
