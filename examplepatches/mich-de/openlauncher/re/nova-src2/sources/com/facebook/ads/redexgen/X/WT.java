package com.facebook.ads.redexgen.X;

import com.facebook.ads.redexgen.X.WT;

/* loaded from: assets/audience_network/classes.dex */
public abstract class WT<T extends WT<T>> {
    public final int A00;
    public final int A01;
    public final VC A02;
    public final U8 A03;

    public abstract int A08();

    public abstract boolean A09(T t6);

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WT != com.facebook.ads.androidx.media3.exoplayer.trackselection.DefaultTrackSelector$TrackInfo<T extends com.facebook.ads.redexgen.X.WT<T>> */
    public WT(int i5, U8 u82, int i11) {
        this.A00 = i5;
        this.A03 = u82;
        this.A01 = i11;
        this.A02 = u82.A08(i11);
    }
}
