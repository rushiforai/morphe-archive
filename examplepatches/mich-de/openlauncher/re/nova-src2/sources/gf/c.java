package gf;

import com.google.android.exoplayer2.source.ClippingMediaSource$IllegalClippingException;
import com.google.android.gms.internal.measurement.ke;
import fe.s1;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class c implements t, s {

    /* renamed from: a, reason: collision with root package name */
    public final t f57457a;

    /* renamed from: b, reason: collision with root package name */
    public s f57458b;

    /* renamed from: c, reason: collision with root package name */
    public b[] f57459c = new b[0];

    /* renamed from: d, reason: collision with root package name */
    public long f57460d;

    /* renamed from: e, reason: collision with root package name */
    public long f57461e;

    /* renamed from: f, reason: collision with root package name */
    public long f57462f;

    /* renamed from: g, reason: collision with root package name */
    public ClippingMediaSource$IllegalClippingException f57463g;

    public c(t tVar, boolean z11, long j11, long j12) {
        this.f57457a = tVar;
        this.f57460d = z11 ? j11 : -9223372036854775807L;
        this.f57461e = j11;
        this.f57462f = j12;
    }

    @Override // gf.s
    public final void a(u0 u0Var) {
        s sVar = this.f57458b;
        sVar.getClass();
        sVar.a(this);
    }

    @Override // gf.s
    public final void b(t tVar) {
        if (this.f57463g != null) {
            return;
        }
        s sVar = this.f57458b;
        sVar.getClass();
        sVar.b(this);
    }

    @Override // gf.u0
    public final boolean c() {
        return this.f57457a.c();
    }

    @Override // gf.u0
    public final long d() {
        long jD = this.f57457a.d();
        if (jD != Long.MIN_VALUE) {
            long j11 = this.f57462f;
            if (j11 == Long.MIN_VALUE || jD < j11) {
                return jD;
            }
        }
        return Long.MIN_VALUE;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0033  */
    @Override // gf.t
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long e(long j11) {
        this.f57460d = -9223372036854775807L;
        boolean z11 = false;
        for (b bVar : this.f57459c) {
            if (bVar != null) {
                bVar.f57455b = false;
            }
        }
        long jE = this.f57457a.e(j11);
        if (jE == j11) {
            z11 = true;
        } else if (jE >= this.f57461e) {
            long j12 = this.f57462f;
            if (j12 == Long.MIN_VALUE || jE <= j12) {
            }
        }
        wf.a.i(z11);
        return jE;
    }

    public final boolean f() {
        return this.f57460d != -9223372036854775807L;
    }

    /* JADX WARN: Failed to find 'out' block for switch in B:69:0x00e2. Please report as an issue. */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0101  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x011f  */
    @Override // gf.t
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long h(tf.q[] qVarArr, boolean[] zArr, t0[] t0VarArr, boolean[] zArr2, long j11) {
        long j12;
        ke keVarD;
        int iC;
        this.f57459c = new b[t0VarArr.length];
        t0[] t0VarArr2 = new t0[t0VarArr.length];
        int i5 = 0;
        while (true) {
            t0 t0Var = null;
            if (i5 >= t0VarArr.length) {
                break;
            }
            b[] bVarArr = this.f57459c;
            b bVar = (b) t0VarArr[i5];
            bVarArr[i5] = bVar;
            if (bVar != null) {
                t0Var = bVar.f57454a;
            }
            t0VarArr2[i5] = t0Var;
            i5++;
        }
        long jH = this.f57457a.h(qVarArr, zArr, t0VarArr2, zArr2, j11);
        boolean z11 = true;
        if (f()) {
            long j13 = this.f57461e;
            if (j11 != j13 || j13 == 0) {
                j12 = -9223372036854775807L;
            } else {
                for (tf.q qVar : qVarArr) {
                    if (qVar != null) {
                        fe.k0 k0VarI = qVar.i();
                        String str = k0VarI.f54883l;
                        String str2 = k0VarI.f54880i;
                        ArrayList arrayList = wf.j.f94334a;
                        if (str != null) {
                            switch (str) {
                                case "audio/mp4a-latm":
                                    if (str2 != null && (keVarD = wf.j.d(str2)) != null && (iC = keVarD.c()) != 0 && iC != 16) {
                                        break;
                                    } else {
                                        break;
                                    }
                                    break;
                            }
                        }
                        j12 = jH;
                    }
                }
                j12 = -9223372036854775807L;
            }
        }
        this.f57460d = j12;
        if (jH != j11) {
            if (jH >= this.f57461e) {
                long j14 = this.f57462f;
                if (j14 != Long.MIN_VALUE && jH > j14) {
                    z11 = false;
                }
            }
        }
        wf.a.i(z11);
        for (int i11 = 0; i11 < t0VarArr.length; i11++) {
            t0 t0Var2 = t0VarArr2[i11];
            if (t0Var2 == null) {
                this.f57459c[i11] = null;
            } else {
                b[] bVarArr2 = this.f57459c;
                b bVar2 = bVarArr2[i11];
                if (bVar2 == null || bVar2.f57454a != t0Var2) {
                    bVarArr2[i11] = new b(this, t0Var2);
                }
            }
            t0VarArr[i11] = this.f57459c[i11];
        }
        return jH;
    }

    @Override // gf.t
    public final long i() {
        if (f()) {
            long j11 = this.f57460d;
            this.f57460d = -9223372036854775807L;
            long jI = i();
            return jI != -9223372036854775807L ? jI : j11;
        }
        long jI2 = this.f57457a.i();
        if (jI2 == -9223372036854775807L) {
            return -9223372036854775807L;
        }
        wf.a.i(jI2 >= this.f57461e);
        long j12 = this.f57462f;
        wf.a.i(j12 == Long.MIN_VALUE || jI2 <= j12);
        return jI2;
    }

    @Override // gf.t
    public final void l() throws ClippingMediaSource$IllegalClippingException {
        ClippingMediaSource$IllegalClippingException clippingMediaSource$IllegalClippingException = this.f57463g;
        if (clippingMediaSource$IllegalClippingException != null) {
            throw clippingMediaSource$IllegalClippingException;
        }
        this.f57457a.l();
    }

    @Override // gf.t
    public final void m(long j11) {
        this.f57457a.m(j11);
    }

    @Override // gf.u0
    public final boolean n(long j11) {
        return this.f57457a.n(j11);
    }

    @Override // gf.t
    public final long p(long j11, s1 s1Var) {
        long j12 = this.f57461e;
        if (j11 == j12) {
            return j12;
        }
        long jI = wf.v.i(s1Var.f54986a, 0L, j11 - j12);
        long j13 = s1Var.f54987b;
        long j14 = this.f57462f;
        long jI2 = wf.v.i(j13, 0L, j14 == Long.MIN_VALUE ? Long.MAX_VALUE : j14 - j11);
        if (jI != s1Var.f54986a || jI2 != s1Var.f54987b) {
            s1Var = new s1(jI, jI2);
        }
        return this.f57457a.p(j11, s1Var);
    }

    @Override // gf.t
    public final y0 q() {
        return this.f57457a.q();
    }

    @Override // gf.t
    public final void r(s sVar, long j11) {
        this.f57458b = sVar;
        this.f57457a.r(this, j11);
    }

    @Override // gf.u0
    public final long t() {
        long jT = this.f57457a.t();
        if (jT != Long.MIN_VALUE) {
            long j11 = this.f57462f;
            if (j11 == Long.MIN_VALUE || jT < j11) {
                return jT;
            }
        }
        return Long.MIN_VALUE;
    }

    @Override // gf.u0
    public final void v(long j11) {
        this.f57457a.v(j11);
    }
}
