package com.facebook.ads.redexgen.X;

import android.media.MediaCodec;
import android.media.MediaCrypto;
import android.media.MediaFormat;
import android.os.Handler;
import android.util.Pair;
import android.view.Surface;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.nio.ByteBuffer;

/* loaded from: assets/audience_network/classes.dex */
public final class S5 implements InterfaceC1231Sn {
    public ByteBuffer[] A00;
    public ByteBuffer[] A01;
    public final MediaCodec A02;

    @MetaExoPlayerCustomization
    public S5(MediaCodec mediaCodec) {
        this.A02 = mediaCodec;
    }

    public final /* synthetic */ void A00(InterfaceC1230Sm interfaceC1230Sm, MediaCodec mediaCodec, long j11, long j12) {
        interfaceC1230Sm.AF2(this, j11, j12);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    @MetaExoPlayerCustomization
    public final void A5h(MediaFormat mediaFormat, Surface surface, MediaCrypto mediaCrypto, int i5, Object obj) {
        this.A02.configure(mediaFormat, surface, mediaCrypto, i5);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    public final int A6R() {
        return this.A02.dequeueInputBuffer(0L);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    public final int A6T(MediaCodec.BufferInfo bufferInfo) {
        int iDequeueOutputBuffer;
        do {
            iDequeueOutputBuffer = this.A02.dequeueOutputBuffer(bufferInfo, 0L);
            if (iDequeueOutputBuffer == -3 && N1.A02 < 21) {
                this.A01 = this.A02.getOutputBuffers();
            }
        } while (iDequeueOutputBuffer == -3);
        return iDequeueOutputBuffer;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    public final ByteBuffer A8v(int i5) {
        if (N1.A02 >= 21) {
            return this.A02.getInputBuffer(i5);
        }
        return ((ByteBuffer[]) N1.A0f(this.A00))[i5];
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    public final ByteBuffer A9H(int i5) {
        if (N1.A02 >= 21) {
            return this.A02.getOutputBuffer(i5);
        }
        return ((ByteBuffer[]) N1.A0f(this.A01))[i5];
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    public final MediaFormat A9I() {
        return this.A02.getOutputFormat();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    @MetaExoPlayerCustomization
    public final Pair<Long, Integer> A9M() {
        return new Pair<>(0L, 0);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    @MetaExoPlayerCustomization
    public final int A9x() {
        return 0;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    public final void AIV(int i5, int i11, int i12, long j11, int i13) throws MediaCodec.CryptoException {
        this.A02.queueInputBuffer(i5, i11, i12, j11, i13);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    public final void AIX(int i5, int i11, C1114No c1114No, long j11, int i12) throws MediaCodec.CryptoException {
        this.A02.queueSecureInputBuffer(i5, i11, c1114No.A00(), j11, i12);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    public final void AIp() {
        this.A00 = null;
        this.A01 = null;
        this.A02.release();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    public final void AIv(int i5, long j11) {
        this.A02.releaseOutputBuffer(i5, j11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    public final void AIw(int i5, boolean z11) {
        this.A02.releaseOutputBuffer(i5, z11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    public final void AKs(final InterfaceC1230Sm interfaceC1230Sm, Handler handler) {
        this.A02.setOnFrameRenderedListener(new MediaCodec.OnFrameRenderedListener() { // from class: com.facebook.ads.redexgen.X.TO
            @Override // android.media.MediaCodec.OnFrameRenderedListener
            public final void onFrameRendered(MediaCodec mediaCodec, long j11, long j12) {
                this.A01.A00(interfaceC1230Sm, mediaCodec, j11, j12);
            }
        }, handler);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    public final void AKt(Surface surface) {
        this.A02.setOutputSurface(surface);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    public final void ALA(int i5) {
        this.A02.setVideoScalingMode(i5);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    public final void flush() {
        this.A02.flush();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    @MetaExoPlayerCustomization
    public final void reset() {
        this.A02.reset();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    @MetaExoPlayerCustomization
    public final void start() {
        this.A02.start();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1231Sn
    @MetaExoPlayerCustomization
    public final void stop() {
        this.A02.stop();
    }
}
