package fe;

import com.google.android.exoplayer2.ExoPlaybackException;
import io.sentry.e3;

/* loaded from: classes3.dex */
public abstract class c implements n1 {

    /* renamed from: a, reason: collision with root package name */
    public final int f54720a;

    /* renamed from: c, reason: collision with root package name */
    public r1 f54722c;

    /* renamed from: d, reason: collision with root package name */
    public int f54723d;

    /* renamed from: e, reason: collision with root package name */
    public ge.m f54724e;

    /* renamed from: f, reason: collision with root package name */
    public int f54725f;

    /* renamed from: g, reason: collision with root package name */
    public gf.t0 f54726g;

    /* renamed from: h, reason: collision with root package name */
    public k0[] f54727h;

    /* renamed from: i, reason: collision with root package name */
    public long f54728i;

    /* renamed from: k, reason: collision with root package name */
    public boolean f54730k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f54731l;

    /* renamed from: b, reason: collision with root package name */
    public final e3 f54721b = new e3(13, (byte) 0);

    /* renamed from: j, reason: collision with root package name */
    public long f54729j = Long.MIN_VALUE;

    public c(int i5) {
        this.f54720a = i5;
    }

    public static int e(int i5, int i11, int i12) {
        return i5 | i11 | i12 | 128;
    }

    @Override // fe.n1
    public void b(int i5, Object obj) {
    }

    public final ExoPlaybackException f(Exception exc, k0 k0Var, boolean z11, int i5) {
        int iX;
        if (k0Var == null || this.f54731l) {
            iX = 4;
        } else {
            this.f54731l = true;
            try {
                iX = x(k0Var) & 7;
            } catch (ExoPlaybackException unused) {
            } finally {
                this.f54731l = false;
            }
        }
        return new ExoPlaybackException(1, exc, i5, h(), this.f54723d, k0Var, k0Var == null ? 4 : iX, z11);
    }

    public wf.i g() {
        return null;
    }

    public abstract String h();

    public final boolean i() {
        return this.f54729j == Long.MIN_VALUE;
    }

    public abstract boolean j();

    public abstract boolean k();

    public abstract void l();

    public void m(boolean z11, boolean z12) {
    }

    public abstract void n(long j11, boolean z11);

    public void o() {
    }

    public void p() {
    }

    public void q() {
    }

    public abstract void r(k0[] k0VarArr, long j11, long j12);

    public final int s(e3 e3Var, ie.f fVar, int i5) {
        gf.t0 t0Var = this.f54726g;
        t0Var.getClass();
        int iE = t0Var.e(e3Var, fVar, i5);
        if (iE == -4) {
            if (fVar.d(4)) {
                this.f54729j = Long.MIN_VALUE;
                return this.f54730k ? -4 : -3;
            }
            long j11 = fVar.f61582f + this.f54728i;
            fVar.f61582f = j11;
            this.f54729j = Math.max(this.f54729j, j11);
            return iE;
        }
        if (iE == -5) {
            k0 k0Var = (k0) e3Var.f67209c;
            k0Var.getClass();
            long j12 = k0Var.f54885p;
            if (j12 != Long.MAX_VALUE) {
                j0 j0VarA = k0Var.a();
                j0VarA.o = j12 + this.f54728i;
                e3Var.f67209c = new k0(j0VarA);
            }
        }
        return iE;
    }

    public abstract void t(long j11, long j12);

    public final void u(k0[] k0VarArr, gf.t0 t0Var, long j11, long j12) {
        wf.a.i(!this.f54730k);
        this.f54726g = t0Var;
        if (this.f54729j == Long.MIN_VALUE) {
            this.f54729j = j11;
        }
        this.f54727h = k0VarArr;
        this.f54728i = j12;
        r(k0VarArr, j11, j12);
    }

    public final void v() {
        wf.a.i(this.f54725f == 0);
        this.f54721b.h();
        o();
    }

    public void w(float f11, float f12) {
    }

    public abstract int x(k0 k0Var);

    public int y() {
        return 0;
    }
}
