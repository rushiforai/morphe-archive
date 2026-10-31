package com.fyber.inneractive.sdk.player.exoplayer2.video;

import android.annotation.TargetApi;
import android.graphics.Point;
import android.media.MediaCodec;
import android.media.MediaCrypto;
import android.media.MediaFormat;
import android.os.Handler;
import android.os.SystemClock;
import android.util.Log;
import android.view.Surface;
import com.fyber.inneractive.sdk.player.exoplayer2.decoder.DecoderCounters;
import com.fyber.inneractive.sdk.player.exoplayer2.util.w;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import com.fyber.inneractive.sdk.player.exoplayer2.video.VideoRendererEventListener;
import java.nio.ByteBuffer;

@TargetApi(16)
/* loaded from: classes3.dex */
public class MediaCodecVideoRenderer extends com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c {

    /* renamed from: q0, reason: collision with root package name */
    public static final int[] f30502q0 = {1920, 1600, 1440, 1280, 960, 854, 640, 540, 480};
    public final h P;
    public final VideoRendererEventListener.EventDispatcher Q;
    public final long R;
    public final int S;
    public final boolean T;
    public com.fyber.inneractive.sdk.player.exoplayer2.o[] U;
    public e V;
    public Surface W;
    public int X;
    public boolean Y;
    public long Z;

    /* renamed from: a0, reason: collision with root package name */
    public long f30503a0;

    /* renamed from: b0, reason: collision with root package name */
    public int f30504b0;

    /* renamed from: c0, reason: collision with root package name */
    public int f30505c0;

    /* renamed from: d0, reason: collision with root package name */
    public int f30506d0;

    /* renamed from: e0, reason: collision with root package name */
    public float f30507e0;

    /* renamed from: f0, reason: collision with root package name */
    public int f30508f0;

    /* renamed from: g0, reason: collision with root package name */
    public int f30509g0;

    /* renamed from: h0, reason: collision with root package name */
    public int f30510h0;

    /* renamed from: i0, reason: collision with root package name */
    public float f30511i0;

    /* renamed from: j0, reason: collision with root package name */
    public int f30512j0;

    /* renamed from: k0, reason: collision with root package name */
    public int f30513k0;

    /* renamed from: l0, reason: collision with root package name */
    public int f30514l0;

    /* renamed from: m0, reason: collision with root package name */
    public float f30515m0;

    /* renamed from: n0, reason: collision with root package name */
    public boolean f30516n0;

    /* renamed from: o0, reason: collision with root package name */
    public int f30517o0;

