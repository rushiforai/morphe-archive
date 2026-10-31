package p0;

import g0.d1;
import java.util.concurrent.CancellationException;
import kotlin.coroutines.Continuation;

/* loaded from: classes2.dex */
public final class a implements u2.a {

    /* renamed from: a, reason: collision with root package name */
    public final y f81128a;

    public a(y yVar) {
        d1 d1Var = d1.f56493a;
        this.f81128a = yVar;
    }

    @Override // u2.a
    public final Object b(long j11, long j12, Continuation continuation) {
        d1 d1Var = d1.f56493a;
        d1 d1Var2 = d1.f56493a;
        return new y3.r(y3.r.b(j12, 0.0f, 0.0f, 1));
    }

    @Override // u2.a
    public final long g(int i5, long j11) {
        d1 d1Var = d1.f56493a;
        if (i5 != 1) {
            return 0L;
        }
        y yVar = this.f81128a;
        ox.q qVar = yVar.f81230d;
        ox.q qVar2 = yVar.f81230d;
        if (Math.abs(qVar.e()) <= 1.0E-6d) {
            return 0L;
        }
        float fE = qVar2.e() * yVar.n();
        float f11 = ((yVar.l().f81190b + yVar.l().f81191c) * (-Math.signum(qVar2.e()))) + fE;
        if (qVar2.e() > 0.0f) {
            f11 = fE;
            fE = f11;
        }
        float f12 = -yVar.f81237k.a(-kotlin.ranges.a.d0(Float.intBitsToFloat((int) (j11 >> 32)), fE, f11));
        d1 d1Var2 = d1.f56493a;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 & 4294967295L));
        return (Float.floatToRawIntBits(fIntBitsToFloat) & 4294967295L) | (Float.floatToRawIntBits(f12) << 32);
    }

    @Override // u2.a
    public final long m(int i5, long j11, long j12) {
        if (i5 != 2) {
            return 0L;
        }
        d1 d1Var = d1.f56493a;
        if (Float.intBitsToFloat((int) (j12 >> 32)) == 0.0f) {
            return 0L;
        }
        throw new CancellationException("Scroll cancelled");
    }
}
