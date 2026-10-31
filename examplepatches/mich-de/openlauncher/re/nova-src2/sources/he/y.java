package he;

import ai.k0;
import android.media.AudioAttributes;
import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioTrack;
import android.media.PlaybackParams;
import android.os.Handler;
import android.os.SystemClock;
import android.util.Pair;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.android.exoplayer2.audio.AudioProcessor$UnhandledAudioFormatException;
import com.google.android.exoplayer2.audio.AudioSink$ConfigurationException;
import com.google.android.exoplayer2.audio.AudioSink$InitializationException;
import com.google.android.exoplayer2.audio.AudioSink$UnexpectedDiscontinuityException;
import com.google.android.exoplayer2.audio.AudioSink$WriteException;
import com.google.android.gms.internal.measurement.k2;
import fa.l0;
import fe.g1;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Objects;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* loaded from: classes3.dex */
public final class y implements l {

    /* renamed from: d0, reason: collision with root package name */
    public static final Object f59805d0 = new Object();

    /* renamed from: e0, reason: collision with root package name */
    public static ExecutorService f59806e0;

    /* renamed from: f0, reason: collision with root package name */
    public static int f59807f0;
    public int A;
    public long B;
    public long C;
    public long D;
    public long E;
    public int F;
    public boolean G;
    public boolean H;
    public long I;
    public float J;
    public h[] K;
    public ByteBuffer[] L;
    public ByteBuffer M;
    public int N;
    public ByteBuffer O;
    public byte[] P;
    public int Q;
    public int R;
    public boolean S;
    public boolean T;
    public boolean U;
    public boolean V;
    public int W;
    public p X;
    public u Y;
    public boolean Z;

    /* renamed from: a, reason: collision with root package name */
    public final f f59808a;

    /* renamed from: a0, reason: collision with root package name */
    public long f59809a0;

    /* renamed from: b, reason: collision with root package name */
    public final fl.l f59810b;

    /* renamed from: b0, reason: collision with root package name */
    public boolean f59811b0;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f59812c;

    /* renamed from: c0, reason: collision with root package name */
    public boolean f59813c0;

    /* renamed from: d, reason: collision with root package name */
    public final r f59814d;

    /* renamed from: e, reason: collision with root package name */
    public final h0 f59815e;

    /* renamed from: f, reason: collision with root package name */
    public final h[] f59816f;

    /* renamed from: g, reason: collision with root package name */
    public final h[] f59817g;

    /* renamed from: h, reason: collision with root package name */
    public final bg.g f59818h;

    /* renamed from: i, reason: collision with root package name */
    public final o f59819i;

    /* renamed from: j, reason: collision with root package name */
    public final ArrayDeque f59820j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f59821k;

    /* renamed from: l, reason: collision with root package name */
    public final int f59822l;

    /* renamed from: m, reason: collision with root package name */
    public fl.l f59823m;
    public final k0 n;
    public final k0 o;

    /* renamed from: p, reason: collision with root package name */
    public final z f59824p;

    /* renamed from: q, reason: collision with root package name */
    public ge.m f59825q;

    /* renamed from: r, reason: collision with root package name */
    public gu.j f59826r;

    /* renamed from: s, reason: collision with root package name */
    public v f59827s;

    /* renamed from: t, reason: collision with root package name */
    public v f59828t;

    /* renamed from: u, reason: collision with root package name */
    public AudioTrack f59829u;

    /* renamed from: v, reason: collision with root package name */
    public d f59830v;

    /* renamed from: w, reason: collision with root package name */
    public w f59831w;

    /* renamed from: x, reason: collision with root package name */
    public w f59832x;

    /* renamed from: y, reason: collision with root package name */
    public g1 f59833y;

    /* renamed from: z, reason: collision with root package name */
    public ByteBuffer f59834z;

    public y(fl.l lVar) {
        this.f59808a = (f) lVar.f55376d;
        fl.l lVar2 = (fl.l) lVar.f55374b;
        this.f59810b = lVar2;
        int i5 = wf.v.f94376a;
        this.f59812c = false;
        this.f59821k = false;
        this.f59822l = 0;
        this.f59824p = (z) lVar.f55375c;
        bg.g gVar = new bg.g();
        this.f59818h = gVar;
        gVar.d();
        this.f59819i = new o(new gu.j(this, 9));
        r rVar = new r();
        this.f59814d = rVar;
        h0 h0Var = new h0();
        h0Var.f59738m = wf.v.f94381f;
        this.f59815e = h0Var;
        ArrayList arrayList = new ArrayList();
        Collections.addAll(arrayList, new d0(), rVar, h0Var);
        Collections.addAll(arrayList, (h[]) lVar2.f55376d);
        this.f59816f = (h[]) arrayList.toArray(new h[0]);
        this.f59817g = new h[]{new a0()};
        this.J = 1.0f;
        this.f59830v = d.f59672g;
        this.W = 0;
        this.X = new p();
        g1 g1Var = g1.f54796d;
        this.f59832x = new w(g1Var, false, 0L, 0L);
        this.f59833y = g1Var;
        this.R = -1;
        this.K = new h[0];
        this.L = new ByteBuffer[0];
        this.f59820j = new ArrayDeque();
        this.n = new k0();
        this.o = new k0();
    }

