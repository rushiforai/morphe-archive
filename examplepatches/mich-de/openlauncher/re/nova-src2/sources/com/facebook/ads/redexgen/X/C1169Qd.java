package com.facebook.ads.redexgen.X;

import android.os.Handler;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;

/* renamed from: com.facebook.ads.redexgen.X.Qd, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1169Qd {
    public final Handler A00;
    public final InterfaceC1170Qe A01;

    public C1169Qd(Handler handler, InterfaceC1170Qe interfaceC1170Qe) {
        this.A00 = interfaceC1170Qe != null ? (Handler) AbstractC1062Ln.A01(handler) : null;
        this.A01 = interfaceC1170Qe;
    }

    @MetaExoPlayerCustomization
    public final void A00(final int i5) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.QP
                @Override // java.lang.Runnable
                public final void run() {
                }
            });
        }
    }

    public final void A01(final int i5, final long j11, final long j12) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.QT
                @Override // java.lang.Runnable
                public final void run() {
                    this.A03.A02(i5, j11, j12);
                }
            });
        }
    }

    public final /* synthetic */ void A02(int i5, long j11, long j12) {
        ((InterfaceC1170Qe) N1.A0f(this.A01)).AE5(i5, j11, j12);
    }

    public final void A03(final long j11) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.QU
                @Override // java.lang.Runnable
                public final void run() {
                    this.A01.A04(j11);
                }
            });
        }
    }

    public final /* synthetic */ void A04(long j11) {
        ((InterfaceC1170Qe) N1.A0f(this.A01)).AE1(j11);
    }

    public final void A05(final VC vc, final OA oa2) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.QY
                @Override // java.lang.Runnable
                public final void run() {
                    this.A02.A06(vc, oa2);
                }
            });
        }
    }

    public final /* synthetic */ void A06(VC vc, OA oa2) {
        ((InterfaceC1170Qe) N1.A0f(this.A01)).ADz(vc);
        ((InterfaceC1170Qe) N1.A0f(this.A01)).AE0(vc, oa2);
    }

    public final void A07(final O7 o72) {
        o72.A02();
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.QW
                @Override // java.lang.Runnable
                public final void run() {
                    this.A01.A09(o72);
                }
            });
        }
    }

    public final void A08(final O7 o72) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.Qc
                @Override // java.lang.Runnable
                public final void run() {
                    this.A01.A0A(o72);
                }
            });
        }
    }

    public final /* synthetic */ void A09(O7 o72) {
        o72.A02();
        ((InterfaceC1170Qe) N1.A0f(this.A01)).ADx(o72);
    }

    public final /* synthetic */ void A0A(O7 o72) {
        ((InterfaceC1170Qe) N1.A0f(this.A01)).ADy(o72);
    }

    public final void A0B(final C1172Qg c1172Qg) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.QS
                @Override // java.lang.Runnable
                public final void run() {
                }
            });
        }
    }

    public final void A0C(final C1172Qg c1172Qg) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.QO
                @Override // java.lang.Runnable
                public final void run() {
                }
            });
        }
    }

    public final void A0D(final Exception exc) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.QV
                @Override // java.lang.Runnable
                public final void run() {
                    this.A00.A0E(exc);
                }
            });
        }
    }

    public final /* synthetic */ void A0E(Exception exc) {
        ((InterfaceC1170Qe) N1.A0f(this.A01)).AE2(exc);
    }

    @MetaExoPlayerCustomization
    public final void A0F(final String str) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.QZ
                @Override // java.lang.Runnable
                public final void run() {
                }
            });
        }
    }

    public final void A0G(final String str, final long j11, final long j12) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.QN
                @Override // java.lang.Runnable
                public final void run() {
                    this.A02.A0H(str, j11, j12);
                }
            });
        }
    }

    public final /* synthetic */ void A0H(String str, long j11, long j12) {
        ((InterfaceC1170Qe) N1.A0f(this.A01)).ADw(str, j11, j12);
    }

    public final void A0I(final boolean z11) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.QR
                @Override // java.lang.Runnable
                public final void run() {
                    this.A00.A0J(z11);
                }
            });
        }
    }

    public final /* synthetic */ void A0J(boolean z11) {
        ((InterfaceC1170Qe) N1.A0f(this.A01)).AH5(z11);
    }

    @MetaExoPlayerCustomization
    public final void A0K(final byte[] bArr, final long j11) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.Qa
                @Override // java.lang.Runnable
                public final void run() {
                }
            });
        }
    }
}
