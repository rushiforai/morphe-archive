package p0;

import p1.s2;

/* loaded from: classes2.dex */
public final class j implements g0.c {

    /* renamed from: b, reason: collision with root package name */
    public final y f81167b;

    /* renamed from: c, reason: collision with root package name */
    public final g0.c f81168c;

    public j(y yVar, g0.c cVar) {
        this.f81167b = yVar;
        this.f81168c = cVar;
    }

    @Override // g0.c
    public final float a(float f11, float f12, float f13) {
        float fA = this.f81168c.a(f11, f12, f13);
        boolean z11 = false;
        if (f11 <= 0.0f ? f11 + f12 <= 0.0f : f11 + f12 > f13) {
            z11 = true;
        }
        float fAbs = Math.abs(fA);
        y yVar = this.f81167b;
        if (fAbs == 0.0f || !z11) {
            if (Math.abs(yVar.f81232f) < 1.0E-6d) {
                return 0.0f;
            }
            float fO = yVar.f81232f * (-1.0f);
            if (((Boolean) ((s2) yVar.G).getValue()).booleanValue()) {
                fO += yVar.o();
            }
            return kotlin.ranges.a.d0(fO, -f13, f13);
        }
        float fO2 = yVar.f81232f * (-1);
        while (fA > 0.0f && fO2 < fA) {
            fO2 += yVar.o();
        }
        while (fA < 0.0f && fO2 > fA) {
            fO2 -= yVar.o();
        }
        return fO2;
    }
}
