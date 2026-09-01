package defpackage;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.Region;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pm implements e61 {
    public Canvas a = qm.a;
    public Rect b;
    public Rect c;

    @Override // defpackage.e61
    public final void a(wp wpVar, uq uqVar) {
        this.a.drawBitmap(u36.g(wpVar), Float.intBitsToFloat(0), Float.intBitsToFloat(0), rx0.P(uqVar));
    }

    @Override // defpackage.e61
    public final void b(float f, float f2) {
        this.a.scale(f, f2);
    }

    @Override // defpackage.e61
    public final void c(float f) {
        this.a.rotate(f);
    }

    @Override // defpackage.e61
    public final void d(float f, long j, uq uqVar) {
        this.a.drawCircle(Float.intBitsToFloat((int) (j >> 32)), Float.intBitsToFloat((int) (j & 4294967295L)), f, rx0.P(uqVar));
    }

    @Override // defpackage.e61
    public final void e(wp wpVar, long j, long j2, long j3, uq uqVar) {
        if (this.b == null) {
            this.b = new Rect();
            this.c = new Rect();
        }
        Canvas canvas = this.a;
        Bitmap bitmapG = u36.g(wpVar);
        Rect rect = this.b;
        rect.getClass();
        int i = (int) (j >> 32);
        rect.left = i;
        int i2 = (int) (j & 4294967295L);
        rect.top = i2;
        rect.right = i + ((int) (j2 >> 32));
        rect.bottom = i2 + ((int) (j2 & 4294967295L));
        Rect rect2 = this.c;
        rect2.getClass();
        rect2.left = 0;
        rect2.top = 0;
        rect2.right = (int) (j3 >> 32);
        rect2.bottom = (int) (j3 & 4294967295L);
        canvas.drawBitmap(bitmapG, rect, rect2, rx0.P(uqVar));
    }

    @Override // defpackage.e61
    public final void f(br brVar, uq uqVar) {
        Canvas canvas = this.a;
        if (brVar instanceof br) {
            canvas.drawPath(brVar.a, rx0.P(uqVar));
        } else {
            ik4.k("Unable to obtain android.graphics.Path");
        }
    }

    @Override // defpackage.e61
    public final void g(float f, float f2, float f3, float f4, float f5, float f6, uq uqVar) {
        this.a.drawRoundRect(f, f2, f3, f4, f5, f6, rx0.P(uqVar));
    }

    @Override // defpackage.e61
    public final void h() {
        this.a.save();
    }

    @Override // defpackage.e61
    public final void i(long j, long j2, uq uqVar) {
        this.a.drawLine(Float.intBitsToFloat((int) (j >> 32)), Float.intBitsToFloat((int) (j & 4294967295L)), Float.intBitsToFloat((int) (j2 >> 32)), Float.intBitsToFloat((int) (j2 & 4294967295L)), rx0.P(uqVar));
    }

    @Override // defpackage.e61
    public final void j(zwa zwaVar, uq uqVar) {
        l(zwaVar.a, zwaVar.b, zwaVar.c, zwaVar.d, uqVar);
    }

    @Override // defpackage.e61
    public final void k() {
        w2g.q(this.a, false);
    }

    @Override // defpackage.e61
    public final void l(float f, float f2, float f3, float f4, uq uqVar) {
        this.a.drawRect(f, f2, f3, f4, rx0.P(uqVar));
    }

    @Override // defpackage.e61
    public final void m(float[] fArr) {
        if (qk7.u(fArr)) {
            return;
        }
        Matrix matrix = new Matrix();
        t40.M(matrix, fArr);
        this.a.concat(matrix);
    }

    @Override // defpackage.e61
    public final void n(br brVar) {
        Canvas canvas = this.a;
        if (brVar instanceof br) {
            canvas.clipPath(brVar.a, Region.Op.INTERSECT);
        } else {
            ik4.k("Unable to obtain android.graphics.Path");
        }
    }

    @Override // defpackage.e61
    public final void o(float f, float f2, float f3, float f4, int i) {
        this.a.clipRect(f, f2, f3, f4, i == 0 ? Region.Op.DIFFERENCE : Region.Op.INTERSECT);
    }

    @Override // defpackage.e61
    public final void p(float f, float f2) {
        this.a.translate(f, f2);
    }

    @Override // defpackage.e61
    public final void q() {
        this.a.restore();
    }

    @Override // defpackage.e61
    public final void r(zwa zwaVar) {
        o(zwaVar.a, zwaVar.b, zwaVar.c, zwaVar.d, 1);
    }

    @Override // defpackage.e61
    public final void s(zwa zwaVar, uq uqVar) {
        this.a.saveLayer(zwaVar.a, zwaVar.b, zwaVar.c, zwaVar.d, rx0.P(uqVar), 31);
    }

    @Override // defpackage.e61
    public final void t() {
        w2g.q(this.a, true);
    }

    @Override // defpackage.e61
    public final void u(float f, float f2, float f3, float f4, float f5, float f6, uq uqVar) {
        this.a.drawArc(f, f2, f3, f4, f5, f6, false, rx0.P(uqVar));
    }
}
