package e0;

import android.graphics.Canvas;
import android.widget.EdgeEffect;
import androidx.compose.ui.node.DelegatingNode;
import kotlin.math.MathKt;
import p1.s2;

/* loaded from: classes2.dex */
public final class o0 extends DelegatingNode implements b3.q {

    /* renamed from: a, reason: collision with root package name */
    public final k f50085a;

    /* renamed from: b, reason: collision with root package name */
    public final k0 f50086b;

    /* renamed from: c, reason: collision with root package name */
    public final k0.o1 f50087c;

    public o0(v2.l0 l0Var, k kVar, k0 k0Var, k0.o1 o1Var) {
        this.f50085a = kVar;
        this.f50086b = k0Var;
        this.f50087c = o1Var;
        delegate(l0Var);
    }

    public static boolean B(float f11, long j11, EdgeEffect edgeEffect, Canvas canvas) {
        int iSave = canvas.save();
        canvas.rotate(f11);
        canvas.translate(Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j11 & 4294967295L)));
        boolean zDraw = edgeEffect.draw(canvas);
        canvas.restoreToCount(iSave);
        return zDraw;
    }

    @Override // b3.q
    public final void draw(k2.c cVar) {
        boolean zB;
        long j11;
        long jMo94getSizeNHjbRc = cVar.mo94getSizeNHjbRc();
        k kVar = this.f50085a;
        kVar.i(jMo94getSizeNHjbRc);
        if (h2.e.e(cVar.mo94getSizeNHjbRc())) {
            cVar.drawContent();
            return;
        }
        cVar.drawContent();
        ((s2) kVar.f50038d).getValue();
        Canvas canvasA = i2.c.a(cVar.getDrawContext().getCanvas());
        k0 k0Var = this.f50086b;
        boolean zF = k0.f(k0Var.f50049f);
        k0.o1 o1Var = this.f50087c;
        if (zF) {
            EdgeEffect edgeEffectC = k0Var.c();
            float f11 = -Float.intBitsToFloat((int) (cVar.mo94getSizeNHjbRc() & 4294967295L));
            zB = B(270.0f, (Float.floatToRawIntBits(cVar.mo102toPx0680j_4(o1Var.b(cVar.getLayoutDirection()))) & 4294967295L) | (Float.floatToRawIntBits(f11) << 32), edgeEffectC, canvasA);
        } else {
            zB = false;
        }
        if (k0.f(k0Var.f50047d)) {
            j11 = 4294967295L;
            zB = B(0.0f, (((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(cVar.mo102toPx0680j_4(o1Var.d()))) & 4294967295L), k0Var.e(), canvasA) || zB;
        } else {
            j11 = 4294967295L;
        }
        if (k0.f(k0Var.f50050g)) {
            zB = B(90.0f, (((long) Float.floatToRawIntBits(cVar.mo102toPx0680j_4(o1Var.c(cVar.getLayoutDirection())) + (-((float) MathKt.b(Float.intBitsToFloat((int) (cVar.mo94getSizeNHjbRc() >> 32))))))) & j11) | (((long) Float.floatToRawIntBits(0.0f)) << 32), k0Var.d(), canvasA) || zB;
        }
        if (k0.f(k0Var.f50048e)) {
            EdgeEffect edgeEffectB = k0Var.b();
            zB = B(180.0f, (((long) Float.floatToRawIntBits(-Float.intBitsToFloat((int) (cVar.mo94getSizeNHjbRc() >> 32)))) << 32) | (((long) Float.floatToRawIntBits((-Float.intBitsToFloat((int) (cVar.mo94getSizeNHjbRc() & j11))) + cVar.mo102toPx0680j_4(o1Var.a()))) & j11), edgeEffectB, canvasA) || zB;
        }
        if (zB) {
            kVar.d();
        }
    }
}
