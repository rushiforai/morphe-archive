package com.facebook.ads.redexgen.X;

import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import org.checkerframework.checker.nullness.qual.EnsuresNonNull;

/* loaded from: assets/audience_network/classes.dex */
public final class S6 implements TL {
    public MediaCodecInfo[] A00;
    public final int A01;

    public S6(boolean z11, boolean z12) {
        int i5;
        if (z11 || z12) {
            i5 = 1;
        } else {
            i5 = 0;
        }
        this.A01 = i5;
    }

    @EnsuresNonNull
    private void A00() {
        if (this.A00 == null) {
            this.A00 = new MediaCodecList(this.A01).getCodecInfos();
        }
    }

    @Override // com.facebook.ads.redexgen.X.TL
    public final int A80() {
        A00();
        return this.A00.length;
    }

    @Override // com.facebook.ads.redexgen.X.TL
    public final MediaCodecInfo A81(int i5) {
        A00();
        return this.A00[i5];
    }

    @Override // com.facebook.ads.redexgen.X.TL
    public final boolean AB9(String str, String str2, MediaCodecInfo.CodecCapabilities codecCapabilities) {
        return codecCapabilities.isFeatureRequired(str);
    }

    @Override // com.facebook.ads.redexgen.X.TL
    public final boolean ABA(String str, String str2, MediaCodecInfo.CodecCapabilities codecCapabilities) {
        return codecCapabilities.isFeatureSupported(str);
    }

    @Override // com.facebook.ads.redexgen.X.TL
    public final boolean AKM() {
        return true;
    }
}
