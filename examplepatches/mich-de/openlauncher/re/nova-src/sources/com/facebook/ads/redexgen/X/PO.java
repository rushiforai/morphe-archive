package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.Timeline;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;

/* loaded from: assets/audience_network/classes.dex */
public final class PO {
    public static final C1202Rk A0E = new C1202Rk(new Object());
    public final int A00;
    public final long A01;
    public final long A02;
    public final Timeline A03;
    public final C1202Rk A04;
    public final C1202Rk A05;
    public final RY A06;
    public final C1324Wj A07;

    @MetaExoPlayerCustomization
    public final EnumC1362Xz A08;

    @MetaExoPlayerCustomization
    public final boolean A09;
    public final boolean A0A;
    public volatile long A0B;
    public volatile long A0C;
    public volatile long A0D;

    public PO(Timeline timeline, long j11, RY ry2, C1324Wj c1324Wj) {
        this(timeline, A0E, j11, -9223372036854775807L, 1, false, ry2, c1324Wj, A0E, j11, j11, j11, EnumC1362Xz.A09, false);
    }

    @MetaExoPlayerCustomization
    public PO(Timeline timeline, C1202Rk c1202Rk, long j11, long j12, int i5, boolean z11, RY ry2, C1324Wj c1324Wj, C1202Rk c1202Rk2, long j13, long j14, long j15) {
        this(timeline, c1202Rk, j11, j12, i5, z11, ry2, c1324Wj, c1202Rk2, j13, j14, j15, EnumC1362Xz.A09, false);
    }

    @MetaExoPlayerCustomization
    public PO(@MetaExoPlayerCustomization(type = {"NEW_METHOD_ARGS"}) Timeline timeline, @MetaExoPlayerCustomization(type = {"NEW_METHOD_ARGS"}) C1202Rk c1202Rk, long j11, long j12, int i5, boolean z11, RY ry2, C1324Wj c1324Wj, C1202Rk c1202Rk2, long j13, long j14, long j15, EnumC1362Xz enumC1362Xz, boolean z12) {
        this.A03 = timeline;
        this.A05 = c1202Rk;
        this.A02 = j11;
        this.A01 = j12;
        this.A0C = j11;
        this.A00 = i5;
        this.A0A = z11;
        this.A06 = ry2;
        this.A07 = c1324Wj;
        this.A04 = c1202Rk2;
        this.A0B = j13;
        this.A0D = j14;
        this.A0C = j15;
        this.A08 = enumC1362Xz;
        this.A09 = z12;
    }

    public static void A00(PO po, PO po2) {
        po2.A0C = po.A0C;
        po2.A0B = po.A0B;
        po2.A0D = po.A0D;
    }

    public final PO A01(int i5) {
        PO po = new PO(this.A03, this.A05, this.A02, this.A01, i5, this.A0A, this.A06, this.A07, this.A04, this.A0B, this.A0D, this.A0C, this.A08, this.A09);
        A00(this, po);
        return po;
    }

    @MetaExoPlayerCustomization
    public final PO A02(int i5, EnumC1362Xz enumC1362Xz, boolean z11) {
        PO po = new PO(this.A03, this.A05, this.A02, this.A01, i5, this.A0A, this.A06, this.A07, this.A04, this.A0B, this.A0D, this.A0C, enumC1362Xz, z11);
        A00(this, po);
        return po;
    }

    @MetaExoPlayerCustomization
    public final PO A03(int i5, boolean z11) {
        PO po = new PO(this.A03, this.A05, this.A02, this.A01, i5, this.A0A, this.A06, this.A07, this.A04, this.A0B, this.A0D, this.A0C, this.A08, z11);
        A00(this, po);
        return po;
    }

    public final PO A04(Timeline timeline) {
        PO po = new PO(timeline, this.A05, this.A02, this.A01, this.A00, this.A0A, this.A06, this.A07, this.A04, this.A0B, this.A0D, this.A0C, this.A08, this.A09);
        A00(this, po);
        return po;
    }

    public final PO A05(C1202Rk c1202Rk) {
        return new PO(this.A03, this.A05, this.A02, this.A01, this.A00, this.A0A, this.A06, this.A07, c1202Rk, this.A0B, this.A0D, this.A0C, this.A08, this.A09);
    }

    public final PO A06(C1202Rk c1202Rk, long j11, long j12, long j13) {
        long j14 = j12;
        Timeline timeline = this.A03;
        if (!c1202Rk.A00()) {
            j14 = -9223372036854775807L;
        }
        return new PO(timeline, c1202Rk, j11, j14, this.A00, this.A0A, this.A06, this.A07, this.A04, this.A0B, j13, j11);
    }

    public final PO A07(RY ry2, C1324Wj c1324Wj) {
        PO po = new PO(this.A03, this.A05, this.A02, this.A01, this.A00, this.A0A, ry2, c1324Wj, this.A04, this.A0B, this.A0D, this.A0C, this.A08, this.A09);
        A00(this, po);
        return po;
    }

    public final PO A08(boolean z11) {
        PO po = new PO(this.A03, this.A05, this.A02, this.A01, this.A00, z11, this.A06, this.A07, this.A04, this.A0B, this.A0D, this.A0C, this.A08, this.A09);
        A00(this, po);
        return po;
    }
}
