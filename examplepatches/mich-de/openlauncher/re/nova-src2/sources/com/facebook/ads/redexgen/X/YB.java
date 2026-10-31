package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.SystemClock;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;

/* loaded from: assets/audience_network/classes.dex */
public final class YB {
    public final Handler A00;
    public final YC A01;

    public YB(Handler handler, YC yc) {
        this.A00 = yc != null ? (Handler) AbstractC1062Ln.A01(handler) : null;
        this.A01 = yc;
    }

    public final void A00(final int i5, final long j11) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.Y7
                @Override // java.lang.Runnable
                public final void run() {
                    this.A02.A02(i5, j11);
                }
            });
        }
    }

    public final void A01(final int i5, final long j11) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.Xy
                @Override // java.lang.Runnable
                public final void run() {
                    this.A02.A03(i5, j11);
                }
            });
        }
    }

    public final /* synthetic */ void A02(int i5, long j11) {
        ((YC) N1.A0f(this.A01)).AEV(i5, j11);
    }

    public final /* synthetic */ void A03(int i5, long j11) {
        ((YC) N1.A0f(this.A01)).AEn(i5, j11);
    }

    @MetaExoPlayerCustomization
    public final void A04(int i5, VC vc) {
        if (this.A01 != null) {
            this.A00.post(new YA(this, i5, vc));
        }
    }

    public final void A05(final VC vc, final OA oa2) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.Y4
                @Override // java.lang.Runnable
                public final void run() {
                    this.A02.A06(vc, oa2);
                }
            });
        }
    }

    public final /* synthetic */ void A06(VC vc, OA oa2) {
        ((YC) N1.A0f(this.A01)).AHe(vc);
        ((YC) N1.A0f(this.A01)).AHf(vc, oa2);
    }

    public final void A07(final C1259Tp c1259Tp) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.Y6
                @Override // java.lang.Runnable
                public final void run() {
                    this.A01.A08(c1259Tp);
                }
            });
        }
    }

    public final /* synthetic */ void A08(C1259Tp c1259Tp) {
        ((YC) N1.A0f(this.A01)).AHl(c1259Tp);
    }

    public final void A09(final O7 o72) {
        o72.A02();
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.Y8
                @Override // java.lang.Runnable
                public final void run() {
                    this.A01.A0B(o72);
                }
            });
        }
    }

    public final void A0A(final O7 o72) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.Y2
                @Override // java.lang.Runnable
                public final void run() {
                    this.A01.A0C(o72);
                }
            });
        }
    }

    public final /* synthetic */ void A0B(O7 o72) {
        o72.A02();
        ((YC) N1.A0f(this.A01)).AHY(o72);
    }

    public final /* synthetic */ void A0C(O7 o72) {
        ((YC) N1.A0f(this.A01)).AHZ(o72);
    }

    public final void A0D(final Object obj) {
        if (this.A00 != null) {
            final long jElapsedRealtime = SystemClock.elapsedRealtime();
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.Y3
                @Override // java.lang.Runnable
                public final void run() {
                    this.A01.A0E(obj, jElapsedRealtime);
                }
            });
        }
    }

    public final /* synthetic */ void A0E(Object obj, long j11) {
        ((YC) N1.A0f(this.A01)).AGm(obj, j11);
    }

    @MetaExoPlayerCustomization
    public final void A0F(final String str) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.Y5
                @Override // java.lang.Runnable
                public final void run() {
                }
            });
        }
    }

    public final void A0G(final String str, final long j11, final long j12) {
        if (this.A00 != null) {
            this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.Y1
                @Override // java.lang.Runnable
                public final void run() {
                    this.A02.A0H(str, j11, j12);
                }
            });
        }
    }

    public final /* synthetic */ void A0H(String str, long j11, long j12) {
        ((YC) N1.A0f(this.A01)).AHX(str, j11, j12);
    }
}
