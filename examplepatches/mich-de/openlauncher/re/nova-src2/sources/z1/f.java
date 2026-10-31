package z1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public j f97919a;

    /* renamed from: b, reason: collision with root package name */
    public long f97920b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f97921c;

    /* renamed from: d, reason: collision with root package name */
    public int f97922d;

    public f(long j11, j jVar) {
        int iA;
        int iNumberOfTrailingZeros;
        this.f97919a = jVar;
        this.f97920b = j11;
        t70.a0 a0Var = k.f97941a;
        if (j11 != 0) {
            j jVarD = d();
            long j12 = jVarD.f97939c;
            long[] jArr = jVarD.f97940d;
            if (jArr != null) {
                j11 = jArr[0];
            } else {
                long j13 = jVarD.f97938b;
                if (j13 != 0) {
                    iNumberOfTrailingZeros = Long.numberOfTrailingZeros(j13);
                } else {
                    long j14 = jVarD.f97937a;
                    if (j14 != 0) {
                        j12 += 64;
                        iNumberOfTrailingZeros = Long.numberOfTrailingZeros(j14);
                    }
                }
                j11 = iNumberOfTrailingZeros + j12;
            }
            synchronized (k.f97943c) {
                iA = k.f97946f.a(j11);
            }
        } else {
            iA = -1;
        }
        this.f97922d = iA;
    }

    public static void q(f fVar) {
        k.f97942b.u(fVar);
    }

    public final void a() {
        synchronized (k.f97943c) {
            b();
            p();
            Unit unit = Unit.f71706a;
        }
    }

    public void b() {
        k.f97944d = k.f97944d.c(g());
    }

    public void c() {
        this.f97921c = true;
        synchronized (k.f97943c) {
            o();
            Unit unit = Unit.f71706a;
        }
    }

    public j d() {
        return this.f97919a;
    }

    public abstract Function1 e();

    public abstract boolean f();

    public long g() {
        return this.f97920b;
    }

    public int h() {
        return 0;
    }

    public abstract Function1 i();

    public final f j() {
        x7.u uVar = k.f97942b;
        f fVar = (f) uVar.h();
        uVar.u(this);
        return fVar;
    }

    public abstract void k();

    public abstract void l();

    public abstract void m();

    public abstract void n(z zVar);

    public final void o() {
        int i5 = this.f97922d;
        if (i5 >= 0) {
            k.u(i5);
            this.f97922d = -1;
        }
    }

    public void p() {
        o();
    }

    public void r(j jVar) {
        this.f97919a = jVar;
    }

    public void s(long j11) {
        this.f97920b = j11;
    }

    public void t(int i5) {
        throw new IllegalStateException("Updating write count is not supported for this snapshot");
    }

    public abstract f u(Function1 function1);
}
