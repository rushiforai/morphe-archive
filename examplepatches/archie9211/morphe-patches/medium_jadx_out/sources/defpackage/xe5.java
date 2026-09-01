package defpackage;

import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.PointF;
import android.graphics.RadialGradient;
import android.graphics.RectF;
import android.graphics.Shader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xe5 extends ao0 {
    public final boolean p;
    public final ab7 q;
    public final ab7 r;
    public final RectF s;
    public final ze5 t;
    public final int u;
    public final se5 v;
    public final se5 w;
    public final se5 x;

    public xe5(rc7 rc7Var, tn0 tn0Var, we5 we5Var) {
        super(rc7Var, tn0Var, we5Var.g.toPaintCap(), we5Var.h.toPaintJoin(), we5Var.i, we5Var.c, we5Var.f, we5Var.j, we5Var.k);
        Object obj = null;
        this.q = new ab7(obj);
        this.r = new ab7(obj);
        this.s = new RectF();
        this.t = we5Var.a;
        this.p = we5Var.l;
        this.u = (int) (rc7Var.a.b() / 32.0f);
        rn0 rn0VarW = we5Var.b.w();
        this.v = (se5) rn0VarW;
        rn0VarW.a(this);
        tn0Var.d(rn0VarW);
        rn0 rn0VarW2 = we5Var.d.w();
        this.w = (se5) rn0VarW2;
        rn0VarW2.a(this);
        tn0Var.d(rn0VarW2);
        rn0 rn0VarW3 = we5Var.e.w();
        this.x = (se5) rn0VarW3;
        rn0VarW3.a(this);
        tn0Var.d(rn0VarW3);
    }

    public final int d() {
        float f = this.w.d;
        float f2 = this.u;
        int iRound = Math.round(f * f2);
        int iRound2 = Math.round(this.x.d * f2);
        int iRound3 = Math.round(this.v.d * f2);
        int i = iRound != 0 ? 527 * iRound : 17;
        if (iRound2 != 0) {
            i = i * 31 * iRound2;
        }
        return iRound3 != 0 ? i * 31 * iRound3 : i;
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
    @Override // defpackage.ao0, defpackage.qm3
    public final void e(Canvas canvas, Matrix matrix, int i, bn3 bn3Var) {
        Shader radialGradient;
        if (this.p) {
            return;
        }
        c(this.s, matrix, false);
        ze5 ze5Var = this.t;
        ze5 ze5Var2 = ze5.LINEAR;
        se5 se5Var = this.v;
        se5 se5Var2 = this.x;
        se5 se5Var3 = this.w;
        if (ze5Var == ze5Var2) {
            long jD = d();
            ab7 ab7Var = this.q;
            radialGradient = (LinearGradient) ab7Var.d(jD);
            if (radialGradient == null) {
                PointF pointF = (PointF) se5Var3.d();
                PointF pointF2 = (PointF) se5Var2.d();
                re5 re5Var = (re5) se5Var.d();
                radialGradient = new LinearGradient(pointF.x, pointF.y, pointF2.x, pointF2.y, re5Var.b, re5Var.a, Shader.TileMode.CLAMP);
                ab7Var.i(jD, radialGradient);
            }
        } else {
            long jD2 = d();
            ab7 ab7Var2 = this.r;
            radialGradient = (RadialGradient) ab7Var2.d(jD2);
            if (radialGradient == null) {
                PointF pointF3 = (PointF) se5Var3.d();
                PointF pointF4 = (PointF) se5Var2.d();
                re5 re5Var2 = (re5) se5Var.d();
                int[] iArr = re5Var2.b;
                float[] fArr = re5Var2.a;
                radialGradient = new RadialGradient(pointF3.x, pointF3.y, (float) Math.hypot(pointF4.x - r9, pointF4.y - r10), iArr, fArr, Shader.TileMode.CLAMP);
                ab7Var2.i(jD2, radialGradient);
            }
        }
        this.i.setShader(radialGradient);
        super.e(canvas, matrix, i, bn3Var);
    }
}
