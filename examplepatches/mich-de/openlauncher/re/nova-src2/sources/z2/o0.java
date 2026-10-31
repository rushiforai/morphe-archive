package z2;

import androidx.compose.ui.node.Owner;
import b3.o2;

/* loaded from: classes.dex */
public final class o0 extends h1 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f98124b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f98125c;

    public /* synthetic */ o0(Object obj, int i5) {
        this.f98124b = i5;
        this.f98125c = obj;
    }

    @Override // z2.h1
    public float b(p pVar) {
        switch (this.f98124b) {
            case 0:
                if (pVar.b() != null) {
                    return ((Number) pVar.b().invoke(this, Float.valueOf(Float.NaN))).floatValue();
                }
                b3.y0 y0Var = (b3.y0) this.f98125c;
                if (y0Var.f17407k) {
                    return Float.NaN;
                }
                b3.y0 y0Var2 = y0Var;
                while (true) {
                    o2 o2Var = y0Var2.f17409m;
                    float fB = o2Var != null ? o2Var.b(pVar) : Float.NaN;
                    if (!Float.isNaN(fB)) {
                        y0Var2.W(y0Var.d0(), pVar);
                        return pVar.a(fB, y0Var2.b0(), y0Var.b0());
                    }
                    b3.y0 y0VarF0 = y0Var2.f0();
                    if (y0VarF0 == null) {
                        y0Var2.W(y0Var.d0(), pVar);
                        return Float.NaN;
                    }
                    y0Var2 = y0VarF0;
                }
            default:
                return super.b(pVar);
        }
    }

    @Override // z2.h1
    public final y3.n f() {
        switch (this.f98124b) {
            case 0:
                return ((b3.y0) this.f98125c).getLayoutDirection();
            default:
                return ((Owner) this.f98125c).getLayoutDirection();
        }
    }

    @Override // z2.h1
    public final int g() {
        switch (this.f98124b) {
            case 0:
                return ((b3.y0) this.f98125c).Q();
            default:
                return ((Owner) this.f98125c).getRoot().getWidth();
        }
    }

    @Override // y3.c
    public final float getDensity() {
        switch (this.f98124b) {
            case 0:
                return ((b3.y0) this.f98125c).getDensity();
            default:
                return ((Owner) this.f98125c).getDensity().getDensity();
        }
    }

    @Override // y3.c
    public final float getFontScale() {
        switch (this.f98124b) {
            case 0:
                return ((b3.y0) this.f98125c).getFontScale();
            default:
                return ((Owner) this.f98125c).getDensity().getFontScale();
        }
    }
}
