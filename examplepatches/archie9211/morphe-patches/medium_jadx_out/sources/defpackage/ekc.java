package defpackage;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ekc extends tn0 {
    public final RectF D;
    public final ao6 E;
    public final float[] F;
    public final Path G;
    public final wo6 H;

    public ekc(rc7 rc7Var, wo6 wo6Var) {
        super(rc7Var, wo6Var);
        this.D = new RectF();
        ao6 ao6Var = new ao6();
        this.E = ao6Var;
        this.F = new float[8];
        this.G = new Path();
        this.H = wo6Var;
        ao6Var.setAlpha(0);
        ao6Var.setStyle(Paint.Style.FILL);
        ao6Var.setColor(wo6Var.l);
    }

    @Override // defpackage.tn0, defpackage.qm3
    public final void c(RectF rectF, Matrix matrix, boolean z) {
        super.c(rectF, matrix, z);
        wo6 wo6Var = this.H;
        float f = wo6Var.j;
        float f2 = wo6Var.k;
        RectF rectF2 = this.D;
        rectF2.set(0.0f, 0.0f, f, f2);
        this.n.mapRect(rectF2);
        rectF.set(rectF2);
    }

    @Override // defpackage.tn0
    public final void i(Canvas canvas, Matrix matrix, int i, bn3 bn3Var) {
        wo6 wo6Var = this.H;
        int iAlpha = Color.alpha(wo6Var.l);
        if (iAlpha == 0) {
            return;
        }
        int i2 = wo6Var.l;
        ao6 ao6Var = this.E;
        ao6Var.setColor(i2);
        int iIntValue = (int) ((((iAlpha / 255.0f) * (this.w.p == null ? 100 : ((Integer) r2.d()).intValue())) / 100.0f) * (i / 255.0f) * 255.0f);
        ao6Var.setAlpha(iIntValue);
        if (bn3Var == null || Color.alpha(bn3Var.d) <= 0) {
            ao6Var.clearShadowLayer();
        } else {
            ao6Var.setShadowLayer(Math.max(bn3Var.a, Float.MIN_VALUE), bn3Var.b, bn3Var.c, bn3Var.d);
        }
        if (iIntValue > 0) {
            float[] fArr = this.F;
            fArr[0] = 0.0f;
            fArr[1] = 0.0f;
            float f = wo6Var.j;
            fArr[2] = f;
            fArr[3] = 0.0f;
            fArr[4] = f;
            float f2 = wo6Var.k;
            fArr[5] = f2;
            fArr[6] = 0.0f;
            fArr[7] = f2;
            matrix.mapPoints(fArr);
            Path path = this.G;
            path.reset();
            path.moveTo(fArr[0], fArr[1]);
            path.lineTo(fArr[2], fArr[3]);
            path.lineTo(fArr[4], fArr[5]);
            path.lineTo(fArr[6], fArr[7]);
            path.lineTo(fArr[0], fArr[1]);
            path.close();
            canvas.drawPath(path, ao6Var);
        }
    }
}
