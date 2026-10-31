package b3;

/* loaded from: classes.dex */
public interface e0 extends n {
    default int maxIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        return new d0(this, 0).a(new z2.x(tVar, tVar.getLayoutDirection()), new v1(sVar, x1.f17400b, y1.f17411b, 0), y3.b.b(i5, 0, 13)).getHeight();
    }

    default int maxIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        return mo25measure3p2s80s(new z2.x(tVar, tVar.getLayoutDirection()), new v1(sVar, x1.f17400b, y1.f17410a, 0), y3.b.b(0, i5, 7)).getWidth();
    }

    /* renamed from: measure-3p2s80s */
    z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11);

    default int minIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        return new d0(this, 1).a(new z2.x(tVar, tVar.getLayoutDirection()), new v1(sVar, x1.f17399a, y1.f17411b, 0), y3.b.b(i5, 0, 13)).getHeight();
    }

    default int minIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        return new d0(this, 2).a(new z2.x(tVar, tVar.getLayoutDirection()), new v1(sVar, x1.f17399a, y1.f17410a, 0), y3.b.b(0, i5, 7)).getWidth();
    }
}
