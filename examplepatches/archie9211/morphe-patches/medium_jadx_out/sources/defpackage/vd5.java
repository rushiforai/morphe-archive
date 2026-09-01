package defpackage;

import android.graphics.Canvas;
import android.widget.EdgeEffect;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vd5 extends b43 implements xl3 {
    public final ep q;
    public final do3 r;
    public final jy8 s;

    public vd5(w4d w4dVar, ep epVar, do3 do3Var, jy8 jy8Var) {
        this.q = epVar;
        this.r = do3Var;
        this.s = jy8Var;
        I0(w4dVar);
    }

    public static boolean L0(float f, long j, EdgeEffect edgeEffect, Canvas canvas) {
        int iSave = canvas.save();
        canvas.rotate(f);
        canvas.translate(Float.intBitsToFloat((int) (j >> 32)), Float.intBitsToFloat((int) (j & 4294967295L)));
        boolean zDraw = edgeEffect.draw(canvas);
        canvas.restoreToCount(iSave);
        return zDraw;
    }

    @Override // defpackage.xl3
    public final void e0(cq6 cq6Var) {
        boolean zL0;
        char c;
        long j;
        g61 g61Var = cq6Var.a;
        long jB = g61Var.b.B();
        ep epVar = this.q;
        epVar.l(jB);
        m50 m50Var = g61Var.b;
        if (dfc.e(m50Var.B())) {
            cq6Var.a();
            return;
        }
        cq6Var.a();
        epVar.d.getValue();
        Canvas canvasA = qm.a(m50Var.x());
        do3 do3Var = this.r;
        boolean zF = do3.f(do3Var.f);
        jy8 jy8Var = this.s;
        if (zF) {
            zL0 = L0(270.0f, (((long) Float.floatToRawIntBits(cq6Var.Z(jy8Var.b(cq6Var.getLayoutDirection())))) & 4294967295L) | (((long) Float.floatToRawIntBits(-Float.intBitsToFloat((int) (cq6Var.f() & 4294967295L)))) << 32), do3Var.c(), canvasA);
        } else {
            zL0 = false;
        }
        if (do3.f(do3Var.d)) {
            c = ' ';
            j = 4294967295L;
            zL0 = L0(0.0f, (((long) Float.floatToRawIntBits(cq6Var.Z(jy8Var.b))) & 4294967295L) | (((long) Float.floatToRawIntBits(0.0f)) << 32), do3Var.e(), canvasA) || zL0;
        } else {
            c = ' ';
            j = 4294967295L;
        }
        if (do3.f(do3Var.g)) {
            zL0 = L0(90.0f, (((long) Float.floatToRawIntBits(cq6Var.Z(jy8Var.c(cq6Var.getLayoutDirection())) + (-((float) nk7.w0(Float.intBitsToFloat((int) (cq6Var.f() >> c))))))) & j) | (((long) Float.floatToRawIntBits(0.0f)) << c), do3Var.d(), canvasA) || zL0;
        }
        if (do3.f(do3Var.e)) {
            EdgeEffect edgeEffectB = do3Var.b();
            zL0 = L0(180.0f, (((long) Float.floatToRawIntBits((-Float.intBitsToFloat((int) (cq6Var.f() & j))) + cq6Var.Z(jy8Var.d))) & j) | (((long) Float.floatToRawIntBits(-Float.intBitsToFloat((int) (cq6Var.f() >> c)))) << c), edgeEffectB, canvasA) || zL0;
        }
        if (zL0) {
            epVar.g();
        }
    }

    @Override // defpackage.xl3
    public final void L() {
    }
}