    public static AudioFormat e(int i5, int i11, int i12) {
        return new AudioFormat.Builder().setSampleRate(i5).setChannelMask(i11).setEncoding(i12).build();
    }

    public static boolean n(AudioTrack audioTrack) {
        return wf.v.f94376a >= 29 && audioTrack.isOffloadedPlayback();
    }

    public final void a(long j11) {
        g1 g1Var;
        boolean z11;
        k kVar;
        Handler handler;
        boolean zT = t();
        fl.l lVar = this.f59810b;
        if (zT) {
            g1Var = g().f59800a;
            g0 g0Var = (g0) lVar.f55375c;
            float f11 = g1Var.f54797a;
            if (g0Var.f59721c != f11) {
                g0Var.f59721c = f11;
                g0Var.f59727i = true;
            }
            float f12 = g1Var.f54798b;
            if (g0Var.f59722d != f12) {
                g0Var.f59722d = f12;
                g0Var.f59727i = true;
            }
        } else {
            g1Var = g1.f54796d;
        }
        g1 g1Var2 = g1Var;
        int i5 = 0;
        if (t()) {
            boolean z12 = g().f59801b;
            ((e0) lVar.f55374b).f59684m = z12;
            z11 = z12;
        } else {
            z11 = false;
        }
        this.f59820j.add(new w(g1Var2, z11, Math.max(0L, j11), (i() * 1000000) / this.f59828t.f59795e));
        h[] hVarArr = this.f59828t.f59799i;
        ArrayList arrayList = new ArrayList();
        for (h hVar : hVarArr) {
            if (hVar.b()) {
                arrayList.add(hVar);
            } else {
                hVar.flush();
            }
        }
        int size = arrayList.size();
        this.K = (h[]) arrayList.toArray(new h[size]);
        this.L = new ByteBuffer[size];
        while (true) {
            h[] hVarArr2 = this.K;
            if (i5 >= hVarArr2.length) {
                break;
            }
            h hVar2 = hVarArr2[i5];
            hVar2.flush();
            this.L[i5] = hVar2.a();
            i5++;
        }
        gu.j jVar = this.f59826r;
        if (jVar == null || (handler = (kVar = ((c0) jVar.f57836b).F0).f59744a) == null) {
            return;
        }
        handler.post(new j(kVar, z11, 0));
    }