    /* renamed from: p0, reason: collision with root package name */
    public f f30518p0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MediaCodecVideoRenderer(Handler handler, VideoRendererEventListener videoRendererEventListener) {
        super(2, false);
        boolean z11 = false;
        this.R = 5000L;
        this.S = -1;
        this.P = new h();
        this.Q = new VideoRendererEventListener.EventDispatcher(handler, videoRendererEventListener);
        if (z.f30489a <= 22 && "foster".equals(z.f30490b) && "NVIDIA".equals(z.f30491c)) {
            z11 = true;
        }
        this.T = z11;
        this.Z = -9223372036854775807L;
        this.f30508f0 = -1;
        this.f30509g0 = -1;
        this.f30511i0 = -1.0f;
        this.f30507e0 = -1.0f;
        this.X = 1;
        this.f30512j0 = -1;
        this.f30513k0 = -1;
        this.f30515m0 = -1.0f;
        this.f30514l0 = -1;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.o[] oVarArr) {
        this.U = oVarArr;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    public final int b(com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.d dVar, com.fyber.inneractive.sdk.player.exoplayer2.o oVar) {
        boolean z11;
        int i5;
        int i11;
        String str = oVar.f30128f;
        if (!"video".equals(com.fyber.inneractive.sdk.player.exoplayer2.util.i.b(str))) {
            return 0;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.drm.d dVar2 = oVar.f30131i;
        if (dVar2 != null) {
            z11 = false;
            for (int i12 = 0; i12 < dVar2.f29123c; i12++) {
                z11 |= dVar2.f29121a[i12].f29120e;
            }
        } else {
            z11 = false;
        }
        dVar.getClass();
        com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.a aVarA = com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.j.a(z11, str);
        if (aVarA == null) {
            return 1;
        }
        boolean zA = aVarA.a(oVar.f30125c);
        if (zA && (i5 = oVar.f30132j) > 0 && (i11 = oVar.f30133k) > 0) {
            if (z.f30489a >= 21) {
                zA = aVarA.a(i5, i11, oVar.f30134l);
            } else {
                boolean z12 = i5 * i11 <= com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.j.a();
                if (!z12) {
                    int i13 = z.f30489a;
                }
                zA = z12;
            }
        }
        return (zA ? 3 : 2) | (aVarA.f30055b ? 8 : 4) | (aVarA.f30056c ? 16 : 0);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c, com.fyber.inneractive.sdk.player.exoplayer2.a
    public final boolean f() {
        if ((this.Y || super.q()) && super.f()) {
            this.Z = -9223372036854775807L;
            return true;
        }
        if (this.Z == -9223372036854775807L) {
            return false;
        }
        if (SystemClock.elapsedRealtime() < this.Z) {
            return true;
        }
        this.Z = -9223372036854775807L;
        return false;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    public final void g() {
        this.f30508f0 = -1;
        this.f30509g0 = -1;
        this.f30511i0 = -1.0f;
        this.f30507e0 = -1.0f;
        this.f30512j0 = -1;
        this.f30513k0 = -1;
        this.f30515m0 = -1.0f;
        this.f30514l0 = -1;
        r();
        h hVar = this.P;
        if (hVar.f30541b) {
            hVar.f30540a.f30537b.sendEmptyMessage(2);
        }
        this.f30518p0 = null;
        try {
            this.n = null;
            o();
        } finally {
            this.N.ensureUpdated();
            this.Q.disabled(this.N);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    public final void h() {
        DecoderCounters decoderCounters = new DecoderCounters();
        this.N = decoderCounters;
        int i5 = this.f28970b.f30252a;
        this.f30517o0 = i5;
        this.f30516n0 = i5 != 0;
        this.Q.enabled(decoderCounters);
        h hVar = this.P;
        hVar.f30547h = false;
        if (hVar.f30541b) {
            hVar.f30540a.f30537b.sendEmptyMessage(1);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    public final void i() {
        this.f30504b0 = 0;
        this.f30503a0 = SystemClock.elapsedRealtime();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    public final void j() {
        this.Z = -9223372036854775807L;
        if (this.f30504b0 > 0) {
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            this.Q.droppedFrames(this.f30504b0, jElapsedRealtime - this.f30503a0);
            this.f30504b0 = 0;
            this.f30503a0 = jElapsedRealtime;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    public final void m() {
        if (z.f30489a >= 23 || !this.f30516n0 || this.Y) {
            return;
        }
        this.Y = true;
        this.Q.renderedFirstFrame(this.W);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    public final boolean q() {
        Surface surface;
        return super.q() && (surface = this.W) != null && surface.isValid();
    }

    public final void r() {
        MediaCodec mediaCodec;
        this.Y = false;
        if (z.f30489a < 23 || !this.f30516n0 || (mediaCodec = this.o) == null) {
            return;
        }
        this.f30518p0 = new f(this, mediaCodec);
    }

    public final void s() {
        int i5 = this.f30508f0;
        if (i5 == -1 && this.f30509g0 == -1) {
            return;
        }
        if (this.f30512j0 == i5 && this.f30513k0 == this.f30509g0 && this.f30514l0 == this.f30510h0 && this.f30515m0 == this.f30511i0) {
            return;
        }
        this.Q.videoSizeChanged(i5, this.f30509g0, this.f30510h0, this.f30511i0);
        this.f30512j0 = this.f30508f0;
        this.f30513k0 = this.f30509g0;
        this.f30514l0 = this.f30510h0;
        this.f30515m0 = this.f30511i0;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c, com.fyber.inneractive.sdk.player.exoplayer2.a
    public final void a(boolean z11, long j11) throws com.fyber.inneractive.sdk.player.exoplayer2.d {
        super.a(z11, j11);
        r();
        this.f30505c0 = 0;
        if (z11) {
            this.Z = this.R > 0 ? SystemClock.elapsedRealtime() + this.R : -9223372036854775807L;
        } else {
            this.Z = -9223372036854775807L;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.a
    public final void a(int i5, Object obj) throws com.fyber.inneractive.sdk.player.exoplayer2.d {
        if (i5 != 1) {
            if (i5 == 4) {
                int iIntValue = ((Integer) obj).intValue();
                this.X = iIntValue;
                MediaCodec mediaCodec = this.o;
                if (mediaCodec != null) {
                    mediaCodec.setVideoScalingMode(iIntValue);
                    return;
                }
                return;
            }
            return;
        }
        Surface surface = (Surface) obj;
        if (this.W == surface) {
            if (surface != null) {
                int i11 = this.f30512j0;
                if (i11 != -1 || this.f30513k0 != -1) {
                    this.Q.videoSizeChanged(i11, this.f30513k0, this.f30514l0, this.f30515m0);
                }
                if (this.Y) {
                    this.Q.renderedFirstFrame(this.W);
                    return;
                }
                return;
            }
            return;
        }
        this.W = surface;
        int i12 = this.f28971c;
        if (i12 == 1 || i12 == 2) {
            MediaCodec mediaCodec2 = this.o;
            if (z.f30489a >= 23 && mediaCodec2 != null && surface != null) {
                mediaCodec2.setOutputSurface(surface);
            } else {
                o();
                l();
            }
        }
        if (surface != null) {
            int i13 = this.f30512j0;
            if (i13 != -1 || this.f30513k0 != -1) {
                this.Q.videoSizeChanged(i13, this.f30513k0, this.f30514l0, this.f30515m0);
            }
            r();
            if (i12 == 2) {
                this.Z = this.R > 0 ? SystemClock.elapsedRealtime() + this.R : -9223372036854775807L;
                return;
            }
            return;
        }
        this.f30512j0 = -1;
        this.f30513k0 = -1;
        this.f30515m0 = -1.0f;
        this.f30514l0 = -1;
        r();
    }

    public static boolean b(boolean z11, com.fyber.inneractive.sdk.player.exoplayer2.o oVar, com.fyber.inneractive.sdk.player.exoplayer2.o oVar2) {
        if (oVar.f30128f.equals(oVar2.f30128f)) {
            int i5 = oVar.f30135m;
            if (i5 == -1) {
                i5 = 0;
            }
            int i11 = oVar2.f30135m;
            if (i11 == -1) {
                i11 = 0;
            }
            if (i5 == i11) {
                if (z11) {
                    return true;
                }
                if (oVar.f30132j == oVar2.f30132j && oVar.f30133k == oVar2.f30133k) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.a aVar, MediaCodec mediaCodec, com.fyber.inneractive.sdk.player.exoplayer2.o oVar) {
        e eVar;
        Point point;
        float f11;
        boolean z11;
        int i5;
        int i11;
        com.fyber.inneractive.sdk.player.exoplayer2.o[] oVarArr = this.U;
        int iMax = oVar.f30132j;
        int iMax2 = oVar.f30133k;
        int iMax3 = oVar.f30129g;
        if (iMax3 == -1) {
            iMax3 = a(oVar.f30128f, iMax, iMax2);
        }
        if (oVarArr.length == 1) {
            eVar = new e(iMax, iMax2, iMax3);
        } else {
            boolean z12 = false;
            for (com.fyber.inneractive.sdk.player.exoplayer2.o oVar2 : oVarArr) {
                if (b(aVar.f30055b, oVar, oVar2)) {
                    int i12 = oVar2.f30132j;
                    z12 |= i12 == -1 || oVar2.f30133k == -1;
                    iMax = Math.max(iMax, i12);
                    iMax2 = Math.max(iMax2, oVar2.f30133k);
                    int iA = oVar2.f30129g;
                    if (iA == -1) {
                        iA = a(oVar2.f30128f, oVar2.f30132j, oVar2.f30133k);
                    }
                    iMax3 = Math.max(iMax3, iA);
                }
            }
            if (z12) {
                Log.w("MediaCodecVideoRenderer", "Resolutions unknown. Codec max resolution: " + iMax + "x" + iMax2);
                int i13 = oVar.f30133k;
                int i14 = oVar.f30132j;
                boolean z13 = i13 > i14;
                int i15 = z13 ? i13 : i14;
                if (z13) {
                    i13 = i14;
                }
                float f12 = i13 / i15;
                int[] iArr = f30502q0;
                int i16 = 0;
                while (i16 < 9) {
                    int i17 = iArr[i16];
                    int i18 = i16;
                    int i19 = (int) (i17 * f12);
                    if (i17 <= i15 || i19 <= i13) {
                        break;
                    }
                    int i21 = i13;
                    if (z.f30489a >= 21) {
                        point = aVar.a(z13 ? i19 : i17, z13 ? i17 : i19);
                        f11 = f12;
                        z11 = z13;
                        i5 = i15;
                        if (aVar.a(point.x, point.y, oVar.f30134l)) {
                            break;
                        }
                        i16 = i18 + 1;
                        i13 = i21;
                        f12 = f11;
                        z13 = z11;
                        i15 = i5;
                    } else {
                        f11 = f12;
                        z11 = z13;
                        i5 = i15;
                        int i22 = ((i17 + 15) / 16) * 16;
                        int i23 = ((i19 + 15) / 16) * 16;
                        if (i22 * i23 <= com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.j.a()) {
                            int i24 = z11 ? i23 : i22;
                            if (!z11) {
                                i22 = i23;
                            }
                            point = new Point(i24, i22);
                        } else {
                            i16 = i18 + 1;
                            i13 = i21;
                            f12 = f11;
                            z13 = z11;
                            i15 = i5;
                        }
                    }
                }
                point = null;
                if (point != null) {
                    iMax = Math.max(iMax, point.x);
                    iMax2 = Math.max(iMax2, point.y);
                    iMax3 = Math.max(iMax3, a(oVar.f30128f, iMax, iMax2));
                    Log.w("MediaCodecVideoRenderer", "Codec max resolution adjusted to: " + iMax + "x" + iMax2);
                }
            }
            eVar = new e(iMax, iMax2, iMax3);
        }
        this.V = eVar;
        boolean z14 = this.T;
        int i25 = this.f30517o0;
        MediaFormat mediaFormatA = oVar.a();
        mediaFormatA.setInteger("max-width", eVar.f30531a);
        mediaFormatA.setInteger("max-height", eVar.f30532b);
        int i26 = eVar.f30533c;
        if (i26 != -1) {
            mediaFormatA.setInteger("max-input-size", i26);
        }
        if (z14) {
            i11 = 0;
            mediaFormatA.setInteger("auto-frc", 0);
        } else {
            i11 = 0;
        }
        if (i25 != 0) {
            mediaFormatA.setFeatureEnabled("tunneled-playback", true);
            mediaFormatA.setInteger("audio-session-id", i25);
        }
        mediaCodec.configure(mediaFormatA, this.W, (MediaCrypto) null, i11);
        if (z.f30489a < 23 || !this.f30516n0) {
            return;
        }
        this.f30518p0 = new f(this, mediaCodec);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    public final void a(String str, long j11, long j12) {
        this.Q.decoderInitialized(str, j11, j12);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.o oVar) throws com.fyber.inneractive.sdk.player.exoplayer2.d {
        super.a(oVar);
        this.Q.inputFormatChanged(oVar);
        float f11 = oVar.n;
        if (f11 == -1.0f) {
            f11 = 1.0f;
        }
        this.f30507e0 = f11;
        int i5 = oVar.f30135m;
        if (i5 == -1) {
            i5 = 0;
        }
        this.f30506d0 = i5;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    public final void a(MediaCodec mediaCodec, MediaFormat mediaFormat) {
        int integer;
        int integer2;
        boolean z11 = mediaFormat.containsKey("crop-right") && mediaFormat.containsKey("crop-left") && mediaFormat.containsKey("crop-bottom") && mediaFormat.containsKey("crop-top");
        if (z11) {
            integer = (mediaFormat.getInteger("crop-right") - mediaFormat.getInteger("crop-left")) + 1;
        } else {
            integer = mediaFormat.getInteger("width");
        }
        this.f30508f0 = integer;
        if (z11) {
            integer2 = (mediaFormat.getInteger("crop-bottom") - mediaFormat.getInteger("crop-top")) + 1;
        } else {
            integer2 = mediaFormat.getInteger("height");
        }
        this.f30509g0 = integer2;
        float f11 = this.f30507e0;
        this.f30511i0 = f11;
        if (z.f30489a >= 21) {
            int i5 = this.f30506d0;
            if (i5 == 90 || i5 == 270) {
                int i11 = this.f30508f0;
                this.f30508f0 = integer2;
                this.f30509g0 = i11;
                this.f30511i0 = 1.0f / f11;
            }
        } else {
            this.f30510h0 = this.f30506d0;
        }
        mediaCodec.setVideoScalingMode(this.X);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    public final boolean a(boolean z11, com.fyber.inneractive.sdk.player.exoplayer2.o oVar, com.fyber.inneractive.sdk.player.exoplayer2.o oVar2) {
        if (!b(z11, oVar, oVar2)) {
            return false;
        }
        int i5 = oVar2.f30132j;
        e eVar = this.V;
        return i5 <= eVar.f30531a && oVar2.f30133k <= eVar.f30532b && oVar2.f30129g <= eVar.f30533c;
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x0105  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x012c  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x012f  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x013b  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x014c  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0190  */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(long j11, long j12, MediaCodec mediaCodec, ByteBuffer byteBuffer, int i5, long j13, boolean z11) throws InterruptedException {
        String str;
        long j14;
        long j15;
        g gVar;
        long j16;
        long j17;
        long j18;
        if (z11) {
            w.a("skipVideoBuffer");
            mediaCodec.releaseOutputBuffer(i5, false);
            w.a();
            this.N.skippedOutputBufferCount++;
            return true;
        }
        if (!this.Y) {
            if (z.f30489a >= 21) {
                long jNanoTime = System.nanoTime();
                s();
                w.a("releaseOutputBuffer");
                mediaCodec.releaseOutputBuffer(i5, jNanoTime);
                w.a();
                this.N.renderedOutputBufferCount++;
                this.f30505c0 = 0;
                if (!this.Y) {
                    this.Y = true;
                    this.Q.renderedFirstFrame(this.W);
                }
            } else {
                s();
                w.a("releaseOutputBuffer");
                mediaCodec.releaseOutputBuffer(i5, true);
                w.a();
                this.N.renderedOutputBufferCount++;
                this.f30505c0 = 0;
                if (!this.Y) {
                    this.Y = true;
                    this.Q.renderedFirstFrame(this.W);
                }
            }
            return true;
        }
        if (this.f28971c != 2) {
            return false;
        }
        long jElapsedRealtime = (j13 - j11) - ((SystemClock.elapsedRealtime() * 1000) - j12);
        long jNanoTime2 = System.nanoTime();
        long j19 = (jElapsedRealtime * 1000) + jNanoTime2;
        h hVar = this.P;
        long j21 = j13 * 1000;
        if (hVar.f30547h) {
            if (j13 != hVar.f30544e) {
                hVar.f30550k++;
                hVar.f30545f = hVar.f30546g;
            }
            long j22 = hVar.f30550k;
            if (j22 >= 6) {
                str = "releaseOutputBuffer";
                long j23 = hVar.f30549j;
                long j24 = hVar.f30545f + ((j21 - j23) / j22);
                if (Math.abs((j19 - hVar.f30548i) - (j24 - j23)) > 20000000) {
                    hVar.f30547h = false;
                } else {
                    j14 = (hVar.f30548i + j24) - hVar.f30549j;
                    j15 = j24;
                    if (!hVar.f30547h) {
                        hVar.f30549j = j21;
                        hVar.f30548i = j19;
                        hVar.f30550k = 0L;
                        hVar.f30547h = true;
                    }
                    hVar.f30544e = j13;
                    hVar.f30546g = j15;
                    gVar = hVar.f30540a;
                    if (gVar != null && gVar.f30536a != 0) {
                        long j25 = hVar.f30540a.f30536a;
                        long j26 = hVar.f30542c;
                        j17 = (((j14 - j25) / j26) * j26) + j25;
                        if (j14 > j17) {
                            j18 = j17 - j26;
                        } else {
                            j18 = j17;
                            j17 = j26 + j17;
                        }
                        if (j17 - j14 >= j14 - j18) {
                            j17 = j18;
                        }
                        j14 = j17 - hVar.f30543d;
                    }
                    long j27 = j14;
                    j16 = (j27 - jNanoTime2) / 1000;
                    if (j16 >= -30000) {
                        w.a("dropVideoBuffer");
                        mediaCodec.releaseOutputBuffer(i5, false);
                        w.a();
                        DecoderCounters decoderCounters = this.N;
                        decoderCounters.droppedOutputBufferCount++;
                        this.f30504b0++;
                        int i11 = this.f30505c0 + 1;
                        this.f30505c0 = i11;
                        decoderCounters.maxConsecutiveDroppedOutputBufferCount = Math.max(i11, decoderCounters.maxConsecutiveDroppedOutputBufferCount);
                        int i12 = this.f30504b0;
                        if (i12 != this.S || i12 <= 0) {
                            return true;
                        }
                        long jElapsedRealtime2 = SystemClock.elapsedRealtime();
                        this.Q.droppedFrames(this.f30504b0, jElapsedRealtime2 - this.f30503a0);
                        this.f30504b0 = 0;
                        this.f30503a0 = jElapsedRealtime2;
                        return true;
                    }
                    if (z.f30489a >= 21) {
                        if (j16 >= 50000) {
                            return false;
                        }
                        s();
                        w.a(str);
                        mediaCodec.releaseOutputBuffer(i5, j27);
                        w.a();
                        this.N.renderedOutputBufferCount++;
                        this.f30505c0 = 0;
                        if (!this.Y) {
                            this.Y = true;
                            this.Q.renderedFirstFrame(this.W);
                        }
                        return true;
                    }
                    if (j16 >= 30000) {
                        return false;
                    }
                    if (j16 > 11000) {
                        try {
                            Thread.sleep((j16 - com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c) / 1000);
                        } catch (InterruptedException unused) {
                            Thread.currentThread().interrupt();
                        }
                    }
                    s();
                    w.a(str);
                    mediaCodec.releaseOutputBuffer(i5, true);
                    w.a();
                    this.N.renderedOutputBufferCount++;
                    this.f30505c0 = 0;
                    if (!this.Y) {
                        this.Y = true;
                        this.Q.renderedFirstFrame(this.W);
                    }
                    return true;
                }
            } else {
                str = "releaseOutputBuffer";
                if (Math.abs((j19 - hVar.f30548i) - (j21 - hVar.f30549j)) > 20000000) {
                    hVar.f30547h = false;
                }
            }
        } else {
            str = "releaseOutputBuffer";
        }
        j15 = j21;
        j14 = j19;
        if (!hVar.f30547h) {
        }
        hVar.f30544e = j13;
        hVar.f30546g = j15;
        gVar = hVar.f30540a;
        if (gVar != null) {
            long j252 = hVar.f30540a.f30536a;
            long j262 = hVar.f30542c;
            j17 = (((j14 - j252) / j262) * j262) + j252;
            if (j14 > j17) {
            }
            if (j17 - j14 >= j14 - j18) {
            }
            j14 = j17 - hVar.f30543d;
        }
        long j272 = j14;
        j16 = (j272 - jNanoTime2) / 1000;
        if (j16 >= -30000) {
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int a(String str, int i5, int i11) {
        int i12;
        int i13;
        if (i5 == -1 || i11 == -1) {
            return -1;
        }
        str.getClass();
        i12 = 4;
        switch (str) {
            case "video/3gpp":
            case "video/mp4v-es":
            case "video/x-vnd.on2.vp8":
                i13 = i11 * i5;
                i12 = 2;
                break;
            case "video/hevc":
            case "video/x-vnd.on2.vp9":
                i13 = i11 * i5;
                break;
            case "video/avc":
                if (!"BRAVIA 4K 2015".equals(z.f30492d)) {
                    i13 = ((i11 + 15) / 16) * ((i5 + 15) / 16) * 256;
                    i12 = 2;
                    break;
                }
                break;
        }
        return -1;
    }
}
