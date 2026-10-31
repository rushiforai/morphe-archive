package gf;

import fe.x1;
import fe.y1;
import fe.z1;

/* loaded from: classes3.dex */
public final class p extends z1 {

    /* renamed from: b, reason: collision with root package name */
    public final fe.u0 f57592b;

    public p(fe.u0 u0Var) {
        this.f57592b = u0Var;
    }

    @Override // fe.z1
    public final int b(Object obj) {
        return obj == o.f57579e ? 0 : -1;
    }

    @Override // fe.z1
    public final x1 f(int i5, x1 x1Var, boolean z11) {
        x1Var.h(z11 ? 0 : null, z11 ? o.f57579e : null, 0, -9223372036854775807L, 0L, hf.b.f59845f, true);
        return x1Var;
    }

    @Override // fe.z1
    public final int h() {
        return 1;
    }

    @Override // fe.z1
    public final Object l(int i5) {
        return o.f57579e;
    }

    @Override // fe.z1
    public final y1 m(int i5, y1 y1Var, long j11) {
        y1Var.b(y1.f55095q, this.f57592b, -9223372036854775807L, -9223372036854775807L, -9223372036854775807L, false, true, null, 0L, -9223372036854775807L, 0, 0, 0L);
        y1Var.f55108k = true;
        return y1Var;
    }

    @Override // fe.z1
    public final int o() {
        return 1;
    }
}
