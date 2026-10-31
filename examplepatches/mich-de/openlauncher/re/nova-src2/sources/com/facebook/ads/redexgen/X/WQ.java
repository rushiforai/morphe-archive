package com.facebook.ads.redexgen.X;

import android.media.Spatializer;
import android.media.Spatializer$OnSpatializerStateChangedListener;

/* loaded from: assets/audience_network/classes.dex */
public class WQ implements Spatializer$OnSpatializerStateChangedListener {
    public final /* synthetic */ WR A00;
    public final /* synthetic */ C07398h A01;

    public WQ(WR wr2, C07398h c07398h) {
        this.A00 = wr2;
        this.A01 = c07398h;
    }

    public final void onSpatializerAvailableChanged(Spatializer spatializer, boolean z11) {
        this.A01.A0L();
    }

    public final void onSpatializerEnabledChanged(Spatializer spatializer, boolean z11) {
        this.A01.A0L();
    }
}
