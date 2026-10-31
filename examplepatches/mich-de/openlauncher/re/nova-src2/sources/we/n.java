package we;

import android.media.MediaCodec;
import android.media.MediaCrypto;
import android.media.MediaCryptoException;
import android.media.MediaFormat;
import android.os.Bundle;
import android.os.SystemClock;
import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.android.exoplayer2.decoder.DecoderInputBuffer$InsufficientCapacityException;
import com.google.android.exoplayer2.drm.DrmSession$DrmSessionException;
import com.google.android.exoplayer2.mediacodec.MediaCodecDecoderException;
import com.google.android.exoplayer2.mediacodec.MediaCodecRenderer$DecoderInitializationException;
import com.google.android.exoplayer2.mediacodec.MediaCodecUtil$DecoderQueryException;
import fe.k0;
import gf.t0;
import io.sentry.e3;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import wf.v;

/* loaded from: classes3.dex */
public abstract class n extends fe.c {
    public static final byte[] D0 = {0, 0, 1, 103, 66, -64, 11, -38, 37, -112, 0, 0, 1, 104, -50, 15, 19, 32, 0, 0, 1, 101, -120, -124, 13, -50, 113, 24, -96, 0, 47, -65, 28, 49, -61, 39, 93, 120};
    public k0 A;
    public long A0;
    public je.f B;
    public long B0;
    public je.f C;
    public int C0;
    public MediaCrypto D;
    public boolean E;
    public final long F;
    public float G;
    public float H;
    public j I;
    public k0 J;
    public MediaFormat K;
    public boolean L;
    public float M;
    public ArrayDeque N;
    public MediaCodecRenderer$DecoderInitializationException O;
    public l P;
    public int Q;
    public boolean R;
    public boolean S;
    public boolean T;
    public boolean U;
    public boolean V;
    public boolean W;
    public boolean X;
    public boolean Y;
    public boolean Z;

    /* renamed from: a0, reason: collision with root package name */
    public boolean f94258a0;

    /* renamed from: b0, reason: collision with root package name */
    public g f94259b0;

    /* renamed from: c0, reason: collision with root package name */
    public long f94260c0;

    /* renamed from: d0, reason: collision with root package name */
    public int f94261d0;

    /* renamed from: e0, reason: collision with root package name */
    public int f94262e0;

    /* renamed from: f0, reason: collision with root package name */
    public ByteBuffer f94263f0;

    /* renamed from: g0, reason: collision with root package name */
    public boolean f94264g0;

    /* renamed from: h0, reason: collision with root package name */
    public boolean f94265h0;

    /* renamed from: i0, reason: collision with root package name */
    public boolean f94266i0;

    /* renamed from: j0, reason: collision with root package name */
    public boolean f94267j0;

    /* renamed from: k0, reason: collision with root package name */
    public boolean f94268k0;

    /* renamed from: l0, reason: collision with root package name */
    public boolean f94269l0;

    /* renamed from: m, reason: collision with root package name */
    public final i f94270m;

    /* renamed from: m0, reason: collision with root package name */
    public int f94271m0;
    public final o n;

    /* renamed from: n0, reason: collision with root package name */
    public int f94272n0;
    public final float o;

    /* renamed from: o0, reason: collision with root package name */
    public int f94273o0;

    /* renamed from: p, reason: collision with root package name */
    public final ie.f f94274p;

    /* renamed from: p0, reason: collision with root package name */
    public boolean f94275p0;

    /* renamed from: q, reason: collision with root package name */
    public final ie.f f94276q;

    /* renamed from: q0, reason: collision with root package name */
    public boolean f94277q0;

    /* renamed from: r, reason: collision with root package name */
    public final ie.f f94278r;

    /* renamed from: r0, reason: collision with root package name */
    public boolean f94279r0;

    /* renamed from: s, reason: collision with root package name */
    public final f f94280s;

    /* renamed from: s0, reason: collision with root package name */
    public long f94281s0;

    /* renamed from: t, reason: collision with root package name */
    public final fk.l f94282t;

    /* renamed from: t0, reason: collision with root package name */
    public long f94283t0;

    /* renamed from: u, reason: collision with root package name */
    public final ArrayList f94284u;

    /* renamed from: u0, reason: collision with root package name */
    public boolean f94285u0;

    /* renamed from: v, reason: collision with root package name */
    public final MediaCodec.BufferInfo f94286v;

    /* renamed from: v0, reason: collision with root package name */
    public boolean f94287v0;

    /* renamed from: w, reason: collision with root package name */
    public final long[] f94288w;

    /* renamed from: w0, reason: collision with root package name */
    public boolean f94289w0;

    /* renamed from: x, reason: collision with root package name */
    public final long[] f94290x;

    /* renamed from: x0, reason: collision with root package name */
    public boolean f94291x0;

    /* renamed from: y, reason: collision with root package name */
    public final long[] f94292y;

    /* renamed from: y0, reason: collision with root package name */
    public ExoPlaybackException f94293y0;

    /* renamed from: z, reason: collision with root package name */
    public k0 f94294z;

    /* renamed from: z0, reason: collision with root package name */
    public ie.e f94295z0;

    public n(int i5, i iVar, float f11) {
        super(i5);
        this.f94270m = iVar;
        this.n = o.f94296b;
        this.o = f11;
        this.f94274p = new ie.f(0);
        this.f94276q = new ie.f(0);
        this.f94278r = new ie.f(2);
        f fVar = new f(2);
        fVar.f94241k = 32;
        this.f94280s = fVar;
        this.f94282t = new fk.l();
        this.f94284u = new ArrayList();
        this.f94286v = new MediaCodec.BufferInfo();
        this.G = 1.0f;
        this.H = 1.0f;
        this.F = -9223372036854775807L;
        this.f94288w = new long[10];
        this.f94290x = new long[10];
        this.f94292y = new long[10];
        this.A0 = -9223372036854775807L;
        j0(-9223372036854775807L);
        fVar.u(0);
        fVar.f61580d.order(ByteOrder.nativeOrder());
        this.M = -1.0f;
        this.Q = 0;
        this.f94271m0 = 0;
        this.f94261d0 = -1;
        this.f94262e0 = -1;
        this.f94260c0 = -9223372036854775807L;
        this.f94281s0 = -9223372036854775807L;
        this.f94283t0 = -9223372036854775807L;
        this.f94272n0 = 0;
        this.f94273o0 = 0;
    }

