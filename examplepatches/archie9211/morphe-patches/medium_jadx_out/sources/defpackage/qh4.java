package defpackage;

import android.graphics.BlurMaskFilter;
import android.graphics.Canvas;
import android.graphics.MaskFilter;
import android.graphics.Matrix;
import android.graphics.Path;
import android.graphics.RectF;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qh4 implements qm3, nn0, v72 {
    public final Path a;
    public final ao6 b;
    public final tn0 c;
    public final boolean d;
    public final ArrayList e;
    public final zu1 f;
    public final zu1 g;
    public final rc7 h;
    public final zu1 i;
    public float j;

    public qh4(rc7 rc7Var, tn0 tn0Var, v3c v3cVar) {
        Path path = new Path();
        this.a = path;
        this.b = new ao6(1, 0);
        this.e = new ArrayList();
        this.c = tn0Var;
        pu puVar = v3cVar.d;
        pu puVar2 = v3cVar.c;
        this.d = v3cVar.e;
        this.h = rc7Var;
        if (tn0Var.j() != null) {
            zu1 zu1VarW = ((qu) tn0Var.j().a).w();
            this.i = zu1VarW;
            zu1VarW.a(this);
            tn0Var.d(zu1VarW);
        }
        if (puVar2 == null) {
            this.f = null;
            this.g = null;
            return;
        }
        path.setFillType(v3cVar.b);
        rn0 rn0VarW = puVar2.w();
        this.f = (zu1) rn0VarW;
        rn0VarW.a(this);
        tn0Var.d(rn0VarW);
        rn0 rn0VarW2 = puVar.w();
        this.g = (zu1) rn0VarW2;
        rn0VarW2.a(this);
        tn0Var.d(rn0VarW2);
    }

    @Override // defpackage.nn0
    public final void a() {
        this.h.invalidateSelf();
    }

    @Override // defpackage.v72
    public final void b(List list, List list2) {
        for (int i = 0; i < list2.size(); i++) {
            v72 v72Var = (v72) list2.get(i);
            if (v72Var instanceof l59) {
                this.e.add((l59) v72Var);
            }
        }
    }

    @Override // defpackage.qm3
    public final void c(RectF rectF, Matrix matrix, boolean z) {
        Path path = this.a;
        path.reset();
        int i = 0;
        while (true) {
            ArrayList arrayList = this.e;
            if (i >= arrayList.size()) {
                path.computeBounds(rectF, false);
                rectF.set(rectF.left - 1.0f, rectF.top - 1.0f, rectF.right + 1.0f, rectF.bottom + 1.0f);
                return;
            } else {
                path.addPath(((l59) arrayList.get(i)).h(), matrix);
                i++;
            }
        }
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$PrimitiveArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    @Override // defpackage.qm3
    public final void e(Canvas canvas, Matrix matrix, int i, bn3 bn3Var) {
        MaskFilter maskFilter;
        if (this.d) {
            return;
        }
        t90 t90Var = xn6.a;
        zu1 zu1Var = this.f;
        zu1Var.getClass();
        float fIntValue = ((Integer) this.g.d()).intValue() / 100.0f;
        int iC = (a18.c((int) (i * fIntValue)) << 24) | (zu1Var.k(zu1Var.c.d(), zu1Var.b()) & 16777215);
        ao6 ao6Var = this.b;
        ao6Var.setColor(iC);
        zu1 zu1Var2 = this.i;
        if (zu1Var2 != null) {
            float fFloatValue = ((Float) zu1Var2.d()).floatValue();
            if (fFloatValue == 0.0f) {
                ao6Var.setMaskFilter(null);
            } else if (fFloatValue != this.j) {
                tn0 tn0Var = this.c;
                if (tn0Var.A == fFloatValue) {
                    maskFilter = tn0Var.B;
                } else {
                    BlurMaskFilter blurMaskFilter = new BlurMaskFilter(fFloatValue / 2.0f, BlurMaskFilter.Blur.NORMAL);
                    tn0Var.B = blurMaskFilter;
                    tn0Var.A = fFloatValue;
                    maskFilter = blurMaskFilter;
                }
                ao6Var.setMaskFilter(maskFilter);
            }
            this.j = fFloatValue;
        }
        if (bn3Var != null) {
            bn3Var.a((int) (fIntValue * 255.0f), ao6Var);
        } else {
            ao6Var.clearShadowLayer();
        }
        Path path = this.a;
        path.reset();
        int i2 = 0;
        while (true) {
            ArrayList arrayList = this.e;
            if (i2 >= arrayList.size()) {
                canvas.drawPath(path, ao6Var);
                t90 t90Var2 = xn6.a;
                return;
            } else {
                path.addPath(((l59) arrayList.get(i2)).h(), matrix);
                i2++;
            }
        }
    }
}
