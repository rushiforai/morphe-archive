package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.Timeline;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;

/* loaded from: assets/audience_network/classes.dex */
public final class Pz {
    public static String[] A06 = {"KJd4SIX9bFdOLKLE1j6Vag6lDPyxnKMM", "RQBlrOEc0ryI432moAmJKoCYD4hA7KSo", "e7rXMFN", "g7Wk7vPQofzQ3IT20EMjl4", "uRIv26KPiTMcDh", "Kt7e4scKpUDR", "Io8mfv0", "Fj3WcjTMYLJcnKYH"};
    public C1202Rk A00;
    public C1202Rk A01;
    public C1202Rk A02;
    public AbstractC07549l<C1202Rk> A03 = AbstractC07549l.A03();
    public AbstractC1307Vq<C1202Rk, Timeline> A04 = AbstractC1307Vq.A04();
    public final UM A05;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static C1202Rk A00(LQ lq, AbstractC07549l<C1202Rk> abstractC07549l, C1202Rk c1202Rk, UM um2) {
        Timeline timelineA8H = lq.A8H();
        int iA8D = lq.A8D();
        Object objA0M = timelineA8H.A0N() ? null : timelineA8H.A0M(iA8D);
        int iA07 = (lq.ABL() || timelineA8H.A0N()) ? -1 : timelineA8H.A0H(iA8D, um2).A07(N1.A0O(lq.A8F()) - um2.A0C());
        for (int i5 = 0; i5 < abstractC07549l.size(); i5++) {
            C1202Rk c1202Rk2 = abstractC07549l.get(i5);
            if (A04(c1202Rk2, objA0M, lq.ABL(), lq.A89(), lq.A8A(), iA07)) {
                return c1202Rk2;
            }
        }
        if (abstractC07549l.isEmpty() && c1202Rk != null) {
            if (A04(c1202Rk, objA0M, lq.ABL(), lq.A89(), lq.A8A(), iA07)) {
                return c1202Rk;
            }
        }
        return null;
    }

    public Pz(UM um2) {
        this.A05 = um2;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vr != com.google.common.collect.ImmutableMap$Builder<com.facebook.ads.androidx.media3.exoplayer.source.MediaSource$MediaPeriodId, com.facebook.ads.androidx.media3.common.Timeline> */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0052  */
    @MetaExoPlayerCustomization
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A02(Timeline timeline) {
        C1308Vr<C1202Rk, Timeline> c1308VrA03 = AbstractC1307Vq.A03();
        if (this.A03.isEmpty()) {
            A03(c1308VrA03, this.A01, timeline);
            C1202Rk c1202Rk = this.A02;
            if (A06[7].length() == 11) {
                throw new RuntimeException();
            }
            String[] strArr = A06;
            strArr[4] = "SFFeMhCWOx4mkt";
            strArr[3] = "OeAFK2mj2j4I62wsIHhNmd";
            if (!A6.A01(c1202Rk, this.A01)) {
                A03(c1308VrA03, this.A02, timeline);
            }
            C1202Rk c1202Rk2 = this.A00;
            if (A06[0].charAt(24) == 'D') {
                String[] strArr2 = A06;
                strArr2[4] = "nwjeKqa56zVpsX";
                strArr2[3] = "ZIYXg9JpEESGpw2jJSXeG4";
                if (!A6.A01(c1202Rk2, this.A01)) {
                }
            } else if (!A6.A01(c1202Rk2, this.A01)) {
                if (!A6.A01(this.A00, this.A02)) {
                    A03(c1308VrA03, this.A00, timeline);
                }
            }
        } else {
            for (int i5 = 0; i5 < this.A03.size(); i5++) {
                A03(c1308VrA03, this.A03.get(i5), timeline);
            }
            if (!this.A03.contains(this.A00)) {
                A03(c1308VrA03, this.A00, timeline);
            }
        }
        AbstractC1307Vq<C1202Rk, Timeline> abstractC1307VqA07 = c1308VrA03.A07();
        if (A06[1].charAt(2) != 'B') {
            this.A04 = abstractC1307VqA07;
        } else {
            A06[0] = "rKMKb263tcLdpphrkSuVJeufDK83wEO8";
            this.A04 = abstractC1307VqA07;
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vr != com.google.common.collect.ImmutableMap$Builder<com.facebook.ads.androidx.media3.exoplayer.source.MediaSource$MediaPeriodId, com.facebook.ads.androidx.media3.common.Timeline> */
    private void A03(C1308Vr<C1202Rk, Timeline> c1308Vr, C1202Rk c1202Rk, Timeline timeline) {
        if (c1202Rk == null) {
            return;
        }
        if (timeline.A0A(c1202Rk.A04) != -1) {
            c1308Vr.A05(c1202Rk, timeline);
            return;
        }
        Timeline existingTimeline = this.A04.get(c1202Rk);
        if (existingTimeline == null) {
            return;
        }
        c1308Vr.A05(c1202Rk, existingTimeline);
    }

    public static boolean A04(C1202Rk c1202Rk, Object obj, boolean z11, int i5, int i11, int i12) {
        if (c1202Rk.A04.equals(obj)) {
            return (z11 && c1202Rk.A00 == i5 && c1202Rk.A01 == i11) || (!z11 && c1202Rk.A00 == -1 && c1202Rk.A02 == i12);
        }
        return false;
    }

    public final Timeline A05(C1202Rk c1202Rk) {
        return this.A04.get(c1202Rk);
    }

    public final C1202Rk A06() {
        return this.A00;
    }

    public final void A07(LQ lq) {
        this.A00 = A00(lq, this.A03, this.A01, this.A05);
        A02(lq.A8H());
    }
}
