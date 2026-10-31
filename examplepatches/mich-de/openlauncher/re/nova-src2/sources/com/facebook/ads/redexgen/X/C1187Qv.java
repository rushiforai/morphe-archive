package com.facebook.ads.redexgen.X;

import android.content.Context;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.Qv, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1187Qv implements InterfaceC1333Ws, InterfaceC1108Ni {
    public int A00;
    public int A01;

    @MetaExoPlayerCustomization
    public int A02;
    public int A03;
    public long A04;
    public long A05;
    public long A06;
    public long A07;
    public long A08;
    public long A09;
    public boolean A0A;
    public final InterfaceC1069Lu A0B;
    public final C1331Wq A0C;
    public final XI A0D;

    @MetaExoPlayerCustomization
    public final Map<Integer, Long> A0E;
    public final boolean A0F;
    public static final List<Long> A0L = XR.A03(4400000L, 3200000L, 2300000L, 1600000L, 810000L);
    public static final List<Long> A0G = XR.A03(1400000L, 990000L, 730000L, 510000L, 230000L);
    public static final List<Long> A0H = XR.A03(2100000L, 1400000L, 1000000L, 890000L, 640000L);
    public static final List<Long> A0I = XR.A03(2600000L, 1700000L, 1300000L, 1000000L, 700000L);
    public static final List<Long> A0J = XR.A03(5700000L, 3700000L, 2300000L, 1700000L, 990000L);
    public static final List<Long> A0K = XR.A03(2800000L, 1800000L, 1400000L, 1100000L, 870000L);

    @Deprecated
    public C1187Qv() {
        this(null, Collections.emptyMap(), 2000, InterfaceC1069Lu.A00, false);
    }

    public C1187Qv(Context context, Map<Integer, Long> initialBitrateEstimates, int i5, InterfaceC1069Lu interfaceC1069Lu, boolean z11) {
        this.A0E = XR.A04(initialBitrateEstimates);
        this.A0C = new C1331Wq();
        this.A0D = new XI(i5);
        this.A0B = interfaceC1069Lu;
        this.A0F = z11;
        if (context != null) {
            C1078Me c1078MeA03 = C1078Me.A03(context);
            this.A00 = c1078MeA03.A09();
            this.A04 = A00(this.A00);
            c1078MeA03.A0A(new InterfaceC1076Mc() { // from class: com.facebook.ads.redexgen.X.Qw
                @Override // com.facebook.ads.redexgen.X.InterfaceC1076Mc
                public final void AG6(int i11) {
                    this.A00.A01(i11);
                }
            });
            return;
        }
        this.A00 = 0;
        this.A04 = A00(0);
    }

    private long A00(int i5) {
        Long initialBitrateEstimate = this.A0E.get(Integer.valueOf(i5));
        if (initialBitrateEstimate == null) {
            initialBitrateEstimate = this.A0E.get(0);
        }
        if (initialBitrateEstimate == null) {
            initialBitrateEstimate = 1000000L;
        }
        return initialBitrateEstimate.longValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void A01(int i5) {
        int sampleElapsedTimeMs;
        if (this.A00 == 0 || this.A0F) {
            if (this.A0A) {
                i5 = this.A01;
            }
            if (this.A00 == i5) {
                return;
            }
            this.A00 = i5;
            if (i5 == 1 || i5 == 0 || i5 == 8) {
                return;
            }
            this.A04 = A00(i5);
            long jA6s = this.A0B.A6s();
            if (this.A03 > 0) {
                long nowMs = jA6s - this.A07;
                sampleElapsedTimeMs = (int) nowMs;
            } else {
                sampleElapsedTimeMs = 0;
            }
            A02(sampleElapsedTimeMs, this.A06, this.A04);
            this.A07 = jA6s;
            this.A06 = 0L;
            this.A08 = 0L;
            this.A09 = 0L;
            this.A0D.A06();
        }
    }

    private void A02(int i5, long j11, long j12) {
        if (i5 == 0 && j11 == 0 && j12 == this.A05) {
            return;
        }
        this.A05 = j12;
        this.A0C.A00(i5, j11, j12);
    }

    public static boolean A04(NX nx2, boolean z11) {
        return z11 && !nx2.A06(8);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1108Ni
    public final synchronized void AEI(TE te2, NX nx2, boolean z11, int i5) {
        if (A04(nx2, z11)) {
            this.A06 += i5;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1108Ni
    public final synchronized void AHP(TE te2, NX nx2, boolean z11) {
        if (A04(nx2, z11)) {
            AbstractC1062Ln.A08(this.A03 > 0);
            long nowMs = this.A0B.A6s();
            int i5 = (int) (nowMs - this.A07);
            this.A09 += i5;
            this.A08 += this.A06;
            if (i5 > 0) {
                XI xi2 = this.A0D;
                int sampleElapsedTimeMs = (int) Math.sqrt(this.A06);
                xi2.A07(sampleElapsedTimeMs, (this.A06 * 8000.0f) / i5);
                if (this.A09 >= 2000 || this.A08 >= 524288) {
                    this.A04 = (long) this.A0D.A05(0.5f);
                }
                int sampleElapsedTimeMs2 = this.A02;
                this.A02 = sampleElapsedTimeMs2 + 1;
                A02(i5, this.A06, this.A04);
                this.A07 = nowMs;
                this.A06 = 0L;
            }
            int sampleElapsedTimeMs3 = this.A03;
            this.A03 = sampleElapsedTimeMs3 - 1;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1108Ni
    public final synchronized void AHQ(@MetaExoPlayerCustomization TE te2, NX nx2, boolean z11, boolean z12) {
        if (A04(nx2, z11)) {
            if (this.A03 == 0) {
                this.A07 = this.A0B.A6s();
            }
            this.A03++;
        }
    }
}
