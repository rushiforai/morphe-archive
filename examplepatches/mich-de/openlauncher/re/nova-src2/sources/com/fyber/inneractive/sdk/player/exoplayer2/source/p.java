package com.fyber.inneractive.sdk.player.exoplayer2.source;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.SparseArray;
import com.fyber.inneractive.sdk.player.controller.b0;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.UnknownHostException;

/* loaded from: classes3.dex */
public final class p implements s, com.fyber.inneractive.sdk.player.exoplayer2.extractor.j, com.fyber.inneractive.sdk.player.exoplayer2.upstream.x, com.fyber.inneractive.sdk.player.exoplayer2.extractor.f {
    public boolean A;
    public long C;
    public int E;
    public boolean F;
    public boolean G;

    /* renamed from: a, reason: collision with root package name */
    public final Uri f30205a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.h f30206b;

    /* renamed from: c, reason: collision with root package name */
    public final int f30207c;

    /* renamed from: d, reason: collision with root package name */
    public final Handler f30208d;

    /* renamed from: e, reason: collision with root package name */
    public final b0 f30209e;

    /* renamed from: f, reason: collision with root package name */
    public final t f30210f;

    /* renamed from: g, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.b f30211g;

    /* renamed from: j, reason: collision with root package name */
    public final n f30214j;

    /* renamed from: p, reason: collision with root package name */
    public r f30218p;

    /* renamed from: q, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.q f30219q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f30220r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f30221s;

    /* renamed from: t, reason: collision with root package name */
    public boolean f30222t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f30223u;

    /* renamed from: v, reason: collision with root package name */
    public int f30224v;

    /* renamed from: w, reason: collision with root package name */
    public z f30225w;

    /* renamed from: x, reason: collision with root package name */
    public long f30226x;

    /* renamed from: y, reason: collision with root package name */
    public boolean[] f30227y;

    /* renamed from: z, reason: collision with root package name */
    public boolean[] f30228z;

    /* renamed from: h, reason: collision with root package name */
    public final String f30212h = null;

    /* renamed from: i, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.b0 f30213i = new com.fyber.inneractive.sdk.player.exoplayer2.upstream.b0("Loader:ExtractorMediaPeriod");

    /* renamed from: k, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.e f30215k = new com.fyber.inneractive.sdk.player.exoplayer2.util.e();

    /* renamed from: l, reason: collision with root package name */
    public final i f30216l = new i(this);

    /* renamed from: m, reason: collision with root package name */
    public final j f30217m = new j(this);
    public final Handler n = new Handler();
    public long D = -9223372036854775807L;
    public final SparseArray o = new SparseArray();
    public long B = -1;

