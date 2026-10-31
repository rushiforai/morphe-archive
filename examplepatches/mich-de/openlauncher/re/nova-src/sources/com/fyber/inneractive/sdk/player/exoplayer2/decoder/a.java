package com.fyber.inneractive.sdk.player.exoplayer2.decoder;

import android.media.MediaCodec;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final MediaCodec.CryptoInfo f29104a;

    /* renamed from: b, reason: collision with root package name */
    public final MediaCodec.CryptoInfo.Pattern f29105b = new MediaCodec.CryptoInfo.Pattern(0, 0);

    public a(MediaCodec.CryptoInfo cryptoInfo) {
        this.f29104a = cryptoInfo;
    }

    public static void a(a aVar) {
        aVar.f29105b.set(0, 0);
        aVar.f29104a.setPattern(aVar.f29105b);
    }
}
