package fe;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.util.Pair;
import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.android.exoplayer2.ParserException;
import com.google.android.exoplayer2.drm.DrmSession$DrmSessionException;
import com.google.android.exoplayer2.metadata.Metadata;
import com.google.android.exoplayer2.source.BehindLiveWindowException;
import com.google.android.exoplayer2.upstream.DataSourceException;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import xk.r2;

/* loaded from: classes3.dex */
public final class h0 implements Handler.Callback, gf.s, m1 {
    public boolean A;
    public boolean B;
    public boolean C;
    public int D;
    public boolean E;
    public boolean F;
    public boolean G;
    public boolean H;
    public int I;
    public g0 J;
    public long K;
    public int L;
    public boolean M;
    public ExoPlaybackException N;
    public long O = -9223372036854775807L;

    /* renamed from: a, reason: collision with root package name */
    public final c[] f54809a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f54810b;

    /* renamed from: c, reason: collision with root package name */
    public final c[] f54811c;

    /* renamed from: d, reason: collision with root package name */
    public final c3.b f54812d;

    /* renamed from: e, reason: collision with root package name */
    public final tf.v f54813e;

    /* renamed from: f, reason: collision with root package name */
    public final h f54814f;

    /* renamed from: g, reason: collision with root package name */
    public final vf.e f54815g;

    /* renamed from: h, reason: collision with root package name */
    public final wf.s f54816h;

    /* renamed from: i, reason: collision with root package name */
    public final HandlerThread f54817i;

    /* renamed from: j, reason: collision with root package name */
    public final Looper f54818j;

    /* renamed from: k, reason: collision with root package name */
    public final y1 f54819k;

    /* renamed from: l, reason: collision with root package name */
    public final x1 f54820l;

    /* renamed from: m, reason: collision with root package name */
    public final long f54821m;
    public final i n;
    public final ArrayList o;

    /* renamed from: p, reason: collision with root package name */
    public final wf.q f54822p;

    /* renamed from: q, reason: collision with root package name */
    public final q f54823q;

    /* renamed from: r, reason: collision with root package name */
    public final z0 f54824r;

    /* renamed from: s, reason: collision with root package name */
    public final bk.l f54825s;

    /* renamed from: t, reason: collision with root package name */
    public final g f54826t;

    /* renamed from: u, reason: collision with root package name */
    public final long f54827u;

    /* renamed from: v, reason: collision with root package name */
    public s1 f54828v;

    /* renamed from: w, reason: collision with root package name */
    public f1 f54829w;

    /* renamed from: x, reason: collision with root package name */
    public e0 f54830x;

    /* renamed from: y, reason: collision with root package name */
    public boolean f54831y;

    /* renamed from: z, reason: collision with root package name */
    public boolean f54832z;

    public h0(c[] cVarArr, c3.b bVar, tf.v vVar, h hVar, vf.e eVar, int i5, boolean z11, ge.f fVar, s1 s1Var, g gVar, long j11, boolean z12, Looper looper, wf.q qVar, q qVar2, ge.m mVar) {
        this.f54823q = qVar2;
        this.f54809a = cVarArr;
        this.f54812d = bVar;
        this.f54813e = vVar;
        this.f54814f = hVar;
        this.f54815g = eVar;
        this.D = i5;
        this.E = z11;
        this.f54828v = s1Var;
        this.f54826t = gVar;
        this.f54827u = j11;
        this.f54832z = z12;
        this.f54822p = qVar;
        this.f54821m = hVar.f54806g;
        f1 f1VarH = f1.h(vVar);
        this.f54829w = f1VarH;
        this.f54830x = new e0(f1VarH);
        this.f54811c = new c[cVarArr.length];
        for (int i11 = 0; i11 < cVarArr.length; i11++) {
            c cVar = cVarArr[i11];
            cVar.f54723d = i11;
            cVar.f54724e = mVar;
            this.f54811c[i11] = cVar;
        }
        this.n = new i(this, qVar);
        this.o = new ArrayList();
        this.f54810b = Collections.newSetFromMap(new IdentityHashMap());
        this.f54819k = new y1();
        this.f54820l = new x1();
        bVar.f19222a = this;
        bVar.f19223b = eVar;
        this.M = true;
        Handler handler = new Handler(looper);
        this.f54824r = new z0(handler, fVar);
        this.f54825s = new bk.l(this, fVar, handler, mVar);
        HandlerThread handlerThread = new HandlerThread("ExoPlayer:Playback", -16);
        this.f54817i = handlerThread;
        handlerThread.start();
        Looper looper2 = handlerThread.getLooper();
        this.f54818j = looper2;
        this.f54816h = qVar.a(looper2, this);
    }

    public static Pair E(z1 z1Var, g0 g0Var, boolean z11, int i5, boolean z12, y1 y1Var, x1 x1Var) {
        Object objF;
        z1 z1Var2 = g0Var.f54793a;
        if (z1Var.p()) {
            return null;
        }
        z1 z1Var3 = z1Var2.p() ? z1Var : z1Var2;
        try {
            Pair pairI = z1Var3.i(y1Var, x1Var, g0Var.f54794b, g0Var.f54795c);
            if (!z1Var.equals(z1Var3)) {
                if (z1Var.b(pairI.first) == -1) {
                    if (!z11 || (objF = F(y1Var, x1Var, i5, z12, pairI.first, z1Var3, z1Var)) == null) {
                        return null;
                    }
                    return z1Var.i(y1Var, x1Var, z1Var.g(objF, x1Var).f55077c, -9223372036854775807L);
                }
                if (z1Var3.g(pairI.first, x1Var).f55080f && z1Var3.m(x1Var.f55077c, y1Var, 0L).n == z1Var3.b(pairI.first)) {
                    return z1Var.i(y1Var, x1Var, z1Var.g(pairI.first, x1Var).f55077c, g0Var.f54795c);
                }
            }
            return pairI;
        } catch (IndexOutOfBoundsException unused) {
            return null;
        }
    }

    public static Object F(y1 y1Var, x1 x1Var, int i5, boolean z11, Object obj, z1 z1Var, z1 z1Var2) {
        int iB = z1Var.b(obj);
        int iH = z1Var.h();
        int i11 = 0;
        int iD = iB;
        int iB2 = -1;
        while (i11 < iH && iB2 == -1) {
            y1 y1Var2 = y1Var;
            x1 x1Var2 = x1Var;
            int i12 = i5;
            boolean z12 = z11;
            z1 z1Var3 = z1Var;
            iD = z1Var3.d(iD, x1Var2, y1Var2, i12, z12);
            if (iD == -1) {
                break;
            }
            iB2 = z1Var2.b(z1Var3.l(iD));
            i11++;
            z1Var = z1Var3;
            x1Var = x1Var2;
            y1Var = y1Var2;
            i5 = i12;
            z11 = z12;
        }
        if (iB2 == -1) {
            return null;
        }
        return z1Var2.l(iB2);
    }

    public static void L(c cVar, long j11) {
        cVar.f54730k = true;
        if (cVar instanceof jf.j) {
            jf.j jVar = (jf.j) cVar;
            wf.a.i(jVar.f54730k);
            jVar.A = j11;
        }
    }

