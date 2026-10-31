package com.fyber.inneractive.sdk.player.exoplayer2.mediacodec;

import android.media.MediaCodecInfo;
import android.media.MediaCodecList;

/* loaded from: classes3.dex */
public final class i implements g {

    /* renamed from: a, reason: collision with root package name */
    public final int f30079a;

    /* renamed from: b, reason: collision with root package name */
    public MediaCodecInfo[] f30080b;

    public i(boolean z11) {
        this.f30079a = z11 ? 1 : 0;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.g
    public final boolean a(String str, MediaCodecInfo.CodecCapabilities codecCapabilities) {
        return codecCapabilities.isFeatureSupported("secure-playback");
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.g
    public final boolean b() {
        return true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.g
    public final int a() {
        if (this.f30080b == null) {
            this.f30080b = new MediaCodecList(this.f30079a).getCodecInfos();
        }
        return this.f30080b.length;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.g
    public final MediaCodecInfo a(int i5) {
        if (this.f30080b == null) {
            this.f30080b = new MediaCodecList(this.f30079a).getCodecInfos();
        }
        return this.f30080b[i5];
    }
}
