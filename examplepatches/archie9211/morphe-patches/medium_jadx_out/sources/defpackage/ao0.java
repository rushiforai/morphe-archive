package defpackage;

import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PathMeasure;
import android.graphics.RectF;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ao0 implements nn0, v72, qm3 {
    public final rc7 e;
    public final tn0 f;
    public final float[] h;
    public final ao6 i;
    public final zu1 j;
    public final zu1 k;
    public final ArrayList l;
    public final zu1 m;
    public final zu1 n;
    public float o;
    public final PathMeasure a = new PathMeasure();
    public final Path b = new Path();
    public final Path c = new Path();
    public final RectF d = new RectF();
    public final ArrayList g = new ArrayList();

    public ao0(rc7 rc7Var, tn0 tn0Var, Paint.Cap cap, Paint.Join join, float f, pu puVar, qu quVar, ArrayList arrayList, qu quVar2) {
        ao6 ao6Var = new ao6(1, 0);
        this.i = ao6Var;
        this.o = 0.0f;
        this.e = rc7Var;
        this.f = tn0Var;
        ao6Var.setStyle(Paint.Style.STROKE);
        ao6Var.setStrokeCap(cap);
        ao6Var.setStrokeJoin(join);
        ao6Var.setStrokeMiter(f);
        this.k = (zu1) puVar.w();
        this.j = quVar.w();
        if (quVar2 == null) {
            this.m = null;
        } else {
            this.m = quVar2.w();
        }
        this.l = new ArrayList(arrayList.size());
        this.h = new float[arrayList.size()];
        for (int i = 0; i < arrayList.size(); i++) {
            this.l.add(((qu) arrayList.get(i)).w());
        }
        tn0Var.d(this.k);
        tn0Var.d(this.j);
        for (int i2 = 0; i2 < this.l.size(); i2++) {
            tn0Var.d((rn0) this.l.get(i2));
        }
        rn0 rn0Var = this.m;
        if (rn0Var != null) {
            tn0Var.d(rn0Var);
        }
        this.k.a(this);
        this.j.a(this);
        for (int i3 = 0; i3 < arrayList.size(); i3++) {
            ((rn0) this.l.get(i3)).a(this);
        }
        zu1 zu1Var = this.m;
        if (zu1Var != null) {
            zu1Var.a(this);
        }
        if (tn0Var.j() != null) {
            zu1 zu1VarW = ((qu) tn0Var.j().a).w();
            this.n = zu1VarW;
            zu1VarW.a(this);
            tn0Var.d(zu1VarW);
        }
    }

    @Override // defpackage.nn0
    public final void a() {
        this.e.invalidateSelf();
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0053  */
    @Override // defpackage.v72
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b(java.util.List r8, java.util.List r9) {
        /*
            r7 = this;
            java.util.ArrayList r8 = (java.util.ArrayList) r8
            int r0 = r8.size()
            int r0 = r0 + (-1)
            r1 = 0
            r2 = r1
        La:
            if (r0 < 0) goto L22
            java.lang.Object r3 = r8.get(r0)
            v72 r3 = (defpackage.v72) r3
            boolean r4 = r3 instanceof defpackage.ntd
            if (r4 == 0) goto L1f
            ntd r3 = (defpackage.ntd) r3
            s4c r4 = r3.c
            s4c r5 = defpackage.s4c.INDIVIDUALLY
            if (r4 != r5) goto L1f
            r2 = r3
        L1f:
            int r0 = r0 + (-1)
            goto La
        L22:
            if (r2 == 0) goto L27
            r2.d(r7)
        L27:
            int r8 = r9.size()
            int r8 = r8 + (-1)
        L2d:
            java.util.ArrayList r0 = r7.g
            if (r8 < 0) goto L68
            java.lang.Object r3 = r9.get(r8)
            v72 r3 = (defpackage.v72) r3
            boolean r4 = r3 instanceof defpackage.ntd
            if (r4 == 0) goto L53
            r4 = r3
            ntd r4 = (defpackage.ntd) r4
            s4c r5 = r4.c
            s4c r6 = defpackage.s4c.INDIVIDUALLY
            if (r5 != r6) goto L53
            if (r1 == 0) goto L49
            r0.add(r1)
        L49:
            zn0 r0 = new zn0
            r0.<init>(r4)
            r4.d(r7)
            r1 = r0
            goto L65
        L53:
            boolean r0 = r3 instanceof defpackage.l59
            if (r0 == 0) goto L65
            if (r1 != 0) goto L5e
            zn0 r1 = new zn0
            r1.<init>(r2)
        L5e:
            java.util.ArrayList r0 = r1.a
            l59 r3 = (defpackage.l59) r3
            r0.add(r3)
        L65:
            int r8 = r8 + (-1)
            goto L2d
        L68:
            if (r1 == 0) goto L6d
            r0.add(r1)
        L6d:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ao0.b(java.util.List, java.util.List):void");
    }

    @Override // defpackage.qm3
    public final void c(RectF rectF, Matrix matrix, boolean z) {
        t90 t90Var = xn6.a;
        Path path = this.b;
        path.reset();
        int i = 0;
        while (true) {
            ArrayList arrayList = this.g;
            if (i >= arrayList.size()) {
                RectF rectF2 = this.d;
                path.computeBounds(rectF2, false);
                float fI = this.j.i() / 2.0f;
                rectF2.set(rectF2.left - fI, rectF2.top - fI, rectF2.right + fI, rectF2.bottom + fI);
                rectF.set(rectF2);
                rectF.set(rectF.left - 1.0f, rectF.top - 1.0f, rectF.right + 1.0f, rectF.bottom + 1.0f);
                t90 t90Var2 = xn6.a;
                return;
            }
            zn0 zn0Var = (zn0) arrayList.get(i);
            for (int i2 = 0; i2 < zn0Var.a.size(); i2++) {
                path.addPath(((l59) zn0Var.a.get(i2)).h(), matrix);
            }
            i++;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:75:0x01eb  */
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
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void e(android.graphics.Canvas r21, android.graphics.Matrix r22, int r23, defpackage.bn3 r24) {
        /*
            Method dump skipped, instruction units count: 607
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ao0.e(android.graphics.Canvas, android.graphics.Matrix, int, bn3):void");
    }
}
