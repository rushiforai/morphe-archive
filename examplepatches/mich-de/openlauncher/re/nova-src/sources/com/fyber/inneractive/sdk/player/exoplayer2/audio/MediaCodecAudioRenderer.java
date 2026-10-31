package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import android.annotation.TargetApi;
import android.media.MediaCodec;
import android.media.MediaCrypto;
import android.media.MediaFormat;
import android.view.Surface;
import com.fyber.inneractive.sdk.player.exoplayer2.audio.AudioRendererEventListener;
import com.fyber.inneractive.sdk.player.exoplayer2.decoder.DecoderCounters;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.nio.ByteBuffer;

@TargetApi(16)
/* loaded from: classes3.dex */
public class MediaCodecAudioRenderer extends com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c implements com.fyber.inneractive.sdk.player.exoplayer2.util.h {
    public final AudioRendererEventListener.EventDispatcher P;
    public final r Q;
    public boolean R;
    public int S;
    public int T;
    public long U;
    public boolean V;

    public MediaCodecAudioRenderer() {
        super(1, true);
        this.Q = new r(new c[0], new u(this));
        this.P = new AudioRendererEventListener.EventDispatcher(null, null);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    public final com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.a a(com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.d dVar, com.fyber.inneractive.sdk.player.exoplayer2.o oVar) {
        String str = oVar.f30128f;
        this.Q.getClass();
        String str2 = oVar.f30128f;
        dVar.getClass();
        return com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.j.a(false, str2);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    public final int b(com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.d dVar, com.fyber.inneractive.sdk.player.exoplayer2.o oVar) {
        int i5;
        int i11;
        String str = oVar.f30128f;
        if (!"audio".equals(com.fyber.inneractive.sdk.player.exoplayer2.util.i.b(str))) {
            return 0;
        }
        int i12 = z.f30489a;
        int i13 = i12 >= 21 ? 16 : 0;
        this.Q.getClass();
        dVar.getClass();
        com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.a aVarA = com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.j.a(false, str);
        if (aVarA == null) {
            return 1;
        }
        return ((i12 < 21 || (((i5 = oVar.f30139s) == -1 || aVarA.b(i5)) && ((i11 = oVar.f30138r) == -1 || aVarA.a(i11)))) ? 3 : 2) | i13 | 4;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.h d() {
        return this;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c, com.fyber.inneractive.sdk.player.exoplayer2.a
    public final boolean e() {
        if (!this.L) {
            return false;
        }
        r rVar = this.Q;
        if (rVar.d()) {
            return rVar.X && !rVar.c();
        }
        return true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c, com.fyber.inneractive.sdk.player.exoplayer2.a
    public final boolean f() {
        return this.Q.c() || super.f();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    public final void g() {
        try {
            r rVar = this.Q;
            rVar.g();
            for (c cVar : rVar.f29021c) {
                cVar.f();
            }
            rVar.Z = 0;
            rVar.Y = false;
            try {
                this.n = null;
                o();
            } finally {
            }
        } catch (Throwable th2) {
            try {
                this.n = null;
                o();
                throw th2;
            } finally {
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    public final void h() throws IllegalStateException {
        DecoderCounters decoderCounters = new DecoderCounters();
        this.N = decoderCounters;
        this.P.enabled(decoderCounters);
        int i5 = this.f28970b.f30252a;
        if (i5 == 0) {
            r rVar = this.Q;
            if (rVar.f29018a0) {
                rVar.f29018a0 = false;
                rVar.Z = 0;
                rVar.g();
                return;
            }
            return;
        }
        r rVar2 = this.Q;
        rVar2.getClass();
        if (z.f30489a < 21) {
            throw new IllegalStateException();
        }
        if (rVar2.f29018a0 && rVar2.Z == i5) {
            return;
        }
        rVar2.f29018a0 = true;
        rVar2.Z = i5;
        rVar2.g();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    public final void i() throws IllegalStateException {
        this.Q.f();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    public final void j() throws IllegalStateException {
        r rVar = this.Q;
        rVar.Y = false;
        if (rVar.d()) {
            rVar.f29043z = 0L;
            rVar.f29042y = 0;
            rVar.f29041x = 0;
            rVar.A = 0L;
            rVar.B = false;
            rVar.C = 0L;
            rVar.f29026g.d();
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    public final void p() throws IllegalStateException, com.fyber.inneractive.sdk.player.exoplayer2.d {
        try {
            r rVar = this.Q;
            if (!rVar.X && rVar.d() && rVar.a()) {
                rVar.f29026g.a(rVar.b());
                rVar.f29040w = 0;
                rVar.X = true;
            }
        } catch (q e3) {
            throw new com.fyber.inneractive.sdk.player.exoplayer2.d(e3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0037  */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.a aVar, MediaCodec mediaCodec, com.fyber.inneractive.sdk.player.exoplayer2.o oVar) {
        boolean z11;
        String str = aVar.f30054a;
        if (z.f30489a < 24 && "OMX.SEC.aac.dec".equals(str) && "samsung".equals(z.f30491c)) {
            String str2 = z.f30490b;
            if (str2.startsWith("zeroflte") || str2.startsWith("herolte") || str2.startsWith("heroqlte")) {
                z11 = true;
            }
        } else {
            z11 = false;
        }
        this.R = z11;
        mediaCodec.configure(oVar.a(), (Surface) null, (MediaCrypto) null, 0);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.util.h
    public final long b() {
        long jA = this.Q.a(e());
        if (jA != Long.MIN_VALUE) {
            if (!this.V) {
                jA = Math.max(this.U, jA);
            }
            this.U = jA;
            this.V = false;
        }
        return this.U;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    public final void a(String str, long j11, long j12) {
        this.P.decoderInitialized(str, j11, j12);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.o oVar) throws com.fyber.inneractive.sdk.player.exoplayer2.d {
        super.a(oVar);
        this.P.inputFormatChanged(oVar);
        this.S = "audio/raw".equals(oVar.f30128f) ? oVar.f30140t : 2;
        this.T = oVar.f30138r;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    public final void a(MediaCodec mediaCodec, MediaFormat mediaFormat) throws IllegalStateException, com.fyber.inneractive.sdk.player.exoplayer2.d {
        int[] iArr;
        int i5;
        int integer = mediaFormat.getInteger("channel-count");
        int integer2 = mediaFormat.getInteger("sample-rate");
        if (this.R && integer == 6 && (i5 = this.T) < 6) {
            iArr = new int[i5];
            for (int i11 = 0; i11 < this.T; i11++) {
                iArr[i11] = i11;
            }
        } else {
            iArr = null;
        }
        try {
            this.Q.a(integer, integer2, this.S, iArr);
        } catch (m e3) {
            throw new com.fyber.inneractive.sdk.player.exoplayer2.d(e3);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c, com.fyber.inneractive.sdk.player.exoplayer2.a
    public final void a(boolean z11, long j11) throws IllegalStateException, com.fyber.inneractive.sdk.player.exoplayer2.d {
        super.a(z11, j11);
        this.Q.g();
        this.U = j11;
        this.V = true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.util.h
    public final com.fyber.inneractive.sdk.player.exoplayer2.s a(com.fyber.inneractive.sdk.player.exoplayer2.s sVar) {
        return this.Q.a(sVar);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.util.h
    public final com.fyber.inneractive.sdk.player.exoplayer2.s a() {
        return this.Q.f29036s;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    public final boolean a(long j11, long j12, MediaCodec mediaCodec, ByteBuffer byteBuffer, int i5, long j13, boolean z11) throws com.fyber.inneractive.sdk.player.exoplayer2.d {
        if (z11) {
            mediaCodec.releaseOutputBuffer(i5, false);
            this.N.skippedOutputBufferCount++;
            r rVar = this.Q;
            if (rVar.L == 1) {
                rVar.L = 2;
            }
            return true;
        }
        try {
            if (!this.Q.a(byteBuffer, j13)) {
                return false;
            }
            mediaCodec.releaseOutputBuffer(i5, false);
            this.N.renderedOutputBufferCount++;
            return true;
        } catch (n | q e3) {
            throw new com.fyber.inneractive.sdk.player.exoplayer2.d(e3);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    public final void a(int i5, Object obj) throws IllegalStateException {
        if (i5 == 2) {
            r rVar = this.Q;
            float fFloatValue = ((Float) obj).floatValue();
            if (rVar.P != fFloatValue) {
                rVar.P = fFloatValue;
                rVar.i();
                return;
            }
            return;
        }
        if (i5 != 3) {
            return;
        }
        int iIntValue = ((Integer) obj).intValue();
        r rVar2 = this.Q;
        if (rVar2.n == iIntValue) {
            return;
        }
        rVar2.n = iIntValue;
        if (rVar2.f29018a0) {
            return;
        }
        rVar2.g();
        rVar2.Z = 0;
    }
}
