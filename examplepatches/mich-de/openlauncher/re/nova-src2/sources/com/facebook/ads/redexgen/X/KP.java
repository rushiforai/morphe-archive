package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.ColorInfo;

/* loaded from: assets/audience_network/classes.dex */
public final class KP {
    public int A00;
    public int A01;
    public int A02;
    public byte[] A03;

    public KP() {
        this.A01 = -1;
        this.A00 = -1;
        this.A02 = -1;
    }

    public KP(ColorInfo colorInfo) {
        this.A01 = colorInfo.A02;
        this.A00 = colorInfo.A01;
        this.A02 = colorInfo.A03;
        this.A03 = colorInfo.A04;
    }

    public /* synthetic */ KP(ColorInfo colorInfo, KO ko2) {
        this(colorInfo);
    }

    public final KP A00(int i5) {
        this.A00 = i5;
        return this;
    }

    public final KP A01(int i5) {
        this.A01 = i5;
        return this;
    }

    public final KP A02(int i5) {
        this.A02 = i5;
        return this;
    }

    public final ColorInfo A03() {
        return new ColorInfo(this.A01, this.A00, this.A02, this.A03);
    }
}
