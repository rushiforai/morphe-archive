package gf;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import com.google.android.exoplayer2.ParserException;
import com.google.android.exoplayer2.metadata.Metadata;
import com.google.android.exoplayer2.metadata.icy.IcyHeaders;
import com.google.android.exoplayer2.upstream.DataSourceException;
import com.google.android.exoplayer2.upstream.HttpDataSource$CleartextNotPermittedException;
import com.google.android.exoplayer2.upstream.Loader$UnexpectedLoaderException;
import fe.s1;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public final class l0 implements t, ke.l, vf.y, vf.a0 {
    public static final Map L;
    public static final fe.k0 M;
    public boolean B;
    public boolean C;
    public int D;
    public boolean E;
    public long F;
    public boolean H;
    public int I;
    public boolean J;
    public boolean K;

    /* renamed from: a, reason: collision with root package name */
    public final Uri f57542a;

    /* renamed from: b, reason: collision with root package name */
    public final vf.k f57543b;

    /* renamed from: c, reason: collision with root package name */
    public final je.e f57544c;

    /* renamed from: d, reason: collision with root package name */
    public final vf.u f57545d;

    /* renamed from: e, reason: collision with root package name */
    public final a0 f57546e;

    /* renamed from: f, reason: collision with root package name */
    public final a0 f57547f;

    /* renamed from: g, reason: collision with root package name */
    public final o0 f57548g;

    /* renamed from: h, reason: collision with root package name */
    public final vf.m f57549h;

    /* renamed from: i, reason: collision with root package name */
    public final long f57550i;

    /* renamed from: k, reason: collision with root package name */
    public final fl.l f57552k;

    /* renamed from: p, reason: collision with root package name */
    public s f57555p;

    /* renamed from: q, reason: collision with root package name */
    public IcyHeaders f57556q;

    /* renamed from: t, reason: collision with root package name */
    public boolean f57559t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f57560u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f57561v;

    /* renamed from: w, reason: collision with root package name */
    public tm.o f57562w;

    /* renamed from: x, reason: collision with root package name */
    public ke.s f57563x;

    /* renamed from: z, reason: collision with root package name */
    public boolean f57565z;

    /* renamed from: j, reason: collision with root package name */
    public final vf.b0 f57551j = new vf.b0("ProgressiveMediaPeriod");

    /* renamed from: l, reason: collision with root package name */
    public final bg.g f57553l = new bg.g();

    /* renamed from: m, reason: collision with root package name */
    public final h0 f57554m = new h0(this, 0);
    public final h0 n = new h0(this, 1);
    public final Handler o = wf.v.j(null);

    /* renamed from: s, reason: collision with root package name */
    public k0[] f57558s = new k0[0];

    /* renamed from: r, reason: collision with root package name */
    public s0[] f57557r = new s0[0];
    public long G = -9223372036854775807L;

    /* renamed from: y, reason: collision with root package name */
    public long f57564y = -9223372036854775807L;
    public int A = 1;

    static {
        HashMap map = new HashMap();
        map.put("Icy-MetaData", "1");
        L = Collections.unmodifiableMap(map);
        fe.j0 j0Var = new fe.j0();
        j0Var.f54846a = "icy";
        j0Var.f54856k = "application/x-icy";
        M = new fe.k0(j0Var);
    }

    public l0(Uri uri, vf.k kVar, fl.l lVar, je.e eVar, a0 a0Var, vf.u uVar, a0 a0Var2, o0 o0Var, vf.m mVar, int i5) {
        this.f57542a = uri;
        this.f57543b = kVar;
        this.f57544c = eVar;
        this.f57547f = a0Var;
        this.f57545d = uVar;
        this.f57546e = a0Var2;
        this.f57548g = o0Var;
        this.f57549h = mVar;
        this.f57550i = i5;
        this.f57552k = lVar;
    }

    public final s0 A(k0 k0Var) {
        int length = this.f57557r.length;
        for (int i5 = 0; i5 < length; i5++) {
            if (k0Var.equals(this.f57558s[i5])) {
                return this.f57557r[i5];
            }
        }
        je.e eVar = this.f57544c;
        eVar.getClass();
        s0 s0Var = new s0(this.f57549h, eVar, this.f57547f);
        s0Var.f57621f = this;
        int i11 = length + 1;
        k0[] k0VarArr = (k0[]) Arrays.copyOf(this.f57558s, i11);
        k0VarArr[length] = k0Var;
        int i12 = wf.v.f94376a;
        this.f57558s = k0VarArr;
        s0[] s0VarArr = (s0[]) Arrays.copyOf(this.f57557r, i11);
        s0VarArr[length] = s0Var;
        this.f57557r = s0VarArr;
        return s0Var;
    }

    public final void B() {
        i0 i0Var = new i0(this, this.f57542a, this.f57543b, this.f57552k, this, this.f57553l);
        if (this.f57560u) {
            wf.a.i(w());
            long j11 = this.f57564y;
            if (j11 != -9223372036854775807L && this.G > j11) {
                this.J = true;
                this.G = -9223372036854775807L;
                return;
            }
            ke.s sVar = this.f57563x;
            sVar.getClass();
            long j12 = sVar.d(this.G).f71430a.f71434b;
            long j13 = this.G;
            i0Var.f57517f.f71407a = j12;
            i0Var.f57520i = j13;
            i0Var.f57519h = true;
            i0Var.f57523l = false;
            for (s0 s0Var : this.f57557r) {
                s0Var.f57633t = this.G;
            }
            this.G = -9223372036854775807L;
        }
        this.I = k();
        int iG = this.f57545d.g(this.A);
        vf.b0 b0Var = this.f57551j;
        b0Var.getClass();
        Looper looperMyLooper = Looper.myLooper();
        wf.a.j(looperMyLooper);
        b0Var.f92637c = null;
        vf.z zVar = new vf.z(b0Var, looperMyLooper, i0Var, this, iG, SystemClock.elapsedRealtime());
        wf.a.i(b0Var.f92636b == null);
        b0Var.f92636b = zVar;
        zVar.f92759d = null;
        b0Var.f92635a.execute(zVar);
        Uri uri = i0Var.f57521j.f92691a;
        Map map = Collections.EMPTY_MAP;
        m mVar = new m();
        long j14 = i0Var.f57520i;
        long j15 = this.f57564y;
        a0 a0Var = this.f57546e;
        a0Var.f(mVar, new r(1, -1, null, a0Var.a(j14), a0Var.a(j15)));
    }

    public final boolean C() {
        return this.C || w();
    }

    @Override // vf.y
    public final ve.e a(i0 i0Var, IOException iOException, int i5) {
        long jMin;
        ve.e eVar;
        ke.s sVar;
        Uri uri = i0Var.f57513b.f92670c;
        m mVar = new m();
        int i11 = wf.v.f94376a;
        this.f57545d.getClass();
        if ((iOException instanceof ParserException) || (iOException instanceof FileNotFoundException) || (iOException instanceof HttpDataSource$CleartextNotPermittedException) || (iOException instanceof Loader$UnexpectedLoaderException)) {
            jMin = -9223372036854775807L;
            break;
        }
        int i12 = DataSourceException.f31593b;
        for (Throwable cause = iOException; cause != null; cause = cause.getCause()) {
            if ((cause instanceof DataSourceException) && ((DataSourceException) cause).f31594a == 2008) {
                jMin = -9223372036854775807L;
                break;
            }
        }
        jMin = Math.min((i5 - 1) * 1000, 5000);
        if (jMin == -9223372036854775807L) {
            eVar = vf.b0.f92634e;
        } else {
            int iK = k();
            int i13 = iK > this.I ? 1 : 0;
            if (this.E || !((sVar = this.f57563x) == null || sVar.i() == -9223372036854775807L)) {
                this.I = iK;
            } else if (!this.f57560u || C()) {
                this.C = this.f57560u;
                this.F = 0L;
                this.I = 0;
                for (s0 s0Var : this.f57557r) {
                    s0Var.l(false);
                }
                i0Var.f57517f.f71407a = 0L;
                i0Var.f57520i = 0L;
                i0Var.f57519h = true;
                i0Var.f57523l = false;
            } else {
                this.H = true;
                eVar = vf.b0.f92633d;
            }
            eVar = new ve.e(i13, jMin);
        }
        int i14 = eVar.f92619a;
        boolean z11 = i14 == 0 || i14 == 1;
        long j11 = i0Var.f57520i;
        long j12 = this.f57564y;
        a0 a0Var = this.f57546e;
        a0Var.e(mVar, new r(1, -1, null, a0Var.a(j11), a0Var.a(j12)), iOException, !z11);
        return eVar;
    }

    @Override // vf.y
    public final void b(i0 i0Var, boolean z11) {
        Uri uri = i0Var.f57513b.f92670c;
        m mVar = new m();
        this.f57545d.getClass();
        long j11 = i0Var.f57520i;
        long j12 = this.f57564y;
        a0 a0Var = this.f57546e;
        a0Var.c(mVar, new r(1, -1, null, a0Var.a(j11), a0Var.a(j12)));
        if (z11) {
            return;
        }
        for (s0 s0Var : this.f57557r) {
            s0Var.l(false);
        }
        if (this.D > 0) {
            s sVar = this.f57555p;
            sVar.getClass();
            sVar.a(this);
        }
    }

    @Override // gf.u0
    public final boolean c() {
        boolean z11;
        if (!this.f57551j.a()) {
            return false;
        }
        bg.g gVar = this.f57553l;
        synchronized (gVar) {
            z11 = gVar.f17888a;
        }
        return z11;
    }

    @Override // gf.u0
    public final long d() {
        return t();
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0068  */
    @Override // gf.t
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long e(long j11) {
        vf.b0 b0Var;
        g();
        boolean[] zArr = (boolean[]) this.f57562w.f89494c;
        if (!this.f57563x.f()) {
            j11 = 0;
        }
        this.C = false;
        this.F = j11;
        if (w()) {
            this.G = j11;
            return j11;
        }
        if (this.A != 7) {
            int length = this.f57557r.length;
            for (int i5 = 0; i5 < length; i5++) {
                if (!this.f57557r[i5].m(j11, false) && (zArr[i5] || !this.f57561v)) {
                    this.H = false;
                    this.G = j11;
                    this.J = false;
                    b0Var = this.f57551j;
                    if (!b0Var.a()) {
                        for (s0 s0Var : this.f57557r) {
                            s0Var.f();
                        }
                        vf.z zVar = b0Var.f92636b;
                        wf.a.j(zVar);
                        zVar.a(false);
                        return j11;
                    }
                    b0Var.f92637c = null;
                    for (s0 s0Var2 : this.f57557r) {
                        s0Var2.l(false);
                    }
                }
            }
        } else {
            this.H = false;
            this.G = j11;
            this.J = false;
            b0Var = this.f57551j;
            if (!b0Var.a()) {
            }
        }
        return j11;
    }

    @Override // vf.y
    public final void f(i0 i0Var) {
        ke.s sVar;
        if (this.f57564y == -9223372036854775807L && (sVar = this.f57563x) != null) {
            boolean zF = sVar.f();
            long jU = u(true);
            long j11 = jU == Long.MIN_VALUE ? 0L : jU + com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c;
            this.f57564y = j11;
            this.f57548g.s(j11, zF, this.f57565z);
        }
        Uri uri = i0Var.f57513b.f92670c;
        m mVar = new m();
        this.f57545d.getClass();
        long j12 = i0Var.f57520i;
        long j13 = this.f57564y;
        a0 a0Var = this.f57546e;
        a0Var.d(mVar, new r(1, -1, null, a0Var.a(j12), a0Var.a(j13)));
        this.J = true;
        s sVar2 = this.f57555p;
        sVar2.getClass();
        sVar2.a(this);
    }

    public final void g() {
        wf.a.i(this.f57560u);
        this.f57562w.getClass();
        this.f57563x.getClass();
    }

    @Override // gf.t
    public final long h(tf.q[] qVarArr, boolean[] zArr, t0[] t0VarArr, boolean[] zArr2, long j11) {
        tf.q qVar;
        g();
        tm.o oVar = this.f57562w;
        y0 y0Var = (y0) oVar.f89493b;
        boolean[] zArr3 = (boolean[]) oVar.f89495d;
        int i5 = this.D;
        for (int i11 = 0; i11 < qVarArr.length; i11++) {
            t0 t0Var = t0VarArr[i11];
            if (t0Var != null && (qVarArr[i11] == null || !zArr[i11])) {
                int i12 = ((j0) t0Var).f57532a;
                wf.a.i(zArr3[i12]);
                this.D--;
                zArr3[i12] = false;
                t0VarArr[i11] = null;
            }
        }
        boolean z11 = !this.B ? j11 == 0 : i5 != 0;
        for (int i13 = 0; i13 < qVarArr.length; i13++) {
            if (t0VarArr[i13] == null && (qVar = qVarArr[i13]) != null) {
                wf.a.i(qVar.length() == 1);
                wf.a.i(qVar.a(0) == 0);
                int iIndexOf = y0Var.f57667b.indexOf(qVar.f());
                if (iIndexOf < 0) {
                    iIndexOf = -1;
                }
                wf.a.i(!zArr3[iIndexOf]);
                this.D++;
                zArr3[iIndexOf] = true;
                t0VarArr[i13] = new j0(this, iIndexOf);
                zArr2[i13] = true;
                if (!z11) {
                    s0 s0Var = this.f57557r[iIndexOf];
                    z11 = (s0Var.m(j11, true) || s0Var.f57630q + s0Var.f57632s == 0) ? false : true;
                }
            }
        }
        if (this.D == 0) {
            this.H = false;
            this.C = false;
            vf.b0 b0Var = this.f57551j;
            if (b0Var.a()) {
                for (s0 s0Var2 : this.f57557r) {
                    s0Var2.f();
                }
                vf.z zVar = b0Var.f92636b;
                wf.a.j(zVar);
                zVar.a(false);
            } else {
                for (s0 s0Var3 : this.f57557r) {
                    s0Var3.l(false);
                }
            }
        } else if (z11) {
            j11 = e(j11);
            for (int i14 = 0; i14 < t0VarArr.length; i14++) {
                if (t0VarArr[i14] != null) {
                    zArr2[i14] = true;
                }
            }
        }
        this.B = true;
        return j11;
    }

    @Override // gf.t
    public final long i() {
        if (!this.C) {
            return -9223372036854775807L;
        }
        if (!this.J && k() <= this.I) {
            return -9223372036854775807L;
        }
        this.C = false;
        return this.F;
    }

    @Override // ke.l
    public final void j(ke.s sVar) {
        this.o.post(new fa.l0(3, this, sVar));
    }

    public final int k() {
        int i5 = 0;
        for (s0 s0Var : this.f57557r) {
            i5 += s0Var.f57630q + s0Var.f57629p;
        }
        return i5;
    }

    @Override // gf.t
    public final void l() throws IOException {
        int iG = this.f57545d.g(this.A);
        vf.b0 b0Var = this.f57551j;
        IOException iOException = b0Var.f92637c;
        if (iOException != null) {
            throw iOException;
        }
        vf.z zVar = b0Var.f92636b;
        if (zVar != null) {
            if (iG == Integer.MIN_VALUE) {
                iG = zVar.f92756a;
            }
            IOException iOException2 = zVar.f92759d;
            if (iOException2 != null && zVar.f92760e > iG) {
                throw iOException2;
            }
        }
        if (this.J && !this.f57560u) {
            throw ParserException.a("Loading finished before preparation is complete.", null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0030  */
    @Override // gf.t
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void m(long j11) {
        long jE;
        long j12;
        int i5;
        g();
        if (w()) {
            return;
        }
        boolean[] zArr = (boolean[]) this.f57562w.f89495d;
        int length = this.f57557r.length;
        int i11 = 0;
        while (i11 < length) {
            s0 s0Var = this.f57557r[i11];
            boolean z11 = zArr[i11];
            p0 p0Var = s0Var.f57616a;
            synchronized (s0Var) {
                try {
                    int i12 = s0Var.f57629p;
                    jE = -1;
                    if (i12 != 0) {
                        long[] jArr = s0Var.n;
                        int i13 = s0Var.f57631r;
                        if (j11 < jArr[i13]) {
                            j12 = j11;
                        } else {
                            j12 = j11;
                            int iG = s0Var.g(i13, (!z11 || (i5 = s0Var.f57632s) == i12) ? i12 : i5 + 1, j12, false);
                            if (iG != -1) {
                                jE = s0Var.e(iG);
                            }
                        }
                    }
                } finally {
                }
            }
            p0Var.a(jE);
            i11++;
            j11 = j12;
        }
    }

    @Override // gf.u0
    public final boolean n(long j11) {
        if (this.J) {
            return false;
        }
        vf.b0 b0Var = this.f57551j;
        if (b0Var.f92637c != null || this.H) {
            return false;
        }
        if (this.f57560u && this.D == 0) {
            return false;
        }
        boolean zD = this.f57553l.d();
        if (b0Var.a()) {
            return zD;
        }
        B();
        return true;
    }

    @Override // ke.l
    public final void o() {
        this.f57559t = true;
        this.o.post(this.f57554m);
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x007c A[RETURN] */
    @Override // gf.t
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long p(long j11, s1 s1Var) {
        g();
        if (!this.f57563x.f()) {
            return 0L;
        }
        ke.r rVarD = this.f57563x.d(j11);
        long j12 = rVarD.f71430a.f71433a;
        long j13 = rVarD.f71431b.f71433a;
        long j14 = s1Var.f54987b;
        long j15 = s1Var.f54986a;
        if (j15 == 0 && j14 == 0) {
            return j11;
        }
        int i5 = wf.v.f94376a;
        long j16 = j11 - j15;
        if (((j15 ^ j11) & (j11 ^ j16)) < 0) {
            j16 = Long.MIN_VALUE;
        }
        long j17 = j11 + j14;
        if (((j14 ^ j17) & (j11 ^ j17)) < 0) {
            j17 = Long.MAX_VALUE;
        }
        boolean z11 = false;
        boolean z12 = j16 <= j12 && j12 <= j17;
        if (j16 <= j13 && j13 <= j17) {
            z11 = true;
        }
        if (!z12 || !z11) {
            if (!z12) {
                return z11 ? j13 : j16;
            }
            return j12;
        }
        if (Math.abs(j12 - j11) <= Math.abs(j13 - j11)) {
            return j12;
        }
    }

    @Override // gf.t
    public final y0 q() {
        g();
        return (y0) this.f57562w.f89493b;
    }

    @Override // gf.t
    public final void r(s sVar, long j11) {
        this.f57555p = sVar;
        this.f57553l.d();
        B();
    }

    @Override // ke.l
    public final ke.v s(int i5, int i11) {
        return A(new k0(i5, false));
    }

    @Override // gf.u0
    public final long t() {
        long jU;
        boolean z11;
        long j11;
        g();
        if (this.J || this.D == 0) {
            return Long.MIN_VALUE;
        }
        if (w()) {
            return this.G;
        }
        if (this.f57561v) {
            int length = this.f57557r.length;
            jU = Long.MAX_VALUE;
            for (int i5 = 0; i5 < length; i5++) {
                tm.o oVar = this.f57562w;
                if (((boolean[]) oVar.f89494c)[i5] && ((boolean[]) oVar.f89495d)[i5]) {
                    s0 s0Var = this.f57557r[i5];
                    synchronized (s0Var) {
                        z11 = s0Var.f57636w;
                    }
                    if (z11) {
                        continue;
                    } else {
                        s0 s0Var2 = this.f57557r[i5];
                        synchronized (s0Var2) {
                            j11 = s0Var2.f57635v;
                        }
                        jU = Math.min(jU, j11);
                    }
                }
            }
        } else {
            jU = Long.MAX_VALUE;
        }
        if (jU == Long.MAX_VALUE) {
            jU = u(false);
        }
        return jU == Long.MIN_VALUE ? this.F : jU;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long u(boolean z11) {
        long j11;
        long jMax = Long.MIN_VALUE;
        for (int i5 = 0; i5 < this.f57557r.length; i5++) {
            if (!z11) {
                tm.o oVar = this.f57562w;
                oVar.getClass();
                if (((boolean[]) oVar.f89495d)[i5]) {
                    s0 s0Var = this.f57557r[i5];
                    synchronized (s0Var) {
                        j11 = s0Var.f57635v;
                    }
                    jMax = Math.max(jMax, j11);
                } else {
                    continue;
                }
            }
        }
        return jMax;
    }

    @Override // gf.u0
    public final void v(long j11) {
    }

    public final boolean w() {
        return this.G != -9223372036854775807L;
    }

    public final void x() {
        fe.k0 k0Var;
        if (this.K || this.f57560u || !this.f57559t || this.f57563x == null) {
            return;
        }
        s0[] s0VarArr = this.f57557r;
        int length = s0VarArr.length;
        int i5 = 0;
        while (true) {
            fe.k0 k0Var2 = null;
            if (i5 >= length) {
                this.f57553l.c();
                int length2 = this.f57557r.length;
                x0[] x0VarArr = new x0[length2];
                boolean[] zArr = new boolean[length2];
                for (int i11 = 0; i11 < length2; i11++) {
                    s0 s0Var = this.f57557r[i11];
                    synchronized (s0Var) {
                        k0Var = s0Var.f57638y ? null : s0Var.f57639z;
                    }
                    k0Var.getClass();
                    String str = k0Var.f54883l;
                    boolean zG = wf.j.g(str);
                    boolean z11 = zG || wf.j.i(str);
                    zArr[i11] = z11;
                    this.f57561v = z11 | this.f57561v;
                    IcyHeaders icyHeaders = this.f57556q;
                    if (icyHeaders != null) {
                        int i12 = icyHeaders.f31497a;
                        if (zG || this.f57558s[i11].f57536b) {
                            Metadata metadata = k0Var.f54881j;
                            Metadata metadata2 = metadata == null ? new Metadata(icyHeaders) : metadata.a(icyHeaders);
                            fe.j0 j0VarA = k0Var.a();
                            j0VarA.f54854i = metadata2;
                            k0Var = new fe.k0(j0VarA);
                        }
                        if (zG && k0Var.f54877f == -1 && k0Var.f54878g == -1 && i12 != -1) {
                            fe.j0 j0VarA2 = k0Var.a();
                            j0VarA2.f54851f = i12;
                            k0Var = new fe.k0(j0VarA2);
                        }
                    }
                    int iD = this.f57544c.d(k0Var);
                    fe.j0 j0VarA3 = k0Var.a();
                    j0VarA3.D = iD;
                    x0VarArr[i11] = new x0(Integer.toString(i11), new fe.k0(j0VarA3));
                }
                this.f57562w = new tm.o(new y0(x0VarArr), zArr);
                this.f57560u = true;
                s sVar = this.f57555p;
                sVar.getClass();
                sVar.b(this);
                return;
            }
            s0 s0Var2 = s0VarArr[i5];
            synchronized (s0Var2) {
                if (!s0Var2.f57638y) {
                    k0Var2 = s0Var2.f57639z;
                }
            }
            if (k0Var2 == null) {
                return;
            } else {
                i5++;
            }
        }
    }

    public final void y(int i5) {
        g();
        tm.o oVar = this.f57562w;
        boolean[] zArr = (boolean[]) oVar.f89496e;
        if (zArr[i5]) {
            return;
        }
        fe.k0 k0Var = ((y0) oVar.f89493b).a(i5).f57658d[0];
        int iF = wf.j.f(k0Var.f54883l);
        long j11 = this.F;
        a0 a0Var = this.f57546e;
        a0Var.b(new r(1, iF, k0Var, a0Var.a(j11), -9223372036854775807L));
        zArr[i5] = true;
    }

    public final void z(int i5) {
        g();
        boolean[] zArr = (boolean[]) this.f57562w.f89494c;
        if (this.H && zArr[i5] && !this.f57557r[i5].i(false)) {
            this.G = 0L;
            this.H = false;
            this.C = true;
            this.F = 0L;
            this.I = 0;
            for (s0 s0Var : this.f57557r) {
                s0Var.l(false);
            }
            s sVar = this.f57555p;
            sVar.getClass();
            sVar.a(this);
        }
    }
}