    public static boolean q(c cVar) {
        return cVar.f54725f != 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00c1 A[PHI: r4 r5 r7
      0x00c1: PHI (r4v4 gf.w) = (r4v3 gf.w), (r4v11 gf.w) binds: [B:35:0x0096, B:37:0x00bb] A[DONT_GENERATE, DONT_INLINE]
      0x00c1: PHI (r5v2 long) = (r5v1 long), (r5v8 long) binds: [B:35:0x0096, B:37:0x00bb] A[DONT_GENERATE, DONT_INLINE]
      0x00c1: PHI (r7v3 long) = (r7v2 long), (r7v8 long) binds: [B:35:0x0096, B:37:0x00bb] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A(boolean z11, boolean z12, boolean z13, boolean z14) {
        long j11;
        boolean z15;
        List list;
        this.f54816h.f94370a.removeMessages(2);
        this.N = null;
        this.B = false;
        i iVar = this.n;
        iVar.f54839f = false;
        ai.w0 w0Var = iVar.f54834a;
        if (w0Var.f13388c) {
            w0Var.b(w0Var.d());
            w0Var.f13388c = false;
        }
        this.K = 1000000000000L;
        for (c cVar : this.f54809a) {
            try {
                d(cVar);
            } catch (ExoPlaybackException | RuntimeException e3) {
                wf.a.p("ExoPlayerImplInternal", "Disable failed.", e3);
            }
        }
        if (z11) {
            for (c cVar2 : this.f54809a) {
                if (this.f54810b.remove(cVar2)) {
                    try {
                        cVar2.v();
                    } catch (RuntimeException e11) {
                        wf.a.p("ExoPlayerImplInternal", "Reset failed.", e11);
                    }
                }
            }
        }
        this.I = 0;
        f1 f1Var = this.f54829w;
        gf.w wVar = f1Var.f54765b;
        long jLongValue = f1Var.f54779r;
        if (!this.f54829w.f54765b.a()) {
            f1 f1Var2 = this.f54829w;
            x1 x1Var = this.f54820l;
            gf.w wVar2 = f1Var2.f54765b;
            z1 z1Var = f1Var2.f54764a;
            j11 = (z1Var.p() || z1Var.g(wVar2.f57640a, x1Var).f55080f) ? this.f54829w.f54766c : this.f54829w.f54779r;
        }
        if (z12) {
            this.J = null;
            Pair pairH = h(this.f54829w.f54764a);
            wVar = (gf.w) pairH.first;
            jLongValue = ((Long) pairH.second).longValue();
            j11 = -9223372036854775807L;
            z15 = !wVar.equals(this.f54829w.f54765b);
        }
        long j12 = jLongValue;
        gf.w wVar3 = wVar;
        this.f54824r.b();
        this.C = false;
        f1 f1Var3 = this.f54829w;
        z1 z1Var2 = f1Var3.f54764a;
        int i5 = f1Var3.f54768e;
        ExoPlaybackException exoPlaybackException = z14 ? null : f1Var3.f54769f;
        gf.y0 y0Var = z15 ? gf.y0.f57665d : f1Var3.f54771h;
        tf.v vVar = z15 ? this.f54813e : f1Var3.f54772i;
        if (z15) {
            xk.l0 l0Var = xk.v0.f96030b;
            list = r2.f96007e;
        } else {
            list = f1Var3.f54773j;
        }
        this.f54829w = new f1(z1Var2, wVar3, j11, j12, i5, exoPlaybackException, false, y0Var, vVar, list, wVar3, f1Var3.f54775l, f1Var3.f54776m, f1Var3.n, j12, 0L, j12, false);
        if (z13) {
            bk.l lVar = this.f54825s;
            HashMap map = (HashMap) lVar.f18024i;
            for (c1 c1Var : map.values()) {
                try {
                    c1Var.f54733a.n(c1Var.f54734b);
                } catch (RuntimeException e12) {
                    wf.a.p("MediaSourceList", "Failed to release child source.", e12);
                }
                gf.a aVar = c1Var.f54733a;
                tm.o oVar = c1Var.f54735c;
                aVar.q(oVar);
                c1Var.f54733a.p(oVar);
            }
            map.clear();
            ((HashSet) lVar.f18025j).clear();
            lVar.f18016a = false;
        }
    }

    public final void B() {
        x0 x0Var = this.f54824r.f55121h;
        this.A = x0Var != null && x0Var.f55067f.f55093h && this.f54832z;
    }

    public final void C(long j11) {
        x0 x0Var = this.f54824r.f55121h;
        long j12 = j11 + (x0Var == null ? 1000000000000L : x0Var.o);
        this.K = j12;
        this.n.f54834a.b(j12);
        for (c cVar : this.f54809a) {
            if (q(cVar)) {
                long j13 = this.K;
                cVar.f54730k = false;
                cVar.f54729j = j13;
                cVar.n(j13, false);
            }
        }
        for (x0 x0Var2 = r0.f55121h; x0Var2 != null; x0Var2 = x0Var2.f55073l) {
            for (tf.q qVar : x0Var2.n.f89179c) {
                if (qVar != null) {
                    qVar.d();
                }
            }
        }
    }

    public final void D(z1 z1Var, z1 z1Var2) {
        if (z1Var.p() && z1Var2.p()) {
            return;
        }
        ArrayList arrayList = this.o;
        int size = arrayList.size() - 1;
        if (size < 0) {
            Collections.sort(arrayList);
        } else {
            b.c0.y(arrayList.get(size));
            throw null;
        }
    }

    public final void G(boolean z11) throws ExoPlaybackException {
        gf.w wVar = this.f54824r.f55121h.f55067f.f55086a;
        long jI = I(wVar, this.f54829w.f54779r, true, false);
        if (jI != this.f54829w.f54779r) {
            f1 f1Var = this.f54829w;
            this.f54829w = o(wVar, jI, f1Var.f54766c, f1Var.f54767d, z11, 5);
        }
    }

    /* JADX WARN: Can't wrap try/catch for region: R(18:36|(7:(9:103|38|(1:46)(1:44)|47|(1:54)|55|56|57|58)(1:61)|105|81|82|83|57|58)|101|62|(1:64)(1:65)|66|(1:68)(1:70)|69|71|72|(1:74)(1:75)|76|99|77|78|96|79|80) */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x0154, code lost:
    
        r0 = th;
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x0155, code lost:
    
        r2 = r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x0156, code lost:
    
        r5 = r15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x0158, code lost:
    
        r0 = th;
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x015a, code lost:
    
        r0 = th;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x015b, code lost:
    
        r5 = r15;
     */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00a1 A[Catch: all -> 0x00a4, TryCatch #1 {all -> 0x00a4, blocks: (B:22:0x0097, B:24:0x00a1, B:31:0x00ad, B:33:0x00b3, B:34:0x00b6, B:36:0x00be, B:40:0x00ce, B:44:0x00d6), top: B:98:0x0097 }] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00aa  */
    /* JADX WARN: Type inference failed for: r0v16, types: [gf.t, java.lang.Object] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void H(g0 g0Var) throws Throwable {
        long jLongValue;
        gf.w wVarM;
        long j11;
        boolean z11;
        long j12;
        boolean z12;
        gf.w wVar;
        long j13;
        long jP;
        long j14;
        f1 f1Var;
        int i5;
        long j15;
        boolean z13;
        gf.w wVar2;
        int i11;
        long j16;
        long jI;
        boolean z14;
        f1 f1Var2;
        gf.w wVar3;
        z1 z1Var;
        long j17;
        h0 h0Var = this;
        h0Var.f54830x.a(1);
        Pair pairE = E(h0Var.f54829w.f54764a, g0Var, true, h0Var.D, h0Var.E, h0Var.f54819k, h0Var.f54820l);
        try {
            if (pairE == null) {
                Pair pairH = h0Var.h(h0Var.f54829w.f54764a);
                wVarM = (gf.w) pairH.first;
                jLongValue = ((Long) pairH.second).longValue();
                z11 = !h0Var.f54829w.f54764a.p();
                j12 = -9223372036854775807L;
            } else {
                Object obj = pairE.first;
                jLongValue = ((Long) pairE.second).longValue();
                long j18 = g0Var.f54795c == -9223372036854775807L ? -9223372036854775807L : jLongValue;
                wVarM = h0Var.f54824r.m(h0Var.f54829w.f54764a, obj, jLongValue);
                if (!wVarM.a()) {
                    j11 = 0;
                    z11 = g0Var.f54795c == -9223372036854775807L;
                    j12 = j18;
                    if (!h0Var.f54829w.f54764a.p()) {
                        h0Var.J = g0Var;
                    } else if (pairE == null) {
                        if (h0Var.f54829w.f54768e != 1) {
                            h0Var.V(4);
                        }
                        h0Var.A(false, true, false, true);
                    } else {
                        try {
                            if (wVarM.equals(h0Var.f54829w.f54765b)) {
                                try {
                                    x0 x0Var = h0Var.f54824r.f55121h;
                                    jP = (x0Var == null || !x0Var.f55065d || jLongValue == j11) ? jLongValue : x0Var.f55062a.p(jLongValue, h0Var.f54828v);
                                    if (wf.v.F(jP) != wf.v.F(h0Var.f54829w.f54779r) || ((i5 = (f1Var = h0Var.f54829w).f54768e) != 2 && i5 != 3)) {
                                        z12 = z11;
                                        j14 = j12;
                                        wVar = wVarM;
                                    }
                                    j15 = f1Var.f54779r;
                                    z13 = z11;
                                    wVar2 = wVarM;
                                    i11 = 2;
                                    j16 = j15;
                                    h0Var.f54829w = h0Var.o(wVar2, j15, j12, j16, z13, i11);
                                    return;
                                } catch (Throwable th2) {
                                    th = th2;
                                    z12 = z11;
                                    wVar = wVarM;
                                    j13 = jLongValue;
                                    h0Var.f54829w = h0Var.o(wVar, j13, j12, j13, z12, 2);
                                    throw th;
                                }
                            }
                            z12 = z11;
                            j14 = j12;
                            wVar = wVarM;
                            jP = jLongValue;
                            h0Var.e0(z1Var, wVar3, z1Var, f1Var2.f54765b, j17);
                            wVar2 = wVar3;
                            j12 = j17;
                            z13 = z14;
                            j15 = jI;
                            i11 = 2;
                            j16 = j15;
                            h0Var = this;
                            h0Var.f54829w = h0Var.o(wVar2, j15, j12, j16, z13, i11);
                            return;
                        } catch (Throwable th3) {
                            th = th3;
                            wVar = wVar3;
                            j12 = j17;
                            z12 = z14;
                            j13 = jI;
                            h0Var.f54829w = h0Var.o(wVar, j13, j12, j13, z12, 2);
                            throw th;
                        }
                        boolean z15 = h0Var.f54829w.f54768e == 4;
                        z0 z0Var = h0Var.f54824r;
                        jI = h0Var.I(wVar, jP, z0Var.f55121h != z0Var.f55122i, z15);
                        z14 = z12 | (jLongValue != jI);
                        f1Var2 = h0Var.f54829w;
                        wVar3 = wVar;
                        z1Var = f1Var2.f54764a;
                        j17 = j14;
                    }
                    z13 = z11;
                    wVar2 = wVarM;
                    j15 = jLongValue;
                    i11 = 2;
                    j16 = j15;
                    h0Var = this;
                    h0Var.f54829w = h0Var.o(wVar2, j15, j12, j16, z13, i11);
                    return;
                }
                h0Var.f54829w.f54764a.g(wVarM.f57640a, h0Var.f54820l);
                jLongValue = h0Var.f54820l.f(wVarM.f57641b) == wVarM.f57642c ? h0Var.f54820l.f55081g.f59849b : 0L;
                z11 = true;
                j12 = j18;
            }
            if (!h0Var.f54829w.f54764a.p()) {
            }
            z13 = z11;
            wVar2 = wVarM;
            j15 = jLongValue;
            i11 = 2;
            j16 = j15;
            h0Var = this;
            h0Var.f54829w = h0Var.o(wVar2, j15, j12, j16, z13, i11);
            return;
        } catch (Throwable th4) {
            th = th4;
            z12 = z11;
        }
        j11 = 0;
    }

    /* JADX WARN: Type inference failed for: r9v5, types: [gf.t, java.lang.Object] */
    public final long I(gf.w wVar, long j11, boolean z11, boolean z12) throws ExoPlaybackException {
        a0();
        this.B = false;
        if (z12 || this.f54829w.f54768e == 3) {
            V(2);
        }
        z0 z0Var = this.f54824r;
        x0 x0Var = z0Var.f55121h;
        x0 x0Var2 = x0Var;
        while (x0Var2 != null && !wVar.equals(x0Var2.f55067f.f55086a)) {
            x0Var2 = x0Var2.f55073l;
        }
        if (z11 || x0Var != x0Var2 || (x0Var2 != null && x0Var2.o + j11 < 0)) {
            c[] cVarArr = this.f54809a;
            for (c cVar : cVarArr) {
                d(cVar);
            }
            if (x0Var2 != null) {
                while (z0Var.f55121h != x0Var2) {
                    z0Var.a();
                }
                z0Var.k(x0Var2);
                x0Var2.o = 1000000000000L;
                f(new boolean[cVarArr.length]);
            }
        }
        if (x0Var2 != null) {
            ?? r92 = x0Var2.f55062a;
            z0Var.k(x0Var2);
            if (!x0Var2.f55065d) {
                x0Var2.f55067f = x0Var2.f55067f.b(j11);
            } else if (x0Var2.f55066e) {
                j11 = r92.e(j11);
                r92.m(j11 - this.f54821m);
            }
            C(j11);
            s();
        } else {
            z0Var.b();
            C(j11);
        }
        k(false);
        this.f54816h.c(2);
        return j11;
    }

    public final void J(o1 o1Var) {
        wf.s sVar = this.f54816h;
        if (o1Var.f54944f != this.f54818j) {
            sVar.a(15, o1Var).b();
            return;
        }
        synchronized (o1Var) {
        }
        try {
            o1Var.f54939a.b(o1Var.f54942d, o1Var.f54943e);
            o1Var.b(true);
            int i5 = this.f54829w.f54768e;
            if (i5 == 3 || i5 == 2) {
                sVar.c(2);
            }
        } catch (Throwable th2) {
            o1Var.b(true);
            throw th2;
        }
    }

    public final void K(o1 o1Var) {
        Looper looper = o1Var.f54944f;
        if (!looper.getThread().isAlive()) {
            wf.a.D("TAG", "Trying to send message on a dead thread.");
            o1Var.b(false);
        } else {
            wf.s sVarA = this.f54822p.a(looper, null);
            sVarA.f94370a.post(new aa.x(this, o1Var));
        }
    }

    public final void M(boolean z11, AtomicBoolean atomicBoolean) {
        if (this.F != z11) {
            this.F = z11;
            if (!z11) {
                for (c cVar : this.f54809a) {
                    if (!q(cVar) && this.f54810b.remove(cVar)) {
                        cVar.v();
                    }
                }
            }
        }
        if (atomicBoolean != null) {
            synchronized (this) {
                atomicBoolean.set(true);
                notifyAll();
            }
        }
    }

    public final void N(d0 d0Var) throws Throwable {
        this.f54830x.a(1);
        int i5 = d0Var.f54738c;
        gf.v0 v0Var = d0Var.f54737b;
        ArrayList arrayList = d0Var.f54736a;
        if (i5 != -1) {
            this.J = new g0(new p1(arrayList, v0Var), d0Var.f54738c, d0Var.f54739d);
        }
        bk.l lVar = this.f54825s;
        ArrayList arrayList2 = (ArrayList) lVar.f18018c;
        lVar.i(0, arrayList2.size());
        l(lVar.a(arrayList2.size(), arrayList, v0Var), false);
    }

    public final void O(boolean z11) {
        if (z11 == this.H) {
            return;
        }
        this.H = z11;
        if (z11 || !this.f54829w.o) {
            return;
        }
        this.f54816h.c(2);
    }

    public final void P(boolean z11) throws ExoPlaybackException {
        this.f54832z = z11;
        B();
        if (this.A) {
            z0 z0Var = this.f54824r;
            if (z0Var.f55122i != z0Var.f55121h) {
                G(true);
                k(false);
            }
        }
    }

    public final void Q(int i5, int i11, boolean z11, boolean z12) {
        this.f54830x.a(z12 ? 1 : 0);
        e0 e0Var = this.f54830x;
        e0Var.f54745a = true;
        e0Var.f54750f = true;
        e0Var.f54751g = i11;
        this.f54829w = this.f54829w.c(i5, z11);
        this.B = false;
        for (x0 x0Var = this.f54824r.f55121h; x0Var != null; x0Var = x0Var.f55073l) {
            for (tf.q qVar : x0Var.n.f89179c) {
                if (qVar != null) {
                    qVar.g(z11);
                }
            }
        }
        if (!W()) {
            a0();
            d0();
            return;
        }
        int i12 = this.f54829w.f54768e;
        wf.s sVar = this.f54816h;
        if (i12 == 3) {
            Y();
            sVar.c(2);
        } else if (i12 == 2) {
            sVar.c(2);
        }
    }

    public final void R(g1 g1Var) {
        i iVar = this.n;
        iVar.a(g1Var);
        g1 g1VarC = iVar.c();
        n(g1VarC, g1VarC.f54797a, true, true);
    }

    public final void S(int i5) throws ExoPlaybackException {
        this.D = i5;
        z1 z1Var = this.f54829w.f54764a;
        z0 z0Var = this.f54824r;
        z0Var.f55119f = i5;
        if (!z0Var.n(z1Var)) {
            G(true);
        }
        k(false);
    }

    public final void T(boolean z11) throws ExoPlaybackException {
        this.E = z11;
        z1 z1Var = this.f54829w.f54764a;
        z0 z0Var = this.f54824r;
        z0Var.f55120g = z11;
        if (!z0Var.n(z1Var)) {
            G(true);
        }
        k(false);
    }

    public final void U(gf.v0 v0Var) throws Throwable {
        this.f54830x.a(1);
        bk.l lVar = this.f54825s;
        int size = ((ArrayList) lVar.f18018c).size();
        if (v0Var.f57646b.length != size) {
            v0Var = new gf.v0(new Random(v0Var.f57645a.nextLong())).a(size);
        }
        lVar.f18026k = v0Var;
        l(lVar.c(), false);
    }

    public final void V(int i5) {
        f1 f1Var = this.f54829w;
        if (f1Var.f54768e != i5) {
            if (i5 != 2) {
                this.O = -9223372036854775807L;
            }
            this.f54829w = f1Var.f(i5);
        }
    }

    public final boolean W() {
        f1 f1Var = this.f54829w;
        return f1Var.f54775l && f1Var.f54776m == 0;
    }

    public final boolean X(z1 z1Var, gf.w wVar) {
        if (wVar.a() || z1Var.p()) {
            return false;
        }
        int i5 = z1Var.g(wVar.f57640a, this.f54820l).f55077c;
        y1 y1Var = this.f54819k;
        z1Var.n(i5, y1Var);
        return y1Var.a() && y1Var.f55105h && y1Var.f55102e != -9223372036854775807L;
    }

    public final void Y() {
        this.B = false;
        i iVar = this.n;
        iVar.f54839f = true;
        iVar.f54834a.e();
        for (c cVar : this.f54809a) {
            if (q(cVar)) {
                wf.a.i(cVar.f54725f == 1);
                cVar.f54725f = 2;
                cVar.p();
            }
        }
    }

    public final void Z(boolean z11, boolean z12) {
        A(z11 || !this.F, false, true, false);
        this.f54830x.a(z12 ? 1 : 0);
        this.f54814f.b(true);
        V(1);
    }

    @Override // gf.s
    public final void a(gf.u0 u0Var) {
        this.f54816h.a(9, (gf.t) u0Var).b();
    }

    public final void a0() {
        int i5;
        i iVar = this.n;
        iVar.f54839f = false;
        ai.w0 w0Var = iVar.f54834a;
        if (w0Var.f13388c) {
            w0Var.b(w0Var.d());
            w0Var.f13388c = false;
        }
        for (c cVar : this.f54809a) {
            if (q(cVar) && (i5 = cVar.f54725f) == 2) {
                wf.a.i(i5 == 2);
                cVar.f54725f = 1;
                cVar.q();
            }
        }
    }

    @Override // gf.s
    public final void b(gf.t tVar) {
        this.f54816h.a(8, tVar).b();
    }

    /* JADX WARN: Type inference failed for: r1v7, types: [gf.u0, java.lang.Object] */
    public final void b0() {
        x0 x0Var = this.f54824r.f55123j;
        boolean z11 = this.C || (x0Var != null && x0Var.f55062a.c());
        f1 f1Var = this.f54829w;
        if (z11 != f1Var.f54770g) {
            this.f54829w = new f1(f1Var.f54764a, f1Var.f54765b, f1Var.f54766c, f1Var.f54767d, f1Var.f54768e, f1Var.f54769f, z11, f1Var.f54771h, f1Var.f54772i, f1Var.f54773j, f1Var.f54774k, f1Var.f54775l, f1Var.f54776m, f1Var.n, f1Var.f54777p, f1Var.f54778q, f1Var.f54779r, f1Var.o);
        }
    }

    public final void c(d0 d0Var, int i5) throws Throwable {
        this.f54830x.a(1);
        bk.l lVar = this.f54825s;
        if (i5 == -1) {
            i5 = ((ArrayList) lVar.f18018c).size();
        }
        l(lVar.a(i5, d0Var.f54736a, d0Var.f54737b), false);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public final void c0(tf.v vVar) {
        tf.q[] qVarArr = vVar.f89179c;
        h hVar = this.f54814f;
        int iMax = hVar.f54805f;
        if (iMax == -1) {
            int i5 = 0;
            int i11 = 0;
            while (true) {
                c[] cVarArr = this.f54809a;
                int i12 = 13107200;
                if (i5 < cVarArr.length) {
                    if (qVarArr[i5] != null) {
                        switch (cVarArr[i5].f54720a) {
                            case 0:
                                i12 = 144310272;
                                i11 += i12;
                                break;
                            case 1:
                                i11 += i12;
                                break;
                            case 2:
                                i12 = 131072000;
                                i11 += i12;
                                break;
                            case 3:
                            case 4:
                            case 5:
                            case 6:
                                i12 = 131072;
                                i11 += i12;
                                break;
                            default:
                                throw new IllegalArgumentException();
                        }
                    }
                    i5++;
                } else {
                    iMax = Math.max(13107200, i11);
                }
            }
        }
        hVar.f54807h = iMax;
        hVar.f54800a.a(iMax);
    }

    public final void d(c cVar) {
        if (q(cVar)) {
            i iVar = this.n;
            if (cVar == iVar.f54836c) {
                iVar.f54837d = null;
                iVar.f54836c = null;
                iVar.f54838e = true;
            }
            int i5 = cVar.f54725f;
            if (i5 == 2) {
                wf.a.i(i5 == 2);
                cVar.f54725f = 1;
                cVar.q();
            }
            wf.a.i(cVar.f54725f == 1);
            cVar.f54721b.h();
            cVar.f54725f = 0;
            cVar.f54726g = null;
            cVar.f54727h = null;
            cVar.f54730k = false;
            cVar.l();
            this.I--;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00a6  */
    /* JADX WARN: Type inference failed for: r18v0 */
    /* JADX WARN: Type inference failed for: r18v1 */
    /* JADX WARN: Type inference failed for: r18v2 */
    /* JADX WARN: Type inference failed for: r2v25, types: [gf.t, java.lang.Object] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void d0() {
        g1 g1VarC;
        long j11;
        int i5;
        ?? r18;
        long jMax;
        x0 x0Var = this.f54824r.f55121h;
        if (x0Var == null) {
            return;
        }
        long jI = x0Var.f55065d ? x0Var.f55062a.i() : -9223372036854775807L;
        if (jI != -9223372036854775807L) {
            C(jI);
            if (jI != this.f54829w.f54779r) {
                f1 f1Var = this.f54829w;
                this.f54829w = o(f1Var.f54765b, jI, f1Var.f54766c, jI, true, 5);
            }
        } else {
            i iVar = this.n;
            boolean z11 = x0Var != this.f54824r.f55122i;
            ai.w0 w0Var = iVar.f54834a;
            c cVar = iVar.f54836c;
            if (cVar == null || cVar.j() || (!iVar.f54836c.k() && (z11 || iVar.f54836c.i()))) {
                iVar.f54838e = true;
                if (iVar.f54839f) {
                    w0Var.e();
                }
            } else {
                wf.i iVar2 = iVar.f54837d;
                iVar2.getClass();
                long jD = iVar2.d();
                if (!iVar.f54838e) {
                    w0Var.b(jD);
                    g1VarC = iVar2.c();
                    if (!g1VarC.equals((g1) w0Var.f13390e)) {
                        w0Var.a(g1VarC);
                        iVar.f54835b.f54816h.a(16, g1VarC).b();
                    }
                } else if (jD >= w0Var.d()) {
                    iVar.f54838e = false;
                    if (iVar.f54839f) {
                        w0Var.e();
                    }
                    w0Var.b(jD);
                    g1VarC = iVar2.c();
                    if (!g1VarC.equals((g1) w0Var.f13390e)) {
                    }
                } else if (w0Var.f13388c) {
                    w0Var.b(w0Var.d());
                    w0Var.f13388c = false;
                }
            }
            long jD2 = iVar.d();
            this.K = jD2;
            long j12 = jD2 - x0Var.o;
            long j13 = this.f54829w.f54779r;
            if (!this.o.isEmpty() && !this.f54829w.f54765b.a()) {
                if (this.M) {
                    this.M = false;
                }
                f1 f1Var2 = this.f54829w;
                f1Var2.f54764a.b(f1Var2.f54765b.f57640a);
                int iMin = Math.min(this.L, this.o.size());
                if (iMin > 0 && this.o.get(iMin - 1) != null) {
                    throw new ClassCastException();
                }
                if (iMin < this.o.size() && this.o.get(iMin) != null) {
                    throw new ClassCastException();
                }
                this.L = iMin;
            }
            this.f54829w.f54779r = j12;
        }
        this.f54829w.f54777p = this.f54824r.f55123j.d();
        f1 f1Var3 = this.f54829w;
        long j14 = f1Var3.f54777p;
        x0 x0Var2 = this.f54824r.f55123j;
        f1Var3.f54778q = x0Var2 == null ? 0L : Math.max(0L, j14 - (this.K - x0Var2.o));
        f1 f1Var4 = this.f54829w;
        if (f1Var4.f54775l && f1Var4.f54768e == 3 && X(f1Var4.f54764a, f1Var4.f54765b)) {
            f1 f1Var5 = this.f54829w;
            float f11 = 1.0f;
            if (f1Var5.n.f54797a == 1.0f) {
                g gVar = this.f54826t;
                long jG = g(f1Var5.f54764a, f1Var5.f54765b.f57640a, f1Var5.f54779r);
                long j15 = this.f54829w.f54777p;
                x0 x0Var3 = this.f54824r.f55123j;
                if (x0Var3 == null) {
                    j11 = -9223372036854775807L;
                    i5 = 1;
                    r18 = 0;
                    jMax = 0;
                } else {
                    j11 = -9223372036854775807L;
                    i5 = 1;
                    r18 = 0;
                    jMax = Math.max(0L, j15 - (this.K - x0Var3.o));
                }
                if (gVar.f54782c != j11) {
                    long j16 = jG - jMax;
                    long j17 = gVar.f54792m;
                    if (j17 == j11) {
                        gVar.f54792m = j16;
                        gVar.n = 0L;
                    } else {
                        gVar.f54792m = Math.max(j16, (long) ((j16 * 9.999871E-4f) + (j17 * 0.999f)));
                        gVar.n = (long) ((9.999871E-4f * Math.abs(j16 - r13)) + (0.999f * gVar.n));
                    }
                    if (gVar.f54791l == j11 || SystemClock.elapsedRealtime() - gVar.f54791l >= 1000) {
                        gVar.f54791l = SystemClock.elapsedRealtime();
                        long j18 = (gVar.n * 3) + gVar.f54792m;
                        if (gVar.f54787h > j18) {
                            float fY = wf.v.y(1000L);
                            long j19 = ((long) ((gVar.f54790k - 1.0f) * fY)) + ((long) ((gVar.f54788i - 1.0f) * fY));
                            long j21 = gVar.f54784e;
                            long j22 = gVar.f54787h - j19;
                            long[] jArr = new long[3];
                            jArr[r18] = j18;
                            jArr[i5] = j21;
                            jArr[2] = j22;
                            long j23 = jArr[r18];
                            for (int i11 = i5; i11 < 3; i11++) {
                                long j24 = jArr[i11];
                                if (j24 > j23) {
                                    j23 = j24;
                                }
                            }
                            gVar.f54787h = j23;
                        } else {
                            long jI2 = wf.v.i(jG - ((long) (Math.max(0.0f, gVar.f54790k - 1.0f) / 1.0E-7f)), gVar.f54787h, j18);
                            gVar.f54787h = jI2;
                            long j25 = gVar.f54786g;
                            if (j25 != j11 && jI2 > j25) {
                                gVar.f54787h = j25;
                            }
                        }
                        long j26 = jG - gVar.f54787h;
                        if (Math.abs(j26) < gVar.f54780a) {
                            gVar.f54790k = 1.0f;
                        } else {
                            gVar.f54790k = wf.v.g((1.0E-7f * j26) + 1.0f, gVar.f54789j, gVar.f54788i);
                        }
                        f11 = gVar.f54790k;
                    } else {
                        f11 = gVar.f54790k;
                    }
                }
                if (this.n.c().f54797a != f11) {
                    this.n.a(new g1(f11, this.f54829w.n.f54798b));
                    boolean z12 = r18;
                    n(this.f54829w.n, this.n.c().f54797a, z12, z12);
                }
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:215:0x0364  */
    /* JADX WARN: Removed duplicated region for block: B:287:0x0481  */
    /* JADX WARN: Removed duplicated region for block: B:289:0x0488  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:356:0x056e  */
    /* JADX WARN: Removed duplicated region for block: B:367:0x0592  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:388:0x05d5  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:404:0x060f  */
    /* JADX WARN: Removed duplicated region for block: B:406:0x0612  */
    /* JADX WARN: Removed duplicated region for block: B:407:0x061a  */
    /* JADX WARN: Removed duplicated region for block: B:417:0x0652  */
    /* JADX WARN: Removed duplicated region for block: B:424:0x065f  */
    /* JADX WARN: Removed duplicated region for block: B:427:0x0666  */
    /* JADX WARN: Removed duplicated region for block: B:429:0x06b9  */
    /* JADX WARN: Removed duplicated region for block: B:444:0x06e1  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x013b  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0143  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x014d  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0158 A[EDGE_INSN: B:479:0x0158->B:62:0x0158 BREAK  A[LOOP:7: B:72:0x0170->B:89:0x01a3], EDGE_INSN: B:480:0x0158->B:62:0x0158 BREAK  A[LOOP:7: B:72:0x0170->B:89:0x01a3], EDGE_INSN: B:481:0x0158->B:62:0x0158 BREAK  A[LOOP:7: B:72:0x0170->B:89:0x01a3], EDGE_INSN: B:482:0x0158->B:62:0x0158 BREAK  A[LOOP:7: B:72:0x0170->B:89:0x01a3]] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x015d  */
    /* JADX WARN: Type inference failed for: r0v58, types: [tf.v] */
    /* JADX WARN: Type inference failed for: r10v11 */
    /* JADX WARN: Type inference failed for: r10v12, types: [int] */
    /* JADX WARN: Type inference failed for: r10v14 */
    /* JADX WARN: Type inference failed for: r2v2, types: [gf.t, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r2v72, types: [gf.t, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r3v24 */
    /* JADX WARN: Type inference failed for: r3v25 */
    /* JADX WARN: Type inference failed for: r3v42, types: [gf.t, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r3v86, types: [gf.u0, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r3v90 */
    /* JADX WARN: Type inference failed for: r4v66, types: [int] */
    /* JADX WARN: Type inference failed for: r4v73 */
    /* JADX WARN: Type inference failed for: r4v74 */
    /* JADX WARN: Type inference failed for: r5v11, types: [gf.t, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r6v22, types: [gf.u0, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r6v52, types: [gf.u0, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r7v37, types: [tf.q[]] */
    /* JADX WARN: Type inference failed for: r7v38, types: [tf.q] */
    /* JADX WARN: Type inference failed for: r8v26 */
    /* JADX WARN: Type inference failed for: r8v27, types: [int] */
    /* JADX WARN: Type inference failed for: r8v29 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void e() throws ExoPlaybackException {
        long j11;
        boolean z11;
        boolean z12;
        long j12;
        long j13;
        boolean z13;
        boolean z14;
        long j14;
        boolean z15;
        f1 f1Var;
        long j15;
        boolean zR;
        long j16;
        long jMax;
        int i5;
        boolean z16;
        boolean z17;
        f1 f1Var2;
        boolean z18;
        boolean z19;
        int i11;
        gf.t0 t0Var;
        int i12;
        boolean z21;
        x0 x0Var;
        x0 x0Var2;
        long j17;
        y0 y0VarC;
        boolean z22;
        bk.l lVar;
        long j18;
        x0 x0Var3;
        x0 x0Var4;
        x0 x0Var5;
        boolean z23;
        c[] cVarArr;
        this.f54822p.getClass();
        long jUptimeMillis = SystemClock.uptimeMillis();
        this.f54816h.f94370a.removeMessages(2);
        if (this.f54829w.f54764a.p() || !this.f54825s.f18016a) {
            j11 = Long.MIN_VALUE;
            z11 = true;
            z12 = false;
        } else {
            z0 z0Var = this.f54824r;
            long j19 = this.K;
            x0 x0Var6 = z0Var.f55123j;
            if (x0Var6 == null) {
                z21 = true;
                z0 z0Var2 = this.f54824r;
                x0Var = z0Var2.f55123j;
                if (x0Var != null || (!x0Var.f55067f.f55094i && x0Var.f55065d && ((!x0Var.f55066e || x0Var.f55062a.t() == Long.MIN_VALUE) && z0Var2.f55123j.f55067f.f55090e != -9223372036854775807L && z0Var2.f55124k < 100))) {
                    z0 z0Var3 = this.f54824r;
                    long j21 = this.K;
                    f1 f1Var3 = this.f54829w;
                    x0Var2 = z0Var3.f55123j;
                    if (x0Var2 != null) {
                        j17 = -9223372036854775807L;
                        y0VarC = z0Var3.d(f1Var3.f54764a, f1Var3.f54765b, f1Var3.f54766c, f1Var3.f54779r);
                    } else {
                        j17 = -9223372036854775807L;
                        y0VarC = z0Var3.c(f1Var3.f54764a, x0Var2, j21);
                    }
                    if (y0VarC == null) {
                        z0 z0Var4 = this.f54824r;
                        c[] cVarArr2 = this.f54811c;
                        c3.b bVar = this.f54812d;
                        vf.m mVar = this.f54814f.f54800a;
                        bk.l lVar2 = this.f54825s;
                        tf.v vVar = this.f54813e;
                        z22 = z21;
                        x0 x0Var7 = z0Var4.f55123j;
                        if (x0Var7 == null) {
                            lVar = lVar2;
                            j18 = 1000000000000L;
                            j11 = Long.MIN_VALUE;
                        } else {
                            j11 = Long.MIN_VALUE;
                            lVar = lVar2;
                            j18 = (x0Var7.o + x0Var7.f55067f.f55090e) - y0VarC.f55087b;
                        }
                        x0 x0Var8 = new x0(cVarArr2, j18, bVar, mVar, lVar, y0VarC, vVar);
                        x0 x0Var9 = z0Var4.f55123j;
                        if (x0Var9 == null) {
                            z0Var4.f55121h = x0Var8;
                            z0Var4.f55122i = x0Var8;
                        } else if (x0Var8 != x0Var9.f55073l) {
                            x0Var9.b();
                            x0Var9.f55073l = x0Var8;
                            x0Var9.c();
                        }
                        z0Var4.f55125l = null;
                        z0Var4.f55123j = x0Var8;
                        z0Var4.f55124k++;
                        z0Var4.j();
                        x0Var8.f55062a.r(this, y0VarC.f55087b);
                        if (this.f54824r.f55121h == x0Var8) {
                            C(y0VarC.f55087b);
                        }
                        k(false);
                        if (this.C) {
                            s();
                        } else {
                            this.C = p();
                            b0();
                        }
                        c[] cVarArr3 = this.f54809a;
                        z0 z0Var5 = this.f54824r;
                        x0Var3 = z0Var5.f55122i;
                        if (x0Var3 != null) {
                            if (x0Var3.f55073l == null || this.A) {
                                z12 = false;
                                z11 = z22;
                                if (x0Var3.f55067f.f55094i || this.A) {
                                    for (int i13 = 0; i13 < cVarArr3.length; i13++) {
                                        c cVar = cVarArr3[i13];
                                        gf.t0 t0Var2 = x0Var3.f55064c[i13];
                                        if (t0Var2 != null && cVar.f54726g == t0Var2 && cVar.i()) {
                                            long j22 = x0Var3.f55067f.f55090e;
                                            L(cVar, (j22 == j17 || j22 == j11) ? j17 : x0Var3.o + j22);
                                        }
                                    }
                                }
                            } else if (x0Var3.f55065d) {
                                int i14 = 0;
                                while (true) {
                                    if (i14 < cVarArr3.length) {
                                        c cVar2 = cVarArr3[i14];
                                        gf.t0 t0Var3 = x0Var3.f55064c[i14];
                                        if (cVar2.f54726g != t0Var3) {
                                            break;
                                        }
                                        if (t0Var3 != null && !cVar2.i()) {
                                            x0 x0Var10 = x0Var3.f55073l;
                                            if (!x0Var3.f55067f.f55091f || !x0Var10.f55065d || (!(cVar2 instanceof jf.j) && !(cVar2 instanceof com.google.android.exoplayer2.metadata.a) && cVar2.f54729j < x0Var10.e())) {
                                                break;
                                            }
                                        }
                                        i14++;
                                    } else {
                                        x0 x0Var11 = x0Var3.f55073l;
                                        if (x0Var11.f55065d || this.K >= x0Var11.e()) {
                                            tf.v vVar2 = x0Var3.n;
                                            x0 x0Var12 = z0Var5.f55122i;
                                            wf.a.i((x0Var12 == null || x0Var12.f55073l == null) ? false : z22);
                                            z0Var5.f55122i = z0Var5.f55122i.f55073l;
                                            z0Var5.j();
                                            x0 x0Var13 = z0Var5.f55122i;
                                            tf.v vVar3 = x0Var13.n;
                                            z1 z1Var = this.f54829w.f54764a;
                                            z12 = false;
                                            z11 = z22;
                                            e0(z1Var, x0Var13.f55067f.f55086a, z1Var, x0Var3.f55067f.f55086a, -9223372036854775807L);
                                            if (!x0Var13.f55065d || x0Var13.f55062a.i() == j17) {
                                                for (int i15 = 0; i15 < cVarArr3.length; i15++) {
                                                    boolean zB = vVar2.b(i15);
                                                    boolean zB2 = vVar3.b(i15);
                                                    if (zB && !cVarArr3[i15].f54730k) {
                                                        boolean z24 = this.f54811c[i15].f54720a == -2 ? z11 : false;
                                                        r1 r1Var = vVar2.f89178b[i15];
                                                        r1 r1Var2 = vVar3.f89178b[i15];
                                                        if (!zB2 || !r1Var2.equals(r1Var) || z24) {
                                                            L(cVarArr3[i15], x0Var13.e());
                                                        }
                                                    }
                                                }
                                            } else {
                                                long jE = x0Var13.e();
                                                for (c cVar3 : cVarArr3) {
                                                    if (cVar3.f54726g != null) {
                                                        L(cVar3, jE);
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                z12 = false;
                                z11 = z22;
                            } else {
                                z12 = false;
                                z11 = z22;
                            }
                            z0 z0Var6 = this.f54824r;
                            x0 x0Var14 = z0Var6.f55122i;
                            if (x0Var14 != null && z0Var6.f55121h != x0Var14 && !x0Var14.f55068g) {
                                ?? r02 = x0Var14.n;
                                gf.t0[] t0VarArr = x0Var14.f55064c;
                                boolean z25 = z12;
                                boolean z26 = z25;
                                ?? r42 = z25;
                                while (true) {
                                    cVarArr = this.f54809a;
                                    if (r42 >= cVarArr.length) {
                                        break;
                                    }
                                    c cVar4 = cVarArr[r42];
                                    if (q(cVar4)) {
                                        boolean z27 = cVar4.f54726g != t0VarArr[r42] ? z11 : z12;
                                        if (!r02.b(r42) || z27) {
                                            if (!cVar4.f54730k) {
                                                ?? r72 = r02.f89179c[r42];
                                                int length = r72 != 0 ? r72.length() : z12;
                                                k0[] k0VarArr = new k0[length];
                                                for (?? r102 = z12; r102 < length; r102++) {
                                                    k0VarArr[r102] = r72.getFormat(r102);
                                                }
                                                cVar4.u(k0VarArr, t0VarArr[r42], x0Var14.e(), x0Var14.o);
                                            } else if (cVar4.j()) {
                                                d(cVar4);
                                            } else {
                                                z26 = z11;
                                            }
                                        }
                                    }
                                    r42++;
                                }
                                if (!z26) {
                                    f(new boolean[cVarArr.length]);
                                }
                            }
                            z0 z0Var7 = this.f54824r;
                            boolean z28 = z12;
                            while (W() && !this.A && (x0Var4 = z0Var7.f55121h) != null && (x0Var5 = x0Var4.f55073l) != null && this.K >= x0Var5.e() && x0Var5.f55068g) {
                                if (z28) {
                                    t();
                                }
                                x0 x0VarA = z0Var7.a();
                                x0VarA.getClass();
                                if (this.f54829w.f54765b.f57640a.equals(x0VarA.f55067f.f55086a.f57640a)) {
                                    gf.w wVar = this.f54829w.f54765b;
                                    if (wVar.f57641b == -1) {
                                        gf.w wVar2 = x0VarA.f55067f.f55086a;
                                        z23 = (wVar2.f57641b != -1 || wVar.f57644e == wVar2.f57644e) ? z12 : z11;
                                    }
                                }
                                y0 y0Var = x0VarA.f55067f;
                                gf.w wVar3 = y0Var.f55086a;
                                boolean z29 = z23;
                                long j23 = y0Var.f55087b;
                                this.f54829w = o(wVar3, j23, y0Var.f55088c, j23, !z29, 0);
                                B();
                                d0();
                                z28 = z11;
                            }
                        }
                    } else {
                        z22 = z21;
                    }
                } else {
                    z22 = z21;
                    j17 = -9223372036854775807L;
                }
                j11 = Long.MIN_VALUE;
                if (this.C) {
                }
                c[] cVarArr32 = this.f54809a;
                z0 z0Var52 = this.f54824r;
                x0Var3 = z0Var52.f55122i;
                if (x0Var3 != null) {
                }
            } else {
                wf.a.i(x0Var6.f55073l == null);
                if (x0Var6.f55065d) {
                    z21 = true;
                    x0Var6.f55062a.v(j19 - x0Var6.o);
                }
                z0 z0Var22 = this.f54824r;
                x0Var = z0Var22.f55123j;
                if (x0Var != null) {
                    z0 z0Var32 = this.f54824r;
                    long j212 = this.K;
                    f1 f1Var32 = this.f54829w;
                    x0Var2 = z0Var32.f55123j;
                    if (x0Var2 != null) {
                    }
                    if (y0VarC == null) {
                    }
                }
            }
        }
        int i16 = this.f54829w.f54768e;
        if (i16 == z11 || i16 == 4) {
            return;
        }
        x0 x0Var15 = this.f54824r.f55121h;
        if (x0Var15 == null) {
            this.f54816h.f94370a.sendEmptyMessageAtTime(2, jUptimeMillis + 10);
            return;
        }
        wf.a.b("doSomeWork");
        d0();
        if (x0Var15.f55065d) {
            long jElapsedRealtime = SystemClock.elapsedRealtime() * 1000;
            j12 = 10;
            j13 = 1000;
            x0Var15.f55062a.m(this.f54829w.f54779r - this.f54821m);
            ?? r32 = z12;
            boolean z31 = z11;
            z14 = z31;
            while (true) {
                c[] cVarArr4 = this.f54809a;
                if (r32 >= cVarArr4.length) {
                    break;
                }
                c cVar5 = cVarArr4[r32];
                if (q(cVar5)) {
                    i12 = r32;
                    cVar5.t(this.K, jElapsedRealtime);
                    boolean z32 = (z31 && cVar5.j()) ? z11 : z12;
                    boolean z33 = x0Var15.f55064c[i12] != cVar5.f54726g ? z11 : z12;
                    boolean z34 = (z33 || ((z33 || !cVar5.i()) ? z12 : z11) || cVar5.k() || cVar5.j()) ? z11 : z12;
                    boolean z35 = (z14 && z34) ? z11 : z12;
                    if (!z34) {
                        gf.t0 t0Var4 = cVar5.f54726g;
                        t0Var4.getClass();
                        t0Var4.c();
                    }
                    z14 = z35;
                    z31 = z32;
                } else {
                    i12 = r32;
                }
                r32 = i12 + 1;
            }
            z13 = z31;
        } else {
            j12 = 10;
            j13 = 1000;
            x0Var15.f55062a.l();
            z13 = z11;
            z14 = z13;
        }
        long j24 = x0Var15.f55067f.f55090e;
        if (z13 && x0Var15.f55065d) {
            j14 = -9223372036854775807L;
            if (j24 == -9223372036854775807L || j24 <= this.f54829w.f54779r) {
                z15 = z11;
            }
            if (z15 && this.A) {
                this.A = z12;
                Q(this.f54829w.f54776m, 5, z12, z12);
            }
            if (z15 || !x0Var15.f55067f.f55094i) {
                f1Var = this.f54829w;
                if (f1Var.f54768e != 2) {
                    z0 z0Var8 = this.f54824r;
                    if (this.I == 0) {
                        j15 = j14;
                        zR = r();
                    } else if (!z14) {
                        j15 = j14;
                        zR = z12;
                    } else if (f1Var.f54770g) {
                        long j25 = X(f1Var.f54764a, z0Var8.f55121h.f55067f.f55086a) ? this.f54826t.f54787h : j14;
                        x0 x0Var16 = z0Var8.f55123j;
                        boolean z36 = (!x0Var16.f55065d || (x0Var16.f55066e && x0Var16.f55062a.t() != j11) || !x0Var16.f55067f.f55094i) ? z12 : z11;
                        boolean z37 = (!x0Var16.f55067f.f55086a.a() || x0Var16.f55065d) ? z12 : z11;
                        if (z36 || z37) {
                            j15 = j14;
                        } else {
                            h hVar = this.f54814f;
                            long j26 = this.f54829w.f54777p;
                            x0 x0Var17 = this.f54824r.f55123j;
                            j15 = j14;
                            if (x0Var17 == null) {
                                jMax = 0;
                                j16 = j25;
                            } else {
                                j16 = j25;
                                jMax = Math.max(0L, j26 - (this.K - x0Var17.o));
                            }
                            float f11 = this.n.c().f54797a;
                            boolean z38 = this.B;
                            hVar.getClass();
                            if (f11 != 1.0f) {
                                jMax = Math.round(jMax / f11);
                            }
                            long jMin = z38 ? hVar.f54804e : hVar.f54803d;
                            if (j16 != j15) {
                                jMin = Math.min(j16 / 2, jMin);
                            }
                            if (jMin > 0 && jMax < jMin) {
                                vf.m mVar2 = hVar.f54800a;
                                synchronized (mVar2) {
                                    i5 = mVar2.f92701d * mVar2.f92699b;
                                }
                                if (i5 < hVar.f54807h) {
                                    zR = false;
                                }
                            }
                        }
                        zR = true;
                    } else {
                        j15 = j14;
                        zR = z11;
                    }
                    if (zR) {
                        V(3);
                        this.N = null;
                        if (W()) {
                            Y();
                        }
                    }
                } else {
                    j15 = j14;
                }
                if (this.f54829w.f54768e == 3 && (this.I != 0 ? !z14 : !r())) {
                    this.B = W();
                    V(2);
                    if (this.B) {
                        for (x0 x0Var18 = this.f54824r.f55121h; x0Var18 != null; x0Var18 = x0Var18.f55073l) {
                            for (tf.q qVar : x0Var18.n.f89179c) {
                                if (qVar != null) {
                                    qVar.j();
                                }
                            }
                        }
                        g gVar = this.f54826t;
                        long j27 = gVar.f54787h;
                        if (j27 != j15) {
                            long j28 = j27 + gVar.f54781b;
                            gVar.f54787h = j28;
                            long j29 = gVar.f54786g;
                            if (j29 != j15 && j28 > j29) {
                                gVar.f54787h = j29;
                            }
                            gVar.f54791l = j15;
                        }
                    }
                    a0();
                }
            } else {
                V(4);
                a0();
            }
            if (this.f54829w.f54768e != 2) {
                int i17 = 0;
                while (true) {
                    c[] cVarArr5 = this.f54809a;
                    if (i17 >= cVarArr5.length) {
                        break;
                    }
                    if (q(cVarArr5[i17]) && (t0Var = this.f54809a[i17].f54726g) == x0Var15.f55064c[i17]) {
                        t0Var.getClass();
                        t0Var.c();
                    }
                    i17++;
                }
                f1 f1Var4 = this.f54829w;
                z16 = !f1Var4.f54770g && f1Var4.f54778q < 500000 && p();
            }
            if (z16) {
                this.O = -9223372036854775807L;
            } else if (this.O == -9223372036854775807L) {
                this.f54822p.getClass();
                this.O = SystemClock.elapsedRealtime();
            } else {
                this.f54822p.getClass();
                if (SystemClock.elapsedRealtime() - this.O >= 4000) {
                    throw new IllegalStateException("Playback stuck buffering and not loading");
                }
            }
            boolean z39 = !W() && this.f54829w.f54768e == 3;
            z17 = !this.H && this.G && z39;
            f1Var2 = this.f54829w;
            if (f1Var2.o == z17) {
                z18 = z17;
                z19 = z39;
                this.f54829w = new f1(f1Var2.f54764a, f1Var2.f54765b, f1Var2.f54766c, f1Var2.f54767d, f1Var2.f54768e, f1Var2.f54769f, f1Var2.f54770g, f1Var2.f54771h, f1Var2.f54772i, f1Var2.f54773j, f1Var2.f54774k, f1Var2.f54775l, f1Var2.f54776m, f1Var2.n, f1Var2.f54777p, f1Var2.f54778q, f1Var2.f54779r, z18);
            } else {
                z18 = z17;
                z19 = z39;
            }
            this.G = false;
            if (!z18 && (i11 = this.f54829w.f54768e) != 4) {
                if (!z19 || i11 == 2) {
                    this.f54816h.f94370a.sendEmptyMessageAtTime(2, jUptimeMillis + j12);
                } else if (i11 == 3 && this.I != 0) {
                    this.f54816h.f94370a.sendEmptyMessageAtTime(2, jUptimeMillis + j13);
                }
            }
            wf.a.q();
        }
        j14 = -9223372036854775807L;
        z15 = z12;
        if (z15) {
            this.A = z12;
            Q(this.f54829w.f54776m, 5, z12, z12);
        }
        if (z15) {
            f1Var = this.f54829w;
            if (f1Var.f54768e != 2) {
            }
            if (this.f54829w.f54768e == 3) {
                this.B = W();
                V(2);
                if (this.B) {
                }
                a0();
            }
        }
        if (this.f54829w.f54768e != 2) {
        }
        if (z16) {
        }
        if (W()) {
        }
        if (this.H) {
        }
        f1Var2 = this.f54829w;
        if (f1Var2.o == z17) {
        }
        this.G = false;
        if (!z18) {
            if (z19) {
                this.f54816h.f94370a.sendEmptyMessageAtTime(2, jUptimeMillis + j12);
            }
        }
        wf.a.q();
    }

    public final void e0(z1 z1Var, gf.w wVar, z1 z1Var2, gf.w wVar2, long j11) {
        boolean zX = X(z1Var, wVar);
        Object obj = wVar.f57640a;
        if (!zX) {
            g1 g1Var = wVar.a() ? g1.f54796d : this.f54829w.n;
            i iVar = this.n;
            if (iVar.c().equals(g1Var)) {
                return;
            }
            iVar.a(g1Var);
            return;
        }
        x1 x1Var = this.f54820l;
        int i5 = z1Var.g(obj, x1Var).f55077c;
        y1 y1Var = this.f54819k;
        z1Var.n(i5, y1Var);
        q0 q0Var = y1Var.f55107j;
        int i11 = wf.v.f94376a;
        g gVar = this.f54826t;
        gVar.getClass();
        gVar.f54782c = wf.v.y(q0Var.f54965a);
        gVar.f54785f = wf.v.y(q0Var.f54966b);
        gVar.f54786g = wf.v.y(q0Var.f54967c);
        float f11 = q0Var.f54968d;
        if (f11 == -3.4028235E38f) {
            f11 = 0.97f;
        }
        gVar.f54789j = f11;
        float f12 = q0Var.f54969e;
        if (f12 == -3.4028235E38f) {
            f12 = 1.03f;
        }
        gVar.f54788i = f12;
        if (f11 == 1.0f && f12 == 1.0f) {
            gVar.f54782c = -9223372036854775807L;
        }
        gVar.a();
        if (j11 != -9223372036854775807L) {
            gVar.f54783d = g(z1Var, obj, j11);
            gVar.a();
            return;
        }
        if (wf.v.a(!z1Var2.p() ? z1Var2.m(z1Var2.g(wVar2.f57640a, x1Var).f55077c, y1Var, 0L).f55098a : null, y1Var.f55098a)) {
            return;
        }
        gVar.f54783d = -9223372036854775807L;
        gVar.a();
    }

    /* JADX WARN: Removed duplicated region for block: B:58:0x010e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void f(boolean[] zArr) throws ExoPlaybackException {
        c[] cVarArr;
        Set set;
        tf.v vVar;
        int i5;
        c[] cVarArr2;
        wf.i iVar;
        z0 z0Var = this.f54824r;
        x0 x0Var = z0Var.f55122i;
        tf.v vVar2 = x0Var.n;
        int i11 = 0;
        while (true) {
            cVarArr = this.f54809a;
            int length = cVarArr.length;
            set = this.f54810b;
            if (i11 >= length) {
                break;
            }
            if (!vVar2.b(i11) && set.remove(cVarArr[i11])) {
                cVarArr[i11].v();
            }
            i11++;
        }
        int i12 = 0;
        while (i12 < cVarArr.length) {
            if (vVar2.b(i12)) {
                boolean z11 = zArr[i12];
                c cVar = cVarArr[i12];
                if (q(cVar)) {
                    vVar = vVar2;
                    i5 = i12;
                    cVarArr2 = cVarArr;
                } else {
                    x0 x0Var2 = z0Var.f55122i;
                    boolean z12 = x0Var2 == z0Var.f55121h;
                    tf.v vVar3 = x0Var2.n;
                    r1 r1Var = vVar3.f89178b[i12];
                    tf.q qVar = vVar3.f89179c[i12];
                    int length2 = qVar != null ? qVar.length() : 0;
                    k0[] k0VarArr = new k0[length2];
                    for (int i13 = 0; i13 < length2; i13++) {
                        k0VarArr[i13] = qVar.getFormat(i13);
                    }
                    boolean z13 = W() && this.f54829w.f54768e == 3;
                    boolean z14 = !z11 && z13;
                    this.I++;
                    set.add(cVar);
                    gf.t0 t0Var = x0Var2.f55064c[i12];
                    vVar = vVar2;
                    long j11 = this.K;
                    long jE = x0Var2.e();
                    i5 = i12;
                    cVarArr2 = cVarArr;
                    long j12 = x0Var2.o;
                    wf.a.i(cVar.f54725f == 0);
                    cVar.f54722c = r1Var;
                    cVar.f54725f = 1;
                    cVar.m(z14, z12);
                    cVar.u(k0VarArr, t0Var, jE, j12);
                    cVar.f54730k = false;
                    cVar.f54729j = j11;
                    cVar.n(j11, z14);
                    cVar.b(11, new c0(this));
                    i iVar2 = this.n;
                    iVar2.getClass();
                    wf.i iVarG = cVar.g();
                    if (iVarG != null && iVarG != (iVar = iVar2.f54837d)) {
                        if (iVar != null) {
                            throw new ExoPlaybackException(2, new IllegalStateException("Multiple renderer media clocks enabled."), 1000);
                        }
                        iVar2.f54837d = iVarG;
                        iVar2.f54836c = cVar;
                        ((he.c0) iVarG).a((g1) iVar2.f54834a.f13390e);
                    }
                    if (z13) {
                        wf.a.i(cVar.f54725f == 1);
                        cVar.f54725f = 2;
                        cVar.p();
                    }
                }
            }
            i12 = i5 + 1;
            vVar2 = vVar;
            cVarArr = cVarArr2;
        }
        x0Var.f55068g = true;
    }

    public final synchronized void f0(b0 b0Var, long j11) {
        this.f54822p.getClass();
        long jElapsedRealtime = SystemClock.elapsedRealtime() + j11;
        boolean z11 = false;
        while (!((Boolean) b0Var.get()).booleanValue() && j11 > 0) {
            try {
                this.f54822p.getClass();
                wait(j11);
            } catch (InterruptedException unused) {
                z11 = true;
            }
            this.f54822p.getClass();
            j11 = jElapsedRealtime - SystemClock.elapsedRealtime();
        }
        if (z11) {
            Thread.currentThread().interrupt();
        }
    }

    public final long g(z1 z1Var, Object obj, long j11) {
        x1 x1Var = this.f54820l;
        int i5 = z1Var.g(obj, x1Var).f55077c;
        y1 y1Var = this.f54819k;
        z1Var.n(i5, y1Var);
        if (y1Var.f55102e == -9223372036854775807L || !y1Var.a() || !y1Var.f55105h) {
            return -9223372036854775807L;
        }
        long j12 = y1Var.f55103f;
        int i11 = wf.v.f94376a;
        return wf.v.y((j12 == -9223372036854775807L ? System.currentTimeMillis() : j12 + SystemClock.elapsedRealtime()) - y1Var.f55102e) - (j11 + x1Var.f55079e);
    }

    public final Pair h(z1 z1Var) {
        if (z1Var.p()) {
            return Pair.create(f1.f54763s, 0L);
        }
        Pair pairI = z1Var.i(this.f54819k, this.f54820l, z1Var.a(this.E), -9223372036854775807L);
        gf.w wVarM = this.f54824r.m(z1Var, pairI.first, 0L);
        long jLongValue = ((Long) pairI.second).longValue();
        if (wVarM.a()) {
            Object obj = wVarM.f57640a;
            x1 x1Var = this.f54820l;
            z1Var.g(obj, x1Var);
            jLongValue = wVarM.f57642c == x1Var.f(wVarM.f57641b) ? x1Var.f55081g.f59849b : 0L;
        }
        return Pair.create(wVarM, Long.valueOf(jLongValue));
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) throws Throwable {
        int i5;
        x0 x0Var;
        try {
            switch (message.what) {
                case 0:
                    w();
                    break;
                case 1:
                    Q(message.arg2, 1, message.arg1 != 0, true);
                    break;
                case 2:
                    e();
                    break;
                case 3:
                    H((g0) message.obj);
                    break;
                case 4:
                    R((g1) message.obj);
                    break;
                case 5:
                    this.f54828v = (s1) message.obj;
                    break;
                case 6:
                    Z(false, true);
                    break;
                case 7:
                    x();
                    return true;
                case 8:
                    m((gf.t) message.obj);
                    break;
                case 9:
                    i((gf.t) message.obj);
                    break;
                case 10:
                    z();
                    break;
                case 11:
                    S(message.arg1);
                    break;
                case 12:
                    T(message.arg1 != 0);
                    break;
                case 13:
                    M(message.arg1 != 0, (AtomicBoolean) message.obj);
                    break;
                case 14:
                    o1 o1Var = (o1) message.obj;
                    o1Var.getClass();
                    J(o1Var);
                    break;
                case 15:
                    K((o1) message.obj);
                    break;
                case 16:
                    g1 g1Var = (g1) message.obj;
                    n(g1Var, g1Var.f54797a, true, false);
                    break;
                case 17:
                    N((d0) message.obj);
                    break;
                case 18:
                    c((d0) message.obj, message.arg1);
                    break;
                case 19:
                    b.c0.y(message.obj);
                    v();
                    throw null;
                case 20:
                    y(message.arg1, message.arg2, (gf.v0) message.obj);
                    break;
                case 21:
                    U((gf.v0) message.obj);
                    break;
                case 22:
                    u();
                    break;
                case 23:
                    P(message.arg1 != 0);
                    break;
                case 24:
                    O(message.arg1 == 1);
                    break;
                case 25:
                    G(true);
                    break;
                default:
                    return false;
            }
        } catch (ExoPlaybackException e3) {
            e = e3;
            if (e.f31434c == 1 && (x0Var = this.f54824r.f55122i) != null) {
                e = e.a(x0Var.f55067f.f55086a);
            }
            if (e.f31440i && this.N == null) {
                wf.a.E("ExoPlayerImplInternal", "Recoverable renderer error", e);
                this.N = e;
                wf.s sVar = this.f54816h;
                wf.r rVarA = sVar.a(25, e);
                Handler handler = sVar.f94370a;
                Message message2 = rVarA.f94368a;
                message2.getClass();
                handler.sendMessageAtFrontOfQueue(message2);
                rVarA.a();
            } else {
                ExoPlaybackException exoPlaybackException = this.N;
                if (exoPlaybackException != null) {
                    exoPlaybackException.addSuppressed(e);
                    e = this.N;
                }
                wf.a.p("ExoPlayerImplInternal", "Playback error", e);
                Z(true, false);
                this.f54829w = this.f54829w.d(e);
            }
        } catch (ParserException e11) {
            boolean z11 = e11.f31441a;
            int i11 = e11.f31442b;
            if (i11 == 1) {
                i5 = z11 ? 3001 : Sdk.SDKMetric.SDKMetricType.BANNER_AUTO_REDIRECT_NOT_OVERRIDE_URL_VALUE;
            } else {
                if (i11 == 4) {
                    i5 = z11 ? 3002 : Sdk.SDKMetric.SDKMetricType.INLINE_INSTALL_STATUS_VALUE;
                }
                j(i, e11);
            }
            i = i5;
            j(i, e11);
        } catch (DrmSession$DrmSessionException e12) {
            j(e12.f31461a, e12);
        } catch (BehindLiveWindowException e13) {
            j(1002, e13);
        } catch (DataSourceException e14) {
            j(e14.f31594a, e14);
        } catch (IOException e15) {
            j(2000, e15);
        } catch (RuntimeException e16) {
            ExoPlaybackException exoPlaybackException2 = new ExoPlaybackException(2, e16, ((e16 instanceof IllegalStateException) || (e16 instanceof IllegalArgumentException)) ? 1004 : 1000);
            wf.a.p("ExoPlayerImplInternal", "Playback error", exoPlaybackException2);
            Z(true, false);
            this.f54829w = this.f54829w.d(exoPlaybackException2);
        }
        t();
        return true;
    }

    /* JADX WARN: Type inference failed for: r6v5, types: [gf.u0, java.lang.Object] */
    public final void i(gf.t tVar) {
        x0 x0Var = this.f54824r.f55123j;
        if (x0Var == null || x0Var.f55062a != tVar) {
            return;
        }
        long j11 = this.K;
        if (x0Var != null) {
            wf.a.i(x0Var.f55073l == null);
            if (x0Var.f55065d) {
                x0Var.f55062a.v(j11 - x0Var.o);
            }
        }
        s();
    }

    public final void j(int i5, IOException iOException) {
        ExoPlaybackException exoPlaybackException = new ExoPlaybackException(0, iOException, i5);
        x0 x0Var = this.f54824r.f55121h;
        if (x0Var != null) {
            exoPlaybackException = exoPlaybackException.a(x0Var.f55067f.f55086a);
        }
        wf.a.p("ExoPlayerImplInternal", "Playback error", exoPlaybackException);
        Z(false, false);
        this.f54829w = this.f54829w.d(exoPlaybackException);
    }

    public final void k(boolean z11) {
        x0 x0Var = this.f54824r.f55123j;
        gf.w wVar = x0Var == null ? this.f54829w.f54765b : x0Var.f55067f.f55086a;
        boolean zEquals = this.f54829w.f54774k.equals(wVar);
        if (!zEquals) {
            this.f54829w = this.f54829w.a(wVar);
        }
        f1 f1Var = this.f54829w;
        f1Var.f54777p = x0Var == null ? f1Var.f54779r : x0Var.d();
        f1 f1Var2 = this.f54829w;
        long j11 = f1Var2.f54777p;
        x0 x0Var2 = this.f54824r.f55123j;
        f1Var2.f54778q = x0Var2 != null ? Math.max(0L, j11 - (this.K - x0Var2.o)) : 0L;
        if ((!zEquals || z11) && x0Var != null && x0Var.f55065d) {
            c0(x0Var.n);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:102:0x020d  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x0215 A[PHI: r4
      0x0215: PHI (r4v29 long) = (r4v28 long), (r4v33 long) binds: [B:101:0x020b, B:104:0x0213] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:166:0x0300 A[Catch: all -> 0x0306, TRY_ENTER, TryCatch #2 {all -> 0x0306, blocks: (B:166:0x0300, B:179:0x031e, B:181:0x0328, B:183:0x032e, B:185:0x0338, B:186:0x0345), top: B:264:0x028b }] */
    /* JADX WARN: Removed duplicated region for block: B:201:0x036b  */
    /* JADX WARN: Removed duplicated region for block: B:202:0x036f  */
    /* JADX WARN: Removed duplicated region for block: B:205:0x0378  */
    /* JADX WARN: Removed duplicated region for block: B:209:0x0383  */
    /* JADX WARN: Removed duplicated region for block: B:217:0x03a2  */
    /* JADX WARN: Removed duplicated region for block: B:220:0x03ae  */
    /* JADX WARN: Removed duplicated region for block: B:222:0x03b4  */
    /* JADX WARN: Removed duplicated region for block: B:226:0x03d6  */
    /* JADX WARN: Removed duplicated region for block: B:233:0x03f1  */
    /* JADX WARN: Removed duplicated region for block: B:235:0x03f5  */
    /* JADX WARN: Removed duplicated region for block: B:238:0x03ff  */
    /* JADX WARN: Removed duplicated region for block: B:240:0x0407  */
    /* JADX WARN: Removed duplicated region for block: B:248:0x0426  */
    /* JADX WARN: Removed duplicated region for block: B:251:0x0432  */
    /* JADX WARN: Removed duplicated region for block: B:253:0x0439  */
    /* JADX WARN: Removed duplicated region for block: B:257:0x045b  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x01f1  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0206  */
    /* JADX WARN: Type inference failed for: r12v0 */
    /* JADX WARN: Type inference failed for: r12v14 */
    /* JADX WARN: Type inference failed for: r12v15 */
    /* JADX WARN: Type inference failed for: r12v16, types: [boolean] */
    /* JADX WARN: Type inference failed for: r12v17 */
    /* JADX WARN: Type inference failed for: r12v20 */
    /* JADX WARN: Type inference failed for: r12v5 */
    /* JADX WARN: Type inference failed for: r12v7 */
    /* JADX WARN: Type inference failed for: r12v8 */
    /* JADX WARN: Type inference failed for: r19v13, types: [gf.w] */
    /* JADX WARN: Type inference failed for: r2v53, types: [fe.z0] */
    /* JADX WARN: Type inference failed for: r39v0, types: [fe.h0] */
    /* JADX WARN: Type inference failed for: r5v23 */
    /* JADX WARN: Type inference failed for: r5v24 */
    /* JADX WARN: Type inference failed for: r5v25 */
    /* JADX WARN: Type inference failed for: r5v26 */
    /* JADX WARN: Type inference failed for: r5v37 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v12 */
    /* JADX WARN: Type inference failed for: r7v13 */
    /* JADX WARN: Type inference failed for: r7v25 */
    /* JADX WARN: Type inference failed for: r7v27 */
    /* JADX WARN: Type inference failed for: r7v28 */
    /* JADX WARN: Type inference failed for: r7v34 */
    /* JADX WARN: Type inference failed for: r7v40, types: [fe.z1] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void l(z1 z1Var, boolean z11) throws Throwable {
        y1 y1Var;
        long j11;
        long jLongValue;
        Object obj;
        int iA;
        int i5;
        boolean z12;
        boolean z13;
        boolean z14;
        int iA2;
        boolean z15;
        z1 z1Var2;
        long j12;
        ?? r72;
        boolean z16;
        long j13;
        f0 f0Var;
        int i11;
        long jLongValue2;
        boolean z17;
        int i12;
        boolean z18;
        boolean z19;
        long j14;
        int iA3;
        boolean z21;
        boolean z22;
        z1 z1Var3;
        gf.w wVar;
        long j15;
        boolean z23;
        boolean z24;
        gf.w wVar2;
        z1 z1Var4;
        Object obj2;
        long j16;
        int i13;
        boolean z25;
        ?? r52;
        boolean z26;
        boolean z27;
        z1 z1Var5;
        z0 z0Var;
        int i14;
        long j17;
        z1 z1Var6;
        long j18;
        c[] cVarArr;
        int i15;
        z0 z0Var2;
        boolean z28;
        boolean z29;
        z1 z1Var7;
        gf.w wVar3;
        z1 z1Var8;
        long j19;
        Object obj3;
        long j21;
        int i16;
        z1 z1Var9;
        boolean z31;
        boolean z32;
        z1 z1Var10;
        f1 f1Var = this.f54829w;
        g0 g0Var = this.J;
        z0 z0Var3 = this.f54824r;
        int i17 = this.D;
        boolean z33 = this.E;
        y1 y1Var2 = this.f54819k;
        x1 x1Var = this.f54820l;
        ?? r12 = 4;
        if (z1Var.p()) {
            ?? r19 = f1.f54763s;
            z1Var2 = z1Var;
            f0Var = new f0(r19, 0L, -9223372036854775807L, false, true, false);
            j11 = 0;
            z22 = r19;
        } else {
            gf.w wVar4 = f1Var.f54765b;
            Object obj4 = wVar4.f57640a;
            z1 z1Var11 = f1Var.f54764a;
            boolean zP = z1Var11.p();
            boolean z34 = zP || z1Var11.g(wVar4.f57640a, x1Var).f55080f;
            long j22 = (f1Var.f54765b.a() || z34) ? f1Var.f54766c : f1Var.f54779r;
            if (g0Var != null) {
                Pair pairE = E(z1Var, g0Var, true, i17, z33, y1Var2, x1Var);
                if (pairE == null) {
                    iA3 = z1Var.a(z33);
                    j14 = j22;
                    obj = obj4;
                    z19 = false;
                    z21 = true;
                    z18 = false;
                } else {
                    if (g0Var.f54795c == -9223372036854775807L) {
                        jLongValue2 = j22;
                        obj = obj4;
                        z17 = false;
                        i12 = z1Var.g(pairE.first, x1Var).f55077c;
                    } else {
                        obj = pairE.first;
                        jLongValue2 = ((Long) pairE.second).longValue();
                        z17 = true;
                        i12 = -1;
                    }
                    z18 = z17;
                    z19 = f1Var.f54768e == 4;
                    j14 = jLongValue2;
                    iA3 = i12;
                    z21 = false;
                }
                z12 = z19;
                z13 = z21;
                z14 = z18;
                iA = iA3;
                i5 = -1;
                j11 = 0;
                jLongValue = j14;
                y1Var = y1Var2;
            } else {
                if (f1Var.f54764a.p()) {
                    iA = z1Var.a(z33);
                    y1Var = y1Var2;
                } else if (z1Var.b(obj4) == -1) {
                    Object objF = F(y1Var2, x1Var, i17, z33, obj4, f1Var.f54764a, z1Var);
                    y1Var = y1Var2;
                    x1Var = x1Var;
                    if (objF == null) {
                        iA2 = z1Var.a(z33);
                        z15 = true;
                    } else {
                        iA2 = z1Var.g(objF, x1Var).f55077c;
                        z15 = false;
                    }
                    iA = iA2;
                    z13 = z15;
                    jLongValue = j22;
                    obj = obj4;
                    i5 = -1;
                    j11 = 0;
                    z12 = false;
                    z14 = false;
                } else {
                    y1Var = y1Var2;
                    if (j22 == -9223372036854775807L) {
                        iA = z1Var.g(obj4, x1Var).f55077c;
                    } else if (z34) {
                        f1Var.f54764a.g(wVar4.f57640a, x1Var);
                        if (f1Var.f54764a.m(x1Var.f55077c, y1Var, 0L).n == f1Var.f54764a.b(wVar4.f57640a)) {
                            j11 = 0;
                            Pair pairI = z1Var.i(y1Var, x1Var, z1Var.g(obj4, x1Var).f55077c, j22 + x1Var.f55079e);
                            obj = pairI.first;
                            jLongValue = ((Long) pairI.second).longValue();
                        } else {
                            j11 = 0;
                            jLongValue = j22;
                            obj = obj4;
                        }
                        iA = -1;
                        i5 = -1;
                        z12 = false;
                        z13 = false;
                        z14 = true;
                    } else {
                        j11 = 0;
                        jLongValue = j22;
                        obj = obj4;
                        iA = -1;
                        i5 = -1;
                        z12 = false;
                        z13 = false;
                        z14 = false;
                    }
                }
                jLongValue = j22;
                obj = obj4;
                i5 = -1;
                j11 = 0;
                z12 = false;
                z13 = false;
                z14 = false;
            }
            if (iA != i5) {
                int i18 = iA;
                z1Var2 = z1Var;
                Pair pairI2 = z1Var2.i(y1Var, x1Var, i18, -9223372036854775807L);
                obj = pairI2.first;
                jLongValue = ((Long) pairI2.second).longValue();
                j12 = -9223372036854775807L;
            } else {
                z1Var2 = z1Var;
                j12 = jLongValue;
            }
            gf.w wVarM = z0Var3.m(z1Var2, obj, jLongValue);
            int i19 = wVarM.f57644e;
            r72 = (!wVar4.f57640a.equals(obj) || wVar4.a() || wVarM.a() || !(i19 == i5 || ((i11 = wVar4.f57644e) != i5 && i19 >= i11))) ? 0 : 1;
            x1 x1VarG = z1Var2.g(obj, x1Var);
            if (z34 || j22 != j12) {
                z16 = false;
                if (r72 == 0 || z16) {
                    wVarM = wVar4;
                }
                if (!wVarM.a()) {
                    j13 = jLongValue;
                    f0Var = new f0(wVarM, j13, j12, z12, z13, z14);
                    z22 = zP;
                } else if (wVarM.equals(wVar4)) {
                    jLongValue = f1Var.f54779r;
                    j13 = jLongValue;
                    f0Var = new f0(wVarM, j13, j12, z12, z13, z14);
                    z22 = zP;
                } else {
                    z1Var2.g(wVarM.f57640a, x1Var);
                    j13 = wVarM.f57642c == x1Var.f(wVarM.f57641b) ? x1Var.f55081g.f59849b : j11;
                    f0Var = new f0(wVarM, j13, j12, z12, z13, z14);
                    z22 = zP;
                }
            } else {
                Object obj5 = wVar4.f57640a;
                int i21 = wVar4.f57642c;
                int i22 = wVar4.f57641b;
                if (obj5.equals(wVarM.f57640a) && (!wVar4.a() || !x1VarG.g(i22) ? !(!wVarM.a() || !x1VarG.g(wVarM.f57641b)) : !(x1VarG.e(i22, i21) == 4 || x1VarG.e(i22, i21) == 2))) {
                    z16 = true;
                }
                if (r72 == 0) {
                    wVarM = wVar4;
                    if (!wVarM.a()) {
                    }
                }
            }
        }
        gf.w wVar5 = f0Var.f54757a;
        long j23 = f0Var.f54759c;
        boolean z35 = f0Var.f54760d;
        long jI = f0Var.f54758b;
        boolean z36 = (this.f54829w.f54765b.equals(wVar5) && jI == this.f54829w.f54779r) ? false : true;
        try {
            if (f0Var.f54761e) {
                try {
                    z25 = true;
                    if (this.f54829w.f54768e != 1) {
                        try {
                            V(4);
                        } catch (Throwable th2) {
                            th = th2;
                            z1Var3 = z1Var2;
                            wVar = wVar5;
                            j15 = j23;
                            z24 = true;
                            z23 = false;
                        }
                    }
                    r52 = 0;
                } catch (Throwable th3) {
                    th = th3;
                    z25 = true;
                    r52 = 0;
                }
                try {
                    A(false, false, false, true);
                } catch (Throwable th4) {
                    th = th4;
                    z1Var3 = z1Var2;
                    wVar = wVar5;
                    j15 = j23;
                    z24 = z25;
                    z23 = r52;
                    f1 f1Var2 = this.f54829w;
                    z1 z1Var12 = f1Var2.f54764a;
                    gf.w wVar6 = f1Var2.f54765b;
                    wVar2 = wVar;
                    z1Var4 = z1Var3;
                    e0(z1Var4, wVar2, z1Var12, wVar6, !f0Var.f54762f ? jI : -9223372036854775807L);
                    if (!z36) {
                        f1 f1Var3 = this.f54829w;
                        obj2 = f1Var3.f54765b.f57640a;
                        z1 z1Var13 = f1Var3.f54764a;
                        if (z36) {
                            long j24 = this.f54829w.f54767d;
                            if (z1Var4.b(obj2) != -1) {
                            }
                            this.f54829w = o(wVar2, jI, j16, j24, z, i13);
                        }
                    }
                    B();
                    D(z1Var4, this.f54829w.f54764a);
                    this.f54829w = this.f54829w.g(z1Var4);
                    if (!z1Var4.p()) {
                    }
                    k(z23);
                    throw th;
                }
            } else {
                z25 = true;
                r52 = 0;
            }
            try {
                if (z36) {
                    r72 = z1Var2;
                    z22 = z25;
                    r12 = r52;
                    boolean zP2 = r72.p();
                    z1Var10 = r72;
                    z32 = r12;
                    z31 = z22;
                    if (zP2) {
                        wVar = wVar5;
                        z1Var7 = z1Var10;
                        z29 = z32;
                        z28 = z31;
                    } else {
                        for (x0 x0Var = this.f54824r.f55121h; x0Var != null; x0Var = x0Var.f55073l) {
                            if (x0Var.f55067f.f55086a.equals(wVar5)) {
                                x0Var.f55067f = this.f54824r.g(r72, x0Var.f55067f);
                                x0Var.h();
                            }
                        }
                        try {
                            z0 z0Var4 = this.f54824r;
                            wVar = wVar5;
                            try {
                                jI = I(wVar, jI, z0Var4.f55121h != z0Var4.f55122i ? z22 ? 1 : 0 : r12, z35);
                                z1Var7 = r72;
                                z29 = r12;
                                z28 = z22;
                            } catch (Throwable th5) {
                                th = th5;
                                jI = jI;
                                z1Var5 = r72;
                                z27 = r12;
                                z26 = z22;
                                j15 = j23;
                                z1Var3 = z1Var5;
                                z23 = z27;
                                z24 = z26;
                                f1 f1Var22 = this.f54829w;
                                z1 z1Var122 = f1Var22.f54764a;
                                gf.w wVar62 = f1Var22.f54765b;
                                wVar2 = wVar;
                                z1Var4 = z1Var3;
                                e0(z1Var4, wVar2, z1Var122, wVar62, !f0Var.f54762f ? jI : -9223372036854775807L);
                                if (!z36) {
                                }
                                B();
                                D(z1Var4, this.f54829w.f54764a);
                                this.f54829w = this.f54829w.g(z1Var4);
                                if (!z1Var4.p()) {
                                }
                                k(z23);
                                throw th;
                            }
                        } catch (Throwable th6) {
                            th = th6;
                            wVar = wVar5;
                            z1Var5 = r72;
                            z27 = r12;
                            z26 = z22;
                            j15 = j23;
                            z1Var3 = z1Var5;
                            z23 = z27;
                            z24 = z26;
                            f1 f1Var222 = this.f54829w;
                            z1 z1Var1222 = f1Var222.f54764a;
                            gf.w wVar622 = f1Var222.f54765b;
                            wVar2 = wVar;
                            z1Var4 = z1Var3;
                            e0(z1Var4, wVar2, z1Var1222, wVar622, !f0Var.f54762f ? jI : -9223372036854775807L);
                            if (!z36) {
                            }
                            B();
                            D(z1Var4, this.f54829w.f54764a);
                            this.f54829w = this.f54829w.g(z1Var4);
                            if (!z1Var4.p()) {
                            }
                            k(z23);
                            throw th;
                        }
                    }
                    f1 f1Var4 = this.f54829w;
                    z1 z1Var14 = f1Var4.f54764a;
                    gf.w wVar7 = f1Var4.f54765b;
                    if (f0Var.f54762f) {
                    }
                    e0(z1Var8, wVar3, z1Var14, wVar7, j19);
                    if (z36) {
                    }
                    B();
                    D(z1Var9, this.f54829w.f54764a);
                    this.f54829w = this.f54829w.g(z1Var9);
                    if (!z1Var9.p()) {
                    }
                    k(z29);
                    return;
                }
                try {
                    z0Var = this.f54824r;
                    z22 = z25;
                    i14 = r52;
                    try {
                        j17 = this.K;
                    } catch (Throwable th7) {
                        th = th7;
                    }
                } catch (Throwable th8) {
                    th = th8;
                    r72 = z1Var;
                    z22 = z25;
                    r12 = r52;
                }
                try {
                    c[] cVarArr2 = this.f54809a;
                    x0 x0Var2 = z0Var.f55122i;
                    try {
                        if (x0Var2 != null) {
                            long j25 = x0Var2.o;
                            if (x0Var2.f55065d) {
                                long jMax = j25;
                                int i23 = i14;
                                while (i23 < cVarArr2.length) {
                                    if (q(cVarArr2[i23])) {
                                        c cVar = cVarArr2[i23];
                                        cVarArr = cVarArr2;
                                        if (cVar.f54726g == x0Var2.f55064c[i23]) {
                                            z0Var2 = z0Var;
                                            i15 = i23;
                                            long j26 = cVar.f54729j;
                                            if (j26 == Long.MIN_VALUE) {
                                                z1Var6 = z1Var;
                                                z0Var = z0Var2;
                                                j17 = j17;
                                                r12 = i14;
                                                j18 = Long.MIN_VALUE;
                                                break;
                                            }
                                            jMax = Math.max(j26, jMax);
                                        }
                                        i23 = i15 + 1;
                                        z0Var = z0Var2;
                                        cVarArr2 = cVarArr;
                                    } else {
                                        cVarArr = cVarArr2;
                                    }
                                    z0Var2 = z0Var;
                                    i15 = i23;
                                    i23 = i15 + 1;
                                    z0Var = z0Var2;
                                    cVarArr2 = cVarArr;
                                }
                                z1Var6 = z1Var;
                                j18 = jMax;
                                j17 = j17;
                            } else {
                                j18 = j25;
                                j17 = j17;
                                r12 = i14;
                                z1Var6 = z1Var;
                            }
                            z1 z1Var15 = z1Var6;
                            z1Var10 = z1Var15;
                            z32 = r12;
                            z31 = z22;
                            if (!z0Var.o(z1Var6, j17, j18)) {
                                G(r12);
                                z1Var10 = z1Var15;
                                z32 = r12;
                                z31 = z22;
                            }
                            wVar = wVar5;
                            z1Var7 = z1Var10;
                            z29 = z32;
                            z28 = z31;
                            f1 f1Var42 = this.f54829w;
                            z1 z1Var142 = f1Var42.f54764a;
                            gf.w wVar72 = f1Var42.f54765b;
                            if (f0Var.f54762f) {
                                wVar3 = wVar;
                                z1Var8 = z1Var7;
                                j19 = jI;
                            } else {
                                wVar3 = wVar;
                                z1Var8 = z1Var7;
                                j19 = -9223372036854775807L;
                            }
                            e0(z1Var8, wVar3, z1Var142, wVar72, j19);
                            if (z36 || j23 != this.f54829w.f54766c) {
                                f1 f1Var5 = this.f54829w;
                                obj3 = f1Var5.f54765b.f57640a;
                                z1 z1Var16 = f1Var5.f54764a;
                                boolean z37 = (z36 || !z11 || z1Var16.p() || z1Var16.g(obj3, this.f54820l).f55080f) ? z29 : z28;
                                long j27 = this.f54829w.f54767d;
                                if (z1Var8.b(obj3) != -1) {
                                    j21 = j23;
                                    i16 = 4;
                                } else {
                                    j21 = j23;
                                    i16 = 3;
                                }
                                z1Var9 = z1Var8;
                                this.f54829w = o(wVar3, jI, j21, j27, z37, i16);
                            } else {
                                z1Var9 = z1Var8;
                            }
                            B();
                            D(z1Var9, this.f54829w.f54764a);
                            this.f54829w = this.f54829w.g(z1Var9);
                            if (!z1Var9.p()) {
                                this.J = null;
                            }
                            k(z29);
                            return;
                        }
                        z1Var6 = z1Var;
                        j18 = j11;
                        z1 z1Var152 = z1Var6;
                        z1Var10 = z1Var152;
                        z32 = r12;
                        z31 = z22;
                        if (!z0Var.o(z1Var6, j17, j18)) {
                        }
                        wVar = wVar5;
                        z1Var7 = z1Var10;
                        z29 = z32;
                        z28 = z31;
                        f1 f1Var422 = this.f54829w;
                        z1 z1Var1422 = f1Var422.f54764a;
                        gf.w wVar722 = f1Var422.f54765b;
                        if (f0Var.f54762f) {
                        }
                        e0(z1Var8, wVar3, z1Var1422, wVar722, j19);
                        if (z36) {
                            f1 f1Var52 = this.f54829w;
                            obj3 = f1Var52.f54765b.f57640a;
                            z1 z1Var162 = f1Var52.f54764a;
                            if (z36) {
                                long j272 = this.f54829w.f54767d;
                                if (z1Var8.b(obj3) != -1) {
                                }
                                z1Var9 = z1Var8;
                                this.f54829w = o(wVar3, jI, j21, j272, z37, i16);
                            }
                        }
                        B();
                        D(z1Var9, this.f54829w.f54764a);
                        this.f54829w = this.f54829w.g(z1Var9);
                        if (!z1Var9.p()) {
                        }
                        k(z29);
                        return;
                    } catch (Throwable th9) {
                        th = th9;
                        r72 = z1Var6;
                        wVar = wVar5;
                        z1Var5 = r72;
                        z27 = r12;
                        z26 = z22;
                        j15 = j23;
                        z1Var3 = z1Var5;
                        z23 = z27;
                        z24 = z26;
                        f1 f1Var2222 = this.f54829w;
                        z1 z1Var12222 = f1Var2222.f54764a;
                        gf.w wVar6222 = f1Var2222.f54765b;
                        wVar2 = wVar;
                        z1Var4 = z1Var3;
                        e0(z1Var4, wVar2, z1Var12222, wVar6222, !f0Var.f54762f ? jI : -9223372036854775807L);
                        if (!z36) {
                        }
                        B();
                        D(z1Var4, this.f54829w.f54764a);
                        this.f54829w = this.f54829w.g(z1Var4);
                        if (!z1Var4.p()) {
                        }
                        k(z23);
                        throw th;
                    }
                    r12 = i14;
                } catch (Throwable th10) {
                    th = th10;
                    r72 = z1Var;
                    r12 = i14;
                    wVar = wVar5;
                    z1Var5 = r72;
                    z27 = r12;
                    z26 = z22;
                    j15 = j23;
                    z1Var3 = z1Var5;
                    z23 = z27;
                    z24 = z26;
                    f1 f1Var22222 = this.f54829w;
                    z1 z1Var122222 = f1Var22222.f54764a;
                    gf.w wVar62222 = f1Var22222.f54765b;
                    wVar2 = wVar;
                    z1Var4 = z1Var3;
                    e0(z1Var4, wVar2, z1Var122222, wVar62222, !f0Var.f54762f ? jI : -9223372036854775807L);
                    if (!z36) {
                    }
                    B();
                    D(z1Var4, this.f54829w.f54764a);
                    this.f54829w = this.f54829w.g(z1Var4);
                    if (!z1Var4.p()) {
                    }
                    k(z23);
                    throw th;
                }
            } catch (Throwable th11) {
                th = th11;
            }
        } catch (Throwable th12) {
            th = th12;
            z1Var3 = z1Var2;
            wVar = wVar5;
            j15 = j23;
            z23 = false;
            z24 = true;
        }
        f1 f1Var222222 = this.f54829w;
        z1 z1Var1222222 = f1Var222222.f54764a;
        gf.w wVar622222 = f1Var222222.f54765b;
        wVar2 = wVar;
        z1Var4 = z1Var3;
        e0(z1Var4, wVar2, z1Var1222222, wVar622222, !f0Var.f54762f ? jI : -9223372036854775807L);
        if (!z36 || j15 != this.f54829w.f54766c) {
            f1 f1Var32 = this.f54829w;
            obj2 = f1Var32.f54765b.f57640a;
            z1 z1Var132 = f1Var32.f54764a;
            boolean z38 = (z36 || !z11 || z1Var132.p() || z1Var132.g(obj2, this.f54820l).f55080f) ? z23 : z24;
            long j242 = this.f54829w.f54767d;
            if (z1Var4.b(obj2) != -1) {
                j16 = j15;
                i13 = 4;
            } else {
                j16 = j15;
                i13 = 3;
            }
            this.f54829w = o(wVar2, jI, j16, j242, z38, i13);
        }
        B();
        D(z1Var4, this.f54829w.f54764a);
        this.f54829w = this.f54829w.g(z1Var4);
        if (!z1Var4.p()) {
            this.J = null;
        }
        k(z23);
        throw th;
    }

    /* JADX WARN: Type inference failed for: r3v1, types: [gf.t, java.lang.Object] */
    public final void m(gf.t tVar) throws ExoPlaybackException {
        z0 z0Var = this.f54824r;
        x0 x0Var = z0Var.f55123j;
        if (x0Var == null || x0Var.f55062a != tVar) {
            return;
        }
        float f11 = this.n.c().f54797a;
        z1 z1Var = this.f54829w.f54764a;
        x0Var.f55065d = true;
        x0Var.f55074m = x0Var.f55062a.q();
        tf.v vVarG = x0Var.g(f11, z1Var);
        y0 y0Var = x0Var.f55067f;
        long jMax = y0Var.f55087b;
        long j11 = y0Var.f55090e;
        if (j11 != -9223372036854775807L && jMax >= j11) {
            jMax = Math.max(0L, j11 - 1);
        }
        long jA = x0Var.a(vVarG, jMax, false, new boolean[x0Var.f55070i.length]);
        long j12 = x0Var.o;
        y0 y0Var2 = x0Var.f55067f;
        x0Var.o = (y0Var2.f55087b - jA) + j12;
        x0Var.f55067f = y0Var2.b(jA);
        c0(x0Var.n);
        if (x0Var == z0Var.f55121h) {
            C(x0Var.f55067f.f55087b);
            f(new boolean[this.f54809a.length]);
            f1 f1Var = this.f54829w;
            gf.w wVar = f1Var.f54765b;
            long j13 = x0Var.f55067f.f55087b;
            this.f54829w = o(wVar, j13, f1Var.f54766c, j13, false, 5);
        }
        s();
    }

    public final void n(g1 g1Var, float f11, boolean z11, boolean z12) {
        int i5;
        if (z11) {
            if (z12) {
                this.f54830x.a(1);
            }
            this.f54829w = this.f54829w.e(g1Var);
        }
        float f12 = g1Var.f54797a;
        x0 x0Var = this.f54824r.f55121h;
        while (true) {
            i5 = 0;
            if (x0Var == null) {
                break;
            }
            tf.q[] qVarArr = x0Var.n.f89179c;
            int length = qVarArr.length;
            while (i5 < length) {
                tf.q qVar = qVarArr[i5];
                if (qVar != null) {
                    qVar.c(f12);
                }
                i5++;
            }
            x0Var = x0Var.f55073l;
        }
        c[] cVarArr = this.f54809a;
        int length2 = cVarArr.length;
        while (i5 < length2) {
            c cVar = cVarArr[i5];
            if (cVar != null) {
                cVar.w(f11, g1Var.f54797a);
            }
            i5++;
        }
    }

    public final f1 o(gf.w wVar, long j11, long j12, long j13, boolean z11, int i5) {
        r2 r2VarF;
        this.M = (!this.M && j11 == this.f54829w.f54779r && wVar.equals(this.f54829w.f54765b)) ? false : true;
        B();
        f1 f1Var = this.f54829w;
        gf.y0 y0Var = f1Var.f54771h;
        tf.v vVar = f1Var.f54772i;
        List list = f1Var.f54773j;
        if (this.f54825s.f18016a) {
            x0 x0Var = this.f54824r.f55121h;
            y0Var = x0Var == null ? gf.y0.f57665d : x0Var.f55074m;
            vVar = x0Var == null ? this.f54813e : x0Var.n;
            tf.q[] qVarArr = vVar.f89179c;
            xk.s0 s0Var = new xk.s0(4);
            boolean z12 = false;
            for (tf.q qVar : qVarArr) {
                if (qVar != null) {
                    Metadata metadata = qVar.getFormat(0).f54881j;
                    if (metadata == null) {
                        s0Var.a(new Metadata(new Metadata.Entry[0]));
                    } else {
                        s0Var.a(metadata);
                        z12 = true;
                    }
                }
            }
            if (z12) {
                r2VarF = s0Var.f();
            } else {
                xk.l0 l0Var = xk.v0.f96030b;
                r2VarF = r2.f96007e;
            }
            list = r2VarF;
            if (x0Var != null) {
                y0 y0Var2 = x0Var.f55067f;
                if (y0Var2.f55088c != j12) {
                    x0Var.f55067f = y0Var2.a(j12);
                }
            }
        } else if (!wVar.equals(f1Var.f54765b)) {
            y0Var = gf.y0.f57665d;
            vVar = this.f54813e;
            list = r2.f96007e;
        }
        gf.y0 y0Var3 = y0Var;
        tf.v vVar2 = vVar;
        List list2 = list;
        if (z11) {
            e0 e0Var = this.f54830x;
            if (!e0Var.f54748d || e0Var.f54749e == 5) {
                e0Var.f54745a = true;
                e0Var.f54748d = true;
                e0Var.f54749e = i5;
            } else {
                wf.a.e(i5 == 5);
            }
        }
        f1 f1Var2 = this.f54829w;
        long j14 = f1Var2.f54777p;
        x0 x0Var2 = this.f54824r.f55123j;
        return f1Var2.b(wVar, j11, j12, j13, x0Var2 == null ? 0L : Math.max(0L, j14 - (this.K - x0Var2.o)), y0Var3, vVar2, list2);
    }

    /* JADX WARN: Type inference failed for: r0v3, types: [gf.u0, java.lang.Object] */
    public final boolean p() {
        x0 x0Var = this.f54824r.f55123j;
        if (x0Var == null) {
            return false;
        }
        return (!x0Var.f55065d ? 0L : x0Var.f55062a.d()) != Long.MIN_VALUE;
    }

    public final boolean r() {
        x0 x0Var = this.f54824r.f55121h;
        long j11 = x0Var.f55067f.f55090e;
        if (x0Var.f55065d) {
            return j11 == -9223372036854775807L || this.f54829w.f54779r < j11 || !W();
        }
        return false;
    }

    /* JADX WARN: Type inference failed for: r0v12, types: [gf.t, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v18, types: [gf.u0, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v3, types: [gf.u0, java.lang.Object] */
    public final void s() {
        boolean zC;
        if (p()) {
            x0 x0Var = this.f54824r.f55123j;
            long jD = !x0Var.f55065d ? 0L : x0Var.f55062a.d();
            x0 x0Var2 = this.f54824r.f55123j;
            long jMax = x0Var2 == null ? 0L : Math.max(0L, jD - (this.K - x0Var2.o));
            x0 x0Var3 = this.f54824r.f55121h;
            zC = this.f54814f.c(this.n.c().f54797a, jMax);
            if (!zC && jMax < 500000 && this.f54821m > 0) {
                this.f54824r.f55121h.f55062a.m(this.f54829w.f54779r);
                zC = this.f54814f.c(this.n.c().f54797a, jMax);
            }
        } else {
            zC = false;
        }
        this.C = zC;
        if (zC) {
            x0 x0Var4 = this.f54824r.f55123j;
            long j11 = this.K;
            wf.a.i(x0Var4.f55073l == null);
            x0Var4.f55062a.n(j11 - x0Var4.o);
        }
        b0();
    }

    public final void t() {
        e0 e0Var = this.f54830x;
        f1 f1Var = this.f54829w;
        boolean z11 = e0Var.f54745a | (e0Var.f54746b != f1Var);
        e0Var.f54745a = z11;
        e0Var.f54746b = f1Var;
        if (z11) {
            a0 a0Var = this.f54823q.f54963a;
            a0Var.f54688i.f94370a.post(new fa.l0(2, a0Var, e0Var));
            this.f54830x = new e0(this.f54829w);
        }
    }

    public final void u() throws Throwable {
        l(this.f54825s.c(), true);
    }

    public final void v() {
        this.f54830x.a(1);
        throw null;
    }

    public final void w() {
        this.f54830x.a(1);
        A(false, false, false, true);
        this.f54814f.b(false);
        V(this.f54829w.f54764a.p() ? 4 : 2);
        vf.p pVar = (vf.p) this.f54815g;
        pVar.getClass();
        bk.l lVar = this.f54825s;
        ArrayList arrayList = (ArrayList) lVar.f18018c;
        wf.a.i(!lVar.f18016a);
        lVar.f18027l = pVar;
        for (int i5 = 0; i5 < arrayList.size(); i5++) {
            d1 d1Var = (d1) arrayList.get(i5);
            lVar.g(d1Var);
            ((HashSet) lVar.f18025j).add(d1Var);
        }
        lVar.f18016a = true;
        this.f54816h.c(2);
    }

    public final void x() {
        A(true, false, true, false);
        this.f54814f.b(true);
        V(1);
        this.f54817i.quit();
        synchronized (this) {
            this.f54831y = true;
            notifyAll();
        }
    }

    public final void y(int i5, int i11, gf.v0 v0Var) throws Throwable {
        this.f54830x.a(1);
        bk.l lVar = this.f54825s;
        lVar.getClass();
        wf.a.e(i5 >= 0 && i5 <= i11 && i11 <= ((ArrayList) lVar.f18018c).size());
        lVar.f18026k = v0Var;
        lVar.i(i5, i11);
        l(lVar.c(), false);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r8v4 */
    /* JADX WARN: Type inference failed for: r8v5, types: [int] */
    /* JADX WARN: Type inference failed for: r8v8 */
    public final void z() throws ExoPlaybackException {
        int i5;
        boolean z11;
        float f11 = this.n.c().f54797a;
        z0 z0Var = this.f54824r;
        x0 x0Var = z0Var.f55121h;
        x0 x0Var2 = z0Var.f55122i;
        boolean z12 = true;
        for (x0 x0Var3 = x0Var; x0Var3 != null && x0Var3.f55065d; x0Var3 = x0Var3.f55073l) {
            tf.v vVarG = x0Var3.g(f11, this.f54829w.f54764a);
            tf.v vVar = x0Var3.n;
            tf.q[] qVarArr = vVarG.f89179c;
            boolean z13 = false;
            if (vVar != null && vVar.f89179c.length == qVarArr.length) {
                for (int i11 = 0; i11 < qVarArr.length; i11++) {
                    if (vVarG.a(vVar, i11)) {
                    }
                }
                if (x0Var3 == x0Var2) {
                    z12 = false;
                }
            }
            if (z12) {
                z0 z0Var2 = this.f54824r;
                x0 x0Var4 = z0Var2.f55121h;
                boolean zK = z0Var2.k(x0Var4);
                boolean[] zArr = new boolean[this.f54809a.length];
                long jA = x0Var4.a(vVarG, this.f54829w.f54779r, zK, zArr);
                f1 f1Var = this.f54829w;
                if (f1Var.f54768e == 4 || jA == f1Var.f54779r) {
                    z11 = false;
                } else {
                    z11 = false;
                    z13 = true;
                }
                f1 f1Var2 = this.f54829w;
                boolean z14 = z11;
                i5 = 4;
                this.f54829w = o(f1Var2.f54765b, jA, f1Var2.f54766c, f1Var2.f54767d, z13, 5);
                if (z13) {
                    C(jA);
                }
                boolean[] zArr2 = new boolean[this.f54809a.length];
                ?? r82 = z14;
                while (true) {
                    c[] cVarArr = this.f54809a;
                    if (r82 >= cVarArr.length) {
                        break;
                    }
                    c cVar = cVarArr[r82];
                    boolean zQ = q(cVar);
                    zArr2[r82] = zQ;
                    gf.t0 t0Var = x0Var4.f55064c[r82];
                    if (zQ) {
                        if (t0Var != cVar.f54726g) {
                            d(cVar);
                        } else if (zArr[r82]) {
                            long j11 = this.K;
                            cVar.f54730k = z14;
                            cVar.f54729j = j11;
                            cVar.n(j11, z14);
                        }
                    }
                    r82++;
                }
                f(zArr2);
            } else {
                i5 = 4;
                this.f54824r.k(x0Var3);
                if (x0Var3.f55065d) {
                    x0Var3.a(vVarG, Math.max(x0Var3.f55067f.f55087b, this.K - x0Var3.o), false, new boolean[x0Var3.f55070i.length]);
                }
            }
            k(true);
            if (this.f54829w.f54768e != i5) {
                s();
                d0();
                this.f54816h.c(2);
                return;
            }
            return;
        }
    }
}
