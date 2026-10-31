package com.facebook.ads.redexgen.X;

import android.media.AudioAttributes;

/* loaded from: assets/audience_network/classes.dex */
public final class Jo {
    public final AudioAttributes A00;

    public Jo(VL vl2) {
        AudioAttributes.Builder usage = new AudioAttributes.Builder().setContentType(vl2.A02).setFlags(vl2.A03).setUsage(vl2.A05);
        if (N1.A02 >= 29) {
            C1012Jm.A00(usage, vl2.A01);
        }
        if (N1.A02 >= 32) {
            C1013Jn.A00(usage, vl2.A04);
        }
        this.A00 = usage.build();
    }
}
