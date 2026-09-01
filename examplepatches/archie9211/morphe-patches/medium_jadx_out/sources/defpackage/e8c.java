package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class e8c extends q28 implements xl3, od5 {
    public y7c o;
    public c8c p;

    @Override // defpackage.od5
    public final void X(eh8 eh8Var) {
        zwa zwaVar;
        try {
            long jD = eh8Var.d(0L);
            int i = (int) (jD >> 32);
            int i2 = (int) (jD & 4294967295L);
            zwaVar = new zwa(Float.intBitsToFloat(i), Float.intBitsToFloat(i2), Float.intBitsToFloat(i) + ((int) (eh8Var.c >> 32)), Float.intBitsToFloat(i2) + ((int) (4294967295L & eh8Var.c)));
        } catch (IllegalStateException unused) {
            zwaVar = zwa.e;
        }
        y7c y7cVar = this.o;
        y7cVar.getClass();
        if (zwaVar.equals(y7cVar.h)) {
            return;
        }
        y7cVar.h = zwaVar;
        y7cVar.a();
    }

    @Override // defpackage.xl3
    public final void e0(cq6 cq6Var) {
        g61 g61Var = cq6Var.a;
        c8c c8cVar = this.p;
        y7c y7cVar = this.o;
        uq uqVar = c8cVar.i;
        float[] fArr = c8cVar.f;
        y7cVar.getClass();
        if (y7cVar.g.f() || y7cVar.h.f()) {
            return;
        }
        float fFloatValue = ((Number) c8cVar.e.d()).floatValue();
        float f = y7cVar.e;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (y7cVar.f >> 32)) + (f * fFloatValue) + ((-f) / 2.0f);
        pk7.d(fArr);
        pk7.h(fArr, Float.intBitsToFloat((int) (y7cVar.f >> 32)), Float.intBitsToFloat((int) (y7cVar.f & 4294967295L)));
        pk7.f(fArr, 15.0f);
        pk7.h(fArr, -Float.intBitsToFloat((int) (y7cVar.f >> 32)), -Float.intBitsToFloat((int) (y7cVar.f & 4294967295L)));
        pk7.h(fArr, fIntBitsToFloat, 0.0f);
        uqVar.h(n01.a(pk7.b(c8cVar.g, fArr), pk7.b(c8cVar.h, fArr), c8cVar.b, c8cVar.c));
        zwa zwaVarL = lk7.l(0L, g61Var.b.B());
        e61 e61VarX = g61Var.b.x();
        try {
            e61VarX.s(zwaVarL, c8cVar.j);
            cq6Var.a();
            e61VarX.j(zwaVarL, uqVar);
        } finally {
            e61VarX.q();
        }
    }

    @Override // defpackage.xl3
    public final void L() {
    }
}
