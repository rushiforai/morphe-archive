package com.fyber.inneractive.sdk.player.exoplayer2.mediacodec;

import android.media.MediaCodec;
import android.media.MediaFormat;
import android.os.SystemClock;
import com.fyber.inneractive.sdk.player.exoplayer2.decoder.DecoderCounters;
import com.fyber.inneractive.sdk.player.exoplayer2.o;
import com.fyber.inneractive.sdk.player.exoplayer2.p;
import com.fyber.inneractive.sdk.player.exoplayer2.util.w;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.nio.ByteBuffer;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public abstract class c extends com.fyber.inneractive.sdk.player.exoplayer2.a {
    public static final byte[] O;
    public ByteBuffer[] A;
    public long B;
    public int C;
    public int D;
    public boolean E;
    public boolean F;
    public int G;
    public int H;
    public boolean I;
    public boolean J;
    public boolean K;
    public boolean L;
    public boolean M;
    public DecoderCounters N;

    /* renamed from: h, reason: collision with root package name */
    public final d f30059h;

    /* renamed from: i, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.decoder.c f30060i;

    /* renamed from: j, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.decoder.c f30061j;

    /* renamed from: k, reason: collision with root package name */
    public final p f30062k;

    /* renamed from: l, reason: collision with root package name */
    public final ArrayList f30063l;

    /* renamed from: m, reason: collision with root package name */
    public final MediaCodec.BufferInfo f30064m;
    public o n;
    public MediaCodec o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f30065p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f30066q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f30067r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f30068s;

    /* renamed from: t, reason: collision with root package name */
    public boolean f30069t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f30070u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f30071v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f30072w;

    /* renamed from: x, reason: collision with root package name */
    public boolean f30073x;

    /* renamed from: y, reason: collision with root package name */
    public boolean f30074y;

    /* renamed from: z, reason: collision with root package name */
    public ByteBuffer[] f30075z;

    static {
        int i5 = z.f30489a;
        byte[] bArr = new byte[38];
        for (int i11 = 0; i11 < 38; i11++) {
            int i12 = i11 * 2;
            bArr[i11] = (byte) (Character.digit("0000016742C00BDA259000000168CE0F13200000016588840DCE7118A0002FBF1C31C3275D78".charAt(i12 + 1), 16) + (Character.digit("0000016742C00BDA259000000168CE0F13200000016588840DCE7118A0002FBF1C31C3275D78".charAt(i12), 16) << 4));
        }
        O = bArr;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(int i5, boolean z11) {
        super(i5);
        d dVar = d.f30076a;
        if (z.f30489a < 16) {
            throw new IllegalStateException();
        }
        this.f30059h = dVar;
        this.f30060i = new com.fyber.inneractive.sdk.player.exoplayer2.decoder.c();
        this.f30061j = new com.fyber.inneractive.sdk.player.exoplayer2.decoder.c();
        this.f30062k = new p();
        this.f30063l = new ArrayList();
        this.f30064m = new MediaCodec.BufferInfo();
        this.G = 0;
        this.H = 0;
    }

    public abstract void a(MediaCodec mediaCodec, MediaFormat mediaFormat);

    public abstract void a(a aVar, MediaCodec mediaCodec, o oVar);

    public abstract void a(String str, long j11, long j12);

    public abstract boolean a(long j11, long j12, MediaCodec mediaCodec, ByteBuffer byteBuffer, int i5, long j13, boolean z11);

    public boolean a(boolean z11, o oVar, o oVar2) {
        return false;
    }

    public abstract int b(d dVar, o oVar);

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    public boolean e() {
        return this.L;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    public boolean f() {
        if (this.n == null) {
            return false;
        }
        if ((this.f28974f ? this.f28975g : this.f28972d.isReady()) || this.D >= 0) {
            return true;
        }
        return this.B != -9223372036854775807L && SystemClock.elapsedRealtime() < this.B;
    }

    public final boolean k() throws MediaCodec.CryptoException, com.fyber.inneractive.sdk.player.exoplayer2.d {
        MediaCodec mediaCodec = this.o;
        if (mediaCodec == null || this.H == 2 || this.K) {
            return false;
        }
        if (this.C < 0) {
            int iDequeueInputBuffer = mediaCodec.dequeueInputBuffer(0L);
            this.C = iDequeueInputBuffer;
            if (iDequeueInputBuffer < 0) {
                return false;
            }
            com.fyber.inneractive.sdk.player.exoplayer2.decoder.c cVar = this.f30060i;
            cVar.f29113c = this.f30075z[iDequeueInputBuffer];
            cVar.a();
        }
        if (this.H == 1) {
            if (!this.f30069t) {
                this.J = true;
                this.o.queueInputBuffer(this.C, 0, 0, 0L, 4);
                this.C = -1;
            }
            this.H = 2;
            return false;
        }
        if (this.f30073x) {
            this.f30073x = false;
            ByteBuffer byteBuffer = this.f30060i.f29113c;
            byte[] bArr = O;
            byteBuffer.put(bArr);
            this.o.queueInputBuffer(this.C, 0, bArr.length, 0L, 0);
            this.C = -1;
            this.I = true;
            return true;
        }
        if (this.G == 1) {
            for (int i5 = 0; i5 < this.n.f30130h.size(); i5++) {
                this.f30060i.f29113c.put((byte[]) this.n.f30130h.get(i5));
            }
            this.G = 2;
        }
        int iPosition = this.f30060i.f29113c.position();
        int iA = a(this.f30062k, this.f30060i, false);
        if (iA == -3) {
            return false;
        }
        if (iA == -5) {
            if (this.G == 2) {
                this.f30060i.a();
                this.G = 1;
            }
            a(this.f30062k.f30147a);
            return true;
        }
        if (this.f30060i.b(4)) {
            if (this.G == 2) {
                this.f30060i.a();
                this.G = 1;
            }
            this.K = true;
            if (!this.I) {
                n();
                return false;
            }
            try {
                if (!this.f30069t) {
                    this.J = true;
                    this.o.queueInputBuffer(this.C, 0, 0, 0L, 4);
                    this.C = -1;
                }
                return false;
            } catch (MediaCodec.CryptoException e3) {
                throw new com.fyber.inneractive.sdk.player.exoplayer2.d(e3);
            }
        }
        if (this.M && !this.f30060i.b(1)) {
            this.f30060i.a();
            if (this.G == 2) {
                this.G = 1;
            }
            return true;
        }
        this.M = false;
        boolean zB = this.f30060i.b(1073741824);
        if (this.f30066q && !zB) {
            ByteBuffer byteBuffer2 = this.f30060i.f29113c;
            int iPosition2 = byteBuffer2.position();
            int i11 = 0;
            int i12 = 0;
            while (true) {
                int i13 = i11 + 1;
                if (i13 >= iPosition2) {
                    byteBuffer2.clear();
                    break;
                }
                int i14 = byteBuffer2.get(i11) & 255;
                if (i12 == 3) {
                    if (i14 == 1 && (byteBuffer2.get(i13) & 31) == 7) {
                        ByteBuffer byteBufferDuplicate = byteBuffer2.duplicate();
                        byteBufferDuplicate.position(i11 - 3);
                        byteBufferDuplicate.limit(iPosition2);
                        byteBuffer2.position(0);
                        byteBuffer2.put(byteBufferDuplicate);
                        break;
                    }
                } else if (i14 == 0) {
                    i12++;
                }
                if (i14 != 0) {
                    i12 = 0;
                }
                i11 = i13;
            }
            if (this.f30060i.f29113c.position() == 0) {
                return true;
            }
            this.f30066q = false;
        }
        try {
            com.fyber.inneractive.sdk.player.exoplayer2.decoder.c cVar2 = this.f30060i;
            long j11 = cVar2.f29114d;
            if (cVar2.b(Integer.MIN_VALUE)) {
                this.f30063l.add(Long.valueOf(j11));
            }
            this.f30060i.f29113c.flip();
            m();
            if (zB) {
                MediaCodec.CryptoInfo cryptoInfo = this.f30060i.f29112b.f29109d;
                if (iPosition != 0) {
                    if (cryptoInfo.numBytesOfClearData == null) {
                        cryptoInfo.numBytesOfClearData = new int[1];
                    }
                    int[] iArr = cryptoInfo.numBytesOfClearData;
                    iArr[0] = iArr[0] + iPosition;
                }
                this.o.queueSecureInputBuffer(this.C, 0, cryptoInfo, j11, 0);
            } else {
                this.o.queueInputBuffer(this.C, 0, this.f30060i.f29113c.limit(), j11, 0);
            }
            this.C = -1;
            this.I = true;
            this.G = 0;
            this.N.inputBufferCount++;
            return true;
        } catch (MediaCodec.CryptoException e11) {
            throw new com.fyber.inneractive.sdk.player.exoplayer2.d(e11);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x00ac  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void l() throws com.fyber.inneractive.sdk.player.exoplayer2.d {
        boolean z11;
        c cVar;
        long jElapsedRealtime;
        long jElapsedRealtime2;
        if (q()) {
            o oVar = this.n;
            String str = oVar.f30128f;
            try {
                a aVarA = a(this.f30059h, oVar);
                if (aVarA == null) {
                    throw new com.fyber.inneractive.sdk.player.exoplayer2.d(new b(this.n, (f) null, -49999));
                }
                String str2 = aVarA.f30054a;
                this.f30065p = aVarA.f30055b;
                o oVar2 = this.n;
                int i5 = z.f30489a;
                boolean z12 = false;
                this.f30066q = i5 < 21 && oVar2.f30130h.isEmpty() && "OMX.MTK.VIDEO.DECODER.AVC".equals(str2);
                this.f30067r = i5 < 18 || (i5 == 18 && ("OMX.SEC.avc.dec".equals(str2) || "OMX.SEC.avc.dec.secure".equals(str2))) || (i5 == 19 && z.f30492d.startsWith("SM-G800") && ("OMX.Exynos.avc.dec".equals(str2) || "OMX.Exynos.avc.dec.secure".equals(str2)));
                if (i5 >= 24 || !("OMX.Nvidia.h264.decode".equals(str2) || "OMX.Nvidia.h264.decode.secure".equals(str2))) {
                    z11 = false;
                } else {
                    String str3 = z.f30490b;
                    if ("flounder".equals(str3) || "flounder_lte".equals(str3) || "grouper".equals(str3) || "tilapia".equals(str3)) {
                        z11 = true;
                    }
                }
                this.f30068s = z11;
                this.f30069t = i5 <= 17 && ("OMX.rk.video_decoder.avc".equals(str2) || "OMX.allwinner.video.decoder.avc".equals(str2));
                this.f30070u = (i5 <= 23 && "OMX.google.vorbis.decoder".equals(str2)) || (i5 <= 19 && "hb2000".equals(z.f30490b) && ("OMX.amlogic.avc.decoder.awesome".equals(str2) || "OMX.amlogic.avc.decoder.awesome.secure".equals(str2)));
                this.f30071v = i5 == 21 && "OMX.google.aac.decoder".equals(str2);
                o oVar3 = this.n;
                if (i5 <= 18 && oVar3.f30138r == 1 && "OMX.MTK.AUDIO.DECODER.MP3".equals(str2)) {
                    z12 = true;
                }
                this.f30072w = z12;
                try {
                    jElapsedRealtime = SystemClock.elapsedRealtime();
                    w.a("createCodec:" + str2);
                    this.o = MediaCodec.createByCodecName(str2);
                    w.a();
                    w.a("configureCodec");
                    a(aVarA, this.o, this.n);
                    w.a();
                    w.a("startCodec");
                    this.o.start();
                    w.a();
                    jElapsedRealtime2 = SystemClock.elapsedRealtime();
                    cVar = this;
                } catch (Exception e3) {
                    e = e3;
                    cVar = this;
                }
                try {
                    cVar.a(str2, jElapsedRealtime2, jElapsedRealtime2 - jElapsedRealtime);
                    cVar.f30075z = cVar.o.getInputBuffers();
                    cVar.A = cVar.o.getOutputBuffers();
                    cVar.B = cVar.f28971c == 2 ? SystemClock.elapsedRealtime() + 1000 : -9223372036854775807L;
                    cVar.C = -1;
                    cVar.D = -1;
                    cVar.M = true;
                    cVar.N.decoderInitCount++;
                } catch (Exception e11) {
                    e = e11;
                    throw new com.fyber.inneractive.sdk.player.exoplayer2.d(new b(cVar.n, e, str2));
                }
            } catch (f e12) {
                throw new com.fyber.inneractive.sdk.player.exoplayer2.d(new b(this.n, e12, -49998));
            }
        }
    }

    public void m() {
    }

    public final void n() throws com.fyber.inneractive.sdk.player.exoplayer2.d {
        if (this.H == 2) {
            o();
            l();
        } else {
            this.L = true;
            p();
        }
    }

    public final void o() {
        if (this.o != null) {
            this.B = -9223372036854775807L;
            this.C = -1;
            this.D = -1;
            this.E = false;
            this.f30063l.clear();
            this.f30075z = null;
            this.A = null;
            this.F = false;
            this.I = false;
            this.f30065p = false;
            this.f30066q = false;
            this.f30067r = false;
            this.f30068s = false;
            this.f30069t = false;
            this.f30070u = false;
            this.f30072w = false;
            this.f30073x = false;
            this.f30074y = false;
            this.J = false;
            this.G = 0;
            this.H = 0;
            this.N.decoderReleaseCount++;
            this.f30060i.f29113c = null;
            try {
                this.o.stop();
                try {
                    this.o.release();
                } finally {
                }
            } catch (Throwable th2) {
                try {
                    this.o.release();
                    throw th2;
                } finally {
                }
            }
        }
    }

    public void p() {
    }

    public boolean q() {
        return this.o == null && this.n != null;
    }

    public a a(d dVar, o oVar) {
        String str = oVar.f30128f;
        dVar.getClass();
        return j.a(false, str);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    public void a(boolean z11, long j11) throws com.fyber.inneractive.sdk.player.exoplayer2.d {
        this.K = false;
        this.L = false;
        if (this.o != null) {
            this.B = -9223372036854775807L;
            this.C = -1;
            this.D = -1;
            this.M = true;
            this.E = false;
            this.f30063l.clear();
            this.f30073x = false;
            this.f30074y = false;
            if (this.f30067r || ((this.f30070u && this.J) || this.H != 0)) {
                o();
                l();
            } else {
                this.o.flush();
                this.I = false;
            }
            if (!this.F || this.n == null) {
                return;
            }
            this.G = 1;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:87:0x015c  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0177  */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(long j11, long j12) throws com.fyber.inneractive.sdk.player.exoplayer2.d {
        boolean zA;
        boolean z11;
        boolean z12;
        if (this.L) {
            p();
            return;
        }
        if (this.n == null) {
            this.f30061j.a();
            int iA = a(this.f30062k, this.f30061j, true);
            if (iA != -5) {
                if (iA == -4) {
                    if (this.f30061j.b(4)) {
                        this.K = true;
                        n();
                        return;
                    }
                    throw new IllegalStateException();
                }
                return;
            }
            a(this.f30062k.f30147a);
        }
        l();
        if (this.o != null) {
            w.a("drainAndFeed");
            do {
                if (this.D < 0) {
                    if (this.f30071v && this.J) {
                        try {
                            this.D = this.o.dequeueOutputBuffer(this.f30064m, 0L);
                        } catch (IllegalStateException unused) {
                            n();
                            if (this.L) {
                                o();
                            }
                        }
                    } else {
                        this.D = this.o.dequeueOutputBuffer(this.f30064m, 0L);
                    }
                    int i5 = this.D;
                    if (i5 < 0) {
                        if (i5 == -2) {
                            MediaFormat outputFormat = this.o.getOutputFormat();
                            if (this.f30068s && outputFormat.getInteger("width") == 32 && outputFormat.getInteger("height") == 32) {
                                this.f30074y = true;
                            } else {
                                if (this.f30072w) {
                                    outputFormat.setInteger("channel-count", 1);
                                }
                                a(this.o, outputFormat);
                            }
                        } else if (i5 == -3) {
                            this.A = this.o.getOutputBuffers();
                        } else {
                            if (this.f30069t && (this.K || this.H == 2)) {
                                n();
                            }
                            z11 = false;
                        }
                        z11 = true;
                    } else if (this.f30074y) {
                        this.f30074y = false;
                        this.o.releaseOutputBuffer(i5, false);
                        this.D = -1;
                        z11 = true;
                    } else {
                        MediaCodec.BufferInfo bufferInfo = this.f30064m;
                        if ((bufferInfo.flags & 4) != 0) {
                            n();
                            this.D = -1;
                            z11 = false;
                        } else {
                            ByteBuffer byteBuffer = this.A[i5];
                            if (byteBuffer != null) {
                                byteBuffer.position(bufferInfo.offset);
                                MediaCodec.BufferInfo bufferInfo2 = this.f30064m;
                                byteBuffer.limit(bufferInfo2.offset + bufferInfo2.size);
                            }
                            long j13 = this.f30064m.presentationTimeUs;
                            int size = this.f30063l.size();
                            int i11 = 0;
                            while (true) {
                                if (i11 >= size) {
                                    z12 = false;
                                    break;
                                } else {
                                    if (((Long) this.f30063l.get(i11)).longValue() == j13) {
                                        this.f30063l.remove(i11);
                                        z12 = true;
                                        break;
                                    }
                                    i11++;
                                }
                            }
                            this.E = z12;
                            if (!this.f30071v) {
                                MediaCodec mediaCodec = this.o;
                                ByteBuffer[] byteBufferArr = this.A;
                                int i12 = this.D;
                                ByteBuffer byteBuffer2 = byteBufferArr[i12];
                                MediaCodec.BufferInfo bufferInfo3 = this.f30064m;
                                int i13 = bufferInfo3.flags;
                                zA = a(j11, j12, mediaCodec, byteBuffer2, i12, bufferInfo3.presentationTimeUs, this.E);
                                if (zA) {
                                }
                                z11 = false;
                            }
                        }
                    }
                } else {
                    if (!this.f30071v && this.J) {
                        try {
                            MediaCodec mediaCodec2 = this.o;
                            ByteBuffer[] byteBufferArr2 = this.A;
                            int i14 = this.D;
                            ByteBuffer byteBuffer3 = byteBufferArr2[i14];
                            MediaCodec.BufferInfo bufferInfo4 = this.f30064m;
                            int i15 = bufferInfo4.flags;
                            zA = a(j11, j12, mediaCodec2, byteBuffer3, i14, bufferInfo4.presentationTimeUs, this.E);
                        } catch (IllegalStateException unused2) {
                            n();
                            if (this.L) {
                                o();
                            }
                        }
                    } else {
                        MediaCodec mediaCodec3 = this.o;
                        ByteBuffer[] byteBufferArr3 = this.A;
                        int i122 = this.D;
                        ByteBuffer byteBuffer22 = byteBufferArr3[i122];
                        MediaCodec.BufferInfo bufferInfo32 = this.f30064m;
                        int i132 = bufferInfo32.flags;
                        zA = a(j11, j12, mediaCodec3, byteBuffer22, i122, bufferInfo32.presentationTimeUs, this.E);
                    }
                    if (zA) {
                        long j14 = this.f30064m.presentationTimeUs;
                        this.D = -1;
                        z11 = true;
                    }
                    z11 = false;
                }
            } while (z11);
            while (k()) {
            }
            w.a();
        } else {
            this.f28972d.a(j11 - this.f28973e);
            this.f30061j.a();
            int iA2 = a(this.f30062k, this.f30061j, false);
            if (iA2 == -5) {
                a(this.f30062k.f30147a);
            } else if (iA2 == -4) {
                if (this.f30061j.b(4)) {
                    this.K = true;
                    n();
                } else {
                    throw new IllegalStateException();
                }
            }
        }
        this.N.ensureUpdated();
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x004c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void a(o oVar) throws com.fyber.inneractive.sdk.player.exoplayer2.d {
        boolean z11;
        o oVar2 = this.n;
        this.n = oVar;
        if (!z.a(oVar.f30131i, oVar2 == null ? null : oVar2.f30131i) && this.n.f30131i != null) {
            throw new com.fyber.inneractive.sdk.player.exoplayer2.d(new IllegalStateException("Media requires a DrmSessionManager"));
        }
        if (this.o != null && a(this.f30065p, oVar2, this.n)) {
            this.F = true;
            this.G = 1;
            if (this.f30068s) {
                o oVar3 = this.n;
                z11 = oVar3.f30132j == oVar2.f30132j && oVar3.f30133k == oVar2.f30133k;
            }
            this.f30073x = z11;
            return;
        }
        if (this.I) {
            this.H = 1;
        } else {
            o();
            l();
        }
    }
}
