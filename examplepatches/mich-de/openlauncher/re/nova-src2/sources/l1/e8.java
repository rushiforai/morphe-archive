package l1;

/* loaded from: classes2.dex */
public final class e8 {

    /* renamed from: a, reason: collision with root package name */
    public static final e8 f73260a = new e8();

    public final void a(b2.t tVar, float f11, long j11, p1.o oVar, int i5) {
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1498258020);
        if ((((tVar2.f(tVar) ? 4 : 2) | i5 | 176) & 147) == 146 && tVar2.E()) {
            tVar2.V();
        } else {
            tVar2.X();
            if ((i5 & 1) == 0 || tVar2.B()) {
                f11 = o1.u.f79173a;
                j11 = g1.e(tVar2, 26);
            } else {
                tVar2.V();
            }
            tVar2.q();
            k0.p.a(androidx.compose.foundation.a.b(androidx.compose.foundation.layout.e.g(androidx.compose.foundation.layout.e.e(tVar, 1.0f), f11), j11, i2.r0.f61135a), tVar2, 0);
        }
        float f12 = f11;
        long j12 = j11;
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new d8(this, tVar, f12, j12, i5);
        }
    }
}
