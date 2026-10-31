package com.facebook.ads.redexgen.X;

import android.media.MediaCodec;

/* renamed from: com.facebook.ads.redexgen.X.Nn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1113Nn {
    public final MediaCodec.CryptoInfo.Pattern A00;
    public final MediaCodec.CryptoInfo A01;

    public C1113Nn(MediaCodec.CryptoInfo cryptoInfo) {
        this.A01 = cryptoInfo;
        this.A00 = new MediaCodec.CryptoInfo.Pattern(0, 0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A00(int i5, int i11) {
        this.A00.set(i5, i11);
        this.A01.setPattern(this.A00);
    }
}