    public abstract ie.g A(l lVar, k0 k0Var, k0 k0Var2);

    public MediaCodecDecoderException B(IllegalStateException illegalStateException, l lVar) {
        return new MediaCodecDecoderException(illegalStateException, lVar);
    }

    public final void C() {
        this.f94268k0 = false;
        this.f94280s.q();
        this.f94278r.q();
        this.f94267j0 = false;
        this.f94266i0 = false;
    }

    public final boolean D() throws ExoPlaybackException, MediaCryptoException {
        if (!this.f94275p0) {
            o0();
            return true;
        }
        this.f94272n0 = 1;
        if (this.S || this.U) {
            this.f94273o0 = 3;
            return false;
        }
        this.f94273o0 = 2;
        return true;
    }

    public final boolean E(long j11, long j12) throws Exception {
        boolean z11;
        boolean z12;
        MediaCodec.BufferInfo bufferInfo;
        boolean zC0;
        int iJ;
        boolean z13;
        int i5 = this.f94262e0;
        MediaCodec.BufferInfo bufferInfo2 = this.f94286v;
        if (i5 < 0) {
            if (this.V && this.f94277q0) {
                try {
                    iJ = this.I.j(bufferInfo2);
                } catch (IllegalStateException unused) {
                    b0();
                    if (this.f94287v0) {
                        e0();
                    }
                }
            } else {
                iJ = this.I.j(bufferInfo2);
            }
            if (iJ < 0) {
                if (iJ != -2) {
                    if (this.f94258a0 && (this.f94285u0 || this.f94272n0 == 2)) {
                        b0();
                        return false;
                    }
                    return false;
                }
                this.f94279r0 = true;
                MediaFormat mediaFormatA = this.I.a();
                if (this.Q != 0 && mediaFormatA.getInteger("width") == 32 && mediaFormatA.getInteger("height") == 32) {
                    this.Z = true;
                    return true;
                }
                if (this.X) {
                    mediaFormatA.setInteger("channel-count", 1);
                }
                this.K = mediaFormatA;
                this.L = true;
                return true;
            }
            if (this.Z) {
                this.Z = false;
                this.I.l(iJ, false);
                return true;
            }
            if (bufferInfo2.size == 0 && (bufferInfo2.flags & 4) != 0) {
                b0();
                return false;
            }
            this.f94262e0 = iJ;
            ByteBuffer byteBufferM = this.I.m(iJ);
            this.f94263f0 = byteBufferM;
            if (byteBufferM != null) {
                byteBufferM.position(bufferInfo2.offset);
                this.f94263f0.limit(bufferInfo2.offset + bufferInfo2.size);
            }
            if (this.W && bufferInfo2.presentationTimeUs == 0 && (bufferInfo2.flags & 4) != 0) {
                long j13 = this.f94281s0;
                if (j13 != -9223372036854775807L) {
                    bufferInfo2.presentationTimeUs = j13;
                }
            }
            long j14 = bufferInfo2.presentationTimeUs;
            ArrayList arrayList = this.f94284u;
            int size = arrayList.size();
            int i11 = 0;
            while (true) {
                if (i11 >= size) {
                    z13 = false;
                    break;
                }
                if (((Long) arrayList.get(i11)).longValue() == j14) {
                    arrayList.remove(i11);
                    z13 = true;
                    break;
                }
                i11++;
            }
            this.f94264g0 = z13;
            long j15 = this.f94283t0;
            long j16 = bufferInfo2.presentationTimeUs;
            this.f94265h0 = j15 == j16;
            p0(j16);
        }
        if (this.V && this.f94277q0) {
            try {
                z11 = false;
                z12 = true;
                bufferInfo = bufferInfo2;
            } catch (IllegalStateException unused2) {
                z11 = false;
            }
            try {
                zC0 = c0(j11, j12, this.I, this.f94263f0, this.f94262e0, bufferInfo2.flags, 1, bufferInfo2.presentationTimeUs, this.f94264g0, this.f94265h0, this.A);
            } catch (IllegalStateException unused3) {
                b0();
                if (!this.f94287v0) {
                    return z11;
                }
                e0();
                return z11;
            }
        } else {
            z11 = false;
            z12 = true;
            bufferInfo = bufferInfo2;
            zC0 = c0(j11, j12, this.I, this.f94263f0, this.f94262e0, bufferInfo.flags, 1, bufferInfo.presentationTimeUs, this.f94264g0, this.f94265h0, this.A);
        }
        if (!zC0) {
            return z11;
        }
        Y(bufferInfo.presentationTimeUs);
        boolean z14 = (bufferInfo.flags & 4) != 0 ? z12 : z11;
        this.f94262e0 = -1;
        this.f94263f0 = null;
        if (!z14) {
            return z12;
        }
        b0();
        return z11;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x004d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean F() throws Exception {
        boolean z11;
        j jVar = this.I;
        if (jVar != null && this.f94272n0 != 2 && !this.f94285u0) {
            int i5 = this.f94261d0;
            ie.f fVar = this.f94276q;
            if (i5 < 0) {
                int i11 = jVar.i();
                this.f94261d0 = i11;
                if (i11 >= 0) {
                    fVar.f61580d = this.I.d(i11);
                    fVar.q();
                    if (this.f94272n0 != 1) {
                        if (!this.f94258a0) {
                            this.f94277q0 = true;
                            this.I.k(this.f94261d0, 0, 4, 0L);
                            this.f94261d0 = -1;
                            fVar.f61580d = null;
                        }
                        this.f94272n0 = 2;
                        return false;
                    }
                    if (this.Y) {
                        this.Y = false;
                        fVar.f61580d.put(D0);
                        this.I.k(this.f94261d0, 38, 0, 0L);
                        this.f94261d0 = -1;
                        fVar.f61580d = null;
                        this.f94275p0 = true;
                        return true;
                    }
                    if (this.f94271m0 == 1) {
                        for (int i12 = 0; i12 < this.J.n.size(); i12++) {
                            fVar.f61580d.put((byte[]) this.J.n.get(i12));
                        }
                        this.f94271m0 = 2;
                    }
                    ByteBuffer byteBuffer = fVar.f61580d;
                    ie.c cVar = fVar.f61579c;
                    int iPosition = byteBuffer.position();
                    e3 e3Var = this.f54721b;
                    e3Var.h();
                    try {
                        int iS = s(e3Var, fVar, 0);
                        if (i()) {
                            this.f94283t0 = this.f94281s0;
                        }
                        if (iS != -3) {
                            if (iS == -5) {
                                if (this.f94271m0 == 2) {
                                    fVar.q();
                                    this.f94271m0 = 1;
                                }
                                V(e3Var);
                                return true;
                            }
                            if (!fVar.d(4)) {
                                if (this.f94275p0 || fVar.d(1)) {
                                    boolean zD = fVar.d(1073741824);
                                    if (zD) {
                                        if (iPosition == 0) {
                                            cVar.getClass();
                                        } else {
                                            if (cVar.f61560d == null) {
                                                int[] iArr = new int[1];
                                                cVar.f61560d = iArr;
                                                cVar.f61565i.numBytesOfClearData = iArr;
                                            }
                                            int[] iArr2 = cVar.f61560d;
                                            iArr2[0] = iArr2[0] + iPosition;
                                        }
                                    }
                                    if (this.R && !zD) {
                                        ByteBuffer byteBuffer2 = fVar.f61580d;
                                        int iPosition2 = byteBuffer2.position();
                                        int i13 = 0;
                                        int i14 = 0;
                                        while (true) {
                                            int i15 = i13 + 1;
                                            if (i15 >= iPosition2) {
                                                byteBuffer2.clear();
                                                break;
                                            }
                                            int i16 = byteBuffer2.get(i13) & 255;
                                            if (i14 == 3) {
                                                if (i16 == 1 && (byteBuffer2.get(i15) & 31) == 7) {
                                                    ByteBuffer byteBufferDuplicate = byteBuffer2.duplicate();
                                                    byteBufferDuplicate.position(i13 - 3);
                                                    byteBufferDuplicate.limit(iPosition2);
                                                    byteBuffer2.position(0);
                                                    byteBuffer2.put(byteBufferDuplicate);
                                                    break;
                                                }
                                            } else if (i16 == 0) {
                                                i14++;
                                            }
                                            if (i16 != 0) {
                                                i14 = 0;
                                            }
                                            i13 = i15;
                                        }
                                        if (fVar.f61580d.position() != 0) {
                                            this.R = false;
                                        }
                                    }
                                    long jMax = fVar.f61582f;
                                    g gVar = this.f94259b0;
                                    if (gVar != null) {
                                        k0 k0Var = this.f94294z;
                                        if (gVar.f94243b == 0) {
                                            gVar.f94242a = jMax;
                                        }
                                        if (!gVar.f94244c) {
                                            ByteBuffer byteBuffer3 = fVar.f61580d;
                                            byteBuffer3.getClass();
                                            int i17 = 0;
                                            for (int i18 = 0; i18 < 4; i18++) {
                                                i17 = (i17 << 8) | (byteBuffer3.get(i18) & 255);
                                            }
                                            int iG = he.a.g(i17);
                                            if (iG == -1) {
                                                gVar.f94244c = true;
                                                gVar.f94243b = 0L;
                                                gVar.f94242a = fVar.f61582f;
                                                wf.a.D("C2Mp3TimestampTracker", "MPEG audio header is invalid.");
                                                jMax = fVar.f61582f;
                                            } else {
                                                jMax = Math.max(0L, ((gVar.f94243b - 529) * 1000000) / k0Var.f54895z) + gVar.f94242a;
                                                gVar.f94243b += iG;
                                            }
                                        }
                                        long j11 = this.f94281s0;
                                        g gVar2 = this.f94259b0;
                                        k0 k0Var2 = this.f94294z;
                                        gVar2.getClass();
                                        long j12 = k0Var2.f54895z;
                                        z11 = zD;
                                        this.f94281s0 = Math.max(j11, Math.max(0L, ((gVar2.f94243b - 529) * 1000000) / j12) + gVar2.f94242a);
                                    } else {
                                        z11 = zD;
                                    }
                                    if (fVar.d(Integer.MIN_VALUE)) {
                                        this.f94284u.add(Long.valueOf(jMax));
                                    }
                                    if (this.f94289w0) {
                                        this.f94282t.a(jMax, this.f94294z);
                                        this.f94289w0 = false;
                                    }
                                    this.f94281s0 = Math.max(this.f94281s0, jMax);
                                    fVar.v();
                                    if (fVar.d(268435456)) {
                                        O(fVar);
                                    }
                                    a0(fVar);
                                    try {
                                        if (z11) {
                                            this.I.f(this.f94261d0, cVar, jMax);
                                        } else {
                                            this.I.k(this.f94261d0, fVar.f61580d.limit(), 0, jMax);
                                        }
                                        this.f94261d0 = -1;
                                        fVar.f61580d = null;
                                        this.f94275p0 = true;
                                        this.f94271m0 = 0;
                                        this.f94295z0.f61569c++;
                                        return true;
                                    } catch (MediaCodec.CryptoException e3) {
                                        throw f(e3, this.f94294z, false, v.l(e3.getErrorCode()));
                                    }
                                }
                                fVar.q();
                                if (this.f94271m0 == 2) {
                                    this.f94271m0 = 1;
                                    return true;
                                }
                                return true;
                            }
                            if (this.f94271m0 == 2) {
                                fVar.q();
                                this.f94271m0 = 1;
                            }
                            this.f94285u0 = true;
                            if (!this.f94275p0) {
                                b0();
                                return false;
                            }
                            try {
                                if (!this.f94258a0) {
                                    this.f94277q0 = true;
                                    this.I.k(this.f94261d0, 0, 4, 0L);
                                    this.f94261d0 = -1;
                                    fVar.f61580d = null;
                                    return false;
                                }
                            } catch (MediaCodec.CryptoException e11) {
                                throw f(e11, this.f94294z, false, v.l(e11.getErrorCode()));
                            }
                        }
                    } catch (DecoderInputBuffer$InsufficientCapacityException e12) {
                        S(e12);
                        d0(0);
                        G();
                        return true;
                    }
                }
            } else if (this.f94272n0 != 1) {
            }
        }
        return false;
    }

    public final void G() {
        try {
            this.I.flush();
        } finally {
            g0();
        }
    }

    public final boolean H() throws MediaCryptoException {
        if (this.I == null) {
            return false;
        }
        int i5 = this.f94273o0;
        if (i5 == 3 || this.S || ((this.T && !this.f94279r0) || (this.U && this.f94277q0))) {
            e0();
            return true;
        }
        if (i5 == 2) {
            int i11 = v.f94376a;
            wf.a.i(i11 >= 23);
            if (i11 >= 23) {
                try {
                    o0();
                } catch (ExoPlaybackException e3) {
                    wf.a.E("MediaCodecRenderer", "Failed to update the DRM session, releasing the codec instead.", e3);
                    e0();
                    return true;
                }
            }
        }
        G();
        return false;
    }

    public final List I(boolean z11) {
        k0 k0Var = this.f94294z;
        o oVar = this.n;
        ArrayList arrayListL = L(oVar, k0Var, z11);
        if (!arrayListL.isEmpty() || !z11) {
            return arrayListL;
        }
        ArrayList arrayListL2 = L(oVar, this.f94294z, false);
        if (!arrayListL2.isEmpty()) {
            wf.a.D("MediaCodecRenderer", "Drm session requires secure decoder for " + this.f94294z.f54883l + ", but no secure decoder available. Trying to proceed with " + arrayListL2 + ".");
        }
        return arrayListL2;
    }

    public boolean J() {
        return false;
    }

    public abstract float K(float f11, k0[] k0VarArr);

    public abstract ArrayList L(o oVar, k0 k0Var, boolean z11);

    public final je.g M(je.f fVar) {
        fVar.getClass();
        return null;
    }

    public abstract h N(l lVar, k0 k0Var, MediaCrypto mediaCrypto, float f11);

    public void O(ie.f fVar) {
    }

    /* JADX WARN: Removed duplicated region for block: B:114:0x01bd  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0161  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void P(l lVar, MediaCrypto mediaCrypto) {
        float fK;
        int i5;
        boolean z11;
        boolean z12;
        String str = lVar.f94250a;
        int i11 = v.f94376a;
        if (i11 < 23) {
            fK = -1.0f;
        } else {
            float f11 = this.H;
            k0[] k0VarArr = this.f54727h;
            k0VarArr.getClass();
            fK = K(f11, k0VarArr);
        }
        float f12 = fK > this.o ? fK : -1.0f;
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        h hVarN = N(lVar, this.f94294z, mediaCrypto, f12);
        if (i11 >= 31) {
            ge.m mVar = this.f54724e;
            mVar.getClass();
            m.a(hVarN, mVar);
        }
        try {
            wf.a.b("createCodec:" + str);
            this.I = this.f94270m.a(hVarN);
            wf.a.q();
            long jElapsedRealtime2 = SystemClock.elapsedRealtime();
            this.P = lVar;
            this.M = f12;
            this.J = this.f94294z;
            if (i11 <= 25 && "OMX.Exynos.avc.dec.secure".equals(str)) {
                String str2 = v.f94379d;
                if (str2.startsWith("SM-T585") || str2.startsWith("SM-A510") || str2.startsWith("SM-A520") || str2.startsWith("SM-J700")) {
                    i5 = 2;
                }
            } else if (i11 >= 24 || !("OMX.Nvidia.h264.decode".equals(str) || "OMX.Nvidia.h264.decode.secure".equals(str))) {
                i5 = 0;
            } else {
                String str3 = v.f94377b;
                if ("flounder".equals(str3) || "flounder_lte".equals(str3) || "grouper".equals(str3) || "tilapia".equals(str3)) {
                    i5 = 1;
                }
            }
            this.Q = i5;
            this.R = i11 < 21 && this.J.n.isEmpty() && "OMX.MTK.VIDEO.DECODER.AVC".equals(str);
            this.S = i11 < 18 || (i11 == 18 && ("OMX.SEC.avc.dec".equals(str) || "OMX.SEC.avc.dec.secure".equals(str))) || (i11 == 19 && v.f94379d.startsWith("SM-G800") && ("OMX.Exynos.avc.dec".equals(str) || "OMX.Exynos.avc.dec.secure".equals(str)));
            this.T = i11 == 29 && "c2.android.aac.decoder".equals(str);
            if (i11 > 23 || !"OMX.google.vorbis.decoder".equals(str)) {
                if (i11 <= 19) {
                    String str4 = v.f94377b;
                    z11 = ("hb2000".equals(str4) || "stvm8".equals(str4)) && ("OMX.amlogic.avc.decoder.awesome".equals(str) || "OMX.amlogic.avc.decoder.awesome.secure".equals(str));
                }
            }
            this.U = z11;
            this.V = i11 == 21 && "OMX.google.aac.decoder".equals(str);
            if (i11 < 21 && "OMX.SEC.mp3.dec".equals(str) && "samsung".equals(v.f94378c)) {
                String str5 = v.f94377b;
                if (str5.startsWith("baffin") || str5.startsWith("grand") || str5.startsWith("fortuna") || str5.startsWith("gprimelte") || str5.startsWith("j2y18lte") || str5.startsWith("ms01")) {
                    z12 = true;
                }
            } else {
                z12 = false;
            }
            this.W = z12;
            this.X = i11 <= 18 && this.J.f54894y == 1 && "OMX.MTK.AUDIO.DECODER.MP3".equals(str);
            this.f94258a0 = (i11 <= 25 && "OMX.rk.video_decoder.avc".equals(str)) || (i11 <= 17 && "OMX.allwinner.video.decoder.avc".equals(str)) || ((i11 <= 29 && ("OMX.broadcom.video_decoder.tunnel".equals(str) || "OMX.broadcom.video_decoder.tunnel.secure".equals(str))) || (("Amazon".equals(v.f94378c) && "AFTS".equals(v.f94379d) && lVar.f94255f) || J()));
            this.I.getClass();
            if ("c2.android.mp3.decoder".equals(str)) {
                this.f94259b0 = new g();
            }
            if (this.f54725f == 2) {
                this.f94260c0 = SystemClock.elapsedRealtime() + 1000;
            }
            this.f94295z0.f61567a++;
            T(jElapsedRealtime2, jElapsedRealtime2 - jElapsedRealtime, str);
        } catch (Throwable th2) {
            wf.a.q();
            throw th2;
        }
    }

    public final void Q() throws Exception {
        k0 k0Var;
        if (this.I != null || this.f94266i0 || (k0Var = this.f94294z) == null) {
            return;
        }
        if (this.C == null && l0(k0Var)) {
            k0 k0Var2 = this.f94294z;
            C();
            String str = k0Var2.f54883l;
            boolean zEquals = "audio/mp4a-latm".equals(str);
            f fVar = this.f94280s;
            if (zEquals || "audio/mpeg".equals(str) || "audio/opus".equals(str)) {
                fVar.getClass();
                fVar.f94241k = 32;
            } else {
                fVar.getClass();
                fVar.f94241k = 1;
            }
            this.f94266i0 = true;
            return;
        }
        i0(this.C);
        String str2 = this.f94294z.f54883l;
        je.f fVar2 = this.B;
        if (fVar2 != null) {
            if (this.D == null) {
                M(fVar2);
                if (this.B.m() == null) {
                    return;
                }
            }
            if (je.g.f69488a) {
                int iP = this.B.p();
                if (iP == 1) {
                    DrmSession$DrmSessionException drmSession$DrmSessionExceptionM = this.B.m();
                    drmSession$DrmSessionExceptionM.getClass();
                    throw f(drmSession$DrmSessionExceptionM, this.f94294z, false, drmSession$DrmSessionExceptionM.f31461a);
                }
                if (iP != 4) {
                    return;
                }
            }
        }
        try {
            R(this.D, this.E);
        } catch (MediaCodecRenderer$DecoderInitializationException e3) {
            throw f(e3, this.f94294z, false, 4001);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00f9 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x004c A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void R(MediaCrypto mediaCrypto, boolean z11) throws Exception {
        String diagnosticInfo;
        MediaCodecRenderer$DecoderInitializationException mediaCodecRenderer$DecoderInitializationException;
        if (this.N == null) {
            try {
                List listI = I(z11);
                this.N = new ArrayDeque();
                ArrayList arrayList = (ArrayList) listI;
                if (!arrayList.isEmpty()) {
                    this.N.add((l) arrayList.get(0));
                }
                this.O = null;
            } catch (MediaCodecUtil$DecoderQueryException e3) {
                throw new MediaCodecRenderer$DecoderInitializationException(this.f94294z, e3, z11, -49998);
            }
        }
        if (this.N.isEmpty()) {
            throw new MediaCodecRenderer$DecoderInitializationException(this.f94294z, null, z11, -49999);
        }
        l lVar = (l) this.N.peekFirst();
        while (this.I == null) {
            l lVar2 = (l) this.N.peekFirst();
            if (!k0(lVar2)) {
                return;
            }
            try {
                P(lVar2, mediaCrypto);
            } catch (Exception e11) {
                if (lVar2 != lVar) {
                    throw e11;
                }
                try {
                    wf.a.D("MediaCodecRenderer", "Preferred decoder instantiation failed. Sleeping for 50ms then retrying.");
                    Thread.sleep(50L);
                    P(lVar2, mediaCrypto);
                } catch (Exception e12) {
                    wf.a.E("MediaCodecRenderer", "Failed to initialize decoder: " + lVar2, e12);
                    this.N.removeFirst();
                    k0 k0Var = this.f94294z;
                    String str = "Decoder init failed: " + lVar2.f94250a + ", " + k0Var;
                    String str2 = k0Var.f54883l;
                    if (v.f94376a < 21) {
                        diagnosticInfo = e12 instanceof MediaCodec.CodecException ? ((MediaCodec.CodecException) e12).getDiagnosticInfo() : null;
                    } else {
                        diagnosticInfo = null;
                    }
                    MediaCodecRenderer$DecoderInitializationException mediaCodecRenderer$DecoderInitializationException2 = new MediaCodecRenderer$DecoderInitializationException(str, e12, str2, z11, lVar2, diagnosticInfo);
                    S(mediaCodecRenderer$DecoderInitializationException2);
                    mediaCodecRenderer$DecoderInitializationException = this.O;
                    if (mediaCodecRenderer$DecoderInitializationException != null) {
                        this.O = mediaCodecRenderer$DecoderInitializationException2;
                    } else {
                        this.O = new MediaCodecRenderer$DecoderInitializationException(mediaCodecRenderer$DecoderInitializationException.getMessage(), mediaCodecRenderer$DecoderInitializationException.getCause(), mediaCodecRenderer$DecoderInitializationException.f31463a, mediaCodecRenderer$DecoderInitializationException.f31464b, mediaCodecRenderer$DecoderInitializationException.f31465c, mediaCodecRenderer$DecoderInitializationException.f31466d);
                    }
                    if (!this.N.isEmpty()) {
                        throw this.O;
                    }
                }
                wf.a.E("MediaCodecRenderer", "Failed to initialize decoder: " + lVar2, e12);
                this.N.removeFirst();
                k0 k0Var2 = this.f94294z;
                String str3 = "Decoder init failed: " + lVar2.f94250a + ", " + k0Var2;
                String str22 = k0Var2.f54883l;
                if (v.f94376a < 21) {
                }
                MediaCodecRenderer$DecoderInitializationException mediaCodecRenderer$DecoderInitializationException22 = new MediaCodecRenderer$DecoderInitializationException(str3, e12, str22, z11, lVar2, diagnosticInfo);
                S(mediaCodecRenderer$DecoderInitializationException22);
                mediaCodecRenderer$DecoderInitializationException = this.O;
                if (mediaCodecRenderer$DecoderInitializationException != null) {
                }
                if (!this.N.isEmpty()) {
                }
            }
        }
        this.N = null;
    }

    public abstract void S(Exception exc);

    public abstract void T(long j11, long j12, String str);

    public abstract void U(String str);

    /* JADX WARN: Removed duplicated region for block: B:39:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x007e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public ie.g V(e3 e3Var) throws Exception {
        boolean z11 = true;
        this.f94289w0 = true;
        k0 k0Var = (k0) e3Var.f67209c;
        k0Var.getClass();
        int i5 = 0;
        if (k0Var.f54883l == null) {
            throw f(new IllegalArgumentException(), k0Var, false, 4005);
        }
        je.f fVar = (je.f) e3Var.f67208b;
        je.f fVar2 = this.C;
        if (fVar2 != fVar) {
            if (fVar != null) {
                fVar.getClass();
            }
            if (fVar2 != null) {
                fVar2.getClass();
            }
        }
        this.C = fVar;
        this.f94294z = k0Var;
        if (this.f94266i0) {
            this.f94268k0 = true;
            return null;
        }
        j jVar = this.I;
        if (jVar == null) {
            this.N = null;
            Q();
            return null;
        }
        l lVar = this.P;
        k0 k0Var2 = this.J;
        je.f fVar3 = this.B;
        if (fVar3 != fVar) {
            if (fVar != null && fVar3 != null && fVar.o().equals(fVar3.o()) && v.f94376a >= 23) {
                UUID uuid = fe.f.f54756d;
                if (!uuid.equals(fVar3.o()) && !uuid.equals(fVar.o())) {
                    M(fVar);
                }
            }
            if (this.f94275p0) {
                this.f94272n0 = 1;
                this.f94273o0 = 3;
            } else {
                e0();
                Q();
            }
            return new ie.g(lVar.f94250a, k0Var2, k0Var, 0, 128);
        }
        boolean z12 = this.C != this.B;
        wf.a.i(!z12 || v.f94376a >= 23);
        ie.g gVarA = A(lVar, k0Var2, k0Var);
        int i11 = gVarA.f61588d;
        if (i11 != 0) {
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException();
                    }
                    if (n0(k0Var)) {
                        this.J = k0Var;
                        if (z12 && !D()) {
                            i5 = 2;
                        }
                    } else {
                        i5 = 16;
                    }
                } else if (n0(k0Var)) {
                    this.f94269l0 = true;
                    this.f94271m0 = 1;
                    int i12 = this.Q;
                    if (i12 != 2 && (i12 != 1 || k0Var.f54886q != k0Var2.f54886q || k0Var.f54887r != k0Var2.f54887r)) {
                        z11 = false;
                    }
                    this.Y = z11;
                    this.J = k0Var;
                    if (z12 && !D()) {
                    }
                }
            } else if (n0(k0Var)) {
                this.J = k0Var;
                if (z12) {
                    if (!D()) {
                    }
                } else if (this.f94275p0) {
                    this.f94272n0 = 1;
                    if (this.S || this.U) {
                        this.f94273o0 = 3;
                        i5 = 2;
                    } else {
                        this.f94273o0 = 1;
                    }
                }
            }
        } else if (this.f94275p0) {
            this.f94272n0 = 1;
            this.f94273o0 = 3;
        } else {
            e0();
            Q();
        }
        if (i11 == 0 || (this.I == jVar && this.f94273o0 != 3)) {
            return gVarA;
        }
        return new ie.g(lVar.f94250a, k0Var2, k0Var, 0, i5);
    }

    public abstract void W(k0 k0Var, MediaFormat mediaFormat);

    public void X() {
    }

    public void Y(long j11) {
        while (this.C0 != 0) {
            long[] jArr = this.f94292y;
            if (j11 < jArr[0]) {
                return;
            }
            long[] jArr2 = this.f94288w;
            this.A0 = jArr2[0];
            long[] jArr3 = this.f94290x;
            j0(jArr3[0]);
            int i5 = this.C0 - 1;
            this.C0 = i5;
            System.arraycopy(jArr2, 1, jArr2, 0, i5);
            System.arraycopy(jArr3, 1, jArr3, 0, this.C0);
            System.arraycopy(jArr, 1, jArr, 0, this.C0);
            Z();
        }
    }

    public abstract void Z();

    public abstract void a0(ie.f fVar);

    public final void b0() throws Exception {
        int i5 = this.f94273o0;
        if (i5 == 1) {
            G();
            return;
        }
        if (i5 == 2) {
            G();
            o0();
        } else if (i5 != 3) {
            this.f94287v0 = true;
            f0();
        } else {
            e0();
            Q();
        }
    }

    public abstract boolean c0(long j11, long j12, j jVar, ByteBuffer byteBuffer, int i5, int i11, int i12, long j13, boolean z11, boolean z12, k0 k0Var);

    public final boolean d0(int i5) throws Exception {
        e3 e3Var = this.f54721b;
        e3Var.h();
        ie.f fVar = this.f94274p;
        fVar.q();
        int iS = s(e3Var, fVar, i5 | 4);
        if (iS == -5) {
            V(e3Var);
            return true;
        }
        if (iS != -4 || !fVar.d(4)) {
            return false;
        }
        this.f94285u0 = true;
        b0();
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void e0() {
        try {
            j jVar = this.I;
            if (jVar != null) {
                jVar.release();
                this.f94295z0.f61568b++;
                U(this.P.f94250a);
            }
            this.I = null;
            try {
                MediaCrypto mediaCrypto = this.D;
                if (mediaCrypto != null) {
                    mediaCrypto.release();
                }
            } finally {
            }
        } catch (Throwable th2) {
            this.I = null;
            try {
                MediaCrypto mediaCrypto2 = this.D;
                if (mediaCrypto2 != null) {
                    mediaCrypto2.release();
                }
                throw th2;
            } finally {
            }
        }
    }

    public void f0() {
    }

    public void g0() {
        this.f94261d0 = -1;
        this.f94276q.f61580d = null;
        this.f94262e0 = -1;
        this.f94263f0 = null;
        this.f94260c0 = -9223372036854775807L;
        this.f94277q0 = false;
        this.f94275p0 = false;
        this.Y = false;
        this.Z = false;
        this.f94264g0 = false;
        this.f94265h0 = false;
        this.f94284u.clear();
        this.f94281s0 = -9223372036854775807L;
        this.f94283t0 = -9223372036854775807L;
        g gVar = this.f94259b0;
        if (gVar != null) {
            gVar.f94242a = 0L;
            gVar.f94243b = 0L;
            gVar.f94244c = false;
        }
        this.f94272n0 = 0;
        this.f94273o0 = 0;
        this.f94271m0 = this.f94269l0 ? 1 : 0;
    }

    public final void h0() {
        g0();
        this.f94293y0 = null;
        this.f94259b0 = null;
        this.N = null;
        this.P = null;
        this.J = null;
        this.K = null;
        this.L = false;
        this.f94279r0 = false;
        this.M = -1.0f;
        this.Q = 0;
        this.R = false;
        this.S = false;
        this.T = false;
        this.U = false;
        this.V = false;
        this.W = false;
        this.X = false;
        this.f94258a0 = false;
        this.f94269l0 = false;
        this.f94271m0 = 0;
        this.E = false;
    }

    public final void i0(je.f fVar) {
        je.f fVar2 = this.B;
        if (fVar2 != fVar) {
            if (fVar != null) {
                fVar.c(null);
            }
            if (fVar2 != null) {
                fVar2.t(null);
            }
        }
        this.B = fVar;
    }

    @Override // fe.c
    public boolean j() {
        return this.f94287v0;
    }

    public final void j0(long j11) {
        this.B0 = j11;
        if (j11 != -9223372036854775807L) {
            X();
        }
    }

    @Override // fe.c
    public boolean k() {
        boolean zIsReady;
        if (this.f94294z != null) {
            if (i()) {
                zIsReady = this.f54730k;
            } else {
                t0 t0Var = this.f54726g;
                t0Var.getClass();
                zIsReady = t0Var.isReady();
            }
            if (!zIsReady) {
                if ((this.f94262e0 >= 0) || (this.f94260c0 != -9223372036854775807L && SystemClock.elapsedRealtime() < this.f94260c0)) {
                }
            }
            return true;
        }
        return false;
    }

    public boolean k0(l lVar) {
        return true;
    }

    @Override // fe.c
    public void l() throws MediaCryptoException {
        this.f94294z = null;
        this.A0 = -9223372036854775807L;
        j0(-9223372036854775807L);
        this.C0 = 0;
        H();
    }

    public boolean l0(k0 k0Var) {
        return false;
    }

    public abstract int m0(o oVar, k0 k0Var);

    @Override // fe.c
    public void n(long j11, boolean z11) throws Exception {
        int i5;
        this.f94285u0 = false;
        this.f94287v0 = false;
        this.f94291x0 = false;
        if (this.f94266i0) {
            this.f94280s.q();
            this.f94278r.q();
            this.f94267j0 = false;
        } else if (H()) {
            Q();
        }
        fk.l lVar = this.f94282t;
        synchronized (lVar) {
            i5 = lVar.f55200b;
        }
        if (i5 > 0) {
            this.f94289w0 = true;
        }
        this.f94282t.d();
        int i11 = this.C0;
        if (i11 != 0) {
            j0(this.f94290x[i11 - 1]);
            this.A0 = this.f94288w[this.C0 - 1];
            this.C0 = 0;
        }
    }

    public final boolean n0(k0 k0Var) throws Exception {
        if (v.f94376a >= 23 && this.I != null && this.f94273o0 != 3 && this.f54725f != 0) {
            float f11 = this.H;
            k0[] k0VarArr = this.f54727h;
            k0VarArr.getClass();
            float fK = K(f11, k0VarArr);
            float f12 = this.M;
            if (f12 != fK) {
                if (fK == -1.0f) {
                    if (this.f94275p0) {
                        this.f94272n0 = 1;
                        this.f94273o0 = 3;
                        return false;
                    }
                    e0();
                    Q();
                    return false;
                }
                if (f12 != -1.0f || fK > this.o) {
                    Bundle bundle = new Bundle();
                    bundle.putFloat("operating-rate", fK);
                    this.I.g(bundle);
                    this.M = fK;
                }
            }
        }
        return true;
    }

    public final void o0() throws ExoPlaybackException, MediaCryptoException {
        try {
            MediaCrypto mediaCrypto = this.D;
            M(this.C).getClass();
            mediaCrypto.setMediaDrmSession(null);
            i0(this.C);
            this.f94272n0 = 0;
            this.f94273o0 = 0;
        } catch (MediaCryptoException e3) {
            throw f(e3, this.f94294z, false, 6006);
        }
    }

    public final void p0(long j11) {
        Object objT;
        Object objU;
        fk.l lVar = this.f94282t;
        synchronized (lVar) {
            objT = lVar.t(j11, true);
        }
        k0 k0Var = (k0) objT;
        if (k0Var == null && this.L) {
            fk.l lVar2 = this.f94282t;
            synchronized (lVar2) {
                objU = lVar2.f55200b == 0 ? null : lVar2.u();
            }
            k0Var = (k0) objU;
        }
        if (k0Var != null) {
            this.A = k0Var;
        } else if (!this.L || this.A == null) {
            return;
        }
        W(this.A, this.K);
        this.L = false;
    }

    @Override // fe.c
    public final void r(k0[] k0VarArr, long j11, long j12) {
        if (this.B0 == -9223372036854775807L) {
            wf.a.i(this.A0 == -9223372036854775807L);
            this.A0 = j11;
            j0(j12);
            return;
        }
        int i5 = this.C0;
        long[] jArr = this.f94290x;
        if (i5 == jArr.length) {
            wf.a.D("MediaCodecRenderer", "Too many stream changes, so dropping offset: " + jArr[this.C0 - 1]);
        } else {
            this.C0 = i5 + 1;
        }
        int i11 = this.C0 - 1;
        this.f94288w[i11] = j11;
        jArr[i11] = j12;
        this.f94292y[i11] = this.f94281s0;
    }

    @Override // fe.c
    public final void t(long j11, long j12) throws Exception {
        boolean z11 = false;
        if (this.f94291x0) {
            this.f94291x0 = false;
            b0();
        }
        ExoPlaybackException exoPlaybackException = this.f94293y0;
        if (exoPlaybackException != null) {
            this.f94293y0 = null;
            throw exoPlaybackException;
        }
        try {
            if (this.f94287v0) {
                f0();
                return;
            }
            if (this.f94294z != null || d0(2)) {
                Q();
                if (this.f94266i0) {
                    wf.a.b("bypassRender");
                    while (z(j11, j12)) {
                    }
                    wf.a.q();
                } else if (this.I != null) {
                    long jElapsedRealtime = SystemClock.elapsedRealtime();
                    wf.a.b("drainAndFeed");
                    while (E(j11, j12)) {
                        long j13 = this.F;
                        if (!(j13 == -9223372036854775807L || SystemClock.elapsedRealtime() - jElapsedRealtime < j13)) {
                            break;
                        }
                    }
                    while (F()) {
                        long j14 = this.F;
                        if (!(j14 == -9223372036854775807L || SystemClock.elapsedRealtime() - jElapsedRealtime < j14)) {
                            break;
                        }
                    }
                    wf.a.q();
                } else {
                    ie.e eVar = this.f94295z0;
                    int i5 = eVar.f61570d;
                    t0 t0Var = this.f54726g;
                    t0Var.getClass();
                    eVar.f61570d = i5 + t0Var.f(j11 - this.f54728i);
                    d0(1);
                }
                synchronized (this.f94295z0) {
                }
            }
        } catch (IllegalStateException e3) {
            int i11 = v.f94376a;
            if (i11 < 21 || !(e3 instanceof MediaCodec.CodecException)) {
                StackTraceElement[] stackTrace = e3.getStackTrace();
                if (stackTrace.length <= 0 || !stackTrace[0].getClassName().equals("android.media.MediaCodec")) {
                    throw e3;
                }
            }
            S(e3);
            if (i11 >= 21) {
                if (e3 instanceof MediaCodec.CodecException ? ((MediaCodec.CodecException) e3).isRecoverable() : false) {
                    z11 = true;
                }
            }
            if (z11) {
                e0();
            }
            throw f(B(e3, this.P), this.f94294z, z11, 4003);
        }
    }

    @Override // fe.c
    public void w(float f11, float f12) throws Exception {
        this.G = f11;
        this.H = f12;
        n0(this.J);
    }

    @Override // fe.c
    public final int x(k0 k0Var) throws ExoPlaybackException {
        try {
            return m0(this.n, k0Var);
        } catch (MediaCodecUtil$DecoderQueryException e3) {
            throw f(e3, k0Var, false, 4002);
        }
    }

    @Override // fe.c
    public final int y() {
        return 8;
    }

    public final boolean z(long j11, long j12) throws Exception {
        f fVar;
        wf.a.i(!this.f94287v0);
        f fVar2 = this.f94280s;
        int i5 = fVar2.f94240j;
        if (i5 > 0) {
            fVar = fVar2;
            if (!c0(j11, j12, null, fVar2.f61580d, this.f94262e0, 0, i5, fVar2.f61582f, fVar2.d(Integer.MIN_VALUE), fVar2.d(4), this.A)) {
                return false;
            }
            Y(fVar.f94239i);
            fVar.q();
        } else {
            fVar = fVar2;
        }
        if (this.f94285u0) {
            this.f94287v0 = true;
            return false;
        }
        boolean z11 = this.f94267j0;
        ie.f fVar3 = this.f94278r;
        if (z11) {
            wf.a.i(fVar.w(fVar3));
            this.f94267j0 = false;
        }
        if (this.f94268k0) {
            if (fVar.f94240j > 0) {
                return true;
            }
            C();
            this.f94268k0 = false;
            Q();
            if (!this.f94266i0) {
                return false;
            }
        }
        wf.a.i(!this.f94285u0);
        e3 e3Var = this.f54721b;
        e3Var.h();
        fVar3.q();
        while (true) {
            fVar3.q();
            int iS = s(e3Var, fVar3, 0);
            if (iS == -5) {
                V(e3Var);
                break;
            }
            if (iS != -4) {
                if (iS != -3) {
                    throw new IllegalStateException();
                }
            } else {
                if (fVar3.d(4)) {
                    this.f94285u0 = true;
                    break;
                }
                if (this.f94289w0) {
                    k0 k0Var = this.f94294z;
                    k0Var.getClass();
                    this.A = k0Var;
                    W(k0Var, null);
                    this.f94289w0 = false;
                }
                fVar3.v();
                if (!fVar.w(fVar3)) {
                    this.f94267j0 = true;
                    break;
                }
            }
        }
        if (fVar.f94240j > 0) {
            fVar.v();
        }
        return fVar.f94240j > 0 || this.f94285u0 || this.f94268k0;
    }
}
