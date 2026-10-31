package com.fyber.inneractive.sdk.player.exoplayer2.decoder;

import android.media.MediaCodec;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public byte[] f29106a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f29107b;

    /* renamed from: c, reason: collision with root package name */
    public int[] f29108c;

    /* renamed from: d, reason: collision with root package name */
    public final MediaCodec.CryptoInfo f29109d;

    /* renamed from: e, reason: collision with root package name */
    public final a f29110e;

    public b() {
        int i5 = z.f30489a;
        MediaCodec.CryptoInfo cryptoInfo = i5 >= 16 ? new MediaCodec.CryptoInfo() : null;
        this.f29109d = cryptoInfo;
        this.f29110e = i5 >= 24 ? new a(cryptoInfo) : null;
    }

    public final void a(int i5, int[] iArr, int[] iArr2, byte[] bArr, byte[] bArr2) {
        this.f29107b = iArr;
        this.f29108c = iArr2;
        this.f29106a = bArr2;
        int i11 = z.f30489a;
        if (i11 >= 16) {
            MediaCodec.CryptoInfo cryptoInfo = this.f29109d;
            cryptoInfo.numSubSamples = i5;
            cryptoInfo.numBytesOfClearData = iArr;
            cryptoInfo.numBytesOfEncryptedData = iArr2;
            cryptoInfo.key = bArr;
            cryptoInfo.iv = bArr2;
            cryptoInfo.mode = 1;
            if (i11 >= 24) {
                a.a(this.f29110e);
            }
        }
    }
}