    public final void b(fe.k0 k0Var, int[] iArr) {
        int i5;
        int iIntValue;
        int i11;
        h[] hVarArr;
        int i12;
        int i13;
        int i14;
        int i15;
        int iH;
        int[] iArr2;
        String str = k0Var.f54883l;
        int i16 = k0Var.f54895z;
        int i17 = k0Var.f54894y;
        int i18 = k0Var.A;
        if ("audio/raw".equals(str)) {
            wf.a.e(wf.v.w(i18));
            int iP = wf.v.p(i18, i17);
            h[] hVarArr2 = (this.f59812c && (i18 == 536870912 || i18 == 805306368 || i18 == 4)) ? this.f59817g : this.f59816f;
            int i19 = k0Var.B;
            int i21 = k0Var.C;
            h0 h0Var = this.f59815e;
            h0Var.f59734i = i19;
            h0Var.f59735j = i21;
            if (wf.v.f94376a < 21 && i17 == 8 && iArr == null) {
                iArr2 = new int[6];
                for (int i22 = 0; i22 < 6; i22++) {
                    iArr2[i22] = i22;
                }
            } else {
                iArr2 = iArr;
            }
            this.f59814d.f59788i = iArr2;
            g gVar = new g(i16, i17, i18);
            for (h hVar : hVarArr2) {
                try {
                    g gVarC = hVar.c(gVar);
                    if (hVar.b()) {
                        gVar = gVarC;
                    }
                } catch (AudioProcessor$UnhandledAudioFormatException e3) {
                    throw new AudioSink$ConfigurationException(e3, k0Var);
                }
            }
            int i23 = gVar.f59718c;
            int i24 = gVar.f59717b;
            int i25 = gVar.f59716a;
            iIntValue = wf.v.k(i24);
            int iP2 = wf.v.p(i23, i24);
            hVarArr = hVarArr2;
            i12 = i23;
            i16 = i25;
            i5 = iP2;
            i13 = iP;
            i11 = 0;
        } else {
            h[] hVarArr3 = new h[0];
            i5 = -1;
            if (u(k0Var, this.f59830v)) {
                String str2 = k0Var.f54883l;
                str2.getClass();
                int iA = wf.j.a(str2, k0Var.f54880i);
                iIntValue = wf.v.k(i17);
                i13 = -1;
                hVarArr = hVarArr3;
                i12 = iA;
                i11 = 1;
            } else {
                Pair pairA = this.f59808a.a(k0Var);
                if (pairA == null) {
                    throw new AudioSink$ConfigurationException("Unable to configure passthrough for: " + k0Var, k0Var);
                }
                int iIntValue2 = ((Integer) pairA.first).intValue();
                iIntValue = ((Integer) pairA.second).intValue();
                i11 = 2;
                hVarArr = hVarArr3;
                i12 = iIntValue2;
                i13 = -1;
            }
        }
        if (i12 == 0) {
            throw new AudioSink$ConfigurationException("Invalid output encoding (mode=" + i11 + ") for: " + k0Var, k0Var);
        }
        if (iIntValue == 0) {
            throw new AudioSink$ConfigurationException("Invalid output channel config (mode=" + i11 + ") for: " + k0Var, k0Var);
        }
        int minBufferSize = AudioTrack.getMinBufferSize(i16, iIntValue, i12);
        wf.a.i(minBufferSize != -2);
        double d5 = this.f59821k ? 8.0d : 1.0d;
        this.f59824p.getClass();
        if (i11 != 0) {
            if (i11 == 1) {
                i14 = i13;
                iH = ul.b.s((50000000 * z.a(i12)) / 1000000);
            } else {
                if (i11 != 2) {
                    throw new IllegalArgumentException();
                }
                i14 = i13;
                iH = ul.b.s(((i12 == 5 ? 500000 : 250000) * z.a(i12)) / 1000000);
            }
            i15 = i5;
        } else {
            i14 = i13;
            long j11 = i16;
            long j12 = 250000 * j11;
            long j13 = i5;
            i15 = i5;
            iH = wf.v.h(minBufferSize * 4, ul.b.s((j12 * j13) / 1000000), ul.b.s(((750000 * j11) * j13) / 1000000));
        }
        this.f59811b0 = false;
        v vVar = new v(k0Var, i14, i11, i15, i16, iIntValue, i12, (((Math.max(minBufferSize, (int) (iH * d5)) + i15) - 1) / i15) * i15, hVarArr);
        if (m()) {
            this.f59827s = vVar;
        } else {
            this.f59828t = vVar;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0038, code lost:
    
        if (r9.O != null) goto L20;
     */
    /* JADX WARN: Removed duplicated region for block: B:16:0x002f  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0018  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:15:0x0029 -> B:5:0x0009). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean c() throws Exception {
        boolean z11;
        int i5;
        h[] hVarArr;
        if (this.R != -1) {
            z11 = false;
            i5 = this.R;
            hVarArr = this.K;
            if (i5 < hVarArr.length) {
            }
            return false;
        }
        this.R = 0;
        z11 = true;
        i5 = this.R;
        hVarArr = this.K;
        if (i5 < hVarArr.length) {
            h hVar = hVarArr[i5];
            if (z11) {
                hVar.e();
            }
            p(-9223372036854775807L);
            if (hVar.f()) {
                this.R++;
                z11 = true;
                i5 = this.R;
                hVarArr = this.K;
                if (i5 < hVarArr.length) {
                    ByteBuffer byteBuffer = this.O;
                    if (byteBuffer != null) {
                        v(byteBuffer, -9223372036854775807L);
                    }
                    this.R = -1;
                    return true;
                }
            }
        }
        return false;
    }

    public final void d() {
        if (m()) {
            this.B = 0L;
            this.C = 0L;
            this.D = 0L;
            this.E = 0L;
            this.f59813c0 = false;
            this.F = 0;
            this.f59832x = new w(g().f59800a, g().f59801b, 0L, 0L);
            this.I = 0L;
            this.f59831w = null;
            this.f59820j.clear();
            this.M = null;
            this.N = 0;
            this.O = null;
            this.T = false;
            this.S = false;
            this.R = -1;
            this.f59834z = null;
            this.A = 0;
            this.f59815e.o = 0L;
            int i5 = 0;
            while (true) {
                h[] hVarArr = this.K;
                if (i5 >= hVarArr.length) {
                    break;
                }
                h hVar = hVarArr[i5];
                hVar.flush();
                this.L[i5] = hVar.a();
                i5++;
            }
            AudioTrack audioTrack = this.f59819i.f59759c;
            audioTrack.getClass();
            if (audioTrack.getPlayState() == 3) {
                this.f59829u.pause();
            }
            if (n(this.f59829u)) {
                fl.l lVar = this.f59823m;
                lVar.getClass();
                this.f59829u.unregisterStreamEventCallback((x) lVar.f55374b);
                ((Handler) lVar.f55376d).removeCallbacksAndMessages(null);
            }
            if (wf.v.f94376a < 21 && !this.V) {
                this.W = 0;
            }
            v vVar = this.f59827s;
            if (vVar != null) {
                this.f59828t = vVar;
                this.f59827s = null;
            }
            o oVar = this.f59819i;
            oVar.f59768l = 0L;
            oVar.f59777w = 0;
            oVar.f59776v = 0;
            oVar.f59769m = 0L;
            oVar.C = 0L;
            oVar.F = 0L;
            oVar.f59767k = false;
            oVar.f59759c = null;
            oVar.f59762f = null;
            AudioTrack audioTrack2 = this.f59829u;
            bg.g gVar = this.f59818h;
            gVar.c();
            synchronized (f59805d0) {
                try {
                    if (f59806e0 == null) {
                        f59806e0 = Executors.newSingleThreadExecutor(new wf.u("ExoPlayer:AudioTrackReleaseThread"));
                    }
                    f59807f0++;
                    f59806e0.execute(new l0(10, audioTrack2, gVar));
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            this.f59829u = null;
        }
        this.o.f13067c = null;
        this.n.f13067c = null;
    }

    public final int f(fe.k0 k0Var) {
        String str = k0Var.f54883l;
        int i5 = k0Var.A;
        if ("audio/raw".equals(str)) {
            if (!wf.v.w(i5)) {
                k2.t(i5, "Invalid PCM encoding: ", "DefaultAudioSink");
                return 0;
            }
            if (i5 != 2 && (!this.f59812c || i5 != 4)) {
                return 1;
            }
        } else if ((this.f59811b0 || !u(k0Var, this.f59830v)) && this.f59808a.a(k0Var) == null) {
            return 0;
        }
        return 2;
    }

    public final w g() {
        w wVar = this.f59831w;
        if (wVar != null) {
            return wVar;
        }
        ArrayDeque arrayDeque = this.f59820j;
        return !arrayDeque.isEmpty() ? (w) arrayDeque.getLast() : this.f59832x;
    }

    public final long h() {
        return this.f59828t.f59793c == 0 ? this.B / r0.f59792b : this.C;
    }

    public final long i() {
        return this.f59828t.f59793c == 0 ? this.D / r0.f59794d : this.E;
    }

    /* JADX WARN: Code restructure failed: missing block: B:152:0x02d3, code lost:
    
        if (r13 == 0) goto L153;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0104, code lost:
    
        if (r10.a() == 0) goto L12;
     */
    /* JADX WARN: Removed duplicated region for block: B:167:0x0331  */
    /* JADX WARN: Removed duplicated region for block: B:177:0x0359  */
    /* JADX WARN: Removed duplicated region for block: B:178:0x0364  */
    /* JADX WARN: Removed duplicated region for block: B:182:0x037d  */
    /* JADX WARN: Removed duplicated region for block: B:184:0x0383  */
    /* JADX WARN: Removed duplicated region for block: B:193:0x0093 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x014c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean j(long j11, int i5, ByteBuffer byteBuffer) throws Exception {
        boolean zM;
        int i11;
        long jH;
        int i12;
        int i13;
        byte b11;
        int i14;
        byte b12;
        int i15;
        ByteBuffer byteBuffer2 = this.M;
        wf.a.e(byteBuffer2 == null || byteBuffer == byteBuffer2);
        if (this.f59827s == null) {
            zM = m();
            k0 k0Var = this.n;
            if (zM) {
                try {
                    if (l()) {
                        k0Var.f13067c = null;
                        boolean z11 = this.H;
                        o oVar = this.f59819i;
                        if (z11) {
                            this.I = Math.max(0L, j11);
                            this.G = false;
                            this.H = false;
                            if (this.f59821k && wf.v.f94376a >= 23) {
                                s(this.f59833y);
                            }
                            a(j11);
                            if (this.U) {
                                this.U = true;
                                if (m()) {
                                    n nVar = oVar.f59762f;
                                    nVar.getClass();
                                    nVar.a();
                                    this.f59829u.play();
                                }
                            }
                        }
                        long jI = i();
                        AudioTrack audioTrack = oVar.f59759c;
                        audioTrack.getClass();
                        int playState = audioTrack.getPlayState();
                        if (oVar.f59764h) {
                            if (playState == 2) {
                                oVar.f59770p = false;
                                return false;
                            }
                            if (playState == 1) {
                            }
                        }
                        boolean z12 = oVar.f59770p;
                        boolean zB = oVar.b(jI);
                        oVar.f59770p = zB;
                        if (!z12 || zB || playState == 1) {
                            i11 = 2;
                        } else {
                            gu.j jVar = oVar.f59757a;
                            int i16 = oVar.f59761e;
                            long jF = wf.v.F(oVar.f59765i);
                            y yVar = (y) jVar.f57836b;
                            if (yVar.f59826r != null) {
                                i11 = 2;
                                long jElapsedRealtime = SystemClock.elapsedRealtime() - yVar.f59809a0;
                                k kVar = ((c0) yVar.f59826r.f57836b).F0;
                                Handler handler = kVar.f59744a;
                                if (handler != null) {
                                    handler.post(new i(kVar, i16, jF, jElapsedRealtime));
                                }
                            }
                        }
                        if (this.M == null) {
                            wf.a.e(byteBuffer.order() == ByteOrder.LITTLE_ENDIAN);
                            if (byteBuffer.hasRemaining()) {
                                v vVar = this.f59828t;
                                if (vVar.f59793c != 0 && this.F == 0) {
                                    int i17 = vVar.f59797g;
                                    char c11 = 16;
                                    switch (i17) {
                                        case 5:
                                        case 6:
                                        case 18:
                                            if (((byteBuffer.get(byteBuffer.position() + 5) & 248) >> 3) <= 10) {
                                                i12 = 1536;
                                                break;
                                            } else {
                                                i12 = a.f59656c[((byteBuffer.get(byteBuffer.position() + 4) & 192) >> 6) != 3 ? (byteBuffer.get(byteBuffer.position() + 4) & 48) >> 4 : 3] * 256;
                                                break;
                                            }
                                        case 7:
                                        case 8:
                                            int iPosition = byteBuffer.position();
                                            byte b13 = byteBuffer.get(iPosition);
                                            if (b13 != -2) {
                                                if (b13 == -1) {
                                                    i13 = (byteBuffer.get(iPosition + 4) & 7) << 4;
                                                    b12 = byteBuffer.get(iPosition + 7);
                                                } else if (b13 != 31) {
                                                    i13 = (byteBuffer.get(iPosition + 4) & 1) << 6;
                                                    b11 = byteBuffer.get(iPosition + 5);
                                                } else {
                                                    i13 = (byteBuffer.get(iPosition + 5) & 7) << 4;
                                                    b12 = byteBuffer.get(iPosition + 6);
                                                }
                                                i14 = b12 & 60;
                                                i12 = (((i14 >> i11) | i13) + 1) * 32;
                                                break;
                                            } else {
                                                i13 = (byteBuffer.get(iPosition + 5) & 1) << 6;
                                                b11 = byteBuffer.get(iPosition + 4);
                                            }
                                            i14 = b11 & 252;
                                            i12 = (((i14 >> i11) | i13) + 1) * 32;
                                        case 9:
                                            int iPosition2 = byteBuffer.position();
                                            int i18 = wf.v.f94376a;
                                            int iReverseBytes = byteBuffer.getInt(iPosition2);
                                            if (byteBuffer.order() != ByteOrder.BIG_ENDIAN) {
                                                iReverseBytes = Integer.reverseBytes(iReverseBytes);
                                            }
                                            int iG = a.g(iReverseBytes);
                                            if (iG == -1) {
                                                throw new IllegalArgumentException();
                                            }
                                            i12 = iG;
                                            break;
                                        case 10:
                                        case 16:
                                            i12 = 1024;
                                            break;
                                        case 11:
                                        case 12:
                                            i12 = 2048;
                                            break;
                                        case 13:
                                        default:
                                            throw new IllegalStateException(b.c0.h(i17, "Unexpected audio encoding: "));
                                        case 14:
                                            int iPosition3 = byteBuffer.position();
                                            int iLimit = byteBuffer.limit() - 10;
                                            int i19 = iPosition3;
                                            while (true) {
                                                if (i19 <= iLimit) {
                                                    int i21 = wf.v.f94376a;
                                                    int iReverseBytes2 = byteBuffer.getInt(i19 + 4);
                                                    char c12 = c11;
                                                    if (byteBuffer.order() != ByteOrder.BIG_ENDIAN) {
                                                        iReverseBytes2 = Integer.reverseBytes(iReverseBytes2);
                                                    }
                                                    if ((iReverseBytes2 & (-2)) == -126718022) {
                                                        i15 = i19 - iPosition3;
                                                    } else {
                                                        i19++;
                                                        c11 = c12;
                                                    }
                                                } else {
                                                    i15 = -1;
                                                }
                                            }
                                            if (i15 != -1) {
                                                i12 = (40 << ((byteBuffer.get((byteBuffer.position() + i15) + ((byteBuffer.get((byteBuffer.position() + i15) + 7) & 255) == 187 ? 9 : 8)) >> 4) & 7)) * 16;
                                                break;
                                            } else {
                                                i12 = 0;
                                                break;
                                            }
                                        case 15:
                                            i12 = EventBridgeChannel.QUEUE_CAPACITY;
                                            break;
                                        case 17:
                                            byte[] bArr = new byte[16];
                                            int iPosition4 = byteBuffer.position();
                                            byteBuffer.get(bArr);
                                            byteBuffer.position(iPosition4);
                                            i12 = a.e(new ke.x(bArr, 16)).f33200c;
                                            break;
                                    }
                                    this.F = i12;
                                }
                                if (this.f59831w == null) {
                                    jH = (((h() - this.f59815e.o) * 1000000) / this.f59828t.f59791a.f54895z) + this.I;
                                    if (!this.G && Math.abs(jH - j11) > 200000) {
                                        gu.j jVar2 = this.f59826r;
                                        StringBuilder sbU = b.c0.u(jH, "Unexpected audio track timestamp discontinuity: expected ", ", got ");
                                        sbU.append(j11);
                                        jVar2.j(new AudioSink$UnexpectedDiscontinuityException(sbU.toString()));
                                        this.G = true;
                                    }
                                    if (this.G) {
                                        if (c()) {
                                            long j12 = j11 - jH;
                                            this.I += j12;
                                            this.G = false;
                                            a(j11);
                                            gu.j jVar3 = this.f59826r;
                                            if (jVar3 != null && j12 != 0) {
                                                ((c0) jVar3.f57836b).M0 = true;
                                            }
                                        }
                                    }
                                    if (this.f59828t.f59793c != 0) {
                                        this.B += byteBuffer.remaining();
                                    } else {
                                        this.C = (this.F * i5) + this.C;
                                    }
                                    this.M = byteBuffer;
                                    this.N = i5;
                                    p(j11);
                                    if (!this.M.hasRemaining()) {
                                    }
                                } else if (c()) {
                                    a(j11);
                                    this.f59831w = null;
                                    jH = (((h() - this.f59815e.o) * 1000000) / this.f59828t.f59791a.f54895z) + this.I;
                                    if (!this.G) {
                                        gu.j jVar22 = this.f59826r;
                                        StringBuilder sbU2 = b.c0.u(jH, "Unexpected audio track timestamp discontinuity: expected ", ", got ");
                                        sbU2.append(j11);
                                        jVar22.j(new AudioSink$UnexpectedDiscontinuityException(sbU2.toString()));
                                        this.G = true;
                                    }
                                    if (this.G) {
                                    }
                                    if (this.f59828t.f59793c != 0) {
                                    }
                                    this.M = byteBuffer;
                                    this.N = i5;
                                    p(j11);
                                    if (!this.M.hasRemaining()) {
                                    }
                                }
                            }
                            return true;
                        }
                        p(j11);
                        if (!this.M.hasRemaining()) {
                            this.M = null;
                            this.N = 0;
                            return true;
                        }
                        long jI2 = i();
                        if (oVar.f59779y != -9223372036854775807L && jI2 > 0 && SystemClock.elapsedRealtime() - oVar.f59779y >= 200) {
                            wf.a.D("DefaultAudioSink", "Resetting stalled audio track");
                            d();
                            return true;
                        }
                        return false;
                    }
                } catch (AudioSink$InitializationException e3) {
                    if (e3.f31447b) {
                        throw e3;
                    }
                    k0Var.t(e3);
                    return false;
                }
            }
        } else if (c()) {
            v vVar2 = this.f59827s;
            v vVar3 = this.f59828t;
            vVar2.getClass();
            if (vVar3.f59793c == vVar2.f59793c && vVar3.f59797g == vVar2.f59797g && vVar3.f59795e == vVar2.f59795e && vVar3.f59796f == vVar2.f59796f && vVar3.f59794d == vVar2.f59794d) {
                this.f59828t = this.f59827s;
                this.f59827s = null;
                if (n(this.f59829u) && this.f59822l != 3) {
                    if (this.f59829u.getPlayState() == 3) {
                        this.f59829u.setOffloadEndOfStream();
                    }
                    AudioTrack audioTrack2 = this.f59829u;
                    fe.k0 k0Var2 = this.f59828t.f59791a;
                    audioTrack2.setOffloadDelayPadding(k0Var2.B, k0Var2.C);
                    this.f59813c0 = true;
                }
            } else {
                o();
                if (!k()) {
                    d();
                }
            }
            a(j11);
            zM = m();
            k0 k0Var3 = this.n;
            if (zM) {
            }
        }
        return false;
    }

    public final boolean k() {
        return m() && this.f59819i.b(i());
    }

    /* JADX WARN: Removed duplicated region for block: B:79:0x0156  */
    /* JADX WARN: Removed duplicated region for block: B:92:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean l() throws AudioSink$InitializationException {
        boolean z11;
        AudioTrack audioTrackA;
        ge.m mVar;
        bg.g gVar = this.f59818h;
        synchronized (gVar) {
            z11 = gVar.f17888a;
        }
        if (!z11) {
            return false;
        }
        try {
            v vVar = this.f59828t;
            vVar.getClass();
            try {
                audioTrackA = vVar.a(this.Z, this.f59830v, this.W);
            } catch (AudioSink$InitializationException e3) {
                gu.j jVar = this.f59826r;
                if (jVar != null) {
                    jVar.j(e3);
                }
                throw e3;
            }
        } catch (AudioSink$InitializationException e11) {
            v vVar2 = this.f59828t;
            if (vVar2.f59798h > 1000000) {
                v vVar3 = new v(vVar2.f59791a, vVar2.f59792b, vVar2.f59793c, vVar2.f59794d, vVar2.f59795e, vVar2.f59796f, vVar2.f59797g, 1000000, vVar2.f59799i);
                try {
                    try {
                        audioTrackA = vVar3.a(this.Z, this.f59830v, this.W);
                        this.f59828t = vVar3;
                    } catch (AudioSink$InitializationException e12) {
                        gu.j jVar2 = this.f59826r;
                        if (jVar2 != null) {
                            jVar2.j(e12);
                        }
                        throw e12;
                    }
                } catch (AudioSink$InitializationException e13) {
                    e11.addSuppressed(e13);
                    if (this.f59828t.f59793c == 1) {
                    }
                }
            }
            if (this.f59828t.f59793c == 1) {
                throw e11;
            }
            this.f59811b0 = true;
            throw e11;
        }
        this.f59829u = audioTrackA;
        if (n(audioTrackA)) {
            AudioTrack audioTrack = this.f59829u;
            if (this.f59823m == null) {
                this.f59823m = new fl.l(this);
            }
            fl.l lVar = this.f59823m;
            Handler handler = (Handler) lVar.f55376d;
            Objects.requireNonNull(handler);
            audioTrack.registerStreamEventCallback(new m7.p(handler), (x) lVar.f55374b);
            if (this.f59822l != 3) {
                AudioTrack audioTrack2 = this.f59829u;
                fe.k0 k0Var = this.f59828t.f59791a;
                audioTrack2.setOffloadDelayPadding(k0Var.B, k0Var.C);
            }
        }
        int i5 = wf.v.f94376a;
        if (i5 >= 31 && (mVar = this.f59825q) != null) {
            t.a(this.f59829u, mVar);
        }
        this.W = this.f59829u.getAudioSessionId();
        o oVar = this.f59819i;
        AudioTrack audioTrack3 = this.f59829u;
        v vVar4 = this.f59828t;
        boolean z12 = vVar4.f59793c == 2;
        int i11 = vVar4.f59797g;
        int i12 = vVar4.f59794d;
        int i13 = vVar4.f59798h;
        oVar.f59759c = audioTrack3;
        oVar.f59760d = i12;
        oVar.f59761e = i13;
        oVar.f59762f = new n(audioTrack3);
        oVar.f59763g = audioTrack3.getSampleRate();
        oVar.f59764h = z12 && i5 < 23 && (i11 == 5 || i11 == 6);
        boolean zW = wf.v.w(i11);
        oVar.f59771q = zW;
        oVar.f59765i = zW ? ((i13 / i12) * 1000000) / oVar.f59763g : -9223372036854775807L;
        oVar.f59773s = 0L;
        oVar.f59774t = 0L;
        oVar.f59775u = 0L;
        oVar.f59770p = false;
        oVar.f59778x = -9223372036854775807L;
        oVar.f59779y = -9223372036854775807L;
        oVar.f59772r = 0L;
        oVar.o = 0L;
        oVar.f59766j = 1.0f;
        if (m()) {
            if (i5 >= 21) {
                this.f59829u.setVolume(this.J);
            } else {
                AudioTrack audioTrack4 = this.f59829u;
                float f11 = this.J;
                audioTrack4.setStereoVolume(f11, f11);
            }
        }
        this.X.getClass();
        u uVar = this.Y;
        if (uVar != null && i5 >= 23) {
            s.a(this.f59829u, uVar);
        }
        this.H = true;
        return true;
    }

    public final boolean m() {
        return this.f59829u != null;
    }

    public final void o() {
        if (this.T) {
            return;
        }
        this.T = true;
        long jI = i();
        o oVar = this.f59819i;
        oVar.f59780z = oVar.a();
        oVar.f59778x = SystemClock.elapsedRealtime() * 1000;
        oVar.A = jI;
        this.f59829u.stop();
        this.A = 0;
    }

    public final void p(long j11) throws Exception {
        ByteBuffer byteBuffer;
        int length = this.K.length;
        int i5 = length;
        while (i5 >= 0) {
            if (i5 > 0) {
                byteBuffer = this.L[i5 - 1];
            } else {
                byteBuffer = this.M;
                if (byteBuffer == null) {
                    byteBuffer = h.f59733a;
                }
            }
            if (i5 == length) {
                v(byteBuffer, j11);
            } else {
                h hVar = this.K[i5];
                if (i5 > this.R) {
                    hVar.d(byteBuffer);
                }
                ByteBuffer byteBufferA = hVar.a();
                this.L[i5] = byteBufferA;
                if (byteBufferA.hasRemaining()) {
                    i5++;
                }
            }
            if (byteBuffer.hasRemaining()) {
                return;
            } else {
                i5--;
            }
        }
    }

    public final void q() {
        d();
        for (h hVar : this.f59816f) {
            hVar.reset();
        }
        for (h hVar2 : this.f59817g) {
            hVar2.reset();
        }
        this.U = false;
        this.f59811b0 = false;
    }

    public final void r(g1 g1Var, boolean z11) {
        w wVarG = g();
        if (g1Var.equals(wVarG.f59800a) && z11 == wVarG.f59801b) {
            return;
        }
        w wVar = new w(g1Var, z11, -9223372036854775807L, -9223372036854775807L);
        if (m()) {
            this.f59831w = wVar;
        } else {
            this.f59832x = wVar;
        }
    }

    public final void s(g1 g1Var) {
        if (m()) {
            try {
                this.f59829u.setPlaybackParams(new PlaybackParams().allowDefaults().setSpeed(g1Var.f54797a).setPitch(g1Var.f54798b).setAudioFallbackMode(2));
            } catch (IllegalArgumentException e3) {
                wf.a.E("DefaultAudioSink", "Failed to set playback params", e3);
            }
            g1Var = new g1(this.f59829u.getPlaybackParams().getSpeed(), this.f59829u.getPlaybackParams().getPitch());
            float f11 = g1Var.f54797a;
            o oVar = this.f59819i;
            oVar.f59766j = f11;
            n nVar = oVar.f59762f;
            if (nVar != null) {
                nVar.a();
            }
        }
        this.f59833y = g1Var;
    }

    public final boolean t() {
        if (this.Z || !"audio/raw".equals(this.f59828t.f59791a.f54883l)) {
            return false;
        }
        int i5 = this.f59828t.f59791a.A;
        if (!this.f59812c) {
            return true;
        }
        int i11 = wf.v.f94376a;
        return (i5 == 536870912 || i5 == 805306368 || i5 == 4) ? false : true;
    }

    public final boolean u(fe.k0 k0Var, d dVar) {
        int i5;
        int iK;
        int i11 = wf.v.f94376a;
        if (i11 >= 29 && (i5 = this.f59822l) != 0) {
            String str = k0Var.f54883l;
            str.getClass();
            int iA = wf.j.a(str, k0Var.f54880i);
            if (iA != 0 && (iK = wf.v.k(k0Var.f54894y)) != 0) {
                AudioFormat audioFormatE = e(k0Var.f54895z, iK, iA);
                AudioAttributes audioAttributes = (AudioAttributes) dVar.a().f57836b;
                int playbackOffloadSupport = i11 >= 31 ? AudioManager.getPlaybackOffloadSupport(audioFormatE, audioAttributes) : !AudioManager.isOffloadedPlaybackSupported(audioFormatE, audioAttributes) ? 0 : (i11 == 30 && wf.v.f94379d.startsWith("Pixel")) ? 2 : 1;
                if (playbackOffloadSupport != 0) {
                    if (playbackOffloadSupport == 1) {
                        boolean z11 = (k0Var.B == 0 && k0Var.C == 0) ? false : true;
                        boolean z12 = i5 == 1;
                        if (!z11 || !z12) {
                        }
                    } else if (playbackOffloadSupport != 2) {
                        throw new IllegalStateException();
                    }
                    return true;
                }
            }
        }
        return false;
    }

    public final void v(ByteBuffer byteBuffer, long j11) throws Exception {
        ByteBuffer byteBuffer2;
        int iWrite;
        int iWrite2;
        gu.j jVar;
        fe.c0 c0Var;
        if (byteBuffer.hasRemaining()) {
            ByteBuffer byteBuffer3 = this.O;
            if (byteBuffer3 != null) {
                wf.a.e(byteBuffer3 == byteBuffer);
            } else {
                this.O = byteBuffer;
                if (wf.v.f94376a < 21) {
                    int iRemaining = byteBuffer.remaining();
                    byte[] bArr = this.P;
                    if (bArr == null || bArr.length < iRemaining) {
                        this.P = new byte[iRemaining];
                    }
                    int iPosition = byteBuffer.position();
                    byteBuffer.get(this.P, 0, iRemaining);
                    byteBuffer.position(iPosition);
                    this.Q = 0;
                }
            }
            int iRemaining2 = byteBuffer.remaining();
            int i5 = wf.v.f94376a;
            if (i5 < 21) {
                long j12 = this.D;
                o oVar = this.f59819i;
                int iA = oVar.f59761e - ((int) (j12 - (oVar.a() * oVar.f59760d)));
                if (iA > 0) {
                    iWrite = this.f59829u.write(this.P, this.Q, Math.min(iRemaining2, iA));
                    if (iWrite > 0) {
                        this.Q += iWrite;
                        byteBuffer.position(byteBuffer.position() + iWrite);
                    }
                } else {
                    iWrite = 0;
                }
                byteBuffer2 = byteBuffer;
            } else if (this.Z) {
                wf.a.i(j11 != -9223372036854775807L);
                AudioTrack audioTrack = this.f59829u;
                if (i5 >= 26) {
                    byteBuffer2 = byteBuffer;
                    iWrite2 = audioTrack.write(byteBuffer2, iRemaining2, 1, j11 * 1000);
                } else {
                    byteBuffer2 = byteBuffer;
                    if (this.f59834z == null) {
                        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(16);
                        this.f59834z = byteBufferAllocate;
                        byteBufferAllocate.order(ByteOrder.BIG_ENDIAN);
                        this.f59834z.putInt(1431633921);
                    }
                    if (this.A == 0) {
                        this.f59834z.putInt(4, iRemaining2);
                        this.f59834z.putLong(8, j11 * 1000);
                        this.f59834z.position(0);
                        this.A = iRemaining2;
                    }
                    int iRemaining3 = this.f59834z.remaining();
                    if (iRemaining3 > 0) {
                        iWrite = audioTrack.write(this.f59834z, iRemaining3, 1);
                        if (iWrite < 0) {
                            this.A = 0;
                        } else if (iWrite < iRemaining3) {
                            iWrite = 0;
                        }
                    }
                    iWrite2 = audioTrack.write(byteBuffer2, iRemaining2, 1);
                    if (iWrite2 < 0) {
                        this.A = 0;
                    } else {
                        this.A -= iWrite2;
                    }
                }
                iWrite = iWrite2;
            } else {
                byteBuffer2 = byteBuffer;
                iWrite = this.f59829u.write(byteBuffer2, iRemaining2, 1);
            }
            this.f59809a0 = SystemClock.elapsedRealtime();
            k0 k0Var = this.o;
            if (iWrite < 0) {
                AudioSink$WriteException audioSink$WriteException = new AudioSink$WriteException(iWrite, this.f59828t.f59791a, ((i5 >= 24 && iWrite == -6) || iWrite == -32) && this.E > 0);
                gu.j jVar2 = this.f59826r;
                if (jVar2 != null) {
                    jVar2.j(audioSink$WriteException);
                }
                if (audioSink$WriteException.f31450b) {
                    throw audioSink$WriteException;
                }
                k0Var.t(audioSink$WriteException);
                return;
            }
            k0Var.f13067c = null;
            if (n(this.f59829u)) {
                if (this.E > 0) {
                    this.f59813c0 = false;
                }
                if (this.U && (jVar = this.f59826r) != null && iWrite < iRemaining2 && !this.f59813c0 && (c0Var = ((c0) jVar.f57836b).O0) != null) {
                    c0Var.f54732a.G = true;
                }
            }
            int i11 = this.f59828t.f59793c;
            if (i11 == 0) {
                this.D += iWrite;
            }
            if (iWrite == iRemaining2) {
                if (i11 != 0) {
                    wf.a.i(byteBuffer2 == this.M);
                    this.E = (this.F * this.N) + this.E;
                }
                this.O = null;
            }
        }
    }
}