    public p(Uri uri, com.fyber.inneractive.sdk.player.exoplayer2.upstream.h hVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.i[] iVarArr, int i5, Handler handler, b0 b0Var, t tVar, com.fyber.inneractive.sdk.player.exoplayer2.upstream.b bVar) {
        this.f30205a = uri;
        this.f30206b = hVar;
        this.f30207c = i5;
        this.f30208d = handler;
        this.f30209e = b0Var;
        this.f30210f = tVar;
        this.f30211g = bVar;
        this.f30214j = new n(iVarArr, this);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.x
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.upstream.z zVar, long j11, long j12, boolean z11) {
        m mVar = (m) zVar;
        if (this.B == -1) {
            this.B = mVar.f30198i;
        }
        if (z11 || this.f30224v <= 0) {
            return;
        }
        int size = this.o.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.o.valueAt(i5)).a(this.f30227y[i5]);
        }
        com.fyber.inneractive.sdk.player.exoplayer2.l lVar = (com.fyber.inneractive.sdk.player.exoplayer2.l) this.f30218p;
        lVar.getClass();
        lVar.f30035f.obtainMessage(9, this).sendToTarget();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.w
    public final boolean b(long j11) {
        boolean z11 = false;
        if (this.F || (this.f30221s && this.f30224v == 0)) {
            return false;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.util.e eVar = this.f30215k;
        synchronized (eVar) {
            if (!eVar.f30434a) {
                eVar.f30434a = true;
                eVar.notifyAll();
                z11 = true;
            }
        }
        if (this.f30213i.a()) {
            return z11;
        }
        i();
        return true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.s
    public final long c() {
        long jMax;
        if (this.F) {
            return Long.MIN_VALUE;
        }
        long j11 = this.D;
        if (j11 != -9223372036854775807L) {
            return j11;
        }
        int i5 = 0;
        if (this.A) {
            int size = this.o.size();
            jMax = Long.MAX_VALUE;
            while (i5 < size) {
                if (this.f30228z[i5]) {
                    jMax = Math.min(jMax, ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.o.valueAt(i5)).d());
                }
                i5++;
            }
        } else {
            int size2 = this.o.size();
            jMax = Long.MIN_VALUE;
            while (i5 < size2) {
                jMax = Math.max(jMax, ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.o.valueAt(i5)).d());
                i5++;
            }
        }
        return jMax == Long.MIN_VALUE ? this.C : jMax;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.s
    public final void d() throws IOException {
        this.f30213i.b();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.f
    public final void e() {
        this.n.post(this.f30216l);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.w
    public final long f() {
        if (this.f30224v == 0) {
            return Long.MIN_VALUE;
        }
        return c();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.s
    public final long g() {
        if (!this.f30223u) {
            return -9223372036854775807L;
        }
        this.f30223u = false;
        return this.C;
    }

    public final int h() {
        int size = this.o.size();
        int i5 = 0;
        for (int i11 = 0; i11 < size; i11++) {
            com.fyber.inneractive.sdk.player.exoplayer2.extractor.e eVar = ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.o.valueAt(i11)).f29184c;
            i5 += eVar.f29151j + eVar.f29150i;
        }
        return i5;
    }

    public final void i() {
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.q qVar;
        m mVar = new m(this, this.f30205a, this.f30206b, this.f30214j, this.f30215k);
        if (this.f30221s) {
            long j11 = this.D;
            if (j11 == -9223372036854775807L) {
                throw new IllegalStateException();
            }
            long j12 = this.f30226x;
            if (j12 != -9223372036854775807L && j11 >= j12) {
                this.F = true;
                this.D = -9223372036854775807L;
                return;
            }
            long jA = this.f30219q.a(j11);
            long j13 = this.D;
            mVar.f30194e.f29669a = jA;
            mVar.f30197h = j13;
            mVar.f30196g = true;
            this.D = -9223372036854775807L;
        }
        this.E = h();
        int i5 = this.f30207c;
        if (i5 == -1) {
            i5 = (this.f30221s && this.B == -1 && ((qVar = this.f30219q) == null || qVar.c() == -9223372036854775807L)) ? 6 : 3;
        }
        int i11 = i5;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.b0 b0Var = this.f30213i;
        b0Var.getClass();
        Looper looperMyLooper = Looper.myLooper();
        if (looperMyLooper == null) {
            throw new IllegalStateException();
        }
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.y yVar = new com.fyber.inneractive.sdk.player.exoplayer2.upstream.y(b0Var, looperMyLooper, mVar, this, i11, SystemClock.elapsedRealtime());
        if (b0Var.f30275b != null) {
            throw new IllegalStateException();
        }
        b0Var.f30275b = yVar;
        yVar.f30422e = null;
        b0Var.f30274a.execute(yVar);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.x
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.upstream.z zVar, long j11, long j12) {
        m mVar = (m) zVar;
        if (this.B == -1) {
            this.B = mVar.f30198i;
        }
        this.F = true;
        if (this.f30226x == -9223372036854775807L) {
            int size = this.o.size();
            long jMax = Long.MIN_VALUE;
            for (int i5 = 0; i5 < size; i5++) {
                jMax = Math.max(jMax, ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.o.valueAt(i5)).d());
            }
            long j13 = jMax == Long.MIN_VALUE ? 0L : com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c + jMax;
            this.f30226x = j13;
            this.f30210f.a(new x(j13, j13, 0L, 0L, this.f30219q.a(), false), null);
        }
        com.fyber.inneractive.sdk.player.exoplayer2.l lVar = (com.fyber.inneractive.sdk.player.exoplayer2.l) this.f30218p;
        lVar.getClass();
        lVar.f30035f.obtainMessage(9, this).sendToTarget();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.j
    public final void b() {
        this.f30220r = true;
        this.n.post(this.f30216l);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.x
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.upstream.z zVar, long j11, long j12, IOException iOException) {
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.q qVar;
        m mVar = (m) zVar;
        if (this.B == -1) {
            this.B = mVar.f30198i;
        }
        Handler handler = this.f30208d;
        if (handler != null && this.f30209e != null) {
            handler.post(new l(this, iOException));
        }
        if ((iOException instanceof a0) || (iOException instanceof com.fyber.inneractive.sdk.player.exoplayer2.upstream.v)) {
            return 3;
        }
        if ((iOException instanceof com.fyber.inneractive.sdk.player.exoplayer2.upstream.u) && iOException.getCause() != null && ((iOException.getCause() instanceof MalformedURLException) || (iOException.getCause() instanceof UnknownHostException))) {
            return 3;
        }
        int i5 = h() > this.E ? 1 : 0;
        if (this.B == -1 && ((qVar = this.f30219q) == null || qVar.c() == -9223372036854775807L)) {
            this.C = 0L;
            this.f30223u = this.f30221s;
            int size = this.o.size();
            for (int i11 = 0; i11 < size; i11++) {
                ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.o.valueAt(i11)).a(!this.f30221s || this.f30227y[i11]);
            }
            mVar.f30194e.f29669a = 0L;
            mVar.f30197h = 0L;
            mVar.f30196g = true;
        }
        this.E = h();
        return i5;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.s
    public final void a(r rVar) {
        this.f30218p = rVar;
        com.fyber.inneractive.sdk.player.exoplayer2.util.e eVar = this.f30215k;
        synchronized (eVar) {
            if (!eVar.f30434a) {
                eVar.f30434a = true;
                eVar.notifyAll();
            }
        }
        i();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.s
    public final z a() {
        return this.f30225w;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.s
    public final long a(com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b[] bVarArr, boolean[] zArr, v[] vVarArr, boolean[] zArr2, long j11) {
        com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b bVar;
        if (this.f30221s) {
            for (int i5 = 0; i5 < bVarArr.length; i5++) {
                v vVar = vVarArr[i5];
                if (vVar != null && (bVarArr[i5] == null || !zArr[i5])) {
                    int i11 = ((o) vVar).f30203a;
                    boolean[] zArr3 = this.f30227y;
                    if (zArr3[i11]) {
                        this.f30224v--;
                        zArr3[i11] = false;
                        ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.o.valueAt(i11)).b();
                        vVarArr[i5] = null;
                    } else {
                        throw new IllegalStateException();
                    }
                }
            }
            boolean z11 = false;
            for (int i12 = 0; i12 < bVarArr.length; i12++) {
                if (vVarArr[i12] == null && (bVar = bVarArr[i12]) != null) {
                    int[] iArr = bVar.f30258c;
                    if (iArr.length == 1) {
                        if (iArr[0] == 0) {
                            z zVar = this.f30225w;
                            y yVar = bVar.f30256a;
                            int i13 = 0;
                            while (true) {
                                if (i13 >= zVar.f30248a) {
                                    i13 = -1;
                                    break;
                                }
                                if (zVar.f30249b[i13] == yVar) {
                                    break;
                                }
                                i13++;
                            }
                            boolean[] zArr4 = this.f30227y;
                            if (!zArr4[i13]) {
                                this.f30224v++;
                                zArr4[i13] = true;
                                vVarArr[i12] = new o(this, i13);
                                zArr2[i12] = true;
                                z11 = true;
                            } else {
                                throw new IllegalStateException();
                            }
                        } else {
                            throw new IllegalStateException();
                        }
                    } else {
                        throw new IllegalStateException();
                    }
                }
            }
            if (!this.f30222t) {
                int size = this.o.size();
                for (int i14 = 0; i14 < size; i14++) {
                    if (!this.f30227y[i14]) {
                        ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.o.valueAt(i14)).b();
                    }
                }
            }
            if (this.f30224v == 0) {
                this.f30223u = false;
                if (this.f30213i.a()) {
                    this.f30213i.f30275b.a(false);
                }
            } else if (!this.f30222t ? j11 != 0 : z11) {
                j11 = a(j11);
                for (int i15 = 0; i15 < vVarArr.length; i15++) {
                    if (vVarArr[i15] != null) {
                        zArr2[i15] = true;
                    }
                }
            }
            this.f30222t = true;
            return j11;
        }
        throw new IllegalStateException();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.s
    public final long a(long j11) {
        if (!this.f30219q.a()) {
            j11 = 0;
        }
        this.C = j11;
        int size = this.o.size();
        boolean zA = !(this.D != -9223372036854775807L);
        for (int i5 = 0; zA && i5 < size; i5++) {
            if (this.f30227y[i5]) {
                zA = ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.o.valueAt(i5)).a(false, j11);
            }
        }
        if (!zA) {
            this.D = j11;
            this.F = false;
            if (this.f30213i.a()) {
                this.f30213i.f30275b.a(false);
            } else {
                for (int i11 = 0; i11 < size; i11++) {
                    ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.o.valueAt(i11)).a(this.f30227y[i11]);
                }
            }
        }
        this.f30223u = false;
        return j11;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.j
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.g a(int i5, int i11) {
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVar = (com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.o.get(i5);
        if (gVar != null) {
            return gVar;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVar2 = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.g(this.f30211g);
        gVar2.n = this;
        this.o.put(i5, gVar2);
        return gVar2;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.j
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.q qVar) {
        this.f30219q = qVar;
        this.n.post(this.f30216l);
    }
}
